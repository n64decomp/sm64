.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

glabel __osSetWatchLo
    mtc0  $a0, $18
    nop
    jr    $ra
     nop

