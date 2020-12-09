unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

char cnt;
char cnt1;
char uart_rd;
char datacnt;

int row = 1;
int col = 1;


// LCD baðlantý ayarlarý
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
// LCD baðlantý ayarlarý sonu

/*
//Prescaler 1:2; TMR0 Preload = 15536; Actual Interrupt Time : 100 ms

//Place/Copy this part in declaration section
void InitTimer0(){
  T0CON         = 0x80;
  TMR0H         = 0x3C;
  TMR0L         = 0xB0;
  GIE_bit         = 1;
  TMR0IE_bit         = 1;
}

void Interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit = 0;
    TMR0H         = 0x3C;
    TMR0L         = 0xB0;
    //Enter your code here
  }
}    */


void Interrupt_usb(){

   USB_Interrupt_Proc();

}

/*
void uart1_address(){

PORTC.F0 = 0;
PORTC.F1 = 0;
PORTC.F2 = 0;

}


void uart2_address(){

PORTC.F0 = 0;
PORTC.F1 = 1;
PORTC.F2 = 0;

}


void uart3_adsress(){

PORTA.F0 = 1;
PORTA.F1 = 0;
PORTA.F2 = 0;

}


void uart4_address(){

PORTA.F0 = 1;
PORTA.F1 = 1;
PORTA.F2 = 0;

}

*/

void main() {

ADCON1 |= 0x0F;

CMCON  |= 7;

TRISA = 0x00;
TRISC = 0x00;

PORTC.F0 = 0;
PORTC.F1 = 0;
PORTC.F2 = 0;

Lcd_Init();   // LCD Etkinleþtirmesi

//Delay_ms(10);

Lcd_Out(1,1,"Gulmay Gen. Test");

Delay_ms(1000);

Lcd_Cmd(_LCD_CLEAR);

UART1_Init(9600);  // UART1 Portu Etkinleþtirmesi

//Delay_ms(10);


/* UART1_Write(63);

UART1_Write(80);

UART1_Write(13); */


HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi

while(1){

//while(!HID_Read());

datacnt=HID_Read();

if(datacnt){

for(cnt=0;cnt<datacnt;cnt++)

writebuff[cnt]=readbuff[cnt];

//while(!HID_Write(&writebuff,datacnt));

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
     
     uart_rd =  UART1_Read();

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