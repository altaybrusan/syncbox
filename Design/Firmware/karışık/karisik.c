#include "__Lib_ECAN1_Defs.h"

unsigned int Can_Init_Flags, Can_Send_Flags, Can_Rcv_Flags;  // can flags
unsigned int Rx_Data_Len;                                    // received data length in bytes
char RxTx_Data[8];                                           // can rx/tx data buffer
char Msg_Rcvd;                                               // reception flag
const unsigned long ID_1st = 12111, ID_2nd = 3;              // node IDs
unsigned long Rx_ID;

char uart_rd;
char cnt;
unsigned int oldstate;
char readbuff[64];
char writebuff[64];

// TFT module connections
char TFT_DataPort at LATE;
sbit TFT_RST at LATD7_bit;
sbit TFT_BLED at LATD2_bit;
sbit TFT_RS at LATD9_bit;
sbit TFT_CS at LATD10_bit;
sbit TFT_RD at LATD5_bit;
sbit TFT_WR at LATD4_bit;
char TFT_DataPort_Direction at TRISE;
sbit TFT_RST_Direction at TRISD7_bit;
sbit TFT_BLED_Direction at TRISD2_bit;
sbit TFT_RS_Direction at TRISD9_bit;
sbit TFT_CS_Direction at TRISD10_bit;
sbit TFT_RD_Direction at TRISD5_bit;
sbit TFT_WR_Direction at TRISD4_bit;
// End TFT module connections

void C1Interrupt(void) org IVT_ADDR_C1INTERRUPT{             // ECAN event iterrupt
  IFS2bits.C1IF = 0;                                         // clear ECAN interrupt flag
  if(C1INTFbits.TBIF) {                                      // was it tx interrupt?
    C1INTFbits.TBIF = 0;                                     // if yes clear tx interrupt flag
  }

  if(C1INTFbits.RBIF) {                                      // was it rx interrupt
    C1INTFbits.RBIF = 0;                                     // if yes clear rx interrupt flag
  }
}



void USB1Interrupt() iv IVT_ADDR_USB1INTERRUPT{
  USB_Interrupt_Proc();
}

