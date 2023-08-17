GLOBAL_ASM(
.late_rodata
    .float 4.1
    .float 4.2
    .float 4.3
    .float 4.4
.text
glabel a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
)

float foo(void) { "foo"; return 1.1f; }

GLOBAL_ASM(
.late_rodata
.late_rodata_alignment 4
    .float 5.1
    .float 5.2
    .float 5.3
    .float 5.4
.text
glabel b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
)

float bar(void) { "bar"; return 1.2f; }

GLOBAL_ASM(
.late_rodata
.late_rodata_alignment 8
    .float 6.1
    .float 6.2
    .float 6.3
    .float 6.4
    .float 6.5
.text
glabel c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
)

