.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

glabel __osSetFpcCsr
    cfc1  $v0, $31
    ctc1  $a0, $31
    jr    $ra
     nop

