.set noreorder // don't insert nops after branches

#include "macros.inc"

#include <PR/R4300.h>

.section .text, "ax"

glabel __osRestoreInt
    mfc0  $t0, C0_SR
    or    $t0, $t0, $a0
    mtc0  $t0, C0_SR
    nop
    nop
    jr    $ra
     nop
