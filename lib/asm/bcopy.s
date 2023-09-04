.set noat      // allow manual use of $at
.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

//TODO There seem to be patterns in these iQue diffs. Can we figure out what's causing them? Could this have been written in C?
//also ifdef hell lol

glabel bcopy
    beqz  $a2, .L80323A4C
     move  $a3, $a1
#ifdef VERSION_CN
    beq   $a0, $a1, .L80323A4C
     nop
    slt   $at, $a1, $a0
    bnez  $at, .L80323A14
     nop
    add   $v0, $a0, $a2
    slt   $at, $a1, $v0
    beqz   $at, .L80323A14
     nop
    b     .L80323B78
     nop
.L80323A14:
    slti  $at, $a2, 0x10
#else
    beq   $a0, $a1, .L80323A4C
     slt   $at, $a1, $a0
    bnezl $at, .L80323A14
     slti  $at, $a2, 0x10
    add   $v0, $a0, $a2
    slt   $at, $a1, $v0
    beqzl  $at, .L80323A14
     slti  $at, $a2, 0x10
    b     .L80323B78
     slti  $at, $a2, 0x10
    slti  $at, $a2, 0x10
.L80323A14:
#endif
    bnez  $at, .L80323A2C
     nop
    andi  $v0, $a0, 3
    andi  $v1, $a1, 3
    beq   $v0, $v1, .L80323A54
     nop
.L80323A2C:
    beqz  $a2, .L80323A4C
     nop
    addu  $v1, $a0, $a2
.L80323A38:
    lb    $v0, ($a0)
    addiu $a0, $a0, 1
#ifdef VERSION_CN
    sb    $v0, ($a1)
    bne   $a0, $v1, .L80323A38
     addiu $a1, $a1, 1
#else
    addiu $a1, $a1, 1
    bne   $a0, $v1, .L80323A38
     sb    $v0, -1($a1)
#endif
.L80323A4C:
    jr    $ra
     move  $v0, $a3

.L80323A54:
#ifdef VERSION_CN
    beqz  $v0, .L80323AB8
     nop
    li    $at, 1
    beq   $v0, $at, .L80323A9C
     nop
    li    $at, 2
    beq   $v0, $at, .L80323A88
     nop
    lb    $v0, ($a0)
    addiu $a0, $a0, 1
    sb    $v0, ($a1)
    addiu $a1, $a1, 1
    b     .L80323AB8
     addiu $a2, $a2, -1
.L80323A88:
    lh    $v0, ($a0)
#else
    beqz  $v0, .L80323AB8
     li    $at, 1
    beq   $v0, $at, .L80323A9C
     li    $at, 2
    beql  $v0, $at, .L80323A88
     lh    $v0, ($a0)
    lb    $v0, ($a0)
    addiu $a0, $a0, 1
    addiu $a1, $a1, 1
    addiu $a2, $a2, -1
    b     .L80323AB8
     sb    $v0, -1($a1)
    lh    $v0, ($a0)
.L80323A88:
#endif
    addiu $a0, $a0, 2
#ifdef VERSION_CN
    sh    $v0, ($a1)
    addiu $a1, $a1, 2
    b     .L80323AB8
     addiu $a2, $a2, -2
#else
    addiu $a1, $a1, 2
    addiu $a2, $a2, -2
    b     .L80323AB8
     sh    $v0, -2($a1)
#endif
.L80323A9C:
    lb    $v0, ($a0)
    lh    $v1, 1($a0)
    addiu $a0, $a0, 3
#ifdef VERSION_CN
    sb    $v0, ($a1)
    sh    $v1, 1($a1)
#endif
    addiu $a1, $a1, 3
    addiu $a2, $a2, -3
#ifndef VERSION_CN
    sb    $v0, -3($a1)
    sh    $v1, -2($a1)
#endif
.L80323AB8:
    slti  $at, $a2, 0x20
#ifdef VERSION_CN
    bnez  $at, .L80323B14
     nop
#else
    bnezl $at, .L80323B18
     slti  $at, $a2, 0x10
#endif
    lw    $v0, ($a0)
    lw    $v1, 4($a0)
    lw    $t0, 8($a0)
    lw    $t1, 0xc($a0)
    lw    $t2, 0x10($a0)
    lw    $t3, 0x14($a0)
    lw    $t4, 0x18($a0)
    lw    $t5, 0x1c($a0)
    addiu $a0, $a0, 0x20
