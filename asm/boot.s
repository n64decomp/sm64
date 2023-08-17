// assembler directives
.set noat      // allow manual use of $at
.set noreorder // don't insert nops after branches

#include "macros.inc"

.equ EXCEPTION_TLB_MISS, 0x80000000
.equ SP_DMEM,            0xA4000000
.equ SP_IMEM,            0xA4001000
.equ MI_MODE_REG,        0xA4300000
.equ RI_MODE_REG,        0xA4700000

#ifdef VERSION_CN
.macro cn_li a b
    li \a, \b
.endm
#else
.macro cn_li a b
    lui \a, %hi(\b)
    addiu \a, \a, %lo(\b)
.endm
#endif

// 0xA0000000-0xBFFFFFFF: KSEG1 direct map non-cache mirror of 0x00000000
// 0xA4000000-0xA4000FFF: RSP DMEM

// 0xA4000000-0xA400003F: ROM header

.section .text, "ax"

// 0xA4000040-0xA4000B6F: IPL3

// IPL3 entry point jumped to from IPL2
glabel ipl3_entry // 0xA4000040
    mtc0  $zero, $13
    mtc0  $zero, $9
    mtc0  $zero, $11
    cn_li $t0, RI_MODE_REG
    lw    $t1, 0xc($t0)
    bnez  $t1, .LA4000410
     nop
    addiu $sp, $sp, -0x18
    sw    $s3, ($sp)
    sw    $s4, 4($sp)
    sw    $s5, 8($sp)
    sw    $s6, 0xc($sp)
    sw    $s7, 0x10($sp)
    cn_li $t0, RI_MODE_REG
    lui   $t2, (0xa3f80000 >> 16)
    lui   $t3, (0xa3f00000 >> 16)
    cn_li $t4, MI_MODE_REG
    ori   $t1, $zero, 64
    sw    $t1, 4($t0)
    li    $s1, 8000
.LA400009C:
    nop
    addi  $s1, $s1, -1
    bnez  $s1, .LA400009C
     nop
    sw    $zero, 8($t0)
    ori   $t1, $zero, 20
    sw    $t1, 0xc($t0)
    sw    $zero, ($t0)
    li    $s1, 4
.LA40000C0:
    nop
    addi  $s1, $s1, -1
    bnez  $s1, .LA40000C0
     nop
    ori   $t1, $zero, 14
    sw    $t1, ($t0)
    li    $s1, 32
.LA40000DC:
    addi  $s1, $s1, -1
    bnez  $s1, .LA40000DC
    ori   $t1, $zero, 271
    sw    $t1, ($t4)
    lui   $t1, (0x18082838 >> 16)
    ori   $t1, (0x18082838 & 0xFFFF)
    sw    $t1, 0x8($t2)
    sw    $zero, 0x14($t2)
    lui   $t1, 0x8000
    sw    $t1, 0x4($t2)
    move  $t5, $zero
    move  $t6, $zero
    lui   $t7, (0xA3F00000 >> 16)
    move $t8, $zero
    lui   $t9, (0xA3F00000 >> 16)
    lui   $s6, (0xA0000000 >> 16)
    move $s7, $zero
    lui   $a2, (0xA3F00000 >> 16)
    lui   $a3, (0xA0000000 >> 16)
    move $s2, $zero
    lui   $s4, (0xA0000000 >> 16)
    addiu $sp, $sp, -0x48
    move $fp, $sp
    lui   $s0, %hi(MI_VERSION_REG)
    lw    $s0, %lo(MI_VERSION_REG)($s0)
    cn_li $s1, 0x01010101
    bne   $s0, $s1, .LA4000160
     nop
    li    $s0, 512
    ori   $s1, $t3, 0x4000
    b     .LA4000168
     nop
.LA4000160:
    li    $s0, 1024
    ori   $s1, $t3, 0x8000
.LA4000168:
    sw    $t6, 4($s1)
    addiu $s5, $t7, 0xc
    jal   func_A4000778
     nop
    beqz  $v0, .LA400025C
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
    bne   $t3, $t0, .LA40001E0
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
    b     .LA40001E8
     nop
.LA40001E0:
    lui   $t0, 0x10
    add   $s4, $s4, $t0
