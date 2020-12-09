
char dat[10];                          // buffer for receving/sending messages
char i,j;
long cnt = 0;

sbit  rs485_rxtx_pin  at RC2_bit;               // set transcieve pin
sbit  rs485_rxtx_pin_direction at TRISC2_bit;   // set transcieve pin direction

// Interrupt routine
void interrupt() {
  RS485Master_Receive(dat);
}

void main(){

  ADCON1 = 0x0F ;                         // Configure AN pins as digital I/O
  CMCON  = 0x07 ;                             // Disable comparators

  PORTB  = 0;
  PORTC  = 0;
  PORTD  = 0;

  TRISB  = 0;
  TRISC  = 0;
  TRISD  = 0;

  /*PORTD.F0=1;
  Delay_ms(1000);
  PORTD.F0=0;

  PORTD.F1=1;
  Delay_ms(1000);
  PORTD.F1=0; */



  UART1_Init(9600);                    // initialize UART1 module
  Delay_ms(100);

  RS485Master_Init();                  // initialize MCU as Master

  dat[0] = 0xAA;
  dat[1] = 0xF0;
  dat[2] = 0x0F;
  dat[4] = 0;                          // ensure that message received flag is 0
  dat[5] = 0;                          // ensure that error flag is 0
  dat[6] = 0;




    RCIE_bit = 1;                        // enable interrupt on UART1 receive
    TXIE_bit = 0;                        // disable interrupt on UART1 transmit
    PEIE_bit = 1;                        // enable peripheral interrupts
    GIE_bit = 1;                         // enable all interrupts

    for (i = 1; i <= 3; i++) {  // TEST LEDs

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
                                       // upon completed valid message receiving
                                       //   data[4] is set to 255
    cnt++;
    if (dat[5])  {                     // if an error detected, signal it
      //PORTD = 0xAA;                    //   by turning RED LED
      PORTD.F0=1;
    }
    if (dat[4]) {                      // if message received successfully
      cnt = 0;
      dat[4] = 0;                      // clear message received flag
      j = dat[3];
        PORTB = dat[i-1];
        PORTD.F1=1;
        Delay_ms(50);
        PORTD.F1=0;


      dat[0] = dat[0]+1;                // increment message by one
      Delay_ms(1);
      RS485Master_Send(dat,1,160);     // send back to slave


    }
   if (cnt > 100000) {
     for (i = 1; i <= 4; i++) {  // Blink White LED  (Error in communication)
        PORTB = dat[i-1];
        PORTD.F2=1;
        Delay_ms(100);
        PORTD.F2=0;
      }
      cnt = 0;
      RS485Master_Send(dat,1,50);    //   send message on broadcast address
     }
  }

}