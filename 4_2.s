.include "macro_print_str.s"
.data
.text
	li $t0, 10
	li $v0, 5
	syscall
	add $s0, $v0, $zero #s0 stores the input value
	jal print
	li $v0,1
	syscall
	end

#do the div 10
#if q greater than 10, pass the q to next print
#then print the r
print:
	addi $sp, $sp, -12
	sw $s0, ($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	divu $s0, $t0
	mflo $s0 #q
	mfhi $s1 #r
	slti $t2, $s0, 10 
	beq $t2, 1, endp
	jal print
	endp:
	li $v0, 1
	add $a0, $s1, $zero
	syscall
	print_string("\n")
	lw $ra, 8($sp)
	lw $s1, 4($sp)
	lw $s0, ($sp)
	addi $sp, $sp, 12
	
	jr $ra