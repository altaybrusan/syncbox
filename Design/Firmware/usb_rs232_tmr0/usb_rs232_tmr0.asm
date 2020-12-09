
_address1:

;usb_rs232_tmr0.c,44 :: 		void address1(){
;usb_rs232_tmr0.c,46 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_rs232_tmr0.c,47 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_rs232_tmr0.c,48 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_rs232_tmr0.c,50 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;usb_rs232_tmr0.c,52 :: 		void address2(){
;usb_rs232_tmr0.c,54 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;usb_rs232_tmr0.c,55 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_rs232_tmr0.c,56 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_rs232_tmr0.c,58 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;usb_rs232_tmr0.c,60 :: 		void address3(){
;usb_rs232_tmr0.c,62 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_rs232_tmr0.c,63 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;usb_rs232_tmr0.c,64 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_rs232_tmr0.c,66 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;usb_rs232_tmr0.c,68 :: 		void address4(){
;usb_rs232_tmr0.c,70 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;usb_rs232_tmr0.c,71 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;usb_rs232_tmr0.c,72 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_rs232_tmr0.c,74 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_interrupt:

;usb_rs232_tmr0.c,81 :: 		void interrupt(){
;usb_rs232_tmr0.c,83 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;usb_rs232_tmr0.c,85 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;usb_rs232_tmr0.c,86 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;usb_rs232_tmr0.c,87 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;usb_rs232_tmr0.c,88 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;usb_rs232_tmr0.c,89 :: 		timer_sayac_0++;
	INCF        _timer_sayac_0+0, 1 
;usb_rs232_tmr0.c,90 :: 		}
L_interrupt0:
;usb_rs232_tmr0.c,91 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;usb_rs232_tmr0.c,92 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;usb_rs232_tmr0.c,93 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;usb_rs232_tmr0.c,94 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;usb_rs232_tmr0.c,96 :: 		}
L_interrupt1:
;usb_rs232_tmr0.c,97 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;usb_rs232_tmr0.c,98 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;usb_rs232_tmr0.c,100 :: 		}
L_interrupt2:
;usb_rs232_tmr0.c,101 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;usb_rs232_tmr0.c,102 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;usb_rs232_tmr0.c,103 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;usb_rs232_tmr0.c,104 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;usb_rs232_tmr0.c,106 :: 		}
L_interrupt3:
;usb_rs232_tmr0.c,107 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;usb_rs232_tmr0.c,108 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;usb_rs232_tmr0.c,109 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;usb_rs232_tmr0.c,110 :: 		}
L_interrupt4:
;usb_rs232_tmr0.c,111 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;usb_rs232_tmr0.c,112 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;usb_rs232_tmr0.c,113 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;usb_rs232_tmr0.c,114 :: 		}
L_interrupt5:
;usb_rs232_tmr0.c,115 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;usb_rs232_tmr0.c,117 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;usb_rs232_tmr0.c,118 :: 		}
L_interrupt6:
;usb_rs232_tmr0.c,122 :: 		}
L_end_interrupt:
L__interrupt95:
	RETFIE      1
; end of _interrupt

_InitTimer0:

