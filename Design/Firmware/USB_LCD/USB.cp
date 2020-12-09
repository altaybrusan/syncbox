#line 1 "C:/Users/Burak/Desktop/18f4550/USB.c"
char cnt;
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;




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



void interrupt(){
 USB_Interrupt_Proc();
}


void main() {

 ADCON1 |= 0x0F;
 CMCON |= 7;
#line 36 "C:/Users/Burak/Desktop/18f4550/USB.c"
 TRISA = 0x00;

 Lcd_Init();
 Lcd_Out(1,1,"USB DENEME");
 Delay_Ms(1000);
 Lcd_Cmd(_LCD_CLEAR);


HID_Enable(&readbuff,&writebuff);

 while(1){
 while(!HID_Read());

 for(cnt=0;cnt<64;cnt++)
 writebuff[cnt]=readbuff[cnt];

 while(!HID_Write(&writebuff,64));

 Lcd_Out(1,1,writebuff);
 Delay_Ms(500);
 Lcd_Cmd(_LCD_CLEAR);

 }
}
