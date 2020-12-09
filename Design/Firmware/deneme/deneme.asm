
_address1:

;deneme.c,54 :: 		void address1(){
;deneme.c,56 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;deneme.c,57 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;deneme.c,58 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;deneme.c,60 :: 		}
L_end_address1:
	RETURN      0
; end of _address1

_address2:

;deneme.c,62 :: 		void address2(){
;deneme.c,64 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;deneme.c,65 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;deneme.c,66 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;deneme.c,68 :: 		}
L_end_address2:
	RETURN      0
; end of _address2

_address3:

;deneme.c,70 :: 		void address3(){
;deneme.c,72 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;deneme.c,73 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;deneme.c,74 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;deneme.c,76 :: 		}
L_end_address3:
	RETURN      0
; end of _address3

_address4:

;deneme.c,78 :: 		void address4(){
;deneme.c,80 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;deneme.c,81 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;deneme.c,82 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;deneme.c,84 :: 		}
L_end_address4:
	RETURN      0
; end of _address4

_InitTimer0:

;deneme.c,90 :: 		void InitTimer0(){
;deneme.c,91 :: 		T0CON = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;deneme.c,92 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;deneme.c,93 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;deneme.c,94 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;deneme.c,95 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;deneme.c,97 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;deneme.c,99 :: 		void InitTimer1(){
;deneme.c,100 :: 		T1CON = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;deneme.c,101 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;deneme.c,102 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;deneme.c,103 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;deneme.c,104 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;deneme.c,105 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;deneme.c,106 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_InitTimer2:

;deneme.c,108 :: 		void InitTimer2(){
;deneme.c,109 :: 		T2CON = 0x66;
	MOVLW       102
	MOVWF       T2CON+0 
;deneme.c,110 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;deneme.c,111 :: 		PR2 = 240;
	MOVLW       240
	MOVWF       PR2+0 
;deneme.c,112 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;deneme.c,113 :: 		}
L_end_InitTimer2:
	RETURN      0
; end of _InitTimer2

_InitTimer3:

;deneme.c,115 :: 		void InitTimer3(){
;deneme.c,116 :: 		T3CON = 0x21;
	MOVLW       33
	MOVWF       T3CON+0 
;deneme.c,117 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;deneme.c,118 :: 		TMR3H = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;deneme.c,119 :: 		TMR3L = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;deneme.c,120 :: 		TMR3IE_bit = 1;
	BSF         TMR3IE_bit+0, BitPos(TMR3IE_bit+0) 
;deneme.c,121 :: 		INTCON = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;deneme.c,122 :: 		}
L_end_InitTimer3:
	RETURN      0
; end of _InitTimer3

_InitINT0:

;deneme.c,124 :: 		void InitINT0(){
;deneme.c,125 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;deneme.c,126 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;deneme.c,127 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;deneme.c,128 :: 		}
L_end_InitINT0:
	RETURN      0
; end of _InitINT0

_InitINT1:

;deneme.c,130 :: 		void InitINT1(){
;deneme.c,131 :: 		INT1IE_bit = 1;
	BSF         INT1IE_bit+0, BitPos(INT1IE_bit+0) 
;deneme.c,132 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;deneme.c,133 :: 		INT1IF_bit = 0;
	BCF         INT1IF_bit+0, BitPos(INT1IF_bit+0) 
;deneme.c,134 :: 		}
L_end_InitINT1:
	RETURN      0
; end of _InitINT1

_InitINT2:

;deneme.c,136 :: 		void InitINT2(){
;deneme.c,137 :: 		INT2IE_bit = 1;
	BSF         INT2IE_bit+0, BitPos(INT2IE_bit+0) 
;deneme.c,138 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;deneme.c,139 :: 		INT2IF_bit = 0;
	BCF         INT2IF_bit+0, BitPos(INT2IF_bit+0) 
;deneme.c,140 :: 		}
L_end_InitINT2:
	RETURN      0
; end of _InitINT2

_interrupt:

;deneme.c,146 :: 		void interrupt(){
;deneme.c,150 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;deneme.c,151 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;deneme.c,152 :: 		TMR0H         = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;deneme.c,153 :: 		TMR0L         = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;deneme.c,154 :: 		timer_sayac_0++;
	INFSNZ      _timer_sayac_0+0, 1 
	INCF        _timer_sayac_0+1, 1 
;deneme.c,155 :: 		}
L_interrupt0:
;deneme.c,156 :: 		if(TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt1
;deneme.c,157 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;deneme.c,158 :: 		TMR1H = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;deneme.c,159 :: 		TMR1L = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;deneme.c,161 :: 		}
L_interrupt1:
;deneme.c,162 :: 		if(TMR2IF_bit){
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt2
;deneme.c,163 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;deneme.c,165 :: 		}
L_interrupt2:
;deneme.c,166 :: 		if(TMR3IF_bit){
	BTFSS       TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
	GOTO        L_interrupt3
;deneme.c,167 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, BitPos(TMR3IF_bit+0) 
;deneme.c,168 :: 		TMR3H         = 0x3C;
	MOVLW       60
	MOVWF       TMR3H+0 
;deneme.c,169 :: 		TMR3L         = 0xB0;
	MOVLW       176
	MOVWF       TMR3L+0 
;deneme.c,171 :: 		}
L_interrupt3:
;deneme.c,172 :: 		if(INT0F_bit){
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt4
;deneme.c,173 :: 		xray_on = 1;
	MOVLW       1
	MOVWF       _xray_on+0 
;deneme.c,174 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;deneme.c,175 :: 		}
L_interrupt4:
;deneme.c,176 :: 		if(INT1F_bit){
	BTFSS       INT1F_bit+0, BitPos(INT1F_bit+0) 
	GOTO        L_interrupt5
;deneme.c,177 :: 		ready = 1;
	MOVLW       1
	MOVWF       _ready+0 
;deneme.c,178 :: 		INT1F_bit = 0;
	BCF         INT1F_bit+0, BitPos(INT1F_bit+0) 
;deneme.c,179 :: 		}
L_interrupt5:
;deneme.c,180 :: 		if(INT2F_bit){
	BTFSS       INT2F_bit+0, BitPos(INT2F_bit+0) 
	GOTO        L_interrupt6
;deneme.c,182 :: 		INT2F_bit = 0;
	BCF         INT2F_bit+0, BitPos(INT2F_bit+0) 
;deneme.c,183 :: 		}
L_interrupt6:
;deneme.c,187 :: 		}
L_end_interrupt:
L__interrupt23:
	RETFIE      1
; end of _interrupt

_main:

;deneme.c,193 :: 		void main() {
;deneme.c,195 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;deneme.c,197 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;deneme.c,199 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;deneme.c,201 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;deneme.c,203 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;deneme.c,205 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;deneme.c,207 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;deneme.c,209 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;deneme.c,211 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;deneme.c,213 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;deneme.c,218 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;deneme.c,220 :: 		Lcd_Out(1,1,"Gulmay Gen. Test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_deneme+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_deneme+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;deneme.c,222 :: 		Delay_ms(1000);
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
;deneme.c,224 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;deneme.c,228 :: 		UART1_Init(9600);  // UART Portu Etkinleþtirmesi
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;deneme.c,236 :: 		InitINT0();
	CALL        _InitINT0+0, 0
;deneme.c,237 :: 		InitINT1();
	CALL        _InitINT1+0, 0
;deneme.c,242 :: 		while(1){
L_main8:
;deneme.c,261 :: 		if (UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;deneme.c,263 :: 		uart_rd1 = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd1+0 
;deneme.c,266 :: 		UART1_Write(uart_rd1);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;deneme.c,271 :: 		}
L_main10:
;deneme.c,279 :: 		} // While Döngüsü Bitiþi
	GOTO        L_main8
;deneme.c,280 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
