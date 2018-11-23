.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	msg1:
		.ascii "Enter 5 numbers: \n"
		.equ len1, .-msg1
	msg2:
		.ascii "The smallest number is: \n"
		.equ len2, .-msg2	
	nl: .ascii "\n"
	
	array: .ds 5
	smallest: .ds 1
	
.text
.global _start
_start:
	display msg1, len1
	read array, 5
	mov dx, 4 
	lea ebp, array
	mov al, byte ptr[ebp]
	up:
	mov bl, byte ptr[ebp + 1]
	cmp al, bl
	jl nxt
	mov al, bl
	nxt: 
	inc ebp
	dec dx
	jnz up
	mov smallest, al
	display msg2, len2
	display smallest, 1
	display nl, 1
exit  
