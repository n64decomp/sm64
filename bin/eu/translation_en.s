# SM64 (EU) Segment 19 - English
.section .rodata
.include "macros.inc"

.macro textdata name
    .include "build/eu/text/en/\name\().s"
.endm

 textdata dialog
 textdata level
 textdata star

