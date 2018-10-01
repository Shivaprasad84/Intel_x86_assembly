.intel_mnemonic 
.intel_syntax noprefix
.include "macros.mac"

.data

	num1:
		.ds 10

	num2:
		.ds 10

	res:
		.ds 10
		
	msg1:
		.ascii "Enter two numbers without any spaces for example\n12 and 13 should be given as 1213, 2 and 3 should be given as 0203:\n"
		.equ len1, .-msg1

	msg2:
		.ascii "The sum is: \n"
		.equ len2, .-msg2

	msg3:
		.ascii "The difference is: \n"
		.equ len3, .-msg3

	msg4: 
		.ascii "The product is: \n"
		.equ len4, .-msg4

	msg5:
		.ascii "The quotient is: \n"
		.equ len5, .-msg5
		
	new_line:
		.ascii "\n"
		
		temp:
			.ds 10
	

.text
.global _start

_start:
	display msg1, len1
	read num1, 2
	read num2, 2
	ascii_to_num num1
	mov temp, al
	ascii_to_num num2
	mov [temp + 1], al
	
	# Addition:
	mov al, [temp]
	add al, [temp + 1]
	jc subtract
	numToAscii res
	display msg2, len2
	display res, 4
	display new_line, 1
	display new_line, 1
	display new_line, 1
	
	# Subtraction:
	subtract:
	mov al, [temp]
	sbb al, [temp + 1]
	jc multiply
	numToAscii res
	display msg3, len3
	display res, 4
	display new_line, 1
	display new_line, 1
	display new_line, 1
	
	# Product:
	multiply:
	mov al, [temp]
	mul byte ptr[temp + 1]
	cmp al, 100
	jge division
	numToAscii res
	display msg4, len4
	display res, 4
	display new_line, 1
	display new_line, 1
	display new_line, 1
	
	# Division
     division:	
     mov al, [temp]
	cmp byte ptr[temp + 1], 0
	je ex
	div byte ptr[temp + 1]
	numToAscii res
	display msg5, len5
	display res, 4
	display new_line, 1
	display new_line, 1
	ex:
exit
