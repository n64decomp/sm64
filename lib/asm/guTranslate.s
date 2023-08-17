.set noat
.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

#ifdef VERSION_CN

.balign 16

glabel guTranslate
    li    $at, 0x47800000 // 65536.000000
    mtc1  $at, $f4
    mtc1  $a1, $f6
    mul.s $f8, $f6, $f4
    trunc.w.s $f10, $f8
    mfc1  $t1, $f10
    mtc1  $a2, $f6
    mul.s $f8, $f6, $f4
    trunc.w.s $f10, $f8
    mfc1  $t3, $f10
    srl   $t2, $t1, 0x10
    sll   $t0, $t2, 0x10
    srl   $t2, $t3, 0x10
    or    $t0, $t0, $t2
    sw    $t0, 0x18($a0)
    sll   $t0, $t1, 0x10
    sll   $t2, $t3, 0x10
    srl   $t2, $t2, 0x10
    or    $t0, $t0, $t2
    sw    $t0, 0x38($a0)
    mtc1  $a3, $f6
    mul.s $f8, $f6, $f4
    trunc.w.s $f10, $f8
    mfc1  $t1, $f10
    srl   $t2, $t1, 0x10
    sll   $t0, $t2, 0x10
    addiu $t0, $t0, 1
    sw    $t0, 0x1c($a0)
    sll   $t2, $t1, 0x10
    sw    $t2, 0x3c($a0)
    sw    $zero, ($a0)
    sw    $zero, 4($a0)
    sw    $zero, 8($a0)
    sw    $zero, 0xc($a0)
    sw    $zero, 0x10($a0)
    sw    $zero, 0x14($a0)
    sw    $zero, 0x20($a0)
    sw    $zero, 0x24($a0)
    sw    $zero, 0x28($a0)
    sw    $zero, 0x2c($a0)
    sw    $zero, 0x30($a0)
    sw    $zero, 0x34($a0)
    lui   $t0, 1
    ori   $t0, $t0, 0
    sw    $t0, ($a0)
    sw    $t0, 0x14($a0)
    lui   $t0, (0x00000001 >> 16) # lui $t0, 0
    ori   $t0, (0x00000001 & 0xFFFF) # ori $t0, $t0, 1
    jr    $ra
     sw    $t0, 8($a0)

#endif
