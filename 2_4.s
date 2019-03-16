.include "macro_print_string.s"
.data
	str: .word
.text
main:
	#read a word from user
	print_string("please input a word: ")
	li $v0,5
	syscall
	#store the input word to t0
	move $t0,$v0
	
	#check if it is positive or not
	slt $t1,$t0,$zero
	beq $t1,1,Negative
	#if positive, then it is the answer
	move $a0,$t0
	j exit
	Negative:
	#if negativ, than do bitwise not and plus 1, then we get the answer
	not $t0,$t0
	addi $a0,$t0,1
	exit:
	
	li $v0,1
	syscall
	end