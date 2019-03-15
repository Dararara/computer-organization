.include "macro_print_str.s"
.data
.text
	li $t4,19
	li $t1,1
	li $t2,1
	li $t3,1
	#use three loops to iterate all the possible combination of x,y,z and print all the result less than 400
	loop1:
	slt $t0,$t1,$t4
	beq $t0,$zero,end1
	#add $a0,$t1,$zero
	#li $v0,1
	#syscall
	add $t2,$t1,$zero
	
	loop2:
	slt $t0,$t2,$t4
	beq $t0,$zero,end2
	#add $a0,$t2,$zero
	#li $v0,1
	#syscall
	add $t3,$t2,$zero
	
	loop3:
	slt $t0,$t3,$t4
	beq $t0,$zero,end3
	#test answer <= 400 or not
	mul $t0,$t1,$t1
	add $a0,$t0,$zero
	mul $t0,$t2,$t2
	add $a0,$t0,$a0
	mul $t0,$t3,$t3
	add $a0,$t0,$a0 
	mul $t0,$t1,$t2
	add $a0,$t0,$a0 
	mul $t0,$t1,$t3
	add $a0,$t0,$a0 
	mul $t0,$t2,$t3
	add $a0,$t0,$a0 
	slti $t0,$a0,400
	beq $t0,0,no
	li $v0,1
	syscall
	print_string(" ")
	no:
	#add $a0,$t3,$zero
	#li $v0,1
	#syscall
	
	addi $t3,$t3,1
	j loop3
	end3:
	
	
	
	addi $t2,$t2,1
	j loop2
	end2:
	
	
	
	addi $t1,$t1,1
	j loop1
	end1:
	end
