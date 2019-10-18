
_ModRTU_CRC:

; crc start address is: 2 (W1)
	MOV	#65535, W1
; pos start address is: 6 (W3)
	CLR	W3
; crc end address is: 2 (W1)
; pos end address is: 6 (W3)
L_ModRTU_CRC0:
; pos start address is: 6 (W3)
; crc start address is: 2 (W1)
	CP	W3, W11
	BRA LT	L__ModRTU_CRC17
	GOTO	L_ModRTU_CRC1
L__ModRTU_CRC17:
	ADD	W10, W3, W0
	ZE	[W0], W0
; crc start address is: 8 (W4)
	XOR	W1, W0, W4
; crc end address is: 2 (W1)
; index start address is: 4 (W2)
	MOV	#8, W2
; crc end address is: 8 (W4)
; index end address is: 4 (W2)
; pos end address is: 6 (W3)
L_ModRTU_CRC3:
; index start address is: 4 (W2)
; crc start address is: 8 (W4)
; pos start address is: 6 (W3)
	CP	W2, #0
	BRA NZ	L__ModRTU_CRC18
	GOTO	L_ModRTU_CRC4
L__ModRTU_CRC18:
	AND	W4, #1, W0
	CP	W0, #0
	BRA NZ	L__ModRTU_CRC19
	GOTO	L_ModRTU_CRC6
L__ModRTU_CRC19:
	LSR	W4, #1, W1
; crc end address is: 8 (W4)
	MOV	#40961, W0
; crc start address is: 8 (W4)
	XOR	W1, W0, W4
	GOTO	L_ModRTU_CRC7
L_ModRTU_CRC6:
	LSR	W4, #1, W0
; crc end address is: 8 (W4)
; crc start address is: 2 (W1)
	MOV	W0, W1
; crc end address is: 2 (W1)
	MOV	W1, W4
L_ModRTU_CRC7:
; crc start address is: 8 (W4)
	DEC	W2
; index end address is: 4 (W2)
	GOTO	L_ModRTU_CRC3
L_ModRTU_CRC4:
	INC	W3
	MOV	W4, W1
; crc end address is: 8 (W4)
; pos end address is: 6 (W3)
	GOTO	L_ModRTU_CRC0
L_ModRTU_CRC1:
; crc start address is: 2 (W1)
	MOV	W1, W0
; crc end address is: 2 (W1)
L_end_ModRTU_CRC:
	RETURN
; end of _ModRTU_CRC

_PrepareCommandStructure:

	PUSH	W11
	PUSH	W12
	MOV	#13, W12
	CLR	W11
	CALL	_memset
	PUSH	W10
	MOV	#4, W12
	CLR	W11
	MOV	#lo_addr(__dataRegisters), W10
	CALL	_memset
	POP	W10
	MOV.B	#127, W0
	MOV.B	W0, [W10]
	ADD	W10, #1, W1
	MOV.B	#16, W0
	MOV.B	W0, [W1]
	ADD	W10, #4, W0
	PUSH	W10
	MOV	#2, W12
	MOV	#lo_addr(__numberOfRegisters), W11
	MOV	W0, W10
	CALL	_memcpy
	POP	W10
	ADD	W10, #6, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
L_end_PrepareCommandStructure:
	POP	W12
	POP	W11
	RETURN
; end of _PrepareCommandStructure

_CallActuatorKernelSendService:
	LNK	#8

	PUSH	W10
	MOV.B	#2, W0
	MOV.B	W0, [W14+0]
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
	MOV.B	W11, [W14+2]
	MOV	#13, W0
	MOV	W0, [W14+6]
	MOV	W10, [W14+4]
	CLR	W0
	MOV.B	W0, [W14+3]
	MOV	#3, W8
	MOV	#8929, W7
L_CallActuatorKernelSendService8:
	DEC	W7
	BRA NZ	L_CallActuatorKernelSendService8
	DEC	W8
	BRA NZ	L_CallActuatorKernelSendService8
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_KL_SendFrame
L_end_CallActuatorKernelSendService:
	POP	W10
	ULNK
	RETURN
; end of _CallActuatorKernelSendService

_SetConnectionToRS232Modbus:

L_end_SetConnectionToRS232Modbus:
	RETURN
; end of _SetConnectionToRS232Modbus

_TurnOnSliderMotor:
	LNK	#14

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_PrepareCommandStructure
	MOV	#lo_addr(__startingAddress), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(__startingAddress+1), W1
	MOV.B	#60, W0
	MOV.B	W0, [W1]
	ADD	W14, #0, W0
	INC2	W0
	MOV	#2, W12
	MOV	#lo_addr(__startingAddress), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W0
	MOV	#4, W12
	MOV	#lo_addr(_TURN_ON_CMD), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	MOV	#11, W11
	MOV	W0, W10
	CALL	_ModRTU_CRC
	MOV	W0, __crc
	ADD	W14, #0, W0
	ADD	W0, #11, W0
	MOV	#2, W12
	MOV	#lo_addr(__crc), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallActuatorKernelSendService
L_end_TurnOnSliderMotor:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _TurnOnSliderMotor

