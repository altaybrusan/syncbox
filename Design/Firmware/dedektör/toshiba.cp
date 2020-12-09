#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/dedektör/toshiba.c"
char uart_rd;
void main() {

 TRISD.F7 = 1;
 TRISD.F6 = 0;
 PORTD = 0;



 CMCON = 0x07;
 ADCON1 = 0xFF;

 UART1_Init(9600);
 Delay_Ms(100);
 UART1_Write_Text("Starting");


 Delay_ms(100);
 PORTD.F6 = 1;
 Delay_Ms(40);
 PORTD.F6 = 0;
 Delay_Ms(10);

 while(1){
 if (PORTD.F7 == 1){

 UART1_Write_Text("EXP_OK");

 } }



}
