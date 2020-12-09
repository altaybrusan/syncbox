
_address1:

;syncbox_ilk_k�s�m.c,48 :: 		void address1(){
;syncbox_ilk_k�s�m.c,50 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox_ilk_k�s�m.c,51 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox_ilk_k�s�m.c,52 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_ilk_k�s�m.c,54 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;syncbox_ilk_k�s�m.c,56 :: 		void address2(){
;syncbox_ilk_k�s�m.c,58 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox_ilk_k�s�m.c,59 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox_ilk_k�s�m.c,60 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_ilk_k�s�m.c,62 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;syncbox_ilk_k�s�m.c,64 :: 		void address3(){
;syncbox_ilk_k�s�m.c,66 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox_ilk_k�s�m.c,67 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox_ilk_k�s�m.c,68 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_ilk_k�s�m.c,70 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;syncbox_ilk_k�s�m.c,72 :: 		void address4(){
;syncbox_ilk_k�s�m.c,74 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox_ilk_k�s�m.c,75 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox_ilk_k�s�m.c,76 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox_ilk_k�s�m.c,78 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_interrupt:

;syncbox_ilk_k�s�m.c,85 :: 		void interrupt(){
;syncbox_ilk_k�s�m.c,87 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;syncbox_ilk_k�s�m.c,89 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;syncbox_ilk_k�s�m.c,90 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;syncbox_ilk_k�s�m.c,91 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;syncbox_ilk_k�s�m.c,92 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;syncbox_ilk_k�s�m.c,93 :: 		timer_sayac_0++;
	INCF        _timer_sayac_0+0, 1 
;syncbox_ilk_k�s�m.c,94 :: 		}
L_interrupt0:
;syncbox_ilk_k�s�m.c,95 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;syncbox_ilk_k�s�m.c,96 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox_ilk_k�s�m.c,97 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox_ilk_k�s�m.c,98 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox_ilk_k�s�m.c,100 :: 		}
L_interrupt1:
;syncbox_ilk_k�s�m.c,101 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;syncbox_ilk_k�s�m.c,102 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;syncbox_ilk_k�s�m.c,104 :: 		}
L_interrupt2:
;syncbox_ilk_k�s�m.c,105 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;syncbox_ilk_k�s�m.c,106 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox_ilk_k�s�m.c,107 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox_ilk_k�s�m.c,108 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox_ilk_k�s�m.c,110 :: 		}
L_interrupt3:
;syncbox_ilk_k�s�m.c,111 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;syncbox_ilk_k�s�m.c,112 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;syncbox_ilk_k�s�m.c,113 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;syncbox_ilk_k�s�m.c,114 :: 		}
L_interrupt4:
;syncbox_ilk_k�s�m.c,115 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;syncbox_ilk_k�s�m.c,116 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;syncbox_ilk_k�s�m.c,117 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;syncbox_ilk_k�s�m.c,118 :: 		}
L_interrupt5:
;syncbox_ilk_k�s�m.c,119 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;syncbox_ilk_k�s�m.c,121 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;syncbox_ilk_k�s�m.c,122 :: 		}
L_interrupt6:
;syncbox_ilk_k�s�m.c,126 :: 		}
L_end_interrupt:
L__interrupt95:
	RETFIE      1
; end of _interrupt

_InitTimer0:

