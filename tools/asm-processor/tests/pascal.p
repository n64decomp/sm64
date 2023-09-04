{ COMPILE-FLAGS: -O2 }

function foo(x: integer): integer;
begin
    foo := x * 3
end;

GLOBAL_ASM(
.section .data
.word 0x2323

.late_rodata
.word 0x123123
.word 0x456456
.word 0x789789
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

GLOBAL_ASM(
.section .data
.word 0x3434

.late_rodata
.word 0x1
.double 1.1
.word 0x2, 0x3
.text
glabel test2
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
nop
)

GLOBAL_ASM(
.late_rodata
.double 2.1
.text
glabel test3
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
nop
)

function bar(x: integer): integer;
begin
    return x * 3
end;

