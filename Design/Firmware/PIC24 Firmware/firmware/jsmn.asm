
jsmn_jsmn_alloc_token:

	ADD	W10, #2, W0
	MOV	[W0], W0
	CP	W0, W12
	BRA GEU	L_jsmn_jsmn_alloc_token188
	GOTO	L_jsmn_jsmn_alloc_token0
L_jsmn_jsmn_alloc_token188:
	CLR	W0
	GOTO	L_end_jsmn_alloc_token
L_jsmn_jsmn_alloc_token0:
	ADD	W10, #2, W2
	MOV	[W2], W1
	SL	W1, #3, W0
; tok start address is: 6 (W3)
	ADD	W11, W0, W3
	ADD	W1, #1, W0
	MOV	W0, [W2]
	ADD	W3, #2, W2
	ADD	W3, #4, W1
	MOV	#65535, W0
	MOV	W0, [W1]
	MOV	[W1], [W2]
	ADD	W3, #6, W1
	CLR	W0
	MOV	W0, [W1]
	MOV	W3, W0
; tok end address is: 6 (W3)
L_end_jsmn_alloc_token:
	RETURN
; end of jsmn_jsmn_alloc_token

jsmn_jsmn_fill_token:

	MOV.B	W11, [W10]
	ADD	W10, #2, W0
	MOV	W12, [W0]
	ADD	W10, #4, W0
	MOV	W13, [W0]
	ADD	W10, #6, W1
	CLR	W0
	MOV	W0, [W1]
L_end_jsmn_fill_token:
	RETURN
; end of jsmn_jsmn_fill_token

jsmn_jsmn_parse_primitive:
	LNK	#0

; num_tokens start address is: 6 (W3)
	MOV	[W14-8], W3
	MOV	[W10], W0
; start start address is: 8 (W4)
	MOV	W0, W4
; start end address is: 8 (W4)
; num_tokens end address is: 6 (W3)
L_jsmn_jsmn_parse_primitive1:
; start start address is: 8 (W4)
; num_tokens start address is: 6 (W3)
	MOV	[W10], W0
	CP	W0, W12
	BRA LTU	L_jsmn_jsmn_parse_primitive191
	GOTO	L_jsmn_jsmn_parse_primitive131
L_jsmn_jsmn_parse_primitive191:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L_jsmn_jsmn_parse_primitive192
	GOTO	L_jsmn_jsmn_parse_primitive130
L_jsmn_jsmn_parse_primitive192:
L_jsmn_jsmn_parse_primitive127:
	MOV	[W10], W0
	ADD	W11, W0, W2
	GOTO	L_jsmn_jsmn_parse_primitive6
L_jsmn_jsmn_parse_primitive8:
L_jsmn_jsmn_parse_primitive9:
L_jsmn_jsmn_parse_primitive10:
L_jsmn_jsmn_parse_primitive11:
L_jsmn_jsmn_parse_primitive12:
L_jsmn_jsmn_parse_primitive13:
L_jsmn_jsmn_parse_primitive14:
L_jsmn_jsmn_parse_primitive15:
	GOTO	___jsmn_parse_primitive_found
L_jsmn_jsmn_parse_primitive6:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#58, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_primitive193
	GOTO	L_jsmn_jsmn_parse_primitive8
L_jsmn_jsmn_parse_primitive193:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W0
	CP.B	W0, #9
	BRA NZ	L_jsmn_jsmn_parse_primitive194
	GOTO	L_jsmn_jsmn_parse_primitive9
L_jsmn_jsmn_parse_primitive194:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W0
	CP.B	W0, #13
	BRA NZ	L_jsmn_jsmn_parse_primitive195
	GOTO	L_jsmn_jsmn_parse_primitive10
L_jsmn_jsmn_parse_primitive195:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W0
	CP.B	W0, #10
	BRA NZ	L_jsmn_jsmn_parse_primitive196
	GOTO	L_jsmn_jsmn_parse_primitive11
L_jsmn_jsmn_parse_primitive196:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#32, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_primitive197
	GOTO	L_jsmn_jsmn_parse_primitive12
L_jsmn_jsmn_parse_primitive197:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#44, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_primitive198
	GOTO	L_jsmn_jsmn_parse_primitive13
L_jsmn_jsmn_parse_primitive198:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#93, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_primitive199
	GOTO	L_jsmn_jsmn_parse_primitive14
L_jsmn_jsmn_parse_primitive199:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#125, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_primitive200
	GOTO	L_jsmn_jsmn_parse_primitive15
