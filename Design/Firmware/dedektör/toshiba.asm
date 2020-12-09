
_main:

;toshiba.c,2 :: 		void main() {
;toshiba.c,4 :: 		TRISD.F7 = 1;
	BSF         TRISD+0, 7 
;toshiba.c,5 :: 		TRISD.F6 = 0;
	BCF         TRISD+0, 6 
;toshiba.c,6 :: 		PORTD = 0;
	CLRF        PORTD+0 
;toshiba.c,10 :: 		CMCON = 0x07; // turn off comparators
	MOVLW       7
	MOVWF       CMCON+0 
;toshiba.c,11 :: 		ADCON1 = 0xFF; // turn off analog inputs
	MOVLW       255
	MOVWF       ADCON1+0 
;toshiba.c,13 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;toshiba.c,14 :: 		Delay_Ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;toshiba.c,15 :: 		UART1_Write_Text("Starting");
	MOVLW       ?lstr1_toshiba+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_toshiba+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;toshiba.c,18 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	NOP
	NOP
;toshiba.c,19 :: 		PORTD.F6 = 1;
	BSF         PORTD+0, 6 
;toshiba.c,20 :: 		Delay_Ms(40);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;toshiba.c,21 :: 		PORTD.F6 = 0;
	BCF         PORTD+0, 6 
;toshiba.c,22 :: 		Delay_Ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
	NOP
;toshiba.c,24 :: 		while(1){
L_main4:
;toshiba.c,25 :: 		if (PORTD.F7 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_main6
;toshiba.c,27 :: 		UART1_Write_Text("EXP_OK");
	MOVLW       ?lstr2_toshiba+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_toshiba+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;toshiba.c,29 :: 		}  }
L_main6:
	GOTO        L_main4
;toshiba.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
