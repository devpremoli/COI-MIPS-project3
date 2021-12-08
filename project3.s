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

forward:
    j display

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
j loop

loop:
lb $s0, ($t0) 							
beq $s0, 0, substring 					
beq $s0, 10, substring
addi $t0,$t0,1
beq $s0, 44, substring


checking:
bgt $t2,0,invalid
beq $s0, 9,  skipping 			
beq $s0, 32, skipping
ble $s0, 47, invalid 
ble $s0, 57, valid 					
ble $s0, 64, invalid
ble $s0, 81, valid 						
ble $s0, 96, invalid 						
ble $s0, 113, valid
bgt $s0, 113, invalid


skipping:
j loop

valid:
addi $t3, $t3,1
mul $t2,$t2,$t7
j loop

invalid:
lb $s0, ($t0)
beq $s0, 0, inside
beq $s0, 10, inside
addi $t0,$t0,1
beq $s0, 44, inside
j invalid

inside:
addi $t1,$t1,1
sub $sp, $sp,4
sw $t7, 0($sp)
move $t6,$t0
lb $s0, ($t0)
beq $s0, 0, forward
beq $s0, 10, forward
beq $s0,44, invalid
li $t3,0
li $t2,0
j loop


removing:
addi $t0,$t0,1
j start


substring:
bgt $t2,0,inside
bge $t3,5,inside
addi $t1,$t1,1
sub $sp, $sp,4
sw $t6, 0($sp)

display:
mul $t1,$t1,4
add $sp, $sp, $t1

