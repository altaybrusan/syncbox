
_main:

;deneme1.c,6 :: 		void main() {
;deneme1.c,8 :: 		ANSELC = 0x00;
	CLRF        ANSELC+0 
;deneme1.c,10 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;deneme1.c,11 :: 		UART2_Init(9600);
	BSF         BAUDCON2+0, 3, 0
	CLRF        SPBRGH2+0 
	MOVLW       103
	MOVWF       SPBRG2+0 
	BSF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;deneme1.c,13 :: 		Delay_ms(100);
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
;deneme1.c,14 :: 		UART1_Write(63);
	MOVLW       63
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,15 :: 		UART1_Write(80);
	MOVLW       80
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,16 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,18 :: 		Delay_ms(100);
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
;deneme1.c,19 :: 		UART1_Write(63);
	MOVLW       63
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,20 :: 		UART1_Write(87);
	MOVLW       87
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,21 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,23 :: 		while (1){
L_main2:
;deneme1.c,24 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;deneme1.c,25 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;deneme1.c,26 :: 		UART1_Write(uart_rd);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,28 :: 		}
L_main4:
;deneme1.c,30 :: 		if (UART2_Data_Ready()){
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;deneme1.c,31 :: 		uart_rd = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;deneme1.c,32 :: 		UART1_Write(uart_rd1);
	MOVF        _uart_rd1+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme1.c,34 :: 		}
L_main5:
;deneme1.c,35 :: 		}
	GOTO        L_main2
;deneme1.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
