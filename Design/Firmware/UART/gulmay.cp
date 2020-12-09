#line 1 "C:/Users/Burak/Desktop/UART/gulmay.c"
unsigned char x;

void main() {

 PLLFBD = 70;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;


 PPS_Mapping(100, _INPUT, _U1RX);
 PPS_Mapping(101, _OUTPUT, _U1TX);



 UART1_Init(9600);
 Delay_ms(100);

 while(1) {

 if(UART1_Data_Ready()) {
 x = UART1_Read();
 }

 if(x == 'A') {
 UART1_Write(13);
 UART1_Write_Text("This is A");
 UART1_Write(13);
 }

 else if(x == 'Z') {
 UART1_Write(13);
 UART1_Write_Text("This is B");
 UART1_Write(13);
 }

 x = '\0';


 }
}
