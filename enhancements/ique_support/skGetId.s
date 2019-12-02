# Code by stuckpixel

.set noreorder
.set gp=64

.include "macros.inc"

glabel skGetId
    li  $v0, 0
    li  $t0, 0xA4300014
    lw  $t1, 0x00($t0)
    nop
    jr  $ra
    nop
    nop
    nop
    nop
    nop
