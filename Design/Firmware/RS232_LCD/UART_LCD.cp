#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/RS232_LCD/UART_LCD.c"
char uart_rd;
int i, row=1,col=1;



sbit LCD_RS at RA5_bit;
sbit LCD_EN at RA4_bit;
sbit LCD_D4 at RA3_bit;
sbit LCD_D5 at RA2_bit;
sbit LCD_D6 at RA1_bit;
sbit LCD_D7 at RA0_bit;

sbit LCD_RS_Direction at TRISA5_bit;
sbit LCD_EN_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISA3_bit;
sbit LCD_D5_Direction at TRISA2_bit;
sbit LCD_D6_Direction at TRISA1_bit;
sbit LCD_D7_Direction at TRISA0_bit;



void xrayon() {

}

void xrayoff() {

}






void main() {

 ADCON1 = 0x0F ;
 CMCON = 0x07 ;

 TRISA = 0x00;
 TRISC = 0x00;
 PORTC.F0 = 0;
 PORTC.F1 = 0;
 PORTC.F2 = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Delay_ms(100);

 Lcd_Out(1,1,"Gulmay Gen. Test");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write(63);
 UART1_Write(87);
 UART1_Write(13);

 while (1){
 if (UART1_Data_Ready()){


 uart_rd=UART1_Read();



 UART1_Write(uart_rd);
#line 80 "C:/Users/Burak/Desktop/SyncBox Kodlarý/RS232_LCD/UART_LCD.c"
 Lcd_Chr(row,col,uart_rd);



 if(uart_rd==17){
 Lcd_Cmd(_LCD_CLEAR);
 col=1,row=1;
 }

 col=col+1;
 }
 if(col==17 && row==1)
 {
 row=2;
 col=1;
 }
 if(row==2 && col==17)
 {
 Lcd_Cmd(_LCD_CLEAR);
 col=1;
 row=1;
 }

 }
 }
