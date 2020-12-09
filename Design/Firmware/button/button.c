char uart_rd;
char i=0;
char k=0;




void main() {



ADCON1 |= 0x0F;

CMCON  |= 7;


PORTD.F6 = 0;
PORTD.F7 = 0;


UART1_Init(9600);
Delay_ms(100);
UART1_Write(63);
UART1_Write(80);
UART1_Write(13);

while(1){
if(UART1_Data_Ready()){
uart_rd = UART1_Read();
UART1_Write(uart_rd);
}
if(PORTD.F6 == 1){
i=1;
}

if(PORTD.F6 == 1 && PORTD.F7 == 1 && i==1){
UART1_Write(33);
UART1_Write(88);
i=1;
k=1;
}

if(PORTD.F6 == 0 && PORTD.F7 == 0 && i==1 && a==1){
UART1_Write(33);
UART1_Write(79);
i=0;
k=0;

}

}

}