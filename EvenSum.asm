li $t0, 2
li $t1, 102
li $t2, 0

loop:
add $t2, $t2, $t0
addi $t0, $t0, 2
bne $t0, $t1, loop

# print
li $v0, 1
move $a0, $t2
syscall