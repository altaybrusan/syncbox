#line 1 "C:/Users/Burak/Desktop/uart ticket/interrupt18f.c"
unsigned int i;
int tmp = 0;

void blink () {

 for(i=0; i<5; i++) {

 PORTC.RC2 = 1;
 Delay_Ms(1000);
 PORTC.RC2 = 0;
 Delay_Ms(1000);

 }

 }





void interrupt(void){
#line 36 "C:/Users/Burak/Desktop/uart ticket/interrupt18f.c"
 tmp = 1;
 INT0IF_bit = 0;



 }
#line 66 "C:/Users/Burak/Desktop/uart ticket/interrupt18f.c"
 void main() {

 TRISB = 0;
 LATB = 0;

 INTCON2 = 0x0001;
 INT0IF_bit = 0;
 INT0IE_bit = 1;



 while(1) {
 while (tmp) {
 INTCON2 = 0x0000;
 LATB = 0xFF;
 Delay_ms(5000);
 LATB = 0x00;
 tmp = 0;
 INTCON2 = 0x0001;
 }
 }
}
