.set noat
.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

#ifdef VERSION_CN

.balign 32

glabel guMtxF2L
    li    $at, 0x47800000 // 65536.000000
    mtc1  $at, $f0
    lui   $t9, 0xffff
    addiu $t8, $a1, 0x20
.L80306C70:
    lwc1  $f4, ($a0)
    mul.s $f6, $f4, $f0
    trunc.w.s $f8, $f6
    lwc1  $f10, 4($a0)
    mul.s $f16, $f10, $f0
    trunc.w.s $f18, $f16
    mfc1  $t0, $f8
    mfc1  $t1, $f18
    and   $t2, $t0, $t9
    srl   $t3, $t1, 0x10
    or    $t4, $t2, $t3
    sw    $t4, ($a1)
    sll   $t5, $t0, 0x10
    andi  $t6, $t1, 0xffff
    or    $t7, $t5, $t6
    sw    $t7, 0x20($a1)
    addiu $a1, $a1, 4
    bne   $a1, $t8, .L80306C70
     addiu $a0, $a0, 8
    jr    $ra
     nop

    nop
    nop
    nop
    nop

#endif
