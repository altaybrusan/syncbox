#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/StoneAPI.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
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
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
#line 13 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
void DisplayProcessKernelFrame(KERNEL_FRAME);

void InitDisplay();

void ShowMainMenue();

void InitParameterBoard();
#line 26 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
void SetKvpBoundaries(int minkvp,int maxkvp);
#line 33 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
void SetmABoundaries(int minmA,int maxmA);
#line 40 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
void SetTimeBoundaries(int minTime,int maxTime);
#line 47 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
void SetJogBoundaries(int minJog,int maxJog);


void SetKvpStepSize(int step);

void SetmAStepSize(int step);

void SetTimeStepSize(int step);

void SetJogStepSize(int step);


void DisplayAutomaticModeWarmingupState();

void DisplayAutomaticModePendingState();

void DisplayAutomaticModeWorkingState();

void DisplayAutomaticModeErrorState();


void DisplayServiceModeWarmingupState();

void DisplayServiceModeWarmupErrorState();

void DisplayServiceModePendingState();

void DisplayServiceModeWorkingState();

void DisplayServiceModeErrorState();





 typedef void (*StartAutomaticModeSessionEvent)();
 typedef void (*GotoHomeEvent)();
 typedef void (*StartExposureEvent)();
 typedef void (*StopExposureEvent)();
 typedef void (*StartWarmupEvent)();
 typedef void (*UpdateKvpEvent)(int kvp);
 typedef void (*UpdatemAEvent)(int mA);
 typedef void (*UpdateTimeEvent)(int time);
 typedef void (*UpdateJOGEvent)(int jog);
#line 98 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterStartAutomaticModeSessionListener(StartAutomaticModeSessionEvent);
#line 105 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterGotoHomeListener(GotoHomeEvent);
#line 112 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterStartExposureListener(StartExposureEvent);
#line 119 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterStopExposureListener(StopExposureEvent);
#line 126 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterStartWarmupEventListener(StartWarmupEvent);
#line 133 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterUpdateKvpEventListener(UpdateKvpEvent);
#line 140 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterUpdatemAEventListener(UpdatemAEvent);
#line 147 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterUpdateTimeEventListener(UpdateTimeEvent);
#line 154 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/stoneapi.h"
 void RegisterUpdateJOGEventListener(UpdateJOGEvent);
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/gulmayapi.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/kernel.h"
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
#line 10 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/StoneAPI.c"
int MIN_KVP_VAL = 30;
int MAX_KVP_VAL = 120;
int KVP_STP = 5;

int MIN_mA = 1;
int MAX_mA = 50;
int mA_STP = 5;

int MIN_TIME = 1;
int MAX_TIME = 999;
int TIME_STP = 1;

int MIN_JOG = 100;
int MAX_JOG = 800;
int JOG_STP = 25;



StartAutomaticModeSessionEvent _automaticModeLst = 0;
GotoHomeEvent _gotoHomeLst = 0;
StartExposureEvent _startExposureLst = 0;
StopExposureEvent _stopExposureLst = 0;
StartWarmupEvent _startwarmupLst = 0;
UpdateKvpEvent _updateKvpLst = 0;
UpdatemAEvent _updatemALst = 0;
UpdateTimeEvent _updateTimeLst = 0;
UpdateJOGEvent _updateJogLst = 0;
#line 51 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/StoneAPI.c"
unsigned char selectPicture[8] = { 0xAA,0x70,
 0x00,0x00,
 0xCC,0x33,0xC3,0x3C
};

unsigned char displayKVPCmd[25] = { 0xAA,0x98,
 0x01,0x64,0x00,0x15,
 0x03,
 0x85,
 0x04,
 0x00,0x00,
 0xFF,0xFF,
 0x00,0x30,
 0x00,0x38,
 0x00,0x30,
 0xCC,0x33,0xC3,0x3C };

unsigned char displaymACmd[25] = { 0xAA,0x98,
 0x01,0x64,0x00,0x30,
 0x03,
 0x85,
 0x04,
 0x00,0x00,
 0xFF,0xFF,
 0x00,0x30,
 0x00,0x32,
 0x00,0x35,
 0xCC,0x33,0xC3,0x3C };

