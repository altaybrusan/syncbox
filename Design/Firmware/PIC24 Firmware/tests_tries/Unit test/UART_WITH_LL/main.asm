
_ClearBuffer:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_UART1_READ_BUFFER), W10
	CALL	_memset
L_end_ClearBuffer:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ClearBuffer

_UART1MessageReceiveHandler:
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
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__UART1MessageReceiveHandler32
	GOTO	L_UART1MessageReceiveHandler0
L__UART1MessageReceiveHandler32:
	CALL	_UART1_Read
; _recivedChar start address is: 4 (W2)
	MOV.B	W0, W2
	MOV	#lo_addr(_UART1_DELIMITER), W1
	CP.B	W0, [W1]
	BRA NZ	L__UART1MessageReceiveHandler33
	GOTO	L__UART1MessageReceiveHandler29
L__UART1MessageReceiveHandler33:
	MOV	_UART1_MESSAGE_LENGTH, W0
	CP	W0, #20
	BRA NZ	L__UART1MessageReceiveHandler34
	GOTO	L__UART1MessageReceiveHandler28
L__UART1MessageReceiveHandler34:
	GOTO	L_UART1MessageReceiveHandler3
; _recivedChar end address is: 4 (W2)
L__UART1MessageReceiveHandler29:
L__UART1MessageReceiveHandler28:
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	MOV	W0, main_GENERATOR_LATEST_FRAME
	ADD	W0, #4, W0
	CP0	[W0]
	BRA NZ	L__UART1MessageReceiveHandler35
	GOTO	L_UART1MessageReceiveHandler4
L__UART1MessageReceiveHandler35:
	MOV	main_GENERATOR_LATEST_FRAME, W0
	MOV	[W0], W0
	MOV	#20, W12
	MOV	#32, W11
	MOV	W0, W10
	CALL	_memcpy
	MOV	main_GENERATOR_LATEST_FRAME, W0
	MOV	[W0], W0
	MOV	#lo_addr(_UART1_READ_BUFFER), W11
	MOV	W0, W10
	CALL	_strcpy
	MOV	#lo_addr(?lstr1_main), W10
	CALL	_UART1_Write_Text
	GOTO	L_UART1MessageReceiveHandler5
L_UART1MessageReceiveHandler4:
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #6, W0
	MOV	[W0], W0
	MOV	W0, main_GENERATOR_LATEST_FRAME
L_UART1MessageReceiveHandler6:
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #6, W0
	CP0	[W0]
	BRA NZ	L__UART1MessageReceiveHandler36
	GOTO	L_UART1MessageReceiveHandler7
L__UART1MessageReceiveHandler36:
	MOV	#lo_addr(?lstr2_main), W10
	CALL	_UART1_Write_Text
	MOV	main_GENERATOR_LATEST_FRAME, W0
	MOV	[W0], W10
	CALL	_UART1_Write_Text
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #6, W0
	MOV	[W0], W0
	MOV	W0, main_GENERATOR_LATEST_FRAME
	GOTO	L_UART1MessageReceiveHandler6
L_UART1MessageReceiveHandler7:
L_UART1MessageReceiveHandler5:
	CLR	W0
	MOV	W0, _UART1_MESSAGE_LENGTH
	CALL	_ClearBuffer
	GOTO	L_UART1MessageReceiveHandler8
L_UART1MessageReceiveHandler3:
; _recivedChar start address is: 4 (W2)
	MOV	#lo_addr(_UART1_READ_BUFFER), W1
	MOV	#lo_addr(_UART1_MESSAGE_LENGTH), W0
	ADD	W1, [W0], W0
	MOV.B	W2, [W0]
; _recivedChar end address is: 4 (W2)
	MOV	#1, W1
	MOV	#lo_addr(_UART1_MESSAGE_LENGTH), W0
	ADD	W1, [W0], [W0]
L_UART1MessageReceiveHandler8:
L_UART1MessageReceiveHandler0:
	BSET	U1STA, #1
	BTSS	U1STA, #1
	GOTO	L_UART1MessageReceiveHandler9
	BCLR	U1STA, #1
	BCLR	U1STA, #2
L_UART1MessageReceiveHandler9:
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
L_end_UART1MessageReceiveHandler:
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
	RETFIE
; end of _UART1MessageReceiveHandler

_EnableRXInterrupt:

	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
	BSET	U1RXIE_bit, BitPos(U1RXIE_bit+0)
	BCLR	U1RXIF_bit, BitPos(U1RXIF_bit+0)
L_end_EnableRXInterrupt:
	RETURN
; end of _EnableRXInterrupt

_AllocateIOBuffers:

	PUSH	W10
	PUSH	W11
	PUSH	W12
; index start address is: 8 (W4)
	CLR	W4
; index end address is: 8 (W4)
L_AllocateIOBuffers10:
; index start address is: 8 (W4)
	MOV	#50, W0
	CP	W4, W0
	BRA LT	L__AllocateIOBuffers39
	GOTO	L_AllocateIOBuffers11
