
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;gulmay-rs232.c,17 :: 		void main() {
;gulmay-rs232.c,19 :: 		ANSELA = 0x00;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	ANSELA
;gulmay-rs232.c,20 :: 		ANSELB = 0x00;
	CLR	ANSELB
;gulmay-rs232.c,21 :: 		ANSELC = 0x00;
	CLR	ANSELC
;gulmay-rs232.c,22 :: 		ANSELD = 0x00;
	CLR	ANSELD
;gulmay-rs232.c,23 :: 		ANSELE = 0x00;
	CLR	ANSELE
;gulmay-rs232.c,24 :: 		ANSELG = 0x00;
	CLR	ANSELG
;gulmay-rs232.c,26 :: 		PPS_Mapping(100, _INPUT,  _U1RX);
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;gulmay-rs232.c,27 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;gulmay-rs232.c,29 :: 		TRISD = 0;
	CLR	TRISD
;gulmay-rs232.c,30 :: 		TRISF.F4 = 1;
	BSET	TRISF, #4
;gulmay-rs232.c,31 :: 		TRISF.F5 = 0;
	BCLR	TRISF, #5
;gulmay-rs232.c,33 :: 		PORTD = 0;
	CLR	PORTD
;gulmay-rs232.c,34 :: 		PORTF = 0;
	CLR	PORTF
;gulmay-rs232.c,36 :: 		LATF = 0;
	CLR	LATF
;gulmay-rs232.c,38 :: 		LCD_Init();
	CALL	_Lcd_Init
;gulmay-rs232.c,39 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	MOV.B	#12, W10
	CALL	_Lcd_Cmd
;gulmay-rs232.c,40 :: 		LCD_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;gulmay-rs232.c,41 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;gulmay-rs232.c,43 :: 		LCD_Out(1,1,"Gulmay Gen. Test");
	MOV	#lo_addr(?lstr1_gulmay_45rs232), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;gulmay-rs232.c,44 :: 		Delay_ms(1000);
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
;gulmay-rs232.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;gulmay-rs232.c,47 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;gulmay-rs232.c,48 :: 		Delay_ms(200);
	MOV	#43, W8
	MOV	#47513, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
;gulmay-rs232.c,50 :: 		UART1_Write_Text("?M");
	MOV	#lo_addr(?lstr2_gulmay_45rs232), W10
	CALL	_UART1_Write_Text
;gulmay-rs232.c,52 :: 		while(1) {
L_main6:
;gulmay-rs232.c,54 :: 		if(UART1_Data_Ready()) {
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__main24
	GOTO	L_main8
L__main24:
;gulmay-rs232.c,55 :: 		uart_rd =  UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_rd), W1
	MOV.B	W0, [W1]
;gulmay-rs232.c,56 :: 		}
L_main8:
;gulmay-rs232.c,58 :: 		if(uart_rd) {
	MOV	#lo_addr(_uart_rd), W0
	CP0.B	[W0]
	BRA NZ	L__main25
	GOTO	L_main9
L__main25:
;gulmay-rs232.c,59 :: 		Lcd_Chr(row,col,uart_rd);
	MOV	#lo_addr(_uart_rd), W2
	MOV	#lo_addr(_col), W1
	MOV	#lo_addr(_row), W0
	MOV.B	[W2], W12
	ZE	[W1], W11
	ZE	[W0], W10
	CALL	_Lcd_Chr
;gulmay-rs232.c,61 :: 		if(uart_rd == 17){
	MOV	#lo_addr(_uart_rd), W0
	MOV.B	[W0], W0
	CP.B	W0, #17
	BRA Z	L__main26
	GOTO	L_main10
L__main26:
;gulmay-rs232.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;gulmay-rs232.c,63 :: 		col = 1;
	MOV	#lo_addr(_col), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gulmay-rs232.c,64 :: 		row = 1;
	MOV	#lo_addr(_row), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gulmay-rs232.c,65 :: 		}
L_main10:
;gulmay-rs232.c,67 :: 		UART1_Write(uart_rd);
	MOV	#lo_addr(_uart_rd), W0
	ZE	[W0], W10
	CALL	_UART1_Write
;gulmay-rs232.c,68 :: 		col = col + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_col), W0
	ADD.B	W1, [W0], [W0]
;gulmay-rs232.c,70 :: 		if((col == 17) && (row == 1)) {
	MOV	#lo_addr(_col), W0
	MOV.B	[W0], W0
	CP.B	W0, #17
	BRA Z	L__main27
	GOTO	L__main20
L__main27:
	MOV	#lo_addr(_row), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__main28
	GOTO	L__main19
L__main28:
L__main18:
;gulmay-rs232.c,71 :: 		row = 2;
	MOV	#lo_addr(_row), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;gulmay-rs232.c,72 :: 		col = 1;
	MOV	#lo_addr(_col), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gulmay-rs232.c,70 :: 		if((col == 17) && (row == 1)) {
L__main20:
L__main19:
;gulmay-rs232.c,75 :: 		if((col == 17) && (row == 2)) {
	MOV	#lo_addr(_col), W0
	MOV.B	[W0], W0
	CP.B	W0, #17
	BRA Z	L__main29
	GOTO	L__main22
L__main29:
	MOV	#lo_addr(_row), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__main30
	GOTO	L__main21
L__main30:
L__main17:
;gulmay-rs232.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;gulmay-rs232.c,77 :: 		col = 1;
	MOV	#lo_addr(_col), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gulmay-rs232.c,78 :: 		row = 1;
	MOV	#lo_addr(_row), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gulmay-rs232.c,75 :: 		if((col == 17) && (row == 2)) {
L__main22:
L__main21:
;gulmay-rs232.c,80 :: 		}
L_main9:
;gulmay-rs232.c,81 :: 		}
	GOTO	L_main6
;gulmay-rs232.c,82 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
