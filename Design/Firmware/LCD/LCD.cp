#line 1 "C:/Users/Burak/Desktop/18f4550/LCD.c"

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



char _titleStr[] = "Durmaz Tek. 2016";
char _dotStr[] = ".";


void main() {



 ADCON1 = 0x0F ;
 CMCON = 0x07 ;

 TRISA = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,1,_titleStr);

 Lcd_Out(2,7,_dotStr);
 Delay_ms(200);
 Lcd_Out(2,8,_dotStr);
 Delay_ms(300);
 Lcd_Out(2,9,_dotStr);


 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

}
