
_main:

;button.c,8 :: 		void main() {
;button.c,12 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;button.c,14 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;button.c,17 :: 		PORTD.F6 = 0;
	BCF         PORTD+0, 6 
;button.c,18 :: 		PORTD.F7 = 0;
	BCF         PORTD+0, 7 
;button.c,21 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;button.c,22 :: 		Delay_ms(100);
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
;button.c,23 :: 		UART1_Write(63);
	MOVLW       63
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;button.c,24 :: 		UART1_Write(80);
	MOVLW       80
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;button.c,25 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;button.c,27 :: 		while(1){
L_main1:
;button.c,28 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;button.c,29 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;button.c,30 :: 		UART1_Write(uart_rd);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;button.c,31 :: 		}
L_main3:
;button.c,32 :: 		if(PORTD.F6 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_main4
;button.c,33 :: 		i=1;
	MOVLW       1
	MOVWF       _i+0 
;button.c,34 :: 		}
L_main4:
;button.c,36 :: 		if(PORTD.F6 == 1 && PORTD.F7 == 1 && i==1){
	BTFSS       PORTD+0, 6 
	GOTO        L_main7
	BTFSS       PORTD+0, 7 
	GOTO        L_main7
	MOVF        _i+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
L__main12:
;button.c,37 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;button.c,38 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;button.c,39 :: 		i=1;
	MOVLW       1
	MOVWF       _i+0 
;button.c,40 :: 		k=1;
	MOVLW       1
	MOVWF       _k+0 
;button.c,41 :: 		}
L_main7:
;button.c,43 :: 		if(PORTD.F6 == 0 && PORTD.F7 == 0 && i==1 && a==1){
	BTFSC       PORTD+0, 6 
	GOTO        L_main10
	BTFSC       PORTD+0, 7 
	GOTO        L_main10
	MOVF        _i+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;button.c,49 :: 		}
L_main10:
;button.c,51 :: 		}
	GOTO        L_main1
;button.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
