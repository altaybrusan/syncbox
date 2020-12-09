
_address1:

;syncbox1.c,53 :: 		void address1(){
;syncbox1.c,55 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox1.c,56 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox1.c,57 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox1.c,59 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;syncbox1.c,61 :: 		void address2(){
;syncbox1.c,63 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox1.c,64 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox1.c,65 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox1.c,67 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;syncbox1.c,69 :: 		void address3(){
;syncbox1.c,71 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox1.c,72 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox1.c,73 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox1.c,75 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;syncbox1.c,77 :: 		void address4(){
;syncbox1.c,79 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox1.c,80 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox1.c,81 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox1.c,83 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_interrupt:

;syncbox1.c,90 :: 		void interrupt(){
;syncbox1.c,92 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;syncbox1.c,94 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;syncbox1.c,95 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;syncbox1.c,96 :: 		TMR0H	 = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;syncbox1.c,97 :: 		TMR0L	 = 0xDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;syncbox1.c,98 :: 		timer_sayac_0++;
	INCF        _timer_sayac_0+0, 1 
;syncbox1.c,99 :: 		}
L_interrupt0:
;syncbox1.c,100 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;syncbox1.c,101 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox1.c,102 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox1.c,103 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox1.c,105 :: 		}
L_interrupt1:
;syncbox1.c,106 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;syncbox1.c,107 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;syncbox1.c,109 :: 		}
L_interrupt2:
;syncbox1.c,110 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;syncbox1.c,111 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox1.c,112 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox1.c,113 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox1.c,115 :: 		}
L_interrupt3:
;syncbox1.c,116 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;syncbox1.c,117 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;syncbox1.c,118 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;syncbox1.c,119 :: 		}
L_interrupt4:
;syncbox1.c,120 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;syncbox1.c,121 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;syncbox1.c,122 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;syncbox1.c,123 :: 		}
L_interrupt5:
;syncbox1.c,124 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;syncbox1.c,126 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;syncbox1.c,127 :: 		}
L_interrupt6:
;syncbox1.c,131 :: 		}
L_end_interrupt:
L__interrupt90:
	RETFIE      1
; end of _interrupt

_InitTimer0:

