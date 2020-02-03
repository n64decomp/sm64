.text
glabel append_bubble_vertex_buffer
/* 0759E8 802B61E8 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 0759EC 802B61EC AFBF002C */  sw    $ra, 0x2c($sp)
/* 0759F0 802B61F0 AFB40028 */  sw    $s4, 0x28($sp)
/* 0759F4 802B61F4 AFB1001C */  sw    $s1, 0x1c($sp)
/* 0759F8 802B61F8 AFB00018 */  sw    $s0, 0x18($sp)
/* 0759FC 802B61FC AFA40030 */  sw    $a0, 0x30($sp)
/* 075A00 802B6200 00C08025 */  move  $s0, $a2
/* 075A04 802B6204 00E08825 */  move  $s1, $a3
/* 075A08 802B6208 00A0A025 */  move  $s4, $a1
/* 075A0C 802B620C AFB30024 */  sw    $s3, 0x24($sp)
/* 075A10 802B6210 AFB20020 */  sw    $s2, 0x20($sp)
# Vtx *vertBuf = (Vtx *)alloc_display_list(15 * sizeof(Vtx));
/* 075A14 802B6214 0C09A781 */  jal   alloc_display_list
/* 075A18 802B6218 240400F0 */   li    $a0, 240
/* 075A1C 802B621C 10400078 */  beqz  $v0, .L802B6400
/* 075A20 802B6220 8FAB0044 */   lw    $t3, 0x44($sp)
/* 075A24 802B6224 3C058033 */  lui   $a1, %hi(gEnvFxBuffer) # $a1, 0x8033
/* 075A28 802B6228 24A5F6B0 */  addiu $a1, %lo(gEnvFxBuffer) # addiu $a1, $a1, -0x950
/* 075A2C 802B622C 00003025 */  move  $a2, $zero
/* 075A30 802B6230 256C0010 */  addiu $t4, $t3, 0x10
/* 075A34 802B6234 256D0020 */  addiu $t5, $t3, 0x20
/* 075A38 802B6238 00403825 */  move  $a3, $v0
/* 075A3C 802B623C 24480020 */  addiu $t0, $v0, 0x20
/* 075A40 802B6240 24490010 */  addiu $t1, $v0, 0x10
/* 075A44 802B6244 2413000F */  li    $s3, 15
/* 075A48 802B6248 24120038 */  li    $s2, 56
/* 075A4C 802B624C 241F0003 */  li    $ra, 3
/* 075A50 802B6250 8FAA0040 */  lw    $t2, 0x40($sp)
# for (i = 0; i < 15; i += 3) {
.L802B6254:
/* 075A54 802B6254 00DF001A */  div   $zero, $a2, $ra
/* 075A58 802B6258 8D610000 */  lw    $at, ($t3)
/* 075A5C 802B625C 0000C812 */  mflo  $t9
/* 075A60 802B6260 02997021 */  addu  $t6, $s4, $t9
/* 075A64 802B6264 ACE10000 */  sw    $at, ($a3)
/* 075A68 802B6268 8D6F0004 */  lw    $t7, 4($t3)
/* 075A6C 802B626C 01D20019 */  multu $t6, $s2
/* 075A70 802B6270 0006C100 */  sll   $t8, $a2, 4
/* 075A74 802B6274 ACEF0004 */  sw    $t7, 4($a3)
/* 075A78 802B6278 8D610008 */  lw    $at, 8($t3)
/* 075A7C 802B627C 00582021 */  addu  $a0, $v0, $t8
/* 075A80 802B6280 24E70030 */  addiu $a3, $a3, 0x30
/* 075A84 802B6284 ACE1FFD8 */  sw    $at, -0x28($a3)
/* 075A88 802B6288 8D6F000C */  lw    $t7, 0xc($t3)
/* 075A8C 802B628C 25080030 */  addiu $t0, $t0, 0x30
/* 075A90 802B6290 25290030 */  addiu $t1, $t1, 0x30
/* 075A94 802B6294 ACEFFFDC */  sw    $t7, -0x24($a3)
/* 075A98 802B6298 8CB80000 */  lw    $t8, ($a1)
/* 075A9C 802B629C 00001812 */  mflo  $v1
/* 075AA0 802B62A0 860F0000 */  lh    $t7, ($s0)
/* 075AA4 802B62A4 0303C821 */  addu  $t9, $t8, $v1
/* 075AA8 802B62A8 8F2E0004 */  lw    $t6, 4($t9)
/* 075AAC 802B62AC 17E00002 */  bnez  $ra, .L802B62B8
/* 075AB0 802B62B0 00000000 */   nop
/* 075AB4 802B62B4 0007000D */  break 7
.L802B62B8:
/* 075AB8 802B62B8 2401FFFF */  li    $at, -1
/* 075ABC 802B62BC 17E10004 */  bne   $ra, $at, .L802B62D0
/* 075AC0 802B62C0 3C018000 */   lui   $at, 0x8000
/* 075AC4 802B62C4 14C10002 */  bne   $a2, $at, .L802B62D0
/* 075AC8 802B62C8 00000000 */   nop
/* 075ACC 802B62CC 0006000D */  break 6
.L802B62D0:
/* 075AD0 802B62D0 01EEC021 */  addu  $t8, $t7, $t6
/* 075AD4 802B62D4 A4980000 */  sh    $t8, ($a0)
/* 075AD8 802B62D8 8CAF0000 */  lw    $t7, ($a1)
/* 075ADC 802B62DC 86190002 */  lh    $t9, 2($s0)
/* 075AE0 802B62E0 24C60003 */  addiu $a2, $a2, 3
/* 075AE4 802B62E4 01E37021 */  addu  $t6, $t7, $v1
/* 075AE8 802B62E8 8DD80008 */  lw    $t8, 8($t6)
/* 075AEC 802B62EC 03387821 */  addu  $t7, $t9, $t8
/* 075AF0 802B62F0 A48F0002 */  sh    $t7, 2($a0)
/* 075AF4 802B62F4 8CB90000 */  lw    $t9, ($a1)
/* 075AF8 802B62F8 860E0004 */  lh    $t6, 4($s0)
/* 075AFC 802B62FC 0323C021 */  addu  $t8, $t9, $v1
/* 075B00 802B6300 8F0F000C */  lw    $t7, 0xc($t8)
/* 075B04 802B6304 01CFC821 */  addu  $t9, $t6, $t7
/* 075B08 802B6308 A4990004 */  sh    $t9, 4($a0)
/* 075B0C 802B630C 8D810000 */  lw    $at, ($t4)
/* 075B10 802B6310 AD21FFD0 */  sw    $at, -0x30($t1)
/* 075B14 802B6314 8D8E0004 */  lw    $t6, 4($t4)
/* 075B18 802B6318 AD2EFFD4 */  sw    $t6, -0x2c($t1)
/* 075B1C 802B631C 8D810008 */  lw    $at, 8($t4)
/* 075B20 802B6320 AD21FFD8 */  sw    $at, -0x28($t1)
/* 075B24 802B6324 8D8E000C */  lw    $t6, 0xc($t4)
/* 075B28 802B6328 AD2EFFDC */  sw    $t6, -0x24($t1)
/* 075B2C 802B632C 8CB90000 */  lw    $t9, ($a1)
/* 075B30 802B6330 862F0000 */  lh    $t7, ($s1)
/* 075B34 802B6334 0323C021 */  addu  $t8, $t9, $v1
/* 075B38 802B6338 8F0E0004 */  lw    $t6, 4($t8)
/* 075B3C 802B633C 01EEC821 */  addu  $t9, $t7, $t6
/* 075B40 802B6340 A4990010 */  sh    $t9, 0x10($a0)
/* 075B44 802B6344 8CAF0000 */  lw    $t7, ($a1)
/* 075B48 802B6348 86380002 */  lh    $t8, 2($s1)
/* 075B4C 802B634C 01E37021 */  addu  $t6, $t7, $v1
/* 075B50 802B6350 8DD90008 */  lw    $t9, 8($t6)
/* 075B54 802B6354 03197821 */  addu  $t7, $t8, $t9
/* 075B58 802B6358 A48F0012 */  sh    $t7, 0x12($a0)
/* 075B5C 802B635C 8CB80000 */  lw    $t8, ($a1)
/* 075B60 802B6360 862E0004 */  lh    $t6, 4($s1)
/* 075B64 802B6364 0303C821 */  addu  $t9, $t8, $v1
/* 075B68 802B6368 8F2F000C */  lw    $t7, 0xc($t9)
/* 075B6C 802B636C 01CFC021 */  addu  $t8, $t6, $t7
/* 075B70 802B6370 A4980014 */  sh    $t8, 0x14($a0)
/* 075B74 802B6374 8DA10000 */  lw    $at, ($t5)
/* 075B78 802B6378 AD01FFD0 */  sw    $at, -0x30($t0)
/* 075B7C 802B637C 8DAE0004 */  lw    $t6, 4($t5)
/* 075B80 802B6380 AD0EFFD4 */  sw    $t6, -0x2c($t0)
/* 075B84 802B6384 8DA10008 */  lw    $at, 8($t5)
/* 075B88 802B6388 AD01FFD8 */  sw    $at, -0x28($t0)
/* 075B8C 802B638C 8DAE000C */  lw    $t6, 0xc($t5)
/* 075B90 802B6390 AD0EFFDC */  sw    $t6, -0x24($t0)
/* 075B94 802B6394 8CB80000 */  lw    $t8, ($a1)
/* 075B98 802B6398 854F0000 */  lh    $t7, ($t2)
/* 075B9C 802B639C 0303C821 */  addu  $t9, $t8, $v1
/* 075BA0 802B63A0 8F2E0004 */  lw    $t6, 4($t9)
/* 075BA4 802B63A4 01EEC021 */  addu  $t8, $t7, $t6
/* 075BA8 802B63A8 A4980020 */  sh    $t8, 0x20($a0)
/* 075BAC 802B63AC 8CAF0000 */  lw    $t7, ($a1)
/* 075BB0 802B63B0 85590002 */  lh    $t9, 2($t2)
/* 075BB4 802B63B4 01E37021 */  addu  $t6, $t7, $v1
/* 075BB8 802B63B8 8DD80008 */  lw    $t8, 8($t6)
/* 075BBC 802B63BC 03387821 */  addu  $t7, $t9, $t8
/* 075BC0 802B63C0 A48F0022 */  sh    $t7, 0x22($a0)
/* 075BC4 802B63C4 8CB90000 */  lw    $t9, ($a1)
/* 075BC8 802B63C8 854E0004 */  lh    $t6, 4($t2)
/* 075BCC 802B63CC 0323C021 */  addu  $t8, $t9, $v1
/* 075BD0 802B63D0 8F0F000C */  lw    $t7, 0xc($t8)
/* 075BD4 802B63D4 01CFC821 */  addu  $t9, $t6, $t7
/* 075BD8 802B63D8 14D3FF9E */  bne   $a2, $s3, .L802B6254
/* 075BDC 802B63DC A4990024 */   sh    $t9, 0x24($a0)
/* 075BE0 802B63E0 8FA30030 */  lw    $v1, 0x30($sp)
# gSPVertex(gfx, VIRTUAL_TO_PHYSICAL(vertBuf), 15, 0);
/* 075BE4 802B63E4 3C011FFF */  lui   $at, (0x1FFFFFFF >> 16) # lui $at, 0x1fff
/* 075BE8 802B63E8 3421FFFF */  ori   $at, (0x1FFFFFFF & 0xFFFF) # ori $at, $at, 0xffff
/* 075BEC 802B63EC 3C1804E0 */  lui   $t8, (0x04E000F0 >> 16) # lui $t8, 0x4e0
/* 075BF0 802B63F0 371800F0 */  ori   $t8, (0x04E000F0 & 0xFFFF) # ori $t8, $t8, 0xf0
/* 075BF4 802B63F4 00417024 */  and   $t6, $v0, $at
/* 075BF8 802B63F8 AC6E0004 */  sw    $t6, 4($v1)
/* 075BFC 802B63FC AC780000 */  sw    $t8, ($v1)
.L802B6400:
/* 075C00 802B6400 8FBF002C */  lw    $ra, 0x2c($sp)
/* 075C04 802B6404 8FB00018 */  lw    $s0, 0x18($sp)
/* 075C08 802B6408 8FB1001C */  lw    $s1, 0x1c($sp)
/* 075C0C 802B640C 8FB20020 */  lw    $s2, 0x20($sp)
/* 075C10 802B6410 8FB30024 */  lw    $s3, 0x24($sp)
/* 075C14 802B6414 8FB40028 */  lw    $s4, 0x28($sp)
/* 075C18 802B6418 03E00008 */  jr    $ra
/* 075C1C 802B641C 27BD0030 */   addiu $sp, $sp, 0x30
