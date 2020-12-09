
_xrayon:

;case.c,7 :: 		void xrayon() {
;case.c,10 :: 		UART1_Write(33);
	PUSH	W10
	MOV	#33, W10
	CALL	_UART1_Write
;case.c,11 :: 		UART1_Write(88);
	MOV	#88, W10
	CALL	_UART1_Write
;case.c,12 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;case.c,15 :: 		}
L_end_xrayon:
	POP	W10
	RETURN
; end of _xrayon

_xrayoff:

;case.c,18 :: 		void xrayoff(){
;case.c,20 :: 		UART1_Write(33);
	PUSH	W10
	MOV	#33, W10
	CALL	_UART1_Write
;case.c,21 :: 		UART1_Write(88);
	MOV	#88, W10
	CALL	_UART1_Write
;case.c,22 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;case.c,25 :: 		}
L_end_xrayoff:
	POP	W10
	RETURN
; end of _xrayoff

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;case.c,29 :: 		void main() {
;case.c,33 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#70, W0
	MOV	WREG, PLLFBD
;case.c,34 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;case.c,36 :: 		ANSELA = 0x00;
	CLR	ANSELA
;case.c,37 :: 		ANSELB = 0x00;
	CLR	ANSELB
;case.c,38 :: 		ANSELC = 0x00;
	CLR	ANSELC
;case.c,39 :: 		ANSELD = 0x00;
	CLR	ANSELD
;case.c,40 :: 		ANSELE = 0x00;
	CLR	ANSELE
;case.c,41 :: 		ANSELG = 0x00;
	CLR	ANSELG
;case.c,43 :: 		PPS_Mapping(100, _INPUT,  _U1RX);
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;case.c,44 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;case.c,50 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;case.c,51 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;case.c,54 :: 		UART1_Write(63);
	MOV	#63, W10
	CALL	_UART1_Write
;case.c,55 :: 		UART1_Write(80);
	MOV	#80, W10
	CALL	_UART1_Write
;case.c,56 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;case.c,58 :: 		Delay_ms(1000);
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
;case.c,63 :: 		do{
L_main4:
;case.c,65 :: 		if (Button (&PORTA, 15,1,1))
	MOV	#1, W13
	MOV	#1, W12
	MOV	#15, W11
	MOV	#lo_addr(PORTA), W10
	CALL	_Button
	CP0	W0
	BRA NZ	L__main17
	GOTO	L_main7
L__main17:
;case.c,69 :: 		UART1_Write(63);
	MOV	#63, W10
	CALL	_UART1_Write
L_main7:
;case.c,70 :: 		UART1_Write(78);
	MOV	#78, W10
	CALL	_UART1_Write
;case.c,71 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;case.c,72 :: 		oldstate = 1;
	MOV	#1, W0
	MOV	W0, _oldstate
;case.c,79 :: 		if (oldstate && Button (&PORTA,15,1,0)){
	CLR	W13
	MOV	#1, W12
	MOV	#15, W11
	MOV	#lo_addr(PORTA), W10
	CALL	_Button
	CP0	W0
	BRA NZ	L__main18
	GOTO	L__main12
L__main18:
L__main11:
;case.c,82 :: 		UART1_Write(63);
	MOV	#63, W10
	CALL	_UART1_Write
;case.c,83 :: 		UART1_Write(88);
	MOV	#88, W10
	CALL	_UART1_Write
;case.c,84 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;case.c,85 :: 		oldstate = 0;
	CLR	W0
	MOV	W0, _oldstate
;case.c,79 :: 		if (oldstate && Button (&PORTA,15,1,0)){
L__main12:
;case.c,88 :: 		}while(1);
	GOTO	L_main4
;case.c,89 :: 		}
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
