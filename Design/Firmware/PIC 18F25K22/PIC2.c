char  uart_rd;
char uart_rd1;
//char address1;
//char address2;
/*

void address1() {
PORTC.F0 = 0;
PORTC.F1 = 0;
PORTC.F2 = 0;

}


void address2() {
PORTC.F0 = 1;
PORTC.F1 = 0;
PORTC.F2 = 0;

}
   */


void main() {


ANSELA = 0x00;


UART1_Init(9600);


UART2_Init(9600);

/*Delay_ms(3000);
UART1_Write(63);
UART1_Write(80);
UART1_Write(13);

Delay_ms(3000);
UART2_Write(63);
UART2_Write(87);
UART2_Write(13); */


while (1){

    if(PORTA.F0 == 0 && PORTA.F1 == 1 && PORTA.F2 == 0){
      if (UART1_Data_Ready()){
      uart_rd = UART1_Read();
      UART1_Write(uart_rd);

                             }
             }

    if(PORTA.F0 == 1 && PORTA.F1 == 1 && PORTA.F2 == 0){
      if (UART2_Data_Ready()){
      uart_rd1 = UART2_Read();
      UART2_Write(uart_rd);

                             }
             }

             }



      }