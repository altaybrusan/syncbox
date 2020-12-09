
_Move_Delay:

;MyProject.c,24 :: 		void Move_Delay() {                  // Function used for text moving
;MyProject.c,25 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOV	#107, W8
	MOV	#53247, W7
L_Move_Delay0:
	DEC	W7
	BRA NZ	L_Move_Delay0
	DEC	W8
	BRA NZ	L_Move_Delay0
	NOP
	NOP
;MyProject.c,26 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;MyProject.c,28 :: 		void main(){
;MyProject.c,30 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;MyProject.c,31 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;MyProject.c,33 :: 		ANSELA = 0x00;           // Convert all I/O pins to digital
	CLR	ANSELA
;MyProject.c,34 :: 		ANSELB = 0x00;
	CLR	ANSELB
;MyProject.c,35 :: 		ANSELC = 0x00;
	CLR	ANSELC
;MyProject.c,36 :: 		ANSELD = 0x00;
	CLR	ANSELD
;MyProject.c,37 :: 		ANSELE = 0x00;
	CLR	ANSELE
;MyProject.c,38 :: 		ANSELG = 0x00;
	CLR	ANSELG
;MyProject.c,41 :: 		Lcd_Init();                        // Initialize LCD
	CALL	_Lcd_Init
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;MyProject.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOV.B	#12, W10
	CALL	_Lcd_Cmd
;MyProject.c,45 :: 		Lcd_Out(1,6,txt3);                 // Write text in first row
	MOV	#lo_addr(_txt3), W12
	MOV	#6, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;MyProject.c,47 :: 		Lcd_Out(2,6,txt4);                 // Write text in second row
	MOV	#lo_addr(_txt4), W12
	MOV	#6, W11
	MOV	#2, W10
	CALL	_Lcd_Out
;MyProject.c,48 :: 		Delay_ms(2000);
	MOV	#428, W8
	MOV	#16384, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;MyProject.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOV.B	#1, W10
	CALL	_Lcd_Cmd
;MyProject.c,51 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOV	#lo_addr(_txt1), W12
	MOV	#1, W11
	MOV	#1, W10
	CALL	_Lcd_Out
;MyProject.c,52 :: 		Lcd_Out(2,5,txt2);                 // Write text in second row
	MOV	#lo_addr(_txt2), W12
	MOV	#5, W11
	MOV	#2, W10
	CALL	_Lcd_Out
;MyProject.c,54 :: 		Delay_ms(2000);
	MOV	#428, W8
	MOV	#16384, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
;MyProject.c,57 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	MOV	#lo_addr(_i), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main6:
	MOV	#lo_addr(_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA LTU	L__main19
	GOTO	L_main7
L__main19:
;MyProject.c,58 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOV.B	#28, W10
	CALL	_Lcd_Cmd
;MyProject.c,59 :: 		Move_Delay();
	CALL	_Move_Delay
;MyProject.c,57 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	MOV.B	#1, W1
	MOV	#lo_addr(_i), W0
	ADD.B	W1, [W0], [W0]
;MyProject.c,60 :: 		}
	GOTO	L_main6
L_main7:
;MyProject.c,62 :: 		while(1) {                         // Endless loop
L_main9:
;MyProject.c,63 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	MOV	#lo_addr(_i), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main11:
	MOV	#lo_addr(_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LTU	L__main20
	GOTO	L_main12
L__main20:
;MyProject.c,64 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOV.B	#24, W10
	CALL	_Lcd_Cmd
;MyProject.c,65 :: 		Move_Delay();
	CALL	_Move_Delay
;MyProject.c,63 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	MOV.B	#1, W1
	MOV	#lo_addr(_i), W0
	ADD.B	W1, [W0], [W0]
;MyProject.c,66 :: 		}
	GOTO	L_main11
L_main12:
;MyProject.c,68 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	MOV	#lo_addr(_i), W1
	CLR	W0
	MOV.B	W0, [W1]
L_main14:
	MOV	#lo_addr(_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LTU	L__main21
	GOTO	L_main15
L__main21:
;MyProject.c,69 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOV.B	#28, W10
	CALL	_Lcd_Cmd
;MyProject.c,70 :: 		Move_Delay();
	CALL	_Move_Delay
;MyProject.c,68 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	MOV.B	#1, W1
	MOV	#lo_addr(_i), W0
	ADD.B	W1, [W0], [W0]
;MyProject.c,71 :: 		}
	GOTO	L_main14
L_main15:
;MyProject.c,72 :: 		}
	GOTO	L_main9
;MyProject.c,73 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
