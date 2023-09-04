.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

#ifdef VERSION_CN

glabel guNormalize
    lwc1  $f4, ($a0)
    lwc1  $f6, ($a1)
    lwc1  $f8, ($a2)
    mul.s $f10, $f4, $f4
    li    $t0, 0x3F800000 # 1.000000
    mul.s $f16, $f6, $f6
    add.s $f18, $f10, $f16
    mul.s $f16, $f8, $f8
    add.s $f10, $f16, $f18
    mtc1  $t0, $f18
    sqrt.s $f16, $f10
    div.s $f10, $f18, $f16
    mul.s $f16, $f4, $f10
    nop
    mul.s $f18, $f6, $f10
    nop
    mul.s $f4, $f8, $f10
    swc1  $f16, ($a0)
    swc1  $f18, ($a1)
    jr    $ra
     swc1  $f4, ($a2)

#endif
