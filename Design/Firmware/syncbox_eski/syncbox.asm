
_address1:

;syncbox.c,50 :: 		void address1(){
;syncbox.c,52 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox.c,53 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox.c,54 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox.c,56 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;syncbox.c,58 :: 		void address2(){
;syncbox.c,60 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox.c,61 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;syncbox.c,62 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox.c,64 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;syncbox.c,66 :: 		void address3(){
;syncbox.c,68 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;syncbox.c,69 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox.c,70 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox.c,72 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;syncbox.c,74 :: 		void address4(){
;syncbox.c,76 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;syncbox.c,77 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;syncbox.c,78 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;syncbox.c,80 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_interrupt:

;syncbox.c,87 :: 		void interrupt(){
;syncbox.c,89 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;syncbox.c,91 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;syncbox.c,92 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;syncbox.c,93 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;syncbox.c,94 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;syncbox.c,95 :: 		timer_sayac_0++;
	INCF        _timer_sayac_0+0, 1 
;syncbox.c,96 :: 		}
L_interrupt0:
;syncbox.c,97 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;syncbox.c,98 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox.c,99 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox.c,100 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox.c,102 :: 		}
L_interrupt1:
;syncbox.c,103 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;syncbox.c,104 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;syncbox.c,106 :: 		}
L_interrupt2:
;syncbox.c,107 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;syncbox.c,108 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox.c,109 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox.c,110 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox.c,112 :: 		}
L_interrupt3:
;syncbox.c,113 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;syncbox.c,114 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;syncbox.c,115 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;syncbox.c,116 :: 		}
L_interrupt4:
;syncbox.c,117 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;syncbox.c,118 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;syncbox.c,119 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;syncbox.c,120 :: 		}
L_interrupt5:
;syncbox.c,121 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;syncbox.c,123 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;syncbox.c,124 :: 		}
L_interrupt6:
;syncbox.c,128 :: 		}
L_end_interrupt:
L__interrupt132:
	RETFIE      1
; end of _interrupt

_InitTimer0:

