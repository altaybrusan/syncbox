#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stdbool.h"



 typedef char _Bool;
#line 27 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef enum {
 DISP_HOME,
 DISP_AUTO_SCR,
 DISP_SRV_SCR,
} DISP_SCR;
#line 37 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef enum {
 DISP_NO_CMD,
 DISP_STR_EXP,
 DISP_STP_EXP,
 DISP_STR_WRM,
 DISP_UDT_KVP,
 DISP_UDT_mA,
 DISP_UDT_TM,
 DISP_UDT_JOG,
} DISP_CMD;
#line 52 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef struct
{
 DISP_SCR DispScr;
 DISP_CMD DispCmd;
}DISP_STATE;


DISP_STATE __DISP_STAT;
#line 66 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef enum {
 GEN_NO_ERR,
 GEN_ERR
} GEN_ERR ;
#line 75 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef enum {
 GEN_NO_WRM,
 GEN_WRM_SRT,
 GEN_WRM_LNG
} GEN_WRM_PRG;
#line 85 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef enum {
 GEN_NO_EXPO,
 GEN_KEY2,
 GEN_PRE,
 GEN_SWC_NF,
 GEN_EXPOSING
} GEN_EXP_MODE;
#line 97 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef enum {
 GEN_FIN_FCL,
 GEN_BRD_FCL
} GEN_FCL;
#line 106 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
typedef struct
{
 GEN_ERR GenErr;
 GEN_WRM_PRG GenWrmPrg;
 GEN_EXP_MODE GenExpMode;
 GEN_FCL GenFcl;
 int Kvp;
 int mA;
 int ShootTime;
 int Jog;
 int PassedExposureTime;
 char* GenMsg;
 char* GenErrMsg;
 int GenMsgLen, GenErrLen;

} GEN_STATE;


 GEN_STATE __GEN_STAT;





void StartInstrumentMonitor() {
 T4CON = 0x00;
 T5CON = 0x0;
 TMR4 = 0;
 TMR5 = 0;
 T5IE_bit = 1;
 T5IF_bit = 0;
 T5IP_0_bit = 1;
 T5IP_1_bit = 1;
 T5IP_2_bit = 1;
 PR5 = 854;
 PR4 = 33110;
 T4CONbits.TON = 1;
 T4CONbits.T32 = 1;
}


void StopInstrumentMonitor() {
 T5IE_bit = 0;
 T5IF_bit = 0;

 T4IE_bit = 0;
 T4IF_bit = 0;
}


void InstrumentMonitor() iv IVT_ADDR_T5INTERRUPT {
 T5IF_bit = 0;

 QueryGeneratorMode();
}




void UpdateState() {

 char _str[4];
 IntToStr(__GEN_STAT.GenExpMode, _str);
  UART3_Write_Text("\r    >>EXPOSURE MODE:  ") ;
  UART3_Write_Text(_str) ;


 if (__DISP_STAT.DispCmd == DISP_STR_WRM)
 {

 if (__GEN_STAT.GenExpMode == GEN_NO_EXPO)
 {

 DisplayServiceModePendingState();
 SetGeneratorInUserMode();
 InitParameterBoard();
 __DISP_STAT.DispCmd = DISP_NO_CMD;
 StopInstrumentMonitor();
 }
 return;
 }


 if (__DISP_STAT.DispCmd == DISP_STR_EXP)
 {
 if (__GEN_STAT.GenExpMode == GEN_NO_EXPO)
 {

 DisplayServiceModePendingState();
 SetGeneratorInUserMode();
 InitParameterBoard();
 StopMotor();
 __DISP_STAT.DispCmd = DISP_NO_CMD;
 StopInstrumentMonitor();
 }
 return;
 }


 if (__DISP_STAT.DispCmd == DISP_STP_EXP)
 {

 DisplayServiceModePendingState();
 SetGeneratorInUserMode();
 InitParameterBoard();
 StopMotor();
 __DISP_STAT.DispCmd = DISP_NO_CMD;
 StopInstrumentMonitor();

 return;
 }

}




void OnGeneratorMessageEventTriggered(char* msg)
{


  UART3_Write_Text("\r    >>GENERATOR SENT: ") ;
  UART3_Write_Text(msg) ;


 __GEN_STAT.GenErrMsg[0] = 0;
 strcat(__GEN_STAT.GenMsg, msg);
 return;
}

void OnGeneratorExposureStopedEventTriggered()
{

  UART3_Write_Text("\r    >>GENERATOR EXPOSURE STOPED.") ;

 __GEN_STAT.GenExpMode = GEN_NO_EXPO;
return;
}

void OnGeneratorKvpUpdatedEventTriggered(int kvp)
{

 char _str[4];
 IntToStr(kvp,_str);
  UART3_Write_Text("\r    >>GENERATOR KVP:  ") ;
  UART3_Write_Text(_str) ;

 __GEN_STAT.Kvp = kvp;
 return;
}

