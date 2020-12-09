
_newline:

;UART.c,18 :: 		void newline(){
;UART.c,19 :: 		UART1_Write(13); // Carriage Return
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART.c,20 :: 		UART1_Write(10); // Line Feed
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART.c,21 :: 		}
L_end_newline:
	RETURN      0
; end of _newline

_main:

;UART.c,24 :: 		void main() {
;UART.c,25 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;UART.c,26 :: 		ADCON1 = 0x0F ;
	MOVLW       15
	MOVWF       ADCON1+0 
;UART.c,27 :: 		CMCON = 7; // Disable Comparators
	MOVLW       7
	MOVWF       CMCON+0 
;UART.c,29 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;UART.c,30 :: 		PORTD.F1 = 1;
	BSF         PORTD+0, 1 
;UART.c,31 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;UART.c,32 :: 		PORTD.F1 = 0;
	BCF         PORTD+0, 1 
;UART.c,33 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;UART.c,35 :: 		LCD_Init();
	CALL        _Lcd_Init+0, 0
;UART.c,36 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,37 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,38 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;UART.c,40 :: 		LCD_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UART+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UART+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART.c,41 :: 		Delay_ms(1000);
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
;UART.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,44 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UART.c,45 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;UART.c,46 :: 		UART1_Write_Text("Testing UART! ");
	MOVLW       ?lstr2_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,47 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;UART.c,50 :: 		newline();
	CALL        _newline+0, 0
;UART.c,53 :: 		while (1) {
L_main6:
;UART.c,54 :: 		if (UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;UART.c,57 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;UART.c,60 :: 		if(uart_rd == 'a' ){
	MOVF        R0, 0 
	XORLW       97
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;UART.c,61 :: 		PORTD.F1 = 1;
	BSF         PORTD+0, 1 
;UART.c,62 :: 		UART1_Write(uart_rd);
	MOVF        _uart_rd+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART.c,63 :: 		Lcd_Chr(1,1,uart_rd);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _uart_rd+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART.c,64 :: 		Lcd_Out(2,2,"Burak");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_UART+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_UART+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART.c,65 :: 		UART1_Write_Text("Burak");
	MOVLW       ?lstr4_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,66 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;UART.c,67 :: 		PORTD.F1 = 0;
	BCF         PORTD+0, 1 
;UART.c,68 :: 		}
	GOTO        L_main11
L_main9:
;UART.c,71 :: 		UART1_Write_Text("Error");
	MOVLW       ?lstr5_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,73 :: 		}
L_main11:
;UART.c,75 :: 		newline();
	CALL        _newline+0, 0
;UART.c,77 :: 		}
L_main8:
;UART.c,79 :: 		}
	GOTO        L_main6
;UART.c,80 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
