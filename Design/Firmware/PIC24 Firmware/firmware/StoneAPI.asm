
_DisplayCallKernelSendService:
	LNK	#8

	PUSH	W10
	MOV.B	#8, W0
	MOV.B	W0, [W14+0]
	MOV.B	#8, W0
	MOV.B	W0, [W14+1]
	MOV.B	W11, [W14+2]
	MOV	W10, [W14+4]
	MOV	W12, [W14+6]
	CLR	W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_KL_SendFrame
L_end_DisplayCallKernelSendService:
	POP	W10
	ULNK
	RETURN
; end of _DisplayCallKernelSendService

_GetCommandParameter:
	LNK	#4

	PUSH	W10
	ADD	W14, #0, W2
	ADD	W10, #14, W0
	MOV.B	[W0], [W2]
	ADD	W2, #1, W1
	ADD	W10, #16, W0
	MOV.B	[W0], [W1]
	ADD	W2, #2, W1
	ADD	W10, #18, W0
	MOV.B	[W0], [W1]
	MOV	W2, W10
	CALL	_atoi
	MOV	W0, _result
L_end_GetCommandParameter:
	POP	W10
	ULNK
	RETURN
; end of _GetCommandParameter

_UpdateCommandParameter:
	LNK	#10

	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W0
	MOV	W0, [W14+8]
	PUSH.D	W10
	MOV	#7, W12
	MOV.B	#48, W11
	MOV	W0, W10
	CALL	_memset
	POP.D	W10
	PUSH	W10
	CALL	_GetCommandParameter
	MOV	W0, __result
	ADD	W0, W11, W1
	MOV	W1, __result
	ADD	W14, #0, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
	POP	W10
	ADD	W10, #14, W1
	ADD	W14, #0, W0
	ADD	W0, #3, W0
	MOV.B	[W0], [W1]
	ADD	W10, #16, W1
	MOV	[W14+8], W2
	ADD	W2, #4, W0
	MOV.B	[W0], [W1]
	ADD	W10, #18, W1
	ADD	W2, #5, W0
	MOV.B	[W0], [W1]
L_end_UpdateCommandParameter:
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _UpdateCommandParameter

_CheckMessageFinished:

	CP	W11, #4
	BRA LT	L__CheckMessageFinished63
	GOTO	L_CheckMessageFinished0
L__CheckMessageFinished63:
	CLR	W0
	GOTO	L_end_CheckMessageFinished
L_CheckMessageFinished0:
	SUB	W11, #4, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W1
	MOV.B	#204, W0
	CP.B	W1, W0
	BRA Z	L__CheckMessageFinished64
	GOTO	L__CheckMessageFinished53
L__CheckMessageFinished64:
	SUB	W11, #3, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W1
	MOV.B	#51, W0
	CP.B	W1, W0
	BRA Z	L__CheckMessageFinished65
	GOTO	L__CheckMessageFinished52
L__CheckMessageFinished65:
	SUB	W11, #2, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W1
	MOV.B	#195, W0
	CP.B	W1, W0
	BRA Z	L__CheckMessageFinished66
	GOTO	L__CheckMessageFinished51
L__CheckMessageFinished66:
	SUB	W11, #1, W0
	ADD	W10, W0, W0
	MOV.B	[W0], W1
	MOV.B	#60, W0
	CP.B	W1, W0
	BRA Z	L__CheckMessageFinished67
	GOTO	L__CheckMessageFinished50
L__CheckMessageFinished67:
L__CheckMessageFinished49:
	MOV	#1, W0
	GOTO	L_end_CheckMessageFinished
L__CheckMessageFinished53:
L__CheckMessageFinished52:
L__CheckMessageFinished51:
L__CheckMessageFinished50:
	CLR	W0
L_end_CheckMessageFinished:
	RETURN
; end of _CheckMessageFinished

_DisplayKVP:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#25, W12
	CLR	W11
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayKVP:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayKVP

_DisplaymA:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#25, W12
	CLR	W11
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplaymA:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplaymA

_DisplayTime:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#25, W12
	CLR	W11
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayTime:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayTime

_DisplayJOG:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#25, W12
	CLR	W11
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayJOG:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayJOG

_ClearKVPBox:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_clearKVPBoxCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_ClearKVPBox:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ClearKVPBox

_ClearmABox:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_clearmABoxCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_ClearmABox:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ClearmABox

_ClearTimeBox:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_clearTimeBoxCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_ClearTimeBox:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ClearTimeBox

_ClearJOGBox:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#20, W12
	CLR	W11
	MOV	#lo_addr(_clearJOGBoxCmd), W10
	CALL	_DisplayCallKernelSendService
L_end_ClearJOGBox:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ClearJOGBox

_InitParameterBoard:

	CALL	_DisplayKVP
	CALL	_DisplaymA
	CALL	_DisplayTime
	CALL	_DisplayJOG
L_end_InitParameterBoard:
	RETURN
; end of _InitParameterBoard

_ProcessMessage:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W10, #3, W0
; btncode start address is: 2 (W1)
	MOV.B	[W0], W1
	ADD	W10, #1, W0
; cmdcode start address is: 4 (W2)
	MOV.B	[W0], W2
	GOTO	L_ProcessMessage4
; btncode end address is: 2 (W1)
; cmdcode end address is: 4 (W2)
L_ProcessMessage6:
	ADD	W10, #3, W0
	ZE	[W0], W0
	CP	W0, #4
	BRA Z	L__ProcessMessage78
	GOTO	L_ProcessMessage7
L__ProcessMessage78:
	ADD	W10, #4, W0
	MOV.B	[W0], W1
	MOV.B	#50, W0
	CP.B	W1, W0
	BRA Z	L__ProcessMessage79
	GOTO	L__ProcessMessage58
L__ProcessMessage79:
	ADD	W10, #5, W0
	MOV.B	[W0], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA Z	L__ProcessMessage80
	GOTO	L__ProcessMessage57
L__ProcessMessage80:
	ADD	W10, #6, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	MOV	#786, W0
	CP	W1, W0
	BRA Z	L__ProcessMessage81
	GOTO	L__ProcessMessage56
L__ProcessMessage81:
	ADD	W10, #7, W0
	MOV.B	[W0], W1
	MOV.B	#56, W0
	CP.B	W1, W0
	BRA Z	L__ProcessMessage82
	GOTO	L__ProcessMessage55
L__ProcessMessage82:
L__ProcessMessage54:
L__ProcessMessage58:
L__ProcessMessage57:
L__ProcessMessage56:
L__ProcessMessage55:
	GOTO	L_ProcessMessage11
L_ProcessMessage7:
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(_selectPicture), W10
	CALL	_DisplayCallKernelSendService
L_ProcessMessage11:
	GOTO	L_ProcessMessage5
L_ProcessMessage12:
; btncode start address is: 2 (W1)
	GOTO	L_ProcessMessage13
; btncode end address is: 2 (W1)
L_ProcessMessage15:
	MOV	__automaticModeLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage83
	GOTO	L_ProcessMessage16
L__ProcessMessage83:
	MOV	__automaticModeLst, W0
	CALL	W0
L_ProcessMessage16:
	GOTO	L_ProcessMessage14
L_ProcessMessage17:
	MOV	#13, W12
	CLR	W11
	MOV	#lo_addr(_displaySecCmd), W10
	CALL	_DisplayCallKernelSendService
	GOTO	L_ProcessMessage14
L_ProcessMessage18:
	MOV	__gotoHomeLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage84
	GOTO	L_ProcessMessage19
L__ProcessMessage84:
	MOV	__gotoHomeLst, W0
	CALL	W0
L_ProcessMessage19:
	GOTO	L_ProcessMessage14
L_ProcessMessage20:
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	__startwarmupLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage85
	GOTO	L_ProcessMessage21
L__ProcessMessage85:
	MOV	__startwarmupLst, W0
	CALL	W0
L_ProcessMessage21:
	GOTO	L_ProcessMessage14
