void Delay250() {
  Delay_ms(250);                // Waits for 250 ms
}

void Delay150() {
  Delay_ms(150);                // Waits for 150 ms
}

void FlashIt(char hexCode){     // Flashes LEDs two times
  LATD = hexCode;               // Writes hex to to PORTD
  Delay150();                   // Short pause
  LATD = 0;                     // Clears PORTD
  Delay250(); Delay250();       // Pause
  LATD = hexCode;               // Writes hex to to PORTD second time
  Delay150();                   // Short pause
  LATD = 0;                     // Clears PORTD
  Delay250(); Delay250();       // Pause
  LATD = hexCode;               // Writes hex to to PORTD second time
  Delay150();                   // Short pause
  LATD = 0;                     // Clears PORTD
  Delay250(); Delay250();       // Pause

}