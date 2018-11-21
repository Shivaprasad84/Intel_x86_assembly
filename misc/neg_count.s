# Find th number of negative numbers stored in array
# Answer is available in bl register

.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	array: .byte -12, 13, -12, 46, -32, -16, -20, 10
		  .equ len, .-array 
		  
.text
.global _start
_start:
	lea esi, array
	mov cx, len
	mov bl, 0
	up:
	mov al, [esi]
	rcl al, 1
	jnc skip
	inc bl
	skip:
	inc esi
	loop up
	nop
exit
