
GLOBAL_ASM(
glabel test

addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24
addiu $sp, $sp, -24
 sw    $zero, 4($sp)
lw    $t6, 4($sp)
addu  $t7, $a0, $t6
sb    $zero, ($t7)
lw    $t8, 4($sp)
addiu $t9, $t8, 1
slt   $at, $t9, $a1
 sw    $t9, 4($sp)
 nop
jr    $ra
 addiu $sp, $sp, 24

)

void foo(void) {}
