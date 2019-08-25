# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"


.section .text, "ax"
    mtc0  $zero, $13
    mtc0  $zero, $9
    mtc0  $zero, $11
    lui   $t0, %hi(D_A4700000)
    addiu $t0, %lo(D_A4700000)
    lw    $t1, 0xc($t0)
    bnez  $t1, .L000003D0
     nop
    addiu $sp, $sp, -0x18
    sw    $s3, ($sp)
    sw    $s4, 4($sp)
    sw    $s5, 8($sp)
    sw    $s6, 0xc($sp)
    sw    $s7, 0x10($sp)
    lui   $t0, %hi(D_A4700000)
    addiu $t0, %lo(D_A4700000)
    lui   $t2, (0xa3f80000 >> 16) # $t2, 0xa3f8
    lui   $t3, (0xa3f00000 >> 16) # $t3, 0xa3f0
    lui   $t4, %hi(D_A4300000)
    addiu $t4, %lo(D_A4300000)
    ori   $t1, $zero, 64
    sw    $t1, 4($t0)
    li   $s1, 8000
.L0000005C:
    nop
    addi  $s1, $s1, -1
    bnez  $s1, .L0000005C
     nop
    sw    $zero, 8($t0)
    ori   $t1, $zero, 20
    sw    $t1, 0xc($t0)
    sw    $zero, ($t0)
    li    $s1, 4
.L00000080:
    nop
    addi  $s1, $s1, -1
    bnez  $s1, .L00000080
     nop
    ori   $t1, $zero, 14
    sw    $t1, ($t0)
    li    $s1, 32
.L0000009C:
    addi  $s1, $s1, -1
    bnez  $s1, .L0000009C
    ori   $t1, $zero, 271
    sw    $t1, ($t4)
    lui   $t1, (0x18082838 >> 16) # lui $t1, 0x1808
    ori   $t1, (0x18082838 & 0xFFFF) # ori $t1, $t1, 0x2838
    sw    $t1, 0x8($t2)
    sw    $zero, 0x14($t2)
    lui   $t1, 0x8000
    sw    $t1, 0x4($t2)
    move  $t5, $zero
    move  $t6, $zero
    lui   $t7, (0xA3F00000 >> 16) # $t7, 0xa3f0
    move  $t8, $zero
    lui   $t9, (0xA3F00000 >> 16)
    lui   $s6, (0xA0000000 >> 16)
    move  $s7, $zero
    lui   $a2, (0xA3F00000 >> 16)
    lui   $a3, (0xA0000000 >> 16)
    move  $s2, $zero
    lui   $s4, (0xA0000000 >> 16)
    addiu $sp, $sp, -0x48
    move  $fp, $sp
    lui   $s0, %hi(D_A4300004) # $s0, 0xa430
    lw    $s0, %lo(D_A4300004)($s0)
    lui   $s1, 0x0101 # $s1, 0x101
    addiu $s1, 0x0101 # addiu $s1, $s1, 0x101
    bne   $s0, $s1, .L00000120
     nop
    li    $s0, 512
    ori   $s1, $t3, 0x4000
    b     .L00000128
     nop
.L00000120:
    li    $s0, 1024
    ori   $s1, $t3, 0x8000
.L00000128:
    sw    $t6, 4($s1)
    addiu $s5, $t7, 0xc
    jal   func_04000778
     nop
    beqz  $v0, .L0000021C
     nop
    sw    $v0, ($sp)
    li    $t1, 8192
    sw    $t1, ($t4)
    lw    $t3, ($t7)
    lui   $t0, 0xf0ff
    and   $t3, $t3, $t0
    sw    $t3, 4($sp)
    addi  $sp, $sp, 8
    li    $t1, 4096
    sw    $t1, ($t4)
    lui   $t0, 0xb019
    bne   $t3, $t0, .L000001A0
     nop
    lui   $t0, 0x800
    add   $t8, $t8, $t0
    add   $t9, $t9, $s0
    add   $t9, $t9, $s0
    lui   $t0, 0x20
    add   $s6, $s6, $t0
    add   $s4, $s4, $t0
    sll   $s2, $s2, 1
    addi  $s2, $s2, 1
    b     .L000001A8
     nop
