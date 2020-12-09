
_address1:

;data_okuma.c,50 :: 		void address1(){
;data_okuma.c,52 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;data_okuma.c,53 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;data_okuma.c,54 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;data_okuma.c,56 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;data_okuma.c,58 :: 		void address2(){
;data_okuma.c,60 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;data_okuma.c,61 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;data_okuma.c,62 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;data_okuma.c,64 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;data_okuma.c,66 :: 		void address3(){
;data_okuma.c,68 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;data_okuma.c,69 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;data_okuma.c,70 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;data_okuma.c,72 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;data_okuma.c,74 :: 		void address4(){
;data_okuma.c,76 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;data_okuma.c,77 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;data_okuma.c,78 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;data_okuma.c,80 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_interrupt:

;data_okuma.c,87 :: 		void interrupt(){
;data_okuma.c,89 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;data_okuma.c,91 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;data_okuma.c,92 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;data_okuma.c,93 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;data_okuma.c,94 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;data_okuma.c,95 :: 		timer_sayac_0++;
	INCF        _timer_sayac_0+0, 1 
;data_okuma.c,96 :: 		}
L_interrupt0:
;data_okuma.c,97 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;data_okuma.c,98 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;data_okuma.c,99 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;data_okuma.c,100 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;data_okuma.c,102 :: 		}
L_interrupt1:
;data_okuma.c,103 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;data_okuma.c,104 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;data_okuma.c,106 :: 		}
L_interrupt2:
;data_okuma.c,107 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;data_okuma.c,108 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;data_okuma.c,109 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;data_okuma.c,110 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;data_okuma.c,112 :: 		}
L_interrupt3:
;data_okuma.c,113 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;data_okuma.c,114 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;data_okuma.c,115 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;data_okuma.c,116 :: 		}
L_interrupt4:
;data_okuma.c,117 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;data_okuma.c,118 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;data_okuma.c,119 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;data_okuma.c,120 :: 		}
L_interrupt5:
;data_okuma.c,121 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;data_okuma.c,123 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;data_okuma.c,124 :: 		}
L_interrupt6:
;data_okuma.c,128 :: 		}
L_end_interrupt:
L__interrupt123:
	RETFIE      1
; end of _interrupt

_InitTimer0:

