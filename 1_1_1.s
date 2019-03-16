.data
	change: .asciiz "\n"
	str1: .asciiz "11710324 Wang Zhiwei"
	str2: .asciiz "reminder is: "
	str3: .asciiz "quotient is: "
	a: .word 5
	b: .word 10
	c: .word 15
	d: .word 15
.text
main:
#macro for print a string
.macro enter(%str)
	la $a0,%str
	li $v0,4
	syscall
.end_macro
	#load data
	lw $t0,a
	lw $t1,b
	lw $t2,c
	lw $t3,d
	#compute
	mult $t1,$t2
	mflo $t4
	addu $t5,$t0,$t4
	div $t5,$t3
	mfhi $t6
	mflo $t7
	#output
	enter(str2)
	move $a0, $t6
	li $v0,1
	syscall
	enter(change)
	enter(str3)
	move $a0, $t7
	li $v0,1
	syscall
	enter(change)
	li $v0,4
	la $a0, str1
	syscall
	li $v0, 10
	syscall
