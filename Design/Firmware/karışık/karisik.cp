#line 1 "C:/Users/Burak/Desktop/karýþýk/karisik.c"
#line 1 "c:/users/burak/desktop/karýþýk/__lib_ecan1_defs.h"
#line 13 "c:/users/burak/desktop/karýþýk/__lib_ecan1_defs.h"
typedef
 struct {
 struct {
 IDE : 1;
 SRR : 1;
 SID : 11;
 : 3;
 } CxTRBnSID;
 struct {
 EID17_6 : 12;
 : 4;
 } CxTRBnEID;
 struct {
 DLC : 4;
 RB0 : 1;
 : 3;
 RB1 : 1;
 RTR : 1;
 EID5_0 : 6;
 } CxTRBnDLC;
 struct d{
 char Data[8];
 } CxTRBnData;
 struct {
 : 8;
 FILHIT : 5;

 : 3;
 } CxTRBnSTAT;
 } __RxTxBuffer;
#line 58 "c:/users/burak/desktop/karýþýk/__lib_ecan1_defs.h"
__RxTxBuffer far dma ECAN1RxTxRAMBuffer[ 16 ];

__RxTxBuffer far dma ECAN2RxTxRAMBuffer[ 16 ];
#line 3 "C:/Users/Burak/Desktop/karýþýk/karisik.c"
unsigned int Can_Init_Flags, Can_Send_Flags, Can_Rcv_Flags;
unsigned int Rx_Data_Len;
char RxTx_Data[8];
char Msg_Rcvd;
const unsigned long ID_1st = 12111, ID_2nd = 3;
unsigned long Rx_ID;

char uart_rd;
char cnt;
unsigned int oldstate;
char readbuff[64];
char writebuff[64];


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


void C1Interrupt(void) org IVT_ADDR_C1INTERRUPT{
 IFS2bits.C1IF = 0;
 if(C1INTFbits.TBIF) {
 C1INTFbits.TBIF = 0;
 }

 if(C1INTFbits.RBIF) {
 C1INTFbits.RBIF = 0;
 }
}



void USB1Interrupt() iv IVT_ADDR_USB1INTERRUPT{
 USB_Interrupt_Proc();
}

void main(void){

 PLLFBD = 70;
 CLKDIV = 0x0000;



 ACLKCON3 = 0xB4C1;
 ACLKDIV3 = 0x0007;

 PPS_Mapping(100, _INPUT, _U1RX);
 PPS_Mapping(101, _OUTPUT, _U1TX);

 PPS_Mapping(112, _INPUT, _C1RX);
 PPS_Mapping(113, _OUTPUT, _C1TX);

 PLLPRE_0_bit = 0;
 PLLPRE_1_bit = 0;
 PLLPRE_2_bit = 0;
 PLLPRE_3_bit = 0;
 PLLPRE_4_bit = 0;

 PLLFBD = 38;

 PLLPOST_0_bit = 0;
 PLLPOST_1_bit = 0;



 ANSELA = 0x00;
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

 IEC2bits.C1IE = 1;
 C1INTEbits.TBIE = 1;
 C1INTEbits.RBIE = 1;

 PORTB = 0;
 TRISB = 0;

 PORTC = 0;
 TRISC = 0;


 TRISA = 0;
 LATA = 0;

 PORTD = 0;
 TRISD = 0;


 TRISA14_bit = 1;



 TFT_Init_ILI9341_8bit(320, 240);
 TFT_Fill_Screen(CL_WHITE);






 UART1_Init(9600);
 Delay_ms(500);
 TFT_Fill_Screen(CL_WHITE);
 TFT_Write_Text("UART", 160, 160);
 Delay_ms(1000);
 TFT_Fill_Screen(CL_WHITE);
 LATB = ~PORTB;
 Delay_ms(500);
 LATB = 0;
 UART1_Write_Text("Start");
 UART1_Write(13);
 UART1_Write(10);





 Can_Init_Flags = 0;
 Can_Send_Flags = 0;
 Can_Rcv_Flags = 0;

 Can_Send_Flags = _ECAN_TX_PRIORITY_0 &
 _ECAN_TX_XTD_FRAME &
 _ECAN_TX_NO_RTR_FRAME;

 Can_Init_Flags = _ECAN_CONFIG_SAMPLE_THRICE &
 _ECAN_CONFIG_PHSEG2_PRG_ON &
 _ECAN_CONFIG_XTD_MSG &
 _ECAN_CONFIG_MATCH_MSG_TYPE &
 _ECAN_CONFIG_LINE_FILTER_OFF;

 ECAN1DmaChannelInit(0, 1, &ECAN1RxTxRAMBuffer);

 ECAN1DmaChannelInit(2, 0, &ECAN1RxTxRAMBuffer);

 ECAN1Initialize(1, 3, 3, 3, 1, Can_Init_Flags);
 ECAN1SetBufferSize( 16 );

 ECAN1SelectTxBuffers(0x000F);

 ECAN1SetOperationMode(_ECAN_MODE_CONFIG,0xFF);

 ECAN1SetMask(_ECAN_MASK_0, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);
 ECAN1SetMask(_ECAN_MASK_1, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);
 ECAN1SetMask(_ECAN_MASK_2, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);
 ECAN1SetFilter(_ECAN_FILTER_10,ID_1st, _ECAN_MASK_2, _ECAN_RX_BUFFER_7, _ECAN_CONFIG_XTD_MSG);


 ECAN1SetOperationMode(_ECAN_MODE_NORMAL,0xFF);



 LATA = ~PORTA;
 Delay_ms(2000);
 LATA = 0;
 while (1) {
 Msg_Rcvd = ECAN1Read(&Rx_ID , RxTx_Data , &Rx_Data_Len, &Can_Rcv_Flags);
 if ((Rx_ID == ID_1st) && Msg_Rcvd) {
 PORTB = RxTx_Data[0];

 LATA = ~PORTA;
 Delay_ms(500);
 LATA = 0;
 TFT_Fill_Screen(CL_RED);
 TFT_Write_Text("ECAN", 60, 60);
 Delay_ms(500);
 TFT_Fill_Screen(CL_WHITE);
 RxTx_Data[0]++ ;
 ECAN1Write(ID_2nd, RxTx_Data, 1, Can_Send_Flags);
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

 if (UART1_Data_Ready()) {


 TFT_Write_Text("start", 260, 60);

 uart_rd = UART1_Read();

 TFT_Fill_Screen(CL_WHITE);
 TFT_Write_Text("UART", 160, 160);
 Delay_ms(1000);
 TFT_Fill_Screen(CL_WHITE);
 LATB = ~PORTB;
 Delay_ms(500);
 LATB = 0;
 UART1_Write(uart_rd);


 }
 }
}
