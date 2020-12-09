
ll_initNode:

	CP0	W10
	BRA Z	L_ll_initNode52
	GOTO	L_ll_initNode0
L_ll_initNode52:
	GOTO	L_end_initNode
L_ll_initNode0:
	ADD	W10, #2, W4
	ADD	W10, #4, W3
	ADD	W10, #6, W2
	ADD	W10, #8, W1
	CLR	W0
	MOV	W0, [W1]
	MOV	[W1], [W2]
	MOV	[W2], [W3]
	MOV	[W3], [W4]
L_end_initNode:
	RETURN
; end of ll_initNode

_addNode:

	CP0	W11
	BRA NZ	L__addNode54
	GOTO	L_addNode2
L__addNode54:
	CP0	W12
	BRA NZ	L__addNode55
	GOTO	L_addNode2
L__addNode55:
	MOV.B	#1, W0
	GOTO	L_addNode1
L_addNode2:
	CLR	W0
L_addNode1:
	CP0.B	W0
	BRA Z	L__addNode56
	GOTO	L_addNode3
L__addNode56:
	GOTO	L_end_addNode
L_addNode3:
	PUSH	W10
	MOV	W11, W10
	CALL	ll_initNode
	POP	W10
	CP0	W10
	BRA NZ	L__addNode57
	GOTO	L__addNode40
L__addNode57:
	ADD	W10, #2, W0
	CP0	[W0]
	BRA Z	L__addNode58
	GOTO	L__addNode39
L__addNode58:
L__addNode38:
	ADD	W10, #2, W0
	MOV	W11, [W0]
L__addNode40:
L__addNode39:
; intPass start address is: 0 (W0)
	MOV	#1, W0
; intPass end address is: 0 (W0)
	MOV	W0, W2
L_addNode7:
; intPass start address is: 4 (W2)
	CP	W2, #2
	BRA LE	L__addNode59
	GOTO	L_addNode8
L__addNode59:
	MOV	W10, ll_pTmpLLitr
; intPass end address is: 4 (W2)
L_addNode10:
; intPass start address is: 4 (W2)
	MOV	#lo_addr(ll_pTmpLLitr), W0
	CP0	[W0]
	BRA NZ	L__addNode60
	GOTO	L_addNode11
L__addNode60:
	CP	W2, #1
	BRA Z	L__addNode61
	GOTO	L__addNode42
L__addNode61:
	MOV	#lo_addr(ll_pTmpLLitr), W0
	CP	W11, [W0]
	BRA Z	L__addNode62
	GOTO	L__addNode41
L__addNode62:
; intPass end address is: 4 (W2)
L__addNode37:
; intPass start address is: 4 (W2)
	MOV	#2, W2
	GOTO	L_addNode16
L__addNode42:
L__addNode41:
	CP	W2, #2
	BRA Z	L__addNode63
	GOTO	L_addNode17
L__addNode63:
	MOV	ll_pTmpLLitr, W0
	INC2	W0
	MOV	W10, [W0]
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #4, W0
	CP0	[W0]
	BRA Z	L__addNode64
	GOTO	L__addNode44
L__addNode64:
	MOV	#lo_addr(ll_pTmpLLitr), W0
	CP	W11, [W0]
	BRA NZ	L__addNode65
	GOTO	L__addNode43
L__addNode65:
L__addNode36:
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #4, W0
	MOV	W11, [W0]
	ADD	W11, #6, W1
	MOV	ll_pTmpLLitr, W0
	MOV	W0, [W1]
	ADD	W11, #2, W0
	MOV	W10, [W0]
L__addNode44:
L__addNode43:
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #8, W0
	MOV	W11, [W0]
L_addNode17:
L_addNode16:
; intPass end address is: 4 (W2)
; intPass start address is: 4 (W2)
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	MOV	W0, ll_pTmpLLitr
	GOTO	L_addNode10
L_addNode11:
	INC	W2
; intPass end address is: 4 (W2)
	GOTO	L_addNode7
L_addNode8:
	MOV	W12, [W11]
L_end_addNode:
	RETURN
; end of _addNode

_removeNode:

	CP0	W10
	BRA Z	L__removeNode67
	GOTO	L_removeNode21
L__removeNode67:
	GOTO	L_end_removeNode
L_removeNode21:
	ADD	W10, #6, W0
	CP0	[W0]
	BRA NZ	L__removeNode68
	GOTO	L_removeNode22
L__removeNode68:
	ADD	W10, #6, W0
	MOV	[W0], W0
	ADD	W0, #4, W1
	ADD	W10, #4, W0
	MOV	[W0], [W1]
L_removeNode22:
	ADD	W10, #2, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA Z	L__removeNode69
	GOTO	L__removeNode48
L__removeNode69:
	ADD	W10, #4, W0
	CP0	[W0]
	BRA NZ	L__removeNode70
	GOTO	L__removeNode47
L__removeNode70:
L__removeNode46:
	ADD	W10, #2, W0
	MOV	[W0], W0
	MOV	W0, ll_pTmpLLitr
L_removeNode26:
	MOV	#lo_addr(ll_pTmpLLitr), W0
	CP0	[W0]
	BRA NZ	L__removeNode71
	GOTO	L_removeNode27
L__removeNode71:
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #2, W1
	ADD	W10, #4, W0
	MOV	[W0], [W1]
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	MOV	W0, ll_pTmpLLitr
	GOTO	L_removeNode26
L_removeNode27:
L__removeNode48:
L__removeNode47:
	ADD	W10, #8, W0
	MOV	[W0], W0
	CP	W0, W10
	BRA Z	L__removeNode72
	GOTO	L__removeNode50
L__removeNode72:
	ADD	W10, #6, W0
	CP0	[W0]
	BRA NZ	L__removeNode73
	GOTO	L__removeNode49
L__removeNode73:
L__removeNode45:
	ADD	W10, #2, W0
	MOV	[W0], W0
	MOV	W0, ll_pTmpLLitr
L_removeNode32:
	MOV	#lo_addr(ll_pTmpLLitr), W0
	CP0	[W0]
	BRA NZ	L__removeNode74
	GOTO	L_removeNode33
L__removeNode74:
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #8, W1
	ADD	W10, #6, W0
	MOV	[W0], [W1]
	MOV	ll_pTmpLLitr, W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	MOV	W0, ll_pTmpLLitr
	GOTO	L_removeNode32
L_removeNode33:
L__removeNode50:
L__removeNode49:
	ADD	W10, #4, W0
	CP0	[W0]
	BRA NZ	L__removeNode75
	GOTO	L_removeNode35
L__removeNode75:
	ADD	W10, #4, W0
	MOV	[W0], W0
	ADD	W0, #6, W1
	ADD	W10, #6, W0
	MOV	[W0], [W1]
L_removeNode35:
	CALL	ll_initNode
L_end_removeNode:
	RETURN
; end of _removeNode
