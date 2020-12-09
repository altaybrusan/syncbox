#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/usb_to_rs232_denem/usb_to_rs232_denem.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

char cnt;
char cnt1;
char uart_rd;
char datacnt;

int row = 1;
int col = 1;



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
#line 51 "C:/Users/Burak/Desktop/SyncBox Kodlarý/usb_to_rs232_denem/usb_to_rs232_denem.c"
void Interrupt_usb(){

 USB_Interrupt_Proc();

}
#line 95 "C:/Users/Burak/Desktop/SyncBox Kodlarý/usb_to_rs232_denem/usb_to_rs232_denem.c"
void main() {

ADCON1 |= 0x0F;

CMCON |= 7;

TRISA = 0x00;
TRISC = 0x00;

PORTC.F0 = 0;
PORTC.F1 = 0;
PORTC.F2 = 0;

Lcd_Init();



Lcd_Out(1,1,"Gulmay Gen. Test");

Delay_ms(1000);

Lcd_Cmd(_LCD_CLEAR);

UART1_Init(9600);
#line 130 "C:/Users/Burak/Desktop/SyncBox Kodlarý/usb_to_rs232_denem/usb_to_rs232_denem.c"
HID_Enable(&readbuff,&writebuff);

while(1){



datacnt=HID_Read();

if(datacnt){

for(cnt=0;cnt<datacnt;cnt++)

writebuff[cnt]=readbuff[cnt];



 Lcd_Cmd(_LCD_CLEAR);

 UART1_Write_Text(&writebuff);

 UART1_Write(13);

 Lcd_Out(row,col,writebuff);

 Delay_Ms(1000);

 Lcd_Cmd(_LCD_CLEAR);

 }





 if(UART1_Data_Ready()){

 Delay_ms(10);

 for(cnt1=0;cnt1<uart_rd;cnt1++)

 uart_rd = UART1_Read();

 Delay_ms(10);

 UART1_Write(uart_rd);

 Lcd_Chr(row,col,uart_rd);



 if(uart_rd==17){

 Lcd_Cmd(_LCD_CLEAR);

 col=1,row=1;

 }

 col=col+1;

 }


 if(col==17 && row==1){

 row=2;

 col=1;

 }


 if(row==2 && col==17){

 Lcd_Cmd(_LCD_CLEAR);

 col=1;

 row=1;

 Delay_Ms(1000);

 Lcd_Cmd(_LCD_CLEAR);





 }

 }



}
