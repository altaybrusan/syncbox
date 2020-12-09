#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/PIC 18F25K22/RS232.c"
char uart_rd;



void main() {

ANSELC = 0x00;

UART1_Init(9600);
Delay_ms(3000);
UART1_Write(63);
UART1_Write(80);
UART1_Write(13);

while (1){
 if (UART1_Data_Ready()){
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);

 }
 }
}
