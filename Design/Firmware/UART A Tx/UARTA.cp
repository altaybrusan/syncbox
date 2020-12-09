#line 1 "C:/Users/Burak/Desktop/UART A Tx/UARTA.c"
#line 22 "C:/Users/Burak/Desktop/UART A Tx/UARTA.c"
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

 PLLFBD = 70;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;

 PPS_Mapping(100, _INPUT, _U1RX);
 PPS_Mapping(101, _OUTPUT, _U1TX);

 LCD_Init();
 Delay_ms(100);
 LCD_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);

 LCD_Out(1,1,"Gulmay Gen. Test");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 UART1_Init(9600);
 Delay_ms(100);

 while (1) {

 UART1_Write('A');
 UART1_Write_Text("UART1 Test\r\n");
 Delay_ms(1000);
 }
}