unsigned char displayTimeCmd[25] = { 0xAA,0x98,
 0x01,0x64,0x00,0x4B,
 0x03,
 0x85,
 0x04,
 0x00,0x00,
 0xFF,0xFF,
 0x00,0x30,
 0x00,0x31,
 0x00,0x30,
 0xCC,0x33,0xC3,0x3C };

unsigned char displayJOGCmd[25] = { 0xAA,0x98,
 0x01,0x64,0x00,0x66,
 0x03,
 0x85,
 0x04,
 0x00,0x00,
 0xFF,0xFF,
 0x00,0x34,
 0x00,0x30,
 0x00,0x30,
 0xCC,0x33,0xC3,0x3C };


unsigned char displaySecCmd[13] = { 0xAA, 0x7C, 0x01,
 0x00, 0x60, 0x01, 0x90,
 0x0C,
 0xC3,
 0xCC, 0x33, 0xC3, 0x3C };

unsigned char clearKVPBoxCmd[20] = { 0xAA,0x71,
 0x00,0x0A,
 0x01,0x64,0x00,0x15,
 0x01,0x9A,0x00,0x2D,
 0x01,0x64,0x00,0x15,
 0xCC,0x33,0xC3,0x3C };

unsigned char clearmABoxCmd[20] = { 0xAA,0x71,
 0x00,0x0A,
 0x01,0x64,0x00,0x30,
 0x01,0x9F,0x00,0x49,
 0x01,0x64,0x00,0x30,
 0xCC,0x33,0xC3,0x3C };


unsigned char clearTimeBoxCmd[20] = { 0xAA,0x71,
 0x00,0x0A,
 0x01,0x64,0x00,0x4B,
 0x01,0x9F,0x00,0x64,
 0x01,0x64,0x00,0x4B,
 0xCC,0x33,0xC3,0x3C };

unsigned char clearJOGBoxCmd[20] = { 0xAA,0x71,
 0x00,0x0A,
 0x01,0x64,0x00,0x66,
 0x01,0x9F,0x00,0x7E,
 0x01,0x64,0x00,0x66,
 0xCC,0x33,0xC3,0x3C };
#line 145 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/StoneAPI.c"
void DisplayCallKernelSendService(char* message, FRAME_TYPE type, int length)
{
 KERNEL_FRAME _frame;

 _frame.F_SENDER = DISPLAY;
 _frame.F_RECEIVER = DISPLAY;
 _frame.F_TYPE = type;

 _frame.FRAME_MESSAGE = message;
 _frame.MESSAGE_LENGTH = length;
 _frame.F_PRIORITY = NORMAL_FRAME;
 KL_SendFrame(&_frame);
}


int _idx = 0;
int result = 0;

int GetCommandParameter(unsigned char cmd[])
{
 unsigned char _digits[3];

 _digits[0] = cmd[14];
 _digits[1] = cmd[16];
 _digits[2] = cmd[18];

 result = atoi(_digits);

 return result;
}

int _result = 0;

void UpdateCommandParameter(unsigned char cmd[], int step)
{
 unsigned char _newValue[7];
 memset(_newValue, '0', 7);

 _result = GetCommandParameter(cmd);
 _result += step;

 intToStr(_result, _newValue);


 cmd[14] = _newValue[3];
 cmd[16] = _newValue[4];
 cmd[18] = _newValue[5];
}

int CheckMessageFinished(unsigned char* buffer, int mLen)
{

 if (mLen < 4)
 return 0;


 if (buffer[mLen - 4] == 0xCC && buffer[mLen - 3] == 0x33 &&
 buffer[mLen - 2] == 0xC3 && buffer[mLen - 1] == 0x3C)
 {
 return 1;
 }
 return 0;
}

void DisplayKVP()
{
 DisplayCallKernelSendService(displayKVPCmd, NORMAL_FRAME, 25);
}

void DisplaymA()
{
 DisplayCallKernelSendService(displaymACmd, NORMAL_FRAME, 25);
}

void DisplayTime()
{
 DisplayCallKernelSendService(displayTimeCmd, NORMAL_FRAME, 25);
}

void DisplayJOG()
{
 DisplayCallKernelSendService(displayJOGCmd, NORMAL_FRAME, 25);
}

void ClearKVPBox()
{
 DisplayCallKernelSendService(clearKVPBoxCmd, NORMAL_FRAME, 20);
}

