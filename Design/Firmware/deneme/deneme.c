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


unsigned char sent_data_1[64];
unsigned char sent_data_2[64];
unsigned char sent_data_3[64];
unsigned char sent_data_4[64];
unsigned char sent_data_5[64];

char uart_rd1;
char uart_rd2;
char uart_rd3;
char uart_rd4;

unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;


//?????????????????????????// LCD Baðlantý Ayarlarý Baþlangýcý

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

//?????????????????????????// LCD Baðlantý Ayarlarý Bitiþi

//&&&&&&&&&&&&&&&&&&&&&&// Adresleme Fonksiyonlarý Baþlangýcý

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

//&&&&&&&&&&&&&&&&&&&&&&// Adresleme Fonksiyonlarý Bitiþi

//%%%%%%%%%%%%%%%%%%%%//   Interrupt Initializer Baþlangýcý

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

//%%%%%%%%%%%%%%%%%%%%//   Interrupt Initializer Bitiþi

//++++++++++++++++++++++// Interrupt Fonksiyonlarý Baþlangýcý

void interrupt(){



   if(TMR0IF_bit){
                  TMR0IF_bit = 0;
                  TMR0H         = 0xD8;
                  TMR0L         = 0xF0;
                  timer_sayac_0++;
  }
   if(TMR1IF_bit){
                  TMR1IF_bit = 0;
                  TMR1H = 0x3C;
                  TMR1L = 0xB0;
                  //Enter your code here
  }
   if(TMR2IF_bit){
                  TMR2IF_bit = 0;
                  //Enter your code here
  }
   if(TMR3IF_bit){
                  TMR3IF_bit = 0;
                  TMR3H         = 0x3C;
                  TMR3L         = 0xB0;
                  //Enter your code here
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
                 //code
                 INT2F_bit = 0;
   }



}

//+++++++++++++++++++++//  Interrupt Fonksiyonlarý Bitiþi

//====================// Main Baþlangýcý

void main() {

ADCON1 |= 0x0F;

CMCON  |= 7;

TRISA = 0x00;

TRISB = 0x00;

TRISC = 0x00;

TRISD = 0x00;

PORTA = 0x00;

PORTB = 0x00;

PORTC = 0x00;

PORTD = 0x00;


//^^^^^^^^^^^^^^^^^// LCD Etkinleþtirmesi ve Testi Baþlangýcý

Lcd_Init();

Lcd_Out(1,1,"Gulmay Gen. Test");

Delay_ms(1000);

Lcd_Cmd(_LCD_CLEAR);

//^^^^^^^^^^^^^^^^^// LCD Etkinleþtirmesi ve Testi Bitiþi

UART1_Init(9600);  // UART Portu Etkinleþtirmesi




//_____________________________// Initializer Kurulum Baþlangýcý

//InitTimer0();
InitINT0();
InitINT1();
//address1();

//_____________________________// Initializer Kurulum Baþlangýcý

while(1){


//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!// USB Döngüsü Bitiþi


//***********************************************// Push Button Döngü Baþlangýcý



//***********************************************// Push Button Döngü Bitiþi


//-------------------------------------//  Address Deðiþtirme ve Port Sorgulama Döngüsü Baþlangýcý

        //if(PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0 && PORTB.F0 == 0 && PORTB.F1 == 0){

                    //address1();

                     if (UART1_Data_Ready()){
                     //for(cnt1=0;cnt1<4;cnt1++){
                     uart_rd1 = UART1_Read();
                     //}
                     //for(cnt1=0;cnt1<4;cnt1++){
                     UART1_Write(uart_rd1);
                     //}
                    //while(!HID_Write(&uart_rd1,64));


                                  }
                                  


//-------------------------------------//  Address Deðiþtirme ve Port Sorgulama DÖngüsü Bitiþi



      } // While Döngüsü Bitiþi
}

