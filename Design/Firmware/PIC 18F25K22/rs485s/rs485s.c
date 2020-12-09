char dat[9];             // buffer for receving/sending messages
char i,j;
long cnt = 0;
// RS485 Pre-Configuration
sbit  rs485_rxtx_pin at RC2_bit;                // set transcieve pin
sbit  rs485_rxtx_pin_direction at TRISC2_bit;   // set transcieve pin direction    */



// Interrupt routine
void interrupt() {
 RS485Slave_Receive(dat);
}

void main() {

// Turn off comparators and Analog IO
  ADCON1 = 0x0F ;
  //CMCON  = 0x07 ;
  

  //C1ON_bit = 0;                      // Disable comparators
  //C2ON_bit = 0;


// Clear all ports

  PORTB = 0;
  PORTC = 0;
  //PORTD = 0;

// Set Ports B&D as output
  TRISB = 0;
  TRISC = 0;
  //TRISD = 0;



// Initialize UART1 module
  UART1_Init(9600);
  //Delay_ms(100);
  UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
  RS485Slave_Init(160);              // Intialize MCU as slave, address 160



  dat[0] = 0xAA;
  dat[1] = 0xF0;
  dat[2] = 0x0F;
  dat[4] = 0;                          // ensure that message received flag is 0
  dat[5] = 0;                          // ensure that error flag is 0
  dat[6] = 0;

  RCIE_bit = 1;                      // enable interrupt on UART1 receive
  TXIE_bit = 0;                      // disable interrupt on UART1 transmit
  PEIE_bit = 1;                      // enable peripheral interrupts
  GIE_bit = 1;                       // enable all interrupts



  //Port C[0,2] is used for addressing serial ports
 // PORTC.F0=1;
 // PORTC.F1=1;
  //PORTC.F2=0;

    for (i = 1; i <= 3; i++) {  // TEST LEDs

        PORTB.F2=1;
        Delay_ms(50);
        PORTB.F2=0;

        PORTB.F3=1;
        Delay_ms(50);
        PORTB.F3=0;

        PORTB.F4=1;
        Delay_ms(50);
        PORTB.F4=0;
      }

          Delay_ms(500);

  while (1) {
    cnt++;
    if (dat[5])  {                     // if an error detected, signal it
     // PORTD = 0xAA;                    //   by turning RED LED
      PORTB.F2=1;
    }
    if (dat[4]) {                      // if message received successfully
      cnt = 0;
      dat[4] = 0;                      // clear message received flag
      //j = dat[3];
        //PORTB = dat[i-1];
        PORTB.F3=1;
        Delay_ms(50);
        PORTB.F3=0;


      dat[0] = dat[0]+1;                // increment message by one
      Delay_ms(1);

      RS485Slave_Send(dat,1);     // send back to slave


    }

  }

}