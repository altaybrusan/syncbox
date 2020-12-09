/******************************************************************************
 *                                                                            *
 *  Unit:         UHB_Driver.c                                                *
 *                                                                            *
 *  Copyright:    (c) Mikroelektronika, 2011.                                 *
 *                                                                            *
 *  Description:  mikroE USB HID Bootloader (UHB) protocol implementation.    *
 *                                                                            *
 *  Requirements: - Minor modifications can make this code can work with any  *
 *                  MCU which has internal USB module and Flash self write    *
 *                  capabilities.                                             *
 *                - Bootloader code does not implement USB and Flash handling *
 *                  code (drivers). They are properties of mikroC compiler.   *
 *                - MikroE 'USB HID Bootloader Tool' PC application.          *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/

/* Protocol Description.

  UHB protocol is a typical master-slave communication protocol, where
  master (PC) sends commands and slave (bootloader equiped device) executes
  them and aknowledges execution.

  * Command format.
    
    <STX[0]><CMD_CODE[0]><ADDRESS[0..3]><COUNT[0..1]> <DATA[0..COUNT-1]>
    |-- 1 --|---- 1 -----|------ 4 -----|----- 2 ----|------ COUNT -----|

    STX      - Command start delimiter (for future upgrades).
               Length: 1 byte. Mandatory.
    CMD_CODE - Command index (TCmd).
               Length: 1 byte. Mandatory.
    ADDRESS  - Address field. Flash start address for
               CMD_CODE command operation.
               Length: 4 bytes. Optional (command specific).
    COUNT    - Count field. Amount of data/blocks for
               CMD_CODE command operation.
               Length: 2 bytes. Optional (command specific).
    DATA     - Data array.
               Length: COUNT bytes. Optional (command specific).

   Some commands do not utilize all of these fields.
   See 'Command Table' below for details on specific command's format.

  * Command Table.
   --------------------------+---------------------------------------------------
  |       Description        |                      Format                       |
  |--------------------------+---------------------------------------------------|
  | Synchronize with PC tool |                  <STX><cmdSYNC>                   |
  |--------------------------+---------------------------------------------------|
  | Send bootloader info     |                  <STX><cmdINFO>                   |
  |--------------------------+---------------------------------------------------|
  | Go to bootloader mode    |                  <STX><cmdBOOT>                   |
  |--------------------------+---------------------------------------------------|
  | Restart MCU              |                  <STX><cmdREBOOT>                 |
  |--------------------------+---------------------------------------------------|
  | Write to MCU flash       | <STX><cmdWRITE><START_ADDR><DATA_LEN><DATA_ARRAY> |
  |--------------------------+---------------------------------------------------|
  | Erase MCU flash.         |  <STX><cmdERASE><START_ADDR><ERASE_BLOCK_COUNT>   |
   ------------------------------------------------------------------------------ 

   For write command, data bytes are sent in subsequent usb packets 
   (not in the same packet as command bytes).
   Maximum number of data per one write command is limited to 32kB.
   
  * Acknowledge format.
   
    <STX[0]><CMD_CODE[0]>
    |-- 1 --|---- 1 -----|
   
    STX      - Response start delimiter (for future upgrades).
               Length: 1 byte. Mandatory.
    CMD_CODE - Index of command (TCmd) we want to acknowledge.
               Length: 1 byte. Mandatory.

   See 'Acknowledgement Table' below for details on specific command's 
   acknowledgement process.
  
  * Acknowledgement Table.
   --------------------------+---------------------------------------------------
  |       Description        |                   Acknowledgement                 |
  |--------------------------+---------------------------------------------------|
  | Synchronize with PC tool |                  upon reception                   |
  |--------------------------+---------------------------------------------------|
  | Send bootloader info     |          no acknowledge, just send info           |
  |--------------------------+---------------------------------------------------|
  | Go to bootloader mode    |                  upon reception                   |
  |--------------------------+---------------------------------------------------|
  | Restart MCU              |                  no acknowledge                   |
  |--------------------------+---------------------------------------------------|
  | Write to MCU flash       |         upon write of received data to flash      |
  |--------------------------+---------------------------------------------------|
  | Erase MCU flash.         |                  upon execution                   |
   ------------------------------------------------------------------------------

  * Boot info record
   --------------------------+---------------------------------------------------
  |       Field              |                   Description                     |
  |--------------------------+---------------------------------------------------|
  | char bSize               |                  boot record size                 |
  |--------------------------+---------------------------------------------------|
  | TCharField   bMcuType    |          mcu type (use TMcuType enum constants)   |
  |--------------------------+---------------------------------------------------|
  | TULongField  ulMcuSize   |                  mcu flash size                   |
  |--------------------------+---------------------------------------------------|
  | TUIntField   uiEraseBlock|              flash erase block size               |
  |--------------------------+---------------------------------------------------|
  | TUIntField   uiWriteBlock|              flash write block size               |
  |--------------------------+---------------------------------------------------|
  | TUIntField   uiBootRev   |            bootloader firmware version            |
  |------------------------------------------------------------------------------|
  | TULongField  ulBootStart |           bootloader code start address           |
  |------------------------------------------------------------------------------|
  | TStringField sDevDsc     |                device name string                    |
   ------------------------------------------------------------------------------

   bSize must be first filed within the boot record.
   Order of other fields in the boot record is irrelevant, because each field 
   has it's ID.
 
   For all relevant type definitions refer to 'Types.h' file 
   located in 'Common Files' folder.
*/
   
