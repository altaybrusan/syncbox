
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;UARTA.c,38 :: 		void main() {
;UARTA.c,40 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;UARTA.c,41 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;UARTA.c,43 :: 		ANSELA = 0x00;           // Convert all I/O pins to digital
	CLR	ANSELA
;UARTA.c,44 :: 		ANSELB = 0x00;
	CLR	ANSELB
;UARTA.c,45 :: 		ANSELC = 0x00;
	CLR	ANSELC
;UARTA.c,46 :: 		ANSELD = 0x00;
	CLR	ANSELD
;UARTA.c,47 :: 		ANSELE = 0x00;
	CLR	ANSELE
;UARTA.c,48 :: 		ANSELG = 0x00;
	CLR	ANSELG
;UARTA.c,50 :: 		PPS_Mapping(100, _INPUT,  _U1RX);              // Sets pin RP100 to be Input, and maps U1RX to it
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;UARTA.c,51 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);              // Sets pin RP101 to be Output, and maps U1TX to it
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;UARTA.c,53 :: 		LCD_Init();
	CALL	_Lcd_Init
;UARTA.c,54 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;UARTA.c,55 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	MOV.B	#12, W10
	CALL	_Lcd_Cmd
;UARTA.c,56 :: 		LCD_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;UARTA.c,58 :: 		LCD_Out(1,1,"Gulmay Gen. Test");
	MOV	#lo_addr(?lstr1_UARTA), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;UARTA.c,59 :: 		Delay_ms(1000);
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
;UARTA.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;UARTA.c,62 :: 		UART1_Init(9600);              // Initialize UART module at 56000 bps
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;UARTA.c,63 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOV	#22, W8
	MOV	#23756, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
	NOP
	NOP
;UARTA.c,65 :: 		while (1) {                     // Endless loop
L_main6:
;UARTA.c,67 :: 		UART1_Write('A');
	MOV	#65, W10
	CALL	_UART1_Write
;UARTA.c,68 :: 		UART1_Write_Text("UART1 Test\r\n");
	MOV	#lo_addr(?lstr2_UARTA), W10
	CALL	_UART1_Write_Text
;UARTA.c,69 :: 		Delay_ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main8:
	DEC	W7
	BRA NZ	L_main8
	DEC	W8
	BRA NZ	L_main8
	NOP
	NOP
	NOP
;UARTA.c,70 :: 		}
	GOTO	L_main6
;UARTA.c,71 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
