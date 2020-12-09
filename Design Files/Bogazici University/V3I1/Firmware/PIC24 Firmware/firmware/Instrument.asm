
_StartInstrumentMonitor:

	CLR	T4CON
	CLR	T5CON
	CLR	TMR4
	CLR	TMR5
	BSET	T5IE_bit, BitPos(T5IE_bit+0)
	BCLR	T5IF_bit, BitPos(T5IF_bit+0)
	BSET	T5IP_0_bit, BitPos(T5IP_0_bit+0)
	BSET	T5IP_1_bit, BitPos(T5IP_1_bit+0)
	BSET	T5IP_2_bit, BitPos(T5IP_2_bit+0)
	MOV	#854, W0
	MOV	WREG, PR5
	MOV	#33110, W0
	MOV	WREG, PR4
	BSET	T4CONbits, #15
	BSET	T4CONbits, #3
L_end_StartInstrumentMonitor:
	RETURN
; end of _StartInstrumentMonitor

_StopInstrumentMonitor:

	BCLR	T5IE_bit, BitPos(T5IE_bit+0)
	BCLR	T5IF_bit, BitPos(T5IF_bit+0)
	BCLR	T4IE_bit, BitPos(T4IE_bit+0)
	BCLR	T4IF_bit, BitPos(T4IF_bit+0)
L_end_StopInstrumentMonitor:
	RETURN
; end of _StopInstrumentMonitor

_InstrumentMonitor:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

	BCLR	T5IF_bit, BitPos(T5IF_bit+0)
	CALL	_QueryGeneratorMode
L_end_InstrumentMonitor:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _InstrumentMonitor

_UpdateState:
	LNK	#4

	PUSH	W10
	PUSH	W11
	ADD	W14, #0, W1
	MOV	#lo_addr(___GEN_STAT+2), W0
	MOV	W1, W11
	ZE	[W0], W10
	CALL	_IntToStr
	MOV	#lo_addr(?lstr1_Instrument), W10
	CALL	_UART3_Write_Text
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___DISP_STAT+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__UpdateState35
	GOTO	L_UpdateState0
L__UpdateState35:
	MOV	#lo_addr(___GEN_STAT+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__UpdateState36
	GOTO	L_UpdateState1
L__UpdateState36:
	CALL	_DisplayServiceModePendingState
	CALL	_SetGeneratorInUserMode
	CALL	_InitParameterBoard
	MOV	#lo_addr(___DISP_STAT+1), W1
	CLR	W0
	MOV.B	W0, [W1]
	CALL	_StopInstrumentMonitor
L_UpdateState1:
	GOTO	L_end_UpdateState
L_UpdateState0:
	MOV	#lo_addr(___DISP_STAT+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__UpdateState37
	GOTO	L_UpdateState2
L__UpdateState37:
	MOV	#lo_addr(___GEN_STAT+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__UpdateState38
	GOTO	L_UpdateState3
L__UpdateState38:
	CALL	_DisplayServiceModePendingState
	CALL	_SetGeneratorInUserMode
	CALL	_InitParameterBoard
	CALL	_StopMotor
	MOV	#lo_addr(___DISP_STAT+1), W1
	CLR	W0
	MOV.B	W0, [W1]
	CALL	_StopInstrumentMonitor
L_UpdateState3:
	GOTO	L_end_UpdateState
L_UpdateState2:
	MOV	#lo_addr(___DISP_STAT+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__UpdateState39
	GOTO	L_UpdateState4
L__UpdateState39:
	CALL	_DisplayServiceModePendingState
	CALL	_SetGeneratorInUserMode
	CALL	_InitParameterBoard
	CALL	_StopMotor
	MOV	#lo_addr(___DISP_STAT+1), W1
	CLR	W0
	MOV.B	W0, [W1]
	CALL	_StopInstrumentMonitor
	GOTO	L_end_UpdateState