L_jsmn_jsmn_parse_primitive200:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#32, W0
	CP.B	W1, W0
	BRA GEU	L_jsmn_jsmn_parse_primitive201
	GOTO	L_jsmn_jsmn_parse_primitive129
L_jsmn_jsmn_parse_primitive201:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#127, W0
	CP.B	W1, W0
	BRA LTU	L_jsmn_jsmn_parse_primitive202
	GOTO	L_jsmn_jsmn_parse_primitive128
L_jsmn_jsmn_parse_primitive202:
	GOTO	L_jsmn_jsmn_parse_primitive18
; num_tokens end address is: 6 (W3)
L_jsmn_jsmn_parse_primitive129:
L_jsmn_jsmn_parse_primitive128:
	MOV	W4, [W10]
; start end address is: 8 (W4)
	MOV	#65534, W0
	GOTO	L_end_jsmn_parse_primitive
L_jsmn_jsmn_parse_primitive18:
; num_tokens start address is: 6 (W3)
; start start address is: 8 (W4)
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W10]
	GOTO	L_jsmn_jsmn_parse_primitive1
L_jsmn_jsmn_parse_primitive131:
L_jsmn_jsmn_parse_primitive130:
___jsmn_parse_primitive_found:
	CP	W13, #0
	BRA Z	L_jsmn_jsmn_parse_primitive203
	GOTO	L_jsmn_jsmn_parse_primitive19
L_jsmn_jsmn_parse_primitive203:
; start end address is: 8 (W4)
; num_tokens end address is: 6 (W3)
	MOV	[W10], W0
	DEC	W0
	MOV	W0, [W10]
	CLR	W0
	GOTO	L_end_jsmn_parse_primitive
L_jsmn_jsmn_parse_primitive19:
; num_tokens start address is: 6 (W3)
; start start address is: 8 (W4)
	PUSH	W12
; num_tokens end address is: 6 (W3)
	PUSH	W11
	MOV	W3, W12
	MOV	W13, W11
	CALL	jsmn_jsmn_alloc_token
	POP	W11
	POP	W12
; token start address is: 2 (W1)
	MOV	W0, W1
	CP	W0, #0
	BRA Z	L_jsmn_jsmn_parse_primitive204
	GOTO	L_jsmn_jsmn_parse_primitive20
L_jsmn_jsmn_parse_primitive204:
; token end address is: 2 (W1)
	MOV	W4, [W10]
; start end address is: 8 (W4)
	MOV	#65535, W0
	GOTO	L_end_jsmn_parse_primitive
L_jsmn_jsmn_parse_primitive20:
; token start address is: 2 (W1)
; start start address is: 8 (W4)
	PUSH.D	W12
	PUSH.D	W10
	MOV	[W10], W13
	MOV	W4, W12
; start end address is: 8 (W4)
	MOV.B	#4, W11
	MOV	W1, W10
; token end address is: 2 (W1)
	CALL	jsmn_jsmn_fill_token
	POP.D	W10
	POP.D	W12
	MOV	[W10], W0
	DEC	W0
	MOV	W0, [W10]
	CLR	W0
L_end_jsmn_parse_primitive:
	ULNK
	RETURN
; end of jsmn_jsmn_parse_primitive

jsmn_jsmn_parse_string:
	LNK	#2

; num_tokens start address is: 6 (W3)
	MOV	[W14-8], W3
	MOV	[W10], W0
; start start address is: 8 (W4)
	MOV	W0, W4
	INC	W0
	MOV	W0, [W10]
; num_tokens end address is: 6 (W3)
; start end address is: 8 (W4)
L_jsmn_jsmn_parse_string21:
; start start address is: 8 (W4)
; num_tokens start address is: 6 (W3)
	MOV	[W10], W0
	CP	W0, W12
	BRA LTU	L_jsmn_jsmn_parse_string206
	GOTO	L_jsmn_jsmn_parse_string150
L_jsmn_jsmn_parse_string206:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L_jsmn_jsmn_parse_string207
	GOTO	L_jsmn_jsmn_parse_string149
L_jsmn_jsmn_parse_string207:
L_jsmn_jsmn_parse_string137:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
; c start address is: 4 (W2)
	MOV.B	W1, W2
	MOV.B	#34, W0
	CP.B	W1, W0
	BRA Z	L_jsmn_jsmn_parse_string208
	GOTO	L_jsmn_jsmn_parse_string26
L_jsmn_jsmn_parse_string208:
; c end address is: 4 (W2)
	CP	W13, #0
	BRA Z	L_jsmn_jsmn_parse_string209
	GOTO	L_jsmn_jsmn_parse_string27
