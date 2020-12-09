#line 1 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/try_delayIntrupt/main.c"
#line 52 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/try_delayIntrupt/main.c"
void InitTimer1(){
 T1CON = 0x8020;
 T1IE_bit = 1;
 T1IF_bit = 0;
 IPC0 = IPC0 | 0x1000;
 PR1 = 21875;
}

void Timer1Interrupt() iv IVT_ADDR_T1INTERRUPT{
 T1IF_bit = 0;

  UART3_Write_Text("\r DEMO") ;
}


void InitializePICSpeed()
{

 PLLFBD = 70;
 CLKDIV = 0x0000;
}


void InitializePICPins()
{

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

}
#line 106 "C:/Users/Altay/Documents/Altium/Projects/SyncBox/Work/Bogazici University/SyncBox/V3I1/Software/PIC24 Firmware/tests_tries/try_delayIntrupt/main.c"
void InitializeUARTS()
{




 PPS_Mapping( 100 , _INPUT, _U1RX);
 PPS_Mapping( 101 , _OUTPUT, _U1TX);
 Delay_ms(200);


 PPS_Mapping( 108 , _INPUT, _U2RX);
 PPS_Mapping( 109 , _OUTPUT, _U2TX);
 Delay_ms(200);

 PPS_Mapping( 124 , _INPUT, _U3RX);
 PPS_Mapping( 125 , _OUTPUT, _U3TX);
 Delay_ms(200);


 UART1_Init_Advanced( 9600 , _UART_8BIT_NOPARITY,_UART_TWO_STOPBITS,_UART_LOW_SPEED);
 Delay_ms(200);


 UART2_Init_Advanced( 9600 ,  _UART_8BIT_NOPARITY ,  _UART_TWO_STOPBITS , _UART_LOW_SPEED );
 Delay_ms(200);

 UART3_Init_Advanced( 9600 ,  _UART_8BIT_NOPARITY ,  _UART_TWO_STOPBITS , _UART_LOW_SPEED );
 Delay_ms(200);



 U1RXIE_bit = 1; U2RXIE_bit = 1; U3RXIE_bit = 1;
 U1RXIF_bit = 0; U2RXIF_bit = 0; U3RXIF_bit = 0;

}

void InitializeBuzzer()
{
 Sound_Init( &PORTD ,  3 );
}

void InitializeTimers()
{
 IPC0.B12=1;
 IPC0.B13=1;
 IPC0.B14=1;
}


void foo(){ Delay_ms(1000);}


void main() {

 InitializePICSpeed();
 InitializeUARTS();
 InitializeBuzzer();
 InitializeTimers();


 Sound_Play(1600, 100);



 InitTimer1();
 foo();

 while(1);


}
