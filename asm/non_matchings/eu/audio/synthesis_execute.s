glabel synthesis_execute
/* 09F2FC 802DFAFC 27BDFFA0 */  addiu $sp, $sp, -0x60
/* 09F300 802DFB00 AFB60030 */  sw    $s6, 0x30($sp)
/* 09F304 802DFB04 3C168023 */  lui   $s6, %hi(gAudioBufferParameters) # $s6, 0x8023
/* 09F308 802DFB08 26D697E0 */  addiu $s6, %lo(gAudioBufferParameters) # addiu $s6, $s6, -0x6820
/* 09F30C 802DFB0C AFB40028 */  sw    $s4, 0x28($sp)
/* 09F310 802DFB10 86D4000C */  lh    $s4, 0xc($s6)
/* 09F314 802DFB14 AFB70034 */  sw    $s7, 0x34($sp)
/* 09F318 802DFB18 AFB1001C */  sw    $s1, 0x1c($sp)
/* 09F31C 802DFB1C 00C08825 */  move  $s1, $a2
/* 09F320 802DFB20 00E0B825 */  move  $s7, $a3
/* 09F324 802DFB24 AFBF003C */  sw    $ra, 0x3c($sp)
/* 09F328 802DFB28 AFBE0038 */  sw    $fp, 0x38($sp)
/* 09F32C 802DFB2C AFB5002C */  sw    $s5, 0x2c($sp)
/* 09F330 802DFB30 AFB30024 */  sw    $s3, 0x24($sp)
/* 09F334 802DFB34 AFB20020 */  sw    $s2, 0x20($sp)
/* 09F338 802DFB38 AFB00018 */  sw    $s0, 0x18($sp)
/* 09F33C 802DFB3C AFA40060 */  sw    $a0, 0x60($sp)
/* 09F340 802DFB40 1A800009 */  blez  $s4, .L80200518
/* 09F344 802DFB44 AFA50064 */   sw    $a1, 0x64($sp)
.L802004F8:
/* 09F348 802DFB48 2690FFFF */  addiu $s0, $s4, -1
/* 09F34C 802DFB4C 0C0BA59D */  jal   process_sequences
/* 09F350 802DFB50 02002025 */   move  $a0, $s0
/* 09F354 802DFB54 86CE000C */  lh    $t6, 0xc($s6)
/* 09F358 802DFB58 0C0B7E91 */  jal   synthesis_load_note_subs_eu
/* 09F35C 802DFB5C 01D42023 */   subu  $a0, $t6, $s4
/* 09F360 802DFB60 1E00FFF9 */  bgtz  $s0, .L802004F8
/* 09F364 802DFB64 0200A025 */   move  $s4, $s0
.L80200518:
/* 09F368 802DFB68 8FAF0060 */  lw    $t7, 0x60($sp)
/* 09F36C 802DFB6C 3C190700 */  lui   $t9, 0x700
/* 09F370 802DFB70 0220F025 */  move  $fp, $s1
/* 09F374 802DFB74 25F80008 */  addiu $t8, $t7, 8
/* 09F378 802DFB78 AFB80048 */  sw    $t8, 0x48($sp)
/* 09F37C 802DFB7C ADE00004 */  sw    $zero, 4($t7)
/* 09F380 802DFB80 ADF90000 */  sw    $t9, ($t7)
/* 09F384 802DFB84 86D4000C */  lh    $s4, 0xc($s6)
/* 09F388 802DFB88 8FB50040 */  lw    $s5, 0x40($sp)
/* 09F38C 802DFB8C 01E01025 */  move  $v0, $t7
/* 09F390 802DFB90 1A800056 */  blez  $s4, .L8020069C
.L80200544:
/* 09F394 802DFB94 24010001 */   li    $at, 1
/* 09F398 802DFB98 86D2000C */  lh    $s2, 0xc($s6)
/* 09F39C 802DFB9C 1681000B */  bne   $s4, $at, .L8020057C
/* 09F3A0 802DFBA0 00008825 */   move  $s1, $zero
/* 09F3A4 802DFBA4 3C098022 */  lui   $t1, %hi(gLeftVolRampings) # $t1, 0x8022
/* 09F3A8 802DFBA8 3C0B8022 */  lui   $t3, %hi(gRightVolRampings) # $t3, 0x8022
/* 09F3AC 802DFBAC 256BF5E8 */  addiu $t3, %lo(gRightVolRampings) # addiu $t3, $t3, -0xa18
/* 09F3B0 802DFBB0 2529C5E8 */  addiu $t1, %lo(gLeftVolRampings) # addiu $t1, $t1, -0x3a18
/* 09F3B4 802DFBB4 00154300 */  sll   $t0, $s5, 0xc
/* 09F3B8 802DFBB8 00155300 */  sll   $t2, $s5, 0xc
/* 09F3BC 802DFBBC 014B2021 */  addu  $a0, $t2, $t3
/* 09F3C0 802DFBC0 01091821 */  addu  $v1, $t0, $t1
/* 09F3C4 802DFBC4 10000026 */  b     .L80200610
/* 09F3C8 802DFBC8 02E09825 */   move  $s3, $s7
.L8020057C:
/* 09F3CC 802DFBCC 02F4001A */  div   $zero, $s7, $s4
/* 09F3D0 802DFBD0 16800002 */  bnez  $s4, .L8020058C
/* 09F3D4 802DFBD4 00000000 */   nop
/* 09F3D8 802DFBD8 0007000D */  break 7
.L8020058C:
/* 09F3DC 802DFBDC 2401FFFF */  li    $at, -1
/* 09F3E0 802DFBE0 16810004 */  bne   $s4, $at, .L802005A4
/* 09F3E4 802DFBE4 3C018000 */   lui   $at, 0x8000
/* 09F3E8 802DFBE8 16E10002 */  bne   $s7, $at, .L802005A4
/* 09F3EC 802DFBEC 00000000 */   nop
/* 09F3F0 802DFBF0 0006000D */  break 6
.L802005A4:
/* 09F3F4 802DFBF4 86C50010 */  lh    $a1, 0x10($s6)
/* 09F3F8 802DFBF8 00001012 */  mflo  $v0
/* 09F3FC 802DFBFC 24150002 */  li    $s5, 2
/* 09F400 802DFC00 0045082A */  slt   $at, $v0, $a1
/* 09F404 802DFC04 14200006 */  bnez  $at, .L802005D0
/* 09F408 802DFC08 00A09825 */   move  $s3, $a1
/* 09F40C 802DFC0C 3C038022 */  lui   $v1, %hi(gLeftVolRampings + 0x2000) # $v1, 0x8022
/* 09F410 802DFC10 3C048022 */  lui   $a0, %hi(gRightVolRampings + 0x2000) # $a0, 0x8022
/* 09F414 802DFC14 248415E8 */  addiu $a0, %lo(gRightVolRampings + 0x2000) # addiu $a0, $a0, 0x15e8
/* 09F418 802DFC18 10000011 */  b     .L80200610
/* 09F41C 802DFC1C 2463E5E8 */   addiu $v1, %lo(gLeftVolRampings + 0x2000) # addiu $v1, $v1, -0x1a18
.L802005D0:
/* 09F420 802DFC20 86C50012 */  lh    $a1, 0x12($s6)
/* 09F424 802DFC24 3C038022 */  lui   $v1, %hi(gLeftVolRampings + 0x1000) # $v1, 0x8022
/* 09F428 802DFC28 2463D5E8 */  addiu $v1, %lo(gLeftVolRampings + 0x1000) # addiu $v1, $v1, -0x2a18
/* 09F42C 802DFC2C 00A2082A */  slt   $at, $a1, $v0
/* 09F430 802DFC30 14200008 */  bnez  $at, .L80200604
/* 09F434 802DFC34 24150001 */   li    $s5, 1
/* 09F438 802DFC38 3C038022 */  lui   $v1, %hi(gLeftVolRampings) # $v1, 0x8022
/* 09F43C 802DFC3C 3C048022 */  lui   $a0, %hi(gRightVolRampings) # $a0, 0x8022
/* 09F440 802DFC40 2484F5E8 */  addiu $a0, %lo(gRightVolRampings) # addiu $a0, $a0, -0xa18
/* 09F444 802DFC44 2463C5E8 */  addiu $v1, %lo(gLeftVolRampings) # addiu $v1, $v1, -0x3a18
/* 09F448 802DFC48 00A09825 */  move  $s3, $a1
/* 09F44C 802DFC4C 10000004 */  b     .L80200610
/* 09F450 802DFC50 0000A825 */   move  $s5, $zero
.L80200604:
/* 09F454 802DFC54 3C048022 */  lui   $a0, %hi(gRightVolRampings + 0x1000) # $a0, 0x8022
/* 09F458 802DFC58 248405E8 */  addiu $a0, %lo(gRightVolRampings + 0x1000) # addiu $a0, $a0, 0x5e8
/* 09F45C 802DFC5C 86D3000E */  lh    $s3, 0xe($s6)
.L80200610:
/* 09F460 802DFC60 3C028022 */  lui   $v0, %hi(gNumSynthesisReverbs) # $v0, 0x8022
/* 09F464 802DFC64 8042C5E3 */  lb    $v0, %lo(gNumSynthesisReverbs)($v0)
/* 09F468 802DFC68 3C018022 */  lui   $at, %hi(gCurrentLeftVolRamping) # $at, 0x8022
/* 09F46C 802DFC6C AC2325E8 */  sw    $v1, %lo(gCurrentLeftVolRamping)($at)
/* 09F470 802DFC70 3C018022 */  lui   $at, %hi(gCurrentRightVolRamping) # $at, 0x8022
/* 09F474 802DFC74 18400011 */  blez  $v0, .L8020066C
/* 09F478 802DFC78 AC2425EC */   sw    $a0, %lo(gCurrentRightVolRamping)($at)
/* 09F47C 802DFC7C 3C108022 */  lui   $s0, %hi(gSynthesisReverbs) # $s0, 0x8022
/* 09F480 802DFC80 2610C1B0 */  addiu $s0, %lo(gSynthesisReverbs) # addiu $s0, $s0, -0x3e50
.L80200634:
/* 09F484 802DFC84 920C0001 */  lbu   $t4, 1($s0)
/* 09F488 802DFC88 02602025 */  move  $a0, $s3
/* 09F48C 802DFC8C 02542823 */  subu  $a1, $s2, $s4
/* 09F490 802DFC90 51800007 */  beql  $t4, $zero, .L80200660
/* 09F494 802DFC94 26310001 */   addiu $s1, $s1, 1
/* 09F498 802DFC98 0C0B7D94 */  jal   prepare_reverb_ring_buffer
/* 09F49C 802DFC9C 02203025 */   move  $a2, $s1
/* 09F4A0 802DFCA0 3C028022 */  lui   $v0, %hi(gNumSynthesisReverbs) # $v0, 0x8022
/* 09F4A4 802DFCA4 8042C5E3 */  lb    $v0, %lo(gNumSynthesisReverbs)($v0)
/* 09F4A8 802DFCA8 86D2000C */  lh    $s2, 0xc($s6)
/* 09F4AC 802DFCAC 26310001 */  addiu $s1, $s1, 1
.L80200660:
/* 09F4B0 802DFCB0 0222082A */  slt   $at, $s1, $v0
/* 09F4B4 802DFCB4 1420FFF3 */  bnez  $at, .L80200634
/* 09F4B8 802DFCB8 26100108 */   addiu $s0, $s0, 0x108
.L8020066C:
/* 09F4BC 802DFCBC 03C02025 */  move  $a0, $fp
/* 09F4C0 802DFCC0 02602825 */  move  $a1, $s3
/* 09F4C4 802DFCC4 8FA60048 */  lw    $a2, 0x48($sp)
/* 09F4C8 802DFCC8 0C0B808A */  jal   synthesis_do_one_audio_update
/* 09F4CC 802DFCCC 02543823 */   subu  $a3, $s2, $s4
/* 09F4D0 802DFCD0 2694FFFF */  addiu $s4, $s4, -1
/* 09F4D4 802DFCD4 00136880 */  sll   $t5, $s3, 2
/* 09F4D8 802DFCD8 AFA20048 */  sw    $v0, 0x48($sp)
/* 09F4DC 802DFCDC 02F3B823 */  subu  $s7, $s7, $s3
/* 09F4E0 802DFCE0 1E80FFAC */  bgtz  $s4, .L80200544
/* 09F4E4 802DFCE4 03CDF021 */   addu  $fp, $fp, $t5
/* 09F4E8 802DFCE8 AFB50040 */  sw    $s5, 0x40($sp)
.L8020069C:
/* 09F4EC 802DFCEC 3C028022 */  lui   $v0, %hi(gNumSynthesisReverbs) # $v0, 0x8022
/* 09F4F0 802DFCF0 8042C5E3 */  lb    $v0, %lo(gNumSynthesisReverbs)($v0)
/* 09F4F4 802DFCF4 3C0E8022 */  lui   $t6, %hi(gSynthesisReverbs)
/* 09F4F8 802DFCF8 25D0C1B0 */  addiu $s0, $t6, %lo(gSynthesisReverbs)
/* 09F4FC 802DFCFC 1840000E */  blez  $v0, .L802006E8
/* 09F500 802DFD00 00027940 */   sll   $t7, $v0, 5
/* 09F504 802DFD04 01E27821 */  addu  $t7, $t7, $v0
/* 09F508 802DFD08 000F78C0 */  sll   $t7, $t7, 3
/* 09F50C 802DFD0C 01F01821 */  addu  $v1, $t7, $s0
.L802006C0:
/* 09F510 802DFD10 92020002 */  lbu   $v0, 2($s0)
/* 09F514 802DFD14 10400002 */  beqz  $v0, .L802006D0
/* 09F518 802DFD18 2458FFFF */   addiu $t8, $v0, -1
/* 09F51C 802DFD1C A2180002 */  sb    $t8, 2($s0)
.L802006D0:
/* 09F520 802DFD20 92190003 */  lbu   $t9, 3($s0)
/* 09F524 802DFD24 26100108 */  addiu $s0, $s0, 0x108
/* 09F528 802DFD28 0203082B */  sltu  $at, $s0, $v1
/* 09F52C 802DFD2C 3B280001 */  xori  $t0, $t9, 1
/* 09F530 802DFD30 1420FFF7 */  bnez  $at, .L802006C0
/* 09F534 802DFD34 A208FEFB */   sb    $t0, -0x105($s0)
.L802006E8:
/* 09F538 802DFD38 8FA20048 */  lw    $v0, 0x48($sp)
/* 09F53C 802DFD3C 8FAA0060 */  lw    $t2, 0x60($sp)
/* 09F540 802DFD40 8FAD0064 */  lw    $t5, 0x64($sp)
/* 09F544 802DFD44 004A5823 */  subu  $t3, $v0, $t2
/* 09F548 802DFD48 000B60C3 */  sra   $t4, $t3, 3
/* 09F54C 802DFD4C ADAC0000 */  sw    $t4, ($t5)
/* 09F550 802DFD50 8FBF003C */  lw    $ra, 0x3c($sp)
/* 09F554 802DFD54 8FBE0038 */  lw    $fp, 0x38($sp)
/* 09F558 802DFD58 8FB70034 */  lw    $s7, 0x34($sp)
/* 09F55C 802DFD5C 8FB60030 */  lw    $s6, 0x30($sp)
/* 09F560 802DFD60 8FB5002C */  lw    $s5, 0x2c($sp)
/* 09F564 802DFD64 8FB40028 */  lw    $s4, 0x28($sp)
/* 09F568 802DFD68 8FB30024 */  lw    $s3, 0x24($sp)
/* 09F56C 802DFD6C 8FB20020 */  lw    $s2, 0x20($sp)
/* 09F570 802DFD70 8FB1001C */  lw    $s1, 0x1c($sp)
/* 09F574 802DFD74 8FB00018 */  lw    $s0, 0x18($sp)
/* 09F578 802DFD78 03E00008 */  jr    $ra
/* 09F57C 802DFD7C 27BD0060 */   addiu $sp, $sp, 0x60
