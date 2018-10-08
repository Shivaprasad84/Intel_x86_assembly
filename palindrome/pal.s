# Reverse a string and check if it is a palindrome or not
# Credits Srishanth S Amin #

.intel_mnemonic
.intel_syntax noprefix
.include "macros.mac"

.data


msg1:
	.ascii "Given string is: \n"
	.equ len1, .-msg1

msg2:
	.ascii "\nReversed string is: \n"
	.equ len2, .-msg2
	
msg3:
	.ascii "\nThis is a palindrome\n"
	.equ len3, .-msg3

msg4:
	.ascii "\nThis is not a palindrome\n"
	.equ len4, .-msg4

new_line:
	.ascii "\n"
	
str:
	.ascii "RACECAR" # change the string here
	.equ str_len, .-str

rstr:
	.ds 50

.text
.global _start

_start:
	# Reversing a string from str and storing at rstr:  
	mov cx, str_len
	lea esi, str
	lea edi, rstr
	add edi, str_len
	dec edi
	cld
	up:
	movsb
	sub edi, 2
	loop up
	
	display msg1, len1
	display str, str_len
	display new_line, 1
	display msg2, len2
	display rstr, str_len
	display new_line, 1
	
	# Check for palindrome:
	lea esi, str
	lea edi, rstr
	mov cx, str_len
	next: cmpsb
	jne nxt
	dec cx
	jnz next
	display msg3, len3
	jmp ex
	nxt:
	display msg4, len4
	
ex:
exit
