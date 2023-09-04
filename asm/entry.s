// assembler directives
.set noat      // allow manual use of $at
.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

glabel entry_point
.if VERSION_CN == 1
    lui   $t0, %lo(_mainSegmentNoloadStartHi)
    ori   $t0, %lo(_mainSegmentNoloadStartLo)
    lui   $t1, %lo(_mainSegmentNoloadSizeHi)
    ori   $t1, %lo(_mainSegmentNoloadSizeLo)
.L80249010:
    sw    $zero, ($t0)
    sw    $zero, 4($t0)
    addi  $t0, $t0, 8
    addi  $t1, $t1, -8
    bnez  $t1, .L80249010
     nop
    lui   $sp, %lo(gIdleThreadStackHi)
    ori   $sp, %lo(gIdleThreadStackLo)
    lui   $t2, %lo(main_funcHi)
    ori   $t2, %lo(main_funcLo)
    jr    $t2
     nop
.else
    lui   $t0, %hi(_mainSegmentNoloadStart) // $t0, 0x8034
    lui   $t1, %lo(_mainSegmentNoloadSizeHi) // lui $t1, 2
    addiu $t0, %lo(_mainSegmentNoloadStart) // addiu $t0, $t0, -0x6df0
    ori   $t1, %lo(_mainSegmentNoloadSizeLo) // ori $t1, $t1, 0xcee0
.L80246010:
    addi  $t1, $t1, -8
    sw    $zero, ($t0)
    sw    $zero, 4($t0)
    bnez  $t1, .L80246010
     addi  $t0, $t0, 8
    lui   $t2, %hi(main_func) // $t2, 0x8024
    lui   $sp, %hi(gIdleThreadStack) // $sp, 0x8020
    addiu $t2, %lo(main_func) // addiu $t2, $t2, 0x6dc4
    jr    $t2
     addiu $sp, %lo(gIdleThreadStack) // addiu $sp, $sp, 0xa00
.endif
    nop
    nop
    nop
    nop
    nop
    nop
