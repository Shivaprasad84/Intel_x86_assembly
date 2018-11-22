.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data
	array:
		.byte 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9 # change the array here
		.equ len, .-array-1
		
	store: .ds 2
	space: .ascii " "
	nl: .ascii "\n"
	
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
	mov cx, len # pass counter
	repeat: 
	lea esi, array
	mov dx, len # comparision counter

	again:
	mov al, [esi]
	mov bl, [esi + 1]
	cmp al, bl
	jl nxt # change this to jg for descending order
	xchg al, bl
	mov [esi], al
	mov [esi + 1], bl
	nxt:
	inc esi
	dec dx
	jnz again
	loop repeat
	
	lea ebp, array
	mov di, len
	above:
	mov al, [ebp]
	disp_ascii store
	display space, 1
	inc ebp
	dec di
	jnz above
	display nl, 1
	exit
