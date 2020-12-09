
_interrupt:

;rs485s.c,11 :: 		void interrupt() {
;rs485s.c,12 :: 		RS485Slave_Receive(dat);
	MOVLW       _dat+0
	MOVWF       FARG_RS485Slave_Receive_data_buffer+0 
	MOVLW       hi_addr(_dat+0)
	MOVWF       FARG_RS485Slave_Receive_data_buffer+1 
	CALL        _RS485Slave_Receive+0, 0
;rs485s.c,13 :: 		}
L_end_interrupt:
L__interrupt14:
	RETFIE      1
; end of _interrupt

_main:

;rs485s.c,15 :: 		void main() {
;rs485s.c,18 :: 		ADCON1 = 0x0F ;
	MOVLW       15
	MOVWF       ADCON1+0 
;rs485s.c,28 :: 		PORTB = 0;
	CLRF        PORTB+0 
;rs485s.c,29 :: 		PORTC = 0;
	CLRF        PORTC+0 
;rs485s.c,33 :: 		TRISB = 0;
	CLRF        TRISB+0 
;rs485s.c,34 :: 		TRISC = 0;
	CLRF        TRISC+0 
;rs485s.c,40 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;rs485s.c,42 :: 		UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
	MOVLW       _UART1_Read+0
	MOVWF       FARG_UART_Set_Active_read_ptr+0 
	MOVLW       hi_addr(_UART1_Read+0)
	MOVWF       FARG_UART_Set_Active_read_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_read_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_read_ptr+3 
	MOVLW       _UART1_Write+0
	MOVWF       FARG_UART_Set_Active_write_ptr+0 
	MOVLW       hi_addr(_UART1_Write+0)
	MOVWF       FARG_UART_Set_Active_write_ptr+1 
	MOVLW       FARG_UART1_Write_data_+0
	MOVWF       FARG_UART_Set_Active_write_ptr+2 
	MOVLW       hi_addr(FARG_UART1_Write_data_+0)
	MOVWF       FARG_UART_Set_Active_write_ptr+3 
	MOVLW       _UART1_Data_Ready+0
	MOVWF       FARG_UART_Set_Active_ready_ptr+0 
	MOVLW       hi_addr(_UART1_Data_Ready+0)
	MOVWF       FARG_UART_Set_Active_ready_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_ready_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_ready_ptr+3 
	MOVLW       _UART1_Tx_Idle+0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+0 
	MOVLW       hi_addr(_UART1_Tx_Idle+0)
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+3 
	CALL        _UART_Set_Active+0, 0
;rs485s.c,43 :: 		RS485Slave_Init(160);              // Intialize MCU as slave, address 160
	MOVLW       160
	MOVWF       FARG_RS485Slave_Init_slave_address+0 
	CALL        _RS485Slave_Init+0, 0
;rs485s.c,47 :: 		dat[0] = 0xAA;
	MOVLW       170
	MOVWF       _dat+0 
;rs485s.c,48 :: 		dat[1] = 0xF0;
	MOVLW       240
	MOVWF       _dat+1 
;rs485s.c,49 :: 		dat[2] = 0x0F;
	MOVLW       15
	MOVWF       _dat+2 
;rs485s.c,50 :: 		dat[4] = 0;                          // ensure that message received flag is 0
	CLRF        _dat+4 
;rs485s.c,51 :: 		dat[5] = 0;                          // ensure that error flag is 0
	CLRF        _dat+5 
;rs485s.c,52 :: 		dat[6] = 0;
	CLRF        _dat+6 
;rs485s.c,54 :: 		RCIE_bit = 1;                      // enable interrupt on UART1 receive
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;rs485s.c,55 :: 		TXIE_bit = 0;                      // disable interrupt on UART1 transmit
	BCF         TXIE_bit+0, BitPos(TXIE_bit+0) 
;rs485s.c,56 :: 		PEIE_bit = 1;                      // enable peripheral interrupts
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;rs485s.c,57 :: 		GIE_bit = 1;                       // enable all interrupts
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;rs485s.c,66 :: 		for (i = 1; i <= 3; i++) {  // TEST LEDs
	MOVLW       1
	MOVWF       _i+0 
L_main0:
	MOVF        _i+0, 0 
	SUBLW       3
	BTFSS       STATUS+0, 0 
	GOTO        L_main1
;rs485s.c,68 :: 		PORTB.F2=1;
	BSF         PORTB+0, 2 
;rs485s.c,69 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
;rs485s.c,70 :: 		PORTB.F2=0;
	BCF         PORTB+0, 2 
;rs485s.c,72 :: 		PORTB.F3=1;
	BSF         PORTB+0, 3 
;rs485s.c,73 :: 		Delay_ms(50);
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
;rs485s.c,74 :: 		PORTB.F3=0;
	BCF         PORTB+0, 3 
;rs485s.c,76 :: 		PORTB.F4=1;
	BSF         PORTB+0, 4 
;rs485s.c,77 :: 		Delay_ms(50);
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
;rs485s.c,78 :: 		PORTB.F4=0;
	BCF         PORTB+0, 4 
;rs485s.c,66 :: 		for (i = 1; i <= 3; i++) {  // TEST LEDs
	INCF        _i+0, 1 
;rs485s.c,79 :: 		}
	GOTO        L_main0
L_main1:
;rs485s.c,81 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;rs485s.c,83 :: 		while (1) {
L_main7:
;rs485s.c,84 :: 		cnt++;
	MOVLW       1
	ADDWF       _cnt+0, 1 
	MOVLW       0
	ADDWFC      _cnt+1, 1 
	ADDWFC      _cnt+2, 1 
	ADDWFC      _cnt+3, 1 
;rs485s.c,85 :: 		if (dat[5])  {                     // if an error detected, signal it
	MOVF        _dat+5, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
;rs485s.c,87 :: 		PORTB.F2=1;
	BSF         PORTB+0, 2 
;rs485s.c,88 :: 		}
L_main9:
;rs485s.c,89 :: 		if (dat[4]) {                      // if message received successfully
	MOVF        _dat+4, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;rs485s.c,90 :: 		cnt = 0;
	CLRF        _cnt+0 
	CLRF        _cnt+1 
	CLRF        _cnt+2 
	CLRF        _cnt+3 
;rs485s.c,91 :: 		dat[4] = 0;                      // clear message received flag
	CLRF        _dat+4 
;rs485s.c,94 :: 		PORTB.F3=1;
	BSF         PORTB+0, 3 
;rs485s.c,95 :: 		Delay_ms(50);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
;rs485s.c,96 :: 		PORTB.F3=0;
	BCF         PORTB+0, 3 
;rs485s.c,99 :: 		dat[0] = dat[0]+1;                // increment message by one
	INCF        _dat+0, 1 
;rs485s.c,100 :: 		Delay_ms(1);
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       75
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
;rs485s.c,102 :: 		RS485Slave_Send(dat,1);     // send back to slave
	MOVLW       _dat+0
	MOVWF       FARG_RS485Slave_Send_data_buffer+0 
	MOVLW       hi_addr(_dat+0)
	MOVWF       FARG_RS485Slave_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Slave_Send_datalen+0 
	CALL        _RS485Slave_Send+0, 0
;rs485s.c,105 :: 		}
L_main10:
;rs485s.c,107 :: 		}
	GOTO        L_main7
;rs485s.c,109 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
