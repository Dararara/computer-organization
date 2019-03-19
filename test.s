.text
	li $t7,0
	li $a0, 3
	jal fib
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	add $a0, $t7,$zero
	syscall
	li $v0, 10
	syscall

fib:
	#store the data
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $a0, 4($sp)
	sw $ra, 8($sp)
	addi $t7,$t7,4
	#check two possible return states
	beq $a0, $zero, return0
	beq $a0, 1, return1
	#use recursion to get the result
	addi $a0, $a0, -1
	addi $t7,$t7,2
	jal fib # fib(n-1)
	add $s0, $v0, $zero
	lw $a0, 4($sp)
	addi $a0, $a0, -2
	addi $t7,$t7,4
	jal fib # fib(n-2)
	add $v0, $v0, $s0
	#store back the register
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	addi $t7,$t7,6
	jr $ra
return0: #store back and set v0 as 0
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	li $v0, 0
	addi $t7,$t7,7
	jr $ra

return1: #store back and set v0 as 1
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	li $v0, 1
	addi $t7,$t7,7
	jr $ra			
				
					
						
							
								
									
										
												
