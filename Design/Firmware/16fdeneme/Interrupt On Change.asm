
_interrupt:

;Interrupt On Change.c,39 :: 		void interrupt(){              // Interrupt rutine
;Interrupt On Change.c,40 :: 		if(RBIF_bit == 1 ) {         // Checks for Receive Interrupt Flag bit
	BTFSS       RBIF_bit+0, BitPos(RBIF_bit+0) 
	GOTO        L_interrupt0
;Interrupt On Change.c,41 :: 		flag  = 1;                 // Set local interrupt flag
	BSF         _flag+0, BitPos(_flag+0) 
;Interrupt On Change.c,42 :: 		RBIF_bit = 0;              // Clear Interrupt Flag
	BCF         RBIF_bit+0, BitPos(RBIF_bit+0) 
;Interrupt On Change.c,43 :: 		if (PORTB.F7 == 1){        // Checks if the RB7 is pressed
	BTFSS       PORTB+0, 7 
	GOTO        L_interrupt1
;Interrupt On Change.c,44 :: 		pressedButton = 7;
	MOVLW       7
	MOVWF       _pressedButton+0 
;Interrupt On Change.c,45 :: 		}
L_interrupt1:
;Interrupt On Change.c,46 :: 		if (PORTB.F6 == 1){        // Checks if the RB6 is pressed
	BTFSS       PORTB+0, 6 
	GOTO        L_interrupt2
;Interrupt On Change.c,47 :: 		pressedButton = 6;
	MOVLW       6
	MOVWF       _pressedButton+0 
;Interrupt On Change.c,48 :: 		}
L_interrupt2:
;Interrupt On Change.c,49 :: 		if (PORTB.F5 == 1){        // Checks if the RB5 is pressed
	BTFSS       PORTB+0, 5 
	GOTO        L_interrupt3
;Interrupt On Change.c,50 :: 		pressedButton = 5;
	MOVLW       5
	MOVWF       _pressedButton+0 
;Interrupt On Change.c,51 :: 		}
L_interrupt3:
;Interrupt On Change.c,52 :: 		if (PORTB.F4 == 1){        // Checks if the RB4 is pressed
	BTFSS       PORTB+0, 4 
	GOTO        L_interrupt4
;Interrupt On Change.c,53 :: 		pressedButton = 4;
	MOVLW       4
	MOVWF       _pressedButton+0 
;Interrupt On Change.c,54 :: 		}
L_interrupt4:
;Interrupt On Change.c,55 :: 		}
L_interrupt0:
;Interrupt On Change.c,56 :: 		}
L_end_interrupt:
L__interrupt16:
	RETFIE      1
; end of _interrupt

_main:

;Interrupt On Change.c,58 :: 		void main() {                  // Varialbe initialisation
;Interrupt On Change.c,59 :: 		flag          = 0;           // Varialbe initialisation
	BCF         _flag+0, BitPos(_flag+0) 
;Interrupt On Change.c,60 :: 		pressedButton = 0;
	CLRF        _pressedButton+0 
;Interrupt On Change.c,62 :: 		ADCON1 = 0b00001111;         // Configure all PORT pins as digital
	MOVLW       15
	MOVWF       ADCON1+0 
;Interrupt On Change.c,63 :: 		TRISB  = 0b11111111;;        // Set PORT B as input
	MOVLW       255
	MOVWF       TRISB+0 
;Interrupt On Change.c,64 :: 		LATD   = 0b00000000;         // Set all pin on PORT D Low
	CLRF        LATD+0 
;Interrupt On Change.c,65 :: 		TRISD  = 0;                  // Set PORT D as output
	CLRF        TRISD+0 
;Interrupt On Change.c,66 :: 		RBIE_bit  = 1;               // Enable Port B Interrupt-On-Change
	BSF         RBIE_bit+0, BitPos(RBIE_bit+0) 
;Interrupt On Change.c,67 :: 		RBIF_bit  = 0;               // Clear IOC flag
	BCF         RBIF_bit+0, BitPos(RBIF_bit+0) 
;Interrupt On Change.c,68 :: 		GIE_bit   = 1;               // Enable GLOBAL interrupts
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Interrupt On Change.c,71 :: 		while(1) {
L_main5:
;Interrupt On Change.c,73 :: 		if(flag) {
	BTFSS       _flag+0, BitPos(_flag+0) 
	GOTO        L_main7
;Interrupt On Change.c,74 :: 		switch(pressedButton) {  // Depending on value(button pressed), calls FleshIt function with different argument
	GOTO        L_main8
;Interrupt On Change.c,75 :: 		case 4:
L_main10:
;Interrupt On Change.c,76 :: 		FlashIt(0x03);
	MOVLW       3
	MOVWF       FARG_FlashIt_what+0 
	CALL        _FlashIt+0, 0
;Interrupt On Change.c,77 :: 		pressedButton = 0;
	CLRF        _pressedButton+0 
;Interrupt On Change.c,78 :: 		break;
	GOTO        L_main9
;Interrupt On Change.c,79 :: 		case 5:
L_main11:
;Interrupt On Change.c,80 :: 		FlashIt(0x0C);
	MOVLW       12
	MOVWF       FARG_FlashIt_what+0 
	CALL        _FlashIt+0, 0
;Interrupt On Change.c,81 :: 		pressedButton = 0;
	CLRF        _pressedButton+0 
;Interrupt On Change.c,82 :: 		break;
	GOTO        L_main9
;Interrupt On Change.c,83 :: 		case 6:
L_main12:
;Interrupt On Change.c,84 :: 		FlashIt(0x30);
	MOVLW       48
	MOVWF       FARG_FlashIt_what+0 
	CALL        _FlashIt+0, 0
;Interrupt On Change.c,85 :: 		pressedButton = 0;
	CLRF        _pressedButton+0 
;Interrupt On Change.c,86 :: 		break;
	GOTO        L_main9
;Interrupt On Change.c,87 :: 		case 7:
L_main13:
;Interrupt On Change.c,88 :: 		FlashIt(0xC0);
	MOVLW       192
	MOVWF       FARG_FlashIt_what+0 
	CALL        _FlashIt+0, 0
;Interrupt On Change.c,89 :: 		pressedButton = 0;
	CLRF        _pressedButton+0 
;Interrupt On Change.c,90 :: 		break;
	GOTO        L_main9
;Interrupt On Change.c,91 :: 		default:
L_main14:
;Interrupt On Change.c,95 :: 		break;
	GOTO        L_main9
;Interrupt On Change.c,96 :: 		}
L_main8:
	MOVF        _pressedButton+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        _pressedButton+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _pressedButton+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _pressedButton+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	GOTO        L_main14
L_main9:
;Interrupt On Change.c,97 :: 		flag = 0;                 // Reset flag variable
	BCF         _flag+0, BitPos(_flag+0) 
;Interrupt On Change.c,98 :: 		}
L_main7:
;Interrupt On Change.c,99 :: 		}
	GOTO        L_main5
;Interrupt On Change.c,100 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
