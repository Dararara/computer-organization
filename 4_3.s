.include "macro_print_str.s"
.data
.text
	jal main
	end
	
	
	
main:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	li $t0, 0#count 100 number
	li $t1, 2#iterate integer
	loop:
	beq $t0, 100, endl
	add $a1, $t1, $zero
	jal test_prime
	beq $v1, 0, next
	#print the prime
	add $a0, $t1, $zero
	li $v0, 1
	syscall
	print_string("\n")
	addi $t0, $t0, 1
	next:
	addi $t1, $t1, 1
	j loop
	endl:
	
	lw $ra, ($sp)
	jr $ra
	
	
#use a1 as n return in v1
test_prime:

	li $t2, 2
	loop_test:
	slt $t3, $t2, $a1
	beqz $t3, return1
	divu $a1, $t2
	mfhi $t3
	beqz $t3, return0
	addi $t2, $t2, 1
	j loop_test
	
	
	return1:
	li $v1,1
	jr $ra
	
	return0:
	li $v1, 0
	jr $ra
