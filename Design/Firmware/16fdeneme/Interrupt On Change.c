/*
 * Project name:
     IOC - Interrupt-On-Change KB0:KB3 (RB4:RB7)
 * Copyright:
     (c) Mikroelektronika, 2012.
     Modifications by Paul Land  (castingflame@gmail.com)

 * Revision History:

       - initial Mikroelektronika release 20120505 (DO);
       - Modified for the 18F4550 by Paul Land 13/12/2012  v1.0
       
 * Description:
     This is a simple interrupt-on-change demostration project.
     Interrupt will set local flag, which will cause Flashing routine to be executed.
     Depending on pressed button (RB4:RB7) different position of flashing routine will be executed.

 * Test configuration:
     MCU:             PIC18F4550
                      http://ww1.microchip.com/downloads/en/DeviceDoc/39632e.pdf
     dev.board:       EasyPIC v6 & v7
                      http://www.mikroe.com/eng/products/view/757/easypic-v7-development-system/
     Oscillator:      8.0000 MHz Crystal
     Ext. Modules:    None.
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/eng/products/view/7/mikroc-pro-for-pic/
 * NOTES:
     - Put J17 in VCC position.
     - Turn ON the PORT D LEDs at SW3.4.
     - Put PORTB dip switch RB<7:4> in PullDown position
*/


#include "Flash_functions.h"

char pressedButton;
bit flag;

void interrupt(){              // Interrupt rutine
  if(RBIF_bit == 1 ) {         // Checks for Receive Interrupt Flag bit
    flag  = 1;                 // Set local interrupt flag
    RBIF_bit = 0;              // Clear Interrupt Flag
    if (PORTB.F7 == 1){        // Checks if the RB7 is pressed
       pressedButton = 7;
    }
    if (PORTB.F6 == 1){        // Checks if the RB6 is pressed
       pressedButton = 6;
    }
    if (PORTB.F5 == 1){        // Checks if the RB5 is pressed
       pressedButton = 5;
    }
    if (PORTB.F4 == 1){        // Checks if the RB4 is pressed
       pressedButton = 4;
    }
  }
}

void main() {                  // Varialbe initialisation
  flag          = 0;           // Varialbe initialisation
  pressedButton = 0;

  ADCON1 = 0b00001111;         // Configure all PORT pins as digital
  TRISB  = 0b11111111;;        // Set PORT B as input
  LATD   = 0b00000000;         // Set all pin on PORT D Low
  TRISD  = 0;                  // Set PORT D as output
  RBIE_bit  = 1;               // Enable Port B Interrupt-On-Change
  RBIF_bit  = 0;               // Clear IOC flag
  GIE_bit   = 1;               // Enable GLOBAL interrupts


  while(1) {

    if(flag) {
      switch(pressedButton) {  // Depending on value(button pressed), calls FleshIt function with different argument
      case 4:
           FlashIt(0x03);
           pressedButton = 0;
      break;
      case 5:
           FlashIt(0x0C);
           pressedButton = 0;
      break;
      case 6:
           FlashIt(0x30);
           pressedButton = 0;
      break;
      case 7:
           FlashIt(0xC0);
           pressedButton = 0;
      break;
      default:
//           FlashIt(0xAA);       // Just in case
                                  //(commented out by Paul Land for easier viewing)

      break;
      }
      flag = 0;                 // Reset flag variable
    }
  }
}