
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
	CALL	_Config
	MOV	#70, W0
	MOV	WREG, PLLFBD
	CLR	CLKDIV
	MOV	#46273, W0
	MOV	WREG, ACLKCON3
	MOV	#7, W0
	MOV	WREG, ACLKDIV3
	MOV	#lo_addr(_HidWriteBuff), W11
	MOV	#lo_addr(_HidReadBuff), W10
	CALL	_HID_Enable
	CALL	_EnterBootloaderMode
	CP0.B	W0
	BRA Z	L__main3
	GOTO	L_main0
L__main3:
	CALL	_HID_Disable
	CALL	_Delay_10ms
	CALL	_StartProgram
	GOTO	L_main1
L_main0:
	CALL	_StartBootloader
L_main1:
L_end_main:
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
