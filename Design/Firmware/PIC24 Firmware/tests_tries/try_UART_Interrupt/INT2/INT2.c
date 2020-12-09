/* Project name:
     Interrupts - INT2 (Sample usage of External Interrupt)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20120515(DO):
       - initial release;
 * Description:
     Simple demonstration on usage of the INT2 External Interrupt.
 * Test configuration:
     MCU:             P32MX460F512L
                      http://ww1.microchip.com/downloads/en/DeviceDoc/61143G.pdf
     Dev. Board:      LV32MX v6 hw.rev.1.10ton
                      http://www.mikroe.com/eng/products/view/462/lv-32mx-v6-development-system/
     Oscillator:      XT-PLL, 80.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for PIC32
                      http://www.mikroe.com/eng/categories/view/89/pic32-compilers/
 * NOTES:
     - Turn on LEDs on PORTB at SW12
     - Set J10 in pull down position
     - Turn on SW10.4
 */

void int2_interrupt() iv IVT_EXTERNAL_2 ilevel 4 ics ICS_AUTO {
  LATB = ~LATB;                      // Invert LED's
  INT2IF_bit = 0;                    // Reset INT2 flag
}

void main() {

  AD1PCFG    = 0xFFFF;               // Turning all analog pins to digital
  TRISE9_bit = 1;                    // Set RE9 pin as input
  TRISB      = 0;                    // Set PORTB as output
  LATB       = 0;                    // Clear PORTB
  
  LATB = 0x5555;                     // Set PORTB start value
  
  INT2IP0_bit = 0;                   // Set INT2 interrupt
  INT2IP1_bit = 0;                   // Set interrupt priorities
  INT2IP2_bit = 1;                   // Set inrrupt priority to 4
  INT2IE_bit  = 1;                   // Set interrupt on INT2 (RE9) to be enabled
  EnableInterrupts();                // Enable interruts as previously set

  while(1){                          // Endless loop wait for interrupt to occurs
  }
}