.LA40001E8:
    li    $t0, 8192
    sw    $t0, ($t4)
    lw    $t1, 0x24($t7)
    lw    $k0, ($t7)
    li    $t0, 4096
    sw    $t0, ($t4)
    andi  $t1, $t1, 0xffff
    li    $t0, 1280
    bne   $t1, $t0, .LA4000230
     nop
    lui   $k1, 0x100
    and   $k0, $k0, $k1
    bnez  $k0, .LA4000230
     nop
    lui   $t0, (0x101C0A04 >> 16)
    ori   $t0, (0x101C0A04 & 0xFFFF)
    sw    $t0, 0x18($t7)
    b     .LA400023C
.LA4000230:
     lui   $t0, (0x080C1204 >> 16)
    ori   $t0, (0x080C1204 & 0xFFFF)
    sw    $t0, 0x18($t7)
.LA400023C:
    lui   $t0, 0x800
    add   $t6, $t6, $t0
    add   $t7, $t7, $s0
    add   $t7, $t7, $s0
    addiu $t5, $t5, 1
    sltiu $t0, $t5, 8
    bnez  $t0, .LA4000168
     nop
.LA400025C:
#ifdef VERSION_CN
    li    $t0, 0xc0000000
#else
    li    $t0, 0xc4000000
#endif
    sw    $t0, 0xc($t2)
    li    $t0, 0x80000000
    sw    $t0, 0x4($t2)
    move $sp, $fp
    move $v1, $zero
.LA4000274:
    lw    $t1, 4($sp)
    lui   $t0, 0xb009
    bne   $t1, $t0, .LA40002D8
     nop
    sw    $t8, 4($s1)
    addiu $s5, $t9, 0xc
    lw    $a0, ($sp)
    addi  $sp, $sp, 8
    li    $a1, 1
    jal   func_A4000A40
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
    b     .LA400035C
.LA40002D8:
     sw    $s7, 4($s1)
    addiu $s5, $a2, 0xc
    lw    $a0, ($sp)
    addi  $sp, $sp, 8
    li    $a1, 1
    jal   func_A4000A40
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
.LA400035C:
    addiu $v1, $v1, 1
    slt   $t0, $v1, $t5
    bnez  $t0, .LA4000274
     nop
    lui   $t2, %hi(RI_REFRESH_REG)
    sll   $s2, $s2, 0x13
    lui   $t1, (0x00063634 >> 16)
    ori   $t1, (0x00063634 & 0xFFFF)
    or    $t1, $t1, $s2
    sw    $t1, %lo(RI_REFRESH_REG)($t2)
    lw    $t1, %lo(RI_REFRESH_REG)($t2)
    lui   $t0, (0xA0000300 >> 16)
    ori   $t0, (0xA0000300 & 0xFFFF)
    lui   $t1, (0x0FFFFFFF >> 16)
    ori   $t1, (0x0FFFFFFF & 0xFFFF)
    and   $s6, $s6, $t1
    sw    $s6, 0x18($t0)
    move $sp, $fp
    addiu $sp, $sp, 0x48
    lw    $s3, ($sp)
    lw    $s4, 4($sp)
    lw    $s5, 8($sp)
    lw    $s6, 0xc($sp)
    lw    $s7, 0x10($sp)
    addiu $sp, $sp, 0x18
    cn_li $t0, EXCEPTION_TLB_MISS
    addiu $t1, $t0, 0x4000
    addiu $t1, $t1, -0x20
    mtc0  $zero, $28
    mtc0  $zero, $29
.LA40003D8:
    cache 8, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .LA40003D8
     addiu $t0, $t0, 0x20
    cn_li $t0, EXCEPTION_TLB_MISS
    addiu $t1, $t0, 0x2000
    addiu $t1, $t1, -0x10
.LA40003F8:
    cache 9, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .LA40003F8
     addiu $t0, $t0, 0x10
    b     .LA4000458
     nop
.LA4000410:
    cn_li  $t0, EXCEPTION_TLB_MISS
    addiu $t1, $t0, 0x4000
    addiu $t1, $t1, -0x20
    mtc0  $zero, $28
    mtc0  $zero, $29
.LA4000428:
    cache 8, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .LA4000428
     addiu $t0, $t0, 0x20
    cn_li $t0, EXCEPTION_TLB_MISS
    addiu $t1, $t0, 0x2000
    addiu $t1, $t1, -0x10
.LA4000448:
    cache 1, ($t0)
    sltu  $at, $t0, $t1
    bnez  $at, .LA4000448
     addiu $t0, $t0, 0x10
