#line 1 "C:/Users/Burak/Desktop/16f/MyProject.c"
#line 25 "C:/Users/Burak/Desktop/16f/MyProject.c"
int cnt = 0;

void interrupt(){
 if(INTCON.INTF == 1 ){
 cnt++;
 INTCON.INTF = 0;
 }
}

void main() {
#line 42 "C:/Users/Burak/Desktop/16f/MyProject.c"
 PORTB.F7 = 1;
 delay_ms(500);
 PORTB.F7 = 0;

 TRISB = 0x01;
 TRISD = 0x00;

 PORTD = 0x00;

 INTCON = 0x90;




 while(1){
 PORTD = cnt;
 }
}
