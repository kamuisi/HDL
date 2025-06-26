addiu $t0, $zero, 100
addiu $t1, $zero, 0x00000004
sw $t0, ($t1)
lw $t2, ($t1)
addiu $t3, $zero, 0x00007f00
lw $t4, ($t3)
addiu $t5, $zero, 0x00007f04
sw $t4, ($t5)
addiu $t6, $zero, 0x00007f15
addiu $t7, $zero, 11
sw $t7, ($t6)
addiu $t7, $t7, 2
sw $t7, ($t6)
addiu $t7, $t7, 2
sw $t7, ($t6)
addiu $t7, $t7, 2
sw $t7, ($t6)
addiu $t7, $t7, 2
sw $t7, ($t6)
addiu $t7, $t7, 2
sw $t7, ($t6)
addiu $t7, $t7, 2
sw $t7, ($t6)