.L000001A0:
    lui   $t0, 0x10
    add   $s4, $s4, $t0
.L000001A8:
    li    $t0, 8192
    sw    $t0, ($t4)
    lw    $t1, 0x24($t7)
    lw    $k0, ($t7)
    li    $t0, 4096
    sw    $t0, ($t4)
    andi  $t1, $t1, 0xffff
    li    $t0, 1280
    bne   $t1, $t0, .L000001F0
     nop
    lui   $k1, 0x100
    and   $k0, $k0, $k1
    bnez  $k0, .L000001F0
     nop
    lui   $t0, (0x101C0A04 >> 16) # lui $t0, 0x101c
    ori   $t0, (0x101C0A04 & 0xFFFF) # ori $t0, $t0, 0xa04
    sw    $t0, 0x18($t7)
    b     .L000001FC
.L000001F0:
     lui   $t0, (0x080C1204 >> 16) # lui $t0, 0x80c
    ori   $t0, (0x080C1204 & 0xFFFF) # ori $t0, $t0, 0x1204
    sw    $t0, 0x18($t7)
.L000001FC:
    lui   $t0, 0x800
    add   $t6, $t6, $t0
    add   $t7, $t7, $s0
    add   $t7, $t7, $s0
    addiu $t5, $t5, 1
    sltiu $t0, $t5, 8
    bnez  $t0, .L00000128
     nop
.L0000021C:
    li    $t0, 0xc4000000
    sw    $t0, 0xc($t2)
    li    $t0, 0x80000000
    sw    $t0, 0x4($t2)
    move  $sp, $fp
    move  $v1, $zero
.L00000234:
    lw    $t1, 4($sp)
    lui   $t0, 0xb009
    bne   $t1, $t0, .L00000298
     nop
    sw    $t8, 4($s1)
    addiu $s5, $t9, 0xc
    lw    $a0, ($sp)
    addi  $sp, $sp, 8
    li    $a1, 1
    jal   func_04000A40
     nop
    lw    $t0, ($s6)
    lui   $t0, 8
    add   $t0, $t0, $s6
    lw    $t1, ($t0)
    lw    $t0, ($s6)
    lui   $t0, 8
    add   $t0, $t0, $s6
    lw    $t1, ($t0)
    lui   $t0, 0x400
    add   $t6, $t6, $t0
    add   $t9, $t9, $s0
    lui   $t0, 0x10
    add   $s6, $s6, $t0
    b     .L0000031C
.L00000298:
     sw    $s7, 4($s1)
    addiu $s5, $a2, 0xc
    lw    $a0, ($sp)
    addi  $sp, $sp, 8
    li    $a1, 1
    jal   func_04000A40
     nop
    lw    $t0, ($a3)
    lui   $t0, 8
    add   $t0, $t0, $a3
    lw    $t1, ($t0)
    lui   $t0, 0x10
    add   $t0, $t0, $a3
    lw    $t1, ($t0)
    lui   $t0, 0x18
    add   $t0, $t0, $a3
    lw    $t1, ($t0)
    lw    $t0, ($a3)
    lui   $t0, 8
    add   $t0, $t0, $a3
    lw    $t1, ($t0)
    lui   $t0, 0x10
    add   $t0, $t0, $a3
    lw    $t1, ($t0)
    lui   $t0, 0x18
    add   $t0, $t0, $a3
    lw    $t1, ($t0)
    lui   $t0, 0x800
    add   $s7, $s7, $t0
    add   $a2, $a2, $s0
    add   $a2, $a2, $s0
    lui   $t0, 0x20
    add   $a3, $a3, $t0