;syncbox_ilk_k�s�m.c,133 :: 		void InitTimer0(){
;syncbox_ilk_k�s�m.c,134 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;syncbox_ilk_k�s�m.c,135 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;syncbox_ilk_k�s�m.c,136 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;syncbox_ilk_k�s�m.c,137 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_ilk_k�s�m.c,138 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;syncbox_ilk_k�s�m.c,140 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;syncbox_ilk_k�s�m.c,142 :: 		void InitTimer1(){
;syncbox_ilk_k�s�m.c,143 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;syncbox_ilk_k�s�m.c,144 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox_ilk_k�s�m.c,145 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox_ilk_k�s�m.c,146 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox_ilk_k�s�m.c,147 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;syncbox_ilk_k�s�m.c,148 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox_ilk_k�s�m.c,149 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;syncbox_ilk_k�s�m.c,151 :: 		void InitTimer2(){
;syncbox_ilk_k�s�m.c,152 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;syncbox_ilk_k�s�m.c,153 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;syncbox_ilk_k�s�m.c,154 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;syncbox_ilk_k�s�m.c,155 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox_ilk_k�s�m.c,156 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;syncbox_ilk_k�s�m.c,158 :: 		void InitTimer3(){
;syncbox_ilk_k�s�m.c,159 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;syncbox_ilk_k�s�m.c,160 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox_ilk_k�s�m.c,161 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox_ilk_k�s�m.c,162 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox_ilk_k�s�m.c,163 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;syncbox_ilk_k�s�m.c,164 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox_ilk_k�s�m.c,165 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;syncbox_ilk_k�s�m.c,167 :: 		void InitINT0(){
;syncbox_ilk_k�s�m.c,168 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;syncbox_ilk_k�s�m.c,169 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_ilk_k�s�m.c,170 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;syncbox_ilk_k�s�m.c,171 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;syncbox_ilk_k�s�m.c,173 :: 		void InitINT1(){
;syncbox_ilk_k�s�m.c,174 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;syncbox_ilk_k�s�m.c,175 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_ilk_k�s�m.c,176 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;syncbox_ilk_k�s�m.c,177 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;syncbox_ilk_k�s�m.c,179 :: 		void InitINT2(){
;syncbox_ilk_k�s�m.c,180 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;syncbox_ilk_k�s�m.c,181 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox_ilk_k�s�m.c,182 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;syncbox_ilk_k�s�m.c,183 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_main:

;syncbox_ilk_k�s�m.c,190 :: 		void main() {
;syncbox_ilk_k�s�m.c,192 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;syncbox_ilk_k�s�m.c,194 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;syncbox_ilk_k�s�m.c,196 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;syncbox_ilk_k�s�m.c,198 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;syncbox_ilk_k�s�m.c,200 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;syncbox_ilk_k�s�m.c,202 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;syncbox_ilk_k�s�m.c,204 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;syncbox_ilk_k�s�m.c,209 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;syncbox_ilk_k�s�m.c,211 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_syncbox_ilk_k�s�m+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_syncbox_ilk_k�s�m+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;syncbox_ilk_k�s�m.c,213 :: 		Delay_ms(1000);
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
;syncbox_ilk_k�s�m.c,215 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,219 :: 		UART1_Init(9600);  // UART Portu Etkinle�tirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;syncbox_ilk_k�s�m.c,221 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,224 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinle�tirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;syncbox_ilk_k�s�m.c,228 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;syncbox_ilk_k�s�m.c,230 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;syncbox_ilk_k�s�m.c,231 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;syncbox_ilk_k�s�m.c,235 :: 		while(1){
L_main8:
;syncbox_ilk_k�s�m.c,237 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;syncbox_ilk_k�s�m.c,241 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main89:
;syncbox_ilk_k�s�m.c,243 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;syncbox_ilk_k�s�m.c,245 :: 		writebuff[cnt]=readbuff[cnt];
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
;syncbox_ilk_k�s�m.c,243 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox_ilk_k�s�m.c,245 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;syncbox_ilk_k�s�m.c,247 :: 		while(!HID_Write(&writebuff,datacnt));
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
;syncbox_ilk_k�s�m.c,259 :: 		UART1_Write_Text(&writebuff);
	MOVLW       _writebuff+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox_ilk_k�s�m.c,271 :: 		}
L_main12:
;syncbox_ilk_k�s�m.c,278 :: 		if(ready == 1){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
;syncbox_ilk_k�s�m.c,279 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;syncbox_ilk_k�s�m.c,280 :: 		ready = 0;
	CLRF        _ready+0 
;syncbox_ilk_k�s�m.c,281 :: 		}
L_main18:
;syncbox_ilk_k�s�m.c,283 :: 		if(xray_on == 1 && button_state_0 == 1){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
L__main88:
;syncbox_ilk_k�s�m.c,284 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,285 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,286 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,287 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;syncbox_ilk_k�s�m.c,288 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;syncbox_ilk_k�s�m.c,289 :: 		}
L_main21:
;syncbox_ilk_k�s�m.c,291 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
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
;syncbox_ilk_k�s�m.c,292 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,293 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,294 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox_ilk_k�s�m.c,295 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;syncbox_ilk_k�s�m.c,296 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;syncbox_ilk_k�s�m.c,297 :: 		}
L_main28:
;syncbox_ilk_k�s�m.c,305 :: 		if(timer_sayac_0 == 1 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
	BTFSC       PORTB+0, 0 
	GOTO        L_main31
	BTFSC       PORTB+0, 1 
	GOTO        L_main31
L__main84:
;syncbox_ilk_k�s�m.c,307 :: 		address1();
	CALL        _address1+0, 0
;syncbox_ilk_k�s�m.c,308 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
;syncbox_ilk_k�s�m.c,309 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;syncbox_ilk_k�s�m.c,310 :: 		Lcd_Chr(row,col,uart_rd1);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox_ilk_k�s�m.c,311 :: 		if(uart_rd1==17){
	MOVF        _uart_rd1+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main33
;syncbox_ilk_k�s�m.c,312 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,313 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,314 :: 		}
L_main33:
;syncbox_ilk_k�s�m.c,315 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox_ilk_k�s�m.c,316 :: 		}
L_main32:
;syncbox_ilk_k�s�m.c,317 :: 		if(col==17 && row==1){
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
;syncbox_ilk_k�s�m.c,318 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,319 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,320 :: 		}
L_main36:
;syncbox_ilk_k�s�m.c,321 :: 		if(row==2 && col==17){
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
;syncbox_ilk_k�s�m.c,322 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,323 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,324 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,325 :: 		}
L_main39:
;syncbox_ilk_k�s�m.c,326 :: 		}
L_main31:
;syncbox_ilk_k�s�m.c,328 :: 		if(timer_sayac_0 == 2 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
	BTFSC       PORTB+0, 0 
	GOTO        L_main42
	BTFSC       PORTB+0, 1 
	GOTO        L_main42
L__main81:
;syncbox_ilk_k�s�m.c,330 :: 		address2();
	CALL        _address2+0, 0
;syncbox_ilk_k�s�m.c,331 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
;syncbox_ilk_k�s�m.c,332 :: 		uart_rd2 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd2+0 
;syncbox_ilk_k�s�m.c,333 :: 		Lcd_Chr(row,col,uart_rd2);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox_ilk_k�s�m.c,334 :: 		if(uart_rd2 ==17){
	MOVF        _uart_rd2+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main44
;syncbox_ilk_k�s�m.c,335 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,336 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,337 :: 		}
L_main44:
;syncbox_ilk_k�s�m.c,338 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox_ilk_k�s�m.c,339 :: 		}
L_main43:
;syncbox_ilk_k�s�m.c,340 :: 		if(col==17 && row==1){
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
;syncbox_ilk_k�s�m.c,341 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,342 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,343 :: 		}
L_main47:
;syncbox_ilk_k�s�m.c,344 :: 		if(row==2 && col==17){
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
;syncbox_ilk_k�s�m.c,345 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,346 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,347 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,348 :: 		}
L_main50:
;syncbox_ilk_k�s�m.c,349 :: 		}
L_main42:
;syncbox_ilk_k�s�m.c,351 :: 		if(timer_sayac_0 == 3 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
	BTFSC       PORTB+0, 0 
	GOTO        L_main53
	BTFSC       PORTB+0, 1 
	GOTO        L_main53
L__main78:
;syncbox_ilk_k�s�m.c,353 :: 		address3();
	CALL        _address3+0, 0
;syncbox_ilk_k�s�m.c,354 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
;syncbox_ilk_k�s�m.c,355 :: 		uart_rd3 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd3+0 
;syncbox_ilk_k�s�m.c,356 :: 		Lcd_Chr(row,col,uart_rd3);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox_ilk_k�s�m.c,357 :: 		if(uart_rd3==17){
	MOVF        _uart_rd3+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
;syncbox_ilk_k�s�m.c,358 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,359 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,360 :: 		}
L_main55:
;syncbox_ilk_k�s�m.c,361 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox_ilk_k�s�m.c,362 :: 		}
L_main54:
;syncbox_ilk_k�s�m.c,363 :: 		if(col==17 && row==1){
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
;syncbox_ilk_k�s�m.c,364 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,365 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,366 :: 		}
L_main58:
;syncbox_ilk_k�s�m.c,367 :: 		if(row==2 && col==17){
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
;syncbox_ilk_k�s�m.c,368 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,369 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,370 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,371 :: 		}
L_main61:
;syncbox_ilk_k�s�m.c,372 :: 		}
L_main53:
;syncbox_ilk_k�s�m.c,374 :: 		if(timer_sayac_0 == 4 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
	BTFSC       PORTB+0, 0 
	GOTO        L_main64
	BTFSC       PORTB+0, 1 
	GOTO        L_main64
L__main75:
;syncbox_ilk_k�s�m.c,376 :: 		address4();
	CALL        _address4+0, 0
;syncbox_ilk_k�s�m.c,378 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main65
;syncbox_ilk_k�s�m.c,379 :: 		uart_rd4 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd4+0 
;syncbox_ilk_k�s�m.c,380 :: 		Lcd_Chr(row,col,uart_rd4);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox_ilk_k�s�m.c,381 :: 		if(uart_rd4==17){
	MOVF        _uart_rd4+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
;syncbox_ilk_k�s�m.c,382 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,383 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,384 :: 		}
L_main66:
;syncbox_ilk_k�s�m.c,385 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox_ilk_k�s�m.c,386 :: 		}
L_main65:
;syncbox_ilk_k�s�m.c,387 :: 		if(col==17 && row==1){
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
;syncbox_ilk_k�s�m.c,388 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,389 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,390 :: 		}
L_main69:
;syncbox_ilk_k�s�m.c,391 :: 		if(row==2 && col==17){
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
;syncbox_ilk_k�s�m.c,392 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox_ilk_k�s�m.c,393 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox_ilk_k�s�m.c,394 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox_ilk_k�s�m.c,395 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
;syncbox_ilk_k�s�m.c,396 :: 		}
L_main72:
;syncbox_ilk_k�s�m.c,397 :: 		}
L_main64:
;syncbox_ilk_k�s�m.c,406 :: 		} // While D�ng�s� Biti�i
	GOTO        L_main8
;syncbox_ilk_k�s�m.c,407 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
