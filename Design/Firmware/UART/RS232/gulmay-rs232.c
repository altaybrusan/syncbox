char uart_rd, row = 1, col = 1;

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

void main() {

    ANSELA = 0x00;
    ANSELB = 0x00;
    ANSELC = 0x00;
    ANSELD = 0x00;
    ANSELE = 0x00;
    ANSELG = 0x00;
    
    PPS_Mapping(100, _INPUT,  _U1RX);
    PPS_Mapping(101, _OUTPUT, _U1TX);
    
    TRISD = 0;
    TRISF.F4 = 1;
    TRISF.F5 = 0;
    
    PORTD = 0;
    PORTF = 0;
    
    LATF = 0;
    
    LCD_Init();
    LCD_Cmd(_LCD_CURSOR_OFF);
    LCD_Cmd(_LCD_CLEAR);
    Delay_ms(100);

    LCD_Out(1,1,"Gulmay Gen. Test");
    Delay_ms(1000);
    Lcd_Cmd(_LCD_CLEAR);

    UART1_Init(9600);
    Delay_ms(200);

    UART1_Write_Text("?M");

    while(1) {

        if(UART1_Data_Ready()) {
             uart_rd =  UART1_Read();
        }
     
        if(uart_rd) {
            Lcd_Chr(row,col,uart_rd);

            if(uart_rd == 17){
                Lcd_Cmd(_LCD_CLEAR);
                col = 1;
                row = 1;
            }
            
            UART1_Write(uart_rd);
            col = col + 1;
            
            if((col == 17) && (row == 1)) {
                row = 2;
                col = 1;
            }

            if((col == 17) && (row == 2)) {
                Lcd_Cmd(_LCD_CLEAR);
                col = 1;
                row = 1;
            }
        }
    }
}