.L0000031C:
    addiu $v1, $v1, 1
    slt   $t0, $v1, $t5
    bnez  $t0, .L00000234
     nop
    lui   $t2, %hi(D_A4700010) # $t2, 0xa470
    sll   $s2, $s2, 0x13
    lui   $t1, (0x00063634 >> 16) # lui $t1, 6
    ori   $t1, (0x00063634 & 0xFFFF) # ori $t1, $t1, 0x3634
    or    $t1, $t1, $s2
    sw    $t1, %lo(D_A4700010)($t2)
    lw    $t1, %lo(D_A4700010)($t2)
    lui   $t0, (0xA0000300 >> 16) # $t0, 0xa000
    ori   $t0, (0xA0000300 & 0xFFFF) # ori $t0, $t0, 0x300
    lui   $t1, (0x0FFFFFFF >> 16) # lui $t1, 0xfff
    ori   $t1, (0x0FFFFFFF & 0xFFFF) # ori $t1, $t1, 0xffff
    and   $s6, $s6, $t1
    sw    $s6, 0x18($t0)
    move  $sp, $fp
    addiu $sp, $sp, 0x48
    lw    $s3, ($sp)
    lw    $s4, 4($sp)
    lw    $s5, 8($sp)
    lw    $s6, 0xc($sp)
    lw    $s7, 0x10($sp)
    addiu $sp, $sp, 0x18
    lui   $t0, %hi(D_80000000)
    addiu $t0, $t0, %lo(D_80000000)
    addiu $t1, $t0, 0x4000
    addiu $t1, $t1, -0x20
    mtc0  $zero, $28
    mtc0  $zero, $29
.L00000398:
    cache 8, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .L00000398
     addiu $t0, $t0, 0x20
    lui   $t0, %hi(D_80000000)
    addiu $t0, %lo(D_80000000)
    addiu $t1, $t0, 0x2000
    addiu $t1, $t1, -0x10
.L000003B8:
    cache 9, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .L000003B8
     addiu $t0, $t0, 0x10
    b     .L00000418
     nop
.L000003D0:
    lui   $t0, %hi(D_80000000)
    addiu $t0, %lo(D_80000000)
    addiu $t1, $t0, 0x4000
    addiu $t1, $t1, -0x20
    mtc0  $zero, $28
    mtc0  $zero, $29
.L000003E8:
    cache 8, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .L000003E8
     addiu $t0, $t0, 0x20
    lui   $t0, %hi(D_80000000)
    addiu $t0, %lo(D_80000000)
    addiu $t1, $t0, 0x2000
    addiu $t1, $t1, -0x10
.L00000408:
    cache 1, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .L00000408
     addiu $t0, $t0, 0x10
.L00000418:
    lui   $t2, %hi(D_A4000000)
    addiu $t2, $t2, %lo(D_A4000000)
    lui   $t3, 0xfff0
    lui   $t1, 0x0010 # $t1, 0x10
    and   $t2, $t2, $t3
    lui   $t0, %hi(D_A40004C0) # $t0, 0xa400
    addiu $t1, -1 # addiu $t1, $t1, -1
    lui   $t3, %hi(D_A4000774) # $t3, 0xa400
    addiu $t0, %lo(D_A40004C0) # addiu $t0, $t0, 0x4c0
    addiu $t3, %lo(D_A4000774) # addiu $t3, $t3, 0x774
    and   $t0, $t0, $t1
    and   $t3, $t3, $t1
    lui   $t1, 0xa000
    or    $t0, $t0, $t2
    or    $t3, $t3, $t2
    addiu $t1, $t1, 0
.L00000458:
    lw    $t5, ($t0)
    addiu $t0, $t0, 4
    sltu  $at, $t0, $t3
    addiu $t1, $t1, 4
    bnez  $at, .L00000458
     sw    $t5, -4($t1)
    lui   $t4, %hi(D_80000000)
    addiu $t4, %lo(D_80000000)
    jr    $t4
     nop
    lui   $t3, %hi(D_B0000008) # $t3, 0xb000
    lw    $t1, %lo(D_B0000008)($t3)
    lui   $t2, (0x1FFFFFFF >> 16) # lui $t2, 0x1fff
    ori   $t2, (0x1FFFFFFF & 0xFFFF) # ori $t2, $t2, 0xffff
    lui   $at, %hi(D_A4600000)
    and   $t1, $t1, $t2
    sw    $t1, %lo(D_A4600000)($at)
    lui   $t0, %hi(D_A4600010) # $t0, 0xa460