void OnGeneratorModeEventTriggered(int mode)
{







 switch (mode)
 {
 case 0:
 __GEN_STAT.GenExpMode = GEN_NO_EXPO;
 break;
 case 1:
 __GEN_STAT.GenExpMode = GEN_KEY2;
 break;

 case 2:
 __GEN_STAT.GenExpMode = GEN_PRE;
 break;

 case 3:
 __GEN_STAT.GenExpMode = GEN_SWC_NF;
 break;
 case 4:
 __GEN_STAT.GenExpMode = GEN_EXPOSING;
 break;
 }
 UpdateState();
 return;
}

void OnGeneratormAUpdatedEventTriggered(int amp)
{

 char _str[4];
 IntToStr(amp,_str);
  UART3_Write_Text("\r    >>GENERATOR mA:  ") ;
  UART3_Write_Text(_str) ;

 __GEN_STAT.mA = amp;
 return;
}

void OnGeneratorPassedExposureTimeEventTriggered(int passedTime)
{

 char _str[4];
 IntToStr(passedTime,_str);
  UART3_Write_Text("\r    >>PASSED TIME:  ") ;
  UART3_Write_Text(_str) ;

 __GEN_STAT.PassedExposureTime = passedTime;
 return;

}

void OnGeneratorShootTimeEventTriggered(int shootTime)
{

 char _str[4];
 IntToStr(shootTime,_str);
  UART3_Write_Text("\r    >>SHOOT TIME:  ") ;
  UART3_Write_Text(_str) ;

 __GEN_STAT.ShootTime = shootTime;
 return;
}

void OnGeneratorExposureStartedEventTriggered()
{

  UART3_Write_Text("\r    >>EXPOSURE STARTED.") ;

 __GEN_STAT.GenExpMode = GEN_EXPOSING;
 return;
}

void OnGeneratorErrorEventTriggered(char* error)
{
#line 349 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/firmware/Instrument.c"
 return;
}

void OnGeneratorWarmupFinishedEventTriggered()
{

  UART3_Write_Text("\r    >>GENERATOR WARMUP FINISHED.") ;

 __GEN_STAT.GenWrmPrg = GEN_NO_WRM;
 return;
}

void OnGeneratorRequiresShortWarmupEventTriggered()
{

  UART3_Write_Text("\r    >>GENERATOR REQUIRES SHORT WARMUP.") ;

 __GEN_STAT.GenWrmPrg = GEN_WRM_SRT;
 return;
}

void OnGeneratorRequiresLongWarmupEventTriggered()
{

  UART3_Write_Text("\r    >>GENERATOR REQUIRES LONG WARMUP.") ;

 __GEN_STAT.GenWrmPrg = GEN_WRM_LNG;
 return;
}

void OnGeneratorLargFocalSpotSizeEventTriggered()
{

  UART3_Write_Text("\r    >>GENERATOR BROAD FOCAL-SPOT.") ;

 __GEN_STAT.GenFcl = GEN_BRD_FCL;
 return;
}

void OnGeneratorSmallFocalSpotSizeEventTriggered()
{

  UART3_Write_Text("\r    >>GENERATOR FINE FOCAL-SPOT.") ;

 __GEN_STAT.GenFcl = GEN_FIN_FCL;
 return;
}




void OnDisplayStartAutomaticModeEventTriggered()
{

  UART3_Write_Text("\r    >>DISPLAY IN AUTOMATIC MODE.") ;

 __DISP_STAT.DispScr = DISP_AUTO_SCR;
 return;
}

void OnDisplayGotoHomeEventTriggered()
{

  UART3_Write_Text("\r    >> HOME BUTTON ON DISPLAY PRESSED.") ;

 __DISP_STAT.DispScr = DISP_HOME;
 return;
}

void OnDisplayStartExposureEventTriggered()
{

  UART3_Write_Text("\r    >> START EXPOSURE BUTTON ON DISPLAY PRESSED.") ;

 DisplayServiceModeWorkingState();

 SetGeneratorInUserMode();
 Delay_ms(20);

 UpdateKvp(__GEN_STAT.kvp);
 Delay_ms(20);

 UpdateAmp(__GEN_STAT.mA);
 Delay_ms(20);

 UpdateShootTime(__GEN_STAT.ShootTime);
 Delay_ms(20);

 TurnOffSliderMotor();
 Delay_ms(20);

 SetSliderMotorSpeed(__GEN_STAT.Jog);
 Delay_ms(20);

 TurnOnSliderMotor();
 Delay_ms(20);

 RotateSliderMotorClockwise();


 StartExposure();
 Delay_ms(20);

 __DISP_STAT.DispCmd = DISP_STR_EXP;

 StartInstrumentMonitor();

 return;
}

