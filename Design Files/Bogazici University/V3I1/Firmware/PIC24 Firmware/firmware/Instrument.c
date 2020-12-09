/**
 * \file Instrument.c
 * \brief implement instrument
 * 
 */
#include "Instrument.h"
#include "Kernel.h"
#include "GulmayAPI.h"
#include "StoneAPI.h"
#include "DeltaServoAPI.h"
#if build==debug
#include "ConnectionMap.h"  // just used for SendDebugMsg
#endif
#include "stdbool.h"


//************************ Internal State variables *********************
//typedef enum {
//        WORKSTATION,
//        DISPLAY
//} TERMINAL;

/**
 * \enum DISP_SCR
 *  display's screen options.
 */
typedef enum {
        DISP_HOME,     //!< home screen (main menue) on the screen
        DISP_AUTO_SCR, //!< automatic screen on display
        DISP_SRV_SCR,  //!< service screen on display                
} DISP_SCR;            

/**
* \enum DISP_CMD
* display command options.
*/
typedef enum {
        DISP_NO_CMD,  //!< display no command
        DISP_STR_EXP, //!< display start exposure command
        DISP_STP_EXP, //!< display stop exposure command
        DISP_STR_WRM, //!< display start warmup command
        DISP_UDT_KVP, //!< display update kvp command
        DISP_UDT_mA,  //!< display update mA command
        DISP_UDT_TM,  //!< display update time command
        DISP_UDT_JOG, //!< display update jog command
} DISP_CMD; 

/**
* \struct DISP_STATE
* \brief display state variable type.
*/
typedef struct 
{
   DISP_SCR DispScr; //!< instance of DISP_SCR
   DISP_CMD DispCmd; //!< instance of DISP_CMD
}DISP_STATE;

//! \brief instace of display state variable.
DISP_STATE __DISP_STAT;
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**
 * \enum GEN_ERR
 * generator error sate items.
 */
typedef enum {
        GEN_NO_ERR,//!< generator has no error
        GEN_ERR    //!< generator faced an error
} GEN_ERR ;   

/**
* \enum GEN_WRM_PRG
* generator warmup program state items.
*/
typedef enum {
        GEN_NO_WRM,  //!< no warmup required
        GEN_WRM_SRT, //!< short warmup program
        GEN_WRM_LNG  //!< long warmup program
} GEN_WRM_PRG;  //Generator warmup program

/*
 * \enum GEN_EXP_MODE
 * Generator exposure state items.
 */
typedef enum {
        GEN_NO_EXPO, //!< No Activity
        GEN_KEY2,    //!< Key in position 2
        GEN_PRE,     //!< prewarming
        GEN_SWC_NF,  //!< x-ray switching oN or oFF
        GEN_EXPOSING //!< x-ray on
} GEN_EXP_MODE; 

/**
 * \enum GEN_FCL
 * Generator focal spot size options.
 */
typedef enum {
        GEN_FIN_FCL, //!< fine focal spot
        GEN_BRD_FCL  //!< broad focal spot
} GEN_FCL;

/**
 * \struct GEN_STATE
 * \brief Generator state type.
 */
typedef struct
{
        GEN_ERR        GenErr;      //!< an instance of generator error state.
                GEN_WRM_PRG    GenWrmPrg;   //!< an instance of generator warmup program state.
                GEN_EXP_MODE   GenExpMode;  //!< an instance of generator exposure mode state.
                GEN_FCL        GenFcl;      //!< an instance of generator focal spot state.
                int Kvp;                    //!< KVP-value.
                int mA;                     //!< milli-amper value.
                int ShootTime;              //!< shoot time value.
                int Jog;                    //!< motor jog value.
                int PassedExposureTime;     //!< Ellapsed exposure time value.
                char* GenMsg;               //!< Generator message. for debugging.
                char* GenErrMsg;            //!< Generator message. for debugging.
                int GenMsgLen, GenErrLen;   //!< generator error length. for debugging.

} GEN_STATE; // TODO: rename this to INST_STATE. because jog is not generator parameter. 

 //! \brief instace of generator state variable.
 GEN_STATE __GEN_STAT;


//************************  private functions ****************************

 //! \brief start instrument monitor periodic check.
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

//! \brief stop instrument monitor periodic check.
void StopInstrumentMonitor() {
        T5IE_bit = 0;
        T5IF_bit = 0;

        T4IE_bit = 0;
        T4IF_bit = 0;
}

//! \brief operations to be executed during periodic operation.
void InstrumentMonitor() iv IVT_ADDR_T5INTERRUPT {
        T5IF_bit = 0;

        QueryGeneratorMode();
}

//*********************** Private functions ******************************

