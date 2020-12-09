
_tstStartInstrument:
	LNK	#12

	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
	MOV	#lo_addr(_GeneratorProcessKernelFrame), W0
	MOV	W0, [W14+2]
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_KL_RegisterDevice
	SUB	#4, W15
	MOV.B	#8, W0
	MOV.B	W0, [W14+8]
	MOV	#lo_addr(_DisplayProcessKernelFrame), W0
	MOV	W0, [W14+10]
	ADD	W14, #8, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_KL_RegisterDevice
	SUB	#4, W15
	MOV.B	#2, W0
	MOV.B	W0, [W14+4]
	MOV	#lo_addr(_ActuatorProcessKernelFrame), W0
	MOV	W0, [W14+6]
	ADD	W14, #4, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_KL_RegisterDevice
	SUB	#4, W15
	CALL	_InitDisplay
	CALL	_ShowMainMenue
L_end_tstStartInstrument:
	ULNK
	RETURN
; end of _tstStartInstrument