void main(void){
   // Setting output frequency to 140MHz
  PLLFBD = 70;             // PLL multiplier M=70
  CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

  // Setring USB frequency to 48MHz
     // Using primary oscillator (8MHz) with APLL
  ACLKCON3 = 0xB4C1;       // Use primary oscillator (8MHz), APLL prescaler N1=2, APLL postscaler N2=2
  ACLKDIV3 = 0x0007;       // APLL multiplier M=24

  PPS_Mapping(100, _INPUT,  _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
  PPS_Mapping(101, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it
  
  PPS_Mapping(112, _INPUT, _C1RX);    //RD1
  PPS_Mapping(113, _OUTPUT, _C1TX);   //RD2

  PLLPRE_0_bit = 0;
  PLLPRE_1_bit = 0;
  PLLPRE_2_bit = 0;
  PLLPRE_3_bit = 0;
  PLLPRE_4_bit = 0;

  PLLFBD = 38;             // PLL multiplier M=38

  PLLPOST_0_bit = 0;
  PLLPOST_1_bit = 0;
  
  
  
  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;
  
  IFS0=0;
  IFS1=0;
  IFS2=0;
  IFS3=0;
  IFS4=0;
  
  IEC2bits.C1IE   = 1;                             // enable ECAN1 interrupt
  C1INTEbits.TBIE = 1;                             // enable ECAN1 tx interrupt
  C1INTEbits.RBIE = 1;                             // enable ECAN1 rx interrupt

  PORTB = 0;                                       // clear PORTB
  TRISB = 0;                                       // set PORTB as output,

  PORTC = 0;                                       // clear PORTB
  TRISC = 0;


  TRISA = 0;             // Initialize PORTA as output
  LATA = 0;              // Set PORTA to zero

  PORTD = 0;
  TRISD = 0;


  TRISA14_bit = 1;         // Set PORTA.15 pin as input



 TFT_Init_ILI9341_8bit(320, 240);
  TFT_Fill_Screen(CL_WHITE);






  UART1_Init(9600);              // Initialize UART module at 56000 bps
  Delay_ms(500);  
  TFT_Fill_Screen(CL_WHITE);
        TFT_Write_Text("UART", 160, 160);
        Delay_ms(1000);
        TFT_Fill_Screen(CL_WHITE);
        LATB = ~PORTB;       // Invert PORTD value
        Delay_ms(500);
        LATB = 0;                // Wait for UART module to stabilize
  UART1_Write_Text("Start");
  UART1_Write(13);
  UART1_Write(10);



  
  
  Can_Init_Flags = 0;                              //
  Can_Send_Flags = 0;                              // clear flags
  Can_Rcv_Flags  = 0;                              //

  Can_Send_Flags = _ECAN_TX_PRIORITY_0 &           // form value to be used
                   _ECAN_TX_XTD_FRAME &            // with CANSendMessage
                   _ECAN_TX_NO_RTR_FRAME;

  Can_Init_Flags = _ECAN_CONFIG_SAMPLE_THRICE &    // form value to be used
                   _ECAN_CONFIG_PHSEG2_PRG_ON &    // with CANInitialize
                   _ECAN_CONFIG_XTD_MSG &
                   _ECAN_CONFIG_MATCH_MSG_TYPE &
                   _ECAN_CONFIG_LINE_FILTER_OFF;

  ECAN1DmaChannelInit(0, 1, &ECAN1RxTxRAMBuffer);  // init dma channel 0 for
                                                   // dma to ECAN peripheral transfer
  ECAN1DmaChannelInit(2, 0, &ECAN1RxTxRAMBuffer);  // init dma channel 2 for
                                                   // ECAN peripheral to dma transfer
  ECAN1Initialize(1, 3, 3, 3, 1, Can_Init_Flags);  // initialize ECAN
  ECAN1SetBufferSize(ECAN1RAMBUFFERSIZE);          // set number of rx+tx buffers in DMA RAM

  ECAN1SelectTxBuffers(0x000F);                    // select transmit buffers
                                                   // 0x000F = buffers 0:3 are transmit buffers
  ECAN1SetOperationMode(_ECAN_MODE_CONFIG,0xFF);   // set CONFIGURATION mode

  ECAN1SetMask(_ECAN_MASK_0, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);            // set all mask1 bits to ones
  ECAN1SetMask(_ECAN_MASK_1, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);            // set all mask2 bits to ones
  ECAN1SetMask(_ECAN_MASK_2, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);            // set all mask3 bits to ones
  ECAN1SetFilter(_ECAN_FILTER_10,ID_1st, _ECAN_MASK_2, _ECAN_RX_BUFFER_7, _ECAN_CONFIG_XTD_MSG); // set id of filter10 to 1st node ID
                                                                                                 // assign mask2 to filter10
                                                                                                 // assign buffer7 to filter10
  ECAN1SetOperationMode(_ECAN_MODE_NORMAL,0xFF);   // set NORMAL mode



  LATA = ~PORTA;       // Invert PORTA value
  Delay_ms(2000);
  LATA = 0;
  while (1) {
    Msg_Rcvd = ECAN1Read(&Rx_ID , RxTx_Data , &Rx_Data_Len, &Can_Rcv_Flags);  // receive message
    if ((Rx_ID == ID_1st) && Msg_Rcvd) {                                      // if message received check id
      PORTB = RxTx_Data[0];

      LATA = ~PORTA;       // Invert PORTA value
      Delay_ms(500);
      LATA = 0;                                                  // id correct, output data at PORTB
      TFT_Fill_Screen(CL_RED);
      TFT_Write_Text("ECAN", 60, 60);
      Delay_ms(500);
      TFT_Fill_Screen(CL_WHITE);
      RxTx_Data[0]++ ;                                                        // increment received data
      ECAN1Write(ID_2nd, RxTx_Data, 1, Can_Send_Flags);                       // send incremented data back
    }
  }
  

  HID_Enable(&readbuff,&writebuff);
  while(1){
    while(!HID_Read());

    for(cnt=0;cnt<64;cnt++)
      writebuff[cnt]=readbuff[cnt];

    while(!HID_Write(&writebuff,64));

    TFT_Fill_Screen(CL_WHITE);
    TFT_Write_Text(&writebuff, 60, 60);
    Delay_ms(1000);
    TFT_Fill_Screen(CL_WHITE);


  }
  
  
  while (1) {

    if (UART1_Data_Ready()) {     // If data is received


     TFT_Write_Text("start", 260, 60);

      uart_rd = UART1_Read();     // read the received data

        TFT_Fill_Screen(CL_WHITE);
        TFT_Write_Text("UART", 160, 160);
        Delay_ms(1000);
        TFT_Fill_Screen(CL_WHITE);
        LATB = ~PORTB;       // Invert PORTD value
        Delay_ms(500);
        LATB = 0;
        UART1_Write(uart_rd);       // and send data via UART


    }
  }
}