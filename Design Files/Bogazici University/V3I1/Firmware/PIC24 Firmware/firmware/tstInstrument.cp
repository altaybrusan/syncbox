#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/tstInstrument.c"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/instrument.h"
#line 12 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/instrument.h"
void StartInstrument();
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
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/deltaservoapi.h"
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/types.h"
#line 7 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/types.h"
 typedef unsigned char byte;
 typedef unsigned int uint;
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
#line 57 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/deltaservoapi.h"
 extern const int MIN_MOTOR_JOG ;

 extern const int MAX_MOTOR_JOG ;



 void TurnOnSliderMotor();

 void TurnOffSliderMotor();

 void SetSliderMotorSpeed(int);

 void RotateSliderMotorCounterClockwise();

 void RotateSliderMotorClockwise();

 void StopMotor();


 void ActuatorProcessKernelFrame(KERNEL_FRAME);
#line 1 "c:/users/altay/documents/altium/projects/syncbox/work/bogazici university/syncbox/v3i1/software/pic24 firmware/firmware/connectionmap.h"
#line 14 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/tstInstrument.c"
void tstStartInstrument()
{


 DEVICE_SLOT _genslot,_actslot, _dislot ;
 _genslot.device = GENERATOR;
 _genslot.handler = GeneratorProcessKernelFrame;
 KL_RegisterDevice(_genslot);


 _dislot.device = DISPLAY;
 _dislot.handler = DisplayProcessKernelFrame;
 KL_RegisterDevice(_dislot);


 _actslot.device = ACTUATOR;
 _actslot.handler =ActuatorProcessKernelFrame;
 KL_RegisterDevice(_actslot);



 InitDisplay();
 ShowMainMenue();
#line 116 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/tstInstrument.c"
}
