
_USB1Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;usb_uart.c,35 :: 		void USB1Interrupt() iv IVT_ADDR_USB1INTERRUPT{
;usb_uart.c,36 :: 		USB_Interrupt_Proc();
	CALL	_USB_Interrupt_Proc
;usb_uart.c,37 :: 		}
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

;usb_uart.c,39 :: 		void main(void){
;usb_uart.c,41 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;usb_uart.c,42 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;usb_uart.c,46 :: 		ACLKCON3 = 0xB4C1;       // Use primary oscillator (8MHz), APLL prescaler N1=2, APLL postscaler N2=2
	MOV	#46273, W0
	MOV	WREG, ACLKCON3
;usb_uart.c,47 :: 		ACLKDIV3 = 0x0007;       // APLL multiplier M=24
	MOV	#7, W0
	MOV	WREG, ACLKDIV3
;usb_uart.c,49 :: 		PPS_Mapping(100, _INPUT,  _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;usb_uart.c,50 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;usb_uart.c,52 :: 		ANSELA = 0x00;           // Convert all I/O pins to digital
	CLR	ANSELA
;usb_uart.c,53 :: 		ANSELB = 0x00;
	CLR	ANSELB
;usb_uart.c,54 :: 		ANSELC = 0x00;
	CLR	ANSELC
;usb_uart.c,55 :: 		ANSELD = 0x00;
	CLR	ANSELD
;usb_uart.c,56 :: 		ANSELE = 0x00;
	CLR	ANSELE
;usb_uart.c,57 :: 		ANSELG = 0x00;
	CLR	ANSELG
;usb_uart.c,59 :: 		PORTD = 0;
	CLR	PORTD
;usb_uart.c,66 :: 		TFT_Init_ILI9341_8bit(320, 240);
	MOV	#240, W11
	MOV	#320, W10
	CALL	_TFT_Init_ILI9341_8bit
;usb_uart.c,67 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;usb_uart.c,69 :: 		UART1_Init(9600);              // Initialize UART module at 56000 bps
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;usb_uart.c,70 :: 		Delay_ms(500);                  // Wait for UART module to stabilize
	MOV	#107, W8
	MOV	#53247, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;usb_uart.c,71 :: 		UART1_Write_Text("Start");
	MOV	#lo_addr(?lstr1_usb_uart), W10
	CALL	_UART1_Write_Text
;usb_uart.c,72 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;usb_uart.c,73 :: 		UART1_Write(10);
	MOV	#10, W10
	CALL	_UART1_Write
;usb_uart.c,74 :: 		TFT_Write_Text("start uart", 60, 60);
	MOV	#60, W12
	MOV	#60, W11
	MOV	#lo_addr(?lstr2_usb_uart), W10
	CALL	_TFT_Write_Text
;usb_uart.c,75 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
	NOP
	NOP
;usb_uart.c,76 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;usb_uart.c,77 :: 		while (1) {
L_main4:
;usb_uart.c,79 :: 		if (UART1_Data_Ready()==1) {     // If data is received
	CALL	_UART1_Data_Ready
	CP	W0, #1
	BRA Z	L__main24
	GOTO	L_main6
L__main24:
;usb_uart.c,84 :: 		uart_rd = UART1_Read();     // read the received data
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_rd), W1
	MOV.B	W0, [W1]
;usb_uart.c,89 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;usb_uart.c,90 :: 		TFT_Write_Text(uart_rd, 160, 160);
	MOV	#lo_addr(_uart_rd), W0
	MOV	#160, W12
	MOV	#160, W11
	ZE	[W0], W10
	CALL	_TFT_Write_Text
;usb_uart.c,91 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main7:
	DEC	W7
	BRA NZ	L_main7
	DEC	W8
	BRA NZ	L_main7
	NOP
	NOP
	NOP
;usb_uart.c,92 :: 		TFT_Fill_Screen(CL_WHITE);
	MOV	#65535, W10
	CALL	_TFT_Fill_Screen
;usb_uart.c,93 :: 		LATD = ~PORTD;       // Invert PORTD value
	MOV	#lo_addr(LATD), W1
	MOV	PORTD, WREG
	COM	W0, [W1]
;usb_uart.c,94 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main9:
	DEC	W7
	BRA NZ	L_main9
	DEC	W8
	BRA NZ	L_main9
	NOP
	NOP
;usb_uart.c,95 :: 		LATD = 0;
	CLR	LATD
;usb_uart.c,96 :: 		UART1_Write(uart_rd);
	MOV	#lo_addr(_uart_rd), W0
	ZE	[W0], W10
	CALL	_UART1_Write
;usb_uart.c,98 :: 		}
L_main6:
;usb_uart.c,99 :: 		}
	GOTO	L_main4
;usb_uart.c,124 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
