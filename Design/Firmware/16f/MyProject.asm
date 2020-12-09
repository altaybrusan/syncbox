
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,27 :: 		void interrupt(){          // Interrupt rutine
;MyProject.c,28 :: 		if(INTCON.INTF == 1 ){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;MyProject.c,29 :: 		cnt++;                 // Increment variable cnt
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;MyProject.c,30 :: 		INTCON.INTF = 0;       // Clear Interrupt Flag
	BCF        INTCON+0, 1
;MyProject.c,31 :: 		}
L_interrupt0:
;MyProject.c,32 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,34 :: 		void main() {              // Main program
;MyProject.c,42 :: 		PORTB.F7 = 1;
	BSF        PORTB+0, 7
;MyProject.c,43 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;MyProject.c,44 :: 		PORTB.F7 = 0;
	BCF        PORTB+0, 7
;MyProject.c,46 :: 		TRISB = 0x01;            // Set PB0 as input
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,47 :: 		TRISD = 0x00;            // Set PortD as output
	CLRF       TRISD+0
;MyProject.c,49 :: 		PORTD = 0x00;            // Starting value for PortD
	CLRF       PORTD+0
;MyProject.c,51 :: 		INTCON = 0x90;           // Interrupt flags:
	MOVLW      144
	MOVWF      INTCON+0
;MyProject.c,56 :: 		while(1){                // Unending loop
L_main2:
;MyProject.c,57 :: 		PORTD = cnt;           // Write on PortD value of varibale cnt
	MOVF       _cnt+0, 0
	MOVWF      PORTD+0
;MyProject.c,58 :: 		}
	GOTO       L_main2
;MyProject.c,59 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
