
_InitializeHeap:

	CALL	_MM_Init
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeHeap0:
	DEC	W7
	BRA NZ	L_InitializeHeap0
	DEC	W8
	BRA NZ	L_InitializeHeap0
L_end_InitializeHeap:
	RETURN
; end of _InitializeHeap

_InitializePICSpeed:

	MOV	#70, W0
	MOV	WREG, PLLFBD
	CLR	CLKDIV
L_end_InitializePICSpeed:
	RETURN
; end of _InitializePICSpeed

_InitializePICPins:

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
	RETURN
; end of _InitializePICPins

_InitializeUARTS:

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
L_InitializeUARTS2:
	DEC	W7
	BRA NZ	L_InitializeUARTS2
	DEC	W8
	BRA NZ	L_InitializeUARTS2
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
L_InitializeUARTS4:
	DEC	W7
	BRA NZ	L_InitializeUARTS4
	DEC	W8
	BRA NZ	L_InitializeUARTS4
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
L_InitializeUARTS6:
	DEC	W7
	BRA NZ	L_InitializeUARTS6
	DEC	W8
	BRA NZ	L_InitializeUARTS6
	MOV.B	#49, W12
	MOV.B	#1, W11
	MOV.B	#112, W10
	CALL	_PPS_Mapping
	MOV.B	#29, W12
	CLR	W11
	MOV.B	#113, W10
	CALL	_PPS_Mapping
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS8:
	DEC	W7
	BRA NZ	L_InitializeUARTS8
	DEC	W8
	BRA NZ	L_InitializeUARTS8
	CLR	W13
	CLR	W12
	MOV	#9600, W10
	MOV	#0, W11
	CLR	W0
	PUSH	W0
	CALL	_UART1_Init_Advanced
	SUB	#2, W15
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS10:
	DEC	W7
	BRA NZ	L_InitializeUARTS10
	DEC	W8
	BRA NZ	L_InitializeUARTS10
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
L_InitializeUARTS12:
	DEC	W7
	BRA NZ	L_InitializeUARTS12
	DEC	W8
	BRA NZ	L_InitializeUARTS12
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
L_InitializeUARTS14:
	DEC	W7
	BRA NZ	L_InitializeUARTS14
	DEC	W8
	BRA NZ	L_InitializeUARTS14
	MOV	#1, W13
	CLR	W12
	MOV	#9600, W10
	MOV	#0, W11
	MOV	#1, W0
	PUSH	W0
	CALL	_UART4_Init_Advanced
	SUB	#2, W15
	MOV	#43, W8
	MOV	#47513, W7
L_InitializeUARTS16:
	DEC	W7
	BRA NZ	L_InitializeUARTS16
	DEC	W8
	BRA NZ	L_InitializeUARTS16
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
	BSET	U2RXIE_bit, BitPos(U2RXIE_bit+0)
	BSET	U3RXIE_bit, BitPos(U3RXIE_bit+0)
	BSET	U4RXIE_bit, BitPos(U4RXIE_bit+0)
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
	BCLR	U3RXIF_bit, BitPos(U3RXIF_bit+0)
	BCLR	U4RXIF_bit, BitPos(U4RXIF_bit+0)
L_end_InitializeUARTS:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _InitializeUARTS

_PrioritizeInterrupts:

	BCLR	IPC6, #14
	BCLR	IPC6, #13
	BSET	IPC6, #12
	BCLR	IPC7, #2
	BCLR	IPC7, #1
	BSET	IPC7, #0
	BCLR	IPC1, #14
	BCLR	IPC1, #13
	BSET	IPC1, #12
	BCLR	IPC2, #2
	BCLR	IPC2, #1
	BSET	IPC2, #0
L_end_PrioritizeInterrupts:
	RETURN
; end of _PrioritizeInterrupts

_InitializeBuzzer:

	PUSH	W10
	PUSH	W11
	MOV	#3, W11
	MOV	#lo_addr(PORTD), W10
	CALL	_Sound_Init
L_end_InitializeBuzzer:
	POP	W11
	POP	W10
	RETURN
; end of _InitializeBuzzer

_InitializeTimers:

	BSET	IPC0, #12
	BSET	IPC0, #13
	BSET	IPC0, #14
L_end_InitializeTimers:
	RETURN
; end of _InitializeTimers

_KL_ClearKernelMemory:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#30, W12
	CLR	W11
	MOV	#lo_addr(__uart1AccBuf), W10
	CALL	_memset
	MOV	#30, W12
	CLR	W11
	MOV	#lo_addr(__uart2AccBuf), W10
	CALL	_memset
	MOV	#30, W12
	CLR	W11
	MOV	#lo_addr(__uart3AccBuf), W10
	CALL	_memset
	MOV	#30, W12
	CLR	W11
	MOV	#lo_addr(__uart4AccBuf), W10
	CALL	_memset
; idx start address is: 6 (W3)
	CLR	W3
; idx end address is: 6 (W3)
L_KL_ClearKernelMemory18:
; idx start address is: 6 (W3)
	MOV	#35, W0
	CP	W3, W0
	BRA LT	L__KL_ClearKernelMemory242
	GOTO	L_KL_ClearKernelMemory19
L__KL_ClearKernelMemory242:
	SL	W3, #5, W1
	MOV	#lo_addr(Kernel_genSendBuf), W0
	ADD	W0, W1, W0
	MOV	#30, W12
	CLR	W11
	MOV	W0, W10
	CALL	_memset
	SL	W3, #5, W1
	MOV	#lo_addr(Kernel_genSendBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W1
	CLR	W0
	MOV	W0, [W1]
	SL	W3, #5, W1
	MOV	#lo_addr(_actSendBuf), W0
	ADD	W0, W1, W0
	MOV	#30, W12
	CLR	W11
	MOV	W0, W10
	CALL	_memset
	SL	W3, #5, W1
	MOV	#lo_addr(_actSendBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W1
	CLR	W0
	MOV	W0, [W1]
	SL	W3, #5, W1
	MOV	#lo_addr(Kernel_wrkSendBuf), W0
	ADD	W0, W1, W0
	MOV	#30, W12
	CLR	W11
	MOV	W0, W10
	CALL	_memset
	SL	W3, #5, W1
	MOV	#lo_addr(Kernel_wrkSendBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W1
	CLR	W0
	MOV	W0, [W1]
	SL	W3, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	MOV	#30, W12
	CLR	W11
	MOV	W0, W10
	CALL	_memset
	SL	W3, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W1
	CLR	W0
	MOV	W0, [W1]
	SL	W3, #3, W1
	MOV	#lo_addr(Kernel_Uart1ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	CLR	W0
	MOV	W0, [W1]
	SL	W3, #3, W1
	MOV	#lo_addr(Kernel_Uart4ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	CLR	W0
	MOV	W0, [W1]
	INC	W3
