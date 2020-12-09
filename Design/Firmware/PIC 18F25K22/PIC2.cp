#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/PIC 18F25K22/PIC2.c"
char uart_rd;
char uart_rd1;
#line 24 "C:/Users/Burak/Desktop/SyncBox Kodlarý/PIC 18F25K22/PIC2.c"
void main() {


ANSELA = 0x00;


UART1_Init(9600);


UART2_Init(9600);
#line 46 "C:/Users/Burak/Desktop/SyncBox Kodlarý/PIC 18F25K22/PIC2.c"
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