;usb_rs232_tmr0.c,129 :: 		void InitTimer0(){
;usb_rs232_tmr0.c,130 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;usb_rs232_tmr0.c,131 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;usb_rs232_tmr0.c,132 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;usb_rs232_tmr0.c,133 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_rs232_tmr0.c,134 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;usb_rs232_tmr0.c,136 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;usb_rs232_tmr0.c,138 :: 		void InitTimer1(){
;usb_rs232_tmr0.c,139 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;usb_rs232_tmr0.c,140 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;usb_rs232_tmr0.c,141 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;usb_rs232_tmr0.c,142 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;usb_rs232_tmr0.c,143 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;usb_rs232_tmr0.c,144 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;usb_rs232_tmr0.c,145 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;usb_rs232_tmr0.c,147 :: 		void InitTimer2(){
;usb_rs232_tmr0.c,148 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;usb_rs232_tmr0.c,149 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;usb_rs232_tmr0.c,150 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;usb_rs232_tmr0.c,151 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;usb_rs232_tmr0.c,152 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;usb_rs232_tmr0.c,154 :: 		void InitTimer3(){
;usb_rs232_tmr0.c,155 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;usb_rs232_tmr0.c,156 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;usb_rs232_tmr0.c,157 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;usb_rs232_tmr0.c,158 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;usb_rs232_tmr0.c,159 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;usb_rs232_tmr0.c,160 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;usb_rs232_tmr0.c,161 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;usb_rs232_tmr0.c,163 :: 		void InitINT0(){
;usb_rs232_tmr0.c,164 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;usb_rs232_tmr0.c,165 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_rs232_tmr0.c,166 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;usb_rs232_tmr0.c,167 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;usb_rs232_tmr0.c,169 :: 		void InitINT1(){
;usb_rs232_tmr0.c,170 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;usb_rs232_tmr0.c,171 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_rs232_tmr0.c,172 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;usb_rs232_tmr0.c,173 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;usb_rs232_tmr0.c,175 :: 		void InitINT2(){
;usb_rs232_tmr0.c,176 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;usb_rs232_tmr0.c,177 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_rs232_tmr0.c,178 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;usb_rs232_tmr0.c,179 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_main:

;usb_rs232_tmr0.c,186 :: 		void main() {
;usb_rs232_tmr0.c,188 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;usb_rs232_tmr0.c,190 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;usb_rs232_tmr0.c,192 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;usb_rs232_tmr0.c,194 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;usb_rs232_tmr0.c,196 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;usb_rs232_tmr0.c,198 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;usb_rs232_tmr0.c,200 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;usb_rs232_tmr0.c,205 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;usb_rs232_tmr0.c,207 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_usb_rs232_tmr0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_usb_rs232_tmr0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;usb_rs232_tmr0.c,209 :: 		Delay_ms(1000);
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
;usb_rs232_tmr0.c,211 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,215 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;usb_rs232_tmr0.c,218 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;usb_rs232_tmr0.c,222 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;usb_rs232_tmr0.c,223 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;usb_rs232_tmr0.c,224 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;usb_rs232_tmr0.c,228 :: 		while(1){
L_main8:
;usb_rs232_tmr0.c,230 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;usb_rs232_tmr0.c,234 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main89:
;usb_rs232_tmr0.c,236 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;usb_rs232_tmr0.c,238 :: 		writebuff[cnt]=readbuff[cnt];
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
;usb_rs232_tmr0.c,236 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;usb_rs232_tmr0.c,238 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;usb_rs232_tmr0.c,240 :: 		while(!HID_Write(&writebuff,datacnt));
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
;usb_rs232_tmr0.c,244 :: 		UART1_Write_Text(&writebuff);
	MOVLW       _writebuff+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;usb_rs232_tmr0.c,254 :: 		}
L_main12:
;usb_rs232_tmr0.c,261 :: 		if(ready == 1){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
;usb_rs232_tmr0.c,262 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;usb_rs232_tmr0.c,264 :: 		ready = 0;
	CLRF        _ready+0 
;usb_rs232_tmr0.c,265 :: 		}
L_main18:
;usb_rs232_tmr0.c,267 :: 		if(xray_on == 1 && button_state_0 == 1){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
L__main88:
;usb_rs232_tmr0.c,268 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_rs232_tmr0.c,269 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_rs232_tmr0.c,270 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_rs232_tmr0.c,271 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;usb_rs232_tmr0.c,272 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;usb_rs232_tmr0.c,273 :: 		}
L_main21:
;usb_rs232_tmr0.c,275 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L__main87
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main87
	GOTO        L__main85
L__main87:
	BTFSC       PORTB+0, 1 
	GOTO        L__main86
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main86
	GOTO        L__main85
L__main86:
	GOTO        L_main28
L__main85:
;usb_rs232_tmr0.c,276 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_rs232_tmr0.c,277 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_rs232_tmr0.c,278 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;usb_rs232_tmr0.c,279 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;usb_rs232_tmr0.c,280 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;usb_rs232_tmr0.c,281 :: 		}
L_main28:
;usb_rs232_tmr0.c,289 :: 		if(timer_sayac_0 == 1 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
	BTFSC       PORTB+0, 0 
	GOTO        L_main31
	BTFSC       PORTB+0, 1 
	GOTO        L_main31
L__main84:
;usb_rs232_tmr0.c,290 :: 		UART1_Write_Text("1");
	MOVLW       ?lstr2_usb_rs232_tmr0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_usb_rs232_tmr0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;usb_rs232_tmr0.c,291 :: 		address1();
	CALL        _address1+0, 0
;usb_rs232_tmr0.c,292 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
;usb_rs232_tmr0.c,293 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;usb_rs232_tmr0.c,294 :: 		Lcd_Chr(row,col,uart_rd1);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;usb_rs232_tmr0.c,295 :: 		if(uart_rd1==17){
	MOVF        _uart_rd1+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main33
;usb_rs232_tmr0.c,296 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,297 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,298 :: 		}
L_main33:
;usb_rs232_tmr0.c,299 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;usb_rs232_tmr0.c,300 :: 		}
L_main32:
;usb_rs232_tmr0.c,301 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main104
	MOVLW       17
	XORWF       _col+0, 0 
L__main104:
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main105
	MOVLW       1
	XORWF       _row+0, 0 
L__main105:
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
L__main83:
;usb_rs232_tmr0.c,302 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,303 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,304 :: 		}
L_main36:
;usb_rs232_tmr0.c,305 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main106
	MOVLW       2
	XORWF       _row+0, 0 
L__main106:
	BTFSS       STATUS+0, 2 
	GOTO        L_main39
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main107
	MOVLW       17
	XORWF       _col+0, 0 
L__main107:
	BTFSS       STATUS+0, 2 
	GOTO        L_main39
L__main82:
;usb_rs232_tmr0.c,306 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,307 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,308 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,309 :: 		}
L_main39:
;usb_rs232_tmr0.c,310 :: 		}
L_main31:
;usb_rs232_tmr0.c,312 :: 		if(timer_sayac_0 == 2 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
	BTFSC       PORTB+0, 0 
	GOTO        L_main42
	BTFSC       PORTB+0, 1 
	GOTO        L_main42
L__main81:
;usb_rs232_tmr0.c,313 :: 		UART1_Write_Text("2");
	MOVLW       ?lstr3_usb_rs232_tmr0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_usb_rs232_tmr0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;usb_rs232_tmr0.c,314 :: 		address2();
	CALL        _address2+0, 0
;usb_rs232_tmr0.c,315 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
;usb_rs232_tmr0.c,316 :: 		uart_rd2 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd2+0 
;usb_rs232_tmr0.c,317 :: 		Lcd_Chr(row,col,uart_rd2);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;usb_rs232_tmr0.c,318 :: 		if(uart_rd2 ==17){
	MOVF        _uart_rd2+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main44
;usb_rs232_tmr0.c,319 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,320 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,321 :: 		}
L_main44:
;usb_rs232_tmr0.c,322 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;usb_rs232_tmr0.c,323 :: 		}
L_main43:
;usb_rs232_tmr0.c,324 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main108
	MOVLW       17
	XORWF       _col+0, 0 
L__main108:
	BTFSS       STATUS+0, 2 
	GOTO        L_main47
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main109
	MOVLW       1
	XORWF       _row+0, 0 
L__main109:
	BTFSS       STATUS+0, 2 
	GOTO        L_main47
L__main80:
;usb_rs232_tmr0.c,325 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,326 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,327 :: 		}
L_main47:
;usb_rs232_tmr0.c,328 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	MOVLW       2
	XORWF       _row+0, 0 
L__main110:
	BTFSS       STATUS+0, 2 
	GOTO        L_main50
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main111
	MOVLW       17
	XORWF       _col+0, 0 
L__main111:
	BTFSS       STATUS+0, 2 
	GOTO        L_main50
L__main79:
;usb_rs232_tmr0.c,329 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,330 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,331 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,332 :: 		}
L_main50:
;usb_rs232_tmr0.c,333 :: 		}
L_main42:
;usb_rs232_tmr0.c,335 :: 		if(timer_sayac_0 == 3 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
	BTFSC       PORTB+0, 0 
	GOTO        L_main53
	BTFSC       PORTB+0, 1 
	GOTO        L_main53
L__main78:
;usb_rs232_tmr0.c,336 :: 		UART1_Write_Text("3");
	MOVLW       ?lstr4_usb_rs232_tmr0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_usb_rs232_tmr0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;usb_rs232_tmr0.c,337 :: 		address3();
	CALL        _address3+0, 0
;usb_rs232_tmr0.c,338 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
;usb_rs232_tmr0.c,339 :: 		uart_rd3 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd3+0 
;usb_rs232_tmr0.c,340 :: 		Lcd_Chr(row,col,uart_rd3);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;usb_rs232_tmr0.c,341 :: 		if(uart_rd3==17){
	MOVF        _uart_rd3+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
;usb_rs232_tmr0.c,342 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,343 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,344 :: 		}
L_main55:
;usb_rs232_tmr0.c,345 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;usb_rs232_tmr0.c,346 :: 		}
L_main54:
;usb_rs232_tmr0.c,347 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main112
	MOVLW       17
	XORWF       _col+0, 0 
L__main112:
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main113
	MOVLW       1
	XORWF       _row+0, 0 
L__main113:
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
L__main77:
;usb_rs232_tmr0.c,348 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,349 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,350 :: 		}
L_main58:
;usb_rs232_tmr0.c,351 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main114
	MOVLW       2
	XORWF       _row+0, 0 
