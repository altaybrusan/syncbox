   void main() {
     TRISC = 0x00;
     for(;;){

     PORTC.F4=0;
     Delay_Ms(1000);
     PORTC.F4=1;
     Delay_Ms(1000);
     }
}