#include <Types.h>
#include <Config.h>
#include <built_in.h>

const STX = 0x0F;                // Start of TeXt.
const ETX = 0x04;                // End of TeXt.
const DLE = 0x05;                // Data Link Escape.

int GPCounter = 0;               // Global Purpose Counter, used for counting anything that needs to be counted :)
int BytesToWrite  at GPCounter;  // Number of bytes PC application is sending for current write operation.
int BytesToGet    at GPCounter;  // Number of bytes we need to acquire from PC for current command.
int BlocksToErase at GPCounter;  // Number of blocks to erase in current erase operation.

unsigned long GPAddress = 0;     // Global Purpose Counter, used for addressing anything that needs to be addressed :)
unsigned long StartAddress at GPAddress; // Start address for current PC command.

// I/O Buffer
struct {
  char fBuffer[_FLASH_ERASE];    // Buffer data.
  char *fRWPtr;                  // Buffer read/write pointer.

  // Buffer's methods.
  #define Buffer_WriteByte(data)    *Buffer.fRWPtr++ = data               // Write a byte into buffer.
  #define Buffer_ReadByte()         *Buffer.fRWPtr++                      // Read a byte from buffer.
  #define Buffer_ReadByteAt(offset) *Buffer.fBuffer[offset]               // Read a byte from specific buffer location.
  #define Buffer_Seek(offset)       Buffer.fRWPtr = Buffer.fBuffer+offset // Set buffer poiner at specific buffer location.
  #define Buffer_Count()            Buffer.fRWPtr-Buffer.fBuffer          // Number of bytes in buffer.
  #define Buffer_Reset()            Buffer.fRWPtr = Buffer.fBuffer        // Set buffer poiner at buffer start.
  #define Buffer_Size()             sizeof(Buffer.fBuffer)                // Buffer's size in bytes.

  #define Buffer_SaveToFlash() _Buffer_SaveToFlash()                      // Write buffer content to flash memory at specified address.
} Buffer;

enum TCmd CmdCode = cmdNON;      // Current command code.

#ifdef __MIKROC_PRO_FOR_ARM__
unsigned long arm_boot_sp;       // Bootloader stack pointer.
#endif

