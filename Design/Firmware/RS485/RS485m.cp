#line 1 "C:/Users/Burak/Desktop/SyncBox Kodlarý/RS485/RS485m.c"

char dat[10];
char i,j;
long cnt = 0;

sbit rs485_rxtx_pin at RC2_bit;
sbit rs485_rxtx_pin_direction at TRISC2_bit;


void interrupt() {
 RS485Master_Receive(dat);
}

void main(){

 ADCON1 = 0x0F ;
 CMCON = 0x07 ;

 PORTB = 0;
 PORTC = 0;
 PORTD = 0;

 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
#line 37 "C:/Users/Burak/Desktop/SyncBox Kodlarý/RS485/RS485m.c"
 UART1_Init(9600);
 Delay_ms(100);

 RS485Master_Init();

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

 PORTD.F0=1;
 Delay_ms(50);
 PORTD.F0=0;

 PORTD.F1=1;
 Delay_ms(50);
 PORTD.F1=0;

 PORTD.F2=1;
 Delay_ms(50);
 PORTD.F2=0;
 }

 Delay_ms(500);

 RS485Master_Send(dat,1,160);

 while (1){


 cnt++;
 if (dat[5]) {

 PORTD.F0=1;
 }
 if (dat[4]) {
 cnt = 0;
 dat[4] = 0;
 j = dat[3];
 PORTB = dat[i-1];
 PORTD.F1=1;
 Delay_ms(50);
 PORTD.F1=0;


 dat[0] = dat[0]+1;
 Delay_ms(1);
 RS485Master_Send(dat,1,160);


 }
 if (cnt > 100000) {
 for (i = 1; i <= 4; i++) {
 PORTB = dat[i-1];
 PORTD.F2=1;
 Delay_ms(100);
 PORTD.F2=0;
 }
 cnt = 0;
 RS485Master_Send(dat,1,50);
 }
 }

}
