#if build==debug
#include "ConnectionMap.h"  // just for debug
#endif
#include "Kernel.h"
#include "StoneAPI.h"
#include "GulmayAPI.h"


//***************************** Constants & Values **************************************
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

//******************************** Event handlers ****************************************

StartAutomaticModeSessionEvent    _automaticModeLst = 0;
GotoHomeEvent                     _gotoHomeLst = 0;
StartExposureEvent                _startExposureLst = 0;
StopExposureEvent                 _stopExposureLst = 0;
StartWarmupEvent                  _startwarmupLst = 0;
UpdateKvpEvent                    _updateKvpLst = 0;
UpdatemAEvent                     _updatemALst = 0;
UpdateTimeEvent                   _updateTimeLst = 0;
UpdateJOGEvent                    _updateJogLst = 0;

//********************************  Stone LCD API *****************************************

// The commands tails are hard coded into the end of each command.
// unsigned char tail[4]={0xCC,0x33,0xC3,0x3C};

// DO NOT DO HANDSHAKE!
//unsigned char handshake[6]={0xAA,0x00,0xCC,0x33,0xC3,0x3C};

// FOR DEBUGING
//unsigned char openclock[15]={0xAA ,0x9B ,0xFF, 0x01 ,0x01 ,0x00 ,0x1F, 0x00, 0x0A, 0x00, 0x0A, 0xCC ,0x33, 0xC3, 0x3C};
//unsigned char closeclock[7]={ 0xAA ,0x9B ,0x00, 0xCC, 0x33 ,0xC3, 0x3C};

//The default value of selectPicture is manin window
unsigned char  selectPicture[8] = {                       0xAA,0x70,           // Header and command
                                                          0x00,0x00,           //Picture number
                                                          0xCC,0x33,0xC3,0x3C  // Tail
};

unsigned char  displayKVPCmd[25] = {                      0xAA,0x98,               // Header and Command
                                                          0x01,0x64,0x00,0x15,     // x & y coordinate
                                                          0x03,                    // Font Id
                                                          0x85,                    // Color display mode 0x85: just forground
                                                          0x04,                    // Dot matrix size (font size?!)
                                                          0x00,0x00,               // Foreground color
                                                          0xFF,0xFF,               // Background color
                                                          0x00,0x30,               // Digit 1
                                                          0x00,0x38,               // Digit 2
                                                          0x00,0x30,               // Digit 3
                                                          0xCC,0x33,0xC3,0x3C };    // Tail

unsigned char  displaymACmd[25] = {                       0xAA,0x98,                 // Header and Command
                                                          0x01,0x64,0x00,0x30,       // x & y coordinate
                                                          0x03,                      // Font Id
                                                          0x85,                      // Color display mode 0x85: just forground
                                                          0x04,                      // Dot matrix size (font size?!)
                                                          0x00,0x00,                 // Foreground color
                                                          0xFF,0xFF,                 // Background color
                                                          0x00,0x30,                 // Digit 1
                                                          0x00,0x32,                 // Digit 2
                                                          0x00,0x35,                 // Digit 3
                                                          0xCC,0x33,0xC3,0x3C };      // Tail

unsigned char  displayTimeCmd[25] = {                     0xAA,0x98,               // Header and Command
                                                          0x01,0x64,0x00,0x4B,     // x & y coordinate
                                                          0x03,                    // Font Id
                                                          0x85,                    // Color display mode 0x85: just forground
                                                          0x04,                    // Dot matrix size (font size?!)
                                                          0x00,0x00,               // Foreground color
                                                          0xFF,0xFF,               // Background color
                                                          0x00,0x30,               // Digit 1
                                                          0x00,0x31,               // Digit 2
                                                          0x00,0x30,               // Digit 3
                                                          0xCC,0x33,0xC3,0x3C };    // Tail

unsigned char  displayJOGCmd[25] = {                      0xAA,0x98,                 // Header and Command
                                                          0x01,0x64,0x00,0x66,       // x & y coordinate
                                                          0x03,                      // Font Id
                                                          0x85,                      // Color display mode 0x85: just forground
                                                          0x04,                      // Dot matrix size (font size?!)
                                                          0x00,0x00,                 // Foreground color
                                                          0xFF,0xFF,                 // Background color
                                                          0x00,0x34,                 // Digit 1
                                                          0x00,0x30,                 // Digit 2
                                                          0x00,0x30,                 // Digit 3
                                                          0xCC,0x33,0xC3,0x3C };      // Tail

// display security menu
unsigned char displaySecCmd[13] = {                       0xAA, 0x7C, 0x01,             // Header and command
                                                          0x00, 0x60, 0x01, 0x90,       // (x,y) keyboard coordinate
                                                          0x0C,                         // string length
                                                          0xC3,                         // Scale
                                                          0xCC, 0x33, 0xC3, 0x3C };      // Tail

