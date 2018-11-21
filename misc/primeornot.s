.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	msg1: .ascii "Prime!\n"
		 .equ len1, .-msg1
		 
	msg2: .ascii "Not Prime!\n"
		 .equ len2, .-msg2
	
.text
.global _start
_start:
	mov cl, 43
	
	cmp cl, 0
	je notprime
	
	cmp cl, 4
	jl prime
	
	mov bl, 2
	up:
	mov ax, cx
	div bl
	cmp ah, 0
	je notprime
	inc bl
	cmp cl, bl
	je prime
	jmp up	
	prime:
	display msg1, len1
	jmp ex
	notprime:
	display msg2, len2
	ex:
exit
