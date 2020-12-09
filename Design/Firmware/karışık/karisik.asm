
_C1Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;karisik.c,33 :: 		void C1Interrupt(void) org IVT_ADDR_C1INTERRUPT{             // ECAN event iterrupt
;karisik.c,34 :: 		IFS2bits.C1IF = 0;                                         // clear ECAN interrupt flag
	BCLR	IFS2bits, #3
;karisik.c,35 :: 		if(C1INTFbits.TBIF) {                                      // was it tx interrupt?
	BTSS	C1INTFbits, #0
	GOTO	L_C1Interrupt0
;karisik.c,36 :: 		C1INTFbits.TBIF = 0;                                     // if yes clear tx interrupt flag
	BCLR	C1INTFbits, #0
;karisik.c,37 :: 		}
L_C1Interrupt0:
;karisik.c,39 :: 		if(C1INTFbits.RBIF) {                                      // was it rx interrupt
	BTSS	C1INTFbits, #1
	GOTO	L_C1Interrupt1
;karisik.c,40 :: 		C1INTFbits.RBIF = 0;                                     // if yes clear rx interrupt flag
	BCLR	C1INTFbits, #1
;karisik.c,41 :: 		}
L_C1Interrupt1:
;karisik.c,42 :: 		}
L_end_C1Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _C1Interrupt