.L000004A0:
    lw    $t0, %lo(D_A4600010)($t0)
    andi  $t0, $t0, 2
    bnezl $t0, .L000004A0
     lui   $t0, %hi(D_A4600010)
    li    $t0, 0x1000
    add   $t0, $t0, $t3
    and   $t0, $t0, $t2
    lui   $at, %hi(D_A4600004) # $at, 0xa460
    sw    $t0, %lo(D_A4600004)($at)
    lui   $t2, 0x0010 # $t2, 0x10
    addiu $t2, 0xFFFF # addiu $t2, $t2, -1
    lui   $at, %hi(D_A460000C) # $at, 0xa460
    sw    $t2, %lo(D_A460000C)($at)

.L000004D4:
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
    lui   $t3, %hi(D_A4600010) # $t3, 0xa460
    lw    $t3, %lo(D_A4600010)($t3)
    andi  $t3, $t3, 1
    bnez  $t3, .L000004D4
     nop
    lui   $t3, %hi(D_B0000008) # $t3, 0xb000
    lw    $a0, %lo(D_B0000008)($t3)
    move  $a1, $s6
    lui   $at, (0x5D588B65 >> 16) # lui $at, 0x5d58
    ori   $at, (0x5D588B65 & 0xFFFF) # ori $at, $at, 0x8b65
    multu $a1, $at
    addiu $sp, $sp, -0x20
    sw    $ra, 0x1c($sp)
    sw    $s0, 0x14($sp)
    lui   $ra, 0x10
    move  $v1, $zero
    move  $t0, $zero
    move  $t1, $a0
    li    $t5, 32
    mflo  $v0
    addiu $v0, $v0, 1
    move  $a3, $v0
    move  $t2, $v0
    move  $t3, $v0
    move  $s0, $v0
    move  $a2, $v0
    move  $t4, $v0
.L000005B0:
    lw    $v0, ($t1)
    addu  $v1, $a3, $v0
    sltu  $at, $v1, $a3
    beqz  $at, .L000005C8
     move  $a1, $v1
    addiu $t2, $t2, 1
.L000005C8:
    andi  $v1, $v0, 0x1f
    subu  $t7, $t5, $v1
    srlv  $t8, $v0, $t7
    sllv  $t6, $v0, $v1
    or    $a0, $t6, $t8
    sltu  $at, $a2, $v0
    move  $a3, $a1
    xor   $t3, $t3, $v0
    beqz  $at, .L000005FC
     addu  $s0, $s0, $a0
    xor   $t9, $a3, $v0
    b     .L00000600
     xor   $a2, $t9, $a2
.L000005FC:
    xor   $a2, $a2, $a0
.L00000600:
    addiu $t0, $t0, 4
    xor   $t7, $v0, $s0
    addiu $t1, $t1, 4
    bne   $t0, $ra, .L000005B0
     addu  $t4, $t7, $t4
    xor   $t6, $a3, $t2
    xor   $a3, $t6, $t3
    xor   $t8, $s0, $a2
    xor   $s0, $t8, $t4
    lui   $t3, %hi(D_B0000010) # $t3, 0xb000
    lw    $t0, %lo(D_B0000010)($t3)
    bne   $a3, $t0, .L00000648
     nop
    lw    $t0, %lo(D_B0000014)($t3)
    bne   $s0, $t0, .L00000648
     nop
    bal   func_00000650
     nop

func_00000648:
.L00000648:
    bal   func_00000648
     nop

func_00000650:
    lui   $t1, %hi(D_A4080000)
    lw    $t1, %lo(D_A4080000)($t1)
    lw    $s0, 0x14($sp)
    lw    $ra, 0x1c($sp)
    beqz  $t1, .L0000067C
     addiu $sp, $sp, 0x20
    li    $t2, 65
    lui   $at, %hi(D_A4040010) # $at, 0xa404
    sw    $t2, %lo(D_A4040010)($at)
    lui   $at, %hi(D_A4080000)
    sw    $zero, %lo(D_A4080000)($at)
