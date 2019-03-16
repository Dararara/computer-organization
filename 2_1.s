.include "macro_print_string.s"
.data
	str: .word
.text
main:
	#here we read a word and print it
	print_string("\nplease input a word:")
	li $v0,5
	syscall
	move $a0,$v0
	li $v0,34
	syscall
	#we save it to memory to deal with it
	sw $a0, str
	print_string("\n")
	la $t0,str
	
	#switch highest 8 bits and lowest 8 bits 
	lb $t1,0($t0)
	lb $t2,3($t0)
	sb $t2,0($t0)
	sb $t1,3($t0)
	
	#load it to a0 and print it
	lw $a0,0($t0)
	li $v0,34
	syscall
	
	end
