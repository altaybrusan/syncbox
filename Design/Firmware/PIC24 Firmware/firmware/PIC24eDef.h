/**
 * \file PIC24eDef.h
 * \brief PIC24 related operations and preparations.
 * \details The functions are used during bootup by kernel. Maps are used by ConnectionMap.h
 * the pin numbers are compatible Easypic Fusion v7 devboard.
 */
#ifndef PIC24UTILITIES_H
#define PIC24UTILITIES_H

 #include "ConnectionMap.h"
 #include <stdbool.h>

 extern bool  ENABLE_SYNCBOX_SPEEKER = true;

 /**
  * \brief heap size.
  * \note start from 250 and increase. if you see some abnormal 
  * behavior reduce the heap size to 250 and try again.
  */
const HEAP_SIZE = 400;
 
/**
 * \brief initialize heap.
 */
void InitializeHeap()
 {
   MM_Init();
   Delay_ms(200);
 }

/**
 * \brief initialize pic micro-controller speed.
 */
void InitializePICSpeed()
{
  // Setting output frequency to 140MHz
  PLLFBD = 70;           // PLL multiplier M=70
  CLKDIV = 0x0000;       // PLL prescaler N1=2, PLL postscaler N2=2
}

/**
 * \brief initialize pic pins.
 */
void InitializePICPins()
{

  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;

  // for debug with LED
  //TRISA = 0;             // Initialize PORTA as output
  //TRISB = 0;             // Initialize PORTB as output
  //TRISC = 0;             // Initialize PORTC as output
  //TRISD = 0;             // Initialize PORTD as output
  //TRISF = 0;             // Initialize PORTE as output
  //TRISG = 0;             // Initialize PORTG as output

  PORTA=0x00;               // Set pins to zero volt
  PORTB=0x00;
  PORTC=0x00;
  PORTE=0x00;
  PORTF=0x00;
  PORTG=0x00;
  
}

/**
 * \brief initialize uarts
 * \note always call  InitializeUARTS after  InitializePICPins
 * because the interrupts are enabled inside and
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

  PPS_Mapping(MAP_U3RX, _INPUT,  _U3RX);  // Sets pin RP124 (F12) to be Input, and maps U2RX to it
  PPS_Mapping(MAP_U3TX, _OUTPUT, _U3TX);  // Sets pin RP125 (F13)to be Output, and maps U2TX to it
  Delay_ms(200);

  PPS_Mapping(MAP_U4RX, _INPUT,  _U4RX);  // Sets pin RP112 (F12) to be Input, and maps U2RX to it
  PPS_Mapping(MAP_U4TX, _OUTPUT, _U4TX);  // Sets pin RP113 (F13)to be Output, and maps U2TX to it
  Delay_ms(200);
  
  UART1_Init_Advanced(UART1_BITRATE, UART1_CONF,UART1_STOPBIT,UART1_SPEED);
  Delay_ms(200);                    // Wait for UART module to stabilize


  UART2_Init_Advanced(UART2_BITRATE, UART2_CONF, UART2_STOPBIT,UART2_SPEED);
  Delay_ms(200);                  // Wait for UART module to stabilize
  
  UART3_Init_Advanced(UART3_BITRATE, UART3_CONF, UART3_STOPBIT,UART3_SPEED);
  Delay_ms(200);                  // Wait for UART module to stabilize
  
  UART4_Init_Advanced(UART4_BITRATE, UART4_CONF, UART4_STOPBIT,UART4_SPEED);

  Delay_ms(200);                  // Wait for UART module to stabilize
  
  //Enable RX UART interrupts
  U1RXIE_bit = 1; U2RXIE_bit = 1; U3RXIE_bit = 1; U4RXIE_bit = 1;
  U1RXIF_bit = 0; U2RXIF_bit = 0; U3RXIF_bit = 0; U4RXIF_bit = 0;


}

/**
 * \brief update prioritize interrupts
 */
void PrioritizeInterrupts()
{
	IPC6.B14 = 0; IPC6.B13 = 0;  IPC6.B12 = 1;
	IPC7.B2 = 0;  IPC7.B1 = 0;   IPC7.B0 = 1;

	IPC1.B14 = 0; IPC1.B13 = 0;  IPC1.B12 = 1;
	IPC2.B2 = 0;  IPC2.B1 = 0;   IPC2.B0 = 1;
}

/**
* \brief initialize buzzer.
*/
void InitializeBuzzer()
{
   Sound_Init(MAP_SPK_PORT, MAP_SPK_PIN);
}

/**
* \brief initialize timers.
*/
void InitializeTimers()
{
   IPC0.B12=1;
   IPC0.B13=1;
   IPC0.B14=1;
}

#endif