L_jsmn_jsmn_parse_string209:
; num_tokens end address is: 6 (W3)
; start end address is: 8 (W4)
	CLR	W0
	GOTO	L_end_jsmn_parse_string
L_jsmn_jsmn_parse_string27:
; start start address is: 8 (W4)
; num_tokens start address is: 6 (W3)
	PUSH	W12
; num_tokens end address is: 6 (W3)
	PUSH	W11
	MOV	W3, W12
	MOV	W13, W11
	CALL	jsmn_jsmn_alloc_token
	POP	W11
	POP	W12
; token start address is: 4 (W2)
	MOV	W0, W2
	CP	W0, #0
	BRA Z	L_jsmn_jsmn_parse_string210
	GOTO	L_jsmn_jsmn_parse_string28
L_jsmn_jsmn_parse_string210:
; token end address is: 4 (W2)
	MOV	W4, [W10]
; start end address is: 8 (W4)
	MOV	#65535, W0
	GOTO	L_end_jsmn_parse_string
L_jsmn_jsmn_parse_string28:
; start start address is: 8 (W4)
; token start address is: 4 (W2)
	MOV	[W10], W1
	ADD	W4, #1, W0
; start end address is: 8 (W4)
	PUSH.D	W12
	PUSH.D	W10
	MOV	W1, W13
	MOV	W0, W12
	MOV.B	#3, W11
	MOV	W2, W10
; token end address is: 4 (W2)
	CALL	jsmn_jsmn_fill_token
	POP.D	W10
	POP.D	W12
	CLR	W0
	GOTO	L_end_jsmn_parse_string
L_jsmn_jsmn_parse_string26:
; start start address is: 8 (W4)
; num_tokens start address is: 6 (W3)
; c start address is: 4 (W2)
	MOV.B	#92, W0
	CP.B	W2, W0
	BRA Z	L_jsmn_jsmn_parse_string211
	GOTO	L_jsmn_jsmn_parse_string151
L_jsmn_jsmn_parse_string211:
; c end address is: 4 (W2)
	MOV	[W10], W0
	INC	W0
	CP	W0, W12
	BRA LTU	L_jsmn_jsmn_parse_string212
	GOTO	L_jsmn_jsmn_parse_string152
L_jsmn_jsmn_parse_string212:
L_jsmn_jsmn_parse_string136:
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W10]
	MOV	[W10], W0
	ADD	W11, W0, W2
	GOTO	L_jsmn_jsmn_parse_string32
L_jsmn_jsmn_parse_string34:
L_jsmn_jsmn_parse_string35:
L_jsmn_jsmn_parse_string36:
L_jsmn_jsmn_parse_string37:
L_jsmn_jsmn_parse_string38:
L_jsmn_jsmn_parse_string39:
L_jsmn_jsmn_parse_string40:
L_jsmn_jsmn_parse_string41:
	MOV	W4, W1
	MOV	W3, W0
	GOTO	L_jsmn_jsmn_parse_string33
L_jsmn_jsmn_parse_string42:
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W10]
	CLR	W0
	MOV	W0, [W14+0]
; num_tokens end address is: 6 (W3)
; start end address is: 8 (W4)
L_jsmn_jsmn_parse_string43:
; num_tokens start address is: 6 (W3)
; start start address is: 8 (W4)
	MOV	[W14+0], W0
	CP	W0, #4
	BRA LT	L_jsmn_jsmn_parse_string213
	GOTO	L_jsmn_jsmn_parse_string146
L_jsmn_jsmn_parse_string213:
	MOV	[W10], W0
	CP	W0, W12
	BRA LTU	L_jsmn_jsmn_parse_string214
	GOTO	L_jsmn_jsmn_parse_string145
L_jsmn_jsmn_parse_string214:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L_jsmn_jsmn_parse_string215
	GOTO	L_jsmn_jsmn_parse_string144
L_jsmn_jsmn_parse_string215:
L_jsmn_jsmn_parse_string135:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA GEU	L_jsmn_jsmn_parse_string216
	GOTO	L_jsmn_jsmn_parse_string139
L_jsmn_jsmn_parse_string216:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#57, W0
	CP.B	W1, W0
	BRA LEU	L_jsmn_jsmn_parse_string217
	GOTO	L_jsmn_jsmn_parse_string138
L_jsmn_jsmn_parse_string217:
	GOTO	L_jsmn_jsmn_parse_string53
L_jsmn_jsmn_parse_string139:
L_jsmn_jsmn_parse_string138:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA GEU	L_jsmn_jsmn_parse_string218
	GOTO	L_jsmn_jsmn_parse_string141
