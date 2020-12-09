/******************************************************************************/
/*                                                                            */
/*                      ECAN1 Global Variables Definitions                    */
/*                                                                            */
/******************************************************************************/

/******************************************************************************
 *  rx/tx buffer structure.
 *  These buffers are located in DMA RAM and therefore are not defined as
 *  physical registers among mcu SFRs.
 *
 ******************************************************************************/
typedef
  struct {
    struct {
      IDE :  1;        // Standard/Extended message bit (0-standard; 1-extended)
      SRR :  1;        // Substitute Remote Request bit (0-normal msg; 1-remote transmition rqst)
      SID : 11;        // Standard Identifier bits (SID[10:0])
          :  3;
    } CxTRBnSID;       // CAN SID register
    struct {
      EID17_6 : 12;    // Extended Identifier bits (EID[17:6])
              :  4;
    } CxTRBnEID;       // CAN EID register
    struct {
      DLC    : 4;      // Data Length Code bits (DLC[3:0])
      RB0    : 1;      // Reserved Bit 0 (user must set this bit to '0' per CAN protocol)
             : 3;
      RB1    : 1;      // Reserved Bit 1 (user must set this bit to '0' per CAN protocol)
      RTR    : 1;      // Remote Transmission Request bit (0-normal msg; 1-remote transmition rqst)
      EID5_0 : 6;      // Extended Identifier bits (EID[5:0])
    } CxTRBnDLC;       // CAN DLC register
    struct d{
      char Data[8];    // Data Field Buffer
    } CxTRBnData;      // CAN DATA registers
    struct {
             : 8;
      FILHIT : 5;      // Filter Hit Code bits (only written by module for receive buffers, unused for transmit buffers)
                       // Encodes number of filter that resulted in writing this buffer.
             : 3;
    } CxTRBnSTAT;      // CAN status register
  } __RxTxBuffer;      // CAN rx/tx buffer structure in DMA RAM

/******************************************************************************
 * Set number of rx+tx buffers in DMA RAM
 * Max is 32.
 ******************************************************************************/
#define ECAN1RAMBUFFERSIZE 16      // tx+rx buffers = 16
#define ECAN2RAMBUFFERSIZE 16      // tx+rx buffers = 16

/******************************************************************************
 * The folowing variable is a rx/tx buffer and it must be located in DMA RAM
 * space.
 * The absolute address should be adjusted according to the mcu used,
 * since the DMA RAM is not located at the same addresses for mcus with 8,16
 * and 30kB of RAM.
 ******************************************************************************/
__RxTxBuffer far dma ECAN1RxTxRAMBuffer[ECAN1RAMBUFFERSIZE];

__RxTxBuffer far dma ECAN2RxTxRAMBuffer[ECAN2RAMBUFFERSIZE];