;syncbox.c,135 :: 		void InitTimer0(){
;syncbox.c,136 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;syncbox.c,137 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;syncbox.c,138 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;syncbox.c,139 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox.c,140 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;syncbox.c,142 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;syncbox.c,144 :: 		void InitTimer1(){
;syncbox.c,145 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;syncbox.c,146 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;syncbox.c,147 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;syncbox.c,148 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;syncbox.c,149 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;syncbox.c,150 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox.c,151 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;syncbox.c,153 :: 		void InitTimer2(){
;syncbox.c,154 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;syncbox.c,155 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;syncbox.c,156 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;syncbox.c,157 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox.c,158 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;syncbox.c,160 :: 		void InitTimer3(){
;syncbox.c,161 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;syncbox.c,162 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;syncbox.c,163 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;syncbox.c,164 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;syncbox.c,165 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;syncbox.c,166 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;syncbox.c,167 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;syncbox.c,169 :: 		void InitINT0(){
;syncbox.c,170 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;syncbox.c,171 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox.c,172 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;syncbox.c,173 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;syncbox.c,175 :: 		void InitINT1(){
;syncbox.c,176 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;syncbox.c,177 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox.c,178 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;syncbox.c,179 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;syncbox.c,181 :: 		void InitINT2(){
;syncbox.c,182 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;syncbox.c,183 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;syncbox.c,184 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;syncbox.c,185 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_main:

;syncbox.c,192 :: 		void main() {
;syncbox.c,194 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;syncbox.c,196 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;syncbox.c,198 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;syncbox.c,200 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;syncbox.c,202 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;syncbox.c,204 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;syncbox.c,206 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;syncbox.c,211 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;syncbox.c,213 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_syncbox+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_syncbox+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;syncbox.c,215 :: 		Delay_ms(1000);
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
;syncbox.c,217 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,221 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;syncbox.c,224 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;syncbox.c,228 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;syncbox.c,229 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;syncbox.c,230 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;syncbox.c,234 :: 		while(1){
L_main8:
;syncbox.c,236 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;syncbox.c,240 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main126:
;syncbox.c,242 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;syncbox.c,244 :: 		writebuff[cnt]=readbuff[cnt];
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
;syncbox.c,242 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox.c,244 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;syncbox.c,246 :: 		while(!HID_Write(&writebuff,datacnt));
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
;syncbox.c,250 :: 		if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
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
L__main125:
;syncbox.c,252 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main21:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
;syncbox.c,254 :: 		sent_data_1[cnt-1]= readbuff[cnt];
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
;syncbox.c,252 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox.c,254 :: 		sent_data_1[cnt-1]= readbuff[cnt];
	GOTO        L_main21
L_main22:
;syncbox.c,256 :: 		UART1_Write_Text(&sent_data_1);
	MOVLW       _sent_data_1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox.c,260 :: 		}
L_main20:
;syncbox.c,262 :: 		if(writebuff[0] == '2' && PORTC.F0 == 1 && PORTC.F1 == 0 && PORTC.F2 == 0){
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
L__main124:
;syncbox.c,264 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main27:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
;syncbox.c,266 :: 		sent_data_2[cnt-1]= readbuff[cnt];
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
;syncbox.c,264 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox.c,266 :: 		sent_data_2[cnt-1]= readbuff[cnt];
	GOTO        L_main27
L_main28:
;syncbox.c,268 :: 		UART1_Write_Text(&sent_data_2);
	MOVLW       _sent_data_2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox.c,272 :: 		}
L_main26:
;syncbox.c,274 :: 		if(writebuff[0] == '3' && PORTC.F0 == 0 && PORTC.F1 == 1 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
	BTFSC       PORTC+0, 0 
	GOTO        L_main32
	BTFSS       PORTC+0, 1 
	GOTO        L_main32
	BTFSC       PORTC+0, 2 
	GOTO        L_main32
L__main123:
;syncbox.c,276 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main33:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;syncbox.c,278 :: 		sent_data_3[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _sent_data_3+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_sent_data_3+0)
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
;syncbox.c,276 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox.c,278 :: 		sent_data_3[cnt-1]= readbuff[cnt];
	GOTO        L_main33
L_main34:
;syncbox.c,280 :: 		UART1_Write_Text(&sent_data_3);
	MOVLW       _sent_data_3+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_3+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox.c,284 :: 		}
L_main32:
;syncbox.c,286 :: 		if(writebuff[0] == '4' && PORTC.F0 == 1 && PORTC.F1 == 1 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
	BTFSS       PORTC+0, 0 
	GOTO        L_main38
	BTFSS       PORTC+0, 1 
	GOTO        L_main38
	BTFSC       PORTC+0, 2 
	GOTO        L_main38
L__main122:
;syncbox.c,288 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main39:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main40
;syncbox.c,290 :: 		sent_data_4[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _sent_data_4+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_sent_data_4+0)
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
;syncbox.c,288 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;syncbox.c,290 :: 		sent_data_4[cnt-1]= readbuff[cnt];
	GOTO        L_main39
L_main40:
;syncbox.c,292 :: 		UART1_Write_Text(&sent_data_4);
	MOVLW       _sent_data_4+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_4+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;syncbox.c,296 :: 		}
L_main38:
;syncbox.c,298 :: 		if(writebuff[0] == '5' && writebuff[1] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_main44
	MOVF        1345, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main44
	BTFSC       PORTC+0, 0 
	GOTO        L_main44
	BTFSC       PORTC+0, 1 
	GOTO        L_main44
	BTFSC       PORTC+0, 2 
	GOTO        L_main44
L__main121:
;syncbox.c,304 :: 		for(cnt=0;cnt<writebuff[2];cnt++){
	CLRF        _cnt+0 
L_main45:
	MOVF        1346, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main46
;syncbox.c,306 :: 		UART_Write_Text(&writebuff[2]);
	MOVLW       _writebuff+2
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+2)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;syncbox.c,308 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,309 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,310 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,312 :: 		Delay_Ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main48:
	DECFSZ      R13, 1, 1
	BRA         L_main48
	DECFSZ      R12, 1, 1
	BRA         L_main48
	DECFSZ      R11, 1, 1
	BRA         L_main48
	NOP
	NOP
;syncbox.c,314 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,315 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,316 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,318 :: 		Delay_Ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
	DECFSZ      R11, 1, 1
	BRA         L_main49
	NOP
	NOP
;syncbox.c,304 :: 		for(cnt=0;cnt<writebuff[2];cnt++){
	INCF        _cnt+0, 1 
;syncbox.c,320 :: 		}
	GOTO        L_main45
L_main46:
;syncbox.c,324 :: 		}
L_main44:
;syncbox.c,327 :: 		}
L_main12:
;syncbox.c,334 :: 		if(ready == 1){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main50
;syncbox.c,335 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;syncbox.c,337 :: 		ready = 0;
	CLRF        _ready+0 
;syncbox.c,338 :: 		}
L_main50:
;syncbox.c,340 :: 		if(xray_on == 1 && button_state_0 == 1){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
L__main120:
;syncbox.c,341 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,342 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,343 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,344 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;syncbox.c,345 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;syncbox.c,346 :: 		}
L_main53:
;syncbox.c,348 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L__main119
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main119
	GOTO        L__main117
L__main119:
	BTFSC       PORTB+0, 1 
	GOTO        L__main118
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main118
	GOTO        L__main117
L__main118:
	GOTO        L_main60
L__main117:
;syncbox.c,349 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,350 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,351 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;syncbox.c,352 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;syncbox.c,353 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;syncbox.c,354 :: 		}
L_main60:
;syncbox.c,362 :: 		if(timer_sayac_0 == 1 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
	BTFSC       PORTB+0, 0 
	GOTO        L_main63
	BTFSC       PORTB+0, 1 
	GOTO        L_main63
L__main116:
;syncbox.c,364 :: 		address1();
	CALL        _address1+0, 0
;syncbox.c,365 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main64
;syncbox.c,366 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;syncbox.c,367 :: 		Lcd_Chr(row,col,uart_rd1);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox.c,368 :: 		if(uart_rd1==17){
	MOVF        _uart_rd1+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main65
;syncbox.c,369 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,370 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,371 :: 		}
L_main65:
;syncbox.c,372 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox.c,373 :: 		}
L_main64:
;syncbox.c,374 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main141
	MOVLW       17
	XORWF       _col+0, 0 
L__main141:
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVLW       1
	XORWF       _row+0, 0 
L__main142:
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
L__main115:
;syncbox.c,375 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,376 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,377 :: 		}
L_main68:
;syncbox.c,378 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVLW       2
	XORWF       _row+0, 0 
L__main143:
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main144
	MOVLW       17
	XORWF       _col+0, 0 
L__main144:
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
L__main114:
;syncbox.c,379 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,380 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,381 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,382 :: 		}
L_main71:
;syncbox.c,383 :: 		}
L_main63:
;syncbox.c,385 :: 		if(timer_sayac_0 == 2 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
	BTFSC       PORTB+0, 0 
	GOTO        L_main74
	BTFSC       PORTB+0, 1 
	GOTO        L_main74
L__main113:
;syncbox.c,387 :: 		address2();
	CALL        _address2+0, 0
;syncbox.c,388 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main75
;syncbox.c,389 :: 		uart_rd2 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd2+0 
;syncbox.c,390 :: 		Lcd_Chr(row,col,uart_rd2);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox.c,391 :: 		if(uart_rd2 ==17){
	MOVF        _uart_rd2+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main76
;syncbox.c,392 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,393 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,394 :: 		}
L_main76:
;syncbox.c,395 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox.c,396 :: 		}
L_main75:
;syncbox.c,397 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main145
	MOVLW       17
	XORWF       _col+0, 0 
L__main145:
	BTFSS       STATUS+0, 2 
	GOTO        L_main79
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main146
	MOVLW       1
	XORWF       _row+0, 0 
L__main146:
	BTFSS       STATUS+0, 2 
	GOTO        L_main79
L__main112:
;syncbox.c,398 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,399 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,400 :: 		}
L_main79:
;syncbox.c,401 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVLW       2
	XORWF       _row+0, 0 
L__main147:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main148
	MOVLW       17
	XORWF       _col+0, 0 
L__main148:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
L__main111:
;syncbox.c,402 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,403 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,404 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,405 :: 		}
L_main82:
;syncbox.c,406 :: 		}
L_main74:
;syncbox.c,408 :: 		if(timer_sayac_0 == 3 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
	BTFSC       PORTB+0, 0 
	GOTO        L_main85
	BTFSC       PORTB+0, 1 
	GOTO        L_main85
L__main110:
;syncbox.c,410 :: 		address3();
	CALL        _address3+0, 0
;syncbox.c,411 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main86
;syncbox.c,412 :: 		uart_rd3 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd3+0 
;syncbox.c,413 :: 		Lcd_Chr(row,col,uart_rd3);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox.c,414 :: 		if(uart_rd3==17){
	MOVF        _uart_rd3+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main87
;syncbox.c,415 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,416 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,417 :: 		}
L_main87:
;syncbox.c,418 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox.c,419 :: 		}
L_main86:
;syncbox.c,420 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main149
	MOVLW       17
	XORWF       _col+0, 0 
