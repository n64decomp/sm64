.include "macros.inc"

.section .data

.macro demo name
    .word32 (\name - gDemoInputs)
    .word32 (\name\()_end - \name)
.endm

# Whomp's Fortress has the wrong size. The original entries probably manually
# input the sizes, but we opt for macros for cleanliness.
.macro demo2 name
    .word32 (\name - gDemoInputs)
    .word32 ((\name\()_end + 0x170) - \name)
.endm

.macro demofile name
    \name:
    .incbin "assets/demos/\name\().bin"
    \name\()_end:
.endm

glabel gDemoInputs
.word32 (demo_entry_end - demo_entry_start) / 8 # number of entries
.word 0

demo_entry_start:
.ifdef VERSION_US
demo  bitdw # Bowser in the Dark World
.endif
demo2 wf # Whomp's Fortress (the size is too large, but the demo ends before it can use the PSS demo inputs.)
demo  ccm # Cool Cool Mountain
demo  bbh # Big Boo's Haunt
demo  jrb # Jolly Rodger's Bay
demo  hmc # Hazy Maze Cave
demo  pss # Princess Secret Slide
demo_entry_end:

demofile bbh
demofile ccm
demofile hmc
demofile jrb
demofile wf
demofile pss
demofile unused # might be an unused demo, but it doesn't define a header, so it cant be
                # normally called. speculation: "blooper" take for CCM. Mario runs into
                # the sign and aligns himself as if it were a mistake.
.ifdef VERSION_US
demofile bitdw
.endif
