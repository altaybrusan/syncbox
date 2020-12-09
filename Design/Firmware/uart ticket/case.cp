#line 1 "C:/Users/Burak/Desktop/uart ticket/case.c"
char uart_rd;
int i;
unsigned int oldstate;



void xrayon() {


 UART1_Write(33);
 UART1_Write(88);
 UART1_Write(13);


}


void xrayoff(){

 UART1_Write(33);
 UART1_Write(88);
 UART1_Write(13);


}



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


 UART1_Write(63);
 UART1_Write(80);
 UART1_Write(13);

 Delay_ms(1000);




 do{

 if (Button (&PORTA, 15,1,1))



 UART1_Write(63);
 UART1_Write(78);
 UART1_Write(13);
 oldstate = 1;
#line 79 "C:/Users/Burak/Desktop/uart ticket/case.c"
 if (oldstate && Button (&PORTA,15,1,0)){


 UART1_Write(63);
 UART1_Write(88);
 UART1_Write(13);
 oldstate = 0;
 }

 }while(1);
}
