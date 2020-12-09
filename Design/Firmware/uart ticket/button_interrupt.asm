
_interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;button_interrupt.c,19 :: 		void interrupt(void);    void interrupt() iv IVT_ADDR_INT0INTERRUPT ics ICS_AUTO {
;button_interrupt.c,22 :: 		if(IFS0.F0 == 1) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BTSS	IFS0, #0
	GOTO	L_interrupt0
;button_interrupt.c,24 :: 		flag = 1;
	MOV	#lo_addr(_flag), W0
	BSET	[W0], BitPos(_flag+0)
;button_interrupt.c,26 :: 		IFS0.F0 = 0;
	BCLR	IFS0, #0
;button_interrupt.c,28 :: 		if(PORTD.F0 == 1){
	BTSS	PORTD, #0
	GOTO	L_interrupt1
;button_interrupt.c,30 :: 		Lcd_Out(1,1,"Dügmeye basiniz");
	MOV	#lo_addr(?lstr1_button_interrupt), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;button_interrupt.c,32 :: 		IFS0.F0 = 0;
	BCLR	IFS0, #0
;button_interrupt.c,34 :: 		}
L_interrupt1:
;button_interrupt.c,36 :: 		}
L_interrupt0:
;button_interrupt.c,38 :: 		}
L_end_interrupt:
	POP	W12
	POP	W11
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

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;button_interrupt.c,44 :: 		void main() {
;button_interrupt.c,46 :: 		PLLFBD = 70;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;button_interrupt.c,47 :: 		CLKDIV = 0x0000;
	CLR	CLKDIV
;button_interrupt.c,49 :: 		ANSELA = 0x00;
	CLR	ANSELA
;button_interrupt.c,50 :: 		ANSELB = 0x00;
	CLR	ANSELB
;button_interrupt.c,51 :: 		ANSELC = 0x00;
	CLR	ANSELC
;button_interrupt.c,52 :: 		ANSELD = 0x00;
	CLR	ANSELD
;button_interrupt.c,53 :: 		ANSELE = 0x00;
	CLR	ANSELE
;button_interrupt.c,54 :: 		ANSELG = 0x00;
	CLR	ANSELG
;button_interrupt.c,56 :: 		TRISA.F15 = 0;
	BCLR	TRISA, #15
;button_interrupt.c,57 :: 		PORTA.F15 = 0;
	BCLR	PORTA, #15
;button_interrupt.c,59 :: 		TRISA.F14 = 0;
	BCLR	TRISA, #14
;button_interrupt.c,60 :: 		PORTA.F14 = 0;
	BCLR	PORTA, #14
;button_interrupt.c,62 :: 		TRISD.F0 = 0;
	BCLR	TRISD, #0
;button_interrupt.c,63 :: 		PORTD.F0 = 0;
	BCLR	PORTD, #0
;button_interrupt.c,66 :: 		Lcd_Init();
	CALL	_Lcd_Init
;button_interrupt.c,67 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
	NOP
;button_interrupt.c,69 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOV	#lo_addr(?lstr2_button_interrupt), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;button_interrupt.c,70 :: 		Delay_ms(1000);
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
;button_interrupt.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;button_interrupt.c,74 :: 		IFS0 = 0;     // Clear interrupt flag prior to enable
	CLR	IFS0
;button_interrupt.c,75 :: 		IEC0 = 1;     // enable on change interrupts
	MOV	#1, W0
	MOV	WREG, IEC0
;button_interrupt.c,80 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
