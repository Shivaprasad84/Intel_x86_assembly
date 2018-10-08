.intel_mnemonic 
.intel_syntax noprefix
.include "macros.mac"

.data

str:
	.ascii "Hello World" # Change the string here
	.equ len, .-str

msg1:
	.ascii "\nFound "
	.equ len1, .-msg1

msg2:
	.ascii "\nNo matches found for "
	.equ len2, .-msg2

msg3:
	.ascii "\nNo of Occurences\n"
	.equ len3, .-msg3

msg4:
	.ascii " occurs at these positions: \n"
	.equ len4, .-msg4

new_line:
	.ascii "\n"

char_to_search:
	.ds 2

in:
	.ascii " in "
	.equ in_len, .-in

quote:
	.ascii "'"
	

occur:
	.ds 10

pos:
	.ds 50
.text

.global _start

_start:
	lea ebp, pos
	mov bl, 0
	cld
	lea edi, str
	mov cx, len
	mov al, 'm' # change the character to be searched here
	mov char_to_search, al
	up:scasb
	je nxt
	jmp nxt1
	nxt:
	mov dx, len
	sub dx, cx 
	or dx, 0x30
	mov [ebp], dx
	inc ebp
	mov byte ptr[ebp], ' '
	inc ebp
	inc bl
	nxt1:
	loop up
	
	cmp bl, 0
	je not_found
	add bl, 0x30
	mov occur, bl
	display msg1, len1
	display quote, 1
	display char_to_search, 1
	display quote, 1
	display in, in_len
	display quote, 1
	display str, len
	display quote, 1
	display new_line, 1
	display msg3, len3
	display occur, 10
	display new_line, 1
	display new_line, 1
	display quote, 1
	display char_to_search, 1
	display quote, 1
	display msg4, len4
	display pos, 10
	display new_line, 1
	jmp ex
	not_found:
	display msg2, len2
	display quote, 1
	display char_to_search, 1
	display quote, 1
	display in, in_len
	display quote, 1
	display str, len
	display quote, 1
	display new_line, 1
	ex:
exit	
	