unsigned char clearKVPBoxCmd[20] = {                      0xAA,0x71,                    // Header and Command
                                                          0x00,0x0A,                    // source picture number
                                                          0x01,0x64,0x00,0x15,          // From (X,Y) of the source picture
                                                          0x01,0x9A,0x00,0x2D,          // To (X,y) of the source picture
                                                          0x01,0x64,0x00,0x15,          // copy to the this (x,y) of the current picure
                                                          0xCC,0x33,0xC3,0x3C };         // Tail

unsigned char clearmABoxCmd[20] = {                       0xAA,0x71,                     // Header and Command
                                                          0x00,0x0A,                    // source picture number
                                                          0x01,0x64,0x00,0x30,          // From (X,Y) of the source picture
                                                          0x01,0x9F,0x00,0x49,          // To (X,y) of the source picture
                                                          0x01,0x64,0x00,0x30,          // copy to the this (x,y) of the current picure
                                                          0xCC,0x33,0xC3,0x3C };         // Tail


unsigned char clearTimeBoxCmd[20] = {                     0xAA,0x71,                   // Header and Command
                                                          0x00,0x0A,                    // source picture number
                                                          0x01,0x64,0x00,0x4B,          // From (X,Y) of the source picture
                                                          0x01,0x9F,0x00,0x64,          // To (X,y) of the source picture
                                                          0x01,0x64,0x00,0x4B,          // copy to the this (x,y) of the current picure
                                                          0xCC,0x33,0xC3,0x3C };         // Tail

unsigned char clearJOGBoxCmd[20] = {                      0xAA,0x71,                    // Header and Command
                                                          0x00,0x0A,                    // source picture number
                                                          0x01,0x64,0x00,0x66,          // From (X,Y) of the source picture
                                                          0x01,0x9F,0x00,0x7E,          // To (X,y) of the source picture
                                                          0x01,0x64,0x00,0x66,          // copy to the this (x,y) of the current picure
                                                          0xCC,0x33,0xC3,0x3C };         // Tail

//**************************** Event handler  *****************************************
/* the original naming was CallKernekSendService, but
* inside each API we have to change the name. Otherwise
* C-compiler issues redefined function error.
*/
void DisplayCallKernelSendService(char* message, FRAME_TYPE type, int length)
{
        KERNEL_FRAME _frame;
        //int index = 0;
        _frame.F_SENDER = DISPLAY;
        _frame.F_RECEIVER = DISPLAY;
        _frame.F_TYPE = type;

        _frame.FRAME_MESSAGE = message;
        _frame.MESSAGE_LENGTH = length;
        _frame.F_PRIORITY = NORMAL_FRAME;
        KL_SendFrame(&_frame);
}

//**************************** Private functions **************************************
int _idx = 0;       // used inside for-loops
int result = 0;

int GetCommandParameter(unsigned char cmd[])
{
        unsigned char _digits[3];

        _digits[0] = cmd[14];   // read the first byte of the first digit
        _digits[1] = cmd[16];   // read the first byte of the second digit
        _digits[2] = cmd[18];   // read the first byte of the third digit

        result = atoi(_digits); // convert digits to the intiger

        return result;
}

int _result = 0;
// Update KVP,mA,Time and JOG commands' parameters values
void UpdateCommandParameter(unsigned char cmd[], int step)
{
        unsigned char _newValue[7];
        memset(_newValue, '0', 7); // make sure temp. variable is clear

        _result = GetCommandParameter(cmd);
        _result += step;         // step up/down the number

        intToStr(_result, _newValue);      // change the space for with zero for empty string


        cmd[14] = _newValue[3];    // first digits new value
        cmd[16] = _newValue[4];    // second digits new value
        cmd[18] = _newValue[5];    // third digit new value
}

