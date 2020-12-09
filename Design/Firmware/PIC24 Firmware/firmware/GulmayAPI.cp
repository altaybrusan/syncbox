#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stddef.h"



typedef int ptrdiff_t;
typedef unsigned int size_t;
typedef unsigned int wchar_t;
#line 17 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef enum {
 JSMN_UNDEFINED = 0,
 JSMN_OBJECT = 1,
 JSMN_ARRAY = 2,
 JSMN_STRING = 3,
 JSMN_PRIMITIVE = 4
} jsmntype_t;

enum jsmnerr {

 JSMN_ERROR_NOMEM = -1,

 JSMN_ERROR_INVAL = -2,

 JSMN_ERROR_PART = -3
};
#line 40 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef struct {
 jsmntype_t type;
 int start;
 int end;
 int size;
#line 48 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
} jsmntok_t;
#line 54 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
typedef struct {
 unsigned int pos;
 unsigned int toknext;
 int toksuper;
} jsmn_parser;
#line 63 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
void jsmn_init(jsmn_parser *parser);
#line 69 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
int jsmn_parse(jsmn_parser *parser, const char *js, size_t len,
 jsmntok_t *tokens, unsigned int num_tokens);
#line 22 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef enum {
 WORKSTATION,
 GENERATOR,
 ACTUATOR,
 COLLIMATOR,
 DETECTOR,
 VENTILATOR,
 ALARM,
 COOLING,
 DISPLAY,
 __DEVICE_TYPES_COUNT = 9
 } DEVICE_TYPE;
#line 41 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef enum {
 NORMAL_FRAME,
 REALTIME_FRAME
 } FRAME_PRIORITY;
#line 50 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef enum{
 UNSTRUCTURED,
 STRUCTURED
 } FRAME_TYPE;
#line 62 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef struct {
 DEVICE_TYPE F_SENDER;
 DEVICE_TYPE F_RECEIVER;
 FRAME_TYPE F_TYPE;
 FRAME_PRIORITY F_PRIORITY;
 char* FRAME_MESSAGE;
 int MESSAGE_LENGTH;
 } KERNEL_FRAME;

 typedef void (*FrameHandler)(KERNEL_FRAME);
 typedef void (*InstrumentStart)();
#line 80 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
 typedef struct {
 DEVICE_TYPE device;
 FrameHandler handler;
 } DEVICE_SLOT;





 void KL_RegisterDevice(DEVICE_SLOT);

 void KL_SendFrame(KERNEL_FRAME*);

 void KL_SendSignal(void*);

 void KL_Read();

 void KL_Bootup();

 void KL_RegisterInstrument(InstrumentStart);
#line 9 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 extern const int MAX_KVP;
 extern const int MIN_KVP;
 extern const int MAX_mAMP;
 extern const int MIN_mAMP;
 extern const int MIN_EXPOSURE_TIME;
 extern const int MAX_EXPOSURE_TIME;

 void ResetGenerator();
 void UpdateKvp(int newValue);
 void UpdateAmp(int newValue);
 void UpdateShootTime(int newValue);
 void StartExposure();
 void StopExposure();
 void SetFineFocalSpotSize();
 void SetBroadFocalSpotSize();
 void StartShortTermWarmup();
 void StartLongTermWarmup();
 void QueryGeneratorMode();
 void QueryExposureParameters();


 void GeneratorProcessKernelFrame(KERNEL_FRAME);
 void QueryWarmupProgram();
 void QueryFocalSpotSize();
 void SetGeneratorInUserMode();
 void SuppressErrorsVoltageAndAmpError();
 void CheckGeneratorErrors();
 void QueryEllapsedExposureTime();
 void SendMessage(char* currentRequest);





 typedef void (*GeneratorMessageEvent)(char*);
 typedef void (*ExposureStopedEvent)();
 typedef void (*KvpUpdatedEvent)(int);
 typedef void (*GeneratorModeEvent)(int);
 typedef void (*AmpUpdatedEvent)(int);
 typedef void (*PassedExposureTimeEvent)(int);
 typedef void (*ShootTimeEvent)(int);
 typedef void (*ExposureStartedEvent)();
 typedef void (*GeneratorErrorEvent)(char*);
 typedef void (*GeneratorWarmupFinishedEvent)();
 typedef void (*GeneratorRequiresShortWarmupEvent)();
 typedef void (*GeneratorRequiresLongWarmupEvent)();
 typedef void (*LargFocalSpotSizeEvent)();
 typedef void (*SmallFocalSpotSizeEvent)();
