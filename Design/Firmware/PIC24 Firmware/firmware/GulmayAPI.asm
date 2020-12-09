
_RegisterMessageListener:

	MOV	W10, __messageLst
L_end_RegisterMessageListener:
	RETURN
; end of _RegisterMessageListener

_RegisterErrorListener:

	MOV	W10, __errorLst
L_end_RegisterErrorListener:
	RETURN
; end of _RegisterErrorListener

_RegisterGeneratorModeListener:

	MOV	W10, __modeLst
L_end_RegisterGeneratorModeListener:
	RETURN
; end of _RegisterGeneratorModeListener

_RegisterFocalspotListeners:

	MOV	W10, __largFocalSpotSizeTriggeredLst
	MOV	W11, __smallFocalSpotSizeTriggeredLst
L_end_RegisterFocalspotListeners:
	RETURN
; end of _RegisterFocalspotListeners

_RegisterExposureStateListeners:

	MOV	W10, __exposureStartedLst
	MOV	W11, __passedExposureTimeLst
	MOV	W12, __exposureStopedLst
L_end_RegisterExposureStateListeners:
	RETURN
; end of _RegisterExposureStateListeners

_RegisterExposureParameterListeners:

	MOV	W10, __kvpValueLst
	MOV	W11, __ampValueLst
	MOV	W12, __shootTimeLst
L_end_RegisterExposureParameterListeners:
	RETURN
; end of _RegisterExposureParameterListeners

_RegisterWarmupListeners:

	MOV	W12, __warmupFinishedLst
	MOV	W10, __shortWarmupIsRequiredLst
	MOV	W11, __longWarmupIsRequiredLst
L_end_RegisterWarmupListeners:
	RETURN
; end of _RegisterWarmupListeners

_CallKernelSendService:
	LNK	#8

	PUSH	W10
	PUSH	W11
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
	MOV.B	#1, W0
	MOV.B	W0, [W14+1]
	MOV.B	W11, [W14+2]
	MOV	W10, [W14+4]
	CLR	W0
	MOV	W0, [W14+6]
	PUSH	W10
	MOV	#lo_addr(?lstr1_GulmayAPI), W11
	CALL	_strcmp
	POP	W10
	CP	W0, #0
	BRA NZ	L__CallKernelSendService151
	GOTO	L__CallKernelSendService96
L__CallKernelSendService151:
	PUSH	W10
	MOV	#lo_addr(?lstr2_GulmayAPI), W11
	CALL	_strcmp
	POP	W10
	CP	W0, #0
	BRA NZ	L__CallKernelSendService152
	GOTO	L__CallKernelSendService95
L__CallKernelSendService152:
	PUSH	W10
	MOV	#lo_addr(?lstr3_GulmayAPI), W11
	CALL	_strcmp
	POP	W10
	CP	W0, #0
	BRA NZ	L__CallKernelSendService153
	GOTO	L__CallKernelSendService94
L__CallKernelSendService153:
	MOV	#lo_addr(?lstr4_GulmayAPI), W11
	CALL	_strcmp
	CP	W0, #0
	BRA NZ	L__CallKernelSendService154
	GOTO	L__CallKernelSendService93
L__CallKernelSendService154:
	GOTO	L_CallKernelSendService2
L__CallKernelSendService96:
L__CallKernelSendService95:
L__CallKernelSendService94:
L__CallKernelSendService93:
	MOV.B	#1, W0
	MOV.B	W0, [W14+3]
	GOTO	L_CallKernelSendService3
L_CallKernelSendService2:
	MOV.B	#1, W0
	MOV.B	W0, [W14+3]
L_CallKernelSendService3:
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_KL_SendFrame
L_end_CallKernelSendService:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _CallKernelSendService

