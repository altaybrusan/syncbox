
_address1:

;syncbox_test.c,51 :: 		void address1(){
;syncbox_test.c,53 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox_test.c,54 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox_test.c,55 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_test.c,57 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;syncbox_test.c,59 :: 		void address2(){
;syncbox_test.c,61 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox_test.c,62 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox_test.c,63 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_test.c,65 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;syncbox_test.c,67 :: 		void address3(){
;syncbox_test.c,69 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox_test.c,70 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox_test.c,71 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_test.c,73 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;syncbox_test.c,75 :: 		void address4(){
;syncbox_test.c,77 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox_test.c,78 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox_test.c,79 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_test.c,81 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_InitTimer0:

;syncbox_test.c,87 :: 		void InitTimer0(){
;syncbox_test.c,88 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;syncbox_test.c,89 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;syncbox_test.c,90 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;syncbox_test.c,91 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_test.c,92 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;syncbox_test.c,94 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;syncbox_test.c,96 :: 		void InitTimer1(){
;syncbox_test.c,97 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;syncbox_test.c,98 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox_test.c,99 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox_test.c,100 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox_test.c,101 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;syncbox_test.c,102 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox_test.c,103 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;syncbox_test.c,105 :: 		void InitTimer2(){
;syncbox_test.c,106 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;syncbox_test.c,107 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;syncbox_test.c,108 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;syncbox_test.c,109 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox_test.c,110 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;syncbox_test.c,112 :: 		void InitTimer3(){
;syncbox_test.c,113 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;syncbox_test.c,114 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox_test.c,115 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox_test.c,116 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox_test.c,117 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;syncbox_test.c,118 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox_test.c,119 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;syncbox_test.c,121 :: 		void InitINT0(){
;syncbox_test.c,122 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;syncbox_test.c,123 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_test.c,124 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;syncbox_test.c,125 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;syncbox_test.c,127 :: 		void InitINT1(){
;syncbox_test.c,128 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;syncbox_test.c,129 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_test.c,130 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;syncbox_test.c,131 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;syncbox_test.c,133 :: 		void InitINT2(){
;syncbox_test.c,134 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;syncbox_test.c,135 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_test.c,136 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;syncbox_test.c,137 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_interrupt:

;syncbox_test.c,143 :: 		void interrupt(){
;syncbox_test.c,145 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;syncbox_test.c,147 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;syncbox_test.c,148 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;syncbox_test.c,149 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;syncbox_test.c,150 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;syncbox_test.c,151 :: 		timer_sayac_0++;
	INFSNZ      _timer_sayac_0+0, 1 
	INCF        _timer_sayac_0+1, 1 
;syncbox_test.c,152 :: 		}
L_interrupt0:
;syncbox_test.c,153 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;syncbox_test.c,154 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox_test.c,155 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox_test.c,156 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox_test.c,158 :: 		}
L_interrupt1:
;syncbox_test.c,159 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;syncbox_test.c,160 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;syncbox_test.c,162 :: 		}
L_interrupt2:
;syncbox_test.c,163 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;syncbox_test.c,164 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox_test.c,165 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox_test.c,166 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox_test.c,168 :: 		}
L_interrupt3:
;syncbox_test.c,169 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;syncbox_test.c,170 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;syncbox_test.c,171 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;syncbox_test.c,172 :: 		}
L_interrupt4:
;syncbox_test.c,173 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;syncbox_test.c,174 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;syncbox_test.c,175 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;syncbox_test.c,176 :: 		}
L_interrupt5:
;syncbox_test.c,177 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;syncbox_test.c,179 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;syncbox_test.c,180 :: 		}
L_interrupt6:
;syncbox_test.c,184 :: 		}
L_end_interrupt:
L__interrupt67:
	RETFIE      1
; end of _interrupt

_main:

;syncbox_test.c,190 :: 		void main() {
;syncbox_test.c,192 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;syncbox_test.c,194 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;syncbox_test.c,196 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;syncbox_test.c,198 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;syncbox_test.c,200 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;syncbox_test.c,202 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;syncbox_test.c,204 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;syncbox_test.c,206 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;syncbox_test.c,208 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;syncbox_test.c,210 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;syncbox_test.c,214 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;syncbox_test.c,216 :: 		Lcd_Out(1,1,"SyncBox Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_syncbox_test+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_syncbox_test+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;syncbox_test.c,218 :: 		Delay_ms(1000);
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
;syncbox_test.c,220 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_test.c,224 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;syncbox_test.c,227 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;syncbox_test.c,231 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;syncbox_test.c,232 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;syncbox_test.c,233 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;syncbox_test.c,234 :: 		address1();
	CALL        _address1+0, 0
;syncbox_test.c,238 :: 		while(1){
L_main8:
;syncbox_test.c,240 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;syncbox_test.c,244 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main54:
;syncbox_test.c,246 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;syncbox_test.c,248 :: 		writebuff[cnt]=readbuff[cnt];
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
;syncbox_test.c,246 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox_test.c,248 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;syncbox_test.c,250 :: 		while(!HID_Write(&writebuff,datacnt));
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
;syncbox_test.c,252 :: 		if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	BTFSC       PORTC+0, 0 
	GOTO        L_main20
	BTFSC       PORTC+0, 1 
	GOTO        L_main20
	BTFSC       PORTC+0, 2 
	GOTO        L_main20
L__main53:
;syncbox_test.c,254 :: 		for(cnt=1;cnt<datacnt;cnt++){
	MOVLW       1
	MOVWF       _cnt+0 
L_main21:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
;syncbox_test.c,256 :: 		sent_data_1[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _sent_data_1+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_sent_data_1+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
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
;syncbox_test.c,258 :: 		UART1_Write_Text(&sent_data_1);
	MOVLW       _sent_data_1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox_test.c,254 :: 		for(cnt=1;cnt<datacnt;cnt++){
	INCF        _cnt+0, 1 
;syncbox_test.c,260 :: 		}
	GOTO        L_main21
L_main22:
;syncbox_test.c,261 :: 		}
L_main20:
;syncbox_test.c,262 :: 		}
L_main12:
;syncbox_test.c,266 :: 		if(ready == 1){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;syncbox_test.c,267 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;syncbox_test.c,268 :: 		ready = 0;
	CLRF        _ready+0 
;syncbox_test.c,269 :: 		}
L_main24:
;syncbox_test.c,271 :: 		if(xray_on == 1 && button_state_0 == 1){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
L__main52:
;syncbox_test.c,272 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,273 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,274 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,275 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;syncbox_test.c,276 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;syncbox_test.c,277 :: 		}
L_main27:
;syncbox_test.c,279 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L__main51
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	GOTO        L__main49
L__main51:
	BTFSC       PORTB+0, 1 
	GOTO        L__main50
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	GOTO        L__main49
L__main50:
	GOTO        L_main34
L__main49:
;syncbox_test.c,280 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,281 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,282 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,283 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;syncbox_test.c,284 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;syncbox_test.c,285 :: 		}
L_main34:
;syncbox_test.c,292 :: 		if(PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_main37
	BTFSC       PORTC+0, 1 
	GOTO        L_main37
	BTFSC       PORTC+0, 2 
	GOTO        L_main37
	BTFSC       PORTB+0, 0 
	GOTO        L_main37
	BTFSC       PORTB+0, 1 
	GOTO        L_main37
L__main48:
;syncbox_test.c,295 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main38
;syncbox_test.c,296 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;syncbox_test.c,297 :: 		UART1_Write(uart_rd1);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_test.c,298 :: 		Lcd_Chr(row,col,uart_rd1);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _uart_rd1+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox_test.c,299 :: 		if(uart_rd1==17){
	MOVF        _uart_rd1+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main39
;syncbox_test.c,300 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_test.c,301 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_test.c,302 :: 		}
L_main39:
;syncbox_test.c,303 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox_test.c,304 :: 		}
L_main38:
;syncbox_test.c,305 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main69
	MOVLW       17
	XORWF       _col+0, 0 
L__main69:
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main70
	MOVLW       1
	XORWF       _row+0, 0 
L__main70:
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
L__main47:
;syncbox_test.c,306 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_test.c,307 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_test.c,308 :: 		}
L_main42:
;syncbox_test.c,309 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main71
	MOVLW       2
	XORWF       _row+0, 0 
L__main71:
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main72
	MOVLW       17
	XORWF       _col+0, 0 
L__main72:
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
L__main46:
;syncbox_test.c,310 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_test.c,311 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_test.c,312 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_test.c,313 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
	CLRF        _timer_sayac_0+1 
;syncbox_test.c,314 :: 		}
L_main45:
;syncbox_test.c,315 :: 		}
L_main37:
;syncbox_test.c,388 :: 		} // While Döngüsü Bitiþi
	GOTO        L_main8
;syncbox_test.c,390 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
