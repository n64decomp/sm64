
GLOBAL_ASM(
.rdata
.word 0x1212
)

GLOBAL_ASM(
.late_rodata
.word 0x123123
.text
glabel test
/* 000090 00400090 27BDFFF8 */  addiu $sp, $sp, -24
/* 000094 00400094 18A00009 */  blez  $a1, .L004000BC
/* 000098 00400098 AFA00004 */   sw    $zero, 4($sp)
.L0040009C:
/* 00009C 0040009C 8FAE0004 */  lw    $t6, 4($sp)
/* 0000A0 004000A0 008E7821 */  addu  $t7, $a0, $t6
/* 0000A4 004000A4 A1E00000 */  sb    $zero, ($t7)
/* 0000A8 004000A8 8FB80004 */  lw    $t8, 4($sp)
/* 0000AC 004000AC 27190001 */  addiu $t9, $t8, 1
/* 0000B0 004000B0 0325082A */  slt   $at, $t9, $a1
/* 0000B4 004000B4 1420FFF9 */  bnez  $at, .L0040009C
/* 0000B8 004000B8 AFB90004 */   sw    $t9, 4($sp)
.L004000BC:
/* 0000BC 004000BC 10000001 */  b     .L004000C4
/* 0000C0 004000C0 00000000 */   nop
.L004000C4:
/* 0000C4 004000C4 03E00008 */  jr    $ra
/* 0000C8 004000C8 27BD0008 */   addiu $sp, $sp, 24
)

char bss1[3];
GLOBAL_ASM(
.bss
bss2:
.space 3
)
char bss3[3];
char bss4[3];
const int rodata1[2] = {1};
extern int some_rodata;

unsigned g(float, int);
unsigned f(void) {
    return g(1.1f, some_rodata);
}

GLOBAL_ASM(
.rdata
glabel some_rodata
.word 0x1313
.text
.late_rodata
.word 0x321321
.text
glabel g
/* 0000C0 004000C0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0000C4 004000C4 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0000C8 004000C8 240E0004 */  addiu $t6, $zero, 4
/* 0000CC 004000CC 3C010041 */  lui   $at, %hi(D_410100)
/* 0000D0 004000D0 AC2E0100 */  sw    $t6, %lo(D_410100)($at)
/* 0000D4 004000D4 0C10002C */  jal   func_004000B0
/* 0000D8 004000D8 00000000 */   nop
/* 0000DC 004000DC 10000001 */  b     .L004000E4
/* 0000E0 004000E0 00000000 */   nop
.L004000E4:
/* 0000E4 004000E4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0000E8 004000E8 27BD0018 */  addiu $sp, $sp, 0x18
/* 0000EC 004000EC 03E00008 */  jr    $ra
/* 0000F0 004000F0 00000000 */   nop
)