L_jsmn_jsmn_parse_string218:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#70, W0
	CP.B	W1, W0
	BRA LEU	L_jsmn_jsmn_parse_string219
	GOTO	L_jsmn_jsmn_parse_string140
L_jsmn_jsmn_parse_string219:
	GOTO	L_jsmn_jsmn_parse_string53
L_jsmn_jsmn_parse_string141:
L_jsmn_jsmn_parse_string140:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#97, W0
	CP.B	W1, W0
	BRA GEU	L_jsmn_jsmn_parse_string220
	GOTO	L_jsmn_jsmn_parse_string143
L_jsmn_jsmn_parse_string220:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W1
	MOV.B	#102, W0
	CP.B	W1, W0
	BRA LEU	L_jsmn_jsmn_parse_string221
	GOTO	L_jsmn_jsmn_parse_string142
L_jsmn_jsmn_parse_string221:
	GOTO	L_jsmn_jsmn_parse_string53
L_jsmn_jsmn_parse_string143:
L_jsmn_jsmn_parse_string142:
	CLR	W1
	GOTO	L_jsmn_jsmn_parse_string52
L_jsmn_jsmn_parse_string53:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_jsmn_jsmn_parse_string52:
	CP0.B	W1
	BRA Z	L_jsmn_jsmn_parse_string222
	GOTO	L_jsmn_jsmn_parse_string56
L_jsmn_jsmn_parse_string222:
; num_tokens end address is: 6 (W3)
	MOV	W4, [W10]
; start end address is: 8 (W4)
	MOV	#65534, W0
	GOTO	L_end_jsmn_parse_string
L_jsmn_jsmn_parse_string56:
; start start address is: 8 (W4)
; num_tokens start address is: 6 (W3)
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W10]
	MOV	#1, W1
	ADD	W14, #0, W0
	ADD	W1, [W0], [W0]
	GOTO	L_jsmn_jsmn_parse_string43
L_jsmn_jsmn_parse_string146:
L_jsmn_jsmn_parse_string145:
L_jsmn_jsmn_parse_string144:
	MOV	[W10], W0
	DEC	W0
	MOV	W0, [W10]
	MOV	W4, W1
; num_tokens end address is: 6 (W3)
	MOV	W3, W0
	GOTO	L_jsmn_jsmn_parse_string33
L_jsmn_jsmn_parse_string57:
	MOV	W4, [W10]
; start end address is: 8 (W4)
	MOV	#65534, W0
	GOTO	L_end_jsmn_parse_string
L_jsmn_jsmn_parse_string32:
; start start address is: 8 (W4)
; num_tokens start address is: 6 (W3)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#34, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string223
	GOTO	L_jsmn_jsmn_parse_string34
L_jsmn_jsmn_parse_string223:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#47, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string224
	GOTO	L_jsmn_jsmn_parse_string35
L_jsmn_jsmn_parse_string224:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#92, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string225
	GOTO	L_jsmn_jsmn_parse_string36
L_jsmn_jsmn_parse_string225:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#98, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string226
	GOTO	L_jsmn_jsmn_parse_string37
L_jsmn_jsmn_parse_string226:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#102, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string227
	GOTO	L_jsmn_jsmn_parse_string38
L_jsmn_jsmn_parse_string227:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#114, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string228
	GOTO	L_jsmn_jsmn_parse_string39
L_jsmn_jsmn_parse_string228:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#110, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string229
	GOTO	L_jsmn_jsmn_parse_string40
L_jsmn_jsmn_parse_string229:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#116, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string230
	GOTO	L_jsmn_jsmn_parse_string41
L_jsmn_jsmn_parse_string230:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W2], W1
	MOV.B	#117, W0
	CP.B	W1, W0
	BRA NZ	L_jsmn_jsmn_parse_string231
	GOTO	L_jsmn_jsmn_parse_string42
L_jsmn_jsmn_parse_string231:
; num_tokens end address is: 6 (W3)
	GOTO	L_jsmn_jsmn_parse_string57
; start end address is: 8 (W4)
L_jsmn_jsmn_parse_string33:
; num_tokens start address is: 0 (W0)
; start start address is: 2 (W1)
	MOV	W0, W3
; num_tokens end address is: 0 (W0)
; start end address is: 2 (W1)
	MOV	W1, W0
	GOTO	L_jsmn_jsmn_parse_string148
L_jsmn_jsmn_parse_string151:
	MOV	W4, W0
L_jsmn_jsmn_parse_string148:
; num_tokens start address is: 6 (W3)
; start start address is: 0 (W0)
	MOV	W0, W4