; idx end address is: 6 (W3)
	GOTO	L_KL_ClearKernelMemory18
L_KL_ClearKernelMemory19:
L_end_KL_ClearKernelMemory:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _KL_ClearKernelMemory

_KL_CallSlotHandler:
	LNK	#0

; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_KL_CallSlotHandler21:
; i start address is: 4 (W2)
	CP	W2, #9
	BRA LE	L__KL_CallSlotHandler244
	GOTO	L_KL_CallSlotHandler22
L__KL_CallSlotHandler244:
	SL	W2, #2, W1
	MOV	#lo_addr(__SLOTS), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W1
	SUB	W14, #13, W0
	CP.B	W1, [W0]
	BRA Z	L__KL_CallSlotHandler245
	GOTO	L_KL_CallSlotHandler24
L__KL_CallSlotHandler245:
	SL	W2, #2, W1
; i end address is: 4 (W2)
	MOV	#lo_addr(__SLOTS), W0
	ADD	W0, W1, W0
	INC2	W0
	MOV	[W0], W1
	SUB	W14, #14, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	W1
	SUB	#8, W15
	GOTO	L_KL_CallSlotHandler22
L_KL_CallSlotHandler24:
; i start address is: 4 (W2)
	INC	W2
; i end address is: 4 (W2)
	GOTO	L_KL_CallSlotHandler21
L_KL_CallSlotHandler22:
L_end_KL_CallSlotHandler:
	ULNK
	RETURN
; end of _KL_CallSlotHandler

_KL_StartDispacherEngine:

	CLR	T2CON
	CLR	T3CON
	CLR	TMR2
	CLR	TMR3
	BSET	T3IE_bit, BitPos(T3IE_bit+0)
	BCLR	T3IF_bit, BitPos(T3IF_bit+0)
	BSET	T3IP_0_bit, BitPos(T3IP_0_bit+0)
	BSET	T3IP_1_bit, BitPos(T3IP_1_bit+0)
	BSET	T3IP_2_bit, BitPos(T3IP_2_bit+0)
	MOV	#106, W0
	MOV	WREG, PR3
	MOV	#53290, W0
	MOV	WREG, PR2
	BSET	T2CONbits, #15
	BSET	T2CONbits, #3
L_end_KL_StartDispacherEngine:
	RETURN
; end of _KL_StartDispacherEngine

_KL_DistributeFrames:

	PUSH	W10
	PUSH	W11
	PUSH	W12
; _index start address is: 8 (W4)
	CLR	W4
	MOV	#lo_addr(_genSendMutex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__KL_DistributeFrames248
	GOTO	L__KL_DistributeFrames213
L__KL_DistributeFrames248:
	MOV	_genSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_genSendBuf), W0
	ADD	W0, W1, W1
	ADD	W1, #30, W0
; xLen start address is: 4 (W2)
	MOV	W0, W2
; xPtr start address is: 6 (W3)
	MOV	W1, W3
	MOV	[W0], W0
	CP	W0, #0
	BRA Z	L__KL_DistributeFrames249
	GOTO	L_KL_DistributeFrames26
L__KL_DistributeFrames249:
	MOV	W3, W10
	CALL	_strlen
	CP	W0, #0
	BRA NZ	L__KL_DistributeFrames250
	GOTO	L__KL_DistributeFrames212
L__KL_DistributeFrames250:
; _index end address is: 8 (W4)
	MOV	#lo_addr(?lstr1_Kernel), W10
	CALL	_UART3_Write_Text
; _index start address is: 8 (W4)
	CLR	W4
; xLen end address is: 4 (W2)
; xPtr end address is: 6 (W3)
; _index end address is: 8 (W4)
	MOV	W2, W5
L_KL_DistributeFrames28:
; _index start address is: 8 (W4)
; xPtr start address is: 6 (W3)
; xLen start address is: 10 (W5)
	ADD	W3, W4, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__KL_DistributeFrames251
	GOTO	L_KL_DistributeFrames29
L__KL_DistributeFrames251:
	ADD	W3, W4, W0
	ZE	[W0], W10
	CALL	_UART3_Write
	ADD	W3, W4, W0
	ZE	[W0], W10
	CALL	_UART1_Write
	INC	W4
	GOTO	L_KL_DistributeFrames28
L_KL_DistributeFrames29:
	MOV	#29, W12
	CLR	W11
	MOV	W3, W10
; xPtr end address is: 6 (W3)
	CALL	_memset
	CLR	W0
	MOV	W0, [W5]
; xLen end address is: 10 (W5)
	MOV	#34, W1
	MOV	#lo_addr(_genSndRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames252
	GOTO	L__KL_DistributeFrames197
L__KL_DistributeFrames252:
	MOV	_genSndRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames253
	GOTO	L__KL_DistributeFrames196
L__KL_DistributeFrames253:
	GOTO	L_KL_DistributeFrames32
L__KL_DistributeFrames197:
L__KL_DistributeFrames196:
	CLR	W0
	MOV	W0, _genSndRdPtr
	GOTO	L_KL_DistributeFrames33
L_KL_DistributeFrames32:
	MOV	#1, W1
	MOV	#lo_addr(_genSndRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames33:
	MOV	W4, W0
	GOTO	L_KL_DistributeFrames27
; _index end address is: 8 (W4)
L__KL_DistributeFrames212:
	MOV	W4, W0
L_KL_DistributeFrames27:
; _index start address is: 0 (W0)
	MOV	W0, W3
; _index end address is: 0 (W0)
	GOTO	L_KL_DistributeFrames34
L_KL_DistributeFrames26:
; xPtr start address is: 6 (W3)
; xLen start address is: 4 (W2)
	MOV	#lo_addr(?lstr2_Kernel), W10
	CALL	_UART3_Write_Text
; _index start address is: 0 (W0)
	CLR	W0
; xLen end address is: 4 (W2)
; xPtr end address is: 6 (W3)
; _index end address is: 0 (W0)
	MOV	W2, W5
	MOV	W3, W4
	MOV	W0, W3
L_KL_DistributeFrames35:
; _index start address is: 6 (W3)
; xPtr start address is: 8 (W4)
; xLen start address is: 10 (W5)
	MOV	[W5], W0
	CP	W3, W0
	BRA LE	L__KL_DistributeFrames254
	GOTO	L_KL_DistributeFrames36
