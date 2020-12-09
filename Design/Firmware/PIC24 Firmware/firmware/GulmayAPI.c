// Abbrivation: lst: Listener
#include"GulmayAPI.h"
#include"Kernel.h"
#include"jsmn.h"
#if build==debug
#include"ConnectionMap.h"
#endif
const int MAX_KVP = 120;
const int MIN_KVP = 40;
const int MAX_mAMP = 100;
const int MIN_mAMP = 1;
const int MIN_EXPOSURE_TIME = 1;
const int MAX_EXPOSURE_TIME = 100;

// accept just one observer.
// TODO: implement publisher &  subscriber

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
        GeneratorWarmupFinishedEvent  warmupFinishedLst)
{
        _warmupFinishedLst = warmupFinishedLst;
        _shortWarmupIsRequiredLst = shortWarmupIsRequiredLst;
        _longWarmupIsRequiredLst = longWarmupIsRequiredLst;
}


void CallKernelSendService(char* message, FRAME_TYPE type)
{
        KERNEL_FRAME _frame; //= { 0,0,0,0,0,0 };
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
                // starting and stoping  exposure requires realtime frames.
                _frame.F_PRIORITY = REALTIME_FRAME;
        }
        else
        {  
			// the other commands are normal frames
            _frame.F_PRIORITY = REALTIME_FRAME;
        }

        KL_SendFrame(&_frame);
}


/*
 * Function Name:
 *   IntToThreeDigitString
 * Description:
 *   Private function. Specifically designed for Gulmay Generator API.
 * Arguments:
 *   param: the value to be converted.
 *   destination: C-style return function
 * Returns:
 *   void
 * NOTES:
 *   this function is prrivate
 */
void IntToThreeDigitString(int param, char* destination)
{
        char _buffer[7] = { ' ',' ',' ',' ',' ',' ',' ' };
        IntToStrWithZeros(param, _buffer);
        destination[0] = _buffer[3];
        destination[1] = _buffer[4];
        destination[2] = _buffer[5];
        return;
}

/*!
 * Gulmay generator replies have special formats :
 * [COMMAND_SIGN|REQUEST_SIGN][PARAMETER_1_VALUE] (e.g. ?T000 or !T010)
 * [COMMAND_SIGN|REQUEST_SIGN][PARAMETER_1],[PARAMETER_1_VALUE] (e.g ?P888,1)
 * [COMMAND_SIGN|REQUEST_SIGN][PARAMETER_1_VALUE],[PARAMETER_2_VALUE],[PARAMETER_3_VALUE] (e.g ?X000,000,005)
 * This function extracts 'index ( i.e. parameter 2) from the generator 'reply-string'
 * returns -1 if the substring is not valid.
 */
int StringToInteger(char* str, int index)
{

        static char _temp[4] = { ' ',' ',' ','\0' };  //C-string needs the null termination char
        memset(_temp,' ', 3); //clear static buffer contents.

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
                _cmd[5] = '\r';  // append carrage return to the end of command
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
                _cmd[5] = '\r';  // append carrage return to the end of command
                _cmd[6] = '\0';   //C-style terminating string

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
                _cmd[5] = '\r';  // append carrage return to the end of command
                _cmd[6] = '\0';  // C-style terminating
                CallKernelSendService(_cmd, UNSTRUCTURED);
        }
}

/*!
 * Start Exposure
 */
void StartExposure()
{
        char _cmd[4] = { '!','X','\r','\0' };
        CallKernelSendService(_cmd, UNSTRUCTURED);
}

/*!
 * Stop Exposure
 */
void StopExposure()
{
        char _cmd[4] = { '!','O','\r', '\0' };
        //memset(_cmd,' ',4);
        //memcpy(_cmd,"!O\r",4);
        //_cmd[4] = '\0';  // C-style terminating
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
        _cmd[4] = '\0';  // C-style terminating
        CallKernelSendService(_cmd, UNSTRUCTURED);
        return;
}

void StartLongTermWarmup()
{
        char _cmd[7] = { '!','P','1','0','1','\r','\0' };
        CallKernelSendService(_cmd, UNSTRUCTURED);

        memset(_cmd, ' ', 6);
        memcpy(_cmd, "!X\r", 3);
        _cmd[4] = '\0'; // C-Style string termination
        CallKernelSendService(_cmd, UNSTRUCTURED);
}


/*!
 * Generator has four mode:
 * <table>
 * <caption id="gulmaymodes">Gulmay generator modes</caption>
 * <tr><th> mode <th> Description
 * <tr><td>  0  <td> No Activity
 * <tr><td>  1  <td> key in position 2
 * <tr><td>  2  <td> prewarming
 * <tr><td>  3  <td> x-ray switching on or off
 * <tr><td>  4  <td> x-ray on and exposure being logged
 */
void QueryGeneratorMode()
{
        char _modecmd[4] = { '?','M','\r','\0' };
        CallKernelSendService(_modecmd, UNSTRUCTURED);
}

/*!
 * Query the generator for exposure parameters, i.e. current KVP, mA, time
 * It runs on UI thread.
 */
void QueryExposureParameters()
{
        char _cmd[4] = { '?','X','\r','\0' };
        CallKernelSendService(_cmd, UNSTRUCTURED);
}

/*!
 * Process the generator responses and issue corresponding events.
 */
void GeneratorProcessKernelFrame(KERNEL_FRAME frame)
{

#if build==debug
        //SendDebugMsg("\r•GULMAY FRAME HANDLER.");
#endif

        if (strchr(frame.FRAME_MESSAGE, 'M'))
        {
                // last command was mode related
                int _mod = 0;
                _mod = StringToInteger(frame.FRAME_MESSAGE, 1);

                if (_modeLst != 0 && _mod != -1)
                {
                        //callback function is registered
                        _modeLst(_mod);
                }
        }

        if (strstr(frame.FRAME_MESSAGE, "!O"))
        {
                // is it good to inform this to workstation?
                if (_exposureStopedLst != 0)
                {
                        //Listener function is listening, call it
                        _exposureStopedLst();
                }
                return;
        }

        if (strchr(frame.FRAME_MESSAGE, 'V'))
        {
                int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
                if (_kvpValueLst != 0 && _val != -1)
                {
                        //callback function is registered
                        _kvpValueLst(_val);
                }
        }

        if (strchr(frame.FRAME_MESSAGE, 'I'))
        {
                int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
                if (_ampValueLst != 0 && _val != -1)
                {
                        //callback function is registered
                        _ampValueLst(_val);
                }
        }
        if (strstr(frame.FRAME_MESSAGE, "?T"))
        {
                int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
                if (_passedExposureTimeLst != 0 && _val != -1)
                {
                        //callback function is registered
                        _passedExposureTimeLst(_val);
                }
        }
        if (strstr(frame.FRAME_MESSAGE, "!T"))
        {
                int _val = StringToInteger(frame.FRAME_MESSAGE, 1);
                if (_shootTimeLst != 0 && _val != -1)
                {
                        //callback function is registered
                        _shootTimeLst(_val);
                }
        }
        if (strstr(frame.FRAME_MESSAGE, "!X"))
        {
                if (_exposureStartedLst != 0)
                {
                        //callback function is registered
                        _exposureStartedLst();
                }
                return;
        }

        if (strchr(frame.FRAME_MESSAGE, 'E'))
        {
                if (strcmp(frame.FRAME_MESSAGE, "?E") == 0) // here zero means two strings are equal
                {
                        // no error
                }
                else
                {
                        // error happened
                        //StopExposure(); // Gulmay generator automatically do this!
                }

                if (_errorLst != 0)
                {
                        //callback function is registered
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
                        //callback function is registered
                        _kvpValueLst(_KVP);
                }
                if (_ampValueLst != 0 && _mA != -1)
                {
                        //callback function is registered
                        _ampValueLst(_mA);
                }
                if (_shootTimeLst != 0 && _Time != -1)
                {
                        //callback function is registered
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
                                //callback function is registered
                                _warmupFinishedLst();
                        }
                        break;
                case 100:
                        if (_shortWarmupIsRequiredLst != 0 && _result != -1)
                        {
                                //callback function is registered
                                _shortWarmupIsRequiredLst();
                        }
                        break;
                case 101:
                        if (_longWarmupIsRequiredLst != 0 && _result != -1)
                        {
                                //callback function is registered
                                _longWarmupIsRequiredLst();
                        }
                        break;
                }
        }
        if (strstr(frame.FRAME_MESSAGE, "?FB"))
        {
                if (_largFocalSpotSizeTriggeredLst != 0)
                {
                        //callback function is registered
                        _largFocalSpotSizeTriggeredLst();
                }
                return;
        }
        if (strstr(frame.FRAME_MESSAGE, "?FF"))
        {
                if (_SmallFocalSpotSizeTriggeredLst != 0)
                {
                        //callback function is registered
                        _SmallFocalSpotSizeTriggeredLst();
                }

        }

        return;
}

/*!
 * Asks for most appropriate warmup program
 * <table>
 * <caption id="gulmaywarmups">Gulmay generator warmup programs</caption>
 * <tr><th> mode <th> Description
 * <tr><td>  000  <td> no warmup
 * <tr><td>  101  <td> short wamup
 * <tr><td>  102  <td> long warmup
 */
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

/*!
 * In this mode user can adjust KVP,mA and Sec.
 * \note setting to an arbitrary exposure protocol (KVP,mA,Time)
 * DOES NOT necessary means those values will be applied during REAL exposure.
 * One should check the applied exposure by ?X command.
 */
void SetGeneratorInUserMode()
{
        char _cmd[7] = { '!','P','0','0','2','\r','\0' };
        CallKernelSendService(_cmd, UNSTRUCTURED);
}

void SuppressErrorsVoltageAndAmpError()
{
        // Engineering Flags on
        char _cmd[11] = { ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ' };
        memcpy(_cmd, "!P902\r", 6);
        _cmd[7] = '\0';
        CallKernelSendService(_cmd, UNSTRUCTURED);

        // Engineering Auto restart function on three times in five min
        memset(_cmd, ' ', 11);
        memcpy(_cmd, "!P978,3,5\r", 10);
        _cmd[11] = '\0';
        CallKernelSendService(_cmd, UNSTRUCTURED);

        // Just for debuging: check the Eninering flag
        memset(_cmd, ' ', 11);
        memcpy(_cmd, "?P888\r", 6);
        CallKernelSendService(_cmd, UNSTRUCTURED);

        // Just for debuging: count the retry to restart
        memset(_cmd, ' ', 11);
        memcpy(_cmd, "?P978\r", 6);
        _cmd[7] = '\0';
        CallKernelSendService(_cmd, UNSTRUCTURED);
}

/*!
 * Ask generator for any error
 */

void CheckGeneratorErrors()
{
        char _cmd[4] = { '?','E','\r','\0' };
        CallKernelSendService(_cmd, UNSTRUCTURED);
}

/*!
 * Ask the generator how much time has been passed from exposure.
 */
void QueryEllapsedExposureTime()
{
        char _cmd[4] = { '?','T','\r','\0' };
        CallKernelSendService(_cmd, UNSTRUCTURED);
}

void ResetGenerator()
{
        //Step 1: Control Errors
        CheckGeneratorErrors();
        Delay_ms(20);

        // Step 2: Turn off exposure
        StopExposure();
        Delay_ms(20);

        //Step 3: suppress errors such as E18,E19
        //   SuppressErrorsVoltageAndAmpError();

        //  //Step 4: Set to manual Program mode
        //SetGeneratorInUserMode();

        // Step 5: Get Exposure Parameters
        QueryExposureParameters();
        Delay_ms(20);
        
        // Step 6: Get Focal spot size
        QueryFocalSpotSize();
        Delay_ms(20);
        
        //Step 7: Get Generator mode
        QueryGeneratorMode();
        Delay_ms(20);
        
        //Step 8: Query Warmup program
        QueryWarmupProgram();
        Delay_ms(20);
}