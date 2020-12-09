
_interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	PUSH	W10
	MOV	#lo_addr(_dat), W10
	CALL	_RS485Slave_Receive
	MOV	#lo_addr(?lstr_1_main), W10
	CALL	_UART1_Write
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
L_end_interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _interrupt

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#70, W0
	MOV	WREG, PLLFBD
	CLR	CLKDIV
	CLR	ANSELA
	CLR	ANSELB
	CLR	ANSELC
	CLR	ANSELD
	CLR	ANSELE
	CLR	ANSELG
	CLR	PORTA
	CLR	PORTB
	CLR	PORTC
	CLR	PORTE
	CLR	PORTF
	CLR	PORTG
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#124, W10
	CALL	_PPS_Mapping
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#125, W10
	CALL	_PPS_Mapping
	MOV.B	#36, W12
	MOV.B	#1, W11
	MOV.B	#68, W10
	CALL	_PPS_Mapping
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#69, W10
	CALL	_PPS_Mapping
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
	MOV	#22, W8
	MOV	#23756, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART2_Init
	MOV	#22, W8
	MOV	#23756, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
	NOP
	MOV.B	#160, W10
	CALL	_RS485Slave_Init
	MOV	#lo_addr(_dat), W1
	MOV.B	#170, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_dat+1), W1
	MOV.B	#240, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_dat+2), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_dat+4), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_dat+5), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_dat+6), W1
	CLR	W0
	MOV.B	W0, [W1]
	BSET	NSTDIS_bit, BitPos(NSTDIS_bit+0)
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
	BSET	U2RXIE_bit, BitPos(U2RXIE_bit+0)
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	MOV	#lo_addr(?lstr2_main), W10
	CALL	_UART1_Write_Text
	MOV	#lo_addr(_UART2_Tx_Idle), W13
	MOV	#lo_addr(_UART2_Data_Ready), W12
	MOV	#lo_addr(_UART2_Write), W11
	MOV	#lo_addr(_UART2_Read), W10
	CALL	_UART_Set_Active
L_main4:
	MOV	#lo_addr(_dat+5), W0
	CP0.B	[W0]
	BRA NZ	L__main13
	GOTO	L_main6
L__main13:
	MOV	#lo_addr(?lstr_3_main), W10
	CALL	_UART1_Write
L_main6:
	MOV	#lo_addr(_dat+4), W0
	CP0.B	[W0]
	BRA NZ	L__main14
	GOTO	L_main7
L__main14:
	MOV	#lo_addr(_dat+4), W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_dat+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LEU	L__main15
	GOTO	L_main8
L__main15:
	MOV	#lo_addr(_dat), W0
	MOV	#lo_addr(__byte1Val), W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
	MOV	#lo_addr(?lstr4_main), W10
	CALL	_UART1_Write_Text
	MOV	#lo_addr(__byte1Val), W10
	CALL	_UART1_Write
L_main8:
	MOV	#lo_addr(_dat+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA LEU	L__main16
	GOTO	L_main9
L__main16:
	MOV	#lo_addr(_dat+1), W0
	MOV	#lo_addr(__byte2Val), W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
	MOV	#lo_addr(?lstr5_main), W10
	CALL	_UART1_Write_Text
	MOV	#lo_addr(__byte2Val), W10
	CALL	_UART1_Write
L_main9:
	MOV	#lo_addr(_dat+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA LEU	L__main17
	GOTO	L_main10
L__main17:
	MOV	#lo_addr(_dat+2), W0
	MOV	#lo_addr(__byte3Val), W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
	MOV	#lo_addr(?lstr6_main), W10
	CALL	_UART1_Write_Text
	MOV	#lo_addr(__byte3Val), W10
	CALL	_UART1_Write
L_main10:
	MOV.B	#1, W1
	MOV	#lo_addr(_dat), W0
	ADD.B	W1, [W0], [W0]
	MOV.B	#1, W11
	MOV	#lo_addr(_dat), W10
	CALL	_RS485Slave_Send
L_main7:
	GOTO	L_main4
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
