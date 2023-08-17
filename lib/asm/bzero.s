.set noreorder // don't insert nops after branches

#include "macros.inc"

// this file is probably handwritten

//TODO There seem to be patterns in these iQue diffs. Can we figure out what's causing them? Could this have been written in C? See also bcopy.s.

.section .text, "ax"

glabel bzero

#ifdef VERSION_CN
    negu  $v1, $a0
    blt  $a1, 0xc, .L80303790
     nop
    andi  $v1, $v1, 3
    beqz  $v1, .L80303734
     subu  $a1, $a1, $v1
    swl   $zero, ($a0)
    addu  $a0, $a0, $v1
.L80303734:
    and   $a3, $a1, -32
    beqz  $a3, .L80303770
     subu  $a1, $a1, $a3
    addu  $a3, $a3, $a0
.L80303748:
    sw    $zero, ($a0)
    sw    $zero, 4($a0)
    sw    $zero, 8($a0)
    sw    $zero, 0xc($a0)
    addiu $a0, $a0, 0x20
    sw    $zero, -0x10($a0)
    sw    $zero, -0xc($a0)
    sw    $zero, -8($a0)
    bne   $a0, $a3, .L80303748
     sw    $zero, -4($a0)
.L80303770:
    and   $a3, $a1, -4
    beqz  $a3, .L80303790
     subu  $a1, $a1, $a3
    addu  $a3, $a3, $a0
.L80303784:
    addiu $a0, $a0, 4
    bne   $a0, $a3, .L80303784
     sw    $zero, -4($a0)
.L80303790:
    blez  $a1, .L803037A8
     nop
    addu  $a1, $a1, $a0
.L8030379C:
    addiu $a0, $a0, 1
    bne   $a0, $a1, .L8030379C
     sb    $zero, -1($a0)
.L803037A8:
    jr    $ra
     nop
#else
    blt  $a1, 0xc, .L803236BC
     negu  $v1, $a0
    andi  $v1, $v1, 3
    beqz  $v1, .L80323660
     subu  $a1, $a1, $v1
    swl   $zero, ($a0)
    addu  $a0, $a0, $v1
.L80323660:
    and   $a3, $a1, -32
    beqz  $a3, .L8032369C
     subu  $a1, $a1, $a3
    addu  $a3, $a3, $a0
.L80323674:
    addiu $a0, $a0, 0x20
    sw    $zero, -0x20($a0)
    sw    $zero, -0x1c($a0)
    sw    $zero, -0x18($a0)
    sw    $zero, -0x14($a0)
    sw    $zero, -0x10($a0)
    sw    $zero, -0xc($a0)
    sw    $zero, -8($a0)
    bne   $a0, $a3, .L80323674
     sw    $zero, -4($a0)
.L8032369C:
    and   $a3, $a1, -4
    beqz  $a3, .L803236BC
     subu  $a1, $a1, $a3
    addu  $a3, $a3, $a0
.L803236B0:
    addiu $a0, $a0, 4
    bne   $a0, $a3, .L803236B0
     sw    $zero, -4($a0)
.L803236BC:
    blez  $a1, .L803236D4
     nop
    addu  $a1, $a1, $a0
.L803236C8:
    addiu $a0, $a0, 1
    bne   $a0, $a1, .L803236C8
     sb    $zero, -1($a0)
.L803236D4:
    jr    $ra
#endif

