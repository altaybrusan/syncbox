
_newline:

;NewUnit_0.c,20 :: 		void newline()
;NewUnit_0.c,22 :: 		UART1_Write(13); // Carriage Return
	PUSH	W10
	MOV	#13, W10
	CALL	_UART1_Write
;NewUnit_0.c,23 :: 		UART1_Write(10); // Line Feed
	MOV	#10, W10
	CALL	_UART1_Write
;NewUnit_0.c,24 :: 		}
L_end_newline:
	POP	W10
	RETURN
; end of _newline

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;NewUnit_0.c,26 :: 		void main() {
;NewUnit_0.c,28 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;NewUnit_0.c,29 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;NewUnit_0.c,31 :: 		ANSELA = 0x00;
	CLR	ANSELA
;NewUnit_0.c,32 :: 		ANSELB = 0x00;
	CLR	ANSELB
;NewUnit_0.c,33 :: 		ANSELC = 0x00;
	CLR	ANSELC
;NewUnit_0.c,34 :: 		ANSELD = 0x00;
	CLR	ANSELD
;NewUnit_0.c,35 :: 		ANSELE = 0x00;
	CLR	ANSELE
;NewUnit_0.c,36 :: 		ANSELG = 0x00;
	CLR	ANSELG
;NewUnit_0.c,38 :: 		PPS_Mapping(100, _INPUT,  _U1RX);
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;NewUnit_0.c,39 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;NewUnit_0.c,47 :: 		Lcd_Init();
	CALL	_Lcd_Init
;NewUnit_0.c,48 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;NewUnit_0.c,50 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOV	#lo_addr(?lstr1_NewUnit_0), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;NewUnit_0.c,51 :: 		Delay_ms(1000);
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
;NewUnit_0.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;NewUnit_0.c,54 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;NewUnit_0.c,55 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
	NOP
	NOP
;NewUnit_0.c,57 :: 		UART1_Write(63);
	MOV	#63, W10
	CALL	_UART1_Write
;NewUnit_0.c,58 :: 		UART1_Write(80);
	MOV	#80, W10
	CALL	_UART1_Write
;NewUnit_0.c,59 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;NewUnit_0.c,64 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main6:
	DEC	W7
	BRA NZ	L_main6
	DEC	W8
	BRA NZ	L_main6
	NOP
	NOP
;NewUnit_0.c,69 :: 		while(1){
L_main8:
;NewUnit_0.c,71 :: 		if(UART1_Data_Ready()){ //If Data Ready,
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__main30
	GOTO	L_main10
L__main30:
;NewUnit_0.c,72 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main11:
	DEC	W7
	BRA NZ	L_main11
	DEC	W8
	BRA NZ	L_main11
	NOP
	NOP
;NewUnit_0.c,73 :: 		uart_rd =  UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_rd), W1
	MOV.B	W0, [W1]
;NewUnit_0.c,74 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main13:
	DEC	W7
	BRA NZ	L_main13
	DEC	W8
	BRA NZ	L_main13
	NOP
	NOP
;NewUnit_0.c,77 :: 		Lcd_Chr(row,col,uart_rd);
	MOV	#lo_addr(_uart_rd), W0
	MOV.B	[W0], W12
	MOV	_col, W11
	MOV	_row, W10
	CALL	_Lcd_Chr
;NewUnit_0.c,79 :: 		if(uart_rd==17){
	MOV	#lo_addr(_uart_rd), W0
	MOV.B	[W0], W0
	CP.B	W0, #17
	BRA Z	L__main31
	GOTO	L_main15
L__main31:
;NewUnit_0.c,80 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;NewUnit_0.c,81 :: 		col=1,row=1;
	MOV	#1, W0
	MOV	W0, _col
	MOV	#1, W0
	MOV	W0, _row
;NewUnit_0.c,82 :: 		}
L_main15:
;NewUnit_0.c,85 :: 		col=col+1;
	MOV	#1, W1
	MOV	#lo_addr(_col), W0
	ADD	W1, [W0], [W0]
;NewUnit_0.c,86 :: 		}
L_main10:
;NewUnit_0.c,87 :: 		if(col==17 && row==1){
	MOV	_col, W0
	CP	W0, #17
	BRA Z	L__main32
	GOTO	L__main25
L__main32:
	MOV	_row, W0
	CP	W0, #1
	BRA Z	L__main33
	GOTO	L__main24
L__main33:
L__main23:
;NewUnit_0.c,88 :: 		row=2;
	MOV	#2, W0
	MOV	W0, _row
;NewUnit_0.c,89 :: 		col=1;
	MOV	#1, W0
	MOV	W0, _col
;NewUnit_0.c,87 :: 		if(col==17 && row==1){
L__main25:
L__main24:
;NewUnit_0.c,91 :: 		if(row==2 && col==17){
	MOV	_row, W0
	CP	W0, #2
	BRA Z	L__main34
	GOTO	L__main27
L__main34:
	MOV	_col, W0
	CP	W0, #17
	BRA Z	L__main35
	GOTO	L__main26
L__main35:
L__main22:
;NewUnit_0.c,92 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;NewUnit_0.c,93 :: 		col=1;
	MOV	#1, W0
	MOV	W0, _col
;NewUnit_0.c,94 :: 		row=1;
	MOV	#1, W0
	MOV	W0, _row
;NewUnit_0.c,91 :: 		if(row==2 && col==17){
L__main27:
L__main26:
;NewUnit_0.c,96 :: 		}
	GOTO	L_main8
;NewUnit_0.c,97 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
