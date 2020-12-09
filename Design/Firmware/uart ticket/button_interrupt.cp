#line 1 "C:/Users/Burak/Desktop/uart ticket/button_interrupt.c"
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



bit flag;

void interrupt(void); void interrupt() iv IVT_ADDR_INT0INTERRUPT ics ICS_AUTO {


if(IFS0.F0 == 1) {

flag = 1;

IFS0.F0 = 0;

if(PORTD.F0 == 1){

Lcd_Out(1,1,"Dügmeye basiniz");

IFS0.F0 = 0;

}

}

}





void main() {

 PLLFBD = 70;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;

 TRISA.F15 = 0;
 PORTA.F15 = 0;

 TRISA.F14 = 0;
 PORTA.F14 = 0;

 TRISD.F0 = 0;
 PORTD.F0 = 0;


 Lcd_Init();
 Delay_ms(100);

 Lcd_Out(1,1,"Gulmay Gen. Test");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);


 IFS0 = 0;
 IEC0 = 1;




}
