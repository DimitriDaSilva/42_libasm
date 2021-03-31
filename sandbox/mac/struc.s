		default rel

struc   mystruct
		a:	resw	1
		b:	resd	1
		c:	resb	1
		d:	resd	1
		e:	resb	6
endstruc

section	.data

oneStruct:
	istruc	mystruct
		at	a, dw		-1
		at 	b, dd		0x12345678
		at	c, db		' '
		at	d, dd		23
		at	e, db		'Gary', 0
	iend

mysize:	dq	$ - oneStruct
msg:	db	'Size of struct is %d', 10, 0
msg1:	db	'struct + b = %d', 10, 0
msg2:	db	'pStru + b = %d', 10, 0

section	.bss

pStru:	resq	1

section	.text
	global _start
	extern _printf, _malloc, _scanf

_start:
	push	rbp
	mov		rbp, rsp

	lea		rdi, [msg]
	mov		rsi, [mysize]
	call	_printf

	mov		rsp, rbp
	pop		rbp
	mov		rax, 0
	ret
