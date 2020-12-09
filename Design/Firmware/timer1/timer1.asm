
_InitTimer1:

;timer1.c,3 :: 		void InitTimer1(){
;timer1.c,4 :: 		T1CON         = 0x21;
	MOVLW       33
	MOVWF       T1CON+0 
;timer1.c,5 :: 		TMR1IF_bit         = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;timer1.c,6 :: 		TMR1H         = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;timer1.c,7 :: 		TMR1L         = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;timer1.c,8 :: 		TMR1IE_bit         = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;timer1.c,9 :: 		INTCON         = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;timer1.c,10 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_Interrupt:

;timer1.c,12 :: 		void Interrupt(){
;timer1.c,13 :: 		if (TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_Interrupt0
;timer1.c,14 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;timer1.c,15 :: 		TMR1H         = 0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;timer1.c,16 :: 		TMR1L         = 0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;timer1.c,17 :: 		i++;
	INCF        _i+0, 1 
;timer1.c,19 :: 		}
L_Interrupt0:
;timer1.c,20 :: 		}
L_end_Interrupt:
L__Interrupt6:
	RETFIE      1
; end of _Interrupt

_main:

;timer1.c,23 :: 		void main(){
;timer1.c,24 :: 		TRISB=0;//PORTB çýkýþ
	CLRF        TRISB+0 
;timer1.c,25 :: 		PORTB=0;//PORTB'nin tüm pinleri 0 seviyesinde.
	CLRF        PORTB+0 
;timer1.c,26 :: 		InitTimer1();
	CALL        _InitTimer1+0, 0
;timer1.c,28 :: 		while(1){
L_main1:
;timer1.c,30 :: 		if(i==1)  // Eðer i=5 ise yani 5 kesme oluþmuþsa(5 x 4ms = 20 ms)
	MOVF        _i+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;timer1.c,32 :: 		latb=~latb;//portb tersleniyor
	COMF        LATB+0, 1 
;timer1.c,33 :: 		i=0;//i deðiþkeni sýfýrlanýyor.
	CLRF        _i+0 
;timer1.c,35 :: 		}
L_main3:
;timer1.c,36 :: 		}
	GOTO        L_main1
;timer1.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
