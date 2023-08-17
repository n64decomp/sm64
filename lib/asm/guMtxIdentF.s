.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

#ifdef VERSION_CN

.balign 32

glabel guMtxIdentF
    lui   $t0, 0x3f80
    sw    $t0, ($a0)
    sw    $zero, 4($a0)
    sw    $zero, 8($a0)
    sw    $zero, 0xc($a0)
    sw    $zero, 0x10($a0)
    sw    $t0, 0x14($a0)
    sw    $zero, 0x18($a0)
    sw    $zero, 0x1c($a0)
    sw    $zero, 0x20($a0)
    sw    $zero, 0x24($a0)
    sw    $t0, 0x28($a0)
    sw    $zero, 0x2c($a0)
    sw    $zero, 0x30($a0)
    sw    $zero, 0x34($a0)
    sw    $zero, 0x38($a0)
    jr    $ra
     sw    $t0, 0x3c($a0)

#endif