L__main114:
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main115
	MOVLW       17
	XORWF       _col+0, 0 
L__main115:
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
L__main76:
;usb_rs232_tmr0.c,352 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,353 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,354 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,355 :: 		}
L_main61:
;usb_rs232_tmr0.c,356 :: 		}
L_main53:
;usb_rs232_tmr0.c,358 :: 		if(timer_sayac_0 == 4 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
	BTFSC       PORTB+0, 0 
	GOTO        L_main64
	BTFSC       PORTB+0, 1 
	GOTO        L_main64
L__main75:
;usb_rs232_tmr0.c,360 :: 		address1();
	CALL        _address1+0, 0
;usb_rs232_tmr0.c,362 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main65
;usb_rs232_tmr0.c,363 :: 		uart_rd4 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd4+0 
;usb_rs232_tmr0.c,364 :: 		Lcd_Chr(row,col,uart_rd4);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;usb_rs232_tmr0.c,365 :: 		if(uart_rd4==17){
	MOVF        _uart_rd4+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
;usb_rs232_tmr0.c,366 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,367 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,368 :: 		}
L_main66:
;usb_rs232_tmr0.c,369 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;usb_rs232_tmr0.c,370 :: 		}
L_main65:
;usb_rs232_tmr0.c,371 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main116
	MOVLW       17
	XORWF       _col+0, 0 
L__main116:
	BTFSS       STATUS+0, 2 
	GOTO        L_main69
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main117
	MOVLW       1
	XORWF       _row+0, 0 
L__main117:
	BTFSS       STATUS+0, 2 
	GOTO        L_main69
L__main74:
;usb_rs232_tmr0.c,372 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,373 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,374 :: 		}
L_main69:
;usb_rs232_tmr0.c,375 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main118
	MOVLW       2
	XORWF       _row+0, 0 
L__main118:
	BTFSS       STATUS+0, 2 
	GOTO        L_main72
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main119
	MOVLW       17
	XORWF       _col+0, 0 
L__main119:
	BTFSS       STATUS+0, 2 
	GOTO        L_main72
L__main73:
;usb_rs232_tmr0.c,376 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_rs232_tmr0.c,377 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;usb_rs232_tmr0.c,378 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;usb_rs232_tmr0.c,379 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
;usb_rs232_tmr0.c,380 :: 		}
L_main72:
;usb_rs232_tmr0.c,381 :: 		}
L_main64:
;usb_rs232_tmr0.c,386 :: 		} // While Döngüsü Bitiþi
	GOTO        L_main8
;usb_rs232_tmr0.c,387 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