.L0000067C:
    lui   $t3, (0x00AAAAAE >> 16) # lui $t3, 0xaa
    ori   $t3, (0x00AAAAAE & 0xFFFF) # ori $t3, $t3, 0xaaae
    lui   $at, %hi(D_A4040010) # $at, 0xa404
    sw    $t3, %lo(D_A4040010)($at)
    lui   $at, %hi(D_A430000C) # $at, 0xa430
    li    $t0, 1365
    sw    $t0, %lo(D_A430000C)($at)
    lui   $at, %hi(D_A4800018) # $at, 0xa480
    sw    $zero, %lo(D_A4800018)($at)
    lui   $at, %hi(D_A450000C) # $at, 0xa450
    sw    $zero, %lo(D_A450000C)($at)
    lui   $at, %hi(D_A4300000)
    li    $t1, 2048
    sw    $t1, %lo(D_A4300000)($at)
    li    $t1, 2
    lui   $at, %hi(D_A4600010) # $at, 0xa460
    lui   $t0, (0xA0000300 >> 16) # $t0, 0xa000
    ori   $t0, (0xA0000300 & 0xFFFF) # ori $t0, $t0, 0x300
    sw    $t1, %lo(D_A4600010)($at)
    sw    $s7, 0x14($t0)
    sw    $s5, 0xc($t0)
    sw    $s3, 0x4($t0)
    beqz  $s3, .L000006E8
     sw    $s4, ($t0)
    lui   $t1, 0xa600
    b     .L000006F0
     addiu $t1, $t1, 0
.L000006E8:
    lui   $t1, 0xb000
    addiu $t1, $t1, 0
.L000006F0:
    sw    $t1, 0x8($t0)
    lui   $t0, %hi(D_A4000000)
    addiu $t0, %lo(D_A4000000)
    addi  $t1, $t0, 0x1000
.L00000700:
    addiu $t0, $t0, 4
    bne   $t0, $t1, .L00000700
     sw    $zero, -4($t0)
    lui   $t0, %hi(D_A4001000) # $t0, 0xa400
    addiu $t0, %lo(D_A4001000) # addiu $t0, $t0, 0x1000
    addi  $t1, $t0, 0x1000
.L00000718:
    addiu $t0, $t0, 4
    bne   $t0, $t1, .L00000718
     sw    $zero, -4($t0)
    lui   $t3, %hi(D_B0000008) # $t3, 0xb000
    lw    $t1, %lo(D_B0000008)($t3)
    jr    $t1
     nop
    nop

func_04000778:
    addiu $sp, $sp, -0xa0
    sw    $s0, 0x40($sp)
    sw    $s1, 0x44($sp)
    move  $s1, $zero
    move  $s0, $zero
    sw    $v0, ($sp)
    sw    $v1, 4($sp)
    sw    $a0, 8($sp)
    sw    $a1, 0xc($sp)
    sw    $a2, 0x10($sp)
    sw    $a3, 0x14($sp)
    sw    $t0, 0x18($sp)
    sw    $t1, 0x1c($sp)
    sw    $t2, 0x20($sp)
    sw    $t3, 0x24($sp)
    sw    $t4, 0x28($sp)
    sw    $t5, 0x2c($sp)
    sw    $t6, 0x30($sp)
    sw    $t7, 0x34($sp)
    sw    $t8, 0x38($sp)
    sw    $t9, 0x3c($sp)
    sw    $s2, 0x48($sp)
    sw    $s3, 0x4c($sp)
    sw    $s4, 0x50($sp)
    sw    $s5, 0x54($sp)
    sw    $s6, 0x58($sp)
    sw    $s7, 0x5c($sp)
    sw    $fp, 0x60($sp)
    sw    $ra, 0x64($sp)
