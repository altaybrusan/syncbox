/* Project name:
     Interrupt on UART2
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20120515(DO):
       - initial release;
 * Description:
     This simple example demonstrates usage of mikroC's UARTx libraries, through
     a 'loopback' interface. The data being sent to PIC32 through UART
     and sent back, using interrupt.
 * Test configuration:
     MCU:             P32MX460F512L
                      http://ww1.microchip.com/downloads/en/DeviceDoc/61143G.pdf
     Dev. Board:      LV32MX v6 hw.rev.1.10 -
                      http://www.mikroe.com/eng/products/view/462/lv-32mx-v6-development-system/
     Oscillator:      XT-PLL, 80.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for PIC32
                      http://www.mikroe.com/eng/categories/view/89/pic32-compilers/
 * NOTES:
     - Turn ON UARTA switches at SW15.
 */

char uart_rd;

void UART2interrupt() iv IVT_UART_2 ilevel 6 ics ICS_AUTO {
      uart_rd = UART2_Read();        // read the received data
      UART2_Write(uart_rd);          // and send data via UART
      U2RXIF_bit = 0;
}

void main() {
  AD1PCFG = 0xFFFF;                  // Configure AN pins as digital I/O

  UART2_Init(56000);                 // Initialize UART module at 56000 bps
  Delay_ms(100);                     // Wait for UART module to stabilize
  
  U2IP0_bit = 0;                     // Set UART2 interrupt
  U2IP1_bit = 1;                     // Set interrupt priorities
  U2IP2_bit = 1;                     // Set UART2 interrupt to level 6

  UART2_Write_Text("UART started succesfully");
  UART2_Write(13);
  UART2_Write(10);

  U2RXIE_bit = 1;                    // Set UART Receive Interrupt
  EnableInterrupts();                // Enable interruts as previously set

  while (1) {                        // Endless loop  wait fo interrupt to occurs
  }
}