_IntToThreeDigitString:
	LNK	#10

	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSIntToThreeDigitString__buffer_L0), W0
	REPEAT	#6
	MOV.B	[W0++], [W1++]
	ADD	W14, #0, W0
	MOV	W0, [W14+8]
	PUSH	W11
	MOV	W0, W11
	CALL	_IntToStrWithZeros
	POP	W11
	ADD	W14, #0, W0
	ADD	W0, #3, W0
	MOV.B	[W0], [W11]
	ADD	W11, #1, W1
	MOV	[W14+8], W2
	ADD	W2, #4, W0
	MOV.B	[W0], [W1]
	ADD	W11, #2, W1
	ADD	W2, #5, W0
	MOV.B	[W0], [W1]
L_end_IntToThreeDigitString:
	ULNK
	RETURN
; end of _IntToThreeDigitString

_StringToInteger:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH.D	W10
	MOV	#3, W12
	MOV.B	#32, W11
	MOV	#lo_addr(StringToInteger__temp_L0), W10
	CALL	_memset
	POP.D	W10
	GOTO	L_StringToInteger4
L_StringToInteger6:
	ADD	W10, #2, W0
	MOV	#3, W12
	MOV	W0, W11
	MOV	#lo_addr(StringToInteger__temp_L0), W10
	CALL	_memcpy
	GOTO	L_StringToInteger5
L_StringToInteger7:
	ADD	W10, #6, W0
	MOV	#3, W12
	MOV	W0, W11
	MOV	#lo_addr(StringToInteger__temp_L0), W10
	CALL	_memcpy
	GOTO	L_StringToInteger5
L_StringToInteger8:
	ADD	W10, #10, W0
	MOV	#3, W12
	MOV	W0, W11
	MOV	#lo_addr(StringToInteger__temp_L0), W10
	CALL	_memcpy
	GOTO	L_StringToInteger5
L_StringToInteger9:
	GOTO	L_StringToInteger5
L_StringToInteger4:
	CP	W11, #1
	BRA NZ	L__StringToInteger157
	GOTO	L_StringToInteger6
L__StringToInteger157:
	CP	W11, #2
	BRA NZ	L__StringToInteger158
	GOTO	L_StringToInteger7
L__StringToInteger158:
	CP	W11, #3
	BRA NZ	L__StringToInteger159
	GOTO	L_StringToInteger8
L__StringToInteger159:
	GOTO	L_StringToInteger9
L_StringToInteger5:
	MOV	#lo_addr(StringToInteger__temp_L0), W0
	MOV.B	[W0], W10
	CALL	_isdigit
	CP0	W0
	BRA NZ	L__StringToInteger160
	GOTO	L__StringToInteger100
L__StringToInteger160:
	MOV	#lo_addr(StringToInteger__temp_L0+1), W0
	MOV.B	[W0], W10
	CALL	_isdigit
	CP0	W0
	BRA NZ	L__StringToInteger161
	GOTO	L__StringToInteger99
L__StringToInteger161:
	MOV	#lo_addr(StringToInteger__temp_L0+2), W0
	MOV.B	[W0], W10
	CALL	_isdigit
	CP0	W0
	BRA NZ	L__StringToInteger162
	GOTO	L__StringToInteger98
L__StringToInteger162:
L__StringToInteger97:
	MOV	#lo_addr(StringToInteger__temp_L0), W10
	CALL	_atoi
	GOTO	L_end_StringToInteger
L__StringToInteger100:
L__StringToInteger99:
L__StringToInteger98:
	MOV	#65535, W0
L_end_StringToInteger:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _StringToInteger

_UpdateKvp:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#40, W0
	CP	W0, W10
	BRA LE	L__UpdateKvp164
	GOTO	L__UpdateKvp103
L__UpdateKvp164:
	MOV	#120, W0
	CP	W10, W0
	BRA LE	L__UpdateKvp165
	GOTO	L__UpdateKvp102