; start end address is: 0 (W0)
; num_tokens end address is: 6 (W3)
	GOTO	L_jsmn_jsmn_parse_string147
L_jsmn_jsmn_parse_string152:
L_jsmn_jsmn_parse_string147:
; num_tokens start address is: 6 (W3)
; start start address is: 8 (W4)
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W10]
; num_tokens end address is: 6 (W3)
	GOTO	L_jsmn_jsmn_parse_string21
L_jsmn_jsmn_parse_string150:
L_jsmn_jsmn_parse_string149:
	MOV	W4, [W10]
; start end address is: 8 (W4)
	MOV	#65533, W0
L_end_jsmn_parse_string:
	ULNK
	RETURN
; end of jsmn_jsmn_parse_string

_jsmn_parse:
	LNK	#8

; num_tokens start address is: 12 (W6)
	MOV	[W14-8], W6
	ADD	W10, #2, W0
; count start address is: 10 (W5)
	MOV	[W0], W5
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
L_jsmn_parse58:
; count start address is: 10 (W5)
; num_tokens start address is: 12 (W6)
	MOV	[W10], W0
	CP	W0, W12
	BRA LTU	L__jsmn_parse233
	GOTO	L__jsmn_parse179
L__jsmn_parse233:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L__jsmn_parse234
	GOTO	L__jsmn_parse178
L__jsmn_parse234:
L__jsmn_parse161:
	MOV	[W10], W0
	ADD	W11, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV.B	[W1], W0
; c start address is: 8 (W4)
	MOV.B	W0, W4
	GOTO	L_jsmn_parse63
L_jsmn_parse65:
L_jsmn_parse66:
	INC	W5
	CP	W13, #0
	BRA Z	L__jsmn_parse235
	GOTO	L_jsmn_parse67
L__jsmn_parse235:
; c end address is: 8 (W4)
	GOTO	L_jsmn_parse64
L_jsmn_parse67:
; c start address is: 8 (W4)
	PUSH	W12
	PUSH	W11
	MOV	W6, W12
	MOV	W13, W11
	CALL	jsmn_jsmn_alloc_token
	POP	W11
	POP	W12
	MOV	W0, [W14+6]
	CP	W0, #0
	BRA Z	L__jsmn_parse236
	GOTO	L_jsmn_parse68
L__jsmn_parse236:
; c end address is: 8 (W4)
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
	MOV	#65535, W0
	GOTO	L_end_jsmn_parse
L_jsmn_parse68:
; num_tokens start address is: 12 (W6)
; count start address is: 10 (W5)
; c start address is: 8 (W4)
	ADD	W10, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse237
	GOTO	L_jsmn_parse69
L__jsmn_parse237:
	ADD	W10, #4, W0
	MOV	[W0], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	ADD	W0, #6, W1
	MOV	[W1], W0
	INC	W0
	MOV	W0, [W1]
L_jsmn_parse69:
	MOV	[W14+6], W1
	MOV.B	#123, W0
	CP.B	W4, W0
	BRA Z	L__jsmn_parse238
	GOTO	L_jsmn_parse70
L__jsmn_parse238:
; c end address is: 8 (W4)
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
	GOTO	L_jsmn_parse71
L_jsmn_parse70:
	MOV.B	#2, W0
	MOV.B	W0, [W14+0]
L_jsmn_parse71:
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
	MOV	[W14+6], W0
	ADD	W0, #2, W1
	MOV	[W10], W0
	MOV	W0, [W1]
	ADD	W10, #4, W1
	ADD	W10, #2, W0
	MOV	[W0], W0
	DEC	W0
	MOV	W0, [W1]
	GOTO	L_jsmn_parse64
L_jsmn_parse72:
; c start address is: 8 (W4)
L_jsmn_parse73:
	CP	W13, #0
	BRA Z	L__jsmn_parse239
	GOTO	L_jsmn_parse74
L__jsmn_parse239:
; c end address is: 8 (W4)
	GOTO	L_jsmn_parse64
L_jsmn_parse74:
; c start address is: 8 (W4)
	MOV.B	#125, W0
	CP.B	W4, W0
	BRA Z	L__jsmn_parse240
	GOTO	L_jsmn_parse75
L__jsmn_parse240:
; c end address is: 8 (W4)
	MOV.B	#1, W0
	MOV.B	W0, [W14+1]
	GOTO	L_jsmn_parse76
