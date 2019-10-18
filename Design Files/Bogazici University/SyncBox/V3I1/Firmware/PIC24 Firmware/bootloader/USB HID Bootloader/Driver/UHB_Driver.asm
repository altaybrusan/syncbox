
UHB_Driver__Buffer_SaveToFlash:

	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	_Buffer+3072, W1
	MOV	#lo_addr(_Buffer), W0
; bCount start address is: 2 (W1)
	SUB	W1, W0, W1
	MOV	#lo_addr(_Buffer), W0
	MOV	W0, _Buffer+3072
; bCount end address is: 2 (W1)
	MOV	W1, W2
L_UHB_Driver__Buffer_SaveToFlash0:
; bCount start address is: 4 (W2)
	CP	W2, #0
	BRA GT	L_UHB_Driver__Buffer_SaveToFlash36
	GOTO	L_UHB_Driver__Buffer_SaveToFlash1
L_UHB_Driver__Buffer_SaveToFlash36:
	MOV	_Buffer+3072, W12
	MOV	_GPAddress, W10
	MOV	_GPAddress+2, W11
	CALL	_FLASH_Write_Compact
	MOV	#384, W0
; bCount start address is: 6 (W3)
	SUB	W2, W0, W3
; bCount end address is: 4 (W2)
	MOV	_Buffer+3072, W1
	MOV	#384, W0
	ADD	W1, W0, W0
	MOV	W0, _Buffer+3072
	MOV	#256, W1
	MOV	#0, W2
	MOV	#lo_addr(_GPAddress), W0
	ADD	W1, [W0], [W0++]
	ADDC	W2, [W0], [W0--]
	MOV	W3, W2
; bCount end address is: 6 (W3)
	GOTO	L_UHB_Driver__Buffer_SaveToFlash0
L_UHB_Driver__Buffer_SaveToFlash1:
L_end__Buffer_SaveToFlash:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of UHB_Driver__Buffer_SaveToFlash

UHB_Driver_SendBootInfo:

	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_HidWriteBuff), W1
	MOV	#lo_addr(_BootInfo), W0
	REPEAT	#51
	MOV.B	[W0++], [W1++]
	MOV.B	#64, W11
	MOV	#lo_addr(_HidWriteBuff), W10
	CALL	_HID_Write
L_end_SendBootInfo:
	POP	W11
	POP	W10
	RETURN
; end of UHB_Driver_SendBootInfo

UHB_Driver_Check4Cmd:

	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L_UHB_Driver_Check4Cmd39
	GOTO	L_UHB_Driver_Check4Cmd2
L_UHB_Driver_Check4Cmd39:
	MOV	#lo_addr(_HidReadBuff), W0
	ZE	[W0], W0
	CP	W0, #15
	BRA NZ	L_UHB_Driver_Check4Cmd40
	GOTO	L_UHB_Driver_Check4Cmd3
L_UHB_Driver_Check4Cmd40:
	GOTO	L_end_Check4Cmd
L_UHB_Driver_Check4Cmd3:
	MOV	#lo_addr(_CmdCode), W1
	MOV	#lo_addr(_HidReadBuff+1), W0
	MOV.B	[W0], [W1]
	MOV	#lo_addr(_GPAddress), W1
	MOV	#lo_addr(_HidReadBuff+2), W0
	MOV.B	[W0], [W1]
	MOV	#lo_addr(_GPAddress+1), W1
	MOV	#lo_addr(_HidReadBuff+3), W0
	MOV.B	[W0], [W1]
	MOV	#lo_addr(_GPAddress+2), W1
	MOV	#lo_addr(_HidReadBuff+4), W0
	MOV.B	[W0], [W1]
	MOV	#lo_addr(_GPAddress+3), W1
	MOV	#lo_addr(_HidReadBuff+5), W0
	MOV.B	[W0], [W1]
	MOV	#lo_addr(_GPCounter), W1
	MOV	#lo_addr(_HidReadBuff+6), W0
	MOV.B	[W0], [W1]
	MOV	#lo_addr(_GPCounter+1), W1
	MOV	#lo_addr(_HidReadBuff+7), W0
	MOV.B	[W0], [W1]
	GOTO	L_UHB_Driver_Check4Cmd4
L_UHB_Driver_Check4Cmd2:
L_UHB_Driver_Check4Cmd4:
L_end_Check4Cmd:
	RETURN
; end of UHB_Driver_Check4Cmd

UHB_Driver_GetData:

; sPtr start address is: 6 (W3)
	MOV	#lo_addr(_HidReadBuff), W3
