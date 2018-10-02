# Use gdb to see the output, set a break point at start and at line 38, single step twice until a user input is prompted (N)
# then press c to execute all the instructions at once, to view the result: x/<no of fibonacii numbers>xb &fibo

.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data 

fibo:
  .ds 100
  
msg1:
	.ascii "Enter N: \n"
	.equ len1, .-msg1

N:
	.ds 2
	
.text
.global _start

_start:
	display msg1, len1
	read N, 2
	ascii_to_num N # converts ascii to number and stores it in al
	mov cl, al
	lea esi, fibo
	mov ebx, 0
	mov edx, 1
	mov dword ptr[esi], ebx
	mov dword ptr[esi + 1], edx
	up: add edx, ebx
	inc esi
	mov ebx, dword ptr[esi]
	mov dword ptr[esi + 1], edx
	loop up
	nop
exit	 