L_jsmn_parse75:
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
L_jsmn_parse76:
	MOV.B	[W14+1], W0
	MOV.B	W0, [W14+2]
	ADD	W10, #2, W0
	MOV	[W0], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	MOV	W5, W3
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
	MOV	W6, W2
L_jsmn_parse77:
; num_tokens start address is: 4 (W2)
; count start address is: 6 (W3)
	MOV	[W14+4], W0
	CP	W0, #0
	BRA GE	L__jsmn_parse241
	GOTO	L_jsmn_parse78
L__jsmn_parse241:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	MOV	W0, [W14+6]
	INC2	W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse242
	GOTO	L__jsmn_parse163
L__jsmn_parse242:
	MOV	[W14+6], W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA Z	L__jsmn_parse243
	GOTO	L__jsmn_parse162
L__jsmn_parse243:
L__jsmn_parse160:
	MOV	[W14+6], W0
	MOV.B	[W0], W1
	ADD	W14, #2, W0
	CP.B	W1, [W0]
	BRA NZ	L__jsmn_parse244
	GOTO	L_jsmn_parse83
L__jsmn_parse244:
; num_tokens end address is: 4 (W2)
; count end address is: 6 (W3)
	MOV	#65534, W0
	GOTO	L_end_jsmn_parse
L_jsmn_parse83:
; count start address is: 6 (W3)
; num_tokens start address is: 4 (W2)
	ADD	W10, #4, W1
	MOV	#65535, W0
	MOV	W0, [W1]
	MOV	[W14+6], W0
	ADD	W0, #4, W1
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W1]
	GOTO	L_jsmn_parse78
L__jsmn_parse163:
L__jsmn_parse162:
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	GOTO	L_jsmn_parse77
L_jsmn_parse78:
	MOV	#65535, W1
	ADD	W14, #4, W0
	CP	W1, [W0]
	BRA Z	L__jsmn_parse245
	GOTO	L_jsmn_parse84
L__jsmn_parse245:
; num_tokens end address is: 4 (W2)
; count end address is: 6 (W3)
	MOV	#65534, W0
	GOTO	L_end_jsmn_parse
L_jsmn_parse84:
; count start address is: 6 (W3)
; num_tokens start address is: 4 (W2)
	PUSH	W3
; count end address is: 6 (W3)
	MOV	W2, W3
	POP	W2
L_jsmn_parse85:
; num_tokens end address is: 4 (W2)
; count start address is: 4 (W2)
; num_tokens start address is: 6 (W3)
	MOV	[W14+4], W0
	CP	W0, #0
	BRA GE	L__jsmn_parse246
	GOTO	L_jsmn_parse86
L__jsmn_parse246:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	MOV	W0, [W14+6]
	INC2	W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse247
	GOTO	L__jsmn_parse165
L__jsmn_parse247:
	MOV	[W14+6], W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA Z	L__jsmn_parse248
	GOTO	L__jsmn_parse164
L__jsmn_parse248:
L__jsmn_parse159:
	ADD	W10, #4, W1
	MOV	[W14+4], W0
	MOV	W0, [W1]
	GOTO	L_jsmn_parse86
L__jsmn_parse165:
L__jsmn_parse164:
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	GOTO	L_jsmn_parse85
L_jsmn_parse86:
	MOV	W3, W6
; num_tokens end address is: 6 (W3)
; count end address is: 4 (W2)
	MOV	W2, W5
	GOTO	L_jsmn_parse64
L_jsmn_parse91:
; num_tokens start address is: 12 (W6)
; count start address is: 10 (W5)
	PUSH	W6
	CALL	jsmn_jsmn_parse_string
	SUB	#2, W15
; r start address is: 2 (W1)
	MOV	W0, W1
	CP	W0, #0
	BRA LT	L__jsmn_parse249
	GOTO	L_jsmn_parse92
L__jsmn_parse249:
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
	MOV	W1, W0
; r end address is: 2 (W1)
	GOTO	L_end_jsmn_parse
L_jsmn_parse92:
; count start address is: 4 (W2)
; num_tokens start address is: 12 (W6)
; count start address is: 10 (W5)
	ADD	W5, #1, W2
; count end address is: 10 (W5)
	ADD	W10, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse250
	GOTO	L__jsmn_parse167
L__jsmn_parse250:
	CP	W13, #0
	BRA NZ	L__jsmn_parse251
	GOTO	L__jsmn_parse166
L__jsmn_parse251:
L__jsmn_parse158:
	ADD	W10, #4, W0
	MOV	[W0], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	ADD	W0, #6, W1
	MOV	[W1], W0
	INC	W0
	MOV	W0, [W1]