; i start address is: 4 (W2)
	CLR	W2
; sPtr end address is: 6 (W3)
; i end address is: 4 (W2)
L_UHB_Driver_GetData5:
; i start address is: 4 (W2)
; sPtr start address is: 6 (W3)
	MOV	#lo_addr(_GPCounter), W0
	CP0	[W0]
	BRA Z	L_UHB_Driver_GetData42
	GOTO	L_UHB_Driver_GetData7
L_UHB_Driver_GetData42:
; sPtr end address is: 6 (W3)
; i end address is: 4 (W2)
	MOV.B	#1, W0
	GOTO	L_end_GetData
L_UHB_Driver_GetData7:
; i start address is: 4 (W2)
; sPtr start address is: 6 (W3)
	MOV	_Buffer+3072, W1
	MOV	#lo_addr(_Buffer), W0
	SUB	W1, W0, W1
	MOV	#3072, W0
	CP	W1, W0
	BRA Z	L_UHB_Driver_GetData43
	GOTO	L_UHB_Driver_GetData8
L_UHB_Driver_GetData43:
; sPtr end address is: 6 (W3)
; i end address is: 4 (W2)
	MOV.B	#1, W0
	GOTO	L_end_GetData
L_UHB_Driver_GetData8:
; i start address is: 4 (W2)
; sPtr start address is: 6 (W3)
	MOV.B	#64, W0
	CP.B	W2, W0
	BRA Z	L_UHB_Driver_GetData44
	GOTO	L_UHB_Driver_GetData9
L_UHB_Driver_GetData44:
; sPtr end address is: 6 (W3)
; i end address is: 4 (W2)
	CLR	W0
	GOTO	L_end_GetData
L_UHB_Driver_GetData9:
; i start address is: 4 (W2)
; sPtr start address is: 6 (W3)
	MOV	_Buffer+3072, W0
	MOV.B	[W3], [W0]
	MOV	_Buffer+3072, W0
	INC	W0
	MOV	W0, _Buffer+3072
	INC	W3
	MOV	#1, W1
	MOV	#lo_addr(_GPCounter), W0
	SUBR	W1, [W0], [W0]
	INC.B	W2
; sPtr end address is: 6 (W3)
; i end address is: 4 (W2)
	GOTO	L_UHB_Driver_GetData5
L_end_GetData:
	RETURN
; end of UHB_Driver_GetData

UHB_Driver_SendACK:

	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_HidWriteBuff), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_HidWriteBuff+1), W0
	MOV.B	W10, [W0]
	MOV.B	#64, W11
	MOV	#lo_addr(_HidWriteBuff), W10
	CALL	_HID_Write
L_end_SendACK:
	POP	W11
	POP	W10
	RETURN
; end of UHB_Driver_SendACK

_StartBootloader:
	LNK	#2

	PUSH	W10
	PUSH	W11
	MOV	#0, W0
	MOV.B	W0, [W14+0]
	MOV	#lo_addr(_Buffer), W0
	MOV	W0, _Buffer+3072
L_StartBootloader10:
	CALL	_USB_Polling_Proc
	CALL	_HID_Read
	CP0.B	W0
	BRA NZ	L__StartBootloader47
	GOTO	L_StartBootloader12
L__StartBootloader47:
	CALL	UHB_Driver_Check4Cmd
	GOTO	L_StartBootloader13
L_StartBootloader15:
	ADD	W14, #0, W0
	CP0.B	[W0]
	BRA NZ	L__StartBootloader48
	GOTO	L_StartBootloader16
L__StartBootloader48:
	CALL	UHB_Driver_GetData
	CP0.B	W0
	BRA NZ	L__StartBootloader49
	GOTO	L_StartBootloader17
L__StartBootloader49:
	MOV	_GPAddress, W2
	MOV	_GPAddress+2, W3
	MOV	#_BOOTLOADER_START, W0
	MOV	#_BOOTLOADER_START+2, W1
	CP	W2, W0
	CPB	W3, W1
	BRA LTU	L__StartBootloader50
	GOTO	L_StartBootloader18
L__StartBootloader50:
	CALL	UHB_Driver__Buffer_SaveToFlash
L_StartBootloader18:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W10
	CALL	UHB_Driver_SendACK
	MOV	#lo_addr(_Buffer), W0
	MOV	W0, _Buffer+3072
	MOV	_GPCounter, W0
	CP	W0, #0
	BRA Z	L__StartBootloader51
	GOTO	L_StartBootloader19
L__StartBootloader51:
	CLR	W0
	MOV.B	W0, [W14+0]
	MOV	#lo_addr(_CmdCode), W1
	CLR	W0
	MOV.B	W0, [W1]
