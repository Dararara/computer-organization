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
	#shift left 3 to achieve time 3 
	sll $t2,$t0,3
	#ti is used to count the loop
	li $t1,0
	#use a loop to add twice to achive time 10
	Loop: add $t2,$t2,$t0
	addi $t1,$t1,1
	beq $t1,2,Exit
	j Loop
	Exit:
	#output the answer
	print_string("the answer is: ")
	move $a0,$t2
	li $v0,1
	syscall
	end