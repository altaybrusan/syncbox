
_interrupt:

;RS485m.c,10 :: 		void interrupt() {
;RS485m.c,11 :: 		RS485Master_Receive(dat);
	MOVLW       _dat+0
	MOVWF       FARG_RS485Master_Receive_data_buffer+0 
	MOVLW       hi_addr(_dat+0)
	MOVWF       FARG_RS485Master_Receive_data_buffer+1 
	CALL        _RS485Master_Receive+0, 0
;RS485m.c,12 :: 		}
L_end_interrupt:
L__interrupt20:
	RETFIE      1
; end of _interrupt

_main:

;RS485m.c,14 :: 		void main(){
;RS485m.c,16 :: 		ADCON1 = 0x0F ;                         // Configure AN pins as digital I/O
	MOVLW       15
	MOVWF       ADCON1+0 
;RS485m.c,17 :: 		CMCON  = 0x07 ;                             // Disable comparators
	MOVLW       7
	MOVWF       CMCON+0 
;RS485m.c,19 :: 		PORTB  = 0;
	CLRF        PORTB+0 
;RS485m.c,20 :: 		PORTC  = 0;
	CLRF        PORTC+0 
;RS485m.c,21 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;RS485m.c,23 :: 		TRISB  = 0;
	CLRF        TRISB+0 
;RS485m.c,24 :: 		TRISC  = 0;
	CLRF        TRISC+0 
;RS485m.c,25 :: 		TRISD  = 0;
	CLRF        TRISD+0 
;RS485m.c,37 :: 		UART1_Init(9600);                    // initialize UART1 module
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;RS485m.c,38 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;RS485m.c,40 :: 		RS485Master_Init();                  // initialize MCU as Master
	CALL        _RS485Master_Init+0, 0
;RS485m.c,42 :: 		dat[0] = 0xAA;
	MOVLW       170
	MOVWF       _dat+0 
;RS485m.c,43 :: 		dat[1] = 0xF0;
	MOVLW       240
	MOVWF       _dat+1 
;RS485m.c,44 :: 		dat[2] = 0x0F;
	MOVLW       15
	MOVWF       _dat+2 
;RS485m.c,45 :: 		dat[4] = 0;                          // ensure that message received flag is 0
	CLRF        _dat+4 
;RS485m.c,46 :: 		dat[5] = 0;                          // ensure that error flag is 0
	CLRF        _dat+5 
;RS485m.c,47 :: 		dat[6] = 0;
	CLRF        _dat+6 
;RS485m.c,52 :: 		RCIE_bit = 1;                        // enable interrupt on UART1 receive
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;RS485m.c,53 :: 		TXIE_bit = 0;                        // disable interrupt on UART1 transmit
	BCF         TXIE_bit+0, BitPos(TXIE_bit+0) 
;RS485m.c,54 :: 		PEIE_bit = 1;                        // enable peripheral interrupts
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;RS485m.c,55 :: 		GIE_bit = 1;                         // enable all interrupts
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;RS485m.c,57 :: 		for (i = 1; i <= 3; i++) {  // TEST LEDs
	MOVLW       1
	MOVWF       _i+0 
L_main1:
	MOVF        _i+0, 0 
	SUBLW       3
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;RS485m.c,59 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;RS485m.c,60 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
;RS485m.c,61 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;RS485m.c,63 :: 		PORTD.F1=1;
	BSF         PORTD+0, 1 
;RS485m.c,64 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
;RS485m.c,65 :: 		PORTD.F1=0;
	BCF         PORTD+0, 1 
;RS485m.c,67 :: 		PORTD.F2=1;
	BSF         PORTD+0, 2 
;RS485m.c,68 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
;RS485m.c,69 :: 		PORTD.F2=0;
	BCF         PORTD+0, 2 
;RS485m.c,57 :: 		for (i = 1; i <= 3; i++) {  // TEST LEDs
	INCF        _i+0, 1 
;RS485m.c,70 :: 		}
	GOTO        L_main1
L_main2:
;RS485m.c,72 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
;RS485m.c,74 :: 		RS485Master_Send(dat,1,160);
	MOVLW       _dat+0
	MOVWF       FARG_RS485Master_Send_data_buffer+0 
	MOVLW       hi_addr(_dat+0)
	MOVWF       FARG_RS485Master_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Master_Send_datalen+0 
	MOVLW       160
	MOVWF       FARG_RS485Master_Send_slave_address+0 
	CALL        _RS485Master_Send+0, 0
;RS485m.c,76 :: 		while (1){
L_main8:
;RS485m.c,79 :: 		cnt++;
	MOVLW       1
	ADDWF       _cnt+0, 1 
	MOVLW       0
	ADDWFC      _cnt+1, 1 
	ADDWFC      _cnt+2, 1 
	ADDWFC      _cnt+3, 1 
;RS485m.c,80 :: 		if (dat[5])  {                     // if an error detected, signal it
	MOVF        _dat+5, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;RS485m.c,82 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;RS485m.c,83 :: 		}
L_main10:
;RS485m.c,84 :: 		if (dat[4]) {                      // if message received successfully
	MOVF        _dat+4, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;RS485m.c,85 :: 		cnt = 0;
	CLRF        _cnt+0 
	CLRF        _cnt+1 
	CLRF        _cnt+2 
	CLRF        _cnt+3 
;RS485m.c,86 :: 		dat[4] = 0;                      // clear message received flag
	CLRF        _dat+4 
;RS485m.c,87 :: 		j = dat[3];
	MOVF        _dat+3, 0 
	MOVWF       _j+0 
;RS485m.c,88 :: 		PORTB = dat[i-1];
	DECF        _i+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _dat+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_dat+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;RS485m.c,89 :: 		PORTD.F1=1;
	BSF         PORTD+0, 1 
;RS485m.c,90 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	NOP
;RS485m.c,91 :: 		PORTD.F1=0;
	BCF         PORTD+0, 1 
;RS485m.c,94 :: 		dat[0] = dat[0]+1;                // increment message by one
	INCF        _dat+0, 1 
;RS485m.c,95 :: 		Delay_ms(1);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       75
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
;RS485m.c,96 :: 		RS485Master_Send(dat,1,160);     // send back to slave
	MOVLW       _dat+0
	MOVWF       FARG_RS485Master_Send_data_buffer+0 
	MOVLW       hi_addr(_dat+0)
	MOVWF       FARG_RS485Master_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Master_Send_datalen+0 
	MOVLW       160
	MOVWF       FARG_RS485Master_Send_slave_address+0 
	CALL        _RS485Master_Send+0, 0
;RS485m.c,99 :: 		}
L_main11:
;RS485m.c,100 :: 		if (cnt > 100000) {
	MOVLW       128
	XORLW       0
	MOVWF       R0 
	MOVLW       128
	XORWF       _cnt+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVF        _cnt+2, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVF        _cnt+1, 0 
	SUBLW       134
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVF        _cnt+0, 0 
	SUBLW       160
L__main22:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;RS485m.c,101 :: 		for (i = 1; i <= 4; i++) {  // Blink White LED  (Error in communication)
	MOVLW       1
	MOVWF       _i+0 
L_main15:
	MOVF        _i+0, 0 
	SUBLW       4
	BTFSS       STATUS+0, 0 
	GOTO        L_main16
;RS485m.c,102 :: 		PORTB = dat[i-1];
	DECF        _i+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _dat+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_dat+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;RS485m.c,103 :: 		PORTD.F2=1;
	BSF         PORTD+0, 2 
;RS485m.c,104 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	NOP
	NOP
;RS485m.c,105 :: 		PORTD.F2=0;
	BCF         PORTD+0, 2 
;RS485m.c,101 :: 		for (i = 1; i <= 4; i++) {  // Blink White LED  (Error in communication)
	INCF        _i+0, 1 
;RS485m.c,106 :: 		}
	GOTO        L_main15
L_main16:
;RS485m.c,107 :: 		cnt = 0;
	CLRF        _cnt+0 
	CLRF        _cnt+1 
	CLRF        _cnt+2 
	CLRF        _cnt+3 
;RS485m.c,108 :: 		RS485Master_Send(dat,1,50);    //   send message on broadcast address
	MOVLW       _dat+0
	MOVWF       FARG_RS485Master_Send_data_buffer+0 
	MOVLW       hi_addr(_dat+0)
	MOVWF       FARG_RS485Master_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Master_Send_datalen+0 
	MOVLW       50
	MOVWF       FARG_RS485Master_Send_slave_address+0 
	CALL        _RS485Master_Send+0, 0
;RS485m.c,109 :: 		}
L_main14:
;RS485m.c,110 :: 		}
	GOTO        L_main8
;RS485m.c,112 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
