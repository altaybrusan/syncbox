#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/PIC 18F25K22/rs485s/rs485s.c"
char dat[9];
char i,j;
long cnt = 0;

sbit rs485_rxtx_pin at RC2_bit;
sbit rs485_rxtx_pin_direction at TRISC2_bit;




void interrupt() {
 RS485Slave_Receive(dat);
}

void main() {


 ADCON1 = 0x0F ;









 PORTB = 0;
 PORTC = 0;



 TRISB = 0;
 TRISC = 0;





 UART1_Init(9600);

 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 RS485Slave_Init(160);



 dat[0] = 0xAA;
 dat[1] = 0xF0;
 dat[2] = 0x0F;
 dat[4] = 0;
 dat[5] = 0;
 dat[6] = 0;

 RCIE_bit = 1;
 TXIE_bit = 0;
 PEIE_bit = 1;
 GIE_bit = 1;








 for (i = 1; i <= 3; i++) {

 PORTB.F2=1;
 Delay_ms(50);
 PORTB.F2=0;

 PORTB.F3=1;
 Delay_ms(50);
 PORTB.F3=0;

 PORTB.F4=1;
 Delay_ms(50);
 PORTB.F4=0;
 }

 Delay_ms(500);

 while (1) {
 cnt++;
 if (dat[5]) {

 PORTB.F2=1;
 }
 if (dat[4]) {
 cnt = 0;
 dat[4] = 0;


 PORTB.F3=1;
 Delay_ms(50);
 PORTB.F3=0;


 dat[0] = dat[0]+1;
 Delay_ms(1);

 RS485Slave_Send(dat,1);


 }

 }

}
