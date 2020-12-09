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


void newline()
{
UART1_Write(13); // Carriage Return
UART1_Write(10); // Line Feed
}

void main() {

  PLLFBD = 70;             // PLL multiplier M=70
  CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

  ANSELA = 0x00;
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;

  PPS_Mapping(100, _INPUT,  _U1RX);
  PPS_Mapping(101, _OUTPUT, _U1TX);

  //TRISD = 0;
  //PORTD = 0;




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
      //UART1_Write(10);



     Delay_ms(100);




      while(1){

     if(UART1_Data_Ready()){ //If Data Ready,
     Delay_ms(100);
     uart_rd =  UART1_Read();
     Delay_ms(100);


     Lcd_Chr(row,col,uart_rd);

     if(uart_rd==17){
     Lcd_Cmd(_LCD_CLEAR);
     col=1,row=1;
     }
     //UART1_Write(uart_rd);

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
           }
     }
}