L__KL_DistributeFrames254:
	ADD	W4, W3, W0
	ZE	[W0], W10
	CALL	_UART3_Write
	ADD	W4, W3, W0
	ZE	[W0], W10
	CALL	_UART1_Write
	INC	W3
	GOTO	L_KL_DistributeFrames35
L_KL_DistributeFrames36:
	MOV	#29, W12
	CLR	W11
	MOV	W4, W10
; xPtr end address is: 8 (W4)
	CALL	_memset
	CLR	W0
	MOV	W0, [W5]
; xLen end address is: 10 (W5)
	MOV	#34, W1
	MOV	#lo_addr(_genSndRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames255
	GOTO	L__KL_DistributeFrames199
L__KL_DistributeFrames255:
	MOV	_genSndRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames256
	GOTO	L__KL_DistributeFrames198
L__KL_DistributeFrames256:
	GOTO	L_KL_DistributeFrames39
L__KL_DistributeFrames199:
L__KL_DistributeFrames198:
	CLR	W0
	MOV	W0, _genSndRdPtr
	GOTO	L_KL_DistributeFrames40
L_KL_DistributeFrames39:
	MOV	#1, W1
	MOV	#lo_addr(_genSndRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames40:
L_KL_DistributeFrames34:
; _index end address is: 6 (W3)
; _index start address is: 6 (W3)
; _index end address is: 6 (W3)
	GOTO	L_KL_DistributeFrames25
L__KL_DistributeFrames213:
	MOV	W4, W3
L_KL_DistributeFrames25:
; _index start address is: 6 (W3)
	MOV	#lo_addr(_actMutex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__KL_DistributeFrames257
	GOTO	L__KL_DistributeFrames215