_TurnOffSliderMotor:
	LNK	#14

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_PrepareCommandStructure
	MOV	#lo_addr(__startingAddress), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(__startingAddress+1), W1
	MOV.B	#60, W0
	MOV.B	W0, [W1]
	ADD	W14, #0, W0
	INC2	W0
	MOV	#2, W12
	MOV	#lo_addr(__startingAddress), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W0
	MOV	#4, W12
	MOV	#lo_addr(_TURN_OFF_CMD), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	MOV	#11, W11
	MOV	W0, W10
	CALL	_ModRTU_CRC
	MOV	W0, __crc
	ADD	W14, #0, W0
	ADD	W0, #11, W0
	MOV	#2, W12
	MOV	#lo_addr(__crc), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallActuatorKernelSendService
L_end_TurnOffSliderMotor:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _TurnOffSliderMotor

_SetSliderMotorSpeed:
	LNK	#18

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#100, W0
	CP	W0, W10
	BRA LE	L__SetSliderMotorSpeed26
	GOTO	L__SetSliderMotorSpeed15
L__SetSliderMotorSpeed26:
	MOV	#800, W0
	CP	W10, W0
	BRA LE	L__SetSliderMotorSpeed27
	GOTO	L__SetSliderMotorSpeed14
L__SetSliderMotorSpeed27:
L__SetSliderMotorSpeed13:
	MOV	#0, W0
	MOV.B	W0, [W14+13]
	MOV	#0, W0
	MOV.B	W0, [W14+14]
	MOV	#0, W0
	MOV.B	W0, [W14+15]
	MOV	#0, W0
	MOV.B	W0, [W14+16]
	ADD	W14, #13, W1
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], [W1]
	ADD	W1, #1, W0
	MOV.B	W10, [W0]
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_PrepareCommandStructure
	MOV	#lo_addr(__startingAddress), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(__startingAddress+1), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
	ADD	W14, #0, W0
	INC2	W0
	MOV	#2, W12
	MOV	#lo_addr(__startingAddress), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #13, W1
	ADD	W14, #0, W0
	ADD	W0, #7, W0
	MOV	#4, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	MOV	#11, W11
	MOV	W0, W10
	CALL	_ModRTU_CRC
	MOV	W0, __crc
	ADD	W14, #0, W0
	ADD	W0, #11, W0
	MOV	#2, W12
	MOV	#lo_addr(__crc), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallActuatorKernelSendService
L__SetSliderMotorSpeed15:
L__SetSliderMotorSpeed14:
L_end_SetSliderMotorSpeed:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SetSliderMotorSpeed

_RotateSliderMotorCounterClockwise:
	LNK	#14

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_PrepareCommandStructure
	MOV	#lo_addr(__startingAddress), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(__startingAddress+1), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
	ADD	W14, #0, W0
	INC2	W0
	MOV	#2, W12
	MOV	#lo_addr(__startingAddress), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W0
	MOV	#4, W12
	MOV	#lo_addr(_ROTATE_CCW_CMD), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	MOV	#11, W11
	MOV	W0, W10
	CALL	_ModRTU_CRC
	MOV	W0, __crc
	ADD	W14, #0, W0
	ADD	W0, #11, W0
	MOV	#2, W12
	MOV	#lo_addr(__crc), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallActuatorKernelSendService
L_end_RotateSliderMotorCounterClockwise:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _RotateSliderMotorCounterClockwise

_RotateSliderMotorClockwise:
	LNK	#14

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_PrepareCommandStructure
	MOV	#lo_addr(__startingAddress), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(__startingAddress+1), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
	ADD	W14, #0, W0
	INC2	W0
	MOV	#2, W12
	MOV	#lo_addr(__startingAddress), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W0
	MOV	#4, W12
	MOV	#lo_addr(_ROTATE_CW_CMD), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	MOV	#11, W11
	MOV	W0, W10
	CALL	_ModRTU_CRC
	MOV	W0, __crc
	ADD	W14, #0, W0
	ADD	W0, #11, W0
	MOV	#2, W12
	MOV	#lo_addr(__crc), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallActuatorKernelSendService
L_end_RotateSliderMotorClockwise:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _RotateSliderMotorClockwise

_StopMotor:
	LNK	#14

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_PrepareCommandStructure
	MOV	#lo_addr(__startingAddress), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(__startingAddress+1), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
	ADD	W14, #0, W0
	INC2	W0
	MOV	#2, W12
	MOV	#lo_addr(__startingAddress), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W0
	MOV	#4, W12
	MOV	#lo_addr(_STOP_ROTATION_CMD), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	MOV	#11, W11
	MOV	W0, W10
	CALL	_ModRTU_CRC
	MOV	W0, __crc
	ADD	W14, #0, W0
	ADD	W0, #11, W0
	MOV	#2, W12
	MOV	#lo_addr(__crc), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallActuatorKernelSendService
L_end_StopMotor:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StopMotor

_ActuatorProcessKernelFrame:
	LNK	#0

L_end_ActuatorProcessKernelFrame:
	ULNK
	RETURN
; end of _ActuatorProcessKernelFrame
