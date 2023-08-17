.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

glabel __osGetSR
    mfc0  $v0, $12
    jr    $ra
     nop

    nop