L__KL_DistributeFrames257:
	MOV	_actSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(_actSendBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W2
; xLen start address is: 8 (W4)
	MOV	W2, W4
	MOV	_actSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(_actSendBuf), W0
; xPtr start address is: 10 (W5)
	ADD	W0, W1, W5
	MOV	[W2], W0
	CP	W0, #0
	BRA Z	L__KL_DistributeFrames258
	GOTO	L_KL_DistributeFrames42
L__KL_DistributeFrames258:
	MOV	W5, W10
	CALL	_strlen
	CP	W0, #0
	BRA NZ	L__KL_DistributeFrames259
	GOTO	L__KL_DistributeFrames214
L__KL_DistributeFrames259:
	MOV	#lo_addr(?lstr3_Kernel), W10
	CALL	_UART3_Write_Text
; xPtr end address is: 10 (W5)
; xLen end address is: 8 (W4)
; _index end address is: 6 (W3)
L_KL_DistributeFrames44:
; xPtr start address is: 10 (W5)
; xLen start address is: 8 (W4)
; _index start address is: 6 (W3)
	ADD	W5, W3, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__KL_DistributeFrames260
	GOTO	L_KL_DistributeFrames45
L__KL_DistributeFrames260:
	ADD	W5, W3, W0
	ZE	[W0], W10
	CALL	_UART3_Write
	ADD	W5, W3, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC	W3
	GOTO	L_KL_DistributeFrames44
L_KL_DistributeFrames45:
	MOV	#29, W12
	CLR	W11
	MOV	W5, W10
; xPtr end address is: 10 (W5)
	CALL	_memset
	CLR	W0
	MOV	W0, [W4]
; xLen end address is: 8 (W4)
	MOV	#34, W1
	MOV	#lo_addr(_actSndRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames261
	GOTO	L__KL_DistributeFrames201
L__KL_DistributeFrames261:
	MOV	_actSndRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames262
	GOTO	L__KL_DistributeFrames200
L__KL_DistributeFrames262:
	GOTO	L_KL_DistributeFrames48
L__KL_DistributeFrames201:
L__KL_DistributeFrames200:
	CLR	W0
	MOV	W0, _actSndRdPtr
	GOTO	L_KL_DistributeFrames49
L_KL_DistributeFrames48:
	MOV	#1, W1
	MOV	#lo_addr(_actSndRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames49:
	MOV	W3, W0
	GOTO	L_KL_DistributeFrames43
; _index end address is: 6 (W3)
L__KL_DistributeFrames214:
	MOV	W3, W0
L_KL_DistributeFrames43:
; _index start address is: 0 (W0)
	MOV	W0, W2
; _index end address is: 0 (W0)
	GOTO	L_KL_DistributeFrames50
L_KL_DistributeFrames42:
; xLen start address is: 8 (W4)
; xPtr start address is: 10 (W5)
	MOV	#lo_addr(?lstr4_Kernel), W10
	CALL	_UART3_Write_Text
; _index start address is: 6 (W3)
	CLR	W3
; xPtr end address is: 10 (W5)
; xLen end address is: 8 (W4)
; _index end address is: 6 (W3)
	PUSH	W5
	MOV	W4, W5
	POP	W4
L_KL_DistributeFrames51:
; _index start address is: 6 (W3)
; xPtr start address is: 8 (W4)
; xLen start address is: 10 (W5)
	MOV	[W5], W0
	CP	W3, W0
	BRA LT	L__KL_DistributeFrames263
	GOTO	L_KL_DistributeFrames52
L__KL_DistributeFrames263:
	ADD	W4, W3, W0
	ZE	[W0], W10
	CALL	_UART3_Write
	ADD	W4, W3, W0
	ZE	[W0], W10
	CALL	_UART2_Write
	INC	W3
	GOTO	L_KL_DistributeFrames51
L_KL_DistributeFrames52:
	MOV	#29, W12
	CLR	W11
	MOV	W4, W10
; xPtr end address is: 8 (W4)
	CALL	_memset
	CLR	W0
	MOV	W0, [W5]
; xLen end address is: 10 (W5)
	MOV	#34, W1
	MOV	#lo_addr(_actSndRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames264
	GOTO	L__KL_DistributeFrames203
L__KL_DistributeFrames264:
	MOV	_actSndRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames265
	GOTO	L__KL_DistributeFrames202
L__KL_DistributeFrames265:
	GOTO	L_KL_DistributeFrames55
L__KL_DistributeFrames203:
L__KL_DistributeFrames202:
	CLR	W0
	MOV	W0, _actSndRdPtr
	GOTO	L_KL_DistributeFrames56
L_KL_DistributeFrames55:
	MOV	#1, W1
	MOV	#lo_addr(_actSndRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames56:
	MOV	W3, W2
L_KL_DistributeFrames50:
; _index end address is: 6 (W3)
; _index start address is: 4 (W2)
; _index end address is: 4 (W2)
	GOTO	L_KL_DistributeFrames41
L__KL_DistributeFrames215:
	MOV	W3, W2
L_KL_DistributeFrames41:
; _index start address is: 4 (W2)
	MOV	#lo_addr(_disMutex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__KL_DistributeFrames266
	GOTO	L_KL_DistributeFrames57
L__KL_DistributeFrames266:
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA Z	L__KL_DistributeFrames267
	GOTO	L_KL_DistributeFrames58
L__KL_DistributeFrames267:
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	MOV	W0, W10
	CALL	_strlen
	CP	W0, #0
	BRA NZ	L__KL_DistributeFrames268
	GOTO	L_KL_DistributeFrames59
L__KL_DistributeFrames268:
	MOV	#lo_addr(?lstr5_Kernel), W10
	CALL	_UART3_Write_Text
; _index end address is: 4 (W2)
L_KL_DistributeFrames60:
; _index start address is: 4 (W2)
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, W2, W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__KL_DistributeFrames269
	GOTO	L_KL_DistributeFrames61
L__KL_DistributeFrames269:
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, W2, W0
	ZE	[W0], W10
	CALL	_UART3_Write
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, W2, W0
	ZE	[W0], W10
	CALL	_UART4_Write
	INC	W2
; _index end address is: 4 (W2)
	GOTO	L_KL_DistributeFrames60
L_KL_DistributeFrames61:
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	MOV	#30, W12
	CLR	W11
	MOV	W0, W10
	CALL	_memset
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(_actSendBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W1
	CLR	W0
	MOV	W0, [W1]
	MOV	#34, W1
	MOV	#lo_addr(_disSndRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames270
	GOTO	L__KL_DistributeFrames205
L__KL_DistributeFrames270:
	MOV	_disSndRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames271
	GOTO	L__KL_DistributeFrames204
L__KL_DistributeFrames271:
	GOTO	L_KL_DistributeFrames64
L__KL_DistributeFrames205:
L__KL_DistributeFrames204:
	CLR	W0
	MOV	W0, _disSndRdPtr
	GOTO	L_KL_DistributeFrames65
L_KL_DistributeFrames64:
	MOV	#1, W1
	MOV	#lo_addr(_disSndRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames65:
L_KL_DistributeFrames59:
	GOTO	L_KL_DistributeFrames66
L_KL_DistributeFrames58:
	MOV	#lo_addr(?lstr6_Kernel), W10
	CALL	_UART3_Write_Text
; _index start address is: 4 (W2)
	CLR	W2
; _index end address is: 4 (W2)
L_KL_DistributeFrames67:
; _index start address is: 4 (W2)
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W0
	MOV	[W0], W0
	CP	W2, W0
	BRA LT	L__KL_DistributeFrames272
	GOTO	L_KL_DistributeFrames68
L__KL_DistributeFrames272:
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, W2, W0
	ZE	[W0], W10
	CALL	_UART3_Write
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, W2, W0
	ZE	[W0], W10
	CALL	_UART4_Write
	INC	W2
; _index end address is: 4 (W2)
	GOTO	L_KL_DistributeFrames67
L_KL_DistributeFrames68:
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	MOV	#30, W12
	CLR	W11
	MOV	W0, W10
	CALL	_memset
	MOV	_disSndRdPtr, W0
	SL	W0, #5, W1
	MOV	#lo_addr(Kernel_disSndBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #30, W1
	CLR	W0
	MOV	W0, [W1]
	MOV	#34, W1
	MOV	#lo_addr(_disSndRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames273
	GOTO	L__KL_DistributeFrames207
L__KL_DistributeFrames273:
	MOV	_disSndRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames274
	GOTO	L__KL_DistributeFrames206
L__KL_DistributeFrames274:
	GOTO	L_KL_DistributeFrames71
L__KL_DistributeFrames207:
L__KL_DistributeFrames206:
	CLR	W0
	MOV	W0, _disSndRdPtr
	GOTO	L_KL_DistributeFrames72
L_KL_DistributeFrames71:
	MOV	#1, W1
	MOV	#lo_addr(_disSndRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames72:
L_KL_DistributeFrames66:
L_KL_DistributeFrames57:
	MOV	#lo_addr(_uart1ReceiveMutex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__KL_DistributeFrames275
	GOTO	L_KL_DistributeFrames73
L__KL_DistributeFrames275:
	MOV	_Uart1RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart1ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA NZ	L__KL_DistributeFrames276
	GOTO	L_KL_DistributeFrames74
L__KL_DistributeFrames276:
	MOV	_Uart1RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart1ReceiveBuf), W0
	ADD	W0, W1, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	_KL_CallSlotHandler
	SUB	#8, W15
	MOV	_Uart1RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart1ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	ADD	W0, #4, W0
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_Free
	MOV	_Uart1RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart1ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	CLR	W0
	MOV	W0, [W1]
	MOV	#34, W1
	MOV	#lo_addr(_Uart1RcivBufRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames277
	GOTO	L__KL_DistributeFrames209
L__KL_DistributeFrames277:
	MOV	_Uart1RcivBufRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames278
	GOTO	L__KL_DistributeFrames208
L__KL_DistributeFrames278:
	GOTO	L_KL_DistributeFrames77
L__KL_DistributeFrames209:
L__KL_DistributeFrames208:
	CLR	W0
	MOV	W0, _Uart1RcivBufRdPtr
	GOTO	L_KL_DistributeFrames78
L_KL_DistributeFrames77:
	MOV	#1, W1
	MOV	#lo_addr(_Uart1RcivBufRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames78:
L_KL_DistributeFrames74:
L_KL_DistributeFrames73:
	MOV	#lo_addr(_uart4ReceiveMutex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__KL_DistributeFrames279
	GOTO	L_KL_DistributeFrames79
L__KL_DistributeFrames279:
	MOV	_Uart4RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart4ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA NZ	L__KL_DistributeFrames280
	GOTO	L_KL_DistributeFrames80
L__KL_DistributeFrames280:
	MOV	_Uart4RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart4ReceiveBuf), W0
	ADD	W0, W1, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	_KL_CallSlotHandler
	SUB	#8, W15
	MOV	_Uart4RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart4ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	ADD	W0, #4, W0
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_Free
	MOV	_Uart4RcivBufRdPtr, W0
	SL	W0, #3, W1
	MOV	#lo_addr(Kernel_Uart4ReceiveBuf), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	CLR	W0
	MOV	W0, [W1]
	MOV	#34, W1
	MOV	#lo_addr(_Uart4RcivBufRdPtr), W0
	CP	W1, [W0]
	BRA NZ	L__KL_DistributeFrames281
	GOTO	L__KL_DistributeFrames211
