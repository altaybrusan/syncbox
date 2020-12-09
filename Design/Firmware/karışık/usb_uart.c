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

  ANSELA = 0x00;           // Convert all I/O pins to digital
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;
  
  PORTD = 0;






 TFT_Init_ILI9341_8bit(320, 240);
  TFT_Fill_Screen(CL_WHITE);

 UART1_Init(9600);              // Initialize UART module at 56000 bps
  Delay_ms(500);                  // Wait for UART module to stabilize
  UART1_Write_Text("Start");
  UART1_Write(13);
  UART1_Write(10);
  TFT_Write_Text("start uart", 60, 60);
  Delay_ms(1000);
        TFT_Fill_Screen(CL_WHITE);
  while (1) {

    if (UART1_Data_Ready()==1) {     // If data is received




      uart_rd = UART1_Read();     // read the received data
             // and send data via UART



        TFT_Fill_Screen(CL_WHITE);
        TFT_Write_Text(uart_rd, 160, 160);
        Delay_ms(1000);
        TFT_Fill_Screen(CL_WHITE);
        LATD = ~PORTD;       // Invert PORTD value
        Delay_ms(500);
        LATD = 0;
        UART1_Write(uart_rd);

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
  

  

}