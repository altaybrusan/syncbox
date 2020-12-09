
_Delay250:

;Flash_functions.c,1 :: 		void Delay250() {
;Flash_functions.c,2 :: 		Delay_ms(250);                // Waits for 250 ms
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Delay2500:
	DECFSZ      R13, 1, 1
	BRA         L_Delay2500
	DECFSZ      R12, 1, 1
	BRA         L_Delay2500
	DECFSZ      R11, 1, 1
	BRA         L_Delay2500
	NOP
	NOP
;Flash_functions.c,3 :: 		}
L_end_Delay250:
	RETURN      0
; end of _Delay250

_Delay150:

;Flash_functions.c,5 :: 		void Delay150() {
;Flash_functions.c,6 :: 		Delay_ms(150);                // Waits for 150 ms
	MOVLW       195
	MOVWF       R12, 0
	MOVLW       205
	MOVWF       R13, 0
L_Delay1501:
	DECFSZ      R13, 1, 1
	BRA         L_Delay1501
	DECFSZ      R12, 1, 1
	BRA         L_Delay1501
;Flash_functions.c,7 :: 		}
L_end_Delay150:
	RETURN      0
; end of _Delay150

_FlashIt:

;Flash_functions.c,9 :: 		void FlashIt(char hexCode){     // Flashes LEDs two times
;Flash_functions.c,10 :: 		LATD = hexCode;               // Writes hex to to PORTD
	MOVF        FARG_FlashIt_hexCode+0, 0 
	MOVWF       LATD+0 
;Flash_functions.c,11 :: 		Delay150();                   // Short pause
	CALL        _Delay150+0, 0
;Flash_functions.c,12 :: 		LATD = 0;                     // Clears PORTD
	CLRF        LATD+0 
;Flash_functions.c,13 :: 		Delay250(); Delay250();       // Pause
	CALL        _Delay250+0, 0
	CALL        _Delay250+0, 0
;Flash_functions.c,14 :: 		LATD = hexCode;               // Writes hex to to PORTD second time
	MOVF        FARG_FlashIt_hexCode+0, 0 
	MOVWF       LATD+0 
;Flash_functions.c,15 :: 		Delay150();                   // Short pause
	CALL        _Delay150+0, 0
;Flash_functions.c,16 :: 		LATD = 0;                     // Clears PORTD
	CLRF        LATD+0 
;Flash_functions.c,17 :: 		Delay250(); Delay250();       // Pause
	CALL        _Delay250+0, 0
	CALL        _Delay250+0, 0
;Flash_functions.c,18 :: 		LATD = hexCode;               // Writes hex to to PORTD second time
	MOVF        FARG_FlashIt_hexCode+0, 0 
	MOVWF       LATD+0 
;Flash_functions.c,19 :: 		Delay150();                   // Short pause
	CALL        _Delay150+0, 0
;Flash_functions.c,20 :: 		LATD = 0;                     // Clears PORTD
	CLRF        LATD+0 
;Flash_functions.c,21 :: 		Delay250(); Delay250();       // Pause
	CALL        _Delay250+0, 0
	CALL        _Delay250+0, 0
;Flash_functions.c,23 :: 		}
L_end_FlashIt:
	RETURN      0
; end of _FlashIt
