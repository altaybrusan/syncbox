/*
 * Project name:
	 UARTA (Usage of UART libraries)
 * Copyright:
	 (c) Mikroelektronika, 2012.
 * Description:
	 This simple example demonstrates usage of mikroC's UART libraries, through
	 a 'loopback' interface. The data being sent to PIC24 through UART and sent back.
 * Test configuration:
	 MCU:             P24EP512GU810
					  http://ww1.microchip.com/downloads/en/DeviceDoc/70616F.pdf
	 Dev.Board:       EasyPIC Fusion v7 - ac:UARTA
					  http://www.mikroe.com/easypic-fusion/
	 Oscillator:      XT-PLL, 140.0000MHz
	 Ext. Modules:    None.
	 SW:              mikroC PRO for dsPIC
					  http://www.mikroe.com/mikroc/dspic/
 * NOTES:
	 - Turn ON UARTA switches at SW12. (board specific)
 */

 // connect LCD to mikro PIC. send commands to LCD get its responses and send
 // over serial port to the PC
 // UART PIN MAP
#define MAP_U1RX 100
#define MAP_U1TX 101
#define MAP_U2RX 108
#define MAP_U2TX 109
#define MAP_U3RX 124
#define MAP_U3TX 125

const int MIN_KVP = 30;
const int MAX_KVP = 120;
const int KVP_STP = 5;

const int MIN_mA = 1;
const int MAX_mA = 50;
const int mA_STP = 5;

const int MIN_TIME = 1;
const int MAX_TIME = 999;
const int TIME_STP = 10;