L_StartBootloader19:
L_StartBootloader17:
	GOTO	L_StartBootloader20
L_StartBootloader16:
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
L_StartBootloader20:
	GOTO	L_StartBootloader14
L_StartBootloader21:
L_StartBootloader22:
	MOV	_GPCounter, W2
	MOV	#1, W1
	MOV	#lo_addr(_GPCounter), W0
	SUBR	W1, [W0], [W0]
	CP0	W2
	BRA NZ	L__StartBootloader52
	GOTO	L_StartBootloader23
L__StartBootloader52:
	MOV	_GPAddress, W2
	MOV	_GPAddress+2, W3
	MOV	#_BOOTLOADER_START, W0
	MOV	#_BOOTLOADER_START+2, W1
	CP	W2, W0
	CPB	W3, W1
	BRA LTU	L__StartBootloader53
	GOTO	L_StartBootloader24
L__StartBootloader53:
	MOV	_GPAddress, W10
	MOV	_GPAddress+2, W11
	CALL	_FLASH_Erase
L_StartBootloader24:
	MOV	#2048, W1
	MOV	#0, W2
	MOV	#lo_addr(_GPAddress), W0
	SUBR	W1, [W0], [W0++]
	SUBBR	W2, [W0], [W0--]
	GOTO	L_StartBootloader22
L_StartBootloader23:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W10
	CALL	UHB_Driver_SendACK
	MOV	#lo_addr(_CmdCode), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_StartBootloader14
L_StartBootloader25:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W10
	CALL	UHB_Driver_SendACK
	MOV	#lo_addr(_CmdCode), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_StartBootloader14
L_StartBootloader26:
	RESET
	MOV	#lo_addr(_CmdCode), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_StartBootloader14
L_StartBootloader13:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #11
	BRA NZ	L__StartBootloader54
	GOTO	L_StartBootloader15
L__StartBootloader54:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #21
	BRA NZ	L__StartBootloader55
	GOTO	L_StartBootloader21
L__StartBootloader55:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__StartBootloader56
	GOTO	L_StartBootloader25
L__StartBootloader56:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__StartBootloader57
	GOTO	L_StartBootloader26
L__StartBootloader57:
L_StartBootloader14:
L_StartBootloader12:
	GOTO	L_StartBootloader10
L_end_StartBootloader:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _StartBootloader

_EnterBootloaderMode:
	LNK	#2

	PUSH	W10
	MOV	#5000, W0
	MOV	W0, [W14+0]
L_EnterBootloaderMode27:
	CALL	_USB_Polling_Proc
	CALL	_HID_Read
	CP0.B	W0
	BRA NZ	L__EnterBootloaderMode59
	GOTO	L_EnterBootloaderMode29
L__EnterBootloaderMode59:
	CALL	UHB_Driver_Check4Cmd
	GOTO	L_EnterBootloaderMode30
L_EnterBootloaderMode32:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W10
	CALL	UHB_Driver_SendACK
	MOV	#lo_addr(_CmdCode), W1
	CLR	W0
	MOV.B	W0, [W1]
	CALL	_Delay_10ms
	MOV.B	#1, W0
	GOTO	L_end_EnterBootloaderMode
L_EnterBootloaderMode33:
	CALL	UHB_Driver_SendBootInfo
	MOV	#lo_addr(_CmdCode), W1
	CLR	W0
	MOV.B	W0, [W1]
	GOTO	L_EnterBootloaderMode31
L_EnterBootloaderMode30:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__EnterBootloaderMode60
	GOTO	L_EnterBootloaderMode32
L__EnterBootloaderMode60:
	MOV	#lo_addr(_CmdCode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__EnterBootloaderMode61
	GOTO	L_EnterBootloaderMode33
L__EnterBootloaderMode61:
L_EnterBootloaderMode31:
L_EnterBootloaderMode29:
	CALL	_Delay_1ms
	MOV	[W14+0], W2
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	SUB	W1, #1, [W0]
	CP0	W2
	BRA Z	L__EnterBootloaderMode62
	GOTO	L_EnterBootloaderMode34
L__EnterBootloaderMode62:
	CLR	W0
	GOTO	L_end_EnterBootloaderMode
L_EnterBootloaderMode34:
	GOTO	L_EnterBootloaderMode27
L_end_EnterBootloaderMode:
	POP	W10
	ULNK
	RETURN
; end of _EnterBootloaderMode

_StartProgram:

	NOP
L_end_StartProgram:
	RETURN
; end of _StartProgram
