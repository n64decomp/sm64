.set noreorder // don't insert nops after branches

#include "macros.inc"


.section .text, "ax"

glabel osUnmapTLBAll
    mfc0  $t0, $10
#ifdef VERSION_CN
    li    $t1, 30
#else
    li    $t1, 31
#endif
    lui   $t2, 0x8000
    mtc0  $t2, $10
    mtc0  $zero, $2
    mtc0  $zero, $3
.L80321588:
    mtc0  $t1, $0
    nop
    tlbwi
    nop
    nop
    addi  $t1, $t1, -1
#ifdef VERSION_CN
    bgez  $t1, .L80321588
#else
    bnezl $t1, .L80321588  #bnezl, bnez but with likely hint
#endif
     nop
    mtc0  $t0, $10
    jr    $ra
     nop
