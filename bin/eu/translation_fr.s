# SM64 (EU) Segment 19 - Français
.section .rodata
.include "macros.inc"

.macro textdata name
    .include "build/eu/text/fr/\name\().s"
.endm

 textdata dialog
 textdata level
 textdata star

