glabel play_sequence
/* 0AB0E8 80200000 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 0AB0EC 80200004 AFA50034 */  sw    $a1, 0x34($sp)
/* 0AB0F0 80200008 308700FF */  andi  $a3, $a0, 0xff
/* 0AB0F4 8020000C 30AE00FF */  andi  $t6, $a1, 0xff
/* 0AB0F8 80200010 01C02825 */  move  $a1, $t6
/* 0AB0FC 80200014 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0AB100 80200018 AFA40030 */  sw    $a0, 0x30($sp)
/* 0AB104 8020001C AFA60038 */  sw    $a2, 0x38($sp)
/* 0AB108 80200020 14E0000C */  bnez  $a3, .L480200054
/* 0AB10C 80200024 00E04025 */   move  $t0, $a3
/* 0AB110 80200028 31CF007F */  andi  $t7, $t6, 0x7f
/* 0AB114 8020002C 3C018030 */  lui   $at, %hi(sPlayer0CurSeqId) # $at, 0x8030
/* 0AB118 80200030 A02F04CC */  sb    $t7, %lo(sPlayer0CurSeqId)($at)
/* 0AB11C 80200034 240200FF */  li    $v0, 255
/* 0AB120 80200038 3C018030 */  lui   $at, %hi(sBackgroundMusicForDynamics) # $at, 0x8030
/* 0AB124 8020003C A02202E0 */  sb    $v0, %lo(sBackgroundMusicForDynamics)($at)
/* 0AB128 80200040 3C018030 */  lui   $at, %hi(sCurrentMusicDynamic) # $at, 0x8030
/* 0AB12C 80200044 A02202DC */  sb    $v0, %lo(sCurrentMusicDynamic)($at)
/* 0AB130 80200048 3C018030 */  lui   $at, %hi(sMusicDynamicDelay) # $at, 0x8030
/* 0AB134 8020004C 24180002 */  li    $t8, 2
/* 0AB138 80200050 A03804D0 */  sb    $t8, %lo(sMusicDynamicDelay)($at)
.L480200054:
/* 0AB13C 80200054 3C0A8033 */  lui   $t2, %hi(D_80360928) # $t2, 0x8033
/* 0AB140 80200058 254AFF40 */  addiu $t2, %lo(D_80360928) # addiu $t2, $t2, -0xc0
/* 0AB144 8020005C 0007CA00 */  sll   $t9, $a3, 8
/* 0AB148 80200060 032A1821 */  addu  $v1, $t9, $t2
/* 0AB14C 80200064 00001025 */  move  $v0, $zero
/* 0AB150 80200068 00A03025 */  move  $a2, $a1
/* 0AB154 8020006C 30A9007F */  andi  $t1, $a1, 0x7f
.L480200070:
/* 0AB158 80200070 00025900 */  sll   $t3, $v0, 4
/* 0AB15C 80200074 24420001 */  addiu $v0, $v0, 1
/* 0AB160 80200078 304D00FF */  andi  $t5, $v0, 0xff
/* 0AB164 8020007C 29A10010 */  slti  $at, $t5, 0x10
/* 0AB168 80200080 006B6021 */  addu  $t4, $v1, $t3
/* 0AB16C 80200084 01A01025 */  move  $v0, $t5
/* 0AB170 80200088 1420FFF9 */  bnez  $at, .L480200070
/* 0AB174 8020008C A580000C */   sh    $zero, 0xc($t4)
/* 0AB178 80200090 30E200FF */  andi  $v0, $a3, 0xff
/* 0AB17C 80200094 00027400 */  sll   $t6, $v0, 0x10
/* 0AB180 80200098 30C50080 */  andi  $a1, $a2, 0x80
/* 0AB184 8020009C 00057E00 */  sll   $t7, $a1, 0x18
/* 0AB188 802000A0 3C014600 */  lui   $at, 0x4600
/* 0AB18C 802000A4 01C12025 */  or    $a0, $t6, $at
/* 0AB190 802000A8 000F2E03 */  sra   $a1, $t7, 0x18
/* 0AB194 802000AC 01C01025 */  move  $v0, $t6
/* 0AB198 802000B0 AFAE001C */  sw    $t6, 0x1c($sp)
/* 0AB19C 802000B4 AFA80028 */  sw    $t0, 0x28($sp)
/* 0AB1A0 802000B8 0C0BB7DC */  jal   func_802ad770
/* 0AB1A4 802000BC AFA90020 */   sw    $t1, 0x20($sp)
/* 0AB1A8 802000C0 8FA90020 */  lw    $t1, 0x20($sp)
/* 0AB1AC 802000C4 8FA2001C */  lw    $v0, 0x1c($sp)
/* 0AB1B0 802000C8 3C018200 */  lui   $at, 0x8200
/* 0AB1B4 802000CC 312A00FF */  andi  $t2, $t1, 0xff
/* 0AB1B8 802000D0 000A5A00 */  sll   $t3, $t2, 8
/* 0AB1BC 802000D4 0041C825 */  or    $t9, $v0, $at
/* 0AB1C0 802000D8 032B2025 */  or    $a0, $t9, $t3
/* 0AB1C4 802000DC 0C0BB7D3 */  jal   func_802ad74c
/* 0AB1C8 802000E0 97A5003A */   lhu   $a1, 0x3a($sp)
/* 0AB1CC 802000E4 8FA80028 */  lw    $t0, 0x28($sp)
/* 0AB1D0 802000E8 55000013 */  bnezl $t0, .L480200138
/* 0AB1D4 802000EC 8FBF0014 */   lw    $ra, 0x14($sp)
/* 0AB1D8 802000F0 0C0BB0F2 */  jal   func_803200E4
/* 0AB1DC 802000F4 00002025 */   move  $a0, $zero
/* 0AB1E0 802000F8 240100FF */  li    $at, 255
/* 0AB1E4 802000FC 5041000E */  beql  $v0, $at, .L480200138
/* 0AB1E8 80200100 8FBF0014 */   lw    $ra, 0x14($sp)
/* 0AB1EC 80200104 44822000 */  mtc1  $v0, $f4
/* 0AB1F0 80200108 3C014F80 */  li    $at, 0x4F800000 # 4294967296.000000
/* 0AB1F4 8020010C 04410004 */  bgez  $v0, .L480200120
/* 0AB1F8 80200110 468021A0 */   cvt.s.w $f6, $f4
/* 0AB1FC 80200114 44814000 */  mtc1  $at, $f8
/* 0AB200 80200118 00000000 */  nop
/* 0AB204 8020011C 46083180 */  add.s $f6, $f6, $f8
.L480200120:
/* 0AB208 80200120 3C0142FE */  li    $at, 0x42FE0000 # 127.000000
/* 0AB20C 80200124 44815000 */  mtc1  $at, $f10
/* 0AB210 80200128 3C018022 */  lui   $at, %hi(gSequencePlayers + 0x28) # $at, 0x8022
/* 0AB214 8020012C 460A3403 */  div.s $f16, $f6, $f10
/* 0AB218 80200130 E4303D90 */  swc1  $f16, %lo(gSequencePlayers + 0x28)($at)
/* 0AB21C 80200134 8FBF0014 */  lw    $ra, 0x14($sp)
.L480200138:
/* 0AB220 80200138 27BD0030 */  addiu $sp, $sp, 0x30
/* 0AB224 8020013C 03E00008 */  jr    $ra
/* 0AB228 80200140 00000000 */   nop
