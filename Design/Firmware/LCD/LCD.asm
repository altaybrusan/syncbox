
_main:

;LCD.c,22 :: 		void main() {
;LCD.c,26 :: 		ADCON1 = 0x0F ;
	MOVLW       15
	MOVWF       ADCON1+0 
;LCD.c,27 :: 		CMCON  = 0x07 ;
	MOVLW       7
	MOVWF       CMCON+0 
;LCD.c,29 :: 		TRISA = 0x00; // PORTA is output
	CLRF        TRISA+0 
;LCD.c,31 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;LCD.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD.c,35 :: 		Lcd_Out(1,1,_titleStr);            // Write text in first row
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       __titleStr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(__titleStr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,37 :: 		Lcd_Out(2,7,_dotStr);                     // Write text in second row
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       __dotStr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(__dotStr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,38 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;LCD.c,39 :: 		Lcd_Out(2,8,_dotStr);                     // Write text in second row
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       __dotStr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(__dotStr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,40 :: 		Delay_ms(300);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       134
	MOVWF       R12, 0
	MOVLW       153
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
;LCD.c,41 :: 		Lcd_Out(2,9,_dotStr);                     // Write text in second row
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       __dotStr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(__dotStr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD.c,44 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;LCD.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
