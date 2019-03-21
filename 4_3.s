.include "macro_print_str.s"
.data
.text
	jal main
	
main:
	
	li $t0, 0#count 100 number
	li $t1, 1#iterate integer
	loop:
	beq $t0, 100, endl
	add $a1, $t1, $zero
	jal test_prime
	beq $v1, 0, next
	#print the prime
	add $a0, $v1, $zero
	li $v0, 1
	syscall
	addi $t0, $t0, 1
	next:
	addi $t1, $t1, 1
	j loop
	endl
	
	jr $ra
	
	
#use a1 as n return in v1
test_prime:

	li $v1, 1