;syncbox1.c,138 :: 		void InitTimer0(){
;syncbox1.c,139 :: 		T0CON	 = 0x83;
	MOVLW       131
	MOVWF       T0CON+0 
;syncbox1.c,140 :: 		TMR0H	 = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;syncbox1.c,141 :: 		TMR0L	 = 0xDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;syncbox1.c,142 :: 		GIE_bit     = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox1.c,143 :: 		TMR0IE_bit  = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;syncbox1.c,145 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;syncbox1.c,147 :: 		void InitTimer1(){
;syncbox1.c,148 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;syncbox1.c,149 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox1.c,150 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox1.c,151 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox1.c,152 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;syncbox1.c,153 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox1.c,154 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;syncbox1.c,156 :: 		void InitTimer2(){
;syncbox1.c,157 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;syncbox1.c,158 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;syncbox1.c,159 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;syncbox1.c,160 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox1.c,161 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;syncbox1.c,163 :: 		void InitTimer3(){
;syncbox1.c,164 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;syncbox1.c,165 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox1.c,166 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox1.c,167 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox1.c,168 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;syncbox1.c,169 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox1.c,170 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;syncbox1.c,172 :: 		void InitINT0(){
;syncbox1.c,173 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;syncbox1.c,174 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox1.c,175 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;syncbox1.c,176 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;syncbox1.c,178 :: 		void InitINT1(){
;syncbox1.c,179 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;syncbox1.c,180 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox1.c,181 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;syncbox1.c,182 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;syncbox1.c,184 :: 		void InitINT2(){
;syncbox1.c,185 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;syncbox1.c,186 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox1.c,187 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;syncbox1.c,188 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_main:

;syncbox1.c,195 :: 		void main() {
;syncbox1.c,197 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;syncbox1.c,199 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;syncbox1.c,201 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;syncbox1.c,203 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;syncbox1.c,205 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;syncbox1.c,207 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;syncbox1.c,209 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;syncbox1.c,211 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;syncbox1.c,213 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;syncbox1.c,215 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;syncbox1.c,220 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;syncbox1.c,222 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_syncbox1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_syncbox1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;syncbox1.c,224 :: 		Delay_ms(1000);
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
;syncbox1.c,226 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox1.c,230 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;syncbox1.c,233 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;syncbox1.c,237 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;syncbox1.c,238 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;syncbox1.c,239 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;syncbox1.c,243 :: 		while(1){
L_main8:
;syncbox1.c,245 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;syncbox1.c,249 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main84:
;syncbox1.c,251 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;syncbox1.c,253 :: 		writebuff[cnt]=readbuff[cnt];
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
;syncbox1.c,251 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox1.c,253 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;syncbox1.c,255 :: 		while(!HID_Write(&writebuff,datacnt));
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
;syncbox1.c,259 :: 		if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
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
L__main83:
;syncbox1.c,261 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main21:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
;syncbox1.c,263 :: 		sent_data_1[cnt-1]= readbuff[cnt];
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
;syncbox1.c,261 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox1.c,263 :: 		sent_data_1[cnt-1]= readbuff[cnt];
	GOTO        L_main21
L_main22:
;syncbox1.c,265 :: 		UART1_Write_Text(&sent_data_1);
	MOVLW       _sent_data_1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox1.c,277 :: 		}
L_main20:
;syncbox1.c,279 :: 		if(writebuff[0] == '2' && PORTC.F0 == 1 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
	BTFSS       PORTC+0, 0 
	GOTO        L_main26
	BTFSC       PORTC+0, 1 
	GOTO        L_main26
	BTFSC       PORTC+0, 2 
	GOTO        L_main26
L__main82:
;syncbox1.c,281 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main27:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
;syncbox1.c,283 :: 		sent_data_2[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _sent_data_2+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_sent_data_2+0)
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
;syncbox1.c,281 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox1.c,283 :: 		sent_data_2[cnt-1]= readbuff[cnt];
	GOTO        L_main27
L_main28:
;syncbox1.c,285 :: 		UART1_Write_Text(&sent_data_2);
	MOVLW       _sent_data_2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox1.c,289 :: 		}
L_main26:
;syncbox1.c,315 :: 		if(writebuff[0] == '5' && writebuff[1] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
	MOVF        1345, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
	BTFSC       PORTC+0, 0 
	GOTO        L_main32
	BTFSC       PORTC+0, 1 
	GOTO        L_main32
	BTFSC       PORTC+0, 2 
	GOTO        L_main32
L__main81:
;syncbox1.c,322 :: 		for(cnt=0;cnt<3;cnt++){
	CLRF        _cnt+0 
L_main33:
	MOVLW       3
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;syncbox1.c,326 :: 		Delay_Ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 1
	BRA         L_main36
	DECFSZ      R12, 1, 1
	BRA         L_main36
	NOP
	NOP
;syncbox1.c,328 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,329 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,330 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,332 :: 		Delay_Ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	NOP
	NOP
;syncbox1.c,334 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,335 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,336 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,322 :: 		for(cnt=0;cnt<3;cnt++){
	INCF        _cnt+0, 1 
;syncbox1.c,344 :: 		}
	GOTO        L_main33
L_main34:
;syncbox1.c,347 :: 		}
L_main32:
;syncbox1.c,349 :: 		}
L_main12:
;syncbox1.c,356 :: 		if(ready == 1){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
;syncbox1.c,357 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;syncbox1.c,359 :: 		ready = 0;
	CLRF        _ready+0 
;syncbox1.c,360 :: 		}
L_main38:
;syncbox1.c,362 :: 		if(xray_on == 1 && button_state_0 == 1){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
L__main80:
;syncbox1.c,363 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,364 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,365 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,366 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;syncbox1.c,367 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;syncbox1.c,368 :: 		}
L_main41:
;syncbox1.c,370 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L__main79
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main79
	GOTO        L__main77
L__main79:
	BTFSC       PORTB+0, 1 
	GOTO        L__main78
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main78
	GOTO        L__main77
L__main78:
	GOTO        L_main48
L__main77:
;syncbox1.c,371 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,372 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,373 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox1.c,374 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;syncbox1.c,375 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;syncbox1.c,376 :: 		}
L_main48:
;syncbox1.c,384 :: 		if(timer_sayac_0 == 1 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main51
	BTFSC       PORTB+0, 0 
	GOTO        L_main51
	BTFSC       PORTB+0, 1 
	GOTO        L_main51
L__main76:
;syncbox1.c,387 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox1.c,388 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox1.c,389 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox1.c,390 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main52
;syncbox1.c,391 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;syncbox1.c,393 :: 		Lcd_Chr(row,col,uart_rd1);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox1.c,395 :: 		if(uart_rd1==17){
	MOVF        _uart_rd1+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
;syncbox1.c,396 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox1.c,397 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox1.c,398 :: 		}
L_main53:
;syncbox1.c,399 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox1.c,400 :: 		}
L_main52:
;syncbox1.c,401 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main99
	MOVLW       17
	XORWF       _col+0, 0 
L__main99:
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main100
	MOVLW       1
	XORWF       _row+0, 0 
L__main100:
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
L__main75:
;syncbox1.c,402 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox1.c,403 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox1.c,404 :: 		}
L_main56:
;syncbox1.c,405 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main101
	MOVLW       2
	XORWF       _row+0, 0 
L__main101:
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main102
	MOVLW       17
	XORWF       _col+0, 0 
L__main102:
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
L__main74:
;syncbox1.c,406 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox1.c,407 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox1.c,408 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox1.c,409 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
;syncbox1.c,410 :: 		}
L_main59:
;syncbox1.c,411 :: 		}
L_main51:
;syncbox1.c,413 :: 		if(timer_sayac_0 == 2 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main62
	BTFSC       PORTB+0, 0 
	GOTO        L_main62
	BTFSC       PORTB+0, 1 
	GOTO        L_main62
L__main73:
;syncbox1.c,416 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox1.c,417 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox1.c,418 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox1.c,419 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
;syncbox1.c,420 :: 		uart_rd2 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd2+0 
;syncbox1.c,421 :: 		Lcd_Chr(row,col,uart_rd2);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox1.c,422 :: 		if(uart_rd2 ==17){
	MOVF        _uart_rd2+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
;syncbox1.c,423 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox1.c,424 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox1.c,425 :: 		}
L_main64:
;syncbox1.c,426 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox1.c,427 :: 		}
L_main63:
;syncbox1.c,428 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main103
	MOVLW       17
	XORWF       _col+0, 0 
L__main103:
	BTFSS       STATUS+0, 2 
	GOTO        L_main67
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main104
	MOVLW       1
	XORWF       _row+0, 0 
L__main104:
	BTFSS       STATUS+0, 2 
	GOTO        L_main67
L__main72:
;syncbox1.c,429 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox1.c,430 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox1.c,431 :: 		}
L_main67:
;syncbox1.c,432 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main105
	MOVLW       2
	XORWF       _row+0, 0 
L__main105:
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main106
	MOVLW       17
	XORWF       _col+0, 0 
L__main106:
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
L__main71:
;syncbox1.c,433 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox1.c,434 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox1.c,435 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox1.c,436 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
;syncbox1.c,437 :: 		}
L_main70:
;syncbox1.c,438 :: 		}
L_main62:
;syncbox1.c,492 :: 		} // While Döngüsü Bitiþi
	GOTO        L_main8
;syncbox1.c,493 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