L__UpdateKvp165:
L__UpdateKvp101:
	PUSH	W10
	MOV	#6, W12
	MOV.B	#32, W11
	MOV	#lo_addr(UpdateKvp__cmd_L1), W10
	CALL	_memset
	MOV	#3, W12
	MOV.B	#32, W11
	MOV	#lo_addr(UpdateKvp__valueBuffer_L1), W10
	CALL	_memset
	POP	W10
	MOV	#lo_addr(UpdateKvp__valueBuffer_L1), W11
	CALL	_IntToThreeDigitString
	MOV	#2, W12
	MOV	#lo_addr(?lstr5_GulmayAPI), W11
	MOV	#lo_addr(UpdateKvp__cmd_L1), W10
	CALL	_memcpy
	MOV	#3, W12
	MOV	#lo_addr(UpdateKvp__valueBuffer_L1), W11
	MOV	#lo_addr(UpdateKvp__cmd_L1+2), W10
	CALL	_memcpy
	MOV	#lo_addr(UpdateKvp__cmd_L1+5), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(UpdateKvp__cmd_L1+6), W1
	CLR	W0
	MOV.B	W0, [W1]
	CLR	W11
	MOV	#lo_addr(UpdateKvp__cmd_L1), W10
	CALL	_CallKernelSendService
L__UpdateKvp103:
L__UpdateKvp102:
L_end_UpdateKvp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _UpdateKvp

_UpdateAmp:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	CP	W10, #1
	BRA GE	L__UpdateAmp167
	GOTO	L__UpdateAmp106
L__UpdateAmp167:
	MOV	#100, W0
	CP	W10, W0
	BRA LE	L__UpdateAmp168
	GOTO	L__UpdateAmp105
L__UpdateAmp168:
L__UpdateAmp104:
	PUSH	W10
	MOV	#7, W12
	MOV.B	#32, W11
	MOV	#lo_addr(UpdateAmp__cmd_L1), W10
	CALL	_memset
	MOV	#3, W12
	MOV.B	#32, W11
	MOV	#lo_addr(UpdateAmp__valueBuffer_L1), W10
	CALL	_memset
	POP	W10
	MOV	#lo_addr(UpdateAmp__valueBuffer_L1), W11
	CALL	_IntToThreeDigitString
	MOV	#2, W12
	MOV	#lo_addr(?lstr6_GulmayAPI), W11
	MOV	#lo_addr(UpdateAmp__cmd_L1), W10
	CALL	_memcpy
	MOV	#3, W12
	MOV	#lo_addr(UpdateAmp__valueBuffer_L1), W11
	MOV	#lo_addr(UpdateAmp__cmd_L1+2), W10
	CALL	_memcpy
	MOV	#lo_addr(UpdateAmp__cmd_L1+5), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(UpdateAmp__cmd_L1+6), W1
	CLR	W0
	MOV.B	W0, [W1]
	CLR	W11
	MOV	#lo_addr(UpdateAmp__cmd_L1), W10
	CALL	_CallKernelSendService
L__UpdateAmp106:
L__UpdateAmp105:
L_end_UpdateAmp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _UpdateAmp

_UpdateShootTime:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	CP	W10, #1
	BRA GE	L__UpdateShootTime170
	GOTO	L__UpdateShootTime109
L__UpdateShootTime170:
	MOV	#100, W0
	CP	W10, W0
	BRA LE	L__UpdateShootTime171
	GOTO	L__UpdateShootTime108
L__UpdateShootTime171:
L__UpdateShootTime107:
	PUSH	W10
	MOV	#7, W12
	MOV.B	#32, W11
	MOV	#lo_addr(UpdateShootTime__cmd_L1), W10
	CALL	_memset
	MOV	#3, W12
	MOV.B	#32, W11
	MOV	#lo_addr(UpdateShootTime__valueBuffer_L1), W10
	CALL	_memset
	POP	W10
	MOV	#lo_addr(UpdateShootTime__valueBuffer_L1), W11
	CALL	_IntToThreeDigitString
	MOV	#2, W12
	MOV	#lo_addr(?lstr7_GulmayAPI), W11
	MOV	#lo_addr(UpdateShootTime__cmd_L1), W10
	CALL	_memcpy
	MOV	#3, W12
	MOV	#lo_addr(UpdateShootTime__valueBuffer_L1), W11
	MOV	#lo_addr(UpdateShootTime__cmd_L1+2), W10
	CALL	_memcpy
	MOV	#lo_addr(UpdateShootTime__cmd_L1+5), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(UpdateShootTime__cmd_L1+6), W1
	CLR	W0
	MOV.B	W0, [W1]
	CLR	W11
	MOV	#lo_addr(UpdateShootTime__cmd_L1), W10
	CALL	_CallKernelSendService
