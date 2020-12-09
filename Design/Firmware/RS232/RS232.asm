
_main:

;RS232.c,4 :: 		void main() {
;RS232.c,5 :: 		TRISD.F0 = 0;//PORTB çýkýþ
	BCF         TRISD+0, 0 
;RS232.c,6 :: 		PORTD.F0 = 0;//PORTB'nin tüm pinleri 0 seviyesinde.
	BCF         PORTD+0, 0 
;RS232.c,7 :: 		ADCON1 = 0x0F ;
	MOVLW       15
	MOVWF       ADCON1+0 
;RS232.c,8 :: 		CMCON = 7; // Disable Comparators
	MOVLW       7
	MOVWF       CMCON+0 
;RS232.c,11 :: 		PORTD.F0 = 1;
	BSF         PORTD+0, 0 
;RS232.c,13 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;RS232.c,14 :: 		Delay_ms(100);
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
;RS232.c,16 :: 		UART1_Write(63);
	MOVLW       63
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;RS232.c,17 :: 		UART1_Write(80);
	MOVLW       80
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;RS232.c,18 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;RS232.c,21 :: 		while (1)
L_main1:
;RS232.c,24 :: 		if (UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;RS232.c,27 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;RS232.c,29 :: 		UART1_Write(uart_rd);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;RS232.c,30 :: 		}
L_main3:
;RS232.c,31 :: 		}
	GOTO        L_main1
;RS232.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
