#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/USB_To_RS232/USB_To_RS232.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

char cnt;
char uart_rd;

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



void interrupt(){

 USB_Interrupt_Proc();

}



void main() {

ADCON1 |= 0x0F;

CMCON |= 7;

TRISA = 0x00;
TRISC = 0x00;

PORTC.F0 = 0;
PORTC.F1 = 0;
PORTC.F2 = 0;

Lcd_Init();

Delay_ms(10);

Lcd_Out(1,1,"Gulmay Gen. Test");

Delay_ms(1000);

Lcd_Cmd(_LCD_CLEAR);

UART1_Init(9600);

Delay_ms(10);
#line 71 "C:/Users/Burak/Desktop/SyncBox Kodlarý/USB_To_RS232/USB_To_RS232.c"
HID_Enable(&readbuff,&writebuff);

while(1){

while(!HID_Read());

for(cnt=0;cnt<64;cnt++)

writebuff[cnt]=readbuff[cnt];

while(!HID_Write(&writebuff,64));

 Lcd_Cmd(_LCD_CLEAR);

 UART1_Write_Text(&writebuff);

 UART1_Write(13);

 Lcd_Out(row,col,writebuff);

 Delay_Ms(1000);

 Lcd_Cmd(_LCD_CLEAR);





 if(UART1_Data_Ready()){

 Delay_ms(10);

 uart_rd = UART1_Read();

 Delay_ms(10);

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
