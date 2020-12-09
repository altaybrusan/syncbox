#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/usb_led/usb_led.c"
int row = 1;
int col = 1;

int i = 0;

int timer_sayac_0 = 0;

char ready = 0;
char xray_on = 0;
char button_state_0 = 0;
char button_state_1 = 0;

char cnt;
char cnt1;
char datacnt;
char datacnt1;
char usb = a;


unsigned char sent_data_1[64];
unsigned char sent_data_2[64];
unsigned char sent_data_3[64];
unsigned char sent_data_4[64];
unsigned char sent_data_5[64];

char uart_rd1[64];
char uart_rd2;
char uart_rd3;
char uart_rd4;

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





void address1(){

 PORTC.F0 = 0;
 PORTC.F1 = 0;
 PORTC.F2 = 0;

}

void address2(){

 PORTC.F0 = 1;
 PORTC.F1 = 0;
 PORTC.F2 = 0;

}

void address3(){

 PORTC.F0 = 0;
 PORTC.F1 = 1;
 PORTC.F2 = 0;

}

void address4(){

 PORTC.F0 = 1;
 PORTC.F1 = 1;
 PORTC.F2 = 0;

}





void InitTimer0(){
 T0CON = 0x88;
 TMR0H = 0xD8;
 TMR0L = 0xF0;
 GIE_bit = 1;
 TMR0IE_bit = 1;

}

void InitTimer1(){
 T1CON = 0x21;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}

void InitTimer2(){
 T2CON = 0x66;
 TMR2IE_bit = 1;
 PR2 = 240;
 INTCON = 0xC0;
}

void InitTimer3(){
 T3CON = 0x21;
 TMR3IF_bit = 0;
 TMR3H = 0x3C;
 TMR3L = 0xB0;
 TMR3IE_bit = 1;
 INTCON = 0xC0;
 }

void InitINT0(){
 INT0IE_bit = 1;
 GIE_bit = 1;
 INT0IF_bit = 0;
}

void InitINT1(){
 INT1IE_bit = 1;
 GIE_bit = 1;
 INT1IF_bit = 0;
}

void InitINT2(){
 INT2IE_bit = 1;
 GIE_bit = 1;
 INT2IF_bit = 0;
}





void interrupt(){

 USB_Interrupt_Proc();

 if(TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0H = 0xD8;
 TMR0L = 0xF0;
 timer_sayac_0++;
 }
 if(TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;

 }
 if(TMR2IF_bit){
 TMR2IF_bit = 0;

 }
 if(TMR3IF_bit){
 TMR3IF_bit = 0;
 TMR3H = 0x3C;
 TMR3L = 0xB0;

 }
 if(INT0F_bit){
 xray_on = 1;
 INT0F_bit = 0;
 }
 if(INT1F_bit){
 ready = 1;
 INT1F_bit = 0;
 }
 if(INT2F_bit){

 INT2F_bit = 0;
 }



}





void main() {

ADCON1 |= 0x0F;

CMCON |= 7;

TRISA = 0x00;

TRISB = 0x00;

TRISC = 0x00;

TRISD = 0x00;

PORTA = 0x00;

PORTB = 0x00;

PORTC = 0x00;

PORTD = 0x00;




Lcd_Init();

Lcd_Out(1,1,"SyncBox V.1.0 Test");

Delay_ms(1000);

Lcd_Cmd(_LCD_CLEAR);



UART1_Init(9600);


HID_Enable(&readbuff,&writebuff);




InitINT0();
InitINT1();




while(1){



datacnt = HID_Read();



if(datacnt != 0 ){

for(cnt=0;cnt<datacnt;cnt++)

writebuff[cnt]=readbuff[cnt];







 if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){

 LATD.F0 = 1;


 }

 if(writebuff[0] == '2' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){

 LATD.F0 = 0;


 }

 if(writebuff[0] == '3' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){


 while(!HID_Write(&writebuff,datacnt));


 }







 }

 }







 }