#ifdef VERSION_CN
    sw    $v0, ($a1)
    sw    $v1, 4($a1)
    sw    $t0, 8($a1)
    sw    $t1, 0xc($a1)
    sw    $t2, 0x10($a1)
    sw    $t3, 0x14($a1)
    sw    $t4, 0x18($a1)
    sw    $t5, 0x1c($a1)
#endif
    addiu $a1, $a1, 0x20
#ifndef VERSION_CN
    addiu $a2, $a2, -0x20
    sw    $v0, -0x20($a1)
    sw    $v1, -0x1c($a1)
    sw    $t0, -0x18($a1)
    sw    $t1, -0x14($a1)
    sw    $t2, -0x10($a1)
    sw    $t3, -0xc($a1)
    sw    $t4, -8($a1)
#endif
    b     .L80323AB8
#ifdef VERSION_CN
     addiu $a2, $a2, -0x20
#else
     sw    $t5, -4($a1)
#endif
.L80323B14:
    slti  $at, $a2, 0x10
.L80323B18:
#ifdef VERSION_CN
    bnez  $at, .L80323B50
	 nop
#else
    bnezl $at, .L80323B54
     slti  $at, $a2, 4
#endif
    lw    $v0, ($a0)
    lw    $v1, 4($a0)
    lw    $t0, 8($a0)
    lw    $t1, 0xc($a0)
    addiu $a0, $a0, 0x10
#ifdef VERSION_CN
    sw    $v0, ($a1)
    sw    $v1, 4($a1)
    sw    $t0, 8($a1)
    sw    $t1, 0xc($a1)
#endif
    addiu $a1, $a1, 0x10
#ifndef VERSION_CN
    addiu $a2, $a2, -0x10
    sw    $v0, -0x10($a1)
    sw    $v1, -0xc($a1)
    sw    $t0, -8($a1)
#endif
    b     .L80323B14
#ifdef VERSION_CN
     addiu $a2, $a2, -0x10
#else
     sw    $t1, -4($a1)
#endif
.L80323B50:
    slti  $at, $a2, 4
.L80323B54:
    bnez  $at, .L80323A2C
     nop
    lw    $v0, ($a0)
    addiu $a0, $a0, 4
#ifdef VERSION_CN
    sw    $v0, ($a1)
#endif
    addiu $a1, $a1, 4
#ifndef VERSION_CN
    addiu $a2, $a2, -4
#endif
    b     .L80323B50
#ifdef VERSION_CN
     addiu $a2, $a2, -4
#else
     sw    $v0, -4($a1)
    slti  $at, $a2, 0x10
#endif
.L80323B78:
    add   $a0, $a0, $a2
#ifdef VERSION_CN
    add   $a1, $a1, $a2
    slti  $at, $a2, 0x10
#endif
    bnez  $at, .L80323B94
#ifdef VERSION_CN
     nop
#else
     add   $a1, $a1, $a2
#endif
    andi  $v0, $a0, 3
    andi  $v1, $a1, 3
    beq   $v0, $v1, .L80323BC4
     nop
.L80323B94:
    beqz  $a2, .L80323A4C
     nop
    addiu $a0, $a0, -1
    addiu $a1, $a1, -1
    subu  $v1, $a0, $a2
.L80323BA8:
    lb    $v0, ($a0)
    addiu $a0, $a0, -1
#ifdef VERSION_CN
    sb    $v0, 0($a1)
#else
    addiu $a1, $a1, -1
#endif
    bne   $a0, $v1, .L80323BA8
#ifdef VERSION_CN
     addiu $a1, $a1, -1
#else
     sb    $v0, 1($a1)
#endif
    jr    $ra
     move  $v0, $a3

.L80323BC4:
    beqz  $v0, .L80323C28
#ifdef VERSION_CN
     nop
#endif
     li    $at, 3
    beq   $v0, $at, .L80323C0C
#ifdef VERSION_CN
     nop
#endif
     li    $at, 2
#ifdef VERSION_CN
    beq   $v0, $at, .L80323BF4
	 nop
#else
    beql  $v0, $at, .L80323BF8
     lh    $v0, -2($a0)
#endif
    lb    $v0, -1($a0)
    addiu $a0, $a0, -1
#ifdef VERSION_CN
    sb    $v0, -1($a1)
#endif
    addiu $a1, $a1, -1