L__KL_DistributeFrames281:
	MOV	_Uart4RcivBufRdPtr, W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__KL_DistributeFrames282
	GOTO	L__KL_DistributeFrames210
L__KL_DistributeFrames282:
	GOTO	L_KL_DistributeFrames83
L__KL_DistributeFrames211:
L__KL_DistributeFrames210:
	CLR	W0
	MOV	W0, _Uart4RcivBufRdPtr
	GOTO	L_KL_DistributeFrames84
L_KL_DistributeFrames83:
	MOV	#1, W1
	MOV	#lo_addr(_Uart4RcivBufRdPtr), W0
	ADD	W1, [W0], [W0]
L_KL_DistributeFrames84:
L_KL_DistributeFrames80:
L_KL_DistributeFrames79:
L_end_KL_DistributeFrames:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _KL_DistributeFrames

_EnqueueFrameIntoSendBuffer:

	PUSH	W10
	PUSH	W11
	ADD	W11, #6, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA Z	L__EnqueueFrameIntoSendBuffer284
	GOTO	L_EnqueueFrameIntoSendBuffer85
L__EnqueueFrameIntoSendBuffer284:
	MOV.B	#1, W0
	MOV.B	W0, [W13]
	ADD	W11, #4, W1
	MOV	[W12], W0
	SL	W0, #5, W0
	ADD	W10, W0, W0
	MOV	[W1], W11
	MOV	W0, W10
	CALL	_strcpy
	CLR	W0
	MOV.B	W0, [W13]
	GOTO	L_EnqueueFrameIntoSendBuffer86
L_EnqueueFrameIntoSendBuffer85:
	MOV.B	#1, W0
	MOV.B	W0, [W13]
	ADD	W11, #6, W2
	ADD	W11, #4, W1
	MOV	[W12], W0
	SL	W0, #5, W0
	ADD	W10, W0, W0
	PUSH	W12
	PUSH.D	W10
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	W0, W10
	CALL	_memcpy
	POP.D	W10
	POP	W12
	MOV	[W12], W0
	SL	W0, #5, W0
	ADD	W10, W0, W0
	ADD	W0, #30, W1
	ADD	W11, #6, W0
	MOV	[W0], [W1]
	CLR	W0
	MOV.B	W0, [W13]
L_EnqueueFrameIntoSendBuffer86:
	MOV	[W12], W1
	MOV	#34, W0
	CP	W1, W0
	BRA NZ	L__EnqueueFrameIntoSendBuffer285
	GOTO	L__EnqueueFrameIntoSendBuffer218
L__EnqueueFrameIntoSendBuffer285:
	MOV	[W12], W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__EnqueueFrameIntoSendBuffer286
	GOTO	L__EnqueueFrameIntoSendBuffer217
L__EnqueueFrameIntoSendBuffer286:
	GOTO	L_EnqueueFrameIntoSendBuffer89
L__EnqueueFrameIntoSendBuffer218:
L__EnqueueFrameIntoSendBuffer217:
	CLR	W0
	MOV	W0, [W12]
	GOTO	L_EnqueueFrameIntoSendBuffer90
L_EnqueueFrameIntoSendBuffer89:
	MOV	[W12], W0
	INC	W0
	MOV	W0, [W12]
L_EnqueueFrameIntoSendBuffer90:
	MOV	#14000, W7
L_EnqueueFrameIntoSendBuffer91:
	DEC	W7
	BRA NZ	L_EnqueueFrameIntoSendBuffer91
	NOP
	NOP
L_end_EnqueueFrameIntoSendBuffer:
	POP	W11
	POP	W10
	RETURN
; end of _EnqueueFrameIntoSendBuffer

_EnqueueFrameIntoReceiveBuffer:
	LNK	#2

	MOV.B	#1, W0
	MOV.B	W0, [W13]
	MOV	[W12], W0
	SL	W0, #3, W0
	ADD	W10, W0, W0
	ADD	W0, #4, W0
	MOV	W0, [W14+0]
	ADD	W11, #6, W0
	MOV	[W0], W0
	INC	W0
	PUSH	W10
	MOV	W0, W10
	CALL	_Malloc
	POP	W10
	MOV	[W14+0], W1
	MOV	W0, [W1]
	ADD	W11, #6, W2
	ADD	W11, #4, W1
	MOV	[W12], W0
	SL	W0, #3, W0
	ADD	W10, W0, W0
	ADD	W0, #4, W0
	PUSH	W12
	PUSH.D	W10
	MOV	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_memcpy
	POP.D	W10
	POP	W12
	MOV	[W12], W0
	SL	W0, #3, W0
	ADD	W10, W0, W0
	ADD	W0, #6, W1
	ADD	W11, #6, W0
	MOV	[W0], [W1]
	MOV	[W12], W0
	SL	W0, #3, W0
	ADD	W10, W0, W0
	ADD	W0, #1, W1
	ADD	W11, #1, W0
	MOV.B	[W0], [W1]
	MOV	[W12], W0
	SL	W0, #3, W0
	ADD	W10, W0, W0
	ADD	W0, #2, W1
	ADD	W11, #2, W0
	MOV.B	[W0], [W1]
	MOV	[W12], W0
	SL	W0, #3, W0
	ADD	W10, W0, W0
	ADD	W0, #4, W1
	ADD	W11, #6, W0
	MOV	[W0], W0
	ADD	W0, [W1], W1
	CLR	W0
	MOV.B	W0, [W1]
	CLR	W0
	MOV.B	W0, [W13]
	MOV	[W12], W1
	MOV	#34, W0
	CP	W1, W0
	BRA NZ	L__EnqueueFrameIntoReceiveBuffer288
	GOTO	L__EnqueueFrameIntoReceiveBuffer221
L__EnqueueFrameIntoReceiveBuffer288:
	MOV	[W12], W1
	MOV	#35, W0
	CP	W1, W0
	BRA LT	L__EnqueueFrameIntoReceiveBuffer289
	GOTO	L__EnqueueFrameIntoReceiveBuffer220
L__EnqueueFrameIntoReceiveBuffer289:
	GOTO	L_EnqueueFrameIntoReceiveBuffer95
