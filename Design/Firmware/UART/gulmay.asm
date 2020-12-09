
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;gulmay.c,3 :: 		void main() {
;gulmay.c,5 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;gulmay.c,6 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;gulmay.c,8 :: 		ANSELA = 0x00;
	CLR	ANSELA
;gulmay.c,9 :: 		ANSELB = 0x00;
	CLR	ANSELB
;gulmay.c,10 :: 		ANSELC = 0x00;
	CLR	ANSELC
;gulmay.c,11 :: 		ANSELD = 0x00;
	CLR	ANSELD
;gulmay.c,12 :: 		ANSELE = 0x00;
	CLR	ANSELE
;gulmay.c,13 :: 		ANSELG = 0x00;
	CLR	ANSELG
;gulmay.c,16 :: 		PPS_Mapping(100, _INPUT,  _U1RX);
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;gulmay.c,17 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;gulmay.c,21 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;gulmay.c,22 :: 		Delay_ms(100);
	MOV	#2, W8
	MOV	#34464, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;gulmay.c,24 :: 		while(1) {
L_main2:
;gulmay.c,26 :: 		if(UART1_Data_Ready()) {
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__main9
	GOTO	L_main4
L__main9:
;gulmay.c,27 :: 		x = UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_x), W1
	MOV.B	W0, [W1]
;gulmay.c,28 :: 		}
L_main4:
;gulmay.c,30 :: 		if(x == 'A') {
	MOV	#lo_addr(_x), W0
	MOV.B	[W0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA Z	L__main10
	GOTO	L_main5
L__main10:
;gulmay.c,31 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;gulmay.c,32 :: 		UART1_Write_Text("This is A");
	MOV	#lo_addr(?lstr1_gulmay), W10
	CALL	_UART1_Write_Text
;gulmay.c,33 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;gulmay.c,34 :: 		}
	GOTO	L_main6
L_main5:
;gulmay.c,36 :: 		else if(x == 'Z') {
	MOV	#lo_addr(_x), W0
	MOV.B	[W0], W1
	MOV.B	#90, W0
	CP.B	W1, W0
	BRA Z	L__main11
	GOTO	L_main7
L__main11:
;gulmay.c,37 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;gulmay.c,38 :: 		UART1_Write_Text("This is B");
	MOV	#lo_addr(?lstr2_gulmay), W10
	CALL	_UART1_Write_Text
;gulmay.c,39 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;gulmay.c,40 :: 		}
L_main7:
L_main6:
;gulmay.c,42 :: 		x = '\0';
	MOV	#lo_addr(_x), W1
	CLR	W0
	MOV.B	W0, [W1]
;gulmay.c,45 :: 		}
	GOTO	L_main2
;gulmay.c,46 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
