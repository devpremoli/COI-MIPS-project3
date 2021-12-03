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