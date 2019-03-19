.data 
	str: .asciiz "please input a number:"
	result: .asciiz "the fib number is: "
.text
	li $v0, 4
	la $a0, str
	syscall
	li $v0, 5
	syscall 
	add $a0, $v0, $zero
	jal fib
	add $t0, $v0, $zero
	li $v0, 4
	la $a0, result
	syscall
	add $a0, $t0, $zero
	li $v0, 1
	syscall
	li $v0, 10
	syscall

fib:
	#store the data
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $a0, 4($sp)
	sw $ra, 8($sp)
	#check two possible return states
	beq $a0, $zero, return0
	beq $a0, 1, return1
	#use recursion to get the result
	addi $a0, $a0, -1
	jal fib # fib(n-1)
	add $s0, $v0, $zero
	lw $a0, 4($sp)
	addi $a0, $a0, -2
	jal fib # fib(n-2)
	add $v0, $v0, $s0
	#store back the register
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	jr $ra
return0: #store back and set v0 as 0
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	li $v0, 0
	jr $ra

return1: #store back and set v0 as 1
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	li $v0, 1
	jr $ra			
				
					
						
							
								
									
										
												