const int MIN_JOG = 100;
const int MAX_JOG = 800;
const int JOG_STP = 25;
void Init() {
	// Setting output frequency to 140MHz
	PLLFBD = 70;             // PLL multiplier M=70
	CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

	ANSELA = 0x00;           // Convert all I/O pins to digital
	ANSELB = 0x00;
	ANSELC = 0x00;
	ANSELD = 0x00;
	ANSELE = 0x00;
	ANSELG = 0x00;

	// UART1 goes to PC
	PPS_Mapping(100, _INPUT, _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
	PPS_Mapping(101, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it

	// UART2 goes to LCD
	PPS_Mapping(124, _INPUT, _U2RX);              // Sets pin RP100 to be Input, and maps U1RX to it
	PPS_Mapping(125, _OUTPUT, _U2TX);              // Sets pin RP101 to be Output, and maps U1TX to it


	//UART1_Init(9600);              // Initialize UART module at 56000 bps
	UART2_Init_Advanced(9600, _UART_8BIT_NOPARITY, _UART_TWO_STOPBITS, _UART_HI_SPEED);
	Delay_ms(500);                  // Wait for UART module to stabilize

	UART1_Init(9600);              // Initialize UART module at 56000 bps
	Delay_ms(500);                  // Wait for UART module to stabilize
}

// The commands tails are hard coded into the end of each command.
// unsigned char tail[4]={0xCC,0x33,0xC3,0x3C};

// DO NOT DO HANDSGAKING!
//unsigned char handshake[6]={0xAA,0x00,0xCC,0x33,0xC3,0x3C};

// FOR CONNECTION DEBUGE
//unsigned char openclock[15]={0xAA ,0x9B ,0xFF, 0x01 ,0x01 ,0x00 ,0x1F, 0x00, 0x0A, 0x00, 0x0A, 0xCC ,0x33, 0xC3, 0x3C};
//unsigned char closeclock[7]={ 0xAA ,0x9B ,0x00, 0xCC, 0x33 ,0xC3, 0x3C};

unsigned char selectpic[8] = { 0xAA,0x70,           // Header and command
							0x00,0x00,           //Picture number
							0xCC,0x33,0xC3,0x3C  // Tail
};

unsigned char  displayKVPCmd[25] = { 0xAA,0x98,               // Header and Command
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

unsigned char  displaymACmd[25] = { 0xAA,0x98,                 // Header and Command
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

unsigned char  displayTimeCmd[25] = { 0xAA,0x98,               // Header and Command
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

unsigned char  displayJOGCmd[25] = { 0xAA,0x98,                 // Header and Command
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
unsigned char displaySecCmd[13] = { 0xAA, 0x7C, 0x01,             // Header and command
							   0x00, 0x60, 0x01, 0x90,       // (x,y) keyboard coordinate
							   0x0C,                         // string length
							   0xC3,                         // Scale
							   0xCC, 0x33, 0xC3, 0x3C };      // Tail


unsigned char clearKVPBoxCmd[20] = { 0xAA,0x71,                    // Header and Command
							   0x00,0x0A,                    // source picture number
							   0x01,0x64,0x00,0x15,          // From (X,Y) of the source picture
							   0x01,0x9A,0x00,0x2D,          // To (X,y) of the source picture
							   0x01,0x64,0x00,0x15,          // copy to the this (x,y) of the current picure
							   0xCC,0x33,0xC3,0x3C };         // Tail

unsigned char clearmABoxCmd[20] = { 0xAA,0x71,                     // Header and Command
							0x00,0x0A,                    // source picture number
							0x01,0x64,0x00,0x30,          // From (X,Y) of the source picture
							0x01,0x9F,0x00,0x49,          // To (X,y) of the source picture
							0x01,0x64,0x00,0x30,          // copy to the this (x,y) of the current picure
							0xCC,0x33,0xC3,0x3C };         // Tail

unsigned char clearTimeBoxCmd[20] = { 0xAA,0x71,                   // Header and Command
							0x00,0x0A,                    // source picture number
							0x01,0x64,0x00,0x4B,          // From (X,Y) of the source picture
							0x01,0x9F,0x00,0x64,          // To (X,y) of the source picture
							0x01,0x64,0x00,0x4B,          // copy to the this (x,y) of the current picure
							0xCC,0x33,0xC3,0x3C };         // Tail

unsigned char clearJOGBoxCmd[20] = { 0xAA,0x71,                    // Header and Command
							0x00,0x0A,                    // source picture number
							0x01,0x64,0x00,0x66,          // From (X,Y) of the source picture
							0x01,0x9F,0x00,0x7E,          // To (X,y) of the source picture
							0x01,0x64,0x00,0x66,          // copy to the this (x,y) of the current picure
							0xCC,0x33,0xC3,0x3C };         // Tail

int index = 0;       // used in for-loop
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


// Update KVP,mA,Time and JOG commands' parameters values
void UpdateCommandParameter(unsigned char cmd[], int step)
{
	int _result = 0;
	unsigned char _newVal[7];
	memset(_newVal, '0', 7); // make sure temp. variable is clear

	_result = GetCommandParameter(cmd);
	_result += step;         // step up/down the number

	intToStr(_result, _newVal);      // change the space for with zero for empty string
  //  for(index=0;index<=2;index++)
  //   if(_newVal[index+3]== 0x20)
  //      _newVal[index+3] = 0x30;

	cmd[14] = _newVal[3];    // first digits new value
	cmd[16] = _newVal[4];    // second digits new value
	cmd[18] = _newVal[5];    // third digit new value
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
	for (index = 0; index < 25; index++)
	{
		UART2_Write(displayKVPCmd[index]);
	}
}

void DisplaymA()
{
	for (index = 0; index < 25; index++)
	{
		UART2_Write(displaymACmd[index]);
	}
}
void DisplayTime()
{
	for (index = 0; index < 25; index++)
	{
		UART2_Write(displayTimeCmd[index]);
	}
}
void DisplayJOG()
{
	for (index = 0; index < 25; index++)
	{
		UART2_Write(displayJOGCmd[index]);
	}
}

void ClearKVPBox()
{
	for (index = 0; index < 20; index++)
	{
		UART2_Write(clearKVPBoxCmd[index]);
	}
}
void ClearmABox()
{
	for (index = 0; index < 20; index++)
	{
		UART2_Write(clearmABoxCmd[index]);
	}
}

void ClearTimeBox()
{
	for (index = 0; index < 20; index++)
	{
		UART2_Write(clearTimeBoxCmd[index]);
	}
}

void ClearJOGBox()
{
	for (index = 0; index < 20; index++)
	{
		UART2_Write(clearJOGBoxCmd[index]);
	}
}


void InitParameterBoard()
{
	DisplayKVP();
	DisplaymA();
	DisplayTime();
	DisplayJOG();
}

void ProcessMessage(unsigned char* message)//,int mLen)
{
	unsigned char _temp[8];
	int index = 0, paramVal = 0;


	// example message to be processed: 0xAA 0x78 0x00 0x02 0xCC 0x33 0xC3 0x3C
	unsigned char btncode = message[3]; // bytes 2 and 3 are pressed button code. \
                                           // in our application we use just byte 3
	unsigned char cmdcode = message[1];

	switch (cmdcode)
	{
	case 0x7C:
		// user entered the password, check it here

		if ((int)message[3] == 4) // paasword length is 4
		{
			// assume password is 2018 = 0x32 0x030 0x31 0x38
			if (message[4] == 0x32 && message[5] == 0x30
				&& message[6] == 0x312 && message[7] == 0x38)
			{
				unsigned char _temp[8]; // backup the selectpic
				memset(selectpic, _temp, 8);

				_temp[4] = 0x0F; // successful login
				for (index = 0; index < 8; index++)
				{
					UART2_Write(_temp[index]);
				}

			}

		}
		else
		{
			// Show main window
			for (index = 0; index < 8; index++)
			{
				UART2_Write(selectpic[index]);
			}
		}

		break;

	case 0x78:
		// a button is pressed
		switch (btncode)
		{
		case 0x01:
			// go to automatic mode
			break;
		case 0x02:
			// display password dialog
			for (index = 0; index < 13; index++)
			{
				UART2_Write(displaySecCmd[index]);
			}
			break;
		case 0x03:
			// return back to main menu inside automatic mode.
			break;

		case 0x04:
			// warmup pressed
			memcpy(_temp, selectpic, 8);
			_temp[3] = 0x0A; // successful login
			for (index = 0; index < 8; index++)
			{
				UART2_Write(_temp[index]);
			}
			InitParameterBoard(); // show the values; for test
			break;

		case 0x05:
			// return to main menu inside service mode.
			break;

		case 0x06:
			// start button is pressed
			break;
		case 0x07:
			// stop button is pressed
			break;

		case 0x10:
			// increase kvp
			 // TODO: GetCommandParameter is called two times. avoid it!

			paramVal = GetCommandParameter(displayKVPCmd);
			if ((paramval + KVP_STP) <= MAX_KVP)
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
				UpdateCommandParameter(displayTimeCmd, KVP_STP);
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
			if (MIN_KVP <= (paramval - KVP_STP))
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
static unsigned char _receiveBuff[40];
static int mLen = 0; // message length
void UART2MessageReceiveHandler() iv IVT_ADDR_U2RXINTERRUPT {
	U2RXIF_bit = 0;

	if (UART2_Data_Ready())
	{
		unsigned char _receivedChar = UART2_Read();
		_receiveBuff[mLen] = _receivedChar;
		UART1_write(_receiveBuff[mLen]); // write to PC
		mLen++;
	}
	if (CheckMessageFinished(_receiveBuff, mLen) != 0)
	{
		ProcessMessage(_receiveBuff);
		memset(_receiveBuff, '\0', 40);
		mLen = 0;
	}

	if (U2STA.OERR = 1)
	{
		U2STA.OERR = 0;
		U2STA.FERR = 0;
	}
}



void main() {

	Init();

	UART1_Write_Text("\rStart\r");
	Delay_ms(200);

	U2RXIE_bit = 1;
	U2RXIE_bit = 1;
	U2RXIF_bit = 0;

	//Show main window
	for (index = 0; index < 8; index++)
	{
		UART2_Write(selectpic[index]);
	}

	index = 0;
	memset(_receiveBuff, '\0', 40);



	// DUMMY UPDATE: remove precedding zeros
	// (0XX), (XX)
	UpdateCommandParameter(displayKVPCmd, 0);
	UpdateCommandParameter(displaymACmd, 0);
	UpdateCommandParameter(displayJOGCmd, 0);
	UpdateCommandParameter(displayTimeCmd, 0);



	while (1) {                     // Endless loop

	}

	// Test  clock: For Debugging
	//   for( index =0;index<7 ;index++)
	//   {
	//    UART1_Write(closeclock[index]);
	//   }
	//   Delay_ms(5000);
	//   for( index =0;index<15 ;index++)
	//   {
	//    UART1_Write(openclock[index]);
	//   }
	//   Delay_ms(15000);
}