L__UpdateShootTime109:
L__UpdateShootTime108:
L_end_UpdateShootTime:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _UpdateShootTime

_StartExposure:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#33, W0
	MOV.B	W0, [W14+0]
	MOV	#88, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_StartExposure:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StartExposure

_StopExposure:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#33, W0
	MOV.B	W0, [W14+0]
	MOV	#79, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_StopExposure:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StopExposure

_SetFineFocalSpotSize:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#33, W0
	MOV.B	W0, [W14+0]
	MOV	#70, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_SetFineFocalSpotSize:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SetFineFocalSpotSize

_SetBroadFocalSpotSize:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#33, W0
	MOV.B	W0, [W14+0]
	MOV	#66, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_SetBroadFocalSpotSize:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SetBroadFocalSpotSize

_StartShortTermWarmup:
	LNK	#10

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSStartShortTermWarmup__cmd_L0), W0
	REPEAT	#6
	MOV.B	[W0++], [W1++]
	ADD	W14, #0, W0
	MOV	W0, [W14+8]
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
	ADD	W14, #0, W0
	MOV	#7, W12
	MOV.B	#32, W11
	MOV	W0, W10
	CALL	_memset
	ADD	W14, #0, W0
	MOV	#3, W12
	MOV	#lo_addr(?lstr8_GulmayAPI), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #4, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	[W14+8], W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_StartShortTermWarmup:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StartShortTermWarmup

_StartLongTermWarmup:
	LNK	#10

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSStartLongTermWarmup__cmd_L0), W0
	REPEAT	#6
	MOV.B	[W0++], [W1++]
	ADD	W14, #0, W0
	MOV	W0, [W14+8]
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
	ADD	W14, #0, W0
	MOV	#6, W12
	MOV.B	#32, W11
	MOV	W0, W10
	CALL	_memset
	ADD	W14, #0, W0
	MOV	#3, W12
	MOV	#lo_addr(?lstr9_GulmayAPI), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #4, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	[W14+8], W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_StartLongTermWarmup:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StartLongTermWarmup

_QueryGeneratorMode:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#63, W0
	MOV.B	W0, [W14+0]
	MOV	#77, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_QueryGeneratorMode:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _QueryGeneratorMode

_QueryExposureParameters:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#63, W0
	MOV.B	W0, [W14+0]
	MOV	#88, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_QueryExposureParameters:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _QueryExposureParameters

_GeneratorProcessKernelFrame:
	LNK	#0

	PUSH	W10
	PUSH	W11
	MOV.B	#77, W11
	MOV	[W14-10], W10
	CALL	_strchr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame181
	GOTO	L_GeneratorProcessKernelFrame23
L__GeneratorProcessKernelFrame181:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _mod start address is: 2 (W1)
	MOV	W0, W1
	MOV	__modeLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame182
	GOTO	L__GeneratorProcessKernelFrame122
L__GeneratorProcessKernelFrame182:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame183
	GOTO	L__GeneratorProcessKernelFrame121
L__GeneratorProcessKernelFrame183:
L__GeneratorProcessKernelFrame120:
	MOV	W1, W10
; _mod end address is: 2 (W1)
	MOV	__modeLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame122:
L__GeneratorProcessKernelFrame121:
L_GeneratorProcessKernelFrame23:
	MOV	#lo_addr(?lstr10_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame184
	GOTO	L_GeneratorProcessKernelFrame27
L__GeneratorProcessKernelFrame184:
	MOV	__exposureStopedLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame185
	GOTO	L_GeneratorProcessKernelFrame28
L__GeneratorProcessKernelFrame185:
	MOV	__exposureStopedLst, W0
	CALL	W0
L_GeneratorProcessKernelFrame28:
	GOTO	L_end_GeneratorProcessKernelFrame