.LA4000458:
#ifdef VERSION_CN
    la    $t0, D_CN_0400049C
    lui   $t1, 0xf
    ori   $t1, $t1, 0xffff
    and   $t0, $t0, $t1
    lui   $t2, 0xa400
    lui   $t3, 0xfff0
    and   $t2, $t2, $t3
    or    $t0, $t0, $t2
    la    $t3, D_CN_0400074C
    and   $t3, $t3, $t1
    or    $t3, $t3, $t2
    lui   $t1, 0xa000
.LA4000474:
    lw    $t5, ($t0)
    sw    $t5, ($t1)
    addiu $t0, $t0, 4
    addiu $t1, $t1, 4
    sltu  $at, $t0, $t3
    bnez  $at, .LA4000474
     nop
    lui   $t4, 0x8000
    jr    $t4
     nop
    lui   $t3, 0xb000
    lui   $t2, 0x1fff
    ori   $t2, $t2, 0xffff
    lw    $t1, 8($t3)
    and   $t1, $t1, $t2
    lui   $at, 0xa460
    sw    $t1, ($at)
.LA40004B8:
    lui   $t0, 0xa460
    lw    $t0, 0x10($t0)
    andi  $t0, $t0, 2
    bnez  $t0, .LA40004B8
     nop
#else
    cn_li $t2, SP_DMEM
    lui   $t3, 0xfff0
    lui   $t1, 0x0010
    and   $t2, $t2, $t3
    lui   $t0, %hi(SP_DMEM_UNK0)
    addiu $t1, -1
    lui   $t3, %hi(SP_DMEM_UNK1)
    addiu $t0, %lo(SP_DMEM_UNK0)
    addiu $t3, %lo(SP_DMEM_UNK1)
    and   $t0, $t0, $t1
    and   $t3, $t3, $t1
    lui   $t1, 0xa000
    or    $t0, $t0, $t2
    or    $t3, $t3, $t2
    addiu $t1, $t1, 0
.LA4000498:
    lw    $t5, ($t0)
    addiu $t0, $t0, 4
    sltu  $at, $t0, $t3
    addiu $t1, $t1, 4
    bnez  $at, .LA4000498
     sw    $t5, -4($t1)
    cn_li $t4, EXCEPTION_TLB_MISS
    jr    $t4
     nop
    lui   $t3, %hi(D_B0000008)
    lw    $t1, %lo(D_B0000008)($t3)
    lui   $t2, (0x1FFFFFFF >> 16)
    ori   $t2, (0x1FFFFFFF & 0xFFFF)
    lui   $at, %hi(PI_DRAM_ADDR_REG)
    and   $t1, $t1, $t2
    sw    $t1, %lo(PI_DRAM_ADDR_REG)($at)
    lui   $t0, %hi(PI_STATUS_REG)
.LA40004D0:
    lw    $t0, %lo(PI_STATUS_REG)($t0)
    andi  $t0, $t0, 2
    bnezl $t0, .LA40004D0
     lui   $t0, %hi(PI_STATUS_REG)
#endif
    li    $t0, 0x1000
    add   $t0, $t0, $t3
    and   $t0, $t0, $t2
    lui   $at, %hi(PI_CART_ADDR_REG)
    sw    $t0, %lo(PI_CART_ADDR_REG)($at)
    cn_li $t2, 0x000FFFFF
    lui   $at, %hi(PI_WR_LEN_REG)
    sw    $t2, %lo(PI_WR_LEN_REG)($at)

.LA4000514:
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
    lui   $t3, %hi(PI_STATUS_REG)
    lw    $t3, %lo(PI_STATUS_REG)($t3)
    andi  $t3, $t3, 0x1
    bnez  $t3, .LA4000514
     nop
#ifdef VERSION_CN
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
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
#endif
#ifdef VERSION_CN
    lui   $t1, %hi(SP_PC)
    lw    $t1, %lo(SP_PC)($t1)
    beqz  $t1, .LA4000698
     nop
    addiu $t2, $zero, 0x41
    lui   $at, %hi(SP_STATUS_REG)
    sw    $t2, %lo(SP_STATUS_REG)($at)
    lui   $at, %hi(SP_PC)
    sw    $zero, %lo(SP_PC)($at)