L__main149:
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main150
	MOVLW       1
	XORWF       _row+0, 0 
L__main150:
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
L__main109:
;syncbox.c,421 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,422 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,423 :: 		}
L_main90:
;syncbox.c,424 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main151
	MOVLW       2
	XORWF       _row+0, 0 
L__main151:
	BTFSS       STATUS+0, 2 
	GOTO        L_main93
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main152
	MOVLW       17
	XORWF       _col+0, 0 
L__main152:
	BTFSS       STATUS+0, 2 
	GOTO        L_main93
L__main108:
;syncbox.c,425 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,426 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,427 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,428 :: 		}
L_main93:
;syncbox.c,429 :: 		}
L_main85:
;syncbox.c,431 :: 		if(timer_sayac_0 == 4 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main96
	BTFSC       PORTB+0, 0 
	GOTO        L_main96
	BTFSC       PORTB+0, 1 
	GOTO        L_main96
L__main107:
;syncbox.c,433 :: 		address1();
	CALL        _address1+0, 0
;syncbox.c,435 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main97
;syncbox.c,436 :: 		uart_rd4 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd4+0 
;syncbox.c,437 :: 		Lcd_Chr(row,col,uart_rd4);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;syncbox.c,438 :: 		if(uart_rd4==17){
	MOVF        _uart_rd4+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main98
;syncbox.c,439 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,440 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,441 :: 		}
L_main98:
;syncbox.c,442 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;syncbox.c,443 :: 		}
L_main97:
;syncbox.c,444 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main153
	MOVLW       17
	XORWF       _col+0, 0 
L__main153:
	BTFSS       STATUS+0, 2 
	GOTO        L_main101
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main154
	MOVLW       1
	XORWF       _row+0, 0 
L__main154:
	BTFSS       STATUS+0, 2 
	GOTO        L_main101
L__main106:
;syncbox.c,445 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,446 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,447 :: 		}
L_main101:
;syncbox.c,448 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main155
	MOVLW       2
	XORWF       _row+0, 0 
L__main155:
	BTFSS       STATUS+0, 2 
	GOTO        L_main104
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main156
	MOVLW       17
	XORWF       _col+0, 0 
L__main156:
	BTFSS       STATUS+0, 2 
	GOTO        L_main104
L__main105:
;syncbox.c,449 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;syncbox.c,450 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;syncbox.c,451 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;syncbox.c,452 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
;syncbox.c,453 :: 		}
L_main104:
;syncbox.c,454 :: 		}
L_main96:
;syncbox.c,459 :: 		} // While Döngüsü Bitiþi
	GOTO        L_main8
;syncbox.c,460 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
