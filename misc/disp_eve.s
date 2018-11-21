.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	even_array: .ds 10
	space: .ascii " "
	store: .ds 2
	
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

	lea ebp, even_array
	mov ecx, 20
	mov ax, 0
	up:
	mov bx, ax
	rcr bx, 1
	jc odd
	mov [ebp], ax
	inc ebp
	odd:
	inc ax
	loop up
	nop
	
	lea ebp, even_array
	mov di, 10
	above:
	mov al, [ebp]
	disp_ascii store
	display space, 1
	inc ebp
	dec di
	jnz above
	 
exit
	
	
	
