.data
input: .space 1001
    prompt: .asciiz "-"
    comma: .asciiz ","


.text

main:
    li $v0,8
    la $a0,input 					
    li $a1, 1001 								
    syscall


subprogram:
sub $sp, $sp,4
sb $a0, 0($sp)
lb $t0, 0($sp)
addi $sp,$sp,4
move $t6, $t0

start: 				 				
lb $s0, ($t0)
beq $s0, 9, removing							
beq $s0, 32, removing 


removing:
