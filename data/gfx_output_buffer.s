.include "macros.inc"

.section .bss

# There's a bunch of unused space here due to the align (~0x100 in JP, ~0x300 in US)
.balign 0x1000

glabel gGfxSPTaskOutputBuffer /* FIFO buffer */
    .space 0x1F000
