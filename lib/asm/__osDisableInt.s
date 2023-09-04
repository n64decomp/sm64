.set noreorder // don't insert nops after branches

#include "macros.inc"

#include <PR/R4300.h>


.section .text, "ax"


glabel __osDisableInt
#ifdef VERSION_CN
    la    $t2, __OSGlobalIntMask
    lw    $t3, ($t2)
    andi  $t3, $t3, SR_IMASK
#endif
    mfc0  $t0, C0_SR
    and   $t1, $t0, ~SR_IE
    mtc0  $t1, C0_SR
    andi  $v0, $t0, SR_IE
#ifdef VERSION_CN
    lw    $t0, ($t2)
    andi  $t0, $t0, SR_IMASK
    beq   $t0, $t3, .Lret
     lui   $t2, %hi(__osRunningThread)
    addiu $t2, %lo(__osRunningThread)
    lw    $t1, 0x118($t2)
    andi  $t2, $t1, SR_IMASK
    and   $t2, $t2, $t0
    and   $t1, $t1, ~SR_IMASK
    or    $t1, $t1, $t2
    and   $t1, $t1, ~SR_IE
    mtc0  $t1, $12
    nop
#endif
    nop
.Lret:
    jr    $ra
     nop