#line 64 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterMessageListener( GeneratorMessageEvent );
#line 71 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterErrorListener( GeneratorErrorEvent );
#line 78 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterGeneratorModeListener( GeneratorModeEvent );
#line 86 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterFocalspotListeners( LargFocalSpotSizeEvent,
 SmallFocalSpotSizeEvent );
#line 96 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterExposureStateListeners( ExposureStartedEvent,
 PassedExposureTimeEvent,
 ExposureStopedEvent );
#line 107 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterExposureParameterListeners( KvpUpdatedEvent,
 AmpUpdatedEvent,
 ShootTimeEvent );
#line 119 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
 void RegisterWarmupListeners( GeneratorRequiresShortWarmupEvent,
 GeneratorRequiresLongWarmupEvent,
 GeneratorWarmupFinishedEvent );
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/jsmn.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
#line 8 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
const int MAX_KVP = 120;
const int MIN_KVP = 40;
const int MAX_mAMP = 100;
const int MIN_mAMP = 1;
const int MIN_EXPOSURE_TIME = 1;
const int MAX_EXPOSURE_TIME = 100;




GeneratorMessageEvent _messageLst = 0;
ExposureStopedEvent _exposureStopedLst = 0;
KvpUpdatedEvent _kvpValueLst = 0;
GeneratorModeEvent _modeLst = 0;
AmpUpdatedEvent _ampValueLst = 0;
PassedExposureTimeEvent _passedExposureTimeLst = 0;
ShootTimeEvent _shootTimeLst = 0;
ExposureStartedEvent _exposureStartedLst = 0;
GeneratorErrorEvent _errorLst = 0;
GeneratorWarmupFinishedEvent _warmupFinishedLst = 0;
GeneratorRequiresShortWarmupEvent _shortWarmupIsRequiredLst = 0;
GeneratorRequiresLongWarmupEvent _longWarmupIsRequiredLst = 0;
LargFocalSpotSizeEvent _largFocalSpotSizeTriggeredLst = 0;
SmallFocalSpotSizeEvent _smallFocalSpotSizeTriggeredLst = 0;


void RegisterMessageListener(GeneratorMessageEvent messageLst)
{
 _messageLst = messageLst;
}
void RegisterErrorListener(GeneratorErrorEvent errorLst)
{
 _errorLst = errorLst;
}
void RegisterGeneratorModeListener(GeneratorModeEvent modeLst)
{
 _modeLst = modeLst;
}
void RegisterFocalspotListeners(LargFocalSpotSizeEvent largFocalSpotSizeTriggeredLst,
 SmallFocalSpotSizeEvent smallFocalSpotSizeTriggeredLst)
{
 _largFocalSpotSizeTriggeredLst = largFocalSpotSizeTriggeredLst;
 _smallFocalSpotSizeTriggeredLst = smallFocalSpotSizeTriggeredLst;
}
void RegisterExposureStateListeners(ExposureStartedEvent exposureStartedLst,
 PassedExposureTimeEvent ellapsedExposureTimeLst,
 ExposureStopedEvent exposureStopedLst)
{
 _exposureStartedLst = exposureStartedLst;
 _passedExposureTimeLst = ellapsedExposureTimeLst;
 _exposureStopedLst = exposureStopedLst;

}
void RegisterExposureParameterListeners(KvpUpdatedEvent kvpValueLst,
 AmpUpdatedEvent ampValueLst,
 ShootTimeEvent shootTimeLst)
{
 _kvpValueLst = kvpValueLst;
 _ampValueLst = ampValueLst;
 _shootTimeLst = shootTimeLst;
}
void RegisterWarmupListeners(GeneratorRequiresShortWarmupEvent shortWarmupIsRequiredLst,
 GeneratorRequiresLongWarmupEvent longWarmupIsRequiredLst,
 GeneratorWarmupFinishedEvent warmupFinishedLst)
{
 _warmupFinishedLst = warmupFinishedLst;
 _shortWarmupIsRequiredLst = shortWarmupIsRequiredLst;
 _longWarmupIsRequiredLst = longWarmupIsRequiredLst;
}