//! \brief private function for updating state variables.
void UpdateState() {

        char _str[4];
        IntToStr(__GEN_STAT.GenExpMode, _str);
        SendDebugMsg("\r    >>EXPOSURE MODE:  ");
        SendDebugMsg(_str);

        // if command was warm-up?
        if (__DISP_STAT.DispCmd == DISP_STR_WRM)
        {
                // If no exposure?
                if (__GEN_STAT.GenExpMode == GEN_NO_EXPO)
                {
                        // Warmup finished
                        DisplayServiceModePendingState();
                        SetGeneratorInUserMode();
                        InitParameterBoard(); // show the values;                         
                        __DISP_STAT.DispCmd = DISP_NO_CMD;
                        StopInstrumentMonitor();
                }
                return;
        }

        // if command was start exposure?
        if (__DISP_STAT.DispCmd == DISP_STR_EXP)
        {
                if (__GEN_STAT.GenExpMode == GEN_NO_EXPO)
                {
                        // Exposure finished
                        DisplayServiceModePendingState();
                        SetGeneratorInUserMode();
                        InitParameterBoard(); // show the values; 
                        StopMotor();
                        __DISP_STAT.DispCmd = DISP_NO_CMD;
                        StopInstrumentMonitor();
                }
                return;
        }

        // if command was start exposure?
        if (__DISP_STAT.DispCmd == DISP_STP_EXP)
        {
                // Exposure finished
                DisplayServiceModePendingState();
                SetGeneratorInUserMode();
                InitParameterBoard(); // show the values; 
                StopMotor();
                __DISP_STAT.DispCmd = DISP_NO_CMD;
                StopInstrumentMonitor();

                return;
        }

}