.LA4000698:
    li    $t3, 0x00AAAAAE
    lui   $at, %hi(SP_STATUS_REG)
    sw    $t3, %lo(SP_STATUS_REG)($at)
    li    $t0, 1365
    lui   $at, %hi(MI_INTR_MASK_REG)
    sw    $t0, %lo(MI_INTR_MASK_REG)($at)
    lui   $at, %hi(SI_STATUS_REG)
    sw    $zero, %lo(SI_STATUS_REG)($at)
    lui   $at, %hi(AI_STATUS_REG)
    sw    $zero, %lo(AI_STATUS_REG)($at)
    li    $t1, 2048
    lui   $at, %hi(MI_MODE_REG)
    sw    $t1, %lo(MI_MODE_REG)($at)
    li    $t1, 2
    lui   $at, %hi(PI_STATUS_REG)
    sw    $t1, %lo(PI_STATUS_REG)($at)
    lui   $t0, (0xA0000300 >> 16)
    ori   $t0, (0xA0000300 & 0xFFFF)
    sw    $s4, ($t0)
    sw    $s3, 4($t0)
#else
    lui   $t3, %hi(D_B0000008)
    lw    $a0, %lo(D_B0000008)($t3)
    move  $a1, $s6
    lui   $at, (0x5D588B65 >> 16)
    ori   $at, (0x5D588B65 & 0xFFFF)
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
.LA40005F0:
    lw    $v0, ($t1)
    addu  $v1, $a3, $v0
    sltu  $at, $v1, $a3
    beqz  $at, .LA4000608
     move  $a1, $v1
    addiu $t2, $t2, 1
.LA4000608:
    andi  $v1, $v0, 0x1f
    subu  $t7, $t5, $v1
    srlv  $t8, $v0, $t7
    sllv  $t6, $v0, $v1
    or    $a0, $t6, $t8
    sltu  $at, $a2, $v0
    move  $a3, $a1
    xor   $t3, $t3, $v0
    beqz  $at, .LA400063C
     addu  $s0, $s0, $a0
    xor   $t9, $a3, $v0
    b     .LA4000640
     xor   $a2, $t9, $a2
.LA400063C:
    xor   $a2, $a2, $a0
.LA4000640:
    addiu $t0, $t0, 4
    xor   $t7, $v0, $s0
    addiu $t1, $t1, 4
    bne   $t0, $ra, .LA40005F0
     addu  $t4, $t7, $t4
    xor   $t6, $a3, $t2
    xor   $a3, $t6, $t3
    xor   $t8, $s0, $a2
    xor   $s0, $t8, $t4
    lui   $t3, %hi(D_B0000010)
    lw    $t0, %lo(D_B0000010)($t3)
    bne   $a3, $t0, halt
     nop
    lw    $t0, %lo(D_B0000014)($t3)
    bne   $s0, $t0, halt
     nop
    bal   func_A4000690
     nop

halt:
    bal   halt
     nop

func_A4000690:
    lui   $t1, %hi(SP_PC)
    lw    $t1, %lo(SP_PC)($t1)
    lw    $s0, 0x14($sp)
    lw    $ra, 0x1c($sp)
    beqz  $t1, .LA40006BC
     addiu $sp, $sp, 0x20
    li    $t2, 65
    lui   $at, %hi(SP_STATUS_REG)
    sw    $t2, %lo(SP_STATUS_REG)($at)
    lui   $at, %hi(SP_PC)
    sw    $zero, %lo(SP_PC)($at)
.LA40006BC:
    li    $t3, 0x00AAAAAE
    lui   $at, %hi(SP_STATUS_REG)
    sw    $t3, %lo(SP_STATUS_REG)($at)
    lui   $at, %hi(MI_INTR_MASK_REG)
    li    $t0, 1365
    sw    $t0, %lo(MI_INTR_MASK_REG)($at)
    lui   $at, %hi(SI_STATUS_REG)
    sw    $zero, %lo(SI_STATUS_REG)($at)
    lui   $at, %hi(AI_STATUS_REG)
    sw    $zero, %lo(AI_STATUS_REG)($at)
    lui   $at, %hi(MI_MODE_REG)
    li    $t1, 2048
    sw    $t1, %lo(MI_MODE_REG)($at)
    li    $t1, 2
    lui   $at, %hi(PI_STATUS_REG)
    lui   $t0, (0xA0000300 >> 16)
    ori   $t0, (0xA0000300 & 0xFFFF)
    sw    $t1, %lo(PI_STATUS_REG)($at)
    sw    $s7, 0x14($t0)
#endif
    sw    $s5, 0xc($t0)
