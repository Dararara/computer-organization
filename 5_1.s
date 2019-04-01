.include "macro_print_str.s"
.data
	string: .space 5
.text
.macro call(%int)
	
	li $v0, %int
	syscall
.end_macro
	#read the input of user
	print_string("Welcome to use the simple arithmetic calculator on unsigned 31bit number:\n")
	print_string("Please input operator: ")
	la $a0, string
	li $a1, 2
	li $v0, 8
	syscall
	
	lw $s0, 0($a0)
	
	#check do mul or add
	beq $s0, 42, mulpart
	beq $s0, 43, addpart
	print_string("\nThe  operator")
	#if not * nor +, exit
	move $a0, $s0
	call(11) 
	print_string(" is not supported ,exit\n") 
	j exit
	
	#add part
	addpart:
	#read the addend and augend, store it to t1, t2
	print_string("\nPlease input addend: ")
	call(5)
	move $t1, $v0 
	print_string("Please input augend: ")
	call(5)
	move $t2, $v0 #augend
	#add it up and check if it is negative as a signed int, if it is, then overflow
	#otherwise print the answer
	addu $t3, $t1, $t2
	tlt $t3, $zero
	#print the answer and end
	print_string("The sum of ")
	move $a0, $t1
	call(1)
	print_string(" and ")
	move $a0, $t2
	call(1)
	print_string(" is: ")
	move $a0, $t3
	call(1)
	j exit
	
	#mul part
	mulpart:
	#read the multiplicand and multiplier, store it to t1, t2
	print_string("\nPlease input multiplicand: ")
	call(5)
	move $t1, $v0 #addend
	print_string("Please input multiplier: ")
	call(5)
	move $t2, $v0
	#mul t1, t2, check if hi is 0, if 0, then fine, else too big
	multu $t1, $t2
	mfhi $t3
	tne $t3, $zero
	
	#print the answer in lo
	mflo $t3
	print_string("The product of ")
	move $a0, $t1
	call(1)
	print_string(" and ")
	move $a0, $t2
	call(1)
	print_string(" is: ")
	move $a0, $t3
	call(36)#print in unsigned int
	j exit
	exit:
	
	end
	
	
	
	
.ktext 0x80000180
move $k0, $v0
move $k1, $a0
#print the corresponding error message acording to s0, the operator
beq $s0, 42, m
beq $s0, 43, a
j over
a:
la $a0, msg
call(4)
mfc0 $a0, $14
call(1)
la $a0, amsg
call(4)
j over

m:
la $a0, msg
call(4)
mfc0 $a0, $14
call(1)
la $a0, mmsg
call(4)
j over

over:
end
eret
.kdata 
msg: .asciiz "Runtime exception at 0x"
amsg: .asciiz ",the sum is overflow"
mmsg: .asciiz ",the product is bigger than the Max value of a word"