L__EnqueueFrameIntoReceiveBuffer221:
L__EnqueueFrameIntoReceiveBuffer220:
	CLR	W0
	MOV	W0, [W12]
	GOTO	L_EnqueueFrameIntoReceiveBuffer96
L_EnqueueFrameIntoReceiveBuffer95:
	MOV	[W12], W0
	INC	W0
	MOV	W0, [W12]
L_EnqueueFrameIntoReceiveBuffer96:
	MOV	#14000, W7
L_EnqueueFrameIntoReceiveBuffer97:
	DEC	W7
	BRA NZ	L_EnqueueFrameIntoReceiveBuffer97
	NOP
	NOP
L_end_EnqueueFrameIntoReceiveBuffer:
	ULNK
	RETURN
; end of _EnqueueFrameIntoReceiveBuffer

_KL_Dispacher:
	LNK	#2

	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #3, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__KL_Dispacher291
	GOTO	L_KL_Dispacher99
L__KL_Dispacher291:
	ADD	W10, #1, W0
	MOV	W0, [W14+0]
	GOTO	L_KL_Dispacher100
L_KL_Dispacher102:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher103:
	ADD	W10, #6, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA NZ	L__KL_Dispacher292
	GOTO	L_KL_Dispacher104
L__KL_Dispacher292:
; _index start address is: 2 (W1)
	CLR	W1
; _index end address is: 2 (W1)
L_KL_Dispacher105:
; _index start address is: 2 (W1)
	ADD	W10, #6, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA LT	L__KL_Dispacher293
	GOTO	L_KL_Dispacher106
L__KL_Dispacher293:
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
	INC	W1
; _index end address is: 2 (W1)
	GOTO	L_KL_Dispacher105
L_KL_Dispacher106:
	GOTO	L_KL_Dispacher108
L_KL_Dispacher104:
; _index start address is: 2 (W1)
	CLR	W1
; _index end address is: 2 (W1)
L_KL_Dispacher109:
; _index start address is: 2 (W1)
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__KL_Dispacher294
	GOTO	L_KL_Dispacher110
L__KL_Dispacher294:
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
	INC	W1
; _index end address is: 2 (W1)
	GOTO	L_KL_Dispacher109
L_KL_Dispacher110:
L_KL_Dispacher108:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher111:
	PUSH	W10
	MOV	#lo_addr(?lstr7_Kernel), W10
	CALL	_UART3_Write_Text
	POP	W10
	ADD	W10, #6, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA NZ	L__KL_Dispacher295
	GOTO	L_KL_Dispacher112
L__KL_Dispacher295:
; _index start address is: 2 (W1)
	CLR	W1
; _index end address is: 2 (W1)
L_KL_Dispacher113:
; _index start address is: 2 (W1)
	ADD	W10, #6, W0
	MOV	[W0], W0
	CP	W1, W0
	BRA LT	L__KL_Dispacher296
	GOTO	L_KL_Dispacher114
L__KL_Dispacher296:
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART2_Write
	POP	W10
	INC	W1
; _index end address is: 2 (W1)
	GOTO	L_KL_Dispacher113
L_KL_Dispacher114:
	GOTO	L_KL_Dispacher116
L_KL_Dispacher112:
; _index start address is: 2 (W1)
	CLR	W1
; _index end address is: 2 (W1)
L_KL_Dispacher117:
; _index start address is: 2 (W1)
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__KL_Dispacher297
	GOTO	L_KL_Dispacher118
L__KL_Dispacher297:
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART2_Write
	POP	W10
	INC	W1
; _index end address is: 2 (W1)
	GOTO	L_KL_Dispacher117
L_KL_Dispacher118:
L_KL_Dispacher116:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher119:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher120:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher121:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher122:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher123:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher124:
	PUSH	W10
	MOV	#lo_addr(?lstr8_Kernel), W10
	CALL	_UART3_Write_Text
	POP	W10
; _index start address is: 2 (W1)
	CLR	W1
; _index end address is: 2 (W1)
L_KL_Dispacher125:
; _index start address is: 2 (W1)
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__KL_Dispacher298
	GOTO	L_KL_Dispacher126
L__KL_Dispacher298:
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
	ADD	W10, #4, W0
	ADD	W1, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART4_Write
	POP	W10
	INC	W1
; _index end address is: 2 (W1)
	GOTO	L_KL_Dispacher125
L_KL_Dispacher126:
	GOTO	L_KL_Dispacher101
L_KL_Dispacher100:
	MOV	[W14+0], W1
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L__KL_Dispacher299
	GOTO	L_KL_Dispacher102
L__KL_Dispacher299:
	MOV.B	[W1], W0
	CP.B	W0, #1
	BRA NZ	L__KL_Dispacher300
	GOTO	L_KL_Dispacher103
L__KL_Dispacher300:
	MOV.B	[W1], W0
	CP.B	W0, #2
	BRA NZ	L__KL_Dispacher301
	GOTO	L_KL_Dispacher111
L__KL_Dispacher301:
	MOV.B	[W1], W0
	CP.B	W0, #3
	BRA NZ	L__KL_Dispacher302
	GOTO	L_KL_Dispacher119
L__KL_Dispacher302:
	MOV.B	[W1], W0
	CP.B	W0, #4
	BRA NZ	L__KL_Dispacher303
	GOTO	L_KL_Dispacher120
L__KL_Dispacher303:
	MOV.B	[W1], W0
	CP.B	W0, #5
	BRA NZ	L__KL_Dispacher304
	GOTO	L_KL_Dispacher121
L__KL_Dispacher304:
	MOV.B	[W1], W0
	CP.B	W0, #6
	BRA NZ	L__KL_Dispacher305
	GOTO	L_KL_Dispacher122
L__KL_Dispacher305:
	MOV.B	[W1], W0
	CP.B	W0, #7
	BRA NZ	L__KL_Dispacher306
	GOTO	L_KL_Dispacher123
L__KL_Dispacher306:
	MOV.B	[W1], W0
	CP.B	W0, #8
	BRA NZ	L__KL_Dispacher307
	GOTO	L_KL_Dispacher124
L__KL_Dispacher307:
L_KL_Dispacher101:
	GOTO	L_KL_Dispacher127
L_KL_Dispacher99:
	ADD	W10, #1, W0
	MOV	W0, [W14+0]
	GOTO	L_KL_Dispacher128
