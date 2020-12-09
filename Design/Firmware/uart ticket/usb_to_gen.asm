
_interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;usb_to_gen.c,25 :: 		void interrupt() iv IVT_ADDR_INT0INTERRUPT ics ICS_AUTO {
;usb_to_gen.c,28 :: 		if(IFS0.F0 == 1) {
	PUSH	W10
	BTSS	IFS0, #0
	GOTO	L_interrupt0
;usb_to_gen.c,30 :: 		if(PORTD.F0 == 1){
	BTSS	PORTD, #0
	GOTO	L_interrupt1
;usb_to_gen.c,32 :: 		UART1_Write(63);
	MOV	#63, W10
	CALL	_UART1_Write
;usb_to_gen.c,33 :: 		UART1_Write(80);
	MOV	#80, W10
	CALL	_UART1_Write
;usb_to_gen.c,34 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;usb_to_gen.c,36 :: 		}
L_interrupt1:
;usb_to_gen.c,39 :: 		IFS0.F0 = 0;
	BCLR	IFS0, #0
;usb_to_gen.c,41 :: 		}
L_interrupt0:
;usb_to_gen.c,43 :: 		}
L_end_interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _interrupt

_USB1Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;usb_to_gen.c,46 :: 		void USB1Interrupt() iv IVT_ADDR_USB1INTERRUPT{
;usb_to_gen.c,47 :: 		USB_Interrupt_Proc();
	CALL	_USB_Interrupt_Proc
;usb_to_gen.c,48 :: 		}
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

_newline:

;usb_to_gen.c,50 :: 		void newline()
;usb_to_gen.c,52 :: 		UART1_Write(13);
	PUSH	W10
	MOV	#13, W10
	CALL	_UART1_Write
;usb_to_gen.c,53 :: 		UART1_Write(10);
	MOV	#10, W10
	CALL	_UART1_Write
;usb_to_gen.c,54 :: 		}
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

