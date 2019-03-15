#counts length of a string
.include "macro_print_str.s"

.data
string: .space 100
rstring: .space 100

.text
main:
	print_string("please input a string: ")
	la $a0, string
	li $a1,100
	li $v0,8
	syscall
	
  	la $a0, string # Load address of string.
        jal strlen #$t0 stores the length of string

        #t1,t2 used to adapt, t4 used to compare
        #let t1 at the end of string, t2 at the begin of rstring
        la $t1, string
        la $t2, rstring
        la $t4, string
        add $t1,$t1,$t0
        
        
        #reverse and store it byte by byte
        #addi $t1,$t1,-1 #when we need to ignore the \n in the end of the string
        rstore:
        addi $t1,$t1,-1
        lb $t3, 0($t1)
        sb $t3, 0($t2)
        addi $t2,$t2,1
        beq $t1,$t4,to_end
        j rstore
        to_end:
        
        
        #print the reversed string
        print_string("the reversed string is: ")
        la $a0, rstring
        li $v0, 4
        syscall
        end

#count the length of string
#count until we meet a \0
strlen:
li $t0, 0
loop:
lb $t1, 0($a0)
beq $t1, $zero, exit 
addi $a0, $a0, 1
addi $t0, $t0, 1
j loop
exit:
jr $ra