#ifndef VERSION_CN
    addiu $a2, $a2, -1
#endif
    b     .L80323C28
#ifdef VERSION_CN
     addiu $a2, $a2, -1
#else
     sb    $v0, ($a1)
#endif
.L80323BF4:
    lh    $v0, -2($a0)
.L80323BF8:
    addiu $a0, $a0, -2
#ifdef VERSION_CN
    sh    $v0, -2($a1)
#endif
    addiu $a1, $a1, -2
#ifndef VERSION_CN
    addiu $a2, $a2, -2
#endif
    b     .L80323C28
#ifdef VERSION_CN
     addiu $a2, $a2, -2
#else
     sh    $v0, ($a1)
#endif
.L80323C0C:
    lb    $v0, -1($a0)
    lh    $v1, -3($a0)
    addiu $a0, $a0, -3
#ifdef VERSION_CN
    sb    $v0, -1($a1)
    sh    $v1, -3($a1)
    addiu $a1, $a1, -3
    addiu $a2, $a2, -3
#else
    addiu $a1, $a1, -3
    addiu $a2, $a2, -3
    sb    $v0, 2($a1)
    sh    $v1, ($a1)
#endif
.L80323C28:
    slti  $at, $a2, 0x20
#ifdef VERSION_CN
    bnez  $at, .L80323C84
	 nop
#else
    bnezl $at, .L80323C88
     slti  $at, $a2, 0x10
#endif
    lw    $v0, -4($a0)
    lw    $v1, -8($a0)
    lw    $t0, -0xc($a0)
    lw    $t1, -0x10($a0)
    lw    $t2, -0x14($a0)
    lw    $t3, -0x18($a0)
    lw    $t4, -0x1c($a0)
    lw    $t5, -0x20($a0)
    addiu $a0, $a0, -0x20
#ifdef VERSION_CN
    sw    $v0, -4($a1)
    sw    $v1, -8($a1)
    sw    $t0, -0xc($a1)
    sw    $t1, -0x10($a1)
    sw    $t2, -0x14($a1)
    sw    $t3, -0x18($a1)
    sw    $t4, -0x1c($a1)
    sw    $t5, -0x20($a1)
    addiu $a1, $a1, -0x20
#else
    addiu $a1, $a1, -0x20
    addiu $a2, $a2, -0x20
    sw    $v0, 0x1c($a1)
    sw    $v1, 0x18($a1)
    sw    $t0, 0x14($a1)
    sw    $t1, 0x10($a1)
    sw    $t2, 0xc($a1)
    sw    $t3, 8($a1)
    sw    $t4, 4($a1)
#endif
    b     .L80323C28
#ifdef VERSION_CN
     addiu  $a2, $a2, -0x20
#else
     sw    $t5, ($a1)
#endif
.L80323C84:
    slti  $at, $a2, 0x10
.L80323C88:
#ifdef VERSION_CN
    bnez $at, .L80323CC0
     nop
#else
    bnezl $at, .L80323CC4
     slti  $at, $a2, 4
#endif
    lw    $v0, -4($a0)
    lw    $v1, -8($a0)
    lw    $t0, -0xc($a0)
    lw    $t1, -0x10($a0)
    addiu $a0, $a0, -0x10
#ifdef VERSION_CN
    sw    $v0, -4($a1)
    sw    $v1, -8($a1)
    sw    $t0, -0xc($a1)
    sw    $t1, -0x10($a1)
    addiu $a1, $a1, -0x10
#else
    addiu $a1, $a1, -0x10
    addiu $a2, $a2, -0x10
    sw    $v0, 0xc($a1)
    sw    $v1, 8($a1)
    sw    $t0, 4($a1)
#endif
    b     .L80323C84
#ifdef VERSION_CN
     addiu $a2, $a2, -0x10
#else
     sw    $t1, ($a1)
#endif
.L80323CC0:
    slti  $at, $a2, 4
.L80323CC4:
    bnez  $at, .L80323B94
     nop
    lw    $v0, -4($a0)
    addiu $a0, $a0, -4
#ifdef VERSION_CN
    sw    $v0, -4($a1)
#endif
    addiu $a1, $a1, -4
#ifndef VERSION_CN
    addiu $a2, $a2, -4
#endif
    b     .L80323CC0
#ifdef VERSION_CN
     addiu $a2, $a2, -4
#else
     sw    $v0, ($a1)
    nop
    nop
    nop
#endif