void ClearmABox()
{
 DisplayCallKernelSendService(clearmABoxCmd, NORMAL_FRAME, 20);
}

void ClearTimeBox()
{
 DisplayCallKernelSendService(clearTimeBoxCmd, NORMAL_FRAME, 20);
}

void ClearJOGBox()
{
 DisplayCallKernelSendService(clearJOGBoxCmd, NORMAL_FRAME, 20);
}

void InitParameterBoard()
{
 DisplayKVP();
 DisplaymA();
 DisplayTime();
 DisplayJOG();
}

unsigned char _selectPictureCopy[8];
int index = 0;int paramVal = 0;
void ProcessMessage(unsigned char* message)
{
#line 264 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/StoneAPI.c"
 unsigned char btncode = message[3];
 unsigned char cmdcode = message[1];

 switch (cmdcode)
 {
 case 0x7C:


 if ((int)message[3] == 4)
 {

 if (message[4] == 0x32 && message[5] == 0x30
 && message[6] == 0x312 && message[7] == 0x38)
 {






 }

 }
 else
 {

 DisplayCallKernelSendService(selectPicture, NORMAL_FRAME, 8);
 }

 break;

 case 0x78:

 switch (btncode)
 {
 case 0x01:

 if (_automaticModeLst != 0)
 _automaticModeLst();
 break;
 case 0x02:

 DisplayCallKernelSendService(displaySecCmd, NORMAL_FRAME, 13);
 break;
 case 0x03:

 if (_gotoHomeLst != 0)
 _gotoHomeLst();
 break;
 break;

 case 0x04:

 memcpy(_selectPictureCopy, selectPicture, 8);



 if (_startwarmupLst != 0)
 {
 _startwarmupLst();
 }
 break;

 case 0x05:

 if (_gotoHomeLst != 0)
 _gotoHomeLst();
 break;

 case 0x06:


 if (_updateKvpLst != 0)
 {
 paramVal = GetCommandParameter(displayKVPCmd);
 _updateKvpLst(paramVal);
 }
 if (_updatemALst != 0)
 {
 paramVal = GetCommandParameter(displaymACmd);
 _updatemALst(paramVal);
 }
 if (_updateTimeLst != 0)
 {
 paramVal = GetCommandParameter(displayTimeCmd);
 _updateTimeLst(paramVal);
 }
 if (_updateJogLst != 0)
 {
 paramVal = GetCommandParameter(displayJOGCmd);
 _updateJogLst(paramVal);
 }

 if (_startExposureLst != 0)
 _startExposureLst();
 break;
 case 0x07:

 if (_stopExposureLst != 0)
 _stopExposureLst();
 break;

 case 0x10:



 paramVal = GetCommandParameter(displayKVPCmd);
 if ((paramval + KVP_STP) <= MAX_KVP_VAL)
 {

 UpdateCommandParameter(displayKVPCmd, KVP_STP);
 ClearKVPBox();
 DisplayKVP();
 }

 break;
 case 0x11:

 paramVal = GetCommandParameter(displaymACmd);
 if ((paramval + mA_STP) <= MAX_mA)
 {
 UpdateCommandParameter(displaymACmd, mA_STP);
 ClearmABox();
 DisplaymA();
 }
 break;
 case 0x12:

 paramVal = GetCommandParameter(displayTimeCmd);
 if ((paramval + Time_STP) <= MAX_Time)
 {
 UpdateCommandParameter(displayTimeCmd, Time_STP);
 ClearTimeBox();
 DisplayTime();
 }
 break;
 case 0x13:

 paramVal = GetCommandParameter(displayJOGCmd);
 if ((paramval + JOG_STP) <= MAX_JOG)
 {

 UpdateCommandParameter(displayJOGCmd, JOG_STP);
 ClearJOGBox();
 DisplayJOG();
 }
 break;
 case 0x14:

 paramVal = GetCommandParameter(displayKVPCmd);
 if (MIN_KVP_VAL <= (paramval - KVP_STP))
 {
 UpdateCommandParameter(displayKVPCmd, -1 * KVP_STP);
 ClearKVPBox();
 DisplayKVP();
 }
 break;
 case 0x15:

 paramVal = GetCommandParameter(displaymACmd);
 if (MIN_mA <= (paramval - mA_STP))
 {
 UpdateCommandParameter(displaymACmd, -1 * mA_STP);
 ClearmABox();
 DisplaymA();
 }
 break;
 case 0x16:

 paramVal = GetCommandParameter(displayTimeCmd);
 if (MIN_Time <= (paramval - Time_STP))
 {
 UpdateCommandParameter(displayTimeCmd, -1 * Time_STP);
 ClearTimeBox();
 DisplayTime();
 }
 break;
 case 0x17:

 paramVal = GetCommandParameter(displayJOGCmd);
 if (MIN_JOG <= (paramval - JOG_STP))
 {
 UpdateCommandParameter(displayJOGCmd, -1 * JOG_STP);
 ClearJOGBox();
 DisplayJOG();
 }
 break;
 }
 break;
 }

}