L_GeneratorProcessKernelFrame27:
	MOV.B	#86, W11
	MOV	[W14-10], W10
	CALL	_strchr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame186
	GOTO	L_GeneratorProcessKernelFrame29
L__GeneratorProcessKernelFrame186:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _val start address is: 2 (W1)
	MOV	W0, W1
	MOV	__kvpValueLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame187
	GOTO	L__GeneratorProcessKernelFrame124
L__GeneratorProcessKernelFrame187:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame188
	GOTO	L__GeneratorProcessKernelFrame123
L__GeneratorProcessKernelFrame188:
L__GeneratorProcessKernelFrame119:
	MOV	W1, W10
; _val end address is: 2 (W1)
	MOV	__kvpValueLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame124:
L__GeneratorProcessKernelFrame123:
L_GeneratorProcessKernelFrame29:
	MOV.B	#73, W11
	MOV	[W14-10], W10
	CALL	_strchr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame189
	GOTO	L_GeneratorProcessKernelFrame33
L__GeneratorProcessKernelFrame189:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _val start address is: 2 (W1)
	MOV	W0, W1
	MOV	__ampValueLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame190
	GOTO	L__GeneratorProcessKernelFrame126
L__GeneratorProcessKernelFrame190:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame191
	GOTO	L__GeneratorProcessKernelFrame125
L__GeneratorProcessKernelFrame191:
L__GeneratorProcessKernelFrame118:
	MOV	W1, W10
; _val end address is: 2 (W1)
	MOV	__ampValueLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame126:
L__GeneratorProcessKernelFrame125:
L_GeneratorProcessKernelFrame33:
	MOV	#lo_addr(?lstr11_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame192
	GOTO	L_GeneratorProcessKernelFrame37
L__GeneratorProcessKernelFrame192:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _val start address is: 2 (W1)
	MOV	W0, W1
	MOV	__passedExposureTimeLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame193
	GOTO	L__GeneratorProcessKernelFrame128
L__GeneratorProcessKernelFrame193:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame194
	GOTO	L__GeneratorProcessKernelFrame127
L__GeneratorProcessKernelFrame194:
L__GeneratorProcessKernelFrame117:
	MOV	W1, W10
; _val end address is: 2 (W1)
	MOV	__passedExposureTimeLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame128:
L__GeneratorProcessKernelFrame127:
L_GeneratorProcessKernelFrame37:
	MOV	#lo_addr(?lstr12_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame195
	GOTO	L_GeneratorProcessKernelFrame41
L__GeneratorProcessKernelFrame195:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _val start address is: 2 (W1)
	MOV	W0, W1
	MOV	__shootTimeLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame196
	GOTO	L__GeneratorProcessKernelFrame130
L__GeneratorProcessKernelFrame196:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame197
	GOTO	L__GeneratorProcessKernelFrame129
L__GeneratorProcessKernelFrame197:
L__GeneratorProcessKernelFrame116:
	MOV	W1, W10
; _val end address is: 2 (W1)
	MOV	__shootTimeLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame130:
L__GeneratorProcessKernelFrame129:
L_GeneratorProcessKernelFrame41:
	MOV	#lo_addr(?lstr13_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame198
	GOTO	L_GeneratorProcessKernelFrame45
L__GeneratorProcessKernelFrame198:
	MOV	__exposureStartedLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame199
	GOTO	L_GeneratorProcessKernelFrame46
L__GeneratorProcessKernelFrame199:
	MOV	__exposureStartedLst, W0
	CALL	W0
L_GeneratorProcessKernelFrame46:
	GOTO	L_end_GeneratorProcessKernelFrame
L_GeneratorProcessKernelFrame45:
	MOV.B	#69, W11
	MOV	[W14-10], W10
	CALL	_strchr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame200
	GOTO	L_GeneratorProcessKernelFrame47
L__GeneratorProcessKernelFrame200:
	MOV	#lo_addr(?lstr14_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GeneratorProcessKernelFrame201
	GOTO	L_GeneratorProcessKernelFrame48
L__GeneratorProcessKernelFrame201:
	GOTO	L_GeneratorProcessKernelFrame49