void CallKernelSendService(char* message, FRAME_TYPE type)
{
 KERNEL_FRAME _frame;
 _frame.F_SENDER = GENERATOR;
 _frame.F_RECEIVER = GENERATOR;
 _frame.F_TYPE = type;
 _frame.FRAME_MESSAGE = message;
 _frame.MESSAGE_LENGTH = 0;

 if (strcmp(message, "?E\r") == 0 ||
 strcmp(message, "?M\r") == 0 ||
 strcmp(message, "?F\r") == 0 ||
 strcmp(message, "?W\r") == 0
 )
 {

 _frame.F_PRIORITY = REALTIME_FRAME;
 }
 else
 {

 _frame.F_PRIORITY = REALTIME_FRAME;
 }

 KL_SendFrame(&_frame);
}
#line 120 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void IntToThreeDigitString(int param, char* destination)
{
 char _buffer[7] = { ' ',' ',' ',' ',' ',' ',' ' };
 IntToStrWithZeros(param, _buffer);
 destination[0] = _buffer[3];
 destination[1] = _buffer[4];
 destination[2] = _buffer[5];
 return;
}
#line 138 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
int StringToInteger(char* str, int index)
{

 static char _temp[4] = { ' ',' ',' ','\0' };
 memset(_temp,' ', 3);

 switch (index) {

 case 1:
 memcpy(_temp, &str[2], 3);
 break;
 case 2:
 memcpy(_temp, &str[6], 3);
 break;
 case 3:
 memcpy(_temp, &str[10], 3);
 break;
 default:
 break;
 }

 if (isdigit(_temp[0]) && isdigit(_temp[1]) && isdigit(_temp[2]))
 return atoi(&_temp[0]);
 else
 return -1;
}


void UpdateKvp(int newValue)
{

 if (MIN_KVP <= newValue && newValue <= MAX_KVP)
 {
 static char _cmd[7], _valueBuffer[3];
 memset(_cmd, ' ', 6);
 memset(_valueBuffer, ' ', 3);
 IntToThreeDigitString(newValue, _valueBuffer);

 memcpy(_cmd, "!V", 2);
 memcpy(&_cmd[2], _valueBuffer, 3);
 _cmd[5] = '\r';
 _cmd[6] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);

 }
}

void UpdateAmp(int newValue)
{
 if (MIN_mAMP <= newValue && newValue <= MAX_mAMP)
 {
 static char _cmd[7], _valueBuffer[3];
 memset(_cmd, ' ', 7);
 memset(_valueBuffer, ' ', 3);
 IntToThreeDigitString(newValue, _valueBuffer);

 memcpy(_cmd, "!I", 2);
 memcpy(&_cmd[2], _valueBuffer, 3);
 _cmd[5] = '\r';
 _cmd[6] = '\0';

 CallKernelSendService(_cmd, UNSTRUCTURED);
 }
}