void OnDisplayStopExposureEventTriggered()
{

  UART3_Write_Text("\r    >> STOP EXPOSURE BUTTON ON DISPLAY PRESSED.") ;

 __DISP_STAT.DispCmd = DISP_STP_EXP;




 return;
}

void OnDisplayStartWarmupEventTriggered()
{

  UART3_Write_Text("\r    >> START WARMUP BUTTON ON DISPLAY PRESSED.") ;


 if (__GEN_STAT.GenWrmPrg == GEN_NO_WRM)
 {
 DisplayServiceModePendingState();
 SetGeneratorInUserMode();
 InitParameterBoard();
 return;
 }
 if (__GEN_STAT.GenWrmPrg == GEN_WRM_SRT)
 {

  UART3_Write_Text("\r    >> STARTING SHORT  WARMUP.") ;

 DisplayServiceModeWarmingupState();
 StartShortTermWarmup();
 StartInstrumentMonitor();
 return;
 }
 if (__GEN_STAT.GenWrmPrg == GEN_WRM_LNG)
 {

  UART3_Write_Text("\r    >> STARTING LONG  WARMUP.") ;

 DisplayServiceModeWarmingupState();
 StartLongTermWarmup();
 StartInstrumentMonitor();
 }
 __DISP_STAT.DispCmd = DISP_STR_WRM;

 return;
}

void OnDisplayUpdateKvpEventTriggered(int kvp)
{

  UART3_Write_Text("\r    >> UPDATE KVP BUTTON ON DISPLAY PRESSED.") ;

 __GEN_STAT.Kvp = kvp;
 __DISP_STAT.DispCmd = DISP_UDT_KVP;
 return;
}

void OnDisplayUpdatemAEventTriggered(int ma)
{

  UART3_Write_Text("\r    >> mA BUTTON ON DISPLAY PRESSED.") ;


 __GEN_STAT.mA = ma;
 __DISP_STAT.DispCmd = DISP_UDT_mA;
 return;
}

void OnDisplayUpdateTimeEventTriggered(int time)
{

  UART3_Write_Text("\r    >> EXPOSURE TIME BUTTON ON DISPLAY PRESSED.") ;

 __GEN_STAT.ShootTime = time;
 __DISP_STAT.DispCmd = DISP_UDT_TM;
 return;
}

void OnDisplayUpdateJOGEventTriggered(int time)
{

  UART3_Write_Text("\r    >> JOG BUTTON ON DISPLAY PRESSED.") ;

 __GEN_STAT.Jog = time;
 __DISP_STAT.DispCmd = DISP_UDT_JOG;
 return;
}


void ResetSystem()
{

 ResetGenerator();


 StopMotor();
 SetSliderMotorSpeed(MIN_MOTOR_JOG);


 InitDisplay();
 ShowMainMenue();
}


void StartInstrument()
{
 int index = 0;

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



 RegisterMessageListener(OnGeneratorMessageEventTriggered);



 RegisterGeneratorModeListener(OnGeneratorModeEventTriggered);

 RegisterFocalspotListeners( OnGeneratorLargFocalSpotSizeEventTriggered,
 OnGeneratorSmallFocalSpotSizeEventTriggered );

 RegisterExposureStateListeners( OnGeneratorExposureStartedEventTriggered,
 OnGeneratorPassedExposureTimeEventTriggered,
 OnGeneratorExposureStopedEventTriggered );

 RegisterExposureParameterListeners( OnGeneratorKvpUpdatedEventTriggered,
 OnGeneratormAUpdatedEventTriggered,
 OnGeneratorShootTimeEventTriggered);

 RegisterWarmupListeners( OnGeneratorRequiresShortWarmupEventTriggered,
 OnGeneratorRequiresLongWarmupEventTriggered,
 OnGeneratorWarmupFinishedEventTriggered );


 RegisterStartAutomaticModeSessionListener(OnDisplayStartAutomaticModeEventTriggered);
 RegisterGotoHomeListener(OnDisplayGotoHomeEventTriggered);
 RegisterStartExposureListener(OnDisplayStartExposureEventTriggered);
 RegisterStopExposureListener(OnDisplayStopExposureEventTriggered);
 RegisterStartWarmupEventListener(OnDisplayStartWarmupEventTriggered);
 RegisterUpdateKvpEventListener(OnDisplayUpdateKvpEventTriggered);
 RegisterUpdatemAEventListener(OnDisplayUpdatemAEventTriggered);
 RegisterUpdateTimeEventListener(OnDisplayUpdateTimeEventTriggered);
 RegisterUpdateJOGEventListener(OnDisplayUpdateJOGEventTriggered);


 SetKvpBoundaries(MIN_KVP ,MAX_KVP);
 SetmABoundaries(MIN_mAMP,MAX_mAMP);
 SetTimeBoundaries(MIN_EXPOSURE_TIME,MAX_EXPOSURE_TIME);
 SetJogBoundaries(MIN_MOTOR_JOG,MAX_MOTOR_JOG);






 ResetSystem();






}
