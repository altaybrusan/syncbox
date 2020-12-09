char  uart_rd; 
char  uart_rd1;



void main() {

ANSELC = 0x00;

UART1_Init(9600);
UART2_Init(9600);

Delay_ms(100);
UART1_Write(63);
UART1_Write(80);
UART1_Write(13);

Delay_ms(100);
UART1_Write(63);
UART1_Write(87);
UART1_Write(13);

while (1){
      if (UART1_Data_Ready()){
      uart_rd = UART1_Read();
      UART1_Write(uart_rd);

                           }
                           
      if (UART2_Data_Ready()){
      uart_rd = UART2_Read();
      UART1_Write(uart_rd1);

                           }
      }
}