L_KL_Dispacher130:
	MOV	#lo_addr(_genSendMutex), W13
	MOV	#lo_addr(_genSndWrPtr), W12
	MOV	W10, W11
	MOV	#lo_addr(Kernel_genSendBuf), W10
	CALL	_EnqueueFrameIntoSendBuffer
	GOTO	L_KL_Dispacher129
L_KL_Dispacher131:
	MOV	#lo_addr(_actMutex), W13
	MOV	#lo_addr(_actSndWrPtr), W12
	MOV	W10, W11
	MOV	#lo_addr(_actSendBuf), W10
	CALL	_EnqueueFrameIntoSendBuffer
	GOTO	L_KL_Dispacher129
L_KL_Dispacher132:
	GOTO	L_KL_Dispacher129
L_KL_Dispacher133:
	GOTO	L_KL_Dispacher129
L_KL_Dispacher134:
	GOTO	L_KL_Dispacher129
L_KL_Dispacher135:
	MOV	#lo_addr(_disMutex), W13
	MOV	#lo_addr(_disSndWrPtr), W12
	MOV	W10, W11
	MOV	#lo_addr(Kernel_disSndBuf), W10
	CALL	_EnqueueFrameIntoSendBuffer
	GOTO	L_KL_Dispacher129
L_KL_Dispacher128:
	MOV	[W14+0], W1
	MOV.B	[W1], W0
	CP.B	W0, #1
	BRA NZ	L__KL_Dispacher308
	GOTO	L_KL_Dispacher130
L__KL_Dispacher308:
	MOV.B	[W1], W0
	CP.B	W0, #2
	BRA NZ	L__KL_Dispacher309
	GOTO	L_KL_Dispacher131
L__KL_Dispacher309:
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L__KL_Dispacher310
	GOTO	L_KL_Dispacher132
L__KL_Dispacher310:
	MOV.B	[W1], W0
	CP.B	W0, #3
	BRA NZ	L__KL_Dispacher311
	GOTO	L_KL_Dispacher133
L__KL_Dispacher311:
	MOV.B	[W1], W0
	CP.B	W0, #4
	BRA NZ	L__KL_Dispacher312
	GOTO	L_KL_Dispacher134
L__KL_Dispacher312:
	MOV.B	[W1], W0
	CP.B	W0, #8
	BRA NZ	L__KL_Dispacher313
	GOTO	L_KL_Dispacher135
L__KL_Dispacher313:
L_KL_Dispacher129:
L_KL_Dispacher127:
L_end_KL_Dispacher:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _KL_Dispacher

_KL_UART1MessageReceiveHandler:
	LNK	#24
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__KL_UART1MessageReceiveHandler315
	GOTO	L_KL_UART1MessageReceiveHandler136
L__KL_UART1MessageReceiveHandler315:
	CALL	_UART1_Read
; _recivedChar start address is: 4 (W2)
	MOV.B	W0, W2
L_KL_UART1MessageReceiveHandler137:
	CP.B	W2, #13
	BRA NZ	L__KL_UART1MessageReceiveHandler316
	GOTO	L__KL_UART1MessageReceiveHandler224
L__KL_UART1MessageReceiveHandler316:
	MOV	Kernel_u1MsgSize, W0
	CP	W0, #30
	BRA LT	L__KL_UART1MessageReceiveHandler317
	GOTO	L__KL_UART1MessageReceiveHandler223
L__KL_UART1MessageReceiveHandler317:
L__KL_UART1MessageReceiveHandler222:
	MOV	#lo_addr(__uart1AccBuf), W1
	MOV	#lo_addr(Kernel_u1MsgSize), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
; _recivedChar end address is: 4 (W2)
	MOV	#1, W1
	MOV	#lo_addr(Kernel_u1MsgSize), W0
	ADD	W1, [W0], [W0]
	GOTO	L_KL_UART1MessageReceiveHandler145
L__KL_UART1MessageReceiveHandler224:
L__KL_UART1MessageReceiveHandler223:
	MOV.B	#1, W0
	MOV.B	W0, [W14+9]
	CLR	W0
	MOV.B	W0, [W14+10]
	MOV	#lo_addr(__uart1AccBuf), W0
	MOV	W0, [W14+12]
	MOV	Kernel_u1MsgSize, W0
	MOV	W0, [W14+14]
	ADD	W14, #8, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	_KL_CallSlotHandler
	SUB	#8, W15
	CLR	W0
	MOV	W0, Kernel_u1MsgSize
	MOV	#30, W12
	CLR	W11
	MOV	#lo_addr(__uart1AccBuf), W10
	CALL	_memset
L_KL_UART1MessageReceiveHandler145:
L_KL_UART1MessageReceiveHandler146:
	BSET	U1STA, #1
	BTSS	U1STA, #1
	GOTO	L_KL_UART1MessageReceiveHandler147
	BCLR	U1STA, #1
	BCLR	U1STA, #2
L_KL_UART1MessageReceiveHandler147:
L_KL_UART1MessageReceiveHandler136:
L_end_KL_UART1MessageReceiveHandler:
	POP	W12
	POP	W11
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
; end of _KL_UART1MessageReceiveHandler

_KL_UART2MessageReceiveHandler:
	LNK	#24
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
	CALL	_UART2_Data_Ready
	CP0	W0
	BRA NZ	L__KL_UART2MessageReceiveHandler319
	GOTO	L_KL_UART2MessageReceiveHandler148
L__KL_UART2MessageReceiveHandler319:
	CALL	_UART2_Read
; _recivedChar start address is: 2 (W1)
	MOV.B	W0, W1
L_KL_UART2MessageReceiveHandler149:
L_KL_UART2MessageReceiveHandler153:
	MOV	#lo_addr(__uart2AccBuf), W0
	MOV.B	W1, [W0]
; _recivedChar end address is: 2 (W1)
	MOV.B	#2, W0
	MOV.B	W0, [W14+17]
	CLR	W0
	MOV.B	W0, [W14+18]
	MOV	#lo_addr(__uart2AccBuf), W0
	MOV	W0, [W14+20]
	MOV	#1, W0
	MOV	W0, [W14+22]
	ADD	W14, #16, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	_KL_CallSlotHandler
	SUB	#8, W15
	MOV	#30, W12
	CLR	W11
	MOV	#lo_addr(__uart2AccBuf), W10
	CALL	_memset
	BSET	U2STA, #1
	BTSS	U2STA, #1
	GOTO	L_KL_UART2MessageReceiveHandler159
	BCLR	U2STA, #1
	BCLR	U2STA, #2
