## BUBBLE SORT ASCENDING ORDER

# set a break point at start and line 36 run and press c, 
#to view the sorted array type x/<no of elements in the array>db &array

.intel_mnemonic
.intel_syntax noprefix

.data
	array:
		.byte 5, 4, 3, 2, 1 # change the array here
		.equ len, .-array-1
	
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
	jc nxt # change this to jnc for descending order
	xchg al, bl
	mov [esi], al
	mov [esi + 1], bl
	nxt:
	inc esi
	dec dx
	jnz again
	loop repeat
	nop

mov eax, 0x01
int 0x80
