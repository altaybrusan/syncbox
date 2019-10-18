/**
 * File:
 *  main.c
 *
 * Notes:
 *  This file contains a simple LED scanner example for the PIC16F887
 *
 * History:
 *  17/01/2013 Written by Simon Platten
 */
#include "ll.h"
#include "led.h"

#define NUM_OF_LEDS 8
// The scanner linked list
static linkListDef nodes[NUM_OF_LEDS];
static LEDctrlDef LEDs[NUM_OF_LEDS];
static linkListDef* pCurrent;
volatile LEDctrlDef* pLED;
volatile int intDir;
/**
 * Set-up Timer1 for 250ms
 */
void initTimer1() {
// Timer 1, 100ms
  T1CON	     = 0x21;
  TMR1IF_bit = 0;
  TMR1H	     = 0x3C;
  TMR1L	     = 0xAD;
  TMR1IE_bit = 1;
  INTCON	    = 0xC0;
}
/**
 * Interrupt handler
 */
void Interrupt() {
  if (TMR1IF_bit) {
    TMR1IF_bit = 0;
    TMR1H	     = 0x3C;
    TMR1L	     = 0xAD;
// Invert the state of the LEDs
    pLED = (LEDctrlDef*)(pCurrent->pData);
    *(pLED->pPort) ^= pLED->bytIOmask;
// Next node
    if ( intDir == 0 ) {
      if ( pCurrent->pNext ) {
        pCurrent = pCurrent->pNext;
      } else {
        intDir = 1;
      }
    } else if ( intDir == 1 ) {
      if ( pCurrent->pPrev ) {
        pCurrent = pCurrent->pPrev;
      } else {
        intDir = 0;
      }
    }
  }
}
/**
 * Application entry point
 */
void main() {
// Prepare link list
  int i;
  for( i=0; i<NUM_OF_LEDS; i++ ) {
    setupLEDcontrol(&LEDs[i], &PORTD, (1 << i));
    addNode(&nodes[0], &nodes[i], &LEDs[i]);
  }
// Initialise the current node
  pCurrent = &nodes[0];
  intDir = 0;
// Set-up port D and internal clock
  TRISD  = 0;           // set direction to be output
  PORTD  = 0x0;         // Make sure output is cleared
  OSCCON = 0b01110000; // p64 of datasheet, 8Mhz
// Initialise and set-up Timer1
  initTimer1();
}