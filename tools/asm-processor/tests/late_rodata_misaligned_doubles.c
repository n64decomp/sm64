GLOBAL_ASM(
.late_rodata
    .float 4.01
    .word 0
    .double 4.02
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

double foo(void) { return 4.03; }

GLOBAL_ASM(
.late_rodata
    .float 4.04
    .double 4.05
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
    nop
    nop
    nop
)

double bar(void) { return 4.06; }
float baz(void) { return 4.07f; }

GLOBAL_ASM(
.late_rodata
    .double 4.08
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
    nop
    nop
)