L_ProcessMessage22:
	MOV	__gotoHomeLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage86
	GOTO	L_ProcessMessage23
L__ProcessMessage86:
	MOV	__gotoHomeLst, W0
	CALL	W0
L_ProcessMessage23:
	GOTO	L_ProcessMessage14
L_ProcessMessage24:
	MOV	__updateKvpLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage87
	GOTO	L_ProcessMessage25
L__ProcessMessage87:
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	W0, W10
	MOV	__updateKvpLst, W0
	CALL	W0
L_ProcessMessage25:
	MOV	__updatemALst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage88
	GOTO	L_ProcessMessage26
L__ProcessMessage88:
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	W0, W10
	MOV	__updatemALst, W0
	CALL	W0
L_ProcessMessage26:
	MOV	__updateTimeLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage89
	GOTO	L_ProcessMessage27
L__ProcessMessage89:
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	W0, W10
	MOV	__updateTimeLst, W0
	CALL	W0
L_ProcessMessage27:
	MOV	__updateJogLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage90
	GOTO	L_ProcessMessage28
L__ProcessMessage90:
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	W0, W10
	MOV	__updateJogLst, W0
	CALL	W0
L_ProcessMessage28:
	MOV	__startExposureLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage91
	GOTO	L_ProcessMessage29
L__ProcessMessage91:
	MOV	__startExposureLst, W0
	CALL	W0
L_ProcessMessage29:
	GOTO	L_ProcessMessage14
L_ProcessMessage30:
	MOV	__stopExposureLst, W0
	CP	W0, #0
	BRA NZ	L__ProcessMessage92
	GOTO	L_ProcessMessage31
L__ProcessMessage92:
	MOV	__stopExposureLst, W0
	CALL	W0
L_ProcessMessage31:
	GOTO	L_ProcessMessage14
L_ProcessMessage32:
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_KVP_STP), W1
	ADD	W0, [W1], W1
	MOV	#lo_addr(_MAX_KVP_VAL), W0
	CP	W1, [W0]
	BRA LE	L__ProcessMessage93
	GOTO	L_ProcessMessage33
L__ProcessMessage93:
	MOV	_KVP_STP, W11
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearKVPBox
	CALL	_DisplayKVP
L_ProcessMessage33:
	GOTO	L_ProcessMessage14
L_ProcessMessage34:
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_mA_STP), W1
	ADD	W0, [W1], W1
	MOV	#lo_addr(_MAX_mA), W0
	CP	W1, [W0]
	BRA LE	L__ProcessMessage94
	GOTO	L_ProcessMessage35
L__ProcessMessage94:
	MOV	_mA_STP, W11
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearmABox
	CALL	_DisplaymA
L_ProcessMessage35:
	GOTO	L_ProcessMessage14
L_ProcessMessage36:
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_TIME_STP), W1
	ADD	W0, [W1], W1
	MOV	#lo_addr(_MAX_TIME), W0
	CP	W1, [W0]
	BRA LE	L__ProcessMessage95
	GOTO	L_ProcessMessage37
L__ProcessMessage95:
	MOV	_TIME_STP, W11
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearTimeBox
	CALL	_DisplayTime
L_ProcessMessage37:
	GOTO	L_ProcessMessage14
L_ProcessMessage38:
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_JOG_STP), W1
	ADD	W0, [W1], W1
	MOV	#lo_addr(_MAX_JOG), W0
	CP	W1, [W0]
	BRA LE	L__ProcessMessage96
	GOTO	L_ProcessMessage39
L__ProcessMessage96:
	MOV	_JOG_STP, W11
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearJOGBox
	CALL	_DisplayJOG
L_ProcessMessage39:
	GOTO	L_ProcessMessage14
L_ProcessMessage40:
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_KVP_STP), W1
	SUB	W0, [W1], W1
	MOV	#lo_addr(_MIN_KVP_VAL), W0
	CP	W1, [W0]
	BRA GE	L__ProcessMessage97
	GOTO	L_ProcessMessage41
