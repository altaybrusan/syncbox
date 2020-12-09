/* 
 * Project name:
     UARTA (Usage of UART libraries)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Description:
     This simple example demonstrates usage of mikroC's UART libraries, through
     a 'loopback' interface. The data being sent to PIC24 through UART and sent back.
 * Test configuration:
     MCU:             P24EP512GU810
                      http://ww1.microchip.com/downloads/en/DeviceDoc/70616F.pdf
     Dev.Board:       EasyPIC Fusion v7 - ac:UARTA
                      http://www.mikroe.com/easypic-fusion/
     Oscillator:      XT-PLL, 140.0000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for dsPIC
                      http://www.mikroe.com/mikroc/dspic/
 * NOTES:
     - Turn ON UARTA switches at SW12. (board specific)
 */

sbit LCD_RS at LATD2_bit;
sbit LCD_EN at LATD3_bit;
sbit LCD_D4 at LATD4_bit;
sbit LCD_D5 at LATD5_bit;
sbit LCD_D6 at LATD6_bit;
sbit LCD_D7 at LATD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

char uart_rd;

void main() {
  // Setting output frequency to 140MHz
  PLLFBD = 70;             // PLL multiplier M=70
  CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;
  
  PPS_Mapping(100, _INPUT,  _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
  PPS_Mapping(101, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it

  LCD_Init();
  Delay_ms(100);
  LCD_Cmd(_LCD_CURSOR_OFF);
  LCD_Cmd(_LCD_CLEAR);
  
  LCD_Out(1,1,"Gulmay Gen. Test");
  Delay_ms(1000);
  Lcd_Cmd(_LCD_CLEAR);
    
  UART1_Init(9600);              // Initialize UART module at 56000 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  
  while (1) {                     // Endless loop

        UART1_Write('A');
        UART1_Write_Text("UART1 Test\r\n");
        Delay_ms(1000);
  }
}