unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

char cnt;
char cnt1;
char uart_rd1;
char uart_rd2;
char uart_rd3;
char uart_rd4;
char datacnt;
int i=0;



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



void interrupt(){

   USB_Interrupt_Proc();

}



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



for(i=0;i<30000;i++)

if(i==29999){


//Delay_ms(1000);

Lcd_Cmd(_LCD_CLEAR); }

UART1_Init(9600);  // UART1 Portu Etkinleþtirmesi

//Delay_ms(10);


/* UART1_Write(63);

UART1_Write(80);

UART1_Write(13); */


HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi

while(1){



//while(!HID_Read());

datacnt = HID_Read();

if(datacnt){

for(cnt=0;cnt<datacnt;cnt++)

writebuff[cnt]=readbuff[cnt];

while(!HID_Write(&writebuff,datacnt));

    Lcd_Cmd(_LCD_CLEAR);

    UART1_Write_Text(&writebuff);

    UART1_Write(13);

    //Lcd_Out(row,col,writebuff);

    //Delay_Ms(1000);

    //Lcd_Cmd(_LCD_CLEAR);

    }



for(i=0;i<40000;i++)
        if(i==9999){
        
                    address1();
                    if(UART1_Data_Ready()){
                    uart_rd1 = UART1_Read();
                    //Lcd_Chr(row,col,uart_rd1);
                    UART1_Write(uart_rd1);
                    UART1_Write(13);
                    
                    }   }

        if(i==19999){

                    address2();
                    if(UART1_Data_Ready()){
                    uart_rd2 = UART1_Read();
                    //Lcd_Chr(row,col,uart_rd2);
                    UART1_Write(uart_rd2);
                    UART1_Write(13);

                    }  }

        if(i==29999){

                    address3();
                    if(UART1_Data_Ready()){
                    uart_rd3 = UART1_Read();
                    //Lcd_Chr(row,col,uart_rd1);
                    UART1_Write(uart_rd3);
                    UART1_Write(13);

                    }    }

         if(i==39999){

                    address1();
                    if(UART1_Data_Ready()){
                    uart_rd4 = UART1_Read();
                    //Lcd_Chr(row,col,uart_rd1);
                    UART1_Write(uart_rd4);
                    UART1_Write(13);
                    
                    i=0;

                    }
                                }
                                
                                
                                
      }
}

        
        
     
     
     
     
     
     /*if(UART1_Data_Ready()){


     
     uart_rd1 = UART1_Read();




     Lcd_Chr(row,col,uart_rd1);
     
     UART1_Write(uart_rd1);
     
     UART1_Write(13);

     //while(!HID_Write(&uart_rd,uart_rd));  */




     /*if(uart_rd==17){

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

    } */



