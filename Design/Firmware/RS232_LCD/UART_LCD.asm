
_xrayon:

;UART_LCD.c,22 :: 		void xrayon() {
;UART_LCD.c,24 :: 		}
L_end_xrayon:
	RETURN      0
; end of _xrayon

_xrayoff:

;UART_LCD.c,26 :: 		void xrayoff() {
;UART_LCD.c,28 :: 		}
L_end_xrayoff:
	RETURN      0
; end of _xrayoff

_main:

;UART_LCD.c,35 :: 		void main() {
;UART_LCD.c,37 :: 		ADCON1 = 0x0F ;
	MOVLW       15
	MOVWF       ADCON1+0 
;UART_LCD.c,38 :: 		CMCON  = 0x07 ;
	MOVLW       7
	MOVWF       CMCON+0 
;UART_LCD.c,40 :: 		TRISA = 0x00; // PORTA is output
	CLRF        TRISA+0 
;UART_LCD.c,41 :: 		TRISC = 0x00; // PORTA is output
	CLRF        TRISC+0 
;UART_LCD.c,42 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;UART_LCD.c,43 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;UART_LCD.c,44 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;UART_LCD.c,46 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;UART_LCD.c,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_LCD.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_LCD.c,49 :: 		Delay_ms(100);
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
;UART_LCD.c,51 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UART_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UART_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_LCD.c,52 :: 		Delay_ms(1000);
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
;UART_LCD.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_LCD.c,55 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UART_LCD.c,56 :: 		Delay_ms(100);
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
;UART_LCD.c,58 :: 		UART1_Write(63);
	MOVLW       63
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_LCD.c,59 :: 		UART1_Write(87);
	MOVLW       87
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_LCD.c,60 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_LCD.c,62 :: 		while (1){
L_main3:
;UART_LCD.c,63 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;UART_LCD.c,66 :: 		uart_rd=UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;UART_LCD.c,70 :: 		UART1_Write(uart_rd);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_LCD.c,80 :: 		Lcd_Chr(row,col,uart_rd);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _uart_rd+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_LCD.c,84 :: 		if(uart_rd==17){
	MOVF        _uart_rd+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;UART_LCD.c,85 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_LCD.c,86 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;UART_LCD.c,87 :: 		}
L_main6:
;UART_LCD.c,89 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;UART_LCD.c,90 :: 		}
L_main5:
;UART_LCD.c,91 :: 		if(col==17 && row==1)
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       17
	XORWF       _col+0, 0 
L__main18:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       1
	XORWF       _row+0, 0 
L__main19:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
L__main14:
;UART_LCD.c,93 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;UART_LCD.c,94 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;UART_LCD.c,95 :: 		}
L_main9:
;UART_LCD.c,96 :: 		if(row==2 && col==17)
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       2
	XORWF       _row+0, 0 
L__main20:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       17
	XORWF       _col+0, 0 
L__main21:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main13:
;UART_LCD.c,98 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_LCD.c,99 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;UART_LCD.c,100 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;UART_LCD.c,101 :: 		}
L_main12:
;UART_LCD.c,103 :: 		}
	GOTO        L_main3
;UART_LCD.c,104 :: 		} //}
L_end_main:
	GOTO        $+0
; end of _main
