
_main:

;PIC2.c,24 :: 		void main() {
;PIC2.c,27 :: 		ANSELA = 0x00;
	CLRF        ANSELA+0 
;PIC2.c,30 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PIC2.c,33 :: 		UART2_Init(9600);
	BSF         BAUDCON2+0, 3, 0
	CLRF        SPBRGH2+0 
	MOVLW       103
	MOVWF       SPBRG2+0 
	BSF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;PIC2.c,46 :: 		while (1){
L_main0:
;PIC2.c,48 :: 		if(PORTA.F0 == 0 && PORTA.F1 == 1 && PORTA.F2 == 0){
	BTFSC       PORTA+0, 0 
	GOTO        L_main4
	BTFSS       PORTA+0, 1 
	GOTO        L_main4
	BTFSC       PORTA+0, 2 
	GOTO        L_main4
L__main11:
;PIC2.c,49 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;PIC2.c,50 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;PIC2.c,51 :: 		UART1_Write(uart_rd);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC2.c,53 :: 		}
L_main5:
;PIC2.c,54 :: 		}
L_main4:
;PIC2.c,56 :: 		if(PORTA.F0 == 1 && PORTA.F1 == 1 && PORTA.F2 == 0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main8
	BTFSS       PORTA+0, 1 
	GOTO        L_main8
	BTFSC       PORTA+0, 2 
	GOTO        L_main8
L__main10:
;PIC2.c,57 :: 		if (UART2_Data_Ready()){
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
;PIC2.c,58 :: 		uart_rd1 = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;PIC2.c,59 :: 		UART2_Write(uart_rd);
	MOVF        _uart_rd+0, 0 
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;PIC2.c,61 :: 		}
L_main9:
;PIC2.c,62 :: 		}
L_main8:
;PIC2.c,64 :: 		}
	GOTO        L_main0
;PIC2.c,68 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