L__ProcessMessage97:
	MOV	#65535, W3
	MOV	#lo_addr(_KVP_STP), W2
	MUL.SS	W3, [W2], W0
	MOV	W0, W11
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearKVPBox
	CALL	_DisplayKVP
L_ProcessMessage41:
	GOTO	L_ProcessMessage14
L_ProcessMessage42:
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_mA_STP), W1
	SUB	W0, [W1], W1
	MOV	#lo_addr(_MIN_mA), W0
	CP	W1, [W0]
	BRA GE	L__ProcessMessage98
	GOTO	L_ProcessMessage43
L__ProcessMessage98:
	MOV	#65535, W3
	MOV	#lo_addr(_mA_STP), W2
	MUL.SS	W3, [W2], W0
	MOV	W0, W11
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearmABox
	CALL	_DisplaymA
L_ProcessMessage43:
	GOTO	L_ProcessMessage14
L_ProcessMessage44:
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_TIME_STP), W1
	SUB	W0, [W1], W1
	MOV	#lo_addr(_MIN_TIME), W0
	CP	W1, [W0]
	BRA GE	L__ProcessMessage99
	GOTO	L_ProcessMessage45
L__ProcessMessage99:
	MOV	#65535, W3
	MOV	#lo_addr(_TIME_STP), W2
	MUL.SS	W3, [W2], W0
	MOV	W0, W11
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearTimeBox
	CALL	_DisplayTime
L_ProcessMessage45:
	GOTO	L_ProcessMessage14
L_ProcessMessage46:
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_GetCommandParameter
	MOV	W0, _paramVal
	MOV	#lo_addr(_JOG_STP), W1
	SUB	W0, [W1], W1
	MOV	#lo_addr(_MIN_JOG), W0
	CP	W1, [W0]
	BRA GE	L__ProcessMessage100
	GOTO	L_ProcessMessage47
L__ProcessMessage100:
	MOV	#65535, W3
	MOV	#lo_addr(_JOG_STP), W2
	MUL.SS	W3, [W2], W0
	MOV	W0, W11
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_UpdateCommandParameter
	CALL	_ClearJOGBox
	CALL	_DisplayJOG
L_ProcessMessage47:
	GOTO	L_ProcessMessage14
L_ProcessMessage13:
; btncode start address is: 2 (W1)
	CP.B	W1, #1
	BRA NZ	L__ProcessMessage101
	GOTO	L_ProcessMessage15
L__ProcessMessage101:
	CP.B	W1, #2
	BRA NZ	L__ProcessMessage102
	GOTO	L_ProcessMessage17
L__ProcessMessage102:
	CP.B	W1, #3
	BRA NZ	L__ProcessMessage103
	GOTO	L_ProcessMessage18
L__ProcessMessage103:
	CP.B	W1, #4
	BRA NZ	L__ProcessMessage104
	GOTO	L_ProcessMessage20
L__ProcessMessage104:
	CP.B	W1, #5
	BRA NZ	L__ProcessMessage105
	GOTO	L_ProcessMessage22
L__ProcessMessage105:
	CP.B	W1, #6
	BRA NZ	L__ProcessMessage106
	GOTO	L_ProcessMessage24
L__ProcessMessage106:
	CP.B	W1, #7
	BRA NZ	L__ProcessMessage107
	GOTO	L_ProcessMessage30
L__ProcessMessage107:
	CP.B	W1, #16
	BRA NZ	L__ProcessMessage108
	GOTO	L_ProcessMessage32
L__ProcessMessage108:
	CP.B	W1, #17
	BRA NZ	L__ProcessMessage109
	GOTO	L_ProcessMessage34
L__ProcessMessage109:
	CP.B	W1, #18
	BRA NZ	L__ProcessMessage110
	GOTO	L_ProcessMessage36
L__ProcessMessage110:
	CP.B	W1, #19
	BRA NZ	L__ProcessMessage111
	GOTO	L_ProcessMessage38