L_UpdateState4:
L_end_UpdateState:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _UpdateState

_OnGeneratorMessageEventTriggered:

	PUSH	W10
	PUSH	W11
	PUSH	W10
	MOV	#lo_addr(?lstr2_Instrument), W10
	CALL	_UART3_Write_Text
	POP	W10
	CALL	_UART3_Write_Text
	MOV	___GEN_STAT+16, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	W10, W11
	MOV	___GEN_STAT+14, W10
	CALL	_strcat
L_end_OnGeneratorMessageEventTriggered:
	POP	W11
	POP	W10
	RETURN
; end of _OnGeneratorMessageEventTriggered

_OnGeneratorExposureStopedEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr3_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+2), W1
	CLR	W0
	MOV.B	W0, [W1]
L_end_OnGeneratorExposureStopedEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorExposureStopedEventTriggered

_OnGeneratorKvpUpdatedEventTriggered:
	LNK	#4

	PUSH	W11
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W11
	CALL	_IntToStr
	MOV	#lo_addr(?lstr4_Instrument), W10
	CALL	_UART3_Write_Text
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+4
L_end_OnGeneratorKvpUpdatedEventTriggered:
	POP	W11
	ULNK
	RETURN
; end of _OnGeneratorKvpUpdatedEventTriggered

_OnGeneratorModeEventTriggered:

	GOTO	L_OnGeneratorModeEventTriggered5
L_OnGeneratorModeEventTriggered7:
	MOV	#lo_addr(___GEN_STAT+2), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_OnGeneratorModeEventTriggered6
L_OnGeneratorModeEventTriggered8:
	MOV	#lo_addr(___GEN_STAT+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	GOTO	L_OnGeneratorModeEventTriggered6
L_OnGeneratorModeEventTriggered9:
	MOV	#lo_addr(___GEN_STAT+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	GOTO	L_OnGeneratorModeEventTriggered6
L_OnGeneratorModeEventTriggered10:
	MOV	#lo_addr(___GEN_STAT+2), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
	GOTO	L_OnGeneratorModeEventTriggered6
L_OnGeneratorModeEventTriggered11:
	MOV	#lo_addr(___GEN_STAT+2), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	GOTO	L_OnGeneratorModeEventTriggered6
L_OnGeneratorModeEventTriggered5:
	CP	W10, #0
	BRA NZ	L__OnGeneratorModeEventTriggered44
	GOTO	L_OnGeneratorModeEventTriggered7
L__OnGeneratorModeEventTriggered44:
	CP	W10, #1
	BRA NZ	L__OnGeneratorModeEventTriggered45
	GOTO	L_OnGeneratorModeEventTriggered8
L__OnGeneratorModeEventTriggered45:
	CP	W10, #2
	BRA NZ	L__OnGeneratorModeEventTriggered46
	GOTO	L_OnGeneratorModeEventTriggered9
L__OnGeneratorModeEventTriggered46:
	CP	W10, #3
	BRA NZ	L__OnGeneratorModeEventTriggered47
	GOTO	L_OnGeneratorModeEventTriggered10
L__OnGeneratorModeEventTriggered47:
	CP	W10, #4
	BRA NZ	L__OnGeneratorModeEventTriggered48
	GOTO	L_OnGeneratorModeEventTriggered11
L__OnGeneratorModeEventTriggered48:
L_OnGeneratorModeEventTriggered6:
	CALL	_UpdateState
L_end_OnGeneratorModeEventTriggered:
	RETURN
; end of _OnGeneratorModeEventTriggered

_OnGeneratormAUpdatedEventTriggered:
	LNK	#4

	PUSH	W11
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W11
	CALL	_IntToStr
	MOV	#lo_addr(?lstr5_Instrument), W10
	CALL	_UART3_Write_Text
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+6
L_end_OnGeneratormAUpdatedEventTriggered:
	POP	W11
	ULNK
	RETURN
