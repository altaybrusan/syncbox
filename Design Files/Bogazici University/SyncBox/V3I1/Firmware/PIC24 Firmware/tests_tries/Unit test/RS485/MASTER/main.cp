#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/RS485/MASTER/main.c"
#line 33 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/Unit test/RS485/MASTER/main.c"
sbit rs485_rxtx_pin at RF2_bit;
sbit rs485_rxtx_pin_direction at TRISF2_bit;

char dat[10];
char i;


void interrupt() org IVT_ADDR_U2RXINTERRUPT {
 U2RXIF_bit = 0;
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 RS485Master_Receive(dat);


}

unsigned char _byteVal[1] = {' '};
unsigned char _byte1Val[1] = {' '};
unsigned char _byte2Val[1] = {' '};
unsigned char _byte3Val[1] = {' '};

long cnt = 0;
unsigned char _cntStr[3]={' ',' ',' '};
void main(){



 PLLFBD = 70;
 CLKDIV = 0x0000;

 ANSELA = 0x00;
 ANSELB = 0x00;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;

 PORTA=0x00;
 PORTB=0x00;
 PORTC=0x00;
 PORTE=0x00;
 PORTF=0x00;
 PORTG=0x00;


 PPS_Mapping(124, _INPUT, _U1RX);
 PPS_Mapping(125, _OUTPUT, _U1TX);


 PPS_Mapping(68, _INPUT, _U2RX);
 PPS_Mapping(69, _OUTPUT, _U2TX);

 UART1_Init(9600);
 Delay_ms(100);

 UART2_Init(9600);
 Delay_ms(100);

 RS485Master_Init();


 dat[0] = 0xAA;
 dat[1] = 0xF0;
 dat[2] = 0x0F;
 dat[4] = 0;
 dat[5] = 0;
 dat[6] = 0;

 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 RS485Master_Send(dat,1,160);

 NSTDIS_bit = 1;
 U2RXIF_bit = 0;
 U2RXIE_bit = 1;
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n MASTER STARTED... ");

 while (1){



 cnt++;
 if (dat[5])
 {

 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n MASTER RECEIVED ERROR");
 }
 if (dat[4]) {

 cnt = 0;
 dat[4] = 0;

 if(dat[3] <= 1)
 {
 ByteToStr(dat[0],_byte1Val);
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n BYTE 1: ");
 UART1_Write(_byte1Val);
 }
 if(dat[3] <= 2)
 {
 ByteToStr(dat[1],_byte2Val);
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n BYTE 2: ");
 UART1_Write(_byte2Val);
 }
 if(dat[3] <= 3)
 {
 ByteToStr(dat[2],_byte3Val);
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n BYTE 3: ");
 UART1_Write(_byte3Val);
 }

 dat[0] = dat[0]+1;
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 RS485Master_Send(dat,1,160);

 ByteToStr(dat[0],_byteVal);
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n MASTER SENT VALUE: ");
 UART1_Write(_byteVal);
 Delay_ms(3000);
 }
 LongToStr(cnt,_cntStr);
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n COUNTER VALUE: ");
 UART1_Write_Text(_cntStr);
 if (cnt > 100000) {

 cnt = 0;
 UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
 UART1_Write_Text("\n MASTER RESET COUNTER... ");
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 RS485Master_Send(dat,1,160);
 Delay_ms(3000);


 }
 }
 }
