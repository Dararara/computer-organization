.include "macro_print_str.s"
.data
.text
main:
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	sll $a0,$s0,2
	li $v0, 9
	syscall
	#s1 is start of heap, s2 is the pointer
	add $s1, $v0, $zero
	add $s2, $v0, $zero
	#if we need 0 and 1, just return the corresponding value
	beq $s0, 0, return0 
	beq $s0, 1, return1	
	#else we need to use a loop to do it
	li $t0, 2#count the number of fib
	sw $zero, 0($s2)
	li $t1, 1
	sw $t1, 4($s2)
	addi $s2, $s2, 8
	loop:
	addi $t1, $s2, -8
	addi $t2, $s2, -4
	lw $t4, ($t1)
	lw $t5, ($t2)
	add $t3, $t4, $t5
	sw $t3, ($s2)
	
	beq $t0,$s0,return
	addi $s2, $s2, 4
	addi $t0, $t0, 1
	j loop
	
	return:
	lw $a0, 0($s2)
	j exit
	
	return0:
	li $a0, 0
	j exit
	return1:
	li $a0, 1
	j exit
	
	exit:
	li $v0, 1
	syscall
	li $v0, 10
	syscall
