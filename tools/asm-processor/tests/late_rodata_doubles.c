GLOBAL_ASM(
.late_rodata
    .float 4.1
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

float foo(void) {
    return 4.15f;
}

GLOBAL_ASM(
.late_rodata
    .float 4.2
    .word 0
    .double 4.3
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

float bar(void) {
    return 4.4f;
}

GLOBAL_ASM(
.late_rodata
    .float 4.55
    .double 4.6
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

float baz(void) {
    return 4.6f;
}
