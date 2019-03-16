.include "macro_print_string.s"
.data
	str: .word
.text
main:
	#read a word from user
	print_string("\nplease input a word: ")
	li $v0,5
	syscall
	#print the word the user input in binary
	move $a0,$v0
	li $v0,35
	syscall
	move $t1,$a0
	print_string("\n")
	
	#do the xor with 0xaaaaaaaa to get the answer
	#print it in binary
	li $t0,0xaaaaaaaa
	xor $a0,$t1,$t0
	li $v0,35
	syscall
	end