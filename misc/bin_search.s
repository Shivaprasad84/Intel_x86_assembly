.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	array: .word 354, 567, 1500, 2344, 3200, 156, 667, 1024, 1729
	.equ len, .-array
	
	msg1:
		.ascii "Found!\n"
		.equ len1, .-msg1
	
	msg2:
		.ascii "Not Found!\n"
		.equ len2, .-msg2
	
.text
.global _start
_start:
	lea esi, array
	mov cx, len
	mov ax, 1500
	up:
	mov bx, [esi]
	cmp ax, bx
	je nxt
	inc esi
	loop up
	nxt:
	cmp cx, 0
	je notfound
	display msg1, len1
	jmp ex
	notfound:
	display msg2, len2
	ex:
	exit
	
	