//************************ Generator Listeners ***************************
//! \brief Event handler for generator new message event.
void OnGeneratorMessageEventTriggered(char* msg)
{

#if build==debug
   SendDebugMsg("\r    >>GENERATOR SENT: ");
   SendDebugMsg(msg);
#endif
   //strcpy(__GEN_STAT.GenMsg, msg);
   __GEN_STAT.GenErrMsg[0] = 0;
   strcat(__GEN_STAT.GenMsg, msg);
   return;
}
//! \brief Event handler for generator stop exposure event.
void OnGeneratorExposureStopedEventTriggered()
{
#if build==debug
   SendDebugMsg("\r    >>GENERATOR EXPOSURE STOPED.");
#endif
   __GEN_STAT.GenExpMode = GEN_NO_EXPO;
return;
}
//! \brief Event handler for generator update KVP event.
void OnGeneratorKvpUpdatedEventTriggered(int kvp)
{
  #if build==debug
   char _str[4];
   IntToStr(kvp,_str);
   SendDebugMsg("\r    >>GENERATOR KVP:  ");
   SendDebugMsg(_str);   
  #endif
   __GEN_STAT.Kvp = kvp;
   return;
}
//! \brief Event handler for generator update mode event.
void OnGeneratorModeEventTriggered(int mode)
{
#if build==debug
        //char _str[4];
        //IntToStr(mode,_str);
        //SendDebugMsg("\r    >>GENERATOR SENT MODE:  ");
        //SendDebugMsg(_str);
#endif
        // I use just cases 0 & 4
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
//! \brief Event handler for generator update milli-amper event.
void OnGeneratormAUpdatedEventTriggered(int amp)
{
  #if build == debug
   char _str[4];
   IntToStr(amp,_str);
   SendDebugMsg("\r    >>GENERATOR mA:  ");
   SendDebugMsg(_str);
  #endif
   __GEN_STAT.mA = amp;
   return;
}
//! \brief Event handler for generator ellapsed exposure time notification.
void OnGeneratorPassedExposureTimeEventTriggered(int passedTime)
{
  #if build == debug
   char _str[4];
   IntToStr(passedTime,_str);
   SendDebugMsg("\r    >>PASSED TIME:  ");
   SendDebugMsg(_str);
  #endif
   __GEN_STAT.PassedExposureTime = passedTime;
   return;

}
//! \brief Event handler for generator shoot time event.
void OnGeneratorShootTimeEventTriggered(int shootTime)
{
  #if build==debug
   char _str[4];
   IntToStr(shootTime,_str);
   SendDebugMsg("\r    >>SHOOT TIME:  ");
   SendDebugMsg(_str);
  #endif
   __GEN_STAT.ShootTime = shootTime;
   return;
}
//! \brief Event handler for generator start exposure event.
void OnGeneratorExposureStartedEventTriggered()
{
  #if build==debug
   SendDebugMsg("\r    >>EXPOSURE STARTED.");
  #endif
   __GEN_STAT.GenExpMode = GEN_EXPOSING;
   return;
}
//! \brief Event handler for generator error event.
void OnGeneratorErrorEventTriggered(char* error)
{
  #if build==debug        
   //char _str[4];
   //SendDebugMsg("\r    >>GENERATOR SENT ERROR:  ");
    //SendDebugMsg(error);
   //SendDebugMsg("\r");
  #endif
  //__GEN_STAT.GenErrMsg[0]=0;
  //strcat( __GEN_STAT.GenErrMsg,error);
   //strcpy(__GEN_STAT.GenErrMsg, error);
   //__GEN_STAT.GenErr = GEN_ERR;

   return;
}
//! \brief Event handler for generator warmup finished event.
void OnGeneratorWarmupFinishedEventTriggered()
{
  #if build==debug
   SendDebugMsg("\r    >>GENERATOR WARMUP FINISHED.");
  #endif
   __GEN_STAT.GenWrmPrg = GEN_NO_WRM;
   return;
}
//! \brief Event handler for generator demands short warmup event.
void OnGeneratorRequiresShortWarmupEventTriggered()
{
  #if build==debug
   SendDebugMsg("\r    >>GENERATOR REQUIRES SHORT WARMUP.");
  #endif
   __GEN_STAT.GenWrmPrg = GEN_WRM_SRT;
   return;
}
//! \brief Event handler for generator demands for long warmup event.
void OnGeneratorRequiresLongWarmupEventTriggered()
{
  #if build==debug
   SendDebugMsg("\r    >>GENERATOR REQUIRES LONG WARMUP.");
  #endif
   __GEN_STAT.GenWrmPrg = GEN_WRM_LNG;
   return;
}
//! \brief Event handler for x-ray tube is using larg focal spot event.
void OnGeneratorLargFocalSpotSizeEventTriggered()
{
  #if build==debug
   SendDebugMsg("\r    >>GENERATOR BROAD FOCAL-SPOT.");   
  #endif
   __GEN_STAT.GenFcl = GEN_BRD_FCL;
   return;
}
//! \brief Event handler for x-ray tube is using small focal spot event.
void OnGeneratorSmallFocalSpotSizeEventTriggered()
{
  #if build==debug
   SendDebugMsg("\r    >>GENERATOR FINE FOCAL-SPOT.");   
  #endif
   __GEN_STAT.GenFcl = GEN_FIN_FCL;
   return;
}

//**************************** Stone LCD Listeners *********************

//! \brief event handler for automatic mode selection on the screen.
void OnDisplayStartAutomaticModeEventTriggered()
{
#if build==debug
       SendDebugMsg("\r    >>DISPLAY IN AUTOMATIC MODE.");
#endif
           __DISP_STAT.DispScr = DISP_AUTO_SCR;
           return;
}
//! \brief event handler for go home selection on the screen.
void OnDisplayGotoHomeEventTriggered()
{
#if build==debug
        SendDebugMsg("\r    >> HOME BUTTON ON DISPLAY PRESSED.");
#endif
        __DISP_STAT.DispScr = DISP_HOME;
        return;
}
//! \brief event handler for start exposure selection on the screen.
void OnDisplayStartExposureEventTriggered()
{
#if build==debug
        SendDebugMsg("\r    >> START EXPOSURE BUTTON ON DISPLAY PRESSED.");
#endif
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
//! \brief event handler for stop exposure selection on the screen.
void OnDisplayStopExposureEventTriggered()
{
#if build==debug
        SendDebugMsg("\r    >> STOP EXPOSURE BUTTON ON DISPLAY PRESSED.");
#endif
                __DISP_STAT.DispCmd = DISP_STP_EXP;
                            //The Instrument monitor is not stoped 
                                // thus the mode checking and system update are
                                // executed next.
                                // The rest is done inside UpdateState()
                return;
}
//! \brief event handler for start warmup selection on the screen.
void OnDisplayStartWarmupEventTriggered()
{
#if build==debug
        SendDebugMsg("\r    >> START WARMUP BUTTON ON DISPLAY PRESSED.");
#endif

    if (__GEN_STAT.GenWrmPrg == GEN_NO_WRM) // no warmup
    {                        
            DisplayServiceModePendingState();
                        SetGeneratorInUserMode();
            InitParameterBoard(); // show the values; 
            return;
    }
    if (__GEN_STAT.GenWrmPrg == GEN_WRM_SRT) // short warmup
    {
                #if build==debug
        SendDebugMsg("\r    >> STARTING SHORT  WARMUP.");
#endif
            DisplayServiceModeWarmingupState();
            StartShortTermWarmup();
                        StartInstrumentMonitor();                       
            return;
    }
    if (__GEN_STAT.GenWrmPrg == GEN_WRM_LNG) //long warmup
    {
            #if build==debug
        SendDebugMsg("\r    >> STARTING LONG  WARMUP.");
#endif
            DisplayServiceModeWarmingupState();
            StartLongTermWarmup();
                        StartInstrumentMonitor();                                               
    }
        __DISP_STAT.DispCmd = DISP_STR_WRM;
        //StartInstrumentMonitor();
    return;
}
//! \brief event handler for updating KVP on the screen.
void OnDisplayUpdateKvpEventTriggered(int kvp)
{
#if build==debug
        SendDebugMsg("\r    >> UPDATE KVP BUTTON ON DISPLAY PRESSED.");
#endif
                __GEN_STAT.Kvp = kvp;
                __DISP_STAT.DispCmd = DISP_UDT_KVP;
                return;
}
//! \brief event handler for updating milli-amper on the screen.
void OnDisplayUpdatemAEventTriggered(int ma)
{
#if build==debug
        SendDebugMsg("\r    >> mA BUTTON ON DISPLAY PRESSED.");
        
#endif
    __GEN_STAT.mA = ma;
    __DISP_STAT.DispCmd = DISP_UDT_mA;
    return;
}
//! \brief event handler for updating exposure time on the screen.
void OnDisplayUpdateTimeEventTriggered(int time)
{
#if build==debug
        SendDebugMsg("\r    >> EXPOSURE TIME BUTTON ON DISPLAY PRESSED.");
#endif
    __GEN_STAT.ShootTime = time;
    __DISP_STAT.DispCmd = DISP_UDT_TM;
    return;
}
//! \brief event handler for updating JOG on the screen.
void OnDisplayUpdateJOGEventTriggered(int time)
{
#if build==debug
        SendDebugMsg("\r    >> JOG BUTTON ON DISPLAY PRESSED.");
#endif
    __GEN_STAT.Jog = time;
    __DISP_STAT.DispCmd = DISP_UDT_JOG;
    return;
}

//! \brief private function that reset generator, motor, display and all devices.
void ResetSystem()
{
        // STEP1: STOP GENERATOR
        ResetGenerator();
        
        // STEP2: STOP MOTOR
        StopMotor();
        SetSliderMotorSpeed(MIN_MOTOR_JOG);

        // STEP3: INITIALIZE DISPLAY
        InitDisplay();
        ShowMainMenue();
}

//! \brief start instrument. This function is called by Kernel.c at the end of bootup process.
void StartInstrument()
{
    int index = 0;
    // Register Generator to the kernel
    DEVICE_SLOT _genslot,_actslot, _dislot ;
    _genslot.device = GENERATOR;
    _genslot.handler = GeneratorProcessKernelFrame;
    KL_RegisterDevice(_genslot); // register to event handlers

    // Register Display to the kernel
    _dislot.device = DISPLAY;
    _dislot.handler = DisplayProcessKernelFrame;
    KL_RegisterDevice(_dislot);
    

    // Register Actuator to the kernel
    _actslot.device = ACTUATOR;
    _actslot.handler =ActuatorProcessKernelFrame;
    KL_RegisterDevice(_actslot);
    
    
    // Handel Generator events
   RegisterMessageListener(OnGeneratorMessageEventTriggered);
    
   //RegisterErrorListener(OnGeneratorErrorEventTriggered);
    
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

   //Handel Display events
   RegisterStartAutomaticModeSessionListener(OnDisplayStartAutomaticModeEventTriggered);
   RegisterGotoHomeListener(OnDisplayGotoHomeEventTriggered);
   RegisterStartExposureListener(OnDisplayStartExposureEventTriggered);
   RegisterStopExposureListener(OnDisplayStopExposureEventTriggered);
   RegisterStartWarmupEventListener(OnDisplayStartWarmupEventTriggered);
   RegisterUpdateKvpEventListener(OnDisplayUpdateKvpEventTriggered);
   RegisterUpdatemAEventListener(OnDisplayUpdatemAEventTriggered);
   RegisterUpdateTimeEventListener(OnDisplayUpdateTimeEventTriggered);
   RegisterUpdateJOGEventListener(OnDisplayUpdateJOGEventTriggered);
  
   // Set display parameters
   SetKvpBoundaries(MIN_KVP ,MAX_KVP);
   SetmABoundaries(MIN_mAMP,MAX_mAMP);
   SetTimeBoundaries(MIN_EXPOSURE_TIME,MAX_EXPOSURE_TIME);
   SetJogBoundaries(MIN_MOTOR_JOG,MAX_MOTOR_JOG);
   //SetKvpStepSize();
   //SetmAStepSize();
   //SetTimeStepSize();
   //SetJogStepSize();


   ResetSystem();

   //TurnOnSliderMotor();
   //SetSliderMotorSpeed(800);
   //RotateSliderMotorCounterClockwise();


}