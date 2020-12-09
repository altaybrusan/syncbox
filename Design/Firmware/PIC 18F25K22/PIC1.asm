
_main:

;PIC1.c,7 :: 		void main() {
;PIC1.c,9 :: 		ANSELC = 0x00;
	CLRF        ANSELC+0 
;PIC1.c,11 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PIC1.c,13 :: 		UART2_Init(9600);
	BSF         BAUDCON2+0, 3, 0
	CLRF        SPBRGH2+0 
	MOVLW       103
	MOVWF       SPBRG2+0 
	BSF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;PIC1.c,16 :: 		while (1){
L_main0:
;PIC1.c,18 :: 		if(PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_main4
	BTFSC       PORTC+0, 1 
	GOTO        L_main4
	BTFSC       PORTC+0, 2 
	GOTO        L_main4
L__main17:
;PIC1.c,19 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;PIC1.c,20 :: 		for(cnt=0;cnt<4;cnt++){
	CLRF        _cnt+0 
L_main6:
	MOVLW       4
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;PIC1.c,21 :: 		uart_rd[cnt] = UART1_Read();
	MOVLW       _uart_rd+0
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FLOC__main+1 
	MOVF        _cnt+0, 0 
	ADDWF       FLOC__main+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__main+1, 1 
	CALL        _UART1_Read+0, 0
	MOVFF       FLOC__main+0, FSR1
	MOVFF       FLOC__main+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;PIC1.c,20 :: 		for(cnt=0;cnt<4;cnt++){
	INCF        _cnt+0, 1 
;PIC1.c,22 :: 		}
	GOTO        L_main6
L_main7:
;PIC1.c,23 :: 		for(cnt=0;cnt<4;cnt++){
	CLRF        _cnt+0 
L_main9:
	MOVLW       4
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;PIC1.c,25 :: 		UART1_Write(uart_rd[cnt]);
	MOVLW       _uart_rd+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FSR0H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC1.c,23 :: 		for(cnt=0;cnt<4;cnt++){
	INCF        _cnt+0, 1 
;PIC1.c,26 :: 		}
	GOTO        L_main9
L_main10:
;PIC1.c,31 :: 		}
L_main5:
;PIC1.c,32 :: 		}
L_main4:
;PIC1.c,34 :: 		if(PORTC.F0 == 1 && PORTC.F1 == 0 && PORTC.F2 == 0){
	BTFSS       PORTC+0, 0 
	GOTO        L_main14
	BTFSC       PORTC+0, 1 
	GOTO        L_main14
	BTFSC       PORTC+0, 2 
	GOTO        L_main14
L__main16:
;PIC1.c,35 :: 		if (UART2_Data_Ready()){
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
;PIC1.c,37 :: 		uart_rd1 = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;PIC1.c,38 :: 		UART2_Write(uart_rd1);
	MOVF        R0, 0 
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;PIC1.c,40 :: 		}
L_main15:
;PIC1.c,41 :: 		}
L_main14:
;PIC1.c,43 :: 		}
	GOTO        L_main0
;PIC1.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
