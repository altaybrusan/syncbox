#line 1 "C:/Users/Burak/Desktop/18f25k22/LED.c"
 void main() {
 TRISC = 0x00;
 for(;;){

 PORTC.F4=0;
 Delay_Ms(1000);
 PORTC.F4=1;
 Delay_Ms(1000);
 }
}
