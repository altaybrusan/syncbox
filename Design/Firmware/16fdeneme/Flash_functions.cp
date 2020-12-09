#line 1 "C:/Users/Burak/Desktop/16fdeneme/Flash_functions.c"
void Delay250() {
 Delay_ms(250);
}

void Delay150() {
 Delay_ms(150);
}

void FlashIt(char hexCode){
 LATD = hexCode;
 Delay150();
 LATD = 0;
 Delay250(); Delay250();
 LATD = hexCode;
 Delay150();
 LATD = 0;
 Delay250(); Delay250();
 LATD = hexCode;
 Delay150();
 LATD = 0;
 Delay250(); Delay250();

}