/******************************************************************************
 *                                                                            *
 *  Function:     static void _Buffer_SaveToFlash()                           *
 *                                                                            *
 *  Description:  Write data buffer to internal MCU flash.                    *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: StartAddress must contain flash address where this write    *
 *                should occur.                                               *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
static void _Buffer_SaveToFlash() {
  int bCount;                                     // Byte counter.
  
  #ifdef __MIKROC_PRO_FOR_ARM__
  if (StartAddress == 0)
    *(unsigned long *)Buffer.fBuffer = arm_boot_sp; // Insert bootloader stack pointer.
  #endif

  bCount = Buffer_Count();                        // Get number of bytes in buffer.
  Buffer.fRWPtr = Buffer.fBuffer;                 // Reset buffer pointer.
  while (bCount > 0) {
    FLASH_Write(StartAddress, Buffer.fRWPtr);     // Write chunk (flash write latch size) of buffer data.
    bCount -= _FLASH_WRITE_LATCH;                 // Decrement bytes count.
    Buffer.fRWPtr += _FLASH_WRITE_LATCH;          // Increment buffer pointer.
    #ifdef __MIKROC_PRO_FOR_DSPIC__
    StartAddress += (_FLASH_WRITE_LATCH / 3) * 2; // Increment flash address.
    #else
    StartAddress += _FLASH_WRITE_LATCH;           // Increment flash address.
    #endif
  }
}

/******************************************************************************
 *                                                                            *
 *  Function:     static void SendBootInfo()                                  *
 *                                                                            *
 *  Description:  Send bootloader info record.                                *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: Bootloader info record (BootInfo) must be loaded with       *
 *                appropriate values.                                         *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
static void SendBootInfo() {
  typedef struct {
    char fArray[sizeof(TBootInfo)];
  } TBootInfoArray; // structure with an array type to handle copying.

  // Note: Additional handling needs to be taken if boot info record's size
  // exceeds HidWriteBuff size (64 bytes).
  *(TBootInfoArray *)(void *)HidWriteBuff = BootInfo; // Copy boot info record into transmit buffer.
  HID_Write(HidWriteBuff, 64);                        // Send boot info.
}

/******************************************************************************
 *                                                                            *
 *  Function:     static void Check4Cmd()                                     *
 *                                                                            *
 *  Description:  Check received USB HID packet for new command.              *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: USB HID read buffer (HidReadBuff) must not be empty.        *
 *                Use HID_Read() first, to check if packet was received.      *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
static void Check4Cmd() {
  if (CmdCode == cmdNON) {               // Are we in 'Idle' mode?
                                         //   New commands only in 'Idle' mode!
    if (HidReadBuff[0] != STX)           // Do we have an 'STX' at start?
                                         //   Each command must start with STX char.
      return ;                           // No, then exit.

    // Process received command.
    CmdCode = HidReadBuff[1];            // Get command code.
    Lo(GPAddress) = HidReadBuff[2];      // Get address lo byte.
    Hi(GPAddress) = HidReadBuff[3];      // Get address hi byte.
    Higher(GPAddress) = HidReadBuff[4];  // Get address higher byte.
    Highest(GPAddress) = HidReadBuff[5]; // Get address highest byte.
    Lo(GPCounter) = HidReadBuff[6];      // Get counter lo byte.
    Hi(GPCounter) = HidReadBuff[7];      // Get counter hi byte.
  }
  else {
    // maybe abort cmd...
  }
}

/******************************************************************************
 *                                                                            *
 *  Function:     static char GetData()                                       *
 *                                                                            *
 *  Description:  Get data from received USB HID packet.                      *
 *                Data are copied to data buffer.                             *
 *                Should be used within commands where we expect PC to send   *
 *                us some data (i.e. Flash Write command).                    *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: - USB HID read buffer (HidReadBuff) must not be empty.      *
 *                  Use HID_Read() first, to check if packet was received.    *
 *                - BytesToGet counter must contain number of bytes we        *
 *                  expect to receive.                                        *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
static char GetData() {
  char i;                                // HID read buffer byte counter.
  char *sPtr;                            // Local byte pointer.

  // Process received USB packet.
  sPtr = HidReadBuff;                    // Set local pointer to HID read buffer.
  i = 0;                                 // Clear HID read buffer byte counter.
  while (1) {
    if (!BytesToGet)                     // Did we get it all?
      return 1;                          //   Yes, return with all done.
    if (Buffer_Count() == Buffer_Size()) // Is data buffer full?
      return 1;                          //   Yes, return with buffer full.
    if (i == sizeof(HidReadBuff))        // End of received packet?
      return 0;                          //   Yes, return with more to get.
    Buffer_WriteByte(*sPtr++);           // Copy to buffer.
    BytesToGet--;                        // Decrement data buffer counter.
    i++;                                 // Increment HID read buffer byte counter
  }
  return 0;                              // Return with more to get.
}

/******************************************************************************
 *                                                                            *
 *  Function:     static void SendACK(enum TCmd cmd)                          *
 *                                                                            *
 *  Description:  Acknowledge command or part of command.                     *
 *                                                                            *
 *  Parameters:   - cmd: command code.                                        *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: None.                                                       *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
static void SendACK(enum TCmd cmd) {
  // Make acknowledgement packet.
  HidWriteBuff[0] = STX;       // Start of packet indetifier.
  HidWriteBuff[1] = cmd;       // Command code to acknowledge.
  HID_Write(HidWriteBuff, 64); // Send acknowledgement packet.
}

/******************************************************************************
 *                                                                            *
 *  Function:     void StartBootloader()                                      *
 *                                                                            *
 *  Description:  Enter bootloader mode and start bootloader stack execution. *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: None.                                                       *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
void StartBootloader() {
  char dataRx;           // Packet reception flag.
  char writeData = 0;    // Write command execution flag.

  #ifdef __MIKROC_PRO_FOR_ARM__
  arm_boot_sp = *(unsigned long*)0; // Save bootloader stack pointer.
  #endif

  Buffer_Reset();        // Reset data buffer.
  
  // Bootloader loop.
  while(1) {
    USB_Polling_Proc();  // Check USB.
    dataRx = HID_Read(); // Read received USB packet, if any.
    if (dataRx) {        // Do we have an incoming?
      dataRx = 0;        //   Yes, clear reception flag.
      Check4Cmd();       // Check received packet for new command.
      switch(CmdCode) {  // Process command.
        case cmdWRITE: { // Cmd: Write data to flash.
                        if (writeData) {   // Are we already executing an write command?
                          if (GetData()) { // Yes, then do we have some data to write?
                            #ifdef __MIKROC_PRO_FOR_PIC32__
                            if ((StartAddress < BOOTLOADER_START_PHY) ||
                                ((StartAddress >= MCU_BOOT_FLASH_START_PHY) &&
                                 (StartAddress <  MCU_BOOT_FLASH_CONFIG_BLOCK_START_PHY))) // Are we out of bootloader area?
                            #else
                            if (StartAddress < BOOTLOADER_START) // Are we out of bootloader area?
                            #endif
                              Buffer_SaveToFlash();              //   Yes, write data buffer to flash.
                            SendACK(CmdCode);                    // Acknowledge data write and ask for more if any.
                            Buffer_Reset();                      // Reset data buffer.
                            if (BytesToWrite == 0) {             // Are there more data to write?
                              writeData = 0;                     //   No, reset executing write command flag.
                              CmdCode = cmdNON;                  //   Set 'Idle' command code.
                            }
                          }
                        }
                        else {
                          writeData = 1; // Set executing write command flag.
                        }
                        break;
                       }
        case cmdERASE: { // Cmd: Erase flash.
                        while (BlocksToErase--) {                   // More to erase?
                          #ifdef __MIKROC_PRO_FOR_PIC32__
                          if ((StartAddress < BOOTLOADER_START_PHY) ||
                              ((StartAddress >= MCU_BOOT_FLASH_START_PHY) &&
                               (StartAddress <  MCU_BOOT_FLASH_CONFIG_BLOCK_START_PHY))) // Are we out of bootloader area?
                          #else
                          if (StartAddress < BOOTLOADER_START)      // Are we out of bootloader area?
                          #endif
                            FLASH_Erase(StartAddress);              //   Yes, erase flash block.
                          #ifdef __MIKROC_PRO_FOR_DSPIC__
                          StartAddress -= (_FLASH_ERASE / 3) * 2; //   Increment flash address.
                          #else
                          #ifdef STM32F_2XX_4XX
                          if (FLASH_AddressToSector(StartAddress-1) >= 0)
                            StartAddress -= FLASH_SectorSize(FLASH_AddressToSector(StartAddress-1));
                          #else
                          StartAddress -= _FLASH_ERASE;           //   Increment flash address.
                          #endif
                          #endif
                        }
                        SendACK(CmdCode);                           // Acknowledge flash erase command.
                        CmdCode = cmdNON;                           // Set 'Idle' command code.
                        break;
                       }
        case cmdSYNC: { // Cmd: Synchronize bootloader and PC app.
                       SendACK(CmdCode); // Acknowledge SYNC command.
                       CmdCode = cmdNON; // Set 'Idle' command code.
                       break;
                      }
        case cmdREBOOT: { // Cmd: Reboot the MCU.
                         #ifdef __MIKROC_PRO_FOR_PIC__
                         asm RESET; // Reset MCU.
                         #endif
                         #ifdef __MIKROC_PRO_FOR_DSPIC__
                         asm RESET; // Reset MCU.
                         #endif
                         #ifdef __MIKROC_PRO_FOR_PIC32__
                         Reset();   // Reset MCU.
                         #endif
                         #ifdef __MIKROC_PRO_FOR_ARM__
                         SystemReset();   // Reset MCU.
                         #endif
                         CmdCode = cmdNON; // Set 'Idle' command code.
                         break;
                        }
      }
    }
  }
}

/******************************************************************************
 *                                                                            *
 *  Function:     char EnterBootloaderMode()                                  *
 *                                                                            *
 *  Description:  Device mode checker.                                        *
 *                Wait 5sec for PC to send boot request.                      *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: 1 - we have boot request.                                   *
 *                    Continue with bootloader mode.                          *
 *                0 - no boot request.                                        *
 *                    Continue with already loaded application code.          *
 *                                                                            *
 *  Requirements: None.                                                       *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
char EnterBootloaderMode() {
char dataRx;             // Packet reception flag.
unsigned timer = 5000;   // 5sec timer = 5000 * 1ms.

  // Check for bootloader request loop.
  while (1) {
    USB_Polling_Proc();  // Check USB.
    dataRx = HID_Read(); // Read received USB packet, if any.
    if (dataRx) {        // Do we have an incoming?
      dataRx = 0;        //   Yes, clear reception flag.
      Check4Cmd();       // Check received packet for new command.
      switch (cmdCode) { // Process command.
        case cmdBOOT: {  // Cmd: Enter bootloader mode.
                        SendACK(CmdCode);   // Acknowledge enter bootloader mode command.
                        CmdCode = cmdNON;   // Set 'Idle' command code.
                        Delay_10ms();
                        return 1;           // Return with do bootloader code.
                      }
         case cmdINFO: { // Cmd: Get bootloader info.
                          SendBootInfo();   // Send bootloader info record.
                          CmdCode = cmdNON; // Set 'Idle' command code.
                          break;
                        }
      }
    }
    // make 1ms for 5sec delay
    Delay_1ms();
    if (!(timer--)) // Do we have a timeout?
      return 0;     //   Yes, return with do application code.
  }
}

/******************************************************************************
 *                                                                            *
 *  Function:     void StartProgram()                                         *
 *                                                                            *
 *  Description:  Application reset vector holder.                            *
 *                                                                            *
 *  Parameters:   None.                                                       *
 *                                                                            *
 *  Return Value: None.                                                       *
 *                                                                            *
 *  Requirements: - Size of this routine must be equal to MCU reset           *
 *                  vector size.                                              *
 *                - Must be placed at                                         *
 *                  BOOTLOADER_START-RESET_VECTOR_SIZE address.               *
 *                                                                            *
 *  Notes:        None.                                                       *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
void StartProgram() {
  // nops to accomodate MCU reset vector size.
  asm nop;
  #ifdef __MIKROC_PRO_FOR_PIC32__
  asm nop;
  #endif
  #ifdef __MIKROC_PRO_FOR_ARM__
  asm nop;
  asm nop;
  asm nop;
  asm nop;
  asm nop;
  asm nop;
  asm nop;
  asm nop;
  #endif
}