
_address1:

;usb_led.c,56 :: 		void address1(){
;usb_led.c,58 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_led.c,59 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_led.c,60 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_led.c,62 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;usb_led.c,64 :: 		void address2(){
;usb_led.c,66 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;usb_led.c,67 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;usb_led.c,68 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_led.c,70 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;usb_led.c,72 :: 		void address3(){
;usb_led.c,74 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;usb_led.c,75 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;usb_led.c,76 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_led.c,78 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;usb_led.c,80 :: 		void address4(){
;usb_led.c,82 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;usb_led.c,83 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;usb_led.c,84 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;usb_led.c,86 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_InitTimer0:

;usb_led.c,92 :: 		void InitTimer0(){
;usb_led.c,93 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;usb_led.c,94 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;usb_led.c,95 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;usb_led.c,96 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_led.c,97 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;usb_led.c,99 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;usb_led.c,101 :: 		void InitTimer1(){
;usb_led.c,102 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;usb_led.c,103 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;usb_led.c,104 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;usb_led.c,105 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;usb_led.c,106 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;usb_led.c,107 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;usb_led.c,108 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;usb_led.c,110 :: 		void InitTimer2(){
;usb_led.c,111 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;usb_led.c,112 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;usb_led.c,113 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;usb_led.c,114 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;usb_led.c,115 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;usb_led.c,117 :: 		void InitTimer3(){
;usb_led.c,118 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;usb_led.c,119 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;usb_led.c,120 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;usb_led.c,121 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;usb_led.c,122 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;usb_led.c,123 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;usb_led.c,124 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;usb_led.c,126 :: 		void InitINT0(){
;usb_led.c,127 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;usb_led.c,128 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_led.c,129 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;usb_led.c,130 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;usb_led.c,132 :: 		void InitINT1(){
;usb_led.c,133 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;usb_led.c,134 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_led.c,135 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;usb_led.c,136 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;usb_led.c,138 :: 		void InitINT2(){
;usb_led.c,139 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;usb_led.c,140 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;usb_led.c,141 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;usb_led.c,142 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_interrupt:

;usb_led.c,148 :: 		void interrupt(){
;usb_led.c,150 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;usb_led.c,152 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;usb_led.c,153 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;usb_led.c,154 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;usb_led.c,155 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;usb_led.c,156 :: 		timer_sayac_0++;
	INFSNZ      _timer_sayac_0+0, 1 
	INCF        _timer_sayac_0+1, 1 
;usb_led.c,157 :: 		}
L_interrupt0:
;usb_led.c,158 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;usb_led.c,159 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;usb_led.c,160 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;usb_led.c,161 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;usb_led.c,163 :: 		}
L_interrupt1:
;usb_led.c,164 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;usb_led.c,165 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;usb_led.c,167 :: 		}
L_interrupt2:
;usb_led.c,168 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;usb_led.c,169 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;usb_led.c,170 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;usb_led.c,171 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;usb_led.c,173 :: 		}
L_interrupt3:
;usb_led.c,174 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;usb_led.c,175 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;usb_led.c,176 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;usb_led.c,177 :: 		}
L_interrupt4:
;usb_led.c,178 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;usb_led.c,179 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;usb_led.c,180 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;usb_led.c,181 :: 		}
L_interrupt5:
;usb_led.c,182 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;usb_led.c,184 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;usb_led.c,185 :: 		}
L_interrupt6:
;usb_led.c,189 :: 		}
L_end_interrupt:
L__interrupt40:
	RETFIE      1
; end of _interrupt

_main:

;usb_led.c,195 :: 		void main() {
;usb_led.c,197 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;usb_led.c,199 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;usb_led.c,201 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;usb_led.c,203 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;usb_led.c,205 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;usb_led.c,207 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;usb_led.c,209 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;usb_led.c,211 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;usb_led.c,213 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;usb_led.c,215 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;usb_led.c,220 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;usb_led.c,222 :: 		Lcd_Out(1,1,"SyncBox V.1.0 Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_usb_led+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_usb_led+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;usb_led.c,224 :: 		Delay_ms(1000);
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
;usb_led.c,226 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;usb_led.c,230 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;usb_led.c,233 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;usb_led.c,238 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;usb_led.c,239 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;usb_led.c,244 :: 		while(1){
L_main8:
;usb_led.c,248 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;usb_led.c,252 :: 		if(datacnt != 0 /*&& PORTB.F0 == 0 && PORTB.F1 == 0*/){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;usb_led.c,254 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main11:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;usb_led.c,256 :: 		writebuff[cnt]=readbuff[cnt];
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
;usb_led.c,254 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;usb_led.c,256 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main11
L_main12:
;usb_led.c,264 :: 		if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
	BTFSC       PORTC+0, 0 
	GOTO        L_main16
	BTFSC       PORTC+0, 1 
	GOTO        L_main16
	BTFSC       PORTC+0, 2 
	GOTO        L_main16
L__main27:
;usb_led.c,266 :: 		LATD.F0 = 1;
	BSF         LATD+0, 0 
;usb_led.c,269 :: 		}
L_main16:
;usb_led.c,271 :: 		if(writebuff[0] == '2' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
	BTFSC       PORTC+0, 0 
	GOTO        L_main19
	BTFSC       PORTC+0, 1 
	GOTO        L_main19
	BTFSC       PORTC+0, 2 
	GOTO        L_main19
L__main26:
;usb_led.c,273 :: 		LATD.F0 = 0;
	BCF         LATD+0, 0 
;usb_led.c,276 :: 		}
L_main19:
;usb_led.c,278 :: 		if(writebuff[0] == '3' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
	BTFSC       PORTC+0, 0 
	GOTO        L_main22
	BTFSC       PORTC+0, 1 
	GOTO        L_main22
	BTFSC       PORTC+0, 2 
	GOTO        L_main22
L__main25:
;usb_led.c,281 :: 		while(!HID_Write(&writebuff,datacnt));
L_main23:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVF        _datacnt+0, 0 
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
	GOTO        L_main23
L_main24:
;usb_led.c,284 :: 		}
L_main22:
;usb_led.c,292 :: 		}
L_main10:
;usb_led.c,294 :: 		}
	GOTO        L_main8
;usb_led.c,302 :: 		} // While Döngüsü Bitisi}
L_end_main:
	GOTO        $+0
; end of _main
