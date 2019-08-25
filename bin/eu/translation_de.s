# SM64 (EU) Segment 19 - Deutsch
.section .rodata
.include "macros.inc"

.macro textdata name
    .include "build/eu/text/de/\name\().s"
.endm

 textdata dialog
 textdata level
 textdata star