.L000007AC:
    jal   func_04000880
     nop
    addiu $s0, $s0, 1
    slti  $t1, $s0, 4
    bnez  $t1, .L000007AC
     addu  $s1, $s1, $v0
    srl   $a0, $s1, 2
    jal   func_04000A40
     li    $a1, 1
    lw    $ra, 0x64($sp)
    srl   $v0, $s1, 2
    lw    $s1, 0x44($sp)
    lw    $v1, 4($sp)
    lw    $a0, 8($sp)
    lw    $a1, 0xc($sp)
    lw    $a2, 0x10($sp)
    lw    $a3, 0x14($sp)
    lw    $t0, 0x18($sp)
    lw    $t1, 0x1c($sp)
    lw    $t2, 0x20($sp)
    lw    $t3, 0x24($sp)
    lw    $t4, 0x28($sp)
    lw    $t5, 0x2c($sp)
    lw    $t6, 0x30($sp)
    lw    $t7, 0x34($sp)
    lw    $t8, 0x38($sp)
    lw    $t9, 0x3c($sp)
    lw    $s0, 0x40($sp)
    lw    $s2, 0x48($sp)
    lw    $s3, 0x4c($sp)
    lw    $s4, 0x50($sp)
    lw    $s5, 0x54($sp)
    lw    $s6, 0x58($sp)
    lw    $s7, 0x5c($sp)
    lw    $fp, 0x60($sp)
    jr    $ra
     addiu $sp, $sp, 0xa0

func_04000880:
    addiu $sp, $sp, -0x20
    sw    $ra, 0x1c($sp)
    move  $t1, $zero
    move  $t3, $zero
    move  $t4, $zero
.L00000854:
    slti  $k0, $t4, 0x40
    beql  $k0, $zero, .L000008BC
     move  $v0, $zero
    jal   func_0400090C
     move  $a0, $t4
    blezl $v0, .L0000088C
     slti  $k0, $t1, 0x50
    subu  $k0, $v0, $t1
    multu $k0, $t4
    move  $t1, $v0
    mflo  $k0
    addu  $t3, $t3, $k0
    nop
    slti  $k0, $t1, 0x50
.L0000088C:
    bnez  $k0, .L00000854
     addiu $t4, $t4, 1
    sll   $a0, $t3, 2
    subu  $a0, $a0, $t3
    sll   $a0, $a0, 2
    subu  $a0, $a0, $t3
    sll   $a0, $a0, 1
    jal   func_04000980
     addiu $a0, $a0, -0x370 # compute (t3 - 40) * 22
    b     .L000008C0
     lw    $ra, 0x1c($sp)
    move  $v0, $zero
.L000008BC:
    lw    $ra, 0x1c($sp)
.L000008C0:
    addiu $sp, $sp, 0x20
    jr    $ra
     nop

func_0400090C:
    addiu $sp, $sp, -0x28
    sw    $ra, 0x1c($sp)
    move  $v0, $zero
    jal   func_04000A40
     li    $a1, 2
    move  $fp, $zero
    li    $k0, -1
.L000008E8:
    sw    $k0, 4($s4)
    lw    $v1, 4($s4)
    sw    $k0, ($s4)
    sw    $k0, ($s4)
    move  $gp, $zero
    srl   $v1, $v1, 0x10
.L00000900:
    andi  $k0, $v1, 1
    beql  $k0, $zero, .L00000914
     addiu $gp, $gp, 1
    addiu $v0, $v0, 1
    addiu $gp, $gp, 1
.L00000914:
    slti  $k0, $gp, 8
    bnez  $k0, .L00000900
     srl   $v1, $v1, 1
    addiu $fp, $fp, 1
    slti  $k0, $fp, 0xa
    bnezl $k0, .L000008E8
     li    $k0, -1
    lw    $ra, 0x1c($sp)
    addiu $sp, $sp, 0x28
    jr    $ra
     nop

func_04000980:
    addiu $sp, $sp, -0x28
    sw    $ra, 0x1c($sp)
    sw    $a0, 0x20($sp)
    sb    $zero, 0x27($sp)
    move  $t0, $zero
    move  $t2, $zero
    li    $t5, 51200
    move  $t6, $zero
    slti  $k0, $t6, 0x40
.L00000964:
    bnezl $k0, .L00000978
     move  $a0, $t6
    b     .L000009F0
     move  $v0, $zero
    move  $a0, $t6
.L00000978:
    jal   func_04000A40
     li    $a1, 1
    jal   func_04000AD0
     addiu $a0, $sp, 0x27
    jal   func_04000AD0
     addiu $a0, $sp, 0x27
    lbu   $k0, 0x27($sp)
    li    $k1, 800
    lw    $a0, 0x20($sp)
    multu $k0, $k1
    mflo  $t0
    subu  $k0, $t0, $a0
    bgezl $k0, .L000009B8
     slt   $k1, $k0, $t5
    subu  $k0, $a0, $t0
    slt   $k1, $k0, $t5
.L000009B8:
    beql  $k1, $zero, .L000009CC
     lw    $a0, 0x20($sp)
    move  $t5, $k0
    move  $t2, $t6
    lw    $a0, 0x20($sp)
.L000009CC:
    slt   $k1, $t0, $a0
    beql  $k1, $zero, .L000009EC
     addu  $v0, $t2, $t6
    addiu $t6, $t6, 1
    slti  $k1, $t6, 0x41
    bnezl $k1, .L00000964
     slti  $k0, $t6, 0x40
    addu  $v0, $t2, $t6
.L000009EC:
    srl   $v0, $v0, 1
.L000009F0:
    lw    $ra, 0x1c($sp)
    addiu $sp, $sp, 0x28
    jr    $ra
     nop

func_04000A40:
    addiu $sp, $sp, -0x28
    andi  $a0, $a0, 0xff
    li    $k1, 1
    xori  $a0, $a0, 0x3f
    sw    $ra, 0x1c($sp)
    bne   $a1, $k1, .L00000A24
     lui   $t7, 0x4600
    lui   $k0, 0x8000
    or    $t7, $t7, $k0
.L00000A24:
    andi  $k0, $a0, 1
    sll   $k0, $k0, 6
    or    $t7, $t7, $k0
    andi  $k0, $a0, 2
    sll   $k0, $k0, 0xd
    or    $t7, $t7, $k0
    andi  $k0, $a0, 4
    sll   $k0, $k0, 0x14
    or    $t7, $t7, $k0
    andi  $k0, $a0, 8
    sll   $k0, $k0, 4
    or    $t7, $t7, $k0
    andi  $k0, $a0, 0x10
    sll   $k0, $k0, 0xb
    or    $t7, $t7, $k0
    andi  $k0, $a0, 0x20
    sll   $k0, $k0, 0x12
    or    $t7, $t7, $k0
    li    $k1, 1
    bne   $a1, $k1, .L00000A80
     sw    $t7, ($s5)
    lui   $k0, %hi(D_A4300000)
    sw    $zero, %lo(D_A4300000)($k0)
.L00000A80:
    lw    $ra, 0x1c($sp)
    addiu $sp, $sp, 0x28
    jr    $ra
     nop

func_04000AD0:
    addiu $sp, $sp, -0x28
    sw    $ra, 0x1c($sp)
    li    $k0, 0x2000
    lui   $k1, %hi(D_A4300000)
    sw    $k0, %lo(D_A4300000)($k1)
    move  $fp, $zero
    lw    $fp, ($s5)
    li    $k0, 0x1000
    sw    $k0, %lo(D_A4300000)($k1)
    li    $k1, 0x40
    and   $k1, $k1, $fp
    srl   $k1, $k1, 6
    move  $k0, $zero
    or    $k0, $k0, $k1
    li    $k1, 0x4000
    and   $k1, $k1, $fp
    srl   $k1, $k1, 0xd
    or    $k0, $k0, $k1
    li    $k1, 0x400000
    and   $k1, $k1, $fp
    srl   $k1, $k1, 0x14
    or    $k0, $k0, $k1
    li    $k1, 0x80
    and   $k1, $k1, $fp
    srl   $k1, $k1, 4
    or    $k0, $k0, $k1
    li    $k1, 0x8000
    and   $k1, $k1, $fp
    srl   $k1, $k1, 0xb
    or    $k0, $k0, $k1
    li    $k1, 0x800000
    and   $k1, $k1, $fp
    srl   $k1, $k1, 0x12
    or    $k0, $k0, $k1
    sb    $k0, ($a0)
    lw    $ra, 0x1c($sp)
    addiu $sp, $sp, 0x28
    jr    $ra
     nop
    nop

.incbin "lib/bin/ipl3_font.bin"