L__AllocateIOBuffers39:
	PUSH	W4
	MOV	#20, W10
	CALL	_Malloc
	POP	W4
	MOV	#10, W1
	MUL.UU	W1, W4, W2
	MOV	#lo_addr(main_GENERATOR_FRAME_BUFFER), W1
	ADD	W1, W2, W1
	PUSH	W4
	MOV	W0, W12
	MOV	W1, W11
	MOV	#lo_addr(main_GENERATOR_FRAME_BUFFER), W10
	CALL	_addNode
	POP	W4
	INC	W4
; index end address is: 8 (W4)
	GOTO	L_AllocateIOBuffers10
L_AllocateIOBuffers11:
	MOV	#lo_addr(main_GENERATOR_FRAME_BUFFER), W0
	MOV	W0, main_GENERATOR_LATEST_FRAME
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #4, W0
	CP0	[W0]
	BRA NZ	L__AllocateIOBuffers40
	GOTO	L_AllocateIOBuffers13
L__AllocateIOBuffers40:
	MOV	#lo_addr(?lstr3_main), W10
	CALL	_UART1_Write_Text
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	MOV	W0, main_GENERATOR_LATEST_FRAME
L_AllocateIOBuffers13:
	MOV	main_GENERATOR_LATEST_FRAME, W0
	ADD	W0, #4, W0
	CP0	[W0]
	BRA NZ	L__AllocateIOBuffers41
	GOTO	L_AllocateIOBuffers14
L__AllocateIOBuffers41:
	MOV	#lo_addr(?lstr4_main), W10
	CALL	_UART1_Write_Text
L_AllocateIOBuffers14:
L_end_AllocateIOBuffers:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _AllocateIOBuffers

_AllocateHeap:

	CALL	_MM_Init
L_end_AllocateHeap:
	RETURN
; end of _AllocateHeap

_TestWithMInit:

	PUSH	W10
	PUSH	W11
	CALL	_MM_Init
	MOV	#400, W10
	CALL	_Malloc
	MOV	W0, _pi
	MOV	#lo_addr(?lstr5_main), W11
	MOV	W0, W10
	CALL	_strcpy
	MOV	_pi, W10
	CALL	_UART1_Write_Text
L_end_TestWithMInit:
	POP	W11
	POP	W10
	RETURN
; end of _TestWithMInit

_TestmallocWithoutMinit:

	PUSH	W10
	MOV	#10, W10
	CALL	_Malloc
	MOV	W0, _pi
	CLR	W0
	MOV	W0, _result
L_TestmallocWithoutMinit15:
	MOV	_result, W0
	CP	W0, #10
	BRA LT	L__TestmallocWithoutMinit45
	GOTO	L_TestmallocWithoutMinit16
L__TestmallocWithoutMinit45:
	MOV	_pi, W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], W2
	MOV	#60, W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], W0
	MOV.B	W0, [W2]
	MOV	#lo_addr(_ai), W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], W2
	MOV	#60, W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], W0
	MOV.B	W0, [W2]
	MOV	#1, W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], [W0]
	GOTO	L_TestmallocWithoutMinit15
L_TestmallocWithoutMinit16:
	CLR	W0
	MOV	W0, _result
L_TestmallocWithoutMinit18:
	MOV	_result, W0
	CP	W0, #10
	BRA LT	L__TestmallocWithoutMinit46
	GOTO	L_TestmallocWithoutMinit19
L__TestmallocWithoutMinit46:
	MOV	_pi, W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], W0
	ZE	[W0], W10
	CALL	_UART1_Write
	MOV	#1, W1
	MOV	#lo_addr(_result), W0
	ADD	W1, [W0], [W0]
	GOTO	L_TestmallocWithoutMinit18
L_TestmallocWithoutMinit19:
L_end_TestmallocWithoutMinit:
	POP	W10
	RETURN
; end of _TestmallocWithoutMinit

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
	MOV	#70, W0
	MOV	WREG, PLLFBD
	CLR	CLKDIV
	CLR	ANSELA
	CLR	ANSELB
	CLR	ANSELC
	CLR	ANSELD
	CLR	ANSELE
	CLR	ANSELG
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#124, W10
	CALL	_PPS_Mapping
	MOV	W0, _result
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#125, W10
	CALL	_PPS_Mapping
	MOV	W0, _result
	MOV	#107, W8
	MOV	#53247, W7
L_main21:
	DEC	W7
	BRA NZ	L_main21
	DEC	W8
	BRA NZ	L_main21
	NOP
	NOP
	CALL	_ClearBuffer
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
	MOV	#107, W8
	MOV	#53247, W7
L_main23:
	DEC	W7
	BRA NZ	L_main23
	DEC	W8
	BRA NZ	L_main23
	NOP
	NOP
	CALL	_EnableRXInterrupt
	CALL	_AllocateHeap
	CALL	_AllocateIOBuffers
L_main25:
	NOP
	GOTO	L_main25
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
