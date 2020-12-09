/**
 * \file StoneAPI.h
 * \brief API for communicating with Stone display.
 */
#ifndef STONEAPI_H
  #define STONEAPI_H
 
   #include"Kernel.h"

// public functions
//! \brief Receive the frames that are sent by Kernel.c 
//! \param[in] KERNEL_FRAME The frame that sent by kernel.
void DisplayProcessKernelFrame(KERNEL_FRAME);
//! \brief initialize the display.
void InitDisplay();
//! \brief show main menue on the display.
void ShowMainMenue();
//! \brief initialize numberic values region on the board.
void InitParameterBoard();

/**
 * \brief set boundries on KVP value selector.
 * \param[in] minkvp minimum KVP value.
 * \param[in] maxkvp maximum KVP value.
 */
void SetKvpBoundaries(int minkvp,int maxkvp);

/**
* \brief set boundries on milli-Amper value selector.
* \param[in] minmA minimum amper value.
* \param[in] maxmA maximum amper value.
*/
void SetmABoundaries(int minmA,int maxmA);

/**
* \brief set boundries on time value selector.
* \param[in] minTime minimum time value.
* \param[in] maxTime maximum time value.
*/
void SetTimeBoundaries(int minTime,int maxTime);

/**
* \brief set boundries on JOG value selector.
* \param[in] minJog minimum JOG value.
* \param[in] maxJog maximum JOG value.
*/
void SetJogBoundaries(int minJog,int maxJog);

//! \brief set the step value for KVP numeric selector.   
void SetKvpStepSize(int step);
//! \brief set the step value for milli-amper numeric selector.
void SetmAStepSize(int step);
//! \brief set the step value for exposure numeric selector.
void SetTimeStepSize(int step);
//! \brief set the step value for JOG numeric selector.
void SetJogStepSize(int step);

//! \brief display automatic mode warmingup state
void DisplayAutomaticModeWarmingupState();
//! \brief display automatic mode pending state
void DisplayAutomaticModePendingState();
//! \brief display automatic mode working state
void DisplayAutomaticModeWorkingState();
//! \brief display automatic mode error state
void DisplayAutomaticModeErrorState();

//! \brief display service mode warmingup state
void DisplayServiceModeWarmingupState();
//! \brief display service mode warmup error state
void DisplayServiceModeWarmupErrorState();
//! \brief display service mode pending state
void DisplayServiceModePendingState();
//! \brief display service mode working state
void DisplayServiceModeWorkingState();
//! \brief display service mode error state
void DisplayServiceModeErrorState();


 // Events
 // The user of the StoneAPI get informed by registering
 // its callback into the following callback functions
 typedef void (*StartAutomaticModeSessionEvent)();
 typedef void (*GotoHomeEvent)();
 typedef void (*StartExposureEvent)();
 typedef void (*StopExposureEvent)();
 typedef void (*StartWarmupEvent)();
 typedef void (*UpdateKvpEvent)(int kvp);
 typedef void (*UpdatemAEvent)(int mA);
 typedef void (*UpdateTimeEvent)(int time);
 typedef void (*UpdateJOGEvent)(int jog);
 
 /**
 * \brief register a listener for start automatic mode event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive start-automatic-mode event.
 * \param StartAutomaticModeSessionEvent The function that is going to be called when automatic mode is selected on the display.
 */
 void RegisterStartAutomaticModeSessionListener(StartAutomaticModeSessionEvent);
 /**
 * \brief register a listener for go to home event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive goto home event.
 * \param GotoHomeEvent The function that is going to be called when goto home button is pressed on the display.
 */
 void RegisterGotoHomeListener(GotoHomeEvent);
 /**
 * \brief register a listener for start exposure event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive start exposure event.
 * \param StartExposureEvent The function that is going to be called when start exposure button is pressed on the display.
 */
 void RegisterStartExposureListener(StartExposureEvent);
 /**
 * \brief register a listener for stop exposure event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive stop exposure event.
 * \param StopExposureEvent The function that is going to be called when stop exposure button is pressed on the display.
 */
 void RegisterStopExposureListener(StopExposureEvent);
 /**
 * \brief register a listener for start warmup event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive start warmup event.
 * \param StartWarmupEvent The function that is going to be called when start warmup button is pressed on the display.
 */
 void RegisterStartWarmupEventListener(StartWarmupEvent);
 /**
 * \brief register a listener for update KVP event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive update KVP event.
 * \param UpdateKvpEvent The function that is going to be called when KVP value is changed on the display.
 */
 void RegisterUpdateKvpEventListener(UpdateKvpEvent);
 /**
 * \brief register a listener for update milli-amper event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive update milli-amper event.
 * \param UpdatemAEvent The function that is going to be called when milli-amper value is changed on the display.
 */
 void RegisterUpdatemAEventListener(UpdatemAEvent);
 /**
 * \brief register a listener for update exposure time event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive update exposure time event.
 * \param UpdateTimeEvent The function that is going to be called when exposure time value is changed on the display.
 */
 void RegisterUpdateTimeEventListener(UpdateTimeEvent);
 /**
 * \brief register a listener for update JOG event.
 * \details the user of the StoneAPI (i.e. instrument.c) register an
 *  event listener function to receive update JOG event.
 * \param UpdateJOGEvent The function that is going to be called when JOG value is changed on the display.
 */
 void RegisterUpdateJOGEventListener(UpdateJOGEvent);

 

#endif