.include "macro_print_str.s"
.data
.text
	li $t0, 10
	li $v0, 5
	syscall
	add $s0, $v0, $zero #s0 stores the input value
	jal print
	end

#do the div 10
#if q greater than 0, pass the q to next print
#then print the r
#use a recursive to print the remainder in order
print:
	addi $sp, $sp, -12
	sw $s0, ($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	 
	beq $s0, 0, endp
	divu $s0, $t0
	mflo $s0 #q
	mfhi $s1 #r
	jal print
	
	add $a0, $s1, $zero
	trans

	endp:
	lw $ra, 8($sp)
	lw $s1, 4($sp)
	lw $s0, ($sp)
	addi $sp, $sp, 12
	
	jr $ra
	
	
#get the value in s1 and print it as one two three...
.macro trans
	beq $s1,0,zero
	beq $s1,1,one
	beq $s1,2,two
	beq $s1,3,three
	beq $s1,4,four
	beq $s1,5,five
	beq $s1,6,six
	beq $s1,7,seven
	beq $s1,8,eight
	beq $s1,9,nine
	zero:
	print_string("Zero ")
	j over
	one:
	print_string("One ")
	j over
	two:
	print_string("Two ")
	j over
	three:
	print_string("Three ")
	j over
	four:
	print_string("Four ")
	j over
	five:
	print_string("Five ")
	j over
	six:
	print_string("Six ")
	j over
	seven:
	print_string("Seven ")
	j over
	eight:
	print_string("Eight ")
	j over
	nine:
	print_string("Nine ")
	j over
	over:
.end_macro