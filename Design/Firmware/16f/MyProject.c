 /*
 * Project name:
     External Interrupt on PortD (Simple 'Hello World' project)
 * Copyright:
     (c) Mikroelektronika, 2010.
 * Revision History:
     20101006:
       - initial release;
       - 20101006 - Ranko Rankovic;
 * Description:
     This is a simple 'Hello World' project. It counts presses on PortB.0 and
     shows result on diodes connected to PortD.
 * Test configuration:
     MCU:             ac:PIC16F887
     dev.board:       ac:EasyPICv6
     Oscillator:      HS, 08.0000 MHz
     Ext. Modules:    -
     sw:
 * NOTES:
     - Make sure you turn ON the PORTD LEDs (SW9.4), set PortB Pull Up Jumper in Vcc position (J2)
       and turn on PortB.0 Switch (SW2.1) and put the J17 in the lower position
*/


int cnt = 0;               // Global variable cnt

void interrupt(){          // Interrupt rutine
  if(INTCON.INTF == 1 ){
    cnt++;                 // Increment variable cnt
    INTCON.INTF = 0;       // Clear Interrupt Flag
  }
}

void main() {              // Main program

 /* ANSEL  = 0;              // MCU settings, digital I/O and Comparators off
  ANSELH = 0;
  C1ON_bit = 0;
  C2ON_bit = 0; */

  
  PORTB.F7 = 1;
  delay_ms(500);
  PORTB.F7 = 0;
  
  TRISB = 0x01;            // Set PB0 as input
  TRISD = 0x00;            // Set PortD as output

  PORTD = 0x00;            // Starting value for PortD

  INTCON = 0x90;           // Interrupt flags:
                                 //Enable Global Interrupt
                                 //Enable External Interrupt
  //WPUB = 0x01;             // Weak Pull-Up on pin B0

  while(1){                // Unending loop
    PORTD = cnt;           // Write on PortD value of varibale cnt
  }
}