L_GeneratorProcessKernelFrame48:
L_GeneratorProcessKernelFrame49:
	MOV	__errorLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame202
	GOTO	L_GeneratorProcessKernelFrame50
L__GeneratorProcessKernelFrame202:
	MOV	[W14-10], W10
	MOV	__errorLst, W0
	CALL	W0
L_GeneratorProcessKernelFrame50:
L_GeneratorProcessKernelFrame47:
	MOV	#lo_addr(?lstr15_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame203
	GOTO	L_GeneratorProcessKernelFrame51
L__GeneratorProcessKernelFrame203:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _KVP start address is: 12 (W6)
	MOV	W0, W6
	MOV	#2, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _mA start address is: 2 (W1)
	MOV	W0, W1
	PUSH	W1
	MOV	#3, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
	POP	W1
; _Time start address is: 4 (W2)
	MOV	W0, W2
	MOV	__kvpValueLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame204
	GOTO	L__GeneratorProcessKernelFrame132
L__GeneratorProcessKernelFrame204:
	MOV	#65535, W0
	CP	W6, W0
	BRA NZ	L__GeneratorProcessKernelFrame205
	GOTO	L__GeneratorProcessKernelFrame131
L__GeneratorProcessKernelFrame205:
L__GeneratorProcessKernelFrame115:
	PUSH	W2
; _KVP end address is: 12 (W6)
	PUSH	W1
	MOV	W6, W10
	MOV	__kvpValueLst, W0
	CALL	W0
	POP	W1
	POP	W2
L__GeneratorProcessKernelFrame132:
L__GeneratorProcessKernelFrame131:
	MOV	__ampValueLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame206
	GOTO	L__GeneratorProcessKernelFrame134
L__GeneratorProcessKernelFrame206:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame207
	GOTO	L__GeneratorProcessKernelFrame133
L__GeneratorProcessKernelFrame207:
L__GeneratorProcessKernelFrame114:
	PUSH	W2
; _mA end address is: 2 (W1)
	MOV	W1, W10
	MOV	__ampValueLst, W0
	CALL	W0
	POP	W2
L__GeneratorProcessKernelFrame134:
L__GeneratorProcessKernelFrame133:
	MOV	__shootTimeLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame208
	GOTO	L__GeneratorProcessKernelFrame136
L__GeneratorProcessKernelFrame208:
	MOV	#65535, W0
	CP	W2, W0
	BRA NZ	L__GeneratorProcessKernelFrame209
	GOTO	L__GeneratorProcessKernelFrame135
L__GeneratorProcessKernelFrame209:
L__GeneratorProcessKernelFrame113:
	MOV	W2, W10
; _Time end address is: 4 (W2)
	MOV	__shootTimeLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame136:
L__GeneratorProcessKernelFrame135:
	GOTO	L_end_GeneratorProcessKernelFrame
L_GeneratorProcessKernelFrame51:
	MOV	#lo_addr(?lstr16_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame210
	GOTO	L_GeneratorProcessKernelFrame61
L__GeneratorProcessKernelFrame210:
	MOV	#1, W11
	MOV	[W14-10], W10
	CALL	_StringToInteger
; _result start address is: 2 (W1)
	MOV	W0, W1
	GOTO	L_GeneratorProcessKernelFrame62
L_GeneratorProcessKernelFrame64:
	MOV	__warmupFinishedLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame211
	GOTO	L__GeneratorProcessKernelFrame138
L__GeneratorProcessKernelFrame211:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame212
	GOTO	L__GeneratorProcessKernelFrame137
L__GeneratorProcessKernelFrame212:
; _result end address is: 2 (W1)
L__GeneratorProcessKernelFrame112:
	MOV	__warmupFinishedLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame138:
L__GeneratorProcessKernelFrame137:
	GOTO	L_GeneratorProcessKernelFrame63
L_GeneratorProcessKernelFrame68:
; _result start address is: 2 (W1)
	MOV	__shortWarmupIsRequiredLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame213
	GOTO	L__GeneratorProcessKernelFrame140
