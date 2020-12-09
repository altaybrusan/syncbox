
_main:

;LED.c,1 :: 		void main() {
;LED.c,2 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;LED.c,3 :: 		for(;;){
L_main0:
;LED.c,5 :: 		PORTC.F4=0;
	BCF         PORTC+0, 4 
;LED.c,6 :: 		Delay_Ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;LED.c,7 :: 		PORTC.F4=1;
	BSF         PORTC+0, 4 
;LED.c,8 :: 		Delay_Ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;LED.c,9 :: 		}
	GOTO        L_main0
;LED.c,10 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