void SetKvpBoundaries(int minkvp,int maxkvp)
{
 MIN_KVP_VAL = minkvp;
 MAX_KVP_VAL = maxkvp;
}
void SetmABoundaries(int minmA,int maxmA)
{
 MIN_mA = minmA;
 MAX_mA = maxmA;
}
void SetTimeBoundaries(int minTime,int maxTime)
{
 MIN_TIME = minTime;
 MAX_TIME = maxTime;
}
void SetJogBoundaries(int minJog,int maxJog)
{
 MIN_JOG = minJog;
 MAX_JOG = maxJog;
}


void SetKvpStepSize(int step)
{
 KVP_STP = step;
}
void SetmAStepSize(int step)
{
 mA_STP =step;
}
void SetTimeStepSize(int step)
{
 TIME_STP = step;
}
void SetJogStepSize(int step)
{
 JOG_STP = step;
}



static unsigned char _receiveBuff[40];
static int mLen = 0;
void DisplayProcessKernelFrame(KERNEL_FRAME frame){


 _receiveBuff[mLen] = frame.FRAME_MESSAGE[0];
 mLen++;
 if (CheckMessageFinished(_receiveBuff, mLen) != 0)
 {
 ProcessMessage(_receiveBuff);
 memset(_receiveBuff, '\0', 40);
 mLen = 0;
 }
}

void InitDisplay()
{


 UpdateCommandParameter(displayKVPCmd, 0);
 UpdateCommandParameter(displaymACmd, 0);
 UpdateCommandParameter(displayJOGCmd, 0);
 UpdateCommandParameter(displayTimeCmd, 0);
}

void ShowMainMenue()
{
 DisplayCallKernelSendService( selectPicture,NORMAL_FRAME,8);
}

void DisplayAutomaticModeWarmingupState()
{

 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x04;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayAutomaticModePendingState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x02;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
 InitParameterBoard();
}

void DisplayAutomaticModeWorkingState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x06;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayAutomaticModeErrorState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x05;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayServiceModeWarmingupState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x08;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayServiceModeWarmupErrorState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x09;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayServiceModePendingState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x0A;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayServiceModeWorkingState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x0B;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}

void DisplayServiceModeErrorState()
{
 memcpy(_selectPictureCopy, selectPicture, 8);
 _selectPictureCopy[3] = 0x0C;
 DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
}



 void RegisterStartAutomaticModeSessionListener(StartAutomaticModeSessionEvent automaticModeLst)
 {
 _automaticModeLst = automaticModeLst;
 }

 void RegisterGotoHomeListener(GotoHomeEvent gotoHomeLst)
 {
 _gotoHomeLst = gotoHomeLst;
 }

 void RegisterStartExposureListener(StartExposureEvent listener)
 {
 _startExposureLst = listener;
 }

 void RegisterStopExposureListener(StopExposureEvent listener)
 {
 _stopExposureLst = listener;
 }

 void RegisterStartWarmupEventListener(StartWarmupEvent listener)
 {
 _startwarmupLst = listener;
 }

 void RegisterUpdateKvpEventListener(UpdateKvpEvent listener)
 {
 _updateKvpLst = listener;
 }

 void RegisterUpdatemAEventListener(UpdatemAEvent listener)
 {
 _updatemALst = listener;
 }

 void RegisterUpdateTimeEventListener(UpdateTimeEvent listener)
 {
 _updateTimeLst = listener;
 }

 void RegisterUpdateJOGEventListener(UpdateJOGEvent listener)
 {
 _updateJogLst = listener;
 }
