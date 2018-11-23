.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"
.data
	msg1:
		.ascii "Enter the number of prime numbers to be printed: \n"
		.equ len1, .-msg1
	n: .ds 2
	N: .ds 1
	pa: .ds 10
	store: .ds 2
	space: .ascii " "
	nl: .ascii "\n"
	
.macro isprime
	.local prim
	.local notprim
	.local up
	.local ex
	cmp cl, 4
	jl prim
	mov bl, 2
	up:
	mov ax, cx
	div bl
	cmp ah, 0
	je notprim
	inc bl
	cmp cl, bl
	je prim
	jmp up	
	prim:
	mov si, 1
	jmp ex
	notprim:
	mov si, 0
	ex:
	nop
.endm

.macro disp_ascii store
	mov dl, 10
	div dl
	add ah, 0x30
	add al, 0x30
	mov \store, al
	mov \store + 1, ah
	display \store, 2
.endm

.text
.global _start
_start:
	display msg1, len1
	read n, 2
	ascii_to_num n
	mov N, al
	lea ebp, pa
	mov di, N
	mov cl, 2
	up1:
	isprime
	cmp si, 0
	je notprime
	mov [ebp], cl
	inc ebp
	dec di
	notprime:
	inc cl
	cmp di, 0
	jne up1

	lea ebp, pa
	mov di, N
	up2:
	mov ax, 0x00
	mov al, [ebp]
	disp_ascii store
	display space, 1
	inc ebp
	dec di
	jnz up2
	display nl, 1
exit
	
	