void UpdateShootTime(int newValue)
{
 if (MIN_EXPOSURE_TIME <= newValue && newValue <= MAX_EXPOSURE_TIME)
 {
 static char _cmd[7], _valueBuffer[3];
 memset(_cmd, ' ', 7);
 memset(_valueBuffer, ' ', 3);
 IntToThreeDigitString(newValue, _valueBuffer);
 memcpy(_cmd, "!T", 2);
 memcpy(&_cmd[2], _valueBuffer, 3);
 _cmd[5] = '\r';
 _cmd[6] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);
 }
}
#line 222 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void StartExposure()
{
 char _cmd[4] = { '!','X','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}
#line 231 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void StopExposure()
{
 char _cmd[4] = { '!','O','\r', '\0' };



 CallKernelSendService(_cmd, UNSTRUCTURED);
}

void SetFineFocalSpotSize()
{
 char _cmd[4] = { '!','F','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}

void SetBroadFocalSpotSize()
{
 char _cmd[4] = { '!','B','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}

void StartShortTermWarmup()
{
 char _cmd[7] = { '!','P','1','0','0','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);

 memset(_cmd, ' ', 7);
 memcpy(_cmd, "!X\r", 3);
 _cmd[4] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);
 return;
}

void StartLongTermWarmup()
{
 char _cmd[7] = { '!','P','1','0','1','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);

 memset(_cmd, ' ', 6);
 memcpy(_cmd, "!X\r", 3);
 _cmd[4] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);
}
#line 287 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void QueryGeneratorMode()
{
 char _modecmd[4] = { '?','M','\r','\0' };
 CallKernelSendService(_modecmd, UNSTRUCTURED);
}
#line 297 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void QueryExposureParameters()
{
 char _cmd[4] = { '?','X','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}
#line 306 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void GeneratorProcessKernelFrame(KERNEL_FRAME frame)
{





 if (strchr(frame.FRAME_MESSAGE, 'M'))
 {

 int _mod = 0;
 _mod = StringToInteger(frame.FRAME_MESSAGE, 1);

 if (_modeLst != 0 && _mod != -1)
 {

 _modeLst(_mod);
 }
 }

 if (strstr(frame.FRAME_MESSAGE, "!O"))
 {

 if (_exposureStopedLst != 0)
 {

 _exposureStopedLst();
 }
 return;
 }

 if (strchr(frame.FRAME_MESSAGE, 'V'))
 {
 int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
 if (_kvpValueLst != 0 && _val != -1)
 {

 _kvpValueLst(_val);
 }
 }

 if (strchr(frame.FRAME_MESSAGE, 'I'))
 {
 int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
 if (_ampValueLst != 0 && _val != -1)
 {

 _ampValueLst(_val);
 }
 }
 if (strstr(frame.FRAME_MESSAGE, "?T"))
 {
 int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
 if (_passedExposureTimeLst != 0 && _val != -1)
 {

 _passedExposureTimeLst(_val);
 }
 }
 if (strstr(frame.FRAME_MESSAGE, "!T"))
 {
 int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
 if (_shootTimeLst != 0 && _val != -1)
 {

 _shootTimeLst(_val);
 }
 }
 if (strstr(frame.FRAME_MESSAGE, "!X"))
 {
 if (_exposureStartedLst != 0)
 {

 _exposureStartedLst();
 }
 return;
 }

 if (strchr(frame.FRAME_MESSAGE, 'E'))
 {
 if (strcmp(frame.FRAME_MESSAGE, "?E") == 0)
 {

 }
 else
 {


 }

 if (_errorLst != 0)
 {

 _errorLst(frame.FRAME_MESSAGE);
 }

 }
 if (strstr(frame.FRAME_MESSAGE, "?X"))
 {

 int _KVP = StringToInteger(frame.FRAME_MESSAGE, 1);
 int _mA = StringToInteger(frame.FRAME_MESSAGE, 2);
 int _Time = StringToInteger(frame.FRAME_MESSAGE, 3);

 if (_kvpValueLst != 0 && _KVP != -1)
 {

 _kvpValueLst(_KVP);
 }
 if (_ampValueLst != 0 && _mA != -1)
 {

 _ampValueLst(_mA);
 }
 if (_shootTimeLst != 0 && _Time != -1)
 {

 _shootTimeLst(_Time);
 }
 return;
 }
 if (strstr(frame.FRAME_MESSAGE, "?W"))
 {

 int _result = StringToInteger(frame.FRAME_MESSAGE, 1);

 switch (_result)
 {
 case 0:
 if (_warmupFinishedLst != 0 && _result != -1)
 {

 _warmupFinishedLst();
 }
 break;
 case 100:
 if (_shortWarmupIsRequiredLst != 0 && _result != -1)
 {

 _shortWarmupIsRequiredLst();
 }
 break;
 case 101:
 if (_longWarmupIsRequiredLst != 0 && _result != -1)
 {

 _longWarmupIsRequiredLst();
 }
 break;
 }
 }
 if (strstr(frame.FRAME_MESSAGE, "?FB"))
 {
 if (_largFocalSpotSizeTriggeredLst != 0)
 {

 _largFocalSpotSizeTriggeredLst();
 }
 return;
 }
 if (strstr(frame.FRAME_MESSAGE, "?FF"))
 {
 if (_SmallFocalSpotSizeTriggeredLst != 0)
 {

 _SmallFocalSpotSizeTriggeredLst();
 }

 }

 return;
}
#line 488 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void QueryWarmupProgram()
{
 char _cmd[4] = { '?','W','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}

void QueryFocalSpotSize()
{
 char _cmd[4] = { '?','F','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}
#line 506 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void SetGeneratorInUserMode()
{
 char _cmd[7] = { '!','P','0','0','2','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}

void SuppressErrorsVoltageAndAmpError()
{

 char _cmd[11] = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ' };
 memcpy(_cmd, "!P902\r", 6);
 _cmd[7] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);


 memset(_cmd, ' ', 11);
 memcpy(_cmd, "!P978,3,5\r", 10);
 _cmd[11] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);


 memset(_cmd, ' ', 11);
 memcpy(_cmd, "?P888\r", 6);
 CallKernelSendService(_cmd, UNSTRUCTURED);


 memset(_cmd, ' ', 11);
 memcpy(_cmd, "?P978\r", 6);
 _cmd[7] = '\0';
 CallKernelSendService(_cmd, UNSTRUCTURED);
}
#line 542 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void CheckGeneratorErrors()
{
 char _cmd[4] = { '?','E','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}
#line 551 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/GulmayAPI.c"
void QueryEllapsedExposureTime()
{
 char _cmd[4] = { '?','T','\r','\0' };
 CallKernelSendService(_cmd, UNSTRUCTURED);
}

void ResetGenerator()
{

 CheckGeneratorErrors();
 Delay_ms(20);


 StopExposure();
 Delay_ms(20);








 QueryExposureParameters();
 Delay_ms(20);


 QueryFocalSpotSize();
 Delay_ms(20);


 QueryGeneratorMode();
 Delay_ms(20);


 QueryWarmupProgram();
 Delay_ms(20);
}
