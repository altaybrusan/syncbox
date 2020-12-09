
_blink:

;interrupt18f.c,4 :: 		void blink () {
;interrupt18f.c,6 :: 		for(i=0; i<5; i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_blink0:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__blink11
	MOVLW       5
	SUBWF       _i+0, 0 
L__blink11:
	BTFSC       STATUS+0, 0 
	GOTO        L_blink1
;interrupt18f.c,8 :: 		PORTC.RC2 = 1;
	BSF         PORTC+0, 2 
;interrupt18f.c,9 :: 		Delay_Ms(1000);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_blink3:
	DECFSZ      R13, 1, 1
	BRA         L_blink3
	DECFSZ      R12, 1, 1
	BRA         L_blink3
	DECFSZ      R11, 1, 1
	BRA         L_blink3
	NOP
	NOP
;interrupt18f.c,10 :: 		PORTC.RC2 = 0;
	BCF         PORTC+0, 2 
;interrupt18f.c,11 :: 		Delay_Ms(1000);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_blink4:
	DECFSZ      R13, 1, 1
	BRA         L_blink4
	DECFSZ      R12, 1, 1
	BRA         L_blink4
	DECFSZ      R11, 1, 1
	BRA         L_blink4
	NOP
	NOP
;interrupt18f.c,6 :: 		for(i=0; i<5; i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;interrupt18f.c,13 :: 		}
	GOTO        L_blink0
L_blink1:
;interrupt18f.c,15 :: 		}
L_end_blink:
	RETURN      0
; end of _blink

_interrupt:

;interrupt18f.c,21 :: 		void interrupt(void){
;interrupt18f.c,36 :: 		tmp = 1;                                            // Increment variable cnt
	MOVLW       1
	MOVWF       _tmp+0 
	MOVLW       0
	MOVWF       _tmp+1 
;interrupt18f.c,37 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;interrupt18f.c,41 :: 		}
L_end_interrupt:
L__interrupt13:
	RETFIE      1
; end of _interrupt

_main:

;interrupt18f.c,66 :: 		void main() {                                         // Main program
;interrupt18f.c,68 :: 		TRISB = 0;                                          // Set PortB as output
	CLRF        TRISB+0 
;interrupt18f.c,69 :: 		LATB = 0;                                           // Starting value for PortB
	CLRF        LATB+0 
;interrupt18f.c,71 :: 		INTCON2 = 0x0001;                                   // Setup INT0 pin to interupt on falling edge
	MOVLW       1
	MOVWF       INTCON2+0 
;interrupt18f.c,72 :: 		INT0IF_bit = 0;                                    // Reset INT0 interrupt flag
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;interrupt18f.c,73 :: 		INT0IE_bit = 1;                                    // Enable INT0 Interrupt Service Routine
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;interrupt18f.c,77 :: 		while(1) {                                          // Unending loop
L_main5:
;interrupt18f.c,78 :: 		while (tmp) {
L_main7:
	MOVF        _tmp+0, 0 
	IORWF       _tmp+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;interrupt18f.c,79 :: 		INTCON2 = 0x0000;                               // Disable interrupts
	CLRF        INTCON2+0 
;interrupt18f.c,80 :: 		LATB = 0xFF;                                    // Turn on PortB
	MOVLW       255
	MOVWF       LATB+0 
;interrupt18f.c,81 :: 		Delay_ms(5000);                                 // Wait for 5 seconds
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;interrupt18f.c,82 :: 		LATB = 0x00;                                    // Turn off PortB
	CLRF        LATB+0 
;interrupt18f.c,83 :: 		tmp = 0;                                        // Clear tmp variable
	CLRF        _tmp+0 
	CLRF        _tmp+1 
;interrupt18f.c,84 :: 		INTCON2 = 0x0001;                               // Enable interrupts
	MOVLW       1
	MOVWF       INTCON2+0 
;interrupt18f.c,85 :: 		}
	GOTO        L_main7
L_main8:
;interrupt18f.c,86 :: 		}
	GOTO        L_main5
;interrupt18f.c,87 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
