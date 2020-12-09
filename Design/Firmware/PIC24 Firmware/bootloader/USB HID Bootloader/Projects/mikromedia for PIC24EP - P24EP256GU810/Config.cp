#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/bootloader/USB HID Bootloader/Projects/mikromedia for PIC24EP - P24EP256GU810/Config.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/common files/main.h"
#line 19 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/common files/main.h"
void main(void);
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/common files/types.h"
#line 20 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/common files/types.h"
enum TMcuType {mtPIC16 = 1, mtPIC18, mtPIC18FJ, mtPIC24,
 mtDSPIC = 10, mtDSPIC33,
 mtPIC32 = 20,
 mtARM = 30,
 mtSTELLARIS_M3 = 31,
 mtSTELLARIS_M4 = 32,
 mtSTELLARIS = 33,
 mtSTM32L1XX = 34,
 mtSTM32F1XX = 35,
 mtSTM32F2XX = 36,
 mtSTM32F4XX = 37,
 mtTIVA_C = 38,
 mtFT90x = 40};


enum TBootInfoField {bifMCUTYPE=1,
 bifMCUID,
 bifERASEBLOCK,
 bifWRITEBLOCK,
 bifBOOTREV,
 bifBOOTSTART,
 bifDEVDSC,
 bifMCUSIZE
 };


enum TCmd {cmdNON=0,
 cmdSYNC,
 cmdINFO,
 cmdBOOT,
 cmdREBOOT,
 cmdWRITE=11,
 cmdERASE=21};




typedef struct {
 char fFieldType;
 char fValue;
} TCharField;


typedef struct {
 char fFieldType;
 union {
 unsigned int intVal;
 struct {
 char bLo;
 char bHi;
 };
 } fValue;
} TUIntField;


typedef struct {
 char fFieldType;
 unsigned long fValue;
} TULongField;



typedef struct {
 char fFieldType;
 char fValue[ 22 ];
} TStringField;


typedef struct {
 char bSize;
 TCharField bMcuType;
 TULongField ulMcuSize;
 TUIntField uiEraseBlock;
 TUIntField uiWriteBlock;
 TUIntField uiBootRev;
 TULongField ulBootStart;
 TStringField sDevDsc;
} TBootInfo;
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/mikromedia for pic24ep - p24ep256gu810/config.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/common files/types.h"
#line 29 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/mikromedia for pic24ep - p24ep256gu810/config.h"
extern const unsigned long BOOTLOADER_SIZE;
extern const unsigned long BOOTLOADER_START;
extern const unsigned char RESET_VECTOR_SIZE;

extern const TBootInfo BootInfo;


extern unsigned char HidReadBuff[64];
extern unsigned char HidWriteBuff[64];
#line 50 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/mikromedia for pic24ep - p24ep256gu810/config.h"
void Config();
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/driver/uhb_driver.h"
#line 19 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/driver/uhb_driver.h"
void StartProgram();
void StartBootloader();
char EnterBootloaderMode();
#line 38 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/bootloader/USB HID Bootloader/Projects/mikromedia for PIC24EP - P24EP256GU810/Config.c"
const enum TMcuType MCU_TYPE = mtPIC24;






const unsigned long BOOTLOADER_SIZE = 5779;








const unsigned int BOOTLOADER_REVISION = 0x1300;


const unsigned long BOOTLOADER_START = ((((__FLASH_SIZE/3)*2)-BOOTLOADER_SIZE)/(( 1024*3 /3)*2))*(( 1024*3 /3)*2);
const unsigned char RESET_VECTOR_SIZE = 4;




const TBootInfo BootInfo = { sizeof(TBootInfo),
 {bifMCUTYPE, MCU_TYPE},
 {bifMCUSIZE, __FLASH_SIZE},
 {bifERASEBLOCK,  1024*3 },
 {bifWRITEBLOCK,  128*3 },
 {bifBOOTREV, BOOTLOADER_REVISION},
 {bifBOOTSTART, BOOTLOADER_START},
 {bifDEVDSC,  "mikromedia" }
 };




unsigned char HidReadBuff[64];
unsigned char HidWriteBuff[64];
#line 131 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/bootloader/USB HID Bootloader/Projects/mikromedia for PIC24EP - P24EP256GU810/Config.c"
void Config() {
  ; OrgAll(BOOTLOADER_START-RESET_VECTOR_SIZE); FuncOrg(main, BOOTLOADER_START); FuncOrg(StartProgram, BOOTLOADER_START-RESET_VECTOR_SIZE); ;



 PLLFBD = 70;
 CLKDIV = 0x0000;



 ACLKCON3 = 0xB4C1;
 ACLKDIV3 = 0x0007;
}
