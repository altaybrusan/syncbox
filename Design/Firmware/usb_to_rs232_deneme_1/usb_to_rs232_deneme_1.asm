
_address1:

;usb_to_rs232_deneme_1.c,38 :: 		void address1(){
;usb_to_rs232_deneme_1.c,40 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_to_rs232_deneme_1.c,41 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_to_rs232_deneme_1.c,42 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_to_rs232_deneme_1.c,44 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;usb_to_rs232_deneme_1.c,46 :: 		void address2(){
;usb_to_rs232_deneme_1.c,48 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;usb_to_rs232_deneme_1.c,49 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_to_rs232_deneme_1.c,50 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_to_rs232_deneme_1.c,52 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;usb_to_rs232_deneme_1.c,54 :: 		void address3(){
;usb_to_rs232_deneme_1.c,56 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_to_rs232_deneme_1.c,57 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;usb_to_rs232_deneme_1.c,58 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_to_rs232_deneme_1.c,60 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;usb_to_rs232_deneme_1.c,62 :: 		void address4(){
;usb_to_rs232_deneme_1.c,64 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;usb_to_rs232_deneme_1.c,65 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;usb_to_rs232_deneme_1.c,66 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_to_rs232_deneme_1.c,68 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_interrupt:

;usb_to_rs232_deneme_1.c,72 :: 		void interrupt(){
;usb_to_rs232_deneme_1.c,74 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;usb_to_rs232_deneme_1.c,76 :: 		}
L_end_interrupt:
L__interrupt28:
	RETFIE      1
; end of _interrupt

_main:

;usb_to_rs232_deneme_1.c,80 :: 		void main() {
;usb_to_rs232_deneme_1.c,82 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;usb_to_rs232_deneme_1.c,84 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;usb_to_rs232_deneme_1.c,86 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;usb_to_rs232_deneme_1.c,87 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;usb_to_rs232_deneme_1.c,89 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_to_rs232_deneme_1.c,90 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_to_rs232_deneme_1.c,91 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_to_rs232_deneme_1.c,95 :: 		Lcd_Init();   // LCD Etkinleþtirmesi
	CALL        _Lcd_Init+0, 0
;usb_to_rs232_deneme_1.c,99 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_usb_to_rs232_deneme_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_usb_to_rs232_deneme_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;usb_to_rs232_deneme_1.c,103 :: 		for(i=0;i<30000;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main0:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       117
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	MOVLW       48
	SUBWF       _i+0, 0 
L__main30:
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
;usb_to_rs232_deneme_1.c,105 :: 		if(i==29999){
	MOVF        _i+1, 0 
	XORLW       117
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVLW       47
	XORWF       _i+0, 0 
L__main31:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;usb_to_rs232_deneme_1.c,110 :: 		Lcd_Cmd(_LCD_CLEAR); }
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
L_main3:
;usb_to_rs232_deneme_1.c,103 :: 		for(i=0;i<30000;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;usb_to_rs232_deneme_1.c,110 :: 		Lcd_Cmd(_LCD_CLEAR); }
	GOTO        L_main0
L_main1:
;usb_to_rs232_deneme_1.c,112 :: 		UART1_Init(9600);  // UART1 Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;usb_to_rs232_deneme_1.c,124 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;usb_to_rs232_deneme_1.c,132 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;usb_to_rs232_deneme_1.c,134 :: 		if(datacnt){
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;usb_to_rs232_deneme_1.c,136 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main7:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;usb_to_rs232_deneme_1.c,138 :: 		writebuff[cnt]=readbuff[cnt];
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
;usb_to_rs232_deneme_1.c,136 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;usb_to_rs232_deneme_1.c,138 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main7
L_main8:
;usb_to_rs232_deneme_1.c,140 :: 		while(!HID_Write(&writebuff,datacnt));
L_main10:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVF        _datacnt+0, 0 
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
	GOTO        L_main10
L_main11:
;usb_to_rs232_deneme_1.c,142 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_to_rs232_deneme_1.c,144 :: 		UART1_Write_Text(&writebuff);
	MOVLW       _writebuff+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;usb_to_rs232_deneme_1.c,146 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_to_rs232_deneme_1.c,154 :: 		}
L_main6:
;usb_to_rs232_deneme_1.c,158 :: 		for(i=0;i<40000;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main12:
;usb_to_rs232_deneme_1.c,159 :: 		if(i==9999){
	MOVF        _i+1, 0 
	XORLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVLW       15
	XORWF       _i+0, 0 
L__main32:
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;usb_to_rs232_deneme_1.c,161 :: 		address1();
	CALL        _address1+0, 0
;usb_to_rs232_deneme_1.c,162 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
;usb_to_rs232_deneme_1.c,163 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;usb_to_rs232_deneme_1.c,165 :: 		UART1_Write(uart_rd1);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_to_rs232_deneme_1.c,166 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_to_rs232_deneme_1.c,168 :: 		}   }
L_main16:
L_main15:
;usb_to_rs232_deneme_1.c,158 :: 		for(i=0;i<40000;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;usb_to_rs232_deneme_1.c,168 :: 		}   }
	GOTO        L_main12
;usb_to_rs232_deneme_1.c,209 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
