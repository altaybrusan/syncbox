#line 1 "C:/Users/Burak/Desktop/16fdeneme/Interrupt On Change.c"
#line 1 "c:/users/burak/desktop/16fdeneme/flash_functions.h"
void Delay250();
void Delay150();
void FlashD1();
void FlashD4();
void FlashD5();
void FlashD6();
void FlashD7();
void FlashIt(char what);
#line 36 "C:/Users/Burak/Desktop/16fdeneme/Interrupt On Change.c"
char pressedButton;
bit flag;

void interrupt(){
 if(RBIF_bit == 1 ) {
 flag = 1;
 RBIF_bit = 0;
 if (PORTB.F7 == 1){
 pressedButton = 7;
 }
 if (PORTB.F6 == 1){
 pressedButton = 6;
 }
 if (PORTB.F5 == 1){
 pressedButton = 5;
 }
 if (PORTB.F4 == 1){
 pressedButton = 4;
 }
 }
}

void main() {
 flag = 0;
 pressedButton = 0;

 ADCON1 = 0b00001111;
 TRISB = 0b11111111;;
 LATD = 0b00000000;
 TRISD = 0;
 RBIE_bit = 1;
 RBIF_bit = 0;
 GIE_bit = 1;


 while(1) {

 if(flag) {
 switch(pressedButton) {
 case 4:
 FlashIt(0x03);
 pressedButton = 0;
 break;
 case 5:
 FlashIt(0x0C);
 pressedButton = 0;
 break;
 case 6:
 FlashIt(0x30);
 pressedButton = 0;
 break;
 case 7:
 FlashIt(0xC0);
 pressedButton = 0;
 break;
 default:



 break;
 }
 flag = 0;
 }
 }
}
