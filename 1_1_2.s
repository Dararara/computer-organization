.data
	change: .asciiz "\n"
	str1: .asciiz "11710324 Wang Zhiwei"
	str2: .asciiz "reminder is: "
	str3: .asciiz "quotient is: "
	str: .asciiz "please input a number: "
.text
main:
#macro for print a string
.macro enter(%str)
	la $a0,%str
	li $v0,4
	syscall
.end_macro
#macro for read a int
.macro read(%int)
	enter(str)
	li $v0,5
	syscall
	move %int, $v0
.end_macro
	#load data
	read($t0)
	read($t1)
	read($t2)
	read($t3)
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
