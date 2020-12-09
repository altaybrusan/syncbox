

// UART MAPPING
//#define ActivateGeneratorLine() UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle)
#define SendToGenerator(msg) UART1_Write(msg)
//#define ActivateActuatorLine() UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle)
#define SendToActuator(msg) UART2_Write(msg)
//#define ActivateWorkstationLine() UART_Set_Active(&UART3_Read, &UART3_Write, &UART3_Data_Ready, &UART3_Tx_Idle)
#define SendToWorkstation(msg) UART3_Write(msg)

#define SendDebugMsg(msg)  UART3_Write_Text(msg)
#define SendDebugChr(msg)  UART3_Write(msg)

// Pins are compatible with PIC Fusion v.7 devboard

// UART PIN MAP
#define MAP_U1RX 100
#define MAP_U1TX 101
#define MAP_U2RX 108
#define MAP_U2TX 109
#define MAP_U3RX 124
#define MAP_U3TX 125

// UART SPEED MAP
#define UART1_BITRATE 9600
#define UART1_CONF _UART_8BIT_NOPARITY
#define UART1_STOPBIT  _UART_TWO_STOPBITS
#define UART1_SPEED _UART_LOW_SPEED
#define UART2_BITRATE 9600
#define UART2_CONF _UART_8BIT_NOPARITY
#define UART2_STOPBIT  _UART_TWO_STOPBITS
#define UART2_SPEED _UART_LOW_SPEED
#define UART3_BITRATE 9600
#define UART3_CONF _UART_8BIT_NOPARITY
#define UART3_STOPBIT  _UART_TWO_STOPBITS
#define UART3_SPEED _UART_LOW_SPEED

// UART DELIMITER
#define UART2_DELIMITER 0x0d    // Gulmay Generator adds  CR to the end of each message
#define UART1_DELIMITER 0x0d

//SPEEKER PIN MAP
#define MAP_SPK_PIN 3
#define MAP_SPK_PORT &PORTD



//Timer1
//Prescaler 1:64; PR1 Preload = 21875; Actual Interrupt Time = 20 ms

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON         = 0x8020;
  T1IE_bit         = 1;
  T1IF_bit         = 0;
  IPC0                 = IPC0 | 0x1000;
  PR1                 = 21875;
}

void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
  T1IF_bit         = 0;
  //Enter your code here
  SendDebugMsg("\r DEMO");
}


void InitializePICSpeed()
{
  // Setting output frequency to 140MHz
  PLLFBD = 70;           // PLL multiplier M=70
  CLKDIV = 0x0000;       // PLL prescaler N1=2, PLL postscaler N2=2
}


void InitializePICPins()
{

  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;

  // for debug with LED
//  TRISA = 0;             // Initialize PORTA as output
//  TRISB = 0;             // Initialize PORTB as output
//  TRISC = 0;             // Initialize PORTC as output
//  TRISD = 0;             // Initialize PORTD as output
//  TRISF = 0;             // Initialize PORTE as output
//  TRISG = 0;             // Initialize PORTG as output

  PORTA=0x00;               // Set pins to zero volt
  PORTB=0x00;
  PORTC=0x00;
  PORTE=0x00;
  PORTF=0x00;
  PORTG=0x00;

}

/* Always call  InitializeUARTS after  InitializePICPins
 * because the interrupts are enabled inside this
 * this requires the pins set first
 */
void InitializeUARTS()
{
  // prepare UART serial port.

  // Point : RP100 DOES NOT MEAN PIN NUMBER 100 !!!

  PPS_Mapping(MAP_U1RX, _INPUT,  _U1RX);  // Sets pin RP100 (F4) to be Input, and maps U1RX to it
  PPS_Mapping(MAP_U1TX, _OUTPUT, _U1TX);  // Sets pin RP101 (F5) to be Output, and maps U1TX to it
  Delay_ms(200);


  PPS_Mapping(MAP_U2RX, _INPUT,  _U2RX);  // Sets pin RP108 (F12) to be Input, and maps U2RX to it
  PPS_Mapping(MAP_U2TX, _OUTPUT, _U2TX);  // Sets pin RP109 (F13)to be Output, and maps U2TX to it
  Delay_ms(200);

  PPS_Mapping(MAP_U3RX, _INPUT,  _U3RX);  // Sets pin RP108 (F12) to be Input, and maps U2RX to it
  PPS_Mapping(MAP_U3TX, _OUTPUT, _U3TX);  // Sets pin RP109 (F13)to be Output, and maps U2TX to it
  Delay_ms(200);


  UART1_Init_Advanced(UART1_BITRATE, _UART_8BIT_NOPARITY,_UART_TWO_STOPBITS,_UART_LOW_SPEED);
  Delay_ms(200);                    // Wait for UART module to stabilize


  UART2_Init_Advanced(UART2_BITRATE, UART2_CONF, UART2_STOPBIT,UART2_SPEED);
  Delay_ms(200);                  // Wait for UART module to stabilize

  UART3_Init_Advanced(UART3_BITRATE, UART3_CONF, UART3_STOPBIT,UART3_SPEED);
  Delay_ms(200);                  // Wait for UART module to stabilize


  //Enable RX UART interrupts
  U1RXIE_bit = 1; U2RXIE_bit = 1; U3RXIE_bit = 1;
  U1RXIF_bit = 0; U2RXIF_bit = 0; U3RXIF_bit = 0;

}

void InitializeBuzzer()
{
   Sound_Init(MAP_SPK_PORT, MAP_SPK_PIN);
}

void InitializeTimers()
{
   IPC0.B12=1;
   IPC0.B13=1;
   IPC0.B14=1;
}


void foo(){ Delay_ms(1000);}


void main() {

   InitializePICSpeed();
   InitializeUARTS();
   InitializeBuzzer();
   InitializeTimers();

     // Play boot successful beep
   Sound_Play(1600, 100);


   // test case: call delay after starting timer
   InitTimer1();
    foo();
   
   while(1);
   
   
}