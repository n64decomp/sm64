// COMPILE-FLAGS: -O2
static int xtext(int a, int b, int c);
const int rodata1[] = {1};
static const int rodata2[] = {2};
int data1[] = {3};
static int data2[] = {4};
int bss1;
static int bss2;

GLOBAL_ASM(
glabel bar
lui $a0, %hi(rodata2)
lw $a0, %lo(rodata2)($a0)
lui $a1, %hi(data2)
lw $a1, %lo(data2)($a0)
lui $a2, %hi(bss2)
lw $a2, %lo(bss2)($a0)
jal xtext
nop
jr $ra
nop
nop
nop
)

static int xtext(int a, int b, int c) {
    return 1;
}

void baz(void) {
    xtext(bss2, rodata2[0], data2[0]);
}
