
_interrupt:

;timer0.c,5 :: 		void interrupt(){//kesme alt programý
;timer0.c,6 :: 		if (TMR0IF_bit){//Timer0 Kesme bayraðý kontrol ediliyor.
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;timer0.c,7 :: 		i++;
	INCF        _i+0, 1 
;timer0.c,8 :: 		TMR0L=131;
	MOVLW       131
	MOVWF       TMR0L+0 
;timer0.c,9 :: 		TMR0IF_bit=0;// Kesme bayraðý sýfýrlanýyor.
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;timer0.c,10 :: 		}
L_interrupt0:
;timer0.c,11 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_kurulum:

;timer0.c,13 :: 		void kurulum(){
;timer0.c,14 :: 		TRISB=0;//PORTB çýkýþ
	CLRF        TRISB+0 
;timer0.c,15 :: 		PORTB=0;//PORTB'nin tüm pinleri 0 seviyesinde.
	CLRF        PORTB+0 
;timer0.c,16 :: 		TMR0ON_bit=1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;timer0.c,17 :: 		T08BIT_bit=0;
	BCF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;timer0.c,18 :: 		T0CS_bit=0;// Clock palsi kaynaðý olarak dahili osilatör seçildi.
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;timer0.c,19 :: 		T0SE_bit=0;
	BCF         T0SE_bit+0, BitPos(T0SE_bit+0) 
;timer0.c,20 :: 		PSA_bit=0;//Prescaler deðeri Timer0 için kullanýlacak.
	BCF         PSA_bit+0, BitPos(PSA_bit+0) 
;timer0.c,21 :: 		T0PS2_bit=0;//Prescaler deðeri 1:32 olarak seçildi.
	BCF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;timer0.c,22 :: 		T0PS1_bit=0;
	BCF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;timer0.c,23 :: 		T0PS0_bit=1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;timer0.c,24 :: 		GIE_bit=1;// tüm kesmelere izin verdik.
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;timer0.c,25 :: 		TMR0IF_bit=0;//Kesme bayraðýný her ihtimale karþý sýfýrladýk
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;timer0.c,26 :: 		TMR0L = 131;
	MOVLW       131
	MOVWF       TMR0L+0 
;timer0.c,27 :: 		TMR0IE_bit=1;//Timer0 kesmesini aktif ettik.
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;timer0.c,28 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;timer0.c,30 :: 		void main(){
;timer0.c,31 :: 		kurulum();
	CALL        _kurulum+0, 0
;timer0.c,49 :: 		while(1){
L_main1:
;timer0.c,51 :: 		if(i==1)  // Eðer i=5 ise yani 5 kesme oluþmuþsa(5 x 4ms = 20 ms)
	MOVF        _i+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;timer0.c,53 :: 		latb=~latb;//portb tersleniyor
	COMF        LATB+0, 1 
;timer0.c,54 :: 		i=0;//i deðiþkeni sýfýrlanýyor.
	CLRF        _i+0 
;timer0.c,56 :: 		}
L_main3:
;timer0.c,57 :: 		}
	GOTO        L_main1
;timer0.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
