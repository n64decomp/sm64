// COMPILE-FLAGS: -O2

int a(void) { return 1; }
GLOBAL_ASM(
glabel foo
addiu $a0, $a0, 1
addiu $a0, $a0, 2
addiu $a0, $a0, 3
jr $ra
addiu $a0, $a0, 4
)
float b(void) { return 1.2f; }
GLOBAL_ASM(
.late_rodata
glabel float1
.float 12.34

.text
glabel bar
addiu $a0, $a0, 5
addiu $a0, $a0, 6
lui $v0, %hi(float1 + 1)
jr $ra
addiu $v0, $v0, %lo(float1 + 1)
)
float c(void) { return 1.3f; }