; end of _OnGeneratormAUpdatedEventTriggered

_OnGeneratorPassedExposureTimeEventTriggered:
	LNK	#4

	PUSH	W11
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W11
	CALL	_IntToStr
	MOV	#lo_addr(?lstr6_Instrument), W10
	CALL	_UART3_Write_Text
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+12
L_end_OnGeneratorPassedExposureTimeEventTriggered:
	POP	W11
	ULNK
	RETURN
; end of _OnGeneratorPassedExposureTimeEventTriggered

_OnGeneratorShootTimeEventTriggered:
	LNK	#4

	PUSH	W11
	ADD	W14, #0, W0
	PUSH	W10
	MOV	W0, W11
	CALL	_IntToStr
	MOV	#lo_addr(?lstr7_Instrument), W10
	CALL	_UART3_Write_Text
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+8
L_end_OnGeneratorShootTimeEventTriggered:
	POP	W11
	ULNK
	RETURN
; end of _OnGeneratorShootTimeEventTriggered

_OnGeneratorExposureStartedEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr8_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+2), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
L_end_OnGeneratorExposureStartedEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorExposureStartedEventTriggered

_OnGeneratorErrorEventTriggered:

L_end_OnGeneratorErrorEventTriggered:
	RETURN
; end of _OnGeneratorErrorEventTriggered

_OnGeneratorWarmupFinishedEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr9_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+1), W1
	CLR	W0
	MOV.B	W0, [W1]
L_end_OnGeneratorWarmupFinishedEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorWarmupFinishedEventTriggered

_OnGeneratorRequiresShortWarmupEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr10_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_end_OnGeneratorRequiresShortWarmupEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorRequiresShortWarmupEventTriggered

_OnGeneratorRequiresLongWarmupEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr11_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+1), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
L_end_OnGeneratorRequiresLongWarmupEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorRequiresLongWarmupEventTriggered

_OnGeneratorLargFocalSpotSizeEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr12_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_end_OnGeneratorLargFocalSpotSizeEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorLargFocalSpotSizeEventTriggered

_OnGeneratorSmallFocalSpotSizeEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr13_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+3), W1
	CLR	W0
	MOV.B	W0, [W1]
L_end_OnGeneratorSmallFocalSpotSizeEventTriggered:
	POP	W10
	RETURN
; end of _OnGeneratorSmallFocalSpotSizeEventTriggered

_OnDisplayStartAutomaticModeEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr14_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___DISP_STAT), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L_end_OnDisplayStartAutomaticModeEventTriggered:
	POP	W10
	RETURN
; end of _OnDisplayStartAutomaticModeEventTriggered

_OnDisplayGotoHomeEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr15_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___DISP_STAT), W1
	CLR	W0
	MOV.B	W0, [W1]
L_end_OnDisplayGotoHomeEventTriggered:
	POP	W10
	RETURN
; end of _OnDisplayGotoHomeEventTriggered

_OnDisplayStartExposureEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr16_Instrument), W10
	CALL	_UART3_Write_Text
	CALL	_DisplayServiceModeWorkingState
	CALL	_SetGeneratorInUserMode
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered12:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered12
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered12
	NOP
	MOV	___GEN_STAT+4, W10
	CALL	_UpdateKvp
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered14:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered14
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered14
	NOP
	MOV	___GEN_STAT+6, W10
	CALL	_UpdateAmp
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered16:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered16
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered16
	NOP
	MOV	___GEN_STAT+8, W10
	CALL	_UpdateShootTime
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered18:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered18
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered18
	NOP
	CALL	_TurnOffSliderMotor
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered20:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered20
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered20
	NOP
	MOV	___GEN_STAT+10, W10
	CALL	_SetSliderMotorSpeed
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered22:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered22
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered22
	NOP
	CALL	_TurnOnSliderMotor
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered24:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered24
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered24
	NOP
	CALL	_RotateSliderMotorClockwise
	CALL	_StartExposure
	MOV	#5, W8
	MOV	#17858, W7
