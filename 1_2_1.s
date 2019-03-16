.data
	str: .asciiz "abc"
.text
main:
#marco to load and change the byte one by one, and then store back to the string
.macro cap(%str, %bias)
	lb $t1, %bias(%str)
	subu $t1, $t1, 32
	sb $t1, %bias(%str)
.end_macro
	la $a0, str
	cap($a0,0)
	cap($a0,1)
	cap($a0,2)
	li $v0,4
	syscall
	li $v0,10
	syscall