L__ProcessMessage111:
	CP.B	W1, #20
	BRA NZ	L__ProcessMessage112
	GOTO	L_ProcessMessage40
L__ProcessMessage112:
	CP.B	W1, #21
	BRA NZ	L__ProcessMessage113
	GOTO	L_ProcessMessage42
L__ProcessMessage113:
	CP.B	W1, #22
	BRA NZ	L__ProcessMessage114
	GOTO	L_ProcessMessage44
L__ProcessMessage114:
	CP.B	W1, #23
	BRA NZ	L__ProcessMessage115
	GOTO	L_ProcessMessage46
L__ProcessMessage115:
; btncode end address is: 2 (W1)
L_ProcessMessage14:
	GOTO	L_ProcessMessage5
L_ProcessMessage4:
; cmdcode start address is: 4 (W2)
; btncode start address is: 2 (W1)
	MOV.B	#124, W0
	CP.B	W2, W0
	BRA NZ	L__ProcessMessage116
	GOTO	L_ProcessMessage6
L__ProcessMessage116:
	MOV.B	#120, W0
	CP.B	W2, W0
	BRA NZ	L__ProcessMessage117
	GOTO	L_ProcessMessage12
L__ProcessMessage117:
; btncode end address is: 2 (W1)
; cmdcode end address is: 4 (W2)
L_ProcessMessage5:
L_end_ProcessMessage:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ProcessMessage

_SetKvpBoundaries:

	MOV	W10, _MIN_KVP_VAL
	MOV	W11, _MAX_KVP_VAL
L_end_SetKvpBoundaries:
	RETURN
; end of _SetKvpBoundaries

_SetmABoundaries:

	MOV	W10, _MIN_mA
	MOV	W11, _MAX_mA
L_end_SetmABoundaries:
	RETURN
; end of _SetmABoundaries

_SetTimeBoundaries:

	MOV	W10, _MIN_TIME
	MOV	W11, _MAX_TIME
L_end_SetTimeBoundaries:
	RETURN
; end of _SetTimeBoundaries

_SetJogBoundaries:

	MOV	W10, _MIN_JOG
	MOV	W11, _MAX_JOG
L_end_SetJogBoundaries:
	RETURN
; end of _SetJogBoundaries

_SetKvpStepSize:

	MOV	W10, _KVP_STP
L_end_SetKvpStepSize:
	RETURN
; end of _SetKvpStepSize

_SetmAStepSize:

	MOV	W10, _mA_STP
L_end_SetmAStepSize:
	RETURN
; end of _SetmAStepSize

_SetTimeStepSize:

	MOV	W10, _TIME_STP
L_end_SetTimeStepSize:
	RETURN
; end of _SetTimeStepSize

_SetJogStepSize:

	MOV	W10, _JOG_STP
L_end_SetJogStepSize:
	RETURN
; end of _SetJogStepSize

_DisplayProcessKernelFrame:
	LNK	#0

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(StoneAPI__receiveBuff), W1
	MOV	#lo_addr(StoneAPI_mLen), W0
	ADD	W1, [W0], W1
	MOV	[W14-10], W0
	MOV.B	[W0], [W1]
	MOV	#1, W1
	MOV	#lo_addr(StoneAPI_mLen), W0
	ADD	W1, [W0], [W0]
	MOV	StoneAPI_mLen, W11
	MOV	#lo_addr(StoneAPI__receiveBuff), W10
	CALL	_CheckMessageFinished
	CP	W0, #0
	BRA NZ	L__DisplayProcessKernelFrame127
	GOTO	L_DisplayProcessKernelFrame48
L__DisplayProcessKernelFrame127:
	MOV	#lo_addr(StoneAPI__receiveBuff), W10
	CALL	_ProcessMessage
	MOV	#40, W12
	CLR	W11
	MOV	#lo_addr(StoneAPI__receiveBuff), W10
	CALL	_memset
	CLR	W0
	MOV	W0, StoneAPI_mLen
L_DisplayProcessKernelFrame48:
L_end_DisplayProcessKernelFrame:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _DisplayProcessKernelFrame

