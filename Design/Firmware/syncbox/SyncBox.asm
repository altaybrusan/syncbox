
_address1:

;SyncBox.c,54 :: 		void address1(){
;SyncBox.c,56 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;SyncBox.c,57 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;SyncBox.c,58 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;SyncBox.c,60 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;SyncBox.c,62 :: 		void address2(){
;SyncBox.c,64 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;SyncBox.c,65 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;SyncBox.c,66 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;SyncBox.c,68 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;SyncBox.c,70 :: 		void address3(){
;SyncBox.c,72 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;SyncBox.c,73 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;SyncBox.c,74 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;SyncBox.c,76 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;SyncBox.c,78 :: 		void address4(){
;SyncBox.c,80 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;SyncBox.c,81 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;SyncBox.c,82 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;SyncBox.c,84 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_InitTimer0:

;SyncBox.c,90 :: 		void InitTimer0(){
;SyncBox.c,91 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;SyncBox.c,92 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;SyncBox.c,93 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;SyncBox.c,94 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;SyncBox.c,95 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;SyncBox.c,97 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;SyncBox.c,99 :: 		void InitTimer1(){
;SyncBox.c,100 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;SyncBox.c,101 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;SyncBox.c,102 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;SyncBox.c,103 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;SyncBox.c,104 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;SyncBox.c,105 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;SyncBox.c,106 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;SyncBox.c,108 :: 		void InitTimer2(){
;SyncBox.c,109 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;SyncBox.c,110 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;SyncBox.c,111 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;SyncBox.c,112 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;SyncBox.c,113 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;SyncBox.c,115 :: 		void InitTimer3(){
;SyncBox.c,116 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;SyncBox.c,117 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;SyncBox.c,118 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;SyncBox.c,119 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;SyncBox.c,120 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;SyncBox.c,121 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;SyncBox.c,122 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;SyncBox.c,124 :: 		void InitINT0(){
;SyncBox.c,125 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;SyncBox.c,126 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;SyncBox.c,127 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;SyncBox.c,128 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;SyncBox.c,130 :: 		void InitINT1(){
;SyncBox.c,131 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;SyncBox.c,132 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;SyncBox.c,133 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;SyncBox.c,134 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;SyncBox.c,136 :: 		void InitINT2(){
;SyncBox.c,137 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;SyncBox.c,138 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;SyncBox.c,139 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;SyncBox.c,140 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_interrupt:

;SyncBox.c,146 :: 		void interrupt(){
;SyncBox.c,148 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;SyncBox.c,150 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;SyncBox.c,151 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;SyncBox.c,152 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;SyncBox.c,153 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;SyncBox.c,154 :: 		timer_sayac_0++;
	INFSNZ      _timer_sayac_0+0, 1 
	INCF        _timer_sayac_0+1, 1 
;SyncBox.c,155 :: 		}
L_interrupt0:
;SyncBox.c,156 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;SyncBox.c,157 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;SyncBox.c,158 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;SyncBox.c,159 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;SyncBox.c,161 :: 		}
L_interrupt1:
;SyncBox.c,162 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;SyncBox.c,163 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;SyncBox.c,165 :: 		}
L_interrupt2:
;SyncBox.c,166 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;SyncBox.c,167 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;SyncBox.c,168 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;SyncBox.c,169 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;SyncBox.c,171 :: 		}
L_interrupt3:
;SyncBox.c,172 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;SyncBox.c,173 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;SyncBox.c,174 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;SyncBox.c,175 :: 		}
L_interrupt4:
;SyncBox.c,176 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;SyncBox.c,177 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;SyncBox.c,178 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;SyncBox.c,179 :: 		}
L_interrupt5:
;SyncBox.c,180 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;SyncBox.c,182 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;SyncBox.c,183 :: 		}
L_interrupt6:
;SyncBox.c,187 :: 		}
L_end_interrupt:
L__interrupt72:
	RETFIE      1
; end of _interrupt

_main:

;SyncBox.c,193 :: 		void main() {
;SyncBox.c,195 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;SyncBox.c,197 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;SyncBox.c,199 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;SyncBox.c,201 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;SyncBox.c,203 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;SyncBox.c,205 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;SyncBox.c,207 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;SyncBox.c,209 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;SyncBox.c,211 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;SyncBox.c,213 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;SyncBox.c,218 :: 		LATD.F2 = 1;
	BSF         LATD+0, 2 
;SyncBox.c,220 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;SyncBox.c,222 :: 		Lcd_Out(1,1,"SyncBox V.1.0 Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_SyncBox+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_SyncBox+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SyncBox.c,224 :: 		Delay_ms(1000);
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
;SyncBox.c,226 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SyncBox.c,230 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;SyncBox.c,233 :: 		HID_Enable(&readbuff,&writebuff);  // USB Etkinleþtirmesi
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;SyncBox.c,238 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;SyncBox.c,239 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;SyncBox.c,244 :: 		while(1){
L_main8:
;SyncBox.c,248 :: 		datacnt = HID_Read();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _datacnt+0 
;SyncBox.c,252 :: 		if(datacnt != 0 /*&& PORTB.F0 == 0 && PORTB.F1 == 0*/){
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;SyncBox.c,254 :: 		for(cnt=0;cnt<datacnt;cnt++)
	CLRF        _cnt+0 
L_main11:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;SyncBox.c,256 :: 		writebuff[cnt]=readbuff[cnt];
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
;SyncBox.c,254 :: 		for(cnt=0;cnt<datacnt;cnt++)
	INCF        _cnt+0, 1 
;SyncBox.c,256 :: 		writebuff[cnt]=readbuff[cnt];
	GOTO        L_main11
L_main12:
;SyncBox.c,262 :: 		if(writebuff[0] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
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
L__main59:
;SyncBox.c,264 :: 		for(cnt=1;cnt<datacnt;cnt++){
	MOVLW       1
	MOVWF       _cnt+0 
L_main17:
	MOVF        _datacnt+0, 0 
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
;SyncBox.c,266 :: 		sent_data_1[cnt-1]= readbuff[cnt];   }
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
;SyncBox.c,264 :: 		for(cnt=1;cnt<datacnt;cnt++){
	INCF        _cnt+0, 1 
;SyncBox.c,266 :: 		sent_data_1[cnt-1]= readbuff[cnt];   }
	GOTO        L_main17
L_main18:
;SyncBox.c,268 :: 		UART1_Write_Text(&sent_data_1);
	MOVLW       _sent_data_1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_sent_data_1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SyncBox.c,272 :: 		}
L_main16:
;SyncBox.c,274 :: 		if(writebuff[0] == 'W' && writebuff[6] == 'O' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
	MOVF        1350, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
	BTFSC       PORTC+0, 0 
	GOTO        L_main22
	BTFSC       PORTC+0, 1 
	GOTO        L_main22
	BTFSC       PORTC+0, 2 
	GOTO        L_main22
L__main58:
;SyncBox.c,276 :: 		LATD.F0 = 1;
	BSF         LATD+0, 0 
;SyncBox.c,277 :: 		UART1_Write_Text(&writebuff);
	MOVLW       _writebuff+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SyncBox.c,279 :: 		}
L_main22:
;SyncBox.c,281 :: 		if(writebuff[0] == 'X' && writebuff[6] == 'E' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       88
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
	MOVF        1350, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
	BTFSC       PORTC+0, 0 
	GOTO        L_main25
	BTFSC       PORTC+0, 1 
	GOTO        L_main25
	BTFSC       PORTC+0, 2 
	GOTO        L_main25
L__main57:
;SyncBox.c,283 :: 		LATD.F0 = 0;
	BCF         LATD+0, 0 
;SyncBox.c,284 :: 		UART1_Write_Text("led_1_off");
	MOVLW       ?lstr2_SyncBox+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_SyncBox+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SyncBox.c,286 :: 		}
L_main25:
;SyncBox.c,291 :: 		if(writebuff[0] == '5' && writebuff[1] == '1' && PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0){
	MOVF        1344, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
	MOVF        1345, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
	BTFSC       PORTC+0, 0 
	GOTO        L_main28
	BTFSC       PORTC+0, 1 
	GOTO        L_main28
	BTFSC       PORTC+0, 2 
	GOTO        L_main28
L__main56:
;SyncBox.c,298 :: 		for(cnt=0;cnt<3;cnt++){
	CLRF        _cnt+0 
L_main29:
	MOVLW       3
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
;SyncBox.c,302 :: 		Delay_Ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	NOP
	NOP
;SyncBox.c,304 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,305 :: 		UART1_Write(88);
	MOVLW       88
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,306 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,308 :: 		Delay_Ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	NOP
	NOP
;SyncBox.c,310 :: 		UART1_Write(33);
	MOVLW       33
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,311 :: 		UART1_Write(79);
	MOVLW       79
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,312 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,298 :: 		for(cnt=0;cnt<3;cnt++){
	INCF        _cnt+0, 1 
;SyncBox.c,320 :: 		}
	GOTO        L_main29
L_main30:
;SyncBox.c,323 :: 		}
L_main28:
;SyncBox.c,325 :: 		}
L_main10:
;SyncBox.c,334 :: 		if(ready == 1 ){
	MOVF        _ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;SyncBox.c,335 :: 		button_state_0 = 1;
	MOVLW       1
	MOVWF       _button_state_0+0 
;SyncBox.c,336 :: 		LATD.F4 = 1;
	BSF         LATD+0, 4 
;SyncBox.c,338 :: 		UART1_Write_Text("warm_up");
	MOVLW       ?lstr3_SyncBox+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_SyncBox+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SyncBox.c,339 :: 		ready = 0;
	CLRF        _ready+0 
;SyncBox.c,342 :: 		}
L_main34:
;SyncBox.c,344 :: 		if(xray_on == 1 && button_state_0 == 1 ){
	MOVF        _xray_on+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main37
	MOVF        _button_state_0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main37
L__main55:
;SyncBox.c,345 :: 		LATD.F6 = 1;
	BSF         LATD+0, 6 
;SyncBox.c,346 :: 		Delay_Ms(40);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	NOP
	NOP
;SyncBox.c,347 :: 		LATD.F6 = 0;
	BCF         LATD+0, 6 
;SyncBox.c,348 :: 		Delay_Ms(60);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
;SyncBox.c,351 :: 		LATD.F1 = 1;
	BSF         LATD+0, 1 
;SyncBox.c,353 :: 		LATD.F5 = 1;
	BSF         LATD+0, 5 
;SyncBox.c,354 :: 		UART1_Write_Text("x_ray_on");
	MOVLW       ?lstr4_SyncBox+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_SyncBox+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SyncBox.c,355 :: 		xray_on = 0;
	CLRF        _xray_on+0 
;SyncBox.c,356 :: 		button_state_1 = 1;
	MOVLW       1
	MOVWF       _button_state_1+0 
;SyncBox.c,359 :: 		}
L_main37:
;SyncBox.c,361 :: 		if(PORTB.F0 == 0 && button_state_1 == 1 || PORTB.F1 == 0 && button_state_1 == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L__main54
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main54
	GOTO        L__main52
L__main54:
	BTFSC       PORTB+0, 1 
	GOTO        L__main53
	MOVF        _button_state_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
	GOTO        L__main52
L__main53:
	GOTO        L_main46
L__main52:
;SyncBox.c,362 :: 		LATD.F0 = 0;
	BCF         LATD+0, 0 
;SyncBox.c,363 :: 		LATD.F1 = 0;
	BCF         LATD+0, 1 
;SyncBox.c,364 :: 		LATD.F4 = 0;
	BCF         LATD+0, 4 
;SyncBox.c,365 :: 		LATD.F5 = 0;
	BCF         LATD+0, 5 
;SyncBox.c,366 :: 		LATD.F7 = 0;
	BCF         LATD+0, 7 
;SyncBox.c,367 :: 		UART1_Write_Text("x_ray_off");
	MOVLW       ?lstr5_SyncBox+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_SyncBox+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SyncBox.c,368 :: 		button_state_1 = 0;
	CLRF        _button_state_1+0 
;SyncBox.c,369 :: 		button_state_0 = 0;
	CLRF        _button_state_0+0 
;SyncBox.c,370 :: 		}
L_main46:
;SyncBox.c,378 :: 		if(PORTC.F0 == 0 && PORTC.F1 == 0 && PORTC.F2 == 0 && PORTB.F0 == 0 && PORTB.F1 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_main49
	BTFSC       PORTC+0, 1 
	GOTO        L_main49
	BTFSC       PORTC+0, 2 
	GOTO        L_main49
	BTFSC       PORTB+0, 0 
	GOTO        L_main49
	BTFSC       PORTB+0, 1 
	GOTO        L_main49
L__main51:
;SyncBox.c,382 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main50
;SyncBox.c,384 :: 		uart_rd1[64] = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+64 
;SyncBox.c,386 :: 		UART1_Write(uart_rd1[64]);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;SyncBox.c,388 :: 		writebuff[64]=uart_rd1[64];
	MOVF        _uart_rd1+64, 0 
	MOVWF       1408 
;SyncBox.c,392 :: 		}
L_main50:
;SyncBox.c,393 :: 		}
L_main49:
;SyncBox.c,400 :: 		} // While Döngüsü Bitisi
	GOTO        L_main8
;SyncBox.c,401 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
