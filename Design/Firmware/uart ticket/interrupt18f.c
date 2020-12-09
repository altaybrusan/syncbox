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


                                    // Clear Interrupt Flag

               
void interrupt(void){
//char tmp;
     //INTCON.GIE = 0;
     
    /* if(INT0IF_bit) {
     
       RB7_bit = 1;
     
     //tmp=PORTB;  //This two lines have to be added before
     //PORTB=tmp;  //clearing flag otherwise it won't work properly
     INT0IF_bit=0;
     blink();
               
                       }    */
                       
    tmp = 1;                                            // Increment variable cnt
    INT0IF_bit = 0;
     //INTCON.INT0IF = 0;
     //INTCON.GIE = 1;

                       }
     


  
  
  
/*void main() {

TRISB = 1;
TRISC = 0;

blink();
RB7_bit = 1;
delay_ms(1000);
RB7_bit = 0;

//ADCON = 0;

GIE_bit = 1;
INT0IE_bit = 1;
INT0IF_bit = 0;

              }  */
              
              void main() {                                         // Main program

  TRISB = 0;                                          // Set PortB as output
  LATB = 0;                                           // Starting value for PortB

  INTCON = 0x0001;                                   // Setup INT0 pin to interupt on falling edge
  INT0IF_bit = 0;                                    // Reset INT0 interrupt flag
  INT0IE_bit = 1;                                    // Enable INT0 Interrupt Service Routine

  //TRISA.B11 = 1;                                      // Set PortA.11 as input

  while(1) {                                          // Unending loop
    while (tmp) {
      INTCON = 0x0000;                               // Disable interrupts
      LATB = 0xFF;                                    // Turn on PortB
      Delay_ms(5000);                                 // Wait for 5 seconds
      LATB = 0x00;                                    // Turn off PortB
      tmp = 0;                                        // Clear tmp variable
      INTCON = 0x0001;                               // Enable interrupts
    }
  }
}