L__GeneratorProcessKernelFrame213:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame214
	GOTO	L__GeneratorProcessKernelFrame139
L__GeneratorProcessKernelFrame214:
; _result end address is: 2 (W1)
L__GeneratorProcessKernelFrame111:
	MOV	__shortWarmupIsRequiredLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame140:
L__GeneratorProcessKernelFrame139:
	GOTO	L_GeneratorProcessKernelFrame63
L_GeneratorProcessKernelFrame72:
; _result start address is: 2 (W1)
	MOV	__longWarmupIsRequiredLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame215
	GOTO	L__GeneratorProcessKernelFrame142
L__GeneratorProcessKernelFrame215:
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame216
	GOTO	L__GeneratorProcessKernelFrame141
L__GeneratorProcessKernelFrame216:
; _result end address is: 2 (W1)
L__GeneratorProcessKernelFrame110:
	MOV	__longWarmupIsRequiredLst, W0
	CALL	W0
L__GeneratorProcessKernelFrame142:
L__GeneratorProcessKernelFrame141:
	GOTO	L_GeneratorProcessKernelFrame63
L_GeneratorProcessKernelFrame62:
; _result start address is: 2 (W1)
	CP	W1, #0
	BRA NZ	L__GeneratorProcessKernelFrame217
	GOTO	L_GeneratorProcessKernelFrame64
L__GeneratorProcessKernelFrame217:
	MOV	#100, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame218
	GOTO	L_GeneratorProcessKernelFrame68
L__GeneratorProcessKernelFrame218:
	MOV	#101, W0
	CP	W1, W0
	BRA NZ	L__GeneratorProcessKernelFrame219
	GOTO	L_GeneratorProcessKernelFrame72
L__GeneratorProcessKernelFrame219:
; _result end address is: 2 (W1)
L_GeneratorProcessKernelFrame63:
L_GeneratorProcessKernelFrame61:
	MOV	#lo_addr(?lstr17_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame220
	GOTO	L_GeneratorProcessKernelFrame76
L__GeneratorProcessKernelFrame220:
	MOV	__largFocalSpotSizeTriggeredLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame221
	GOTO	L_GeneratorProcessKernelFrame77
L__GeneratorProcessKernelFrame221:
	MOV	__largFocalSpotSizeTriggeredLst, W0
	CALL	W0
L_GeneratorProcessKernelFrame77:
	GOTO	L_end_GeneratorProcessKernelFrame
L_GeneratorProcessKernelFrame76:
	MOV	#lo_addr(?lstr18_GulmayAPI), W11
	MOV	[W14-10], W10
	CALL	_strstr
	CP0	W0
	BRA NZ	L__GeneratorProcessKernelFrame222
	GOTO	L_GeneratorProcessKernelFrame78
L__GeneratorProcessKernelFrame222:
	MOV	__smallFocalSpotSizeTriggeredLst, W0
	CP	W0, #0
	BRA NZ	L__GeneratorProcessKernelFrame223
	GOTO	L_GeneratorProcessKernelFrame79
L__GeneratorProcessKernelFrame223:
	MOV	__smallFocalSpotSizeTriggeredLst, W0
	CALL	W0
L_GeneratorProcessKernelFrame79:
L_GeneratorProcessKernelFrame78:
L_end_GeneratorProcessKernelFrame:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GeneratorProcessKernelFrame

_QueryWarmupProgram:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#63, W0
	MOV.B	W0, [W14+0]
	MOV	#87, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_QueryWarmupProgram:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _QueryWarmupProgram

_QueryFocalSpotSize:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#63, W0
	MOV.B	W0, [W14+0]
	MOV	#70, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_QueryFocalSpotSize:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _QueryFocalSpotSize

_SetGeneratorInUserMode:
	LNK	#8

	PUSH	W10
	PUSH	W11
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSSetGeneratorInUserMode__cmd_L0), W0
	REPEAT	#6
	MOV.B	[W0++], [W1++]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_SetGeneratorInUserMode:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SetGeneratorInUserMode

