
_address1:

;sync_box.c,51 :: 		void address1(){
;sync_box.c,53 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;sync_box.c,54 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;sync_box.c,55 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;sync_box.c,57 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;sync_box.c,59 :: 		void address2(){
;sync_box.c,61 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;sync_box.c,62 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;sync_box.c,63 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;sync_box.c,65 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;sync_box.c,67 :: 		void address3(){
;sync_box.c,69 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;sync_box.c,70 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;sync_box.c,71 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;sync_box.c,73 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;sync_box.c,75 :: 		void address4(){
;sync_box.c,77 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;sync_box.c,78 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;sync_box.c,79 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;sync_box.c,81 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_InitTimer0:

;sync_box.c,87 :: 		void InitTimer0(){
;sync_box.c,88 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;sync_box.c,89 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;sync_box.c,90 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;sync_box.c,91 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;sync_box.c,92 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;sync_box.c,94 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;sync_box.c,96 :: 		void InitTimer1(){
;sync_box.c,97 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;sync_box.c,98 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;sync_box.c,99 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;sync_box.c,100 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;sync_box.c,101 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;sync_box.c,102 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;sync_box.c,103 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;sync_box.c,105 :: 		void InitTimer2(){
;sync_box.c,106 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;sync_box.c,107 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;sync_box.c,108 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;sync_box.c,109 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;sync_box.c,110 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;sync_box.c,112 :: 		void InitTimer3(){
;sync_box.c,113 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;sync_box.c,114 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;sync_box.c,115 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;sync_box.c,116 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;sync_box.c,117 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;sync_box.c,118 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;sync_box.c,119 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;sync_box.c,121 :: 		void InitINT0(){
;sync_box.c,122 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;sync_box.c,123 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;sync_box.c,124 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;sync_box.c,125 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;sync_box.c,127 :: 		void InitINT1(){
;sync_box.c,128 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;sync_box.c,129 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;sync_box.c,130 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;sync_box.c,131 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;sync_box.c,133 :: 		void InitINT2(){
;sync_box.c,134 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;sync_box.c,135 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;sync_box.c,136 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;sync_box.c,137 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_interrupt:

;sync_box.c,143 :: 		void interrupt(){
;sync_box.c,145 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;sync_box.c,147 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;sync_box.c,148 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;sync_box.c,149 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;sync_box.c,150 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;sync_box.c,151 :: 		timer_sayac_0++;
	INFSNZ      _timer_sayac_0+0, 1 
	INCF        _timer_sayac_0+1, 1 
;sync_box.c,152 :: 		}
L_interrupt0:
;sync_box.c,153 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;sync_box.c,154 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;sync_box.c,155 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;sync_box.c,156 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;sync_box.c,158 :: 		}
L_interrupt1:
;sync_box.c,159 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;sync_box.c,160 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;sync_box.c,162 :: 		}
L_interrupt2:
;sync_box.c,163 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;sync_box.c,164 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;sync_box.c,165 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;sync_box.c,166 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;sync_box.c,168 :: 		}
L_interrupt3:
;sync_box.c,169 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;sync_box.c,170 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;sync_box.c,171 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;sync_box.c,172 :: 		}
L_interrupt4:
;sync_box.c,173 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;sync_box.c,174 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;sync_box.c,175 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;sync_box.c,176 :: 		}
L_interrupt5:
;sync_box.c,177 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;sync_box.c,179 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;sync_box.c,180 :: 		}
L_interrupt6:
;sync_box.c,184 :: 		}
L_end_interrupt:
L__interrupt44:
	RETFIE      1
; end of _interrupt

_main:

;sync_box.c,190 :: 		void main() {
;sync_box.c,192 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;sync_box.c,194 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;sync_box.c,196 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;sync_box.c,198 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;sync_box.c,200 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;sync_box.c,202 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;sync_box.c,204 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;sync_box.c,206 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;sync_box.c,208 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;sync_box.c,210 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;sync_box.c,214 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;sync_box.c,216 :: 		Lcd_Out(1,1,"SyncBox Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_sync_box+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_sync_box+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;sync_box.c,218 :: 		Delay_ms(1000);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
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
;sync_box.c,220 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;sync_box.c,224 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;sync_box.c,226 :: 		UART1_Write_Text("deneme");
	MOVLW       ?lstr2_sync_box+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_sync_box+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;sync_box.c,229 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;sync_box.c,234 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;sync_box.c,235 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;sync_box.c,236 :: 		address1();
	CALL        _address1+0, 0
;sync_box.c,240 :: 		while(1){
L_main8:
;sync_box.c,242 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;sync_box.c,246 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main31:
;sync_box.c,248 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;sync_box.c,250 :: 		writebuff[cnt]=readbuff[cnt];
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
;sync_box.c,248 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;sync_box.c,250 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;sync_box.c,252 :: 		while(!HID_Write(&writebuff,datacnt));
L_main16:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVF        _datacnt+0, 0 
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
	GOTO        L_main16
L_main17:
;sync_box.c,254 :: 		if(writebuff[0] == 'W' && writebuff[6] == 'O' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	MOVF        1350, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	BTFSC       PORTC+0, 0 
	GOTO        L_main20
	BTFSC       PORTC+0, 1 
	GOTO        L_main20
	BTFSC       PORTC+0, 2 
	GOTO        L_main20
L__main30:
;sync_box.c,256 :: 		PORTD.F0 = 1;
	BSF         PORTD+0, 0 
;sync_box.c,257 :: 		UART1_Write_Text(&writebuff);
	MOVLW       _writebuff+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;sync_box.c,259 :: 		}
L_main20:
;sync_box.c,261 :: 		if(writebuff[0] == 'X' && writebuff[6] == 'E' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       88
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
	MOVF        1350, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
	BTFSC       PORTC+0, 0 
	GOTO        L_main23
	BTFSC       PORTC+0, 1 
	GOTO        L_main23
	BTFSC       PORTC+0, 2 
	GOTO        L_main23
L__main29:
;sync_box.c,263 :: 		PORTD.F0 = 0;
	BCF         PORTD+0, 0 
;sync_box.c,264 :: 		UART1_Write_Text("led_off");
	MOVLW       ?lstr3_sync_box+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_sync_box+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;sync_box.c,266 :: 		}
L_main23:
;sync_box.c,267 :: 		}
L_main12:
;sync_box.c,311 :: 		if(PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_main26
	BTFSC       PORTC+0, 1 
	GOTO        L_main26
	BTFSC       PORTC+0, 2 
	GOTO        L_main26
	BTFSC       PORTB+0, 0 
	GOTO        L_main26
	BTFSC       PORTB+0, 1 
	GOTO        L_main26
L__main28:
;sync_box.c,313 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
;sync_box.c,315 :: 		uart_rd1[64] = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+64 
;sync_box.c,317 :: 		UART1_Write(uart_rd1[64]);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;sync_box.c,318 :: 		}
L_main27:
;sync_box.c,319 :: 		}
L_main26:
;sync_box.c,324 :: 		} // While Döngüsü Bitiþi
	GOTO        L_main8
;sync_box.c,326 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
