char  uart_rd;


sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

void newline(){
     UART1_Write(13); // Carriage Return
     UART1_Write(10); // Line Feed
     }


void main() {
     TRISB = 0x00;
     ADCON1 = 0x0F ;
     CMCON = 7; // Disable Comparators
     //TRISC = 0b00000010;
     TRISD = 0x00;
     PORTD.F1 = 1;
     Delay_ms(1000);
     PORTD.F1 = 0;
     Delay_ms(1000);

     LCD_Init();
     LCD_Cmd(_LCD_CURSOR_OFF);
     LCD_Cmd(_LCD_CLEAR);
     Delay_ms(100);

     LCD_Out(1,1,"Gulmay Gen. Test");
     Delay_ms(1000);
     Lcd_Cmd(_LCD_CLEAR);
     
     UART1_Init(9600);
     Delay_ms(100);
     UART1_Write_Text("Testing UART! ");
     Delay_ms(100);
     //UART1_Write_Text("?M");
     
     newline();


  while (1) {
        if (UART1_Data_Ready())
        {
        
           uart_rd = UART1_Read();
           

           if(uart_rd == 'a' ){
           PORTD.F1 = 1;
           UART1_Write(uart_rd);
           Lcd_Chr(1,1,uart_rd);
           Lcd_Out(2,2,"Burak");
           UART1_Write_Text("Burak");
           Delay_ms(1000);
           PORTD.F1 = 0;
           }
           
           else {
           UART1_Write_Text("Error");
           //newline();
           }
       
           newline();

        }
   
    }
}