;usb_to_gen.c,56 :: 		void main() {
;usb_to_gen.c,58 :: 		PLLFBD = 70;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;usb_to_gen.c,59 :: 		CLKDIV = 0x0000;
	CLR	CLKDIV
;usb_to_gen.c,61 :: 		ANSELA = 0x00;
	CLR	ANSELA
;usb_to_gen.c,62 :: 		ANSELB = 0x00;
	CLR	ANSELB
;usb_to_gen.c,63 :: 		ANSELC = 0x00;
	CLR	ANSELC
;usb_to_gen.c,64 :: 		ANSELD = 0x00;
	CLR	ANSELD
;usb_to_gen.c,65 :: 		ANSELE = 0x00;
	CLR	ANSELE
;usb_to_gen.c,66 :: 		ANSELG = 0x00;
	CLR	ANSELG
;usb_to_gen.c,68 :: 		PPS_Mapping(100, _INPUT,  _U1RX);
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;usb_to_gen.c,69 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;usb_to_gen.c,71 :: 		ACLKCON3 = 0xB4C1;
	MOV	#46273, W0
	MOV	WREG, ACLKCON3
;usb_to_gen.c,72 :: 		ACLKDIV3 = 0x0007;
	MOV	#7, W0
	MOV	WREG, ACLKDIV3
;usb_to_gen.c,77 :: 		TRISA.F15 = 0;
	BCLR	TRISA, #15
;usb_to_gen.c,78 :: 		PORTA.F15 = 0;
	BCLR	PORTA, #15
;usb_to_gen.c,80 :: 		TRISA.F14 = 0;
	BCLR	TRISA, #14
;usb_to_gen.c,81 :: 		PORTA.F14 = 0;
	BCLR	PORTA, #14
;usb_to_gen.c,84 :: 		Lcd_Init();
	CALL	_Lcd_Init
;usb_to_gen.c,85 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
	NOP
;usb_to_gen.c,87 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOV	#lo_addr(?lstr1_usb_to_gen), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;usb_to_gen.c,88 :: 		Delay_ms(1000);
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
;usb_to_gen.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;usb_to_gen.c,91 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;usb_to_gen.c,92 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main6:
	DEC	W7
	BRA NZ	L_main6
	DEC	W8
	BRA NZ	L_main6
	NOP
	NOP
;usb_to_gen.c,95 :: 		UART1_Write(63);
	MOV	#63, W10
	CALL	_UART1_Write
;usb_to_gen.c,96 :: 		UART1_Write(80);
	MOV	#80, W10
	CALL	_UART1_Write
;usb_to_gen.c,97 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;usb_to_gen.c,101 :: 		IEC0 = 1;     // enable on change interrupts
	MOV	#1, W0
	MOV	WREG, IEC0
;usb_to_gen.c,102 :: 		IFS0 = 0;     // Clear interrupt flag prior to enable
	CLR	IFS0
;usb_to_gen.c,108 :: 		HID_Enable(&readbuff,&writebuff);
	MOV	#lo_addr(_writebuff), W11
	MOV	#lo_addr(_readbuff), W10
	CALL	_HID_Enable
;usb_to_gen.c,110 :: 		while(1){
L_main8:
;usb_to_gen.c,114 :: 		while(!HID_Read());
L_main10:
	CALL	_HID_Read
	CP0.B	W0
	BRA Z	L__main43
	GOTO	L_main11
L__main43:
	GOTO	L_main10
L_main11:
;usb_to_gen.c,118 :: 		for(cnt=0;cnt<64;cnt++)
	MOV	#lo_addr(_cnt), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main12:
	MOV	#lo_addr(_cnt), W0
	MOV.B	[W0], W1
	MOV.B	#64, W0
	CP.B	W1, W0
	BRA LTU	L__main44
	GOTO	L_main13
L__main44:
;usb_to_gen.c,119 :: 		writebuff[cnt]=readbuff[cnt];
	MOV	#lo_addr(_cnt), W0
	ZE	[W0], W1
	MOV	#lo_addr(_writebuff), W0
	ADD	W0, W1, W2
	MOV	#lo_addr(_cnt), W0
	ZE	[W0], W1
	MOV	#lo_addr(_readbuff), W0
	ADD	W0, W1, W0
	MOV.B	[W0], [W2]
;usb_to_gen.c,118 :: 		for(cnt=0;cnt<64;cnt++)
	MOV.B	#1, W1
	MOV	#lo_addr(_cnt), W0
	ADD.B	W1, [W0], [W0]
;usb_to_gen.c,119 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO	L_main12
L_main13:
;usb_to_gen.c,121 :: 		while(!HID_Write(&writebuff,64));
L_main15:
	MOV.B	#64, W11
	MOV	#lo_addr(_writebuff), W10
	CALL	_HID_Write
	CP0.B	W0
	BRA Z	L__main45
	GOTO	L_main16
L__main45:
	GOTO	L_main15
L_main16:
;usb_to_gen.c,123 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;usb_to_gen.c,124 :: 		UART1_Write_Text(&writebuff);
	MOV	#lo_addr(_writebuff), W10
	CALL	_UART1_Write_Text
;usb_to_gen.c,125 :: 		UART1_Write(13);
	MOV	#13, W10
	CALL	_UART1_Write
;usb_to_gen.c,126 :: 		Lcd_Out(row,col,writebuff);
	MOV	#lo_addr(_writebuff), W12
	MOV	_col, W11
	MOV	_row, W10
	CALL	_Lcd_Out
;usb_to_gen.c,127 :: 		Delay_Ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main17:
	DEC	W7
	BRA NZ	L_main17
	DEC	W8
	BRA NZ	L_main17
	NOP
	NOP
	NOP
;usb_to_gen.c,128 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;usb_to_gen.c,175 :: 		if(UART1_Data_Ready()){
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__main46
	GOTO	L_main19
L__main46:
;usb_to_gen.c,176 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main20:
	DEC	W7
	BRA NZ	L_main20
	DEC	W8
	BRA NZ	L_main20
	NOP
	NOP
;usb_to_gen.c,177 :: 		uart_rd =  UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_rd), W1
	MOV.B	W0, [W1]
;usb_to_gen.c,178 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main22:
	DEC	W7
	BRA NZ	L_main22
	DEC	W8
	BRA NZ	L_main22
	NOP
	NOP
;usb_to_gen.c,181 :: 		Lcd_Chr(row,col,uart_rd);
	MOV	#lo_addr(_uart_rd), W0
	MOV.B	[W0], W12
	MOV	_col, W11
	MOV	_row, W10
	CALL	_Lcd_Chr
;usb_to_gen.c,182 :: 		if(uart_rd==17){
	MOV	#lo_addr(_uart_rd), W0
	MOV.B	[W0], W0
	CP.B	W0, #17
	BRA Z	L__main47
	GOTO	L_main24
L__main47:
;usb_to_gen.c,183 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;usb_to_gen.c,184 :: 		col=1,row=1;
	MOV	#1, W0
	MOV	W0, _col
	MOV	#1, W0
	MOV	W0, _row
;usb_to_gen.c,185 :: 		}
L_main24:
;usb_to_gen.c,189 :: 		col=col+1;
	MOV	#1, W1
	MOV	#lo_addr(_col), W0
	ADD	W1, [W0], [W0]
;usb_to_gen.c,190 :: 		}
L_main19:
;usb_to_gen.c,191 :: 		if(col==17 && row==1){
	MOV	_col, W0
	CP	W0, #17
	BRA Z	L__main48
	GOTO	L__main36
L__main48:
	MOV	_row, W0
	CP	W0, #1
	BRA Z	L__main49
	GOTO	L__main35
L__main49:
L__main34:
;usb_to_gen.c,192 :: 		row=2;
	MOV	#2, W0
	MOV	W0, _row
;usb_to_gen.c,193 :: 		col=1;
	MOV	#1, W0
	MOV	W0, _col
;usb_to_gen.c,191 :: 		if(col==17 && row==1){
L__main36:
L__main35:
;usb_to_gen.c,195 :: 		if(row==2 && col==17){
	MOV	_row, W0
	CP	W0, #2
	BRA Z	L__main50
	GOTO	L__main38
L__main50:
	MOV	_col, W0
	CP	W0, #17
	BRA Z	L__main51
	GOTO	L__main37
L__main51:
L__main33:
;usb_to_gen.c,196 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;usb_to_gen.c,197 :: 		col=1;
	MOV	#1, W0
	MOV	W0, _col
;usb_to_gen.c,198 :: 		row=1;
	MOV	#1, W0
	MOV	W0, _row
;usb_to_gen.c,199 :: 		Delay_Ms(1000);
	MOV	#214, W8
	MOV	#40959, W7
L_main31:
	DEC	W7
	BRA NZ	L_main31
	DEC	W8
	BRA NZ	L_main31
	NOP
	NOP
	NOP
;usb_to_gen.c,200 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;usb_to_gen.c,195 :: 		if(row==2 && col==17){
L__main38:
L__main37:
;usb_to_gen.c,208 :: 		}
	GOTO	L_main8
;usb_to_gen.c,212 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