#ifdef VERSION_CN
    beqz  $s3, .LA4000728
     sw    $s7, 0x14($t0)
    b     .LA4000730
     lui   $t1, 0xa600
#else
    sw    $s3, 0x4($t0)
    beqz  $s3, .LA4000728
     sw    $s4, ($t0)
    lui   $t1, 0xa600
    b     .LA4000730
     addiu $t1, $t1, 0
#endif
.LA4000728:
    cn_li $t1, 0xb0000000
.LA4000730:
    sw    $t1, 0x8($t0)
    cn_li $t0, SP_DMEM
    addi  $t1, $t0, 0x1000
#ifdef VERSION_CN
.LA4000710:
    sw    $zero, ($t0)
    addiu $t0, $t0, 4
    bne   $t0, $t1, .LA4000710
     nop
#else
.LA4000740:
    addiu $t0, $t0, 4
    bne   $t0, $t1, .LA4000740
     sw    $zero, -4($t0)
#endif
    cn_li $t0, SP_IMEM
    addi  $t1, $t0, 0x1000
#ifdef VERSION_CN
.LA400072C:
    sw    $zero, ($t0)
    addiu $t0, $t0, 4
    bne   $t0, $t1, .LA400072C
     nop
#else
.LA4000758:
    addiu $t0, $t0, 4
    bne   $t0, $t1, .LA4000758
     sw    $zero, -4($t0)
#endif
    lui   $t3, %hi(D_B0000008)
    lw    $t1, %lo(D_B0000008)($t3)
    jr    $t1
     nop
    nop

func_A4000778:
    addiu $sp, $sp, -0xa0
#ifndef VERSION_CN
    sw    $s0, 0x40($sp)
    sw    $s1, 0x44($sp)
    move  $s1, $zero
    move  $s0, $zero
#endif
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
#ifdef VERSION_CN
    sw    $s0, 0x40($sp)
    sw    $s1, 0x44($sp)
#endif
    sw    $s2, 0x48($sp)
    sw    $s3, 0x4c($sp)
    sw    $s4, 0x50($sp)
    sw    $s5, 0x54($sp)
    sw    $s6, 0x58($sp)
    sw    $s7, 0x5c($sp)
    sw    $fp, 0x60($sp)
    sw    $ra, 0x64($sp)
#ifdef VERSION_CN
    move $s0, $zero
    move $s1, $zero
#endif
.LA40007EC:
    jal   func_A4000880
     nop
    addiu $s0, $s0, 1
#ifdef VERSION_CN
    addu  $s1, $s1, $v0
#endif
    slti  $t1, $s0, 4
    bnez  $t1, .LA40007EC
#ifdef VERSION_CN
     nop
#else
     addu  $s1, $s1, $v0
#endif
    srl   $a0, $s1, 2
    jal   func_A4000A40
     li    $a1, 1
#ifdef VERSION_CN
    srl   $v0, $s1, 2
#else
    lw    $ra, 0x64($sp)
    srl   $v0, $s1, 2
    lw    $s1, 0x44($sp)
#endif
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
#ifdef VERSION_CN
    lw    $s1, 0x44($sp)
#endif
    lw    $s2, 0x48($sp)
    lw    $s3, 0x4c($sp)
    lw    $s4, 0x50($sp)
    lw    $s5, 0x54($sp)
    lw    $s6, 0x58($sp)
    lw    $s7, 0x5c($sp)
    lw    $fp, 0x60($sp)
#ifdef VERSION_CN
    lw    $ra, 0x64($sp)
#endif
    jr    $ra
     addiu $sp, $sp, 0xa0

func_A4000880:
    addiu $sp, $sp, -0x20
    sw    $ra, 0x1c($sp)
    move  $t1, $zero
    move  $t3, $zero
    move  $t4, $zero
.LA4000894:
    slti  $k0, $t4, 0x40
#ifdef VERSION_CN
    beqz  $k0, .LA40008D4
     nop
#else
    beql  $k0, $zero, .LA40008FC
     move  $v0, $zero
#endif
    jal   func_A400090C
     move  $a0, $t4
#ifdef VERSION_CN
    blez  $v0, .LA40008CC
     nop
#else
    blezl $v0, .LA40008CC
     slti  $k0, $t1, 0x50
#endif
    subu  $k0, $v0, $t1
    multu $k0, $t4
#ifndef VERSION_CN
    move  $t1, $v0