L__jsmn_parse167:
L__jsmn_parse166:
; count end address is: 4 (W2)
	MOV	W2, W5
	GOTO	L_jsmn_parse64
L_jsmn_parse96:
; count start address is: 10 (W5)
L_jsmn_parse97:
L_jsmn_parse98:
L_jsmn_parse99:
	GOTO	L_jsmn_parse64
L_jsmn_parse100:
	ADD	W10, #4, W1
	ADD	W10, #2, W0
	MOV	[W0], W0
	DEC	W0
	MOV	W0, [W1]
	GOTO	L_jsmn_parse64
L_jsmn_parse101:
	CP	W13, #0
	BRA NZ	L__jsmn_parse252
	GOTO	L__jsmn_parse182
L__jsmn_parse252:
	ADD	W10, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse253
	GOTO	L__jsmn_parse183
L__jsmn_parse253:
	ADD	W10, #4, W0
	MOV	[W0], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__jsmn_parse254
	GOTO	L__jsmn_parse184
L__jsmn_parse254:
	ADD	W10, #4, W0
	MOV	[W0], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__jsmn_parse255
	GOTO	L__jsmn_parse185
L__jsmn_parse255:
L__jsmn_parse157:
	ADD	W10, #2, W0
	MOV	[W0], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	MOV	W5, W3
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
	MOV	W6, W2
L_jsmn_parse105:
; num_tokens start address is: 4 (W2)
; count start address is: 6 (W3)
	MOV	[W14+4], W0
	CP	W0, #0
	BRA GE	L__jsmn_parse256
	GOTO	L_jsmn_parse106
L__jsmn_parse256:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__jsmn_parse257
	GOTO	L__jsmn_parse169
L__jsmn_parse257:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__jsmn_parse258
	GOTO	L__jsmn_parse168
L__jsmn_parse258:
	GOTO	L_jsmn_parse110
L__jsmn_parse169:
L__jsmn_parse168:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	INC2	W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse259
	GOTO	L__jsmn_parse171
L__jsmn_parse259:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA Z	L__jsmn_parse260
	GOTO	L__jsmn_parse170
L__jsmn_parse260:
L__jsmn_parse155:
	ADD	W10, #4, W1
	MOV	[W14+4], W0
	MOV	W0, [W1]
	GOTO	L_jsmn_parse106
L__jsmn_parse171:
L__jsmn_parse170:
L_jsmn_parse110:
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	GOTO	L_jsmn_parse105
L_jsmn_parse106:
	MOV	W3, W1
; count end address is: 6 (W3)
	MOV	W2, W0
	GOTO	L__jsmn_parse175
; num_tokens end address is: 4 (W2)
L__jsmn_parse182:
	MOV	W6, W0
	MOV	W5, W1
L__jsmn_parse175:
; num_tokens start address is: 0 (W0)
; count start address is: 2 (W1)
; num_tokens end address is: 0 (W0)
; count end address is: 2 (W1)
	GOTO	L__jsmn_parse174
L__jsmn_parse183:
	MOV	W6, W0
	MOV	W5, W1
L__jsmn_parse174:
; num_tokens start address is: 0 (W0)
; count start address is: 2 (W1)
; num_tokens end address is: 0 (W0)
; count end address is: 2 (W1)
	GOTO	L__jsmn_parse173
L__jsmn_parse184:
	MOV	W6, W0
	MOV	W5, W1
L__jsmn_parse173:
; num_tokens start address is: 0 (W0)
; count start address is: 2 (W1)
	MOV	W1, W5
; num_tokens end address is: 0 (W0)
; count end address is: 2 (W1)
	GOTO	L__jsmn_parse172
L__jsmn_parse185:
	MOV	W6, W0
L__jsmn_parse172:
; num_tokens start address is: 0 (W0)
; count start address is: 10 (W5)
	MOV	W0, W6
; num_tokens end address is: 0 (W0)
	GOTO	L_jsmn_parse64
L_jsmn_parse114:
; num_tokens start address is: 12 (W6)
	PUSH	W6
	CALL	jsmn_jsmn_parse_primitive
	SUB	#2, W15
; r start address is: 2 (W1)
	MOV	W0, W1
	CP	W0, #0
	BRA LT	L__jsmn_parse261
	GOTO	L_jsmn_parse115
L__jsmn_parse261:
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
	MOV	W1, W0
; r end address is: 2 (W1)
	GOTO	L_end_jsmn_parse
L_jsmn_parse115:
; count start address is: 4 (W2)
; num_tokens start address is: 12 (W6)
; count start address is: 10 (W5)
	ADD	W5, #1, W2
