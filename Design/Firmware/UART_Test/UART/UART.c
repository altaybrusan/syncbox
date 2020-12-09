/*
 * Project name:
     UART (Simple usage of UART module library functions)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110929:
       - initial release (FJ);
 * Description:
     This code demonstrates how to use uart library routines. Upon receiving
     data via RS232, MCU immediately sends it back to the sender.
 * Test configuration:
     MCU:             PIC18F45K22
                      http://ww1.microchip.com/downloads/en/DeviceDoc/41412D.pdf
     Dev.Board:       EasyPIC7 - ac:UART
                      http://www.mikroe.com/easypic/
     Oscillator:      HS-PLL 32.0000 MHz, 8.0000 MHz Crystal
     Ext. Modules:    None.
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/mikroc/pic/
 * NOTES:
     - Turn on RX and TX UART switches (SW1.1 and SW2.1). (board specific)
     - Put RX and TX UART jumpers (J3 and J4) in RS-232 or USB position,
       depending on your choice (board specific).
 */

char dataRx;

void main() {

ANSEL = 0; // Configure AN pins as digital
ANSELH = 0;
TRISD = 0;
PORTD = 0xFF;

UART1_Init(9600); // Initialize UART module at 9600 bps
Delay_ms(100); // Wait for UART module to stabilize

while (1) { // Endless loop
  if (UART1_Data_Ready())
  {
      dataRx=UART1_Read();
      if (dataRx == 'A'){
      UART1_Write_Text("You type A");
      UART1_Write(13);
      UART1_write(10);
      }
      else if (dataRx == 'B'){
      UART1_Write_Text("You type B");
      UART1_Write(13);
      UART1_Write(10);
      }
      else{
      UART1_Write_Text("I don't understand");
      UART1_Write(13);
      UART1_Write(10);
      }
      PORTD = dataRx;
      }
 }
}