L_OnDisplayStartExposureEventTriggered26:
	DEC	W7
	BRA NZ	L_OnDisplayStartExposureEventTriggered26
	DEC	W8
	BRA NZ	L_OnDisplayStartExposureEventTriggered26
	NOP
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
	CALL	_StartInstrumentMonitor
L_end_OnDisplayStartExposureEventTriggered:
	POP	W10
	RETURN
; end of _OnDisplayStartExposureEventTriggered

_OnDisplayStopExposureEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr17_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
L_end_OnDisplayStopExposureEventTriggered:
	POP	W10
	RETURN
; end of _OnDisplayStopExposureEventTriggered

_OnDisplayStartWarmupEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr18_Instrument), W10
	CALL	_UART3_Write_Text
	MOV	#lo_addr(___GEN_STAT+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__OnDisplayStartWarmupEventTriggered64
	GOTO	L_OnDisplayStartWarmupEventTriggered28
L__OnDisplayStartWarmupEventTriggered64:
	CALL	_DisplayServiceModePendingState
	CALL	_SetGeneratorInUserMode
	CALL	_InitParameterBoard
	GOTO	L_end_OnDisplayStartWarmupEventTriggered
L_OnDisplayStartWarmupEventTriggered28:
	MOV	#lo_addr(___GEN_STAT+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__OnDisplayStartWarmupEventTriggered65
	GOTO	L_OnDisplayStartWarmupEventTriggered29
L__OnDisplayStartWarmupEventTriggered65:
	MOV	#lo_addr(?lstr19_Instrument), W10
	CALL	_UART3_Write_Text
	CALL	_DisplayServiceModeWarmingupState
	CALL	_StartShortTermWarmup
	CALL	_StartInstrumentMonitor
	GOTO	L_end_OnDisplayStartWarmupEventTriggered
L_OnDisplayStartWarmupEventTriggered29:
	MOV	#lo_addr(___GEN_STAT+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__OnDisplayStartWarmupEventTriggered66
	GOTO	L_OnDisplayStartWarmupEventTriggered30
L__OnDisplayStartWarmupEventTriggered66:
	MOV	#lo_addr(?lstr20_Instrument), W10
	CALL	_UART3_Write_Text
	CALL	_DisplayServiceModeWarmingupState
	CALL	_StartLongTermWarmup
	CALL	_StartInstrumentMonitor
L_OnDisplayStartWarmupEventTriggered30:
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
L_end_OnDisplayStartWarmupEventTriggered:
	POP	W10
	RETURN
; end of _OnDisplayStartWarmupEventTriggered

_OnDisplayUpdateKvpEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr21_Instrument), W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+4
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
L_end_OnDisplayUpdateKvpEventTriggered:
	RETURN
; end of _OnDisplayUpdateKvpEventTriggered

_OnDisplayUpdatemAEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr22_Instrument), W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+6
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
L_end_OnDisplayUpdatemAEventTriggered:
	RETURN
; end of _OnDisplayUpdatemAEventTriggered

_OnDisplayUpdateTimeEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr23_Instrument), W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+8
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
L_end_OnDisplayUpdateTimeEventTriggered:
	RETURN
; end of _OnDisplayUpdateTimeEventTriggered

_OnDisplayUpdateJOGEventTriggered:

	PUSH	W10
	MOV	#lo_addr(?lstr24_Instrument), W10
	CALL	_UART3_Write_Text
	POP	W10
	MOV	W10, ___GEN_STAT+10
	MOV	#lo_addr(___DISP_STAT+1), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
L_end_OnDisplayUpdateJOGEventTriggered:
	RETURN
; end of _OnDisplayUpdateJOGEventTriggered

