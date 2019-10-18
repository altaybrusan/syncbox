/**
 * File:
 *  led.h
 *
 * Notes:
 *  This file contains the prototypes and datatype definitions for LED control.
 *
 * Structure:
 *  LEDctrlDef, this type is used for controlling a single LED
 *
 * Members:
 *
 * Functions:
 *
 * History:
 *  17/01/2013 Written by Simon Platten
 */
#ifndef LEDCTRL_H
  #define LEDCTRL_H
// Define short hand type definitions
#ifndef ushort
  typedef unsigned short ushort;
#endif
#ifndef byte
  typedef unsigned char byte;
#endif
// LED control structure
  typedef struct {
    ushort* pPort;          // The port the LED is attached to
    byte    bytIOmask;      // The pins to effect, 1, 2, 4, 8, 16 etc.
  } LEDctrlDef;
// Prototypes
  void setupLEDcontrol(LEDctrlDef* pLED, ushort* pPort, byte bytIOmask);
#endif