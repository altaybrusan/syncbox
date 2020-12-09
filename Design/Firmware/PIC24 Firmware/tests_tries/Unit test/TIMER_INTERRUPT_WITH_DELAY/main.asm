
_InitTimer1:
	LNK	#0

	MOV	#32800, W0
	MOV	WREG, T1CON
	BSET	T1IE_bit, BitPos(T1IE_bit+0)
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
	MOV	#4096, W1
	MOV	#lo_addr(IPC0), W0
	IOR	W1, [W0], [W0]
	MOV	#21875, W0
	MOV	WREG, PR1
L_end_InitTimer1:
	ULNK
	RETURN
; end of _InitTimer1

_Timer1Interrupt:
	LNK	#0
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	PUSH	W10
	BCLR	T1IF_bit, BitPos(T1IF_bit+0)
	MOV	#lo_addr(?lstr1_main), W10
	CALL	_UART3_Write_Text
L_end_Timer1Interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	ULNK
	RETFIE
; end of _Timer1Interrupt

_InitializePICSpeed:
	LNK	#0

	MOV	#70, W0
	MOV	WREG, PLLFBD
	CLR	CLKDIV
L_end_InitializePICSpeed:
	ULNK
	RETURN
; end of _InitializePICSpeed

_InitializePICPins:
	LNK	#0

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
L_end_InitializePICPins:
	ULNK
	RETURN
; end of _InitializePICPins

_InitializeUARTS:
	LNK	#0

	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS0:
	DEC	W7
	BRA NZ	L_InitializeUARTS0
	DEC	W8
	BRA NZ	L_InitializeUARTS0
	MOV.B	#36, W12
	MOV.B	#1, W11
	MOV.B	#108, W10
	CALL	_PPS_Mapping
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#109, W10
	CALL	_PPS_Mapping
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS2:
	DEC	W7
	BRA NZ	L_InitializeUARTS2
	DEC	W8
	BRA NZ	L_InitializeUARTS2
	MOV.B	#47, W12
	MOV.B	#1, W11
	MOV.B	#124, W10
	CALL	_PPS_Mapping
	MOV.B	#27, W12
	CLR	W11
	MOV.B	#125, W10
	CALL	_PPS_Mapping
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS4:
	DEC	W7
	BRA NZ	L_InitializeUARTS4
	DEC	W8
	BRA NZ	L_InitializeUARTS4
	MOV	#1, W13
	CLR	W12
	MOV	#9600, W10
	MOV	#0, W11
	CLR	W0
	PUSH	W0
	CALL	_UART1_Init_Advanced
	SUB	#2, W15
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS6:
	DEC	W7
	BRA NZ	L_InitializeUARTS6
	DEC	W8
	BRA NZ	L_InitializeUARTS6
	MOV	#1, W13
	CLR	W12
	MOV	#9600, W10
	MOV	#0, W11
	CLR	W0
	PUSH	W0
	CALL	_UART2_Init_Advanced
	SUB	#2, W15
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS8:
	DEC	W7
	BRA NZ	L_InitializeUARTS8
	DEC	W8
	BRA NZ	L_InitializeUARTS8
	MOV	#1, W13
	CLR	W12
	MOV	#9600, W10
	MOV	#0, W11
	CLR	W0
	PUSH	W0
	CALL	_UART3_Init_Advanced
	SUB	#2, W15
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS10:
	DEC	W7
	BRA NZ	L_InitializeUARTS10
	DEC	W8
	BRA NZ	L_InitializeUARTS10
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
	BSET	U2RXIE_bit, BitPos(U2RXIE_bit+0)
	BSET	U3RXIE_bit, BitPos(U3RXIE_bit+0)
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
	BCLR	U3RXIF_bit, BitPos(U3RXIF_bit+0)
L_end_InitializeUARTS:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _InitializeUARTS

_InitializeBuzzer:
	LNK	#0

	PUSH	W10
	PUSH	W11
	MOV	#3, W11
	MOV	#lo_addr(PORTD), W10
	CALL	_Sound_Init
L_end_InitializeBuzzer:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _InitializeBuzzer

_InitializeTimers:
	LNK	#0

	BSET	IPC0, #12
	BSET	IPC0, #13
	BSET	IPC0, #14
L_end_InitializeTimers:
	ULNK
	RETURN
; end of _InitializeTimers

_foo:
	LNK	#0

	MOV	#214, W8
	MOV	#40959, W7
L_foo12:
	DEC	W7
	BRA NZ	L_foo12
	DEC	W8
	BRA NZ	L_foo12
	NOP
	NOP
	NOP
L_end_foo:
	ULNK
	RETURN
; end of _foo

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68
	LNK	#0

	PUSH	W10
	PUSH	W11
	CALL	_InitializePICSpeed
	CALL	_InitializeUARTS
	CALL	_InitializeBuzzer
	CALL	_InitializeTimers
	MOV	#100, W11
	MOV	#1600, W10
	CALL	_Sound_Play
	CALL	_InitTimer1
	CALL	_foo
L_main14:
	GOTO	L_main14
L_end_main:
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
