.text
glabel append_snowflake_vertex_buffer
/* 074188 802B4988 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 07418C 802B498C AFBF002C */  sw    $ra, 0x2c($sp)
/* 074190 802B4990 AFB40028 */  sw    $s4, 0x28($sp)
/* 074194 802B4994 AFB1001C */  sw    $s1, 0x1c($sp)
/* 074198 802B4998 AFB00018 */  sw    $s0, 0x18($sp)
/* 07419C 802B499C AFA40030 */  sw    $a0, 0x30($sp)
/* 0741A0 802B49A0 00C08025 */  move  $s0, $a2
/* 0741A4 802B49A4 00E08825 */  move  $s1, $a3
/* 0741A8 802B49A8 00A0A025 */  move  $s4, $a1
/* 0741AC 802B49AC AFB30024 */  sw    $s3, 0x24($sp)
/* 0741B0 802B49B0 AFB20020 */  sw    $s2, 0x20($sp)
# Vtx *vertBuf = (Vtx *)alloc_display_list(15 * sizeof(Vtx));
/* 0741B4 802B49B4 0C09A781 */  jal   alloc_display_list
/* 0741B8 802B49B8 240400F0 */   li    $a0, 240
# if (vertBuf == NULL) return;
/* 0741BC 802B49BC 1040007B */  beqz  $v0, .L802B4BAC
/* 0741C0 802B49C0 00003025 */   move  $a2, $zero
/* 0741C4 802B49C4 3C128030 */  lui   $s2, %hi(gSnowTempVtx + 0x20) # $s2, 0x8030
/* 0741C8 802B49C8 3C1F8030 */  lui   $ra, %hi(gSnowTempVtx + 0x10) # $ra, 0x8030
/* 0741CC 802B49CC 3C0B8030 */  lui   $t3, %hi(gSnowTempVtx) # $t3, 0x8030
/* 0741D0 802B49D0 3C058033 */  lui   $a1, %hi(gEnvFxBuffer) # $a1, 0x8033
/* 0741D4 802B49D4 24A5F6B0 */  addiu $a1, %lo(gEnvFxBuffer) # addiu $a1, $a1, -0x950
/* 0741D8 802B49D8 256BDD08 */  addiu $t3, %lo(gSnowTempVtx) # addiu $t3, $t3, -0x22f8
/* 0741DC 802B49DC 27FFDD18 */  addiu $ra, %lo(gSnowTempVtx + 0x10) # addiu $ra, $ra, -0x22e8
/* 0741E0 802B49E0 2652DD28 */  addiu $s2, %lo(gSnowTempVtx + 0x20) # addiu $s2, $s2, -0x22d8
/* 0741E4 802B49E4 00403825 */  move  $a3, $v0
/* 0741E8 802B49E8 24480020 */  addiu $t0, $v0, 0x20
/* 0741EC 802B49EC 24490010 */  addiu $t1, $v0, 0x10
/* 0741F0 802B49F0 2413000F */  li    $s3, 15
/* 0741F4 802B49F4 240D0038 */  li    $t5, 56
/* 0741F8 802B49F8 240C0003 */  li    $t4, 3
/* 0741FC 802B49FC 8FAA0040 */  lw    $t2, 0x40($sp)
# for (i = 0; i < 15; i += 3)
.L802B4A00:
/* 074200 802B4A00 00CC001A */  div   $zero, $a2, $t4
/* 074204 802B4A04 8D610000 */  lw    $at, ($t3)
/* 074208 802B4A08 0000C812 */  mflo  $t9
/* 07420C 802B4A0C 02997021 */  addu  $t6, $s4, $t9
/* 074210 802B4A10 ACE10000 */  sw    $at, ($a3)
/* 074214 802B4A14 8D6F0004 */  lw    $t7, 4($t3)
/* 074218 802B4A18 01CD0019 */  multu $t6, $t5
/* 07421C 802B4A1C 0006C100 */  sll   $t8, $a2, 4
/* 074220 802B4A20 ACEF0004 */  sw    $t7, 4($a3)
/* 074224 802B4A24 8D610008 */  lw    $at, 8($t3)
/* 074228 802B4A28 00582021 */  addu  $a0, $v0, $t8
/* 07422C 802B4A2C 24E70030 */  addiu $a3, $a3, 0x30
/* 074230 802B4A30 ACE1FFD8 */  sw    $at, -0x28($a3)
/* 074234 802B4A34 8D6F000C */  lw    $t7, 0xc($t3)
/* 074238 802B4A38 25080030 */  addiu $t0, $t0, 0x30
/* 07423C 802B4A3C 25290030 */  addiu $t1, $t1, 0x30
/* 074240 802B4A40 ACEFFFDC */  sw    $t7, -0x24($a3)
/* 074244 802B4A44 8CB80000 */  lw    $t8, ($a1)
/* 074248 802B4A48 00001812 */  mflo  $v1
/* 07424C 802B4A4C 860F0000 */  lh    $t7, ($s0)
/* 074250 802B4A50 0303C821 */  addu  $t9, $t8, $v1
/* 074254 802B4A54 8F2E0004 */  lw    $t6, 4($t9)
/* 074258 802B4A58 15800002 */  bnez  $t4, .L802B4A64
/* 07425C 802B4A5C 00000000 */   nop
/* 074260 802B4A60 0007000D */  break 7
.L802B4A64:
/* 074264 802B4A64 2401FFFF */  li    $at, -1
/* 074268 802B4A68 15810004 */  bne   $t4, $at, .L802B4A7C
/* 07426C 802B4A6C 3C018000 */   lui   $at, 0x8000
/* 074270 802B4A70 14C10002 */  bne   $a2, $at, .L802B4A7C
/* 074274 802B4A74 00000000 */   nop
/* 074278 802B4A78 0006000D */  break 6
.L802B4A7C:
/* 07427C 802B4A7C 01EEC021 */  addu  $t8, $t7, $t6
/* 074280 802B4A80 A4980000 */  sh    $t8, ($a0)
/* 074284 802B4A84 8CAF0000 */  lw    $t7, ($a1)
/* 074288 802B4A88 86190002 */  lh    $t9, 2($s0)
/* 07428C 802B4A8C 24C60003 */  addiu $a2, $a2, 3
/* 074290 802B4A90 01E37021 */  addu  $t6, $t7, $v1
/* 074294 802B4A94 8DD80008 */  lw    $t8, 8($t6)
/* 074298 802B4A98 03387821 */  addu  $t7, $t9, $t8
/* 07429C 802B4A9C A48F0002 */  sh    $t7, 2($a0)
/* 0742A0 802B4AA0 8CB90000 */  lw    $t9, ($a1)
/* 0742A4 802B4AA4 860E0004 */  lh    $t6, 4($s0)
/* 0742A8 802B4AA8 0323C021 */  addu  $t8, $t9, $v1
/* 0742AC 802B4AAC 8F0F000C */  lw    $t7, 0xc($t8)
/* 0742B0 802B4AB0 01CFC821 */  addu  $t9, $t6, $t7
/* 0742B4 802B4AB4 A4990004 */  sh    $t9, 4($a0)
/* 0742B8 802B4AB8 8FE10000 */  lw    $at, ($ra)
/* 0742BC 802B4ABC AD21FFD0 */  sw    $at, -0x30($t1)
/* 0742C0 802B4AC0 8FEE0004 */  lw    $t6, 4($ra)
/* 0742C4 802B4AC4 AD2EFFD4 */  sw    $t6, -0x2c($t1)
/* 0742C8 802B4AC8 8FE10008 */  lw    $at, 8($ra)
/* 0742CC 802B4ACC AD21FFD8 */  sw    $at, -0x28($t1)
/* 0742D0 802B4AD0 8FEE000C */  lw    $t6, 0xc($ra)
/* 0742D4 802B4AD4 AD2EFFDC */  sw    $t6, -0x24($t1)
/* 0742D8 802B4AD8 8CB90000 */  lw    $t9, ($a1)
/* 0742DC 802B4ADC 862F0000 */  lh    $t7, ($s1)
/* 0742E0 802B4AE0 0323C021 */  addu  $t8, $t9, $v1
/* 0742E4 802B4AE4 8F0E0004 */  lw    $t6, 4($t8)
/* 0742E8 802B4AE8 01EEC821 */  addu  $t9, $t7, $t6
/* 0742EC 802B4AEC A4990010 */  sh    $t9, 0x10($a0)
/* 0742F0 802B4AF0 8CAF0000 */  lw    $t7, ($a1)
/* 0742F4 802B4AF4 86380002 */  lh    $t8, 2($s1)
/* 0742F8 802B4AF8 01E37021 */  addu  $t6, $t7, $v1
/* 0742FC 802B4AFC 8DD90008 */  lw    $t9, 8($t6)
/* 074300 802B4B00 03197821 */  addu  $t7, $t8, $t9
/* 074304 802B4B04 A48F0012 */  sh    $t7, 0x12($a0)
/* 074308 802B4B08 8CB80000 */  lw    $t8, ($a1)
/* 07430C 802B4B0C 862E0004 */  lh    $t6, 4($s1)
/* 074310 802B4B10 0303C821 */  addu  $t9, $t8, $v1
/* 074314 802B4B14 8F2F000C */  lw    $t7, 0xc($t9)
/* 074318 802B4B18 01CFC021 */  addu  $t8, $t6, $t7
/* 07431C 802B4B1C A4980014 */  sh    $t8, 0x14($a0)
/* 074320 802B4B20 8E410000 */  lw    $at, ($s2)
/* 074324 802B4B24 AD01FFD0 */  sw    $at, -0x30($t0)
/* 074328 802B4B28 8E4E0004 */  lw    $t6, 4($s2)
/* 07432C 802B4B2C AD0EFFD4 */  sw    $t6, -0x2c($t0)
/* 074330 802B4B30 8E410008 */  lw    $at, 8($s2)
/* 074334 802B4B34 AD01FFD8 */  sw    $at, -0x28($t0)
/* 074338 802B4B38 8E4E000C */  lw    $t6, 0xc($s2)
/* 07433C 802B4B3C AD0EFFDC */  sw    $t6, -0x24($t0)
/* 074340 802B4B40 8CB80000 */  lw    $t8, ($a1)
/* 074344 802B4B44 854F0000 */  lh    $t7, ($t2)
/* 074348 802B4B48 0303C821 */  addu  $t9, $t8, $v1
/* 07434C 802B4B4C 8F2E0004 */  lw    $t6, 4($t9)
/* 074350 802B4B50 01EEC021 */  addu  $t8, $t7, $t6
/* 074354 802B4B54 A4980020 */  sh    $t8, 0x20($a0)
/* 074358 802B4B58 8CAF0000 */  lw    $t7, ($a1)
/* 07435C 802B4B5C 85590002 */  lh    $t9, 2($t2)
/* 074360 802B4B60 01E37021 */  addu  $t6, $t7, $v1
/* 074364 802B4B64 8DD80008 */  lw    $t8, 8($t6)
/* 074368 802B4B68 03387821 */  addu  $t7, $t9, $t8
/* 07436C 802B4B6C A48F0022 */  sh    $t7, 0x22($a0)
/* 074370 802B4B70 8CB90000 */  lw    $t9, ($a1)
/* 074374 802B4B74 854E0004 */  lh    $t6, 4($t2)
/* 074378 802B4B78 0323C021 */  addu  $t8, $t9, $v1
/* 07437C 802B4B7C 8F0F000C */  lw    $t7, 0xc($t8)
/* 074380 802B4B80 01CFC821 */  addu  $t9, $t6, $t7
/* 074384 802B4B84 14D3FF9E */  bne   $a2, $s3, .L802B4A00
/* 074388 802B4B88 A4990024 */   sh    $t9, 0x24($a0)
/* 07438C 802B4B8C 8FA30030 */  lw    $v1, 0x30($sp)
# gSPVertex(gfx, VIRTUAL_TO_PHYSICAL(vertBuf), 15, 0);
/* 074390 802B4B90 3C011FFF */  lui   $at, (0x1FFFFFFF >> 16) # lui $at, 0x1fff
/* 074394 802B4B94 3421FFFF */  ori   $at, (0x1FFFFFFF & 0xFFFF) # ori $at, $at, 0xffff
/* 074398 802B4B98 3C1804E0 */  lui   $t8, (0x04E000F0 >> 16) # lui $t8, 0x4e0
/* 07439C 802B4B9C 371800F0 */  ori   $t8, (0x04E000F0 & 0xFFFF) # ori $t8, $t8, 0xf0
/* 0743A0 802B4BA0 00417024 */  and   $t6, $v0, $at
/* 0743A4 802B4BA4 AC6E0004 */  sw    $t6, 4($v1)
/* 0743A8 802B4BA8 AC780000 */  sw    $t8, ($v1)
.L802B4BAC:
/* 0743AC 802B4BAC 8FBF002C */  lw    $ra, 0x2c($sp)
/* 0743B0 802B4BB0 8FB00018 */  lw    $s0, 0x18($sp)
/* 0743B4 802B4BB4 8FB1001C */  lw    $s1, 0x1c($sp)
/* 0743B8 802B4BB8 8FB20020 */  lw    $s2, 0x20($sp)
/* 0743BC 802B4BBC 8FB30024 */  lw    $s3, 0x24($sp)
/* 0743C0 802B4BC0 8FB40028 */  lw    $s4, 0x28($sp)
/* 0743C4 802B4BC4 03E00008 */  jr    $ra
/* 0743C8 802B4BC8 27BD0030 */   addiu $sp, $sp, 0x30