_SuppressErrorsVoltageAndAmpError:
	LNK	#14

	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSSuppressErrorsVoltageAndAmpError__cmd_L0), W0
	REPEAT	#10
	MOV.B	[W0++], [W1++]
	ADD	W14, #0, W0
	MOV	W0, [W14+12]
	MOV	#6, W12
	MOV	#lo_addr(?lstr19_GulmayAPI), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	[W14+12], W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
	ADD	W14, #0, W0
	MOV	#11, W12
	MOV.B	#32, W11
	MOV	W0, W10
	CALL	_memset
	ADD	W14, #0, W0
	MOV	#10, W12
	MOV	#lo_addr(?lstr20_GulmayAPI), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #11, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	[W14+12], W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
	ADD	W14, #0, W0
	MOV	#11, W12
	MOV.B	#32, W11
	MOV	W0, W10
	CALL	_memset
	ADD	W14, #0, W0
	MOV	#6, W12
	MOV	#lo_addr(?lstr21_GulmayAPI), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
	ADD	W14, #0, W0
	MOV	#11, W12
	MOV.B	#32, W11
	MOV	W0, W10
	CALL	_memset
	ADD	W14, #0, W0
	MOV	#6, W12
	MOV	#lo_addr(?lstr22_GulmayAPI), W11
	MOV	W0, W10
	CALL	_memcpy
	ADD	W14, #0, W0
	ADD	W0, #7, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	[W14+12], W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_SuppressErrorsVoltageAndAmpError:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _SuppressErrorsVoltageAndAmpError

_CheckGeneratorErrors:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#63, W0
	MOV.B	W0, [W14+0]
	MOV	#69, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_CheckGeneratorErrors:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _CheckGeneratorErrors

_QueryEllapsedExposureTime:
	LNK	#4

	PUSH	W10
	PUSH	W11
	MOV	#63, W0
	MOV.B	W0, [W14+0]
	MOV	#84, W0
	MOV.B	W0, [W14+1]
	MOV	#13, W0
	MOV.B	W0, [W14+2]
	MOV	#0, W0
	MOV.B	W0, [W14+3]
	ADD	W14, #0, W0
	CLR	W11
	MOV	W0, W10
	CALL	_CallKernelSendService
L_end_QueryEllapsedExposureTime:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _QueryEllapsedExposureTime

_ResetGenerator:

	CALL	_CheckGeneratorErrors
	MOV	#5, W8
	MOV	#17858, W7
L_ResetGenerator80:
	DEC	W7
	BRA NZ	L_ResetGenerator80
	DEC	W8
	BRA NZ	L_ResetGenerator80
	NOP
	CALL	_StopExposure
	MOV	#5, W8
	MOV	#17858, W7
L_ResetGenerator82:
	DEC	W7
	BRA NZ	L_ResetGenerator82
	DEC	W8
	BRA NZ	L_ResetGenerator82
	NOP
	CALL	_QueryExposureParameters
	MOV	#5, W8
	MOV	#17858, W7
L_ResetGenerator84:
	DEC	W7
	BRA NZ	L_ResetGenerator84
	DEC	W8
	BRA NZ	L_ResetGenerator84
	NOP
	CALL	_QueryFocalSpotSize
	MOV	#5, W8
	MOV	#17858, W7
L_ResetGenerator86:
	DEC	W7
	BRA NZ	L_ResetGenerator86
	DEC	W8
	BRA NZ	L_ResetGenerator86
	NOP
	CALL	_QueryGeneratorMode
	MOV	#5, W8
	MOV	#17858, W7
L_ResetGenerator88:
	DEC	W7
	BRA NZ	L_ResetGenerator88
	DEC	W8
	BRA NZ	L_ResetGenerator88
	NOP
	CALL	_QueryWarmupProgram
	MOV	#5, W8
	MOV	#17858, W7
L_ResetGenerator90:
	DEC	W7
	BRA NZ	L_ResetGenerator90
	DEC	W8
	BRA NZ	L_ResetGenerator90
	NOP
L_end_ResetGenerator:
	RETURN
; end of _ResetGenerator
