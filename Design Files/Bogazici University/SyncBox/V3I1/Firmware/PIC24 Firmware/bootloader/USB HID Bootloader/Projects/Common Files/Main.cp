#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/bootloader/USB HID Bootloader/Projects/Common Files/Main.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/bootloader/usb hid bootloader/projects/mikromedia for pic24ep - p24ep256gu810/config.h"
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
#line 75 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/bootloader/USB HID Bootloader/Projects/Common Files/Main.c"
void main(void) {
 Config();


 PLLFBD = 70;
 CLKDIV = 0x0000;



 ACLKCON3 = 0xB4C1;
 ACLKDIV3 = 0x0007;


 HID_Enable(&HidReadBuff, &HidWriteBuff);



 if (!EnterBootloaderMode()) {
 HID_Disable();
 Delay_10ms();

 StartProgram();
 }
 else
 StartBootloader();
}
