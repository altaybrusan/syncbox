
_Interrupt_usb:

;usb_to_rs232_denem.c,51 :: 		void Interrupt_usb(){
;usb_to_rs232_denem.c,53 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;usb_to_rs232_denem.c,55 :: 		}
L_end_Interrupt_usb:
	RETURN      0
; end of _Interrupt_usb

_main:

;usb_to_rs232_denem.c,95 :: 		void main() {
;usb_to_rs232_denem.c,97 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;usb_to_rs232_denem.c,99 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;usb_to_rs232_denem.c,101 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;usb_to_rs232_denem.c,102 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;usb_to_rs232_denem.c,104 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_to_rs232_denem.c,105 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_to_rs232_denem.c,106 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_to_rs232_denem.c,108 :: 		Lcd_Init();   // LCD Etkinleþtirmesi
	CALL        _Lcd_Init+0, 0
;usb_to_rs232_denem.c,112 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_usb_to_rs232_denem+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_usb_to_rs232_denem+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;usb_to_rs232_denem.c,114 :: 		Delay_ms(1000);
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
;usb_to_rs232_denem.c,116 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_denem.c,118 :: 		UART1_Init(9600);  // UART1 Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;usb_to_rs232_denem.c,130 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;usb_to_rs232_denem.c,132 :: 		while(1){
L_main1:
;usb_to_rs232_denem.c,136 :: 		datacnt=HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;usb_to_rs232_denem.c,138 :: 		if(datacnt){
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;usb_to_rs232_denem.c,140 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main4:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;usb_to_rs232_denem.c,142 :: 		writebuff[cnt]=readbuff[cnt];
	MOVLW       _writebuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _readbuff+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FSR0H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;usb_to_rs232_denem.c,140 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;usb_to_rs232_denem.c,142 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main4
L_main5:
;usb_to_rs232_denem.c,146 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_denem.c,148 :: 		UART1_Write_Text(&writebuff);
	MOVLW       _writebuff+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;usb_to_rs232_denem.c,150 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_to_rs232_denem.c,152 :: 		Lcd_Out(row,col,writebuff);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _writebuff+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;usb_to_rs232_denem.c,154 :: 		Delay_Ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;usb_to_rs232_denem.c,156 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_denem.c,158 :: 		}
L_main3:
;usb_to_rs232_denem.c,164 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;usb_to_rs232_denem.c,166 :: 		Delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;usb_to_rs232_denem.c,168 :: 		for(cnt1=0;cnt1<uart_rd;cnt1++)
	CLRF        _cnt1+0 
L_main10:
	MOVF        _uart_rd+0, 0 
	SUBWF       _cnt1+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;usb_to_rs232_denem.c,170 :: 		uart_rd =  UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;usb_to_rs232_denem.c,168 :: 		for(cnt1=0;cnt1<uart_rd;cnt1++)
	INCF        _cnt1+0, 1 
;usb_to_rs232_denem.c,170 :: 		uart_rd =  UART1_Read();
	GOTO        L_main10
L_main11:
;usb_to_rs232_denem.c,172 :: 		Delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	NOP
	NOP
;usb_to_rs232_denem.c,174 :: 		UART1_Write(uart_rd);
	MOVF        _uart_rd+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_to_rs232_denem.c,176 :: 		Lcd_Chr(row,col,uart_rd);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _uart_rd+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;usb_to_rs232_denem.c,180 :: 		if(uart_rd==17){
	MOVF        _uart_rd+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;usb_to_rs232_denem.c,182 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_denem.c,184 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_to_rs232_denem.c,186 :: 		}
L_main14:
;usb_to_rs232_denem.c,188 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;usb_to_rs232_denem.c,190 :: 		}
L_main8:
;usb_to_rs232_denem.c,193 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVLW       17
	XORWF       _col+0, 0 
L__main26:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVLW       1
	XORWF       _row+0, 0 
L__main27:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
L__main23:
;usb_to_rs232_denem.c,195 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_to_rs232_denem.c,197 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_to_rs232_denem.c,199 :: 		}
L_main17:
;usb_to_rs232_denem.c,202 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVLW       2
	XORWF       _row+0, 0 
L__main28:
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVLW       17
	XORWF       _col+0, 0 
L__main29:
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
L__main22:
;usb_to_rs232_denem.c,204 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_denem.c,206 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_to_rs232_denem.c,208 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_to_rs232_denem.c,210 :: 		Delay_Ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	NOP
;usb_to_rs232_denem.c,212 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_denem.c,218 :: 		}
L_main20:
;usb_to_rs232_denem.c,220 :: 		}
	GOTO        L_main1
;usb_to_rs232_denem.c,224 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