_ResetSystem:

	PUSH	W10
	CALL	_ResetGenerator
	CALL	_StopMotor
	MOV	#_MIN_MOTOR_JOG, W10
	CALL	_SetSliderMotorSpeed
	CALL	_InitDisplay
	CALL	_ShowMainMenue
L_end_ResetSystem:
	POP	W10
	RETURN
; end of _ResetSystem

_StartInstrument:
	LNK	#12

	PUSH	W10
	PUSH	W11
	PUSH	W12
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
	MOV	#lo_addr(_OnGeneratorMessageEventTriggered), W10
	CALL	_RegisterMessageListener
	MOV	#lo_addr(_OnGeneratorModeEventTriggered), W10
	CALL	_RegisterGeneratorModeListener
	MOV	#lo_addr(_OnGeneratorSmallFocalSpotSizeEventTriggered), W11
	MOV	#lo_addr(_OnGeneratorLargFocalSpotSizeEventTriggered), W10
	CALL	_RegisterFocalspotListeners
	MOV	#lo_addr(_OnGeneratorExposureStopedEventTriggered), W12
	MOV	#lo_addr(_OnGeneratorPassedExposureTimeEventTriggered), W11
	MOV	#lo_addr(_OnGeneratorExposureStartedEventTriggered), W10
	CALL	_RegisterExposureStateListeners
	MOV	#lo_addr(_OnGeneratorShootTimeEventTriggered), W12
	MOV	#lo_addr(_OnGeneratormAUpdatedEventTriggered), W11
	MOV	#lo_addr(_OnGeneratorKvpUpdatedEventTriggered), W10
	CALL	_RegisterExposureParameterListeners
	MOV	#lo_addr(_OnGeneratorWarmupFinishedEventTriggered), W12
	MOV	#lo_addr(_OnGeneratorRequiresLongWarmupEventTriggered), W11
	MOV	#lo_addr(_OnGeneratorRequiresShortWarmupEventTriggered), W10
	CALL	_RegisterWarmupListeners
	MOV	#lo_addr(_OnDisplayStartAutomaticModeEventTriggered), W10
	CALL	_RegisterStartAutomaticModeSessionListener
	MOV	#lo_addr(_OnDisplayGotoHomeEventTriggered), W10
	CALL	_RegisterGotoHomeListener
	MOV	#lo_addr(_OnDisplayStartExposureEventTriggered), W10
	CALL	_RegisterStartExposureListener
	MOV	#lo_addr(_OnDisplayStopExposureEventTriggered), W10
	CALL	_RegisterStopExposureListener
	MOV	#lo_addr(_OnDisplayStartWarmupEventTriggered), W10
	CALL	_RegisterStartWarmupEventListener
	MOV	#lo_addr(_OnDisplayUpdateKvpEventTriggered), W10
	CALL	_RegisterUpdateKvpEventListener
	MOV	#lo_addr(_OnDisplayUpdatemAEventTriggered), W10
	CALL	_RegisterUpdatemAEventListener
	MOV	#lo_addr(_OnDisplayUpdateTimeEventTriggered), W10
	CALL	_RegisterUpdateTimeEventListener
	MOV	#lo_addr(_OnDisplayUpdateJOGEventTriggered), W10
	CALL	_RegisterUpdateJOGEventListener
	MOV	#_MAX_KVP, W11
	MOV	#_MIN_KVP, W10
	CALL	_SetKvpBoundaries
	MOV	#_MAX_mAMP, W11
	MOV	#_MIN_mAMP, W10
	CALL	_SetmABoundaries
	MOV	#_MAX_EXPOSURE_TIME, W11
	MOV	#_MIN_EXPOSURE_TIME, W10
	CALL	_SetTimeBoundaries
	MOV	#_MAX_MOTOR_JOG, W11
	MOV	#_MIN_MOTOR_JOG, W10
	CALL	_SetJogBoundaries
	CALL	_ResetSystem
L_end_StartInstrument:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StartInstrument