_USB1Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;karisik.c,46 :: 		void USB1Interrupt() iv IVT_ADDR_USB1INTERRUPT{
;karisik.c,47 :: 		USB_Interrupt_Proc();
	CALL	_USB_Interrupt_Proc
;karisik.c,48 :: 		}
L_end_USB1Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _USB1Interrupt

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;karisik.c,50 :: 		void main(void){
;karisik.c,52 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#70, W0
	MOV	WREG, PLLFBD
;karisik.c,53 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;karisik.c,57 :: 		ACLKCON3 = 0xB4C1;       // Use primary oscillator (8MHz), APLL prescaler N1=2, APLL postscaler N2=2
	MOV	#46273, W0
	MOV	WREG, ACLKCON3
;karisik.c,58 :: 		ACLKDIV3 = 0x0007;       // APLL multiplier M=24
	MOV	#7, W0
	MOV	WREG, ACLKDIV3
;karisik.c,60 :: 		PPS_Mapping(100, _INPUT,  _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;karisik.c,61 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;karisik.c,63 :: 		PPS_Mapping(112, _INPUT, _C1RX);    //RD1
	MOV.B	#45, W12
	MOV.B	#1, W11
	MOV.B	#112, W10
	CALL	_PPS_Mapping
;karisik.c,64 :: 		PPS_Mapping(113, _OUTPUT, _C1TX);   //RD2
	MOV.B	#14, W12
	CLR	W11
	MOV.B	#113, W10
	CALL	_PPS_Mapping
;karisik.c,66 :: 		PLLPRE_0_bit = 0;
	BCLR	PLLPRE_0_bit, BitPos(PLLPRE_0_bit+0)
;karisik.c,67 :: 		PLLPRE_1_bit = 0;
	BCLR	PLLPRE_1_bit, BitPos(PLLPRE_1_bit+0)
;karisik.c,68 :: 		PLLPRE_2_bit = 0;
	BCLR	PLLPRE_2_bit, BitPos(PLLPRE_2_bit+0)
;karisik.c,69 :: 		PLLPRE_3_bit = 0;
	BCLR	PLLPRE_3_bit, BitPos(PLLPRE_3_bit+0)
;karisik.c,70 :: 		PLLPRE_4_bit = 0;
	BCLR	PLLPRE_4_bit, BitPos(PLLPRE_4_bit+0)
;karisik.c,72 :: 		PLLFBD = 38;             // PLL multiplier M=38
	MOV	#38, W0
	MOV	WREG, PLLFBD
;karisik.c,74 :: 		PLLPOST_0_bit = 0;
	BCLR	PLLPOST_0_bit, BitPos(PLLPOST_0_bit+0)
;karisik.c,75 :: 		PLLPOST_1_bit = 0;
	BCLR	PLLPOST_1_bit, BitPos(PLLPOST_1_bit+0)
;karisik.c,79 :: 		ANSELA = 0x00;           // Convert all I/O pins to digital
	CLR	ANSELA
;karisik.c,80 :: 		ANSELB = 0x00;
	CLR	ANSELB
;karisik.c,81 :: 		ANSELC = 0x00;
	CLR	ANSELC
;karisik.c,82 :: 		ANSELD = 0x00;
	CLR	ANSELD
;karisik.c,83 :: 		ANSELE = 0x00;
	CLR	ANSELE
;karisik.c,84 :: 		ANSELG = 0x00;
	CLR	ANSELG
;karisik.c,86 :: 		IFS0=0;
	CLR	IFS0
;karisik.c,87 :: 		IFS1=0;
	CLR	IFS1
;karisik.c,88 :: 		IFS2=0;
	CLR	IFS2
;karisik.c,89 :: 		IFS3=0;
	CLR	IFS3
;karisik.c,90 :: 		IFS4=0;
	CLR	IFS4
;karisik.c,92 :: 		IEC2bits.C1IE   = 1;                             // enable ECAN1 interrupt
	BSET	IEC2bits, #3
;karisik.c,93 :: 		C1INTEbits.TBIE = 1;                             // enable ECAN1 tx interrupt
	BSET.B	C1INTEbits, #0
;karisik.c,94 :: 		C1INTEbits.RBIE = 1;                             // enable ECAN1 rx interrupt
	BSET.B	C1INTEbits, #1
;karisik.c,96 :: 		PORTB = 0;                                       // clear PORTB
	CLR	PORTB
;karisik.c,97 :: 		TRISB = 0;                                       // set PORTB as output,
	CLR	TRISB
;karisik.c,99 :: 		PORTC = 0;                                       // clear PORTB
	CLR	PORTC
;karisik.c,100 :: 		TRISC = 0;
	CLR	TRISC
;karisik.c,103 :: 		TRISA = 0;             // Initialize PORTA as output
	CLR	TRISA
;karisik.c,104 :: 		LATA = 0;              // Set PORTA to zero
	CLR	LATA
;karisik.c,106 :: 		PORTD = 0;
	CLR	PORTD
;karisik.c,107 :: 		TRISD = 0;
	CLR	TRISD
;karisik.c,110 :: 		TRISA14_bit = 1;         // Set PORTA.15 pin as input
	BSET	TRISA14_bit, BitPos(TRISA14_bit+0)
;karisik.c,114 :: 		TFT_Init_ILI9341_8bit(320, 240);
	MOV	#240, W11
	MOV	#320, W10
	CALL	_TFT_Init_ILI9341_8bit
;karisik.c,115 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;karisik.c,122 :: 		UART1_Init(9600);              // Initialize UART module at 56000 bps
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;karisik.c,123 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
	NOP
;karisik.c,124 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;karisik.c,125 :: 		TFT_Write_Text("UART", 160, 160);
	MOV	#160, W12
	MOV	#160, W11
	MOV	#lo_addr(?lstr1_karisik), W10
	CALL	_TFT_Write_Text
;karisik.c,126 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
	NOP
	NOP
	NOP
;karisik.c,127 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;karisik.c,128 :: 		LATB = ~PORTB;       // Invert PORTD value
	MOV	#lo_addr(LATB), W1
	MOV	PORTB, WREG
	COM	W0, [W1]
;karisik.c,129 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main6:
	DEC	W7
	BRA NZ	L_main6
	DEC	W8
	BRA NZ	L_main6
	NOP
	NOP
;karisik.c,130 :: 		LATB = 0;                // Wait for UART module to stabilize
	CLR	LATB
;karisik.c,131 :: 		UART1_Write_Text("Start");
	MOV	#lo_addr(?lstr2_karisik), W10
	CALL	_UART1_Write_Text
;karisik.c,132 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;karisik.c,133 :: 		UART1_Write(10);
	MOV	#10, W10
	CALL	_UART1_Write
;karisik.c,139 :: 		Can_Init_Flags = 0;                              //
	CLR	W0
	MOV	W0, _Can_Init_Flags
;karisik.c,140 :: 		Can_Send_Flags = 0;                              // clear flags
	CLR	W0
	MOV	W0, _Can_Send_Flags
;karisik.c,141 :: 		Can_Rcv_Flags  = 0;                              //
	CLR	W0
	MOV	W0, _Can_Rcv_Flags
;karisik.c,145 :: 		_ECAN_TX_NO_RTR_FRAME;
	MOV	#244, W0
	MOV	W0, _Can_Send_Flags
;karisik.c,151 :: 		_ECAN_CONFIG_LINE_FILTER_OFF;
	MOV	#241, W0
	MOV	W0, _Can_Init_Flags
;karisik.c,153 :: 		ECAN1DmaChannelInit(0, 1, &ECAN1RxTxRAMBuffer);  // init dma channel 0 for
	MOV	#lo_addr(_ECAN1RxTxRAMBuffer), W12
	MOV	#higher_addr(_ECAN1RxTxRAMBuffer), W13
	MOV	#1, W11
	CLR	W10
	CALL	_ECAN1DmaChannelInit
;karisik.c,155 :: 		ECAN1DmaChannelInit(2, 0, &ECAN1RxTxRAMBuffer);  // init dma channel 2 for
	MOV	#lo_addr(_ECAN1RxTxRAMBuffer), W12
	MOV	#higher_addr(_ECAN1RxTxRAMBuffer), W13
	CLR	W11
	MOV	#2, W10
	CALL	_ECAN1DmaChannelInit
;karisik.c,157 :: 		ECAN1Initialize(1, 3, 3, 3, 1, Can_Init_Flags);  // initialize ECAN
	MOV	#3, W13
	MOV	#3, W12
	MOV	#3, W11
	MOV	#1, W10
	PUSH	_Can_Init_Flags
	MOV	#1, W0
	PUSH	W0
	CALL	_ECAN1Initialize
	SUB	#4, W15
;karisik.c,158 :: 		ECAN1SetBufferSize(ECAN1RAMBUFFERSIZE);          // set number of rx+tx buffers in DMA RAM
	MOV	#16, W10
	CALL	_ECAN1SetBufferSize
;karisik.c,160 :: 		ECAN1SelectTxBuffers(0x000F);                    // select transmit buffers
	MOV	#15, W10
	CALL	_ECAN1SelectTxBuffers
;karisik.c,162 :: 		ECAN1SetOperationMode(_ECAN_MODE_CONFIG,0xFF);   // set CONFIGURATION mode
	MOV	#255, W11
	MOV	#4, W10
	CALL	_ECAN1SetOperationMode
;karisik.c,164 :: 		ECAN1SetMask(_ECAN_MASK_0, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);            // set all mask1 bits to ones
	MOV	#247, W13
	CLR	W11
	CLR	W12
	CLR	W10
	CALL	_ECAN1SetMask
;karisik.c,165 :: 		ECAN1SetMask(_ECAN_MASK_1, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);            // set all mask2 bits to ones
	MOV	#247, W13
	CLR	W11
	CLR	W12
	MOV	#1, W10
	CALL	_ECAN1SetMask
;karisik.c,166 :: 		ECAN1SetMask(_ECAN_MASK_2, 0, _ECAN_CONFIG_MATCH_MSG_TYPE & _ECAN_CONFIG_XTD_MSG);            // set all mask3 bits to ones
	MOV	#247, W13
	CLR	W11
	CLR	W12
	MOV	#2, W10
	CALL	_ECAN1SetMask
;karisik.c,167 :: 		ECAN1SetFilter(_ECAN_FILTER_10,ID_1st, _ECAN_MASK_2, _ECAN_RX_BUFFER_7, _ECAN_CONFIG_XTD_MSG); // set id of filter10 to 1st node ID
	MOV	#2, W13
	MOV	#12111, W11
	MOV	#0, W12
	MOV	#10, W10
	MOV	#247, W0
	PUSH	W0
	MOV	#7, W0
	PUSH	W0
	CALL	_ECAN1SetFilter
	SUB	#4, W15
;karisik.c,170 :: 		ECAN1SetOperationMode(_ECAN_MODE_NORMAL,0xFF);   // set NORMAL mode
	MOV	#255, W11
	CLR	W10
	CALL	_ECAN1SetOperationMode
;karisik.c,174 :: 		LATA = ~PORTA;       // Invert PORTA value
	MOV	#lo_addr(LATA), W1
	MOV	PORTA, WREG
	COM	W0, [W1]
;karisik.c,175 :: 		Delay_ms(2000);
	MOV	#428, W8
	MOV	#16384, W7
L_main8:
	DEC	W7
	BRA NZ	L_main8
	DEC	W8
	BRA NZ	L_main8
;karisik.c,176 :: 		LATA = 0;
	CLR	LATA
;karisik.c,177 :: 		while (1) {
L_main10:
;karisik.c,178 :: 		Msg_Rcvd = ECAN1Read(&Rx_ID , RxTx_Data , &Rx_Data_Len, &Can_Rcv_Flags);  // receive message
	MOV	#lo_addr(_Can_Rcv_Flags), W13
	MOV	#lo_addr(_Rx_Data_Len), W12
	MOV	#lo_addr(_RxTx_Data), W11
	MOV	#lo_addr(_Rx_ID), W10
	CALL	_ECAN1Read
	MOV	#lo_addr(_Msg_Rcvd), W1
	MOV.B	W0, [W1]
;karisik.c,179 :: 		if ((Rx_ID == ID_1st) && Msg_Rcvd) {                                      // if message received check id
	MOV	_Rx_ID, W2
	MOV	_Rx_ID+2, W3
	MOV	#12111, W0
	MOV	#0, W1
	CP	W2, W0
	CPB	W3, W1
	BRA Z	L__main43
	GOTO	L__main39
L__main43:
	MOV	#lo_addr(_Msg_Rcvd), W0
	CP0.B	[W0]
	BRA NZ	L__main44
	GOTO	L__main38
L__main44:
L__main37:
;karisik.c,180 :: 		PORTB = RxTx_Data[0];
	MOV	#lo_addr(_RxTx_Data), W0
	ZE	[W0], W0
	MOV	WREG, PORTB
;karisik.c,182 :: 		LATA = ~PORTA;       // Invert PORTA value
	MOV	#lo_addr(LATA), W1
	MOV	PORTA, WREG
	COM	W0, [W1]
;karisik.c,183 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main15:
	DEC	W7
	BRA NZ	L_main15
	DEC	W8
	BRA NZ	L_main15
	NOP
	NOP
;karisik.c,184 :: 		LATA = 0;                                                  // id correct, output data at PORTB
	CLR	LATA
;karisik.c,185 :: 		TFT_Fill_Screen(CL_RED);
	MOV	#63488, W10
	CALL	_TFT_Fill_Screen
;karisik.c,186 :: 		TFT_Write_Text("ECAN", 60, 60);
	MOV	#60, W12
	MOV	#60, W11
	MOV	#lo_addr(?lstr3_karisik), W10
	CALL	_TFT_Write_Text
;karisik.c,187 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main17:
	DEC	W7
	BRA NZ	L_main17
	DEC	W8
	BRA NZ	L_main17
	NOP
	NOP
;karisik.c,188 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;karisik.c,189 :: 		RxTx_Data[0]++ ;                                                        // increment received data
	MOV.B	#1, W1
	MOV	#lo_addr(_RxTx_Data), W0
	ADD.B	W1, [W0], [W0]
;karisik.c,190 :: 		ECAN1Write(ID_2nd, RxTx_Data, 1, Can_Send_Flags);                       // send incremented data back
	MOV	#1, W13
	MOV	#lo_addr(_RxTx_Data), W12
	MOV	#3, W10
	MOV	#0, W11
	PUSH	_Can_Send_Flags
	CALL	_ECAN1Write
	SUB	#2, W15
;karisik.c,179 :: 		if ((Rx_ID == ID_1st) && Msg_Rcvd) {                                      // if message received check id
L__main39:
L__main38:
;karisik.c,192 :: 		}
	GOTO	L_main10
;karisik.c,234 :: 		}
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