L_KL_UART2MessageReceiveHandler159:
L_KL_UART2MessageReceiveHandler148:
L_end_KL_UART2MessageReceiveHandler:
	POP	W12
	POP	W11
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
; end of _KL_UART2MessageReceiveHandler

_KL_UART3MessageReceiveHandler:
	LNK	#24
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	U3RXIF_bit, BitPos(U3RXIF_bit+0)
	CALL	_UART3_Data_Ready
	CP0	W0
	BRA NZ	L__KL_UART3MessageReceiveHandler321
	GOTO	L_KL_UART3MessageReceiveHandler160
L__KL_UART3MessageReceiveHandler321:
	CALL	_UART3_Read
; _recivedChar start address is: 2 (W1)
	MOV.B	W0, W1
L_KL_UART3MessageReceiveHandler161:
L_KL_UART3MessageReceiveHandler165:
	MOV	#lo_addr(__uart3AccBuf), W0
	MOV.B	W1, [W0]
; _recivedChar end address is: 2 (W1)
	CLR	W0
	MOV.B	W0, [W14+17]
	CLR	W0
	MOV.B	W0, [W14+18]
	MOV	#lo_addr(__uart3AccBuf), W0
	MOV	W0, [W14+20]
	MOV	#1, W0
	MOV	W0, [W14+22]
	ADD	W14, #16, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	_KL_CallSlotHandler
	SUB	#8, W15
	CLR	W0
	MOV	W0, Kernel_u3MsgSize
	MOV	#1, W12
	CLR	W11
	MOV	#lo_addr(__uart3AccBuf), W10
	CALL	_memset
	BSET	U3STA, #1
	BTSS	U3STA, #1
	GOTO	L_KL_UART3MessageReceiveHandler171
	BCLR	U3STA, #1
	BCLR	U3STA, #2
L_KL_UART3MessageReceiveHandler171:
L_KL_UART3MessageReceiveHandler160:
L_end_KL_UART3MessageReceiveHandler:
	POP	W12
	POP	W11
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
; end of _KL_UART3MessageReceiveHandler

_KL_UART4MessageReceiveHandler:
	LNK	#24
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	U4RXIF_bit, BitPos(U4RXIF_bit+0)
	CALL	_UART4_Data_Ready
	CP0	W0
	BRA NZ	L__KL_UART4MessageReceiveHandler323
	GOTO	L_KL_UART4MessageReceiveHandler172
L__KL_UART4MessageReceiveHandler323:
	CALL	_UART4_Read
; _recivedChar start address is: 2 (W1)
	MOV.B	W0, W1
	ZE	W0, W10
	CALL	_UART3_Write
L_KL_UART4MessageReceiveHandler173:
L_KL_UART4MessageReceiveHandler177:
	MOV	#lo_addr(__uart4AccBuf), W0
	MOV.B	W1, [W0]
; _recivedChar end address is: 2 (W1)
	MOV.B	#8, W0
	MOV.B	W0, [W14+17]
	CLR	W0
	MOV.B	W0, [W14+18]
	MOV	#lo_addr(__uart4AccBuf), W0
	MOV	W0, [W14+20]
	MOV	#1, W0
	MOV	W0, [W14+22]
	ADD	W14, #16, W0
	REPEAT	#3
	PUSH	[W0++]
	CALL	_KL_CallSlotHandler
	SUB	#8, W15
	CLR	W0
	MOV	W0, Kernel_u4MsgSize
	MOV	#1, W12
	CLR	W11
	MOV	#lo_addr(__uart4AccBuf), W10
	CALL	_memset
	BSET	U4STA, #1
	BTSS	U4STA, #1
	GOTO	L_KL_UART4MessageReceiveHandler183
	BCLR	U4STA, #1
	BCLR	U4STA, #2
L_KL_UART4MessageReceiveHandler183:
L_KL_UART4MessageReceiveHandler172:
L_end_KL_UART4MessageReceiveHandler:
	POP	W12
	POP	W11
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
; end of _KL_UART4MessageReceiveHandler

_KL_Timer1Interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	BCLR	T3IF_bit, BitPos(T3IF_bit+0)
	CALL	_KL_DistributeFrames
L_end_KL_Timer1Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _KL_Timer1Interrupt

_KL_SendFrame:

	CALL	_KL_Dispacher
L_end_KL_SendFrame:
	RETURN
; end of _KL_SendFrame

_KL_RegisterDevice:
	LNK	#0

	PUSH	W10
	MOV	KL_RegisterDevice__register_L0, W0
	SL	W0, #2, W1
	MOV	#lo_addr(__SLOTS), W0
	ADD	W0, W1, W1
	SUB	W14, #10, W0
	REPEAT	#1
	MOV	[W0++], [W1++]
	MOV	#1, W1
	MOV	#lo_addr(KL_RegisterDevice__register_L0), W0
	ADD	W1, [W0], [W0]
	MOV	#lo_addr(?lstr9_Kernel), W10
	CALL	_UART3_Write_Text
L_end_KL_RegisterDevice:
	POP	W10
	ULNK
	RETURN
; end of _KL_RegisterDevice

_KL_Bootup:

	PUSH	W10
	PUSH	W11
	CALL	_InitializePICSpeed
	CALL	_InitializePICPins
	CALL	_InitializeUARTS
	CALL	_InitializeTimers
	CALL	_InitializeHeap
	CALL	_PrioritizeInterrupts
	CALL	_InitializeBuzzer
	CALL	_KL_ClearKernelMemory
	MOV	#100, W11
	MOV	#1600, W10
	CALL	_Sound_Play
	MOV	#lo_addr(?lstr10_Kernel), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(?lstr11_Kernel), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(?lstr12_Kernel), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(?lstr13_Kernel), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(?lstr14_Kernel), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(?lstr15_Kernel), W10
	CALL	_UART3_Write_Text
	MOV	#22, W8
	MOV	#23756, W7
L_KL_Bootup184:
	DEC	W7
	BRA NZ	L_KL_Bootup184
	DEC	W8
	BRA NZ	L_KL_Bootup184
	NOP
	NOP
	CALL	_KL_StartDispacherEngine
	MOV	__startupFunction, W0
	CALL	W0
L_KL_Bootup186:
	NOP
	GOTO	L_KL_Bootup186
L_end_KL_Bootup:
	POP	W11
	POP	W10
	RETURN
; end of _KL_Bootup

_KL_RegisterInstrument:

	MOV	W10, __startupFunction
L_end_KL_RegisterInstrument:
	RETURN
; end of _KL_RegisterInstrument
