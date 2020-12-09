#include "Instrument.h"
#include "Kernel.h"
#include "GulmayAPI.h"
#include "StoneAPI.h"
#include "DeltaServoAPI.h"
#if build==debug
#include "ConnectionMap.h"  // just used for SendDebugMsg
#endif





void tstStartInstrument()
{   //int index=0;

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


    // Initialize Display
        InitDisplay();
        ShowMainMenue();

#if build == debug

  /*
    TEST GENERATOR API UNDER SIMULATION LOAD
    ------------------------------------------------------------
    CASE 1: Just normal packs, without any dispatching  | PASSED
    CASE 2: Just enqueue without dequeue                | PASSED
    CASE 3: Just  dequeue without enque                 | PASSED
    CASE 4: Send different priority messages            | PASSED
    CASE 5: Reduced buffersize to test ring buffer      | PASSED

    for(index=0;index<=100;index++)
    {
       StartExposure();
       SetFineFocalSpotSize();
       StopExposure();
       SetBroadFocalSpot();
       StartShortTermWarmup();
       StartLongTermWarmup();
    }

  */

  /*
    TEST ACTUATOR API UNDER SIMULATION LOAD
    ------------------------------------------------------------
    CASE 1: Over load kernel under all messages         | PASSED
    for(index=0;index<10;index++)
    {
       TurnOnSliderMotor();
       TurnOffSliderMotor();
       SetSliderMotorSpeed(100);
       RotateSliderMotorCounterClockwise();
       RotateSliderMotorClockwise();
       StopMotor();
    }
 */

  /*
    TEST KERNEL UNDER GENERAATOR & ACTUATOR COMMANDS MIXTURE
    ------------------------------------------------------------
    CASE 1: Test different messages priorities           | PASSED
    for(index=0;index<100;index++)
    {
       StartExposure();
       TurnOnSliderMotor();
       SetBroadFocalSpot();
       StartShortTermWarmup();
    }

*/

  //      for(index=0;index<20;index++)
//    {
//       StartExposure();
//       TurnOnSliderMotor();
//       SetBroadFocalSpot();
//       StartShortTermWarmup();
//    }

// TEST GENERATOR CONNECTION AND API UNDER REAL SITUATION
// EACH SINGLE COMMMAND IS CALLED UNDER SINGLE CALL
// IF A RESPONSE CAME THEN THE TEST IS CALLED PASSED
/*
        QueryWarmupProgram();               //PASSED
        QueryFocalSpotSize();               //PASSED
        SetGeneratorInUserMode();             ?
        QueryGeneratorMode();               //PASSED
        SuppressErrorsVoltageAndAmpError(); // PASSED
        CheckGeneratorErrors();             //PASSED
        QueryEllapsedExposureTime();        //PASSED
*/

#endif
    



}