; count end address is: 10 (W5)
	ADD	W10, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse262
	GOTO	L__jsmn_parse177
L__jsmn_parse262:
	CP	W13, #0
	BRA NZ	L__jsmn_parse263
	GOTO	L__jsmn_parse176
L__jsmn_parse263:
L__jsmn_parse154:
	ADD	W10, #4, W0
	MOV	[W0], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	ADD	W0, #6, W1
	MOV	[W1], W0
	INC	W0
	MOV	W0, [W1]
L__jsmn_parse177:
L__jsmn_parse176:
; count end address is: 4 (W2)
	MOV	W2, W5
	GOTO	L_jsmn_parse64
L_jsmn_parse63:
; count start address is: 10 (W5)
; c start address is: 8 (W4)
	MOV.B	#123, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse264
	GOTO	L_jsmn_parse65
L__jsmn_parse264:
	MOV.B	#91, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse265
	GOTO	L_jsmn_parse66
L__jsmn_parse265:
	MOV.B	#125, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse266
	GOTO	L_jsmn_parse72
L__jsmn_parse266:
	MOV.B	#93, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse267
	GOTO	L_jsmn_parse73
L__jsmn_parse267:
	MOV.B	#34, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse268
	GOTO	L_jsmn_parse91
L__jsmn_parse268:
	CP.B	W4, #9
	BRA NZ	L__jsmn_parse269
	GOTO	L_jsmn_parse96
L__jsmn_parse269:
	CP.B	W4, #13
	BRA NZ	L__jsmn_parse270
	GOTO	L_jsmn_parse97
L__jsmn_parse270:
	CP.B	W4, #10
	BRA NZ	L__jsmn_parse271
	GOTO	L_jsmn_parse98
L__jsmn_parse271:
	MOV.B	#32, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse272
	GOTO	L_jsmn_parse99
L__jsmn_parse272:
	MOV.B	#58, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse273
	GOTO	L_jsmn_parse100
L__jsmn_parse273:
	MOV.B	#44, W0
	CP.B	W4, W0
	BRA NZ	L__jsmn_parse274
	GOTO	L_jsmn_parse101
L__jsmn_parse274:
; c end address is: 8 (W4)
	GOTO	L_jsmn_parse114
; count end address is: 10 (W5)
; num_tokens end address is: 12 (W6)
L_jsmn_parse64:
; count start address is: 10 (W5)
; num_tokens start address is: 12 (W6)
	MOV	[W10], W0
	INC	W0
	MOV	W0, [W10]
; num_tokens end address is: 12 (W6)
	GOTO	L_jsmn_parse58
L__jsmn_parse179:
L__jsmn_parse178:
	CP	W13, #0
	BRA NZ	L__jsmn_parse275
	GOTO	L__jsmn_parse186
L__jsmn_parse275:
	ADD	W10, #2, W0
	MOV	[W0], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	MOV	W5, W2
; count end address is: 10 (W5)
L_jsmn_parse120:
; count start address is: 4 (W2)
	MOV	[W14+4], W0
	CP	W0, #0
	BRA GE	L__jsmn_parse276
	GOTO	L_jsmn_parse121
L__jsmn_parse276:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	INC2	W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA NZ	L__jsmn_parse277
	GOTO	L__jsmn_parse181
L__jsmn_parse277:
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ADD	W13, W0, W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	MOV	#65535, W0
	CP	W1, W0
	BRA Z	L__jsmn_parse278
	GOTO	L__jsmn_parse180
L__jsmn_parse278:
; count end address is: 4 (W2)
L__jsmn_parse153:
	MOV	#65533, W0
	GOTO	L_end_jsmn_parse
L__jsmn_parse181:
; count start address is: 4 (W2)
L__jsmn_parse180:
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	SUB	W1, #1, [W0]
	GOTO	L_jsmn_parse120
L_jsmn_parse121:
	MOV	W2, W1
	GOTO	L_jsmn_parse119
; count end address is: 4 (W2)
L__jsmn_parse186:
	MOV	W5, W1
L_jsmn_parse119:
; count start address is: 2 (W1)
	MOV	W1, W0
; count end address is: 2 (W1)
L_end_jsmn_parse:
	ULNK
	RETURN
; end of _jsmn_parse

_jsmn_init:

	CLR	W0
	MOV	W0, [W10]
	ADD	W10, #2, W1
	CLR	W0
	MOV	W0, [W1]
	ADD	W10, #4, W1
	MOV	#65535, W0
	MOV	W0, [W1]
L_end_jsmn_init:
	RETURN
; end of _jsmn_init