int CheckMessageFinished(unsigned char* buffer, int mLen)
{

        if (mLen < 4)
                return 0;

        //frame tail : 0xCC,0x33,0xC3,0x3C
        if (buffer[mLen - 4] == 0xCC && buffer[mLen - 3] == 0x33 &&
                buffer[mLen - 2] == 0xC3 && buffer[mLen - 1] == 0x3C)
        {
                return 1; //true
        }
        return 0; // false
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

        // example message to be processed: 0xAA 0x78 0x00 0x02 0xCC 0x33 0xC3 0x3C
        unsigned char btncode = message[3]; // bytes 2 and 3 are pressed button code. \
                                                                                                                           // in our application we use just byte 3
        unsigned char cmdcode = message[1];

        switch (cmdcode)
        {
        case 0x7C:
                // user entered the password, check it here

                if ((int)message[3] == 4) // password length is 4
                {
                        // assume password is 2018 = 0x32 0x030 0x31 0x38
                        if (message[4] == 0x32 && message[5] == 0x30
                                && message[6] == 0x312 && message[7] == 0x38)
                        {
                             // TODO: there is issue with api. I could not find a way to
                             //       change the image here!!!
                             //unsigned char _selectPictureCopy[8]; // backup the selectPicture
                             //memcpy(_selectPictureCopy, selectPicture, 8);
                             //_selectPictureCopy[3] = 0x0B; // successful login
                             //DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
                        }

                }
                else
                {
                        // Show main window. 
                        DisplayCallKernelSendService(selectPicture, NORMAL_FRAME, 8);
                }

                break;

        case 0x78:
                // a button is pressed
                switch (btncode)
                {
                case 0x01:
                        // go to automatic mode
                        if (_automaticModeLst != 0)
                                _automaticModeLst();
                        break;
                case 0x02:
                        // display password dialog
                        DisplayCallKernelSendService(displaySecCmd, NORMAL_FRAME, 13);
                        break;
                case 0x03:
                        // return back to main menu inside automatic mode.
                                                if (_gotoHomeLst != 0)
                                                        _gotoHomeLst();
                                                break;
                        break;

                case 0x04:
                        // warmup pressed
                        memcpy(_selectPictureCopy, selectPicture, 8);
                        //_selectPictureCopy[3] = 0x0A; // successful login
                        //DisplayCallKernelSendService(_selectPictureCopy, NORMAL_FRAME, 8);
                        //InitParameterBoard(); // show the values; 
                                                if (_startwarmupLst != 0)
                                                {
                                                        _startwarmupLst();
                                                }
                                                break;

                case 0x05:
                        // return to main menue.
                        if (_gotoHomeLst != 0)
                                                        _gotoHomeLst();
                        break;

                case 0x06:
                        // start button is pressed
                        // inform the latest parameters
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
                        // start exposure                
                        if (_startExposureLst != 0)
                                _startExposureLst();
                        break;
                case 0x07:
                        // stop button is pressed
                        if (_stopExposureLst != 0)
                                _stopExposureLst();
                        break;

                case 0x10:
                        // increase kvp
                        // TODO: GetCommandParameter is called two times. avoid it!

                        paramVal = GetCommandParameter(displayKVPCmd);
                        if ((paramval + KVP_STP) <= MAX_KVP_VAL)
                        {

                                UpdateCommandParameter(displayKVPCmd, KVP_STP);
                                ClearKVPBox();
                                DisplayKVP();
                        }

                        break;
                case 0x11:
                        // increase ma
                        paramVal = GetCommandParameter(displaymACmd);
                        if ((paramval + mA_STP) <= MAX_mA)
                        {
                                UpdateCommandParameter(displaymACmd, mA_STP);
                                ClearmABox();
                                DisplaymA();
                        }
                        break;
                case 0x12:
                        // increase time
                        paramVal = GetCommandParameter(displayTimeCmd);
                        if ((paramval + Time_STP) <= MAX_Time)
                        {
                                UpdateCommandParameter(displayTimeCmd, Time_STP);
                                ClearTimeBox();
                                DisplayTime();
                        }
                        break;
                case 0x13:
                        //increase jog
                        paramVal = GetCommandParameter(displayJOGCmd);
                        if ((paramval + JOG_STP) <= MAX_JOG)
                        {

                                UpdateCommandParameter(displayJOGCmd, JOG_STP);
                                ClearJOGBox();
                                DisplayJOG();
                        }
                        break;
                case 0x14:
                        // decrease kvp
                        paramVal = GetCommandParameter(displayKVPCmd);
                        if (MIN_KVP_VAL <= (paramval - KVP_STP))
                        {
                                UpdateCommandParameter(displayKVPCmd, -1 * KVP_STP);
                                ClearKVPBox();
                                DisplayKVP();
                        }
                        break;
                case 0x15:
                        // decrease ma
                        paramVal = GetCommandParameter(displaymACmd);
                        if (MIN_mA <= (paramval - mA_STP))
                        {
                                UpdateCommandParameter(displaymACmd, -1 * mA_STP);
                                ClearmABox();
                                DisplaymA();
                        }
                        break;
                case 0x16:
                        // decrease time
                        paramVal = GetCommandParameter(displayTimeCmd);
                        if (MIN_Time <= (paramval - Time_STP))
                        {
                                UpdateCommandParameter(displayTimeCmd, -1 * Time_STP);
                                ClearTimeBox();
                                DisplayTime();
                        }
                        break;
                case 0x17:
                        // decrease jog
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


//**************************** Public functions ***************************************

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
static int mLen = 0; // message length
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
        // DUMMY UPDATE: remove precedding zeros
        // (0XX), (XX)
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

//****************************** Register event handlers ********************************
 
 void RegisterStartAutomaticModeSessionListener(StartAutomaticModeSessionEvent automaticModeLst)
 {
      _automaticModeLst =  automaticModeLst;
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