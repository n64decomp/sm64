.set noat
.set noreorder // don't insert nops after branches

#include "macros.inc"

#include <PR/R4300.h>


.section .text, "ax"

#ifdef VERSION_CN

glabel __osSetCompare
    addiu $sp, $sp, -0x38
    sd    $ra, 0x30($sp)
    sd    $fp, 0x28($sp)
    move  $fp, $sp
    sw    $a0, 0x3c($fp)
    lw    $v0, 0x3c($fp)
    beqz  $v0, .L8030A25C
     nop
    jal   __osDisableInt
     nop
    sw    $v0, 0x20($fp)
    lw    $v0, 0x3c($fp)
    lui   $v1, %hi(sLastHighestCount2) # $v1, 0x8032
    lw    $v1, %lo(sLastHighestCount2)($v1)
    sltu  $v0, $v0, $v1
    lui   $v1, %hi(sNumCountOverflows2) # $v1, 0x8032
    lw    $v1, %lo(sNumCountOverflows2)($v1)
    addu  $v0, $v0, $v1
    sw    $v0, 0x24($fp)
    lwu   $v0, 0x24($fp)
    dsll32 $v1, $v0, 0
    lwu   $a0, 0x3c($fp)
    or    $v0, $v1, $a0
    move  $a0, $v0
    dsll  $v1, $a0, 1
    daddu $v1, $v1, $v0
    dsll  $a0, $v1, 6
    li    $at, 125
    ddivu $zero, $a0, $at
    mflo  $v0
    dsll32 $v0, $v0, 0
    dsra32 $v0, $v0, 0
    sw    $v0, 0x3c($fp)
    jal   __osRestoreInt
     lw    $a0, 0x20($fp)
.L8030A25C:
    lw    $a1, 0x3c($fp)
    mtc0  $a1, C0_COMPARE
    move  $sp, $fp
    ld    $ra, 0x30($sp)
    ld    $fp, 0x28($sp)
    jr    $ra
     addiu $sp, $sp, 0x38

#else

glabel __osSetCompare
    mtc0  $a0, C0_COMPARE
    jr    $ra
     nop

#endif