_InitDisplay:

	PUSH	W10
	PUSH	W11
	CLR	W11
	MOV	#lo_addr(_displayKVPCmd), W10
	CALL	_UpdateCommandParameter
	CLR	W11
	MOV	#lo_addr(_displaymACmd), W10
	CALL	_UpdateCommandParameter
	CLR	W11
	MOV	#lo_addr(_displayJOGCmd), W10
	CALL	_UpdateCommandParameter
	CLR	W11
	MOV	#lo_addr(_displayTimeCmd), W10
	CALL	_UpdateCommandParameter
L_end_InitDisplay:
	POP	W11
	POP	W10
	RETURN
; end of _InitDisplay

_ShowMainMenue:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(_selectPicture), W10
	CALL	_DisplayCallKernelSendService
L_end_ShowMainMenue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ShowMainMenue

_DisplayAutomaticModeWarmingupState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayAutomaticModeWarmingupState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayAutomaticModeWarmingupState

_DisplayAutomaticModePendingState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
	CALL	_InitParameterBoard
L_end_DisplayAutomaticModePendingState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayAutomaticModePendingState

_DisplayAutomaticModeWorkingState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayAutomaticModeWorkingState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayAutomaticModeWorkingState

_DisplayAutomaticModeErrorState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayAutomaticModeErrorState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayAutomaticModeErrorState

_DisplayServiceModeWarmingupState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayServiceModeWarmingupState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayServiceModeWarmingupState

_DisplayServiceModeWarmupErrorState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayServiceModeWarmupErrorState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayServiceModeWarmupErrorState

_DisplayServiceModePendingState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayServiceModePendingState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayServiceModePendingState

_DisplayServiceModeWorkingState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#11, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayServiceModeWorkingState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayServiceModeWorkingState

_DisplayServiceModeErrorState:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#8, W12
	MOV	#lo_addr(_selectPicture), W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_memcpy
	MOV	#lo_addr(__selectPictureCopy+3), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
	MOV	#8, W12
	CLR	W11
	MOV	#lo_addr(__selectPictureCopy), W10
	CALL	_DisplayCallKernelSendService
L_end_DisplayServiceModeErrorState:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DisplayServiceModeErrorState

_RegisterStartAutomaticModeSessionListener:

	MOV	W10, __automaticModeLst
L_end_RegisterStartAutomaticModeSessionListener:
	RETURN
; end of _RegisterStartAutomaticModeSessionListener

_RegisterGotoHomeListener:

	MOV	W10, __gotoHomeLst
L_end_RegisterGotoHomeListener:
	RETURN
; end of _RegisterGotoHomeListener

_RegisterStartExposureListener:

	MOV	W10, __startExposureLst
L_end_RegisterStartExposureListener:
	RETURN
; end of _RegisterStartExposureListener

_RegisterStopExposureListener:

	MOV	W10, __stopExposureLst
L_end_RegisterStopExposureListener:
	RETURN
; end of _RegisterStopExposureListener

_RegisterStartWarmupEventListener:

	MOV	W10, __startwarmupLst
L_end_RegisterStartWarmupEventListener:
	RETURN
; end of _RegisterStartWarmupEventListener

_RegisterUpdateKvpEventListener:

	MOV	W10, __updateKvpLst
L_end_RegisterUpdateKvpEventListener:
	RETURN
; end of _RegisterUpdateKvpEventListener

_RegisterUpdatemAEventListener:

	MOV	W10, __updatemALst
L_end_RegisterUpdatemAEventListener:
	RETURN
; end of _RegisterUpdatemAEventListener

_RegisterUpdateTimeEventListener:

	MOV	W10, __updateTimeLst
L_end_RegisterUpdateTimeEventListener:
	RETURN
; end of _RegisterUpdateTimeEventListener

_RegisterUpdateJOGEventListener:

	MOV	W10, __updateJogLst
L_end_RegisterUpdateJOGEventListener:
	RETURN
; end of _RegisterUpdateJOGEventListener
