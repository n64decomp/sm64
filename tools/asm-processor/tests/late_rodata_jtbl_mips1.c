// COMPILE-FLAGS: -O2
// COMPILE-ISET: -mips1
// exact copy of late_rodata_jtbl.c except for the -mips1 addition
GLOBAL_ASM(
.late_rodata
.double 1
.double 2
.double 3
.double 4
.double 5
.double 6
.double 7
.double 8
.text
glabel doubles1
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
)

float a(void) { return 1.1f; }

GLOBAL_ASM(
.late_rodata
.float 1
.double 2
.double 3
.double 4
.double 5
.double 6
.double 7
.double 8
.double 9
.float 10
.text
glabel doubles2
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
)

GLOBAL_ASM(
glabel a2
move $a0, $a0
nop
nop
nop
jr $ra
move $a0, $a0
)

GLOBAL_ASM(
.late_rodata

glabel jtbl
.word case0, case1, case2, case3, case4, case5, case6, case7, case8, case9, case10
.word case11, case12, case13, case14, case15, case16, case17, case18, case19, case20
.word case21, case22, case23, case24, case25, case26

.text
glabel foo
sltiu $at, $a0, 0xa
beqz  $at, .L756E659B
 sll   $t7, $a0, 2
lui   $at, %hi(jtbl)
addu  $at, $at, $t7
lw    $t7, %lo(jtbl)($at)
jr    $t7
 nop   
case0: addiu $a0, $a0, 1
case1: addiu $a0, $a0, 1
case2: addiu $a0, $a0, 1
case3: addiu $a0, $a0, 1
case4: addiu $a0, $a0, 1
case5: addiu $a0, $a0, 1
case6: addiu $a0, $a0, 1
case7: addiu $a0, $a0, 1
case8: addiu $a0, $a0, 1
case9: addiu $a0, $a0, 1
case10: addiu $a0, $a0, 1
case11: addiu $a0, $a0, 1
case12: addiu $a0, $a0, 1
case13: addiu $a0, $a0, 1
case14: addiu $a0, $a0, 1
case15: addiu $a0, $a0, 1
case16: addiu $a0, $a0, 1
case17: addiu $a0, $a0, 1
case18: addiu $a0, $a0, 1
case19: addiu $a0, $a0, 1
case20: addiu $a0, $a0, 1
case21: addiu $a0, $a0, 1
case22: addiu $a0, $a0, 1
case23: addiu $a0, $a0, 1
case24: addiu $a0, $a0, 1
case25: addiu $a0, $a0, 1
case26:
jr    $ra
 addiu $v0, $a0, 1

.L756E659B:
addiu $v0, $zero, 2
jr    $ra
 nop   
)

GLOBAL_ASM(
glabel b2
move $a0, $a0
nop
nop
jr $ra
move $a0, $a0
)

float b(void) { return 1.2f; }
