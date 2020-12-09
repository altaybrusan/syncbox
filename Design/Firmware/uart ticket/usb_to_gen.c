char cnt;
char readbuff[64];
char writebuff[64];
unsigned int oldstate;

char uart_rd;

int row=1,col=1;

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


void interrupt() iv IVT_ADDR_INT0INTERRUPT ics ICS_AUTO {


if(IFS0.F0 == 1) {

if(PORTD.F0 == 1){

UART1_Write(63);
UART1_Write(80);
UART1_Write(13);

}


IFS0.F0 = 0;

}

}


void USB1Interrupt() iv IVT_ADDR_USB1INTERRUPT{
  USB_Interrupt_Proc();
}

void newline()
{
UART1_Write(13);
UART1_Write(10);
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

  PPS_Mapping(100, _INPUT,  _U1RX);
  PPS_Mapping(101, _OUTPUT, _U1TX);
  
  ACLKCON3 = 0xB4C1;
  ACLKDIV3 = 0x0007;

  //TRISD = 0;
  //PORTD = 0;

  TRISA.F15 = 0;
  PORTA.F15 = 0;
  
  TRISA.F14 = 0;
  PORTA.F14 = 0;


     Lcd_Init();
     Delay_ms(100);

     Lcd_Out(1,1,"Gulmay Gen. Test");
     Delay_ms(1000);
     Lcd_Cmd(_LCD_CLEAR);

     UART1_Init(9600);
      Delay_ms(100);


      UART1_Write(63);
      UART1_Write(80);
      UART1_Write(13);



 IEC0 = 1;     // enable on change interrupts
 IFS0 = 0;     // Clear interrupt flag prior to enable





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
    
    
    
   /* do

   {

      if (PORTA.F15==1 && PORTA.F14==1){

      UART1_Write(33);
      UART1_Write(88);
      UART1_Write(13);
      continue;
      
      }
      
      

      else if (PORTA.F15==1 && PORTA.F14==0) {
      
      Lcd_Out(1,1,"Ready!");
      UART1_Write_Text("Ready!");
      UART1_Write(13);
      continue;

      }
      
      
      
      else if (PORTA.F15==0 && PORTA.F14==0) {
      
      UART1_Write(33);
      UART1_Write(79);
      UART1_Write(13);
      continue;
      
      }



       } while(1);      */
    




     if(UART1_Data_Ready()){
     Delay_ms(100);
     uart_rd =  UART1_Read();
     Delay_ms(100);


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