#endif
    mflo  $k0
    addu  $t3, $t3, $k0
#ifdef VERSION_CN
    move $t1, $v0
#else
    nop
    slti  $k0, $t1, 0x50
#endif
.LA40008CC:
#ifdef VERSION_CN
    addiu $t4, $t4, 1
    slti  $k0, $t1, 0x50
#endif
    bnez  $k0, .LA4000894
#ifdef VERSION_CN
     nop
#else
     addiu $t4, $t4, 1
#endif
    sll   $a0, $t3, 2
    subu  $a0, $a0, $t3
    sll   $a0, $a0, 2
    subu  $a0, $a0, $t3
    sll   $a0, $a0, 1
    jal   func_A4000980
     addiu $a0, $a0, -0x370
#ifdef VERSION_CN
    b     .LA40008FC
     nop
.LA40008D4:
    move $v0, $zero
#else
    b     .LA4000900
     lw    $ra, 0x1c($sp)
    move  $v0, $zero
#endif
.LA40008FC:
    lw    $ra, 0x1c($sp)
.LA4000900:
#ifdef VERSION_CN
    jr    $ra
     addiu $sp, $sp, 0x20
#else
    addiu $sp, $sp, 0x20
    jr    $ra
     nop
#endif

func_A400090C:
    addiu $sp, $sp, -0x28
    sw    $ra, 0x1c($sp)
    move  $v0, $zero
    jal   func_A4000A40
     li    $a1, 2
    move  $fp, $zero
.LA40008FC_cn:
    li    $k0, -1
#ifdef VERSION_CN
    sw    $k0, ($s4)
    sw    $k0, ($s4)
    sw    $k0, 4($s4)
    lw    $v1, 4($s4)
    srl   $v1, $v1, 0x10
    move $gp, $zero
#else
.LA4000928:
    sw    $k0, 4($s4)
    lw    $v1, 4($s4)
    sw    $k0, ($s4)
    sw    $k0, ($s4)
    move  $gp, $zero
    srl   $v1, $v1, 0x10
#endif
.LA4000940:
    andi  $k0, $v1, 1
#ifdef VERSION_CN
    beqz  $k0, .LA4000928_cn
     nop
#else
    beql  $k0, $zero, .LA4000954
     addiu $gp, $gp, 1
#endif
    addiu $v0, $v0, 1
#ifdef VERSION_CN
.LA4000928_cn:
    srl   $v1, $v1, 1
#endif
    addiu $gp, $gp, 1
.LA4000954:
    slti  $k0, $gp, 8
    bnez  $k0, .LA4000940
#ifdef VERSION_CN
     nop
#else
     srl   $v1, $v1, 1
#endif
    addiu $fp, $fp, 1
    slti  $k0, $fp, 0xa
#ifdef VERSION_CN
    bnez  $k0, .LA40008FC_cn
     nop
    lw    $ra, 0x1c($sp)
    jr    $ra
     addiu $sp, $sp, 0x28
#else
    bnezl $k0, .LA4000928
     li    $k0, -1
    lw    $ra, 0x1c($sp)
    addiu $sp, $sp, 0x28
    jr    $ra
     nop
#endif

func_A4000980:
    addiu $sp, $sp, -0x28
    sw    $ra, 0x1c($sp)
    sw    $a0, 0x20($sp)
#ifndef VERSION_CN
    sb    $zero, 0x27($sp)
#endif
    move  $t0, $zero
    move  $t2, $zero
    li    $t5, 51200
#ifdef VERSION_CN
    sb    $zero, 0x27($sp)
#endif
    move  $t6, $zero
#ifdef VERSION_CN
.LA4000978:
#endif
    slti  $k0, $t6, 0x40
.LA40009A4:
#ifdef VERSION_CN
    bnez  $k0, .LA400098C_cn
     nop
#else
    bnezl $k0, .LA40009B8
     move  $a0, $t6
#endif
    b     .LA4000A30
     move $v0, $zero
#ifdef VERSION_CN
.LA400098C_cn:
#endif
    move $a0, $t6
#ifndef VERSION_CN
.LA40009B8:
#endif
    jal   func_A4000A40
     li    $a1, 1
    jal   func_A4000AD0
     addiu $a0, $sp, 0x27
    jal   func_A4000AD0
     addiu $a0, $sp, 0x27
    lbu   $k0, 0x27($sp)
    li    $k1, 800
