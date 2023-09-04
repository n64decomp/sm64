.set noreorder // don't insert nops after branches

#include "macros.inc"

.section .text, "ax"

#ifdef VERSION_CN

glabel osGetCount
    addiu $sp, $sp, -0x38
    sd    $ra, 0x30($sp)
    sd    $fp, 0x28($sp)
    jal   __osDisableInt
     move  $fp, $sp
    sw    $v0, 0x24($fp)
    mfc0  $a1, $9
    sw    $a1, 0x20($fp)
    lw    $v0, 0x20($fp)
    lui   $v1, %hi(sLastHighestCount) # $v1, 0x8032
    lw    $v1, %lo(sLastHighestCount)($v1)
    sltu  $v0, $v0, $v1
    beqz  $v0, .L80304FCC
     nop
    lui   $v0, %hi(sNumCountOverflows) # $v0, 0x8032
    lw    $v0, %lo(sNumCountOverflows)($v0)
    addiu $v1, $v0, 1
    sw    $v1, sNumCountOverflows
.L80304FCC:
    lw    $v0, 0x20($fp)
    sw    $v0, sLastHighestCount
    lui   $v0, %hi(sNumCountOverflows) // $v0, 0x8032
    lwu   $v0, %lo(sNumCountOverflows)($v0)
    dsll32 $v1, $v0, 0
    lwu   $a0, 0x20($fp)
    or    $v0, $v1, $a0
    move  $a0, $v0
    dsll  $v1, $a0, 5
    dsubu $v1, $v1, $v0
    dsll  $a0, $v1, 2
    daddu $a0, $a0, $v0
.set noat // gas seems to add an extra mflo $zero after, if we don't manually use $at
    li $at, 192
    ddivu $zero, $a0, $at
.set at
    mflo  $v0
    dsll32 $v0, $v0, 0
    dsra32 $v0, $v0, 0
    sw    $v0, 0x20($fp)
    lw    $v0, 0x20($fp)
    lui   $v1, %hi(sLastHighestCount2) // $v1, 0x8032
    lw    $v1, %lo(sLastHighestCount2)($v1)
    sltu  $v0, $v0, $v1
    beqz  $v0, .L80305044
     nop
    lui   $v0, %hi(sNumCountOverflows2) // $v0, 0x8032
    lw    $v0, %lo(sNumCountOverflows2)($v0)
    addiu $v1, $v0, 1
    sw    $v1, sNumCountOverflows2
.L80305044:
    lw    $v0, 0x20($fp)
    sw    $v0, sLastHighestCount2
    jal   __osRestoreInt
     lw    $a0, 0x24($fp)
    lw    $v1, 0x20($fp)
    j     .L80305064
     move  $v0, $v1
.L80305064:
    move  $sp, $fp
    ld    $ra, 0x30($sp)
    ld    $fp, 0x28($sp)
    jr    $ra
     addiu $sp, $sp, 0x38

#else

glabel osGetCount
    mfc0  $v0, $9
    jr    $ra
     nop

    nop

#endif
