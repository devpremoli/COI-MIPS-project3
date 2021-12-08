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
beq $s0, 0, substring 		
beq $s0, 10, substring
beq $s0, 44, substring


checking:
beq $s0, 9,  skipping 							# if tab, move to gap function
beq $s0, 32, skipping
ble $s0, 47, invalid 
ble $s0, 57, valid 					
ble $s0, 64, invalid
ble $s0, 81, valid 						# starting with A (capital) = valid
ble $s0, 96, invalid 						# less than 96 = invalid
ble $s0, 113, valid 						# less than 117 (u) = valid
bgt $s0, 113, invalid
    

removing:
addi $t0,$t0,1
j start


substring:

