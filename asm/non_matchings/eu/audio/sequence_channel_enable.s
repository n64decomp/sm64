glabel sequence_channel_enable
/* 0A6BE8 802E73E8 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 0A6BEC 802E73EC 30AE00FF */  andi  $t6, $a1, 0xff
/* 0A6BF0 802E73F0 000E7880 */  sll   $t7, $t6, 2
/* 0A6BF4 802E73F4 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0A6BF8 802E73F8 AFB30020 */  sw    $s3, 0x20($sp)
/* 0A6BFC 802E73FC AFB2001C */  sw    $s2, 0x1c($sp)
/* 0A6C00 802E7400 AFB10018 */  sw    $s1, 0x18($sp)
/* 0A6C04 802E7404 AFB00014 */  sw    $s0, 0x14($sp)
/* 0A6C08 802E7408 AFA5002C */  sw    $a1, 0x2c($sp)
/* 0A6C0C 802E740C 008FC021 */  addu  $t8, $a0, $t7
/* 0A6C10 802E7410 8F120030 */  lw    $s2, 0x30($t8)
/* 0A6C14 802E7414 3C198023 */  lui   $t9, %hi(gSequenceChannelNone) # $t9, 0x8023
/* 0A6C18 802E7418 27398748 */  addiu $t9, %lo(gSequenceChannelNone) # addiu $t9, $t9, -0x78b8
/* 0A6C1C 802E741C 1659000A */  bne   $s2, $t9, .L80201458
/* 0A6C20 802E7420 00008025 */   move  $s0, $zero
/* 0A6C24 802E7424 3C098022 */  lui   $t1, %hi(gSequencePlayers) # $t1, 0x8022
/* 0A6C28 802E7428 25293D68 */  addiu $t1, %lo(gSequencePlayers) # addiu $t1, $t1, 0x3d68
/* 0A6C2C 802E742C 10890019 */  beq   $a0, $t1, .L802014A4
/* 0A6C30 802E7430 3C0A8022 */   lui   $t2, %hi(gSequencePlayers + 0x148) # $t2, 0x8022
/* 0A6C34 802E7434 254A3EB0 */  addiu $t2, %lo(gSequencePlayers + 0x148) # addiu $t2, $t2, 0x3eb0
/* 0A6C38 802E7438 548A0017 */  bnel  $a0, $t2, .L802014A8
/* 0A6C3C 802E743C 8FBF0024 */   lw    $ra, 0x24($sp)
/* 0A6C40 802E7440 10000015 */  b     .L802014A8
/* 0A6C44 802E7444 8FBF0024 */   lw    $ra, 0x24($sp)
.L80201458:
/* 0A6C48 802E7448 924C0000 */  lbu   $t4, ($s2)
/* 0A6C4C 802E744C A2400078 */  sb    $zero, 0x78($s2)
/* 0A6C50 802E7450 AE460060 */  sw    $a2, 0x60($s2)
/* 0A6C54 802E7454 358E0080 */  ori   $t6, $t4, 0x80
/* 0A6C58 802E7458 A24E0000 */  sb    $t6, ($s2)
/* 0A6C5C 802E745C 31CF00BF */  andi  $t7, $t6, 0xbf
/* 0A6C60 802E7460 A24F0000 */  sb    $t7, ($s2)
/* 0A6C64 802E7464 A640001A */  sh    $zero, 0x1a($s2)
/* 0A6C68 802E7468 02408825 */  move  $s1, $s2
/* 0A6C6C 802E746C 24130004 */  li    $s3, 4
.L80201480:
/* 0A6C70 802E7470 8E380048 */  lw    $t8, 0x48($s1)
/* 0A6C74 802E7474 02402025 */  move  $a0, $s2
/* 0A6C78 802E7478 53000004 */  beql  $t8, $zero, .L8020149C
/* 0A6C7C 802E747C 26100001 */   addiu $s0, $s0, 1
/* 0A6C80 802E7480 0C0B9C2D */  jal   seq_channel_layer_free
/* 0A6C84 802E7484 02002825 */   move  $a1, $s0
/* 0A6C88 802E7488 26100001 */  addiu $s0, $s0, 1
.L8020149C:
/* 0A6C8C 802E748C 1613FFF8 */  bne   $s0, $s3, .L80201480
/* 0A6C90 802E7490 26310004 */   addiu $s1, $s1, 4
.L802014A4:
/* 0A6C94 802E7494 8FBF0024 */  lw    $ra, 0x24($sp)
.L802014A8:
/* 0A6C98 802E7498 8FB00014 */  lw    $s0, 0x14($sp)
/* 0A6C9C 802E749C 8FB10018 */  lw    $s1, 0x18($sp)
/* 0A6CA0 802E74A0 8FB2001C */  lw    $s2, 0x1c($sp)
/* 0A6CA4 802E74A4 8FB30020 */  lw    $s3, 0x20($sp)
/* 0A6CA8 802E74A8 03E00008 */  jr    $ra
/* 0A6CAC 802E74AC 27BD0028 */   addiu $sp, $sp, 0x28