;data_okuma.c,135 :: 		void InitTimer0(){
;data_okuma.c,136 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;data_okuma.c,137 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;data_okuma.c,138 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;data_okuma.c,139 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;data_okuma.c,140 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;data_okuma.c,142 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;data_okuma.c,144 :: 		void InitTimer1(){
;data_okuma.c,145 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;data_okuma.c,146 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;data_okuma.c,147 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;data_okuma.c,148 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;data_okuma.c,149 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;data_okuma.c,150 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;data_okuma.c,151 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;data_okuma.c,153 :: 		void InitTimer2(){
;data_okuma.c,154 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;data_okuma.c,155 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;data_okuma.c,156 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;data_okuma.c,157 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;data_okuma.c,158 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;data_okuma.c,160 :: 		void InitTimer3(){
;data_okuma.c,161 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;data_okuma.c,162 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;data_okuma.c,163 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;data_okuma.c,164 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;data_okuma.c,165 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;data_okuma.c,166 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;data_okuma.c,167 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;data_okuma.c,169 :: 		void InitINT0(){
;data_okuma.c,170 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;data_okuma.c,171 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;data_okuma.c,172 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;data_okuma.c,173 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;data_okuma.c,175 :: 		void InitINT1(){
;data_okuma.c,176 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;data_okuma.c,177 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;data_okuma.c,178 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;data_okuma.c,179 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;data_okuma.c,181 :: 		void InitINT2(){
;data_okuma.c,182 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;data_okuma.c,183 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;data_okuma.c,184 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;data_okuma.c,185 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_main:

;data_okuma.c,192 :: 		void main() {
;data_okuma.c,194 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;data_okuma.c,196 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;data_okuma.c,198 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;data_okuma.c,200 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;data_okuma.c,202 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;data_okuma.c,204 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;data_okuma.c,206 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;data_okuma.c,211 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;data_okuma.c,213 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_data_okuma+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_data_okuma+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;data_okuma.c,215 :: 		Delay_ms(1000);
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
;data_okuma.c,217 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,221 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;data_okuma.c,224 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;data_okuma.c,228 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;data_okuma.c,229 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;data_okuma.c,230 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;data_okuma.c,234 :: 		while(1){
L_main8:
;data_okuma.c,236 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;data_okuma.c,240 :: 		if(datacnt != 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	BTFSC       PORTB+0, 1 
	GOTO        L_main12
L__main117:
;data_okuma.c,242 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main13:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;data_okuma.c,244 :: 		writebuff[cnt]=readbuff[cnt];
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
;data_okuma.c,242 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;data_okuma.c,244 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main13
L_main14:
;data_okuma.c,246 :: 		while(!HID_Write(&writebuff,datacnt));
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
;data_okuma.c,248 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,252 :: 		if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
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
L__main116:
;data_okuma.c,254 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main21:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
;data_okuma.c,256 :: 		deneme1[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _deneme1+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_deneme1+0)
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
;data_okuma.c,254 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;data_okuma.c,256 :: 		deneme1[cnt-1]= readbuff[cnt];
	GOTO        L_main21
L_main22:
;data_okuma.c,258 :: 		UART1_Write_Text(&deneme1);
	MOVLW       _deneme1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_deneme1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;data_okuma.c,262 :: 		}
L_main20:
;data_okuma.c,264 :: 		if(writebuff[0] == '2' && PORTC.F0 == 1 && PORTC.F1 == 0 && PORTC.F2 == 0){
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
L__main115:
;data_okuma.c,266 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main27:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
;data_okuma.c,268 :: 		deneme2[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _deneme2+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_deneme2+0)
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
;data_okuma.c,266 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;data_okuma.c,268 :: 		deneme2[cnt-1]= readbuff[cnt];
	GOTO        L_main27
L_main28:
;data_okuma.c,270 :: 		UART1_Write_Text(&deneme2);
	MOVLW       _deneme2+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_deneme2+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;data_okuma.c,274 :: 		}
L_main26:
;data_okuma.c,276 :: 		if(writebuff[0] == '3' && PORTC.F0 == 0 && PORTC.F1 == 1 && PORTC.F2 == 0){
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
L__main114:
;data_okuma.c,278 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main33:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;data_okuma.c,280 :: 		deneme3[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _deneme3+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_deneme3+0)
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
;data_okuma.c,278 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;data_okuma.c,280 :: 		deneme3[cnt-1]= readbuff[cnt];
	GOTO        L_main33
L_main34:
;data_okuma.c,282 :: 		UART1_Write_Text(&deneme3);
	MOVLW       _deneme3+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_deneme3+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;data_okuma.c,286 :: 		}
L_main32:
;data_okuma.c,288 :: 		if(writebuff[0] == '4' && PORTC.F0 == 1 && PORTC.F1 == 1 && PORTC.F2 == 0){
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
L__main113:
;data_okuma.c,290 :: 		for(cnt=1;cnt<datacnt;cnt++)
	MOVLW       1
	MOVWF       _cnt+0 
L_main39:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main40
;data_okuma.c,292 :: 		deneme4[cnt-1]= readbuff[cnt];
	DECF        _cnt+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _deneme4+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_deneme4+0)
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
;data_okuma.c,290 :: 		for(cnt=1;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;data_okuma.c,292 :: 		deneme4[cnt-1]= readbuff[cnt];
	GOTO        L_main39
L_main40:
;data_okuma.c,294 :: 		UART1_Write_Text(&deneme4);
	MOVLW       _deneme4+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_deneme4+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;data_okuma.c,298 :: 		}
L_main38:
;data_okuma.c,309 :: 		if(ready == 1){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
;data_okuma.c,310 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;data_okuma.c,311 :: 		ready = 0;
	CLRF        _ready+0 
;data_okuma.c,312 :: 		}
L_main42:
;data_okuma.c,314 :: 		if(xray_on == 1 && button_state_0 == 1){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main45
L__main112:
;data_okuma.c,315 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;data_okuma.c,316 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;data_okuma.c,317 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;data_okuma.c,318 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;data_okuma.c,319 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;data_okuma.c,320 :: 		}
L_main45:
;data_okuma.c,322 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L__main111
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main111
	GOTO        L__main109
L__main111:
	BTFSC       PORTB+0, 1 
	GOTO        L__main110
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main110
	GOTO        L__main109
L__main110:
	GOTO        L_main52
L__main109:
;data_okuma.c,323 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;data_okuma.c,324 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;data_okuma.c,325 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;data_okuma.c,326 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;data_okuma.c,327 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;data_okuma.c,328 :: 		}
L_main52:
;data_okuma.c,336 :: 		if(timer_sayac_0 == 1 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
	BTFSC       PORTB+0, 0 
	GOTO        L_main55
	BTFSC       PORTB+0, 1 
	GOTO        L_main55
L__main108:
;data_okuma.c,338 :: 		address1();
	CALL        _address1+0, 0
;data_okuma.c,339 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main56
;data_okuma.c,340 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;data_okuma.c,341 :: 		Lcd_Chr(row,col,uart_rd1);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;data_okuma.c,342 :: 		if(uart_rd1==17){
	MOVF        _uart_rd1+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main57
;data_okuma.c,343 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,344 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,345 :: 		}
L_main57:
;data_okuma.c,346 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;data_okuma.c,347 :: 		}
L_main56:
;data_okuma.c,348 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVLW       17
	XORWF       _col+0, 0 
L__main132:
	BTFSS       STATUS+0, 2 
	GOTO        L_main60
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVLW       1
	XORWF       _row+0, 0 
L__main133:
	BTFSS       STATUS+0, 2 
	GOTO        L_main60
L__main107:
;data_okuma.c,349 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,350 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,351 :: 		}
L_main60:
;data_okuma.c,352 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVLW       2
	XORWF       _row+0, 0 
L__main134:
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main135
	MOVLW       17
	XORWF       _col+0, 0 
L__main135:
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
L__main106:
;data_okuma.c,353 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,354 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,355 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,356 :: 		}
L_main63:
;data_okuma.c,357 :: 		}
L_main55:
;data_okuma.c,359 :: 		if(timer_sayac_0 == 2 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
	BTFSC       PORTB+0, 0 
	GOTO        L_main66
	BTFSC       PORTB+0, 1 
	GOTO        L_main66
L__main105:
;data_okuma.c,361 :: 		address2();
	CALL        _address2+0, 0
;data_okuma.c,362 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main67
;data_okuma.c,363 :: 		uart_rd2 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd2+0 
;data_okuma.c,364 :: 		Lcd_Chr(row,col,uart_rd2);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;data_okuma.c,365 :: 		if(uart_rd2 ==17){
	MOVF        _uart_rd2+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
;data_okuma.c,366 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,367 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,368 :: 		}
L_main68:
;data_okuma.c,369 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;data_okuma.c,370 :: 		}
L_main67:
;data_okuma.c,371 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main136
	MOVLW       17
	XORWF       _col+0, 0 
L__main136:
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main137
	MOVLW       1
	XORWF       _row+0, 0 
L__main137:
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
L__main104:
;data_okuma.c,372 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,373 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,374 :: 		}
L_main71:
;data_okuma.c,375 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main138
	MOVLW       2
	XORWF       _row+0, 0 
L__main138:
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main139
	MOVLW       17
	XORWF       _col+0, 0 
L__main139:
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
L__main103:
;data_okuma.c,376 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,377 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,378 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,379 :: 		}
L_main74:
;data_okuma.c,380 :: 		}
L_main66:
;data_okuma.c,382 :: 		if(timer_sayac_0 == 3 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main77
	BTFSC       PORTB+0, 0 
	GOTO        L_main77
	BTFSC       PORTB+0, 1 
	GOTO        L_main77
L__main102:
;data_okuma.c,384 :: 		address3();
	CALL        _address3+0, 0
;data_okuma.c,385 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main78
;data_okuma.c,386 :: 		uart_rd3 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd3+0 
;data_okuma.c,387 :: 		Lcd_Chr(row,col,uart_rd3);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;data_okuma.c,388 :: 		if(uart_rd3==17){
	MOVF        _uart_rd3+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main79
;data_okuma.c,389 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,390 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,391 :: 		}
L_main79:
;data_okuma.c,392 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;data_okuma.c,393 :: 		}
L_main78:
;data_okuma.c,394 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main140
	MOVLW       17
	XORWF       _col+0, 0 
L__main140:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main141
	MOVLW       1
	XORWF       _row+0, 0 
L__main141:
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
L__main101:
;data_okuma.c,395 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,396 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,397 :: 		}
L_main82:
;data_okuma.c,398 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVLW       2
	XORWF       _row+0, 0 
L__main142:
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVLW       17
	XORWF       _col+0, 0 
L__main143:
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
L__main100:
;data_okuma.c,399 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,400 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,401 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,402 :: 		}
L_main85:
;data_okuma.c,403 :: 		}
L_main77:
;data_okuma.c,405 :: 		if(timer_sayac_0 == 4 && PORTB.F0 == 0 && PORTB.F1 == 0){
	MOVF        _timer_sayac_0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main88
	BTFSC       PORTB+0, 0 
	GOTO        L_main88
	BTFSC       PORTB+0, 1 
	GOTO        L_main88
L__main99:
;data_okuma.c,407 :: 		address1();
	CALL        _address1+0, 0
;data_okuma.c,409 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main89
;data_okuma.c,410 :: 		uart_rd4 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd4+0 
;data_okuma.c,411 :: 		Lcd_Chr(row,col,uart_rd4);
	MOVF        _row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _col+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;data_okuma.c,412 :: 		if(uart_rd4==17){
	MOVF        _uart_rd4+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
;data_okuma.c,413 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,414 :: 		col=1,row=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,415 :: 		}
L_main90:
;data_okuma.c,416 :: 		col=col+1;
	INFSNZ      _col+0, 1 
	INCF        _col+1, 1 
;data_okuma.c,417 :: 		}
L_main89:
;data_okuma.c,418 :: 		if(col==17 && row==1){
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main144
	MOVLW       17
	XORWF       _col+0, 0 
L__main144:
	BTFSS       STATUS+0, 2 
	GOTO        L_main93
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main145
	MOVLW       1
	XORWF       _row+0, 0 
L__main145:
	BTFSS       STATUS+0, 2 
	GOTO        L_main93
L__main98:
;data_okuma.c,419 :: 		row=2;
	MOVLW       2
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,420 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,421 :: 		}
L_main93:
;data_okuma.c,422 :: 		if(row==2 && col==17){
	MOVLW       0
	XORWF       _row+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main146
	MOVLW       2
	XORWF       _row+0, 0 
L__main146:
	BTFSS       STATUS+0, 2 
	GOTO        L_main96
	MOVLW       0
	XORWF       _col+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVLW       17
	XORWF       _col+0, 0 
L__main147:
	BTFSS       STATUS+0, 2 
	GOTO        L_main96
L__main97:
;data_okuma.c,423 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;data_okuma.c,424 :: 		col=1;
	MOVLW       1
	MOVWF       _col+0 
	MOVLW       0
	MOVWF       _col+1 
;data_okuma.c,425 :: 		row=1;
	MOVLW       1
	MOVWF       _row+0 
	MOVLW       0
	MOVWF       _row+1 
;data_okuma.c,426 :: 		timer_sayac_0=0;
	CLRF        _timer_sayac_0+0 
;data_okuma.c,427 :: 		}
L_main96:
;data_okuma.c,428 :: 		}
L_main88:
;data_okuma.c,433 :: 		} // While Döngüsü Bitiþi
L_main12:
;data_okuma.c,434 :: 		}
	GOTO        L_main8
;data_okuma.c,435 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
