/**
 * \file GulmayAPI.h
 * \brief API for communicating with Gulmay Generator.
 */
#ifndef GULMAYAPI_H
  #define GULMAYAPI_H
   #include"Kernel.h"
  // Global state variables
  extern const int MAX_KVP;             //!< \brief maximum allowd KVP.
  extern const int MIN_KVP;             //!< \brief minimum allowd KVP.
  extern const int MAX_mAMP;            //!< \brief maximum allowd milli-amper.
  extern const int MIN_mAMP;            //!< \brief minimum allowd milli-amper.
  extern const int MIN_EXPOSURE_TIME;   //!< \brief minimum exposure time.
  extern const int MAX_EXPOSURE_TIME;   //!< \brief maximum exposure time.

  void ResetGenerator();              //!< \brief reset generator.
  void UpdateKvp(int newValue);       //!< \brief update KVP value.
  void UpdateAmp(int newValue);       //!< \brief update milli-amper value.
  void UpdateShootTime(int newValue); //!< \brief update shoot time.
  void StartExposure();               //!< \brief start exposure.
  void StopExposure();                //!< \brief stop exposure.
  void SetFineFocalSpotSize();        //!< \brief activate fine focal spot.
  void SetBroadFocalSpotSize();       //!< \brief activate broad focal spot.
  void StartShortTermWarmup();        //!< \brief start short term warm up program.
  void StartLongTermWarmup();         //!< \brief start long term warm up program.
  void QueryGeneratorMode();          //!< \brief get the generator exposure mode.
  void QueryExposureParameters();     //!< \brief get the exposure parameters (KVP,mAmp and time).
  //void InitConnection();

  void GeneratorProcessKernelFrame(KERNEL_FRAME); //!< \brief call back function. Kernel messages are received by this function.
  void QueryWarmupProgram();                      //!< \brief check generetor for what is the required warmup program.
  void QueryFocalSpotSize();                      //!< \brief check generator for the active focal spot.
  void SetGeneratorInUserMode();                  //!< \brief activate the user mode program.
  void SuppressErrorsVoltageAndAmpError();        //!< \brief suppress voltage and ampere errors.
  void CheckGeneratorErrors();                    //!< \brief check the generetor errors
  void QueryEllapsedExposureTime();               //!< \brief query ellapsed exposure time.
  void SendMessage(char* currentRequest);   

  
  // Events
  // The user of the GeneratorAPI get informed by registering
  // its callback into the following callback functions
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

  /**
   * \brief register a listener for generator message event.
   * \details the user of the GulmayAPI (i.e. instrument.c) register an
   * event listener function to receive generator new message event.
   * \param GeneratorMessageEvent The function that is going to be called when a new message is available.
   */
  void RegisterMessageListener( GeneratorMessageEvent ); 
  /**
  * \brief register a listener for generator error event.
  * \details the user of the GulmayAPI (i.e. instrument.c) register an
  * event listener function to receive generator error event.
  * \param GeneratorErrorEvent The function that is going to be called when an error happens.
  */
  void RegisterErrorListener( GeneratorErrorEvent ); 
  /**
  * \brief register a listener for generator mode event.
  * \details the user of the GulmayAPI (i.e. instrument.c) register an
  *  event listener function to receive generator mode event.
  * \param GeneratorModeEvent The function that is going to be called when mode changes.
  */
  void RegisterGeneratorModeListener( GeneratorModeEvent );
  /**
  * \brief register a listener for generator focal spot change event.
  * \details the user of the GulmayAPI (i.e. instrument.c) register an
  *  event listener function to receive generator focalspot changes event.
  * \param LargFocalSpotSizeEvent The function that is going to be called when larg focal spot size is activated.
  * \param SmallFocalSpotSizeEvent The function that is going to be called when small focal spot size is activated.
 */
  void RegisterFocalspotListeners( LargFocalSpotSizeEvent,
	                               SmallFocalSpotSizeEvent );
  /**
  * \brief register a listener for generator exposure event.
  * \details the user of the GulmayAPI (i.e. instrument.c) register an
  *  event listener function to receive generator exposure related events.
  * \param ExposureStartedEvent The callback function for start exposure event.
  * \param PassedExposureTimeEvent The callback function for how much of exposure duration passed event.
  * \param ExposureStopedEvent The callback function for exposure stopped event.
  */
  void RegisterExposureStateListeners( ExposureStartedEvent,
	                                   PassedExposureTimeEvent,
	                                   ExposureStopedEvent );
  /**
  * \brief register a listener for generator exposure parameter event.
  * \details the user of the GulmayAPI (i.e. instrument.c) register an
  *  event listener function to receive generator exposure-parameter related events.
  * \param KvpUpdatedEvent The callback function for getting the updated KVP value.
  * \param AmpUpdatedEvent The callback function for getting the updated milli-Amper value.
  * \param ShootTimeEvent  The callback function for getting the shoot time value.
  */
  void RegisterExposureParameterListeners( KvpUpdatedEvent,
	                                       AmpUpdatedEvent,
	                                       ShootTimeEvent );
  
  /**
  * \brief register a listener for generator warmup event.
  * \details the user of the GulmayAPI (i.e. instrument.c) register an
  *  event listener function to receive generator warmup related events.
  * \param GeneratorRequiresShortWarmupEvent The callback function for short term warmup event.
  * \param GeneratorRequiresLongWarmupEvent  The callback function for long term warmup event.
  * \param GeneratorWarmupFinishedEvent      The callback function for warmup finished event.
  */
  void RegisterWarmupListeners( GeneratorRequiresShortWarmupEvent,
                                GeneratorRequiresLongWarmupEvent,
                                GeneratorWarmupFinishedEvent );



#endif