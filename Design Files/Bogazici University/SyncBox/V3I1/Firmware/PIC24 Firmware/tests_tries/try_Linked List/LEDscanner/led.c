/**
 * File:
 *  led.c
 *
 * Notes:
 *  This file contains the implementation for LED control.  see led.h for
 *  more detailed information.
 *
 * History:
 *  17/01/2013 Written by Simon Platten
 */
#include "led.h"
/**
 * Set-up LED control structure
 *  pLED, an instance of LEDctrlDef to set-up
 *  pPort, the I/O port containing the LED(s)
 *  bytIOmask, the I/O mask containing the LED(s) to use
 */
void setupLEDcontrol(LEDctrlDef* pLED, ushort* pPort, byte bytIOmask) {
// Validate parameters
  if ( !(pLED && pPort && bytIOmask) ) {
// One or both parameters are invalid abort
    return;
  }
  pLED->pPort = pPort;
  pLED->bytIOmask = bytIOmask;
}