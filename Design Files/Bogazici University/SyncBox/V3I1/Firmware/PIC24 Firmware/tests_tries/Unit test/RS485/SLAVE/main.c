sbit rs485_rxtx_pin at RF2_bit;               // set transcieve pin
sbit rs485_rxtx_pin_direction at TRISF2_bit;   // set transcieve pin direction

char dat[9];             // buffer for receving/sending messages
char i;
unsigned char _byte1Val[1]={' '};
unsigned char _byte2Val[1]={' '};
unsigned char _byte3Val[1]={' '};

// Interrupt routine
void interrupt() iv IVT_ADDR_U2RXINTERRUPT{
  RS485Slave_Receive(dat);
  UART1_Write("\n SLAVE RECEIVED MESSAGE");
  U2RXIF_bit = 0;                     // ensure interrupt not pending
}

void main() {

   // Setting output frequency to 140MHz
    PLLFBD = 70;             // PLL multiplier M=70
    CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

    ANSELA = 0x00;           // Convert all I/O pins to digital
    ANSELB = 0x00;
    ANSELC = 0x00;
    ANSELD = 0x00;
    ANSELE = 0x00;
    ANSELG = 0x00;

    PORTA=0x00;               // Set pins to zero volt
    PORTB=0x00;
    PORTC=0x00;
    PORTE=0x00;
    PORTF=0x00;
    PORTG=0x00;
    

    //UART 1 : for debuging RS-232
    PPS_Mapping(124, _INPUT,  _U1RX);
    PPS_Mapping(125, _OUTPUT, _U1TX);

    //UART 2 : RS485 Master
    PPS_Mapping(68, _INPUT,  _U2RX);
    PPS_Mapping(69, _OUTPUT, _U2TX);

    UART1_Init(9600);                    // initialize UART1 module
    Delay_ms(100);

    UART2_Init(9600);                    // initialize UART2 module
    Delay_ms(100);

    RS485Slave_Init(160);               // Intialize MCU as slave, address 160

    dat[0] = 0xAA;
    dat[1] = 0xF0;
    dat[2] = 0x0F;
    dat[4] = 0;                         // ensure that message received flag is 0
    dat[5] = 0;                         // ensure that error flag is 0
    dat[6] = 0;
    NSTDIS_bit = 1;                     // no nesting of interrupts
    U2RXIF_bit = 0;                     // ensure interrupt not pending
    U2RXIE_bit = 1;                     // enable intterupt
    
    UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
    UART1_WRITE_TEXT("\nSLAVE STARTED...\n");
    UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active

  while (1) {
    if (dat[5])  
    {                    // if an error detected, signal it by
      UART1_Write("\n SLAVE RECEIVED ERROR");
      
    }
    if (dat[4]) 
    { // upon completed valid message receive
       dat[4] = 0;                      // clear message received flag

      if(dat[3] <= 1)
       {
         ByteToStr(dat[0],_byte1Val);
         UART1_Write_Text("\n BYTE 1: ");
         UART1_Write(_byte1Val);
       }
      if(dat[3] <= 2)
       { 
         ByteToStr(dat[1],_byte2Val); 
         UART1_Write_Text("\n BYTE 2: ");
         UART1_Write(_byte2Val);
       }
      if(dat[3] <= 3)
       { 
         ByteToStr(dat[2],_byte3Val);
         UART1_Write_Text("\n BYTE 3: ");
         UART1_Write(_byte3Val);
       }
                              // increment received dat[0]
      dat[0] = dat[0]+1;               // send back to master
      RS485Slave_Send(dat,1);
    }
  }
}