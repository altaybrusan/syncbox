char uart_rd[20];
char uart_rd1;
char cnt;
char cnt1;
int i;

void main() {

ANSELC = 0x00;

UART1_Init(9600);

UART2_Init(9600);


while (1){

    if(PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
      if (UART1_Data_Ready()){
      for(cnt=0;cnt<4;cnt++){
      uart_rd[cnt] = UART1_Read();
      }
      for(cnt=0;cnt<4;cnt++){
      
      UART1_Write(uart_rd[cnt]);
      }
      //delay_ms(1000);

      //UART1_Write(13);

                             }
             }
             
    if(PORTC.F0 == 1 && PORTC.F1 == 0 && PORTC.F2 == 0){
      if (UART2_Data_Ready()){
      //for(cnt1=0;cnt1<uart_rd;cnt1++)
      uart_rd1 = UART2_Read();
      UART2_Write(uart_rd1);

                             }
             }
             
             }
                           
                           
                           
      }