#ifdef VERSION_CN
    multu $k0, $k1
    mflo  $t0
    lw    $a0, 0x20($sp)
    subu  $k0, $t0, $a0
    bgez  $k0, .LA40009CC
     nop
    subu  $k0, $a0, $t0
.LA40009CC:
    slt   $k1, $k0, $t5
    beqz  $k1, .LA40009E0
     nop
    move $t5, $k0
    move $t2, $t6
.LA40009E0:
    lw    $a0, 0x20($sp)
    slt   $k1, $t0, $a0
    beqz  $k1, .LA4000A00
     nop
    addiu $t6, $t6, 1
    slti  $k1, $t6, 0x41
    bnez  $k1, .LA4000978
     nop
.LA4000A00:
    addu  $v0, $t2, $t6
    srl   $v0, $v0, 1
.LA4000A30:
    lw    $ra, 0x1c($sp)
    jr    $ra
     addiu $sp, $sp, 0x28
#else
    lw    $a0, 0x20($sp)
    multu $k0, $k1
    mflo  $t0
    subu  $k0, $t0, $a0
    bgezl $k0, .LA40009F8
     slt   $k1, $k0, $t5
    subu  $k0, $a0, $t0
    slt   $k1, $k0, $t5
.LA40009F8:
    beql  $k1, $zero, .LA4000A0C
     lw    $a0, 0x20($sp)
    move  $t5, $k0
    move  $t2, $t6
    lw    $a0, 0x20($sp)
.LA4000A0C:
    slt   $k1, $t0, $a0
    beql  $k1, $zero, .LA4000A2C
     addu  $v0, $t2, $t6
    addiu $t6, $t6, 1
    slti  $k1, $t6, 0x41
    bnezl $k1, .LA40009A4
     slti  $k0, $t6, 0x40
    addu  $v0, $t2, $t6
.LA4000A2C:
    srl   $v0, $v0, 1
.LA4000A30:
    lw    $ra, 0x1c($sp)
    addiu $sp, $sp, 0x28
    jr    $ra
     nop
#endif

func_A4000A40:
    addiu $sp, $sp, -0x28
#ifdef VERSION_CN
    sw    $ra, 0x1c($sp)
    lui   $t7, 0x4200
    andi  $a0, $a0, 0xff
    xori  $a0, $a0, 0x3f
    li    $k1, 1
    bne   $a1, $k1, .LA4000A64
     nop
#else
    andi  $a0, $a0, 0xff
    li    $k1, 1
    xori  $a0, $a0, 0x3f
    sw    $ra, 0x1c($sp)
    bne   $a1, $k1, .LA4000A64
     lui   $t7, 0x4600
#endif
    lui   $k0, 0x8000
    or    $t7, $t7, $k0
.LA4000A64:
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
#ifdef VERSION_CN
    sw    $t7, ($s5)
    li    $k1, 1
    bne   $a1, $k1, .LA4000AC0
     nop
#else
    li    $k1, 1
    bne   $a1, $k1, .LA4000AC0
     sw    $t7, ($s5)
#endif
    lui   $k0, %hi(MI_MODE_REG)
    sw    $zero, %lo(MI_MODE_REG)($k0)
.LA4000AC0:
    lw    $ra, 0x1c($sp)
#ifdef VERSION_CN
    jr    $ra
     addiu $sp, $sp, 0x28
#else
    addiu $sp, $sp, 0x28
    jr    $ra
     nop
#endif

func_A4000AD0:
    addiu $sp, $sp, -0x28
    sw    $ra, 0x1c($sp)
#ifdef VERSION_CN
    move $fp, $zero
#endif
    li    $k0, 0x2000
    lui   $k1, %hi(MI_MODE_REG)
    sw    $k0, %lo(MI_MODE_REG)($k1)
#ifndef VERSION_CN
    move  $fp, $zero
#endif
    lw    $fp, ($s5)
    li    $k0, 0x1000
    sw    $k0, %lo(MI_MODE_REG)($k1)
#ifdef VERSION_CN
    move $k0, $zero
#endif
    li    $k1, 0x40
    and   $k1, $k1, $fp
    srl   $k1, $k1, 6
#ifndef VERSION_CN
    move  $k0, $zero
#endif
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
#ifdef VERSION_CN
    jr    $ra
     addiu $sp, $sp, 0x28
.fill 0x30
#else
    addiu $sp, $sp, 0x28
    jr    $ra
     nop
    nop
#endif
