
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

	PUSH	W10
	MOV	#lo_addr(_StartInstrument), W10
	CALL	_KL_RegisterInstrument
	CALL	_KL_Bootup
	CLR	W0
L_end_main:
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
