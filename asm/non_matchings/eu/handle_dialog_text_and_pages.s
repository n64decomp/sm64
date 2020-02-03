.late_rodata
.late_rodata_alignment 8
glabel jtbl_803059A0
.word L_EU_802AFB00, L_EU_802AFB18, L_EU_802AFB50, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFB88, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFB9C, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AF99C, L_EU_802AF990

glabel jtbl_80305A60
.word L_EU_802AF9CC, L_EU_802AF9CC, L_EU_802AF9CC, L_EU_802AFBD0
.word L_EU_802AF9EC, L_EU_802AF9EC, L_EU_802AF9EC, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFA0C, L_EU_802AFA0C, L_EU_802AFA0C, L_EU_802AFA0C
.word L_EU_802AFA2C, L_EU_802AFA2C, L_EU_802AFA2C, L_EU_802AFA2C
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFA4C, L_EU_802AFA4C, L_EU_802AFA4C, L_EU_802AFBD0
.word L_EU_802AFA6C, L_EU_802AFA6C, L_EU_802AFA6C, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFA8C, L_EU_802AFA8C, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFAAC, L_EU_802AFAAC, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFBD0, L_EU_802AFAEC, L_EU_802AFBD0
.word L_EU_802AFBD0, L_EU_802AFACC, L_EU_802AFACC

.text
glabel handle_dialog_text_and_pages # EU: func_802AF808
/* 06F008 802AF808 27BDFF90 */  addiu $sp, $sp, -0x70
/* 06F00C 802AF80C AFB50034 */  sw    $s5, 0x34($sp)
/* 06F010 802AF810 0006AE00 */  sll   $s5, $a2, 0x18
/* 06F014 802AF814 00157603 */  sra   $t6, $s5, 0x18
/* 06F018 802AF818 AFBF0044 */  sw    $ra, 0x44($sp)
/* 06F01C 802AF81C AFBE0040 */  sw    $fp, 0x40($sp)
/* 06F020 802AF820 AFB7003C */  sw    $s7, 0x3c($sp)
/* 06F024 802AF824 AFB60038 */  sw    $s6, 0x38($sp)
/* 06F028 802AF828 AFB40030 */  sw    $s4, 0x30($sp)
/* 06F02C 802AF82C AFB3002C */  sw    $s3, 0x2c($sp)
/* 06F030 802AF830 AFB20028 */  sw    $s2, 0x28($sp)
/* 06F034 802AF834 AFB10024 */  sw    $s1, 0x24($sp)
/* 06F038 802AF838 AFB00020 */  sw    $s0, 0x20($sp)
/* 06F03C 802AF83C AFA40070 */  sw    $a0, 0x70($sp)
/* 06F040 802AF840 AFA60078 */  sw    $a2, 0x78($sp)
/* 06F044 802AF844 00A08825 */  move  $s1, $a1
/* 06F048 802AF848 01C0A825 */  move  $s5, $t6
/* 06F04C 802AF84C 0C09A4BC */  jal   segmented_to_virtual
/* 06F050 802AF850 8CA4000C */   lw    $a0, 0xc($a1)
/* 06F054 802AF854 3C088030 */  lui   $t0, %hi(gDialogBoxState) # $t0, 0x8030
/* 06F058 802AF858 2508D630 */  addiu $t0, %lo(gDialogBoxState) # addiu $t0, $t0, -0x29d0
/* 06F05C 802AF85C 81180000 */  lb    $t8, ($t0)
/* 06F060 802AF860 240F0001 */  li    $t7, 1
/* 06F064 802AF864 24070002 */  li    $a3, 2
/* 06F068 802AF868 AFA20060 */  sw    $v0, 0x60($sp)
/* 06F06C 802AF86C A3A0005D */  sb    $zero, 0x5d($sp)
/* 06F070 802AF870 A3AF005B */  sb    $t7, 0x5b($sp)
/* 06F074 802AF874 24130001 */  li    $s3, 1
/* 06F078 802AF878 14F80005 */  bne   $a3, $t8, .L802AF890
/* 06F07C 802AF87C 82360004 */   lb    $s6, 4($s1)
/* 06F080 802AF880 0016C840 */  sll   $t9, $s6, 1
/* 06F084 802AF884 27290001 */  addiu $t1, $t9, 1
/* 06F088 802AF888 10000003 */  b     .L802AF898
/* 06F08C 802AF88C A3A9005E */   sb    $t1, 0x5e($sp)
.L802AF890:
/* 06F090 802AF890 26CA0001 */  addiu $t2, $s6, 1
/* 06F094 802AF894 A3AA005E */  sb    $t2, 0x5e($sp)
.L802AF898:
/* 06F098 802AF898 3C068031 */  lui   $a2, %hi(gDisplayListHead) # $a2, 0x8031
/* 06F09C 802AF89C 24C692A8 */  addiu $a2, %lo(gDisplayListHead) # addiu $a2, $a2, -0x6d58
/* 06F0A0 802AF8A0 8CC30000 */  lw    $v1, ($a2)
/* 06F0A4 802AF8A4 3C0D0200 */  lui   $t5, %hi(dl_ia_text_begin) # $t5, 0x200
/* 06F0A8 802AF8A8 25AD73B0 */  addiu $t5, %lo(dl_ia_text_begin) # addiu $t5, $t5, 0x73b0
/* 06F0AC 802AF8AC 246B0008 */  addiu $t3, $v1, 8
/* 06F0B0 802AF8B0 ACCB0000 */  sw    $t3, ($a2)
/* 06F0B4 802AF8B4 3C0C0600 */  lui   $t4, 0x600
/* 06F0B8 802AF8B8 3C128033 */  lui   $s2, %hi(gDialogX) # $s2, 0x8033
/* 06F0BC 802AF8BC 3C178030 */  lui   $s7, %hi(gDialogTextPos) # $s7, 0x8030
/* 06F0C0 802AF8C0 AC6C0000 */  sw    $t4, ($v1)
/* 06F0C4 802AF8C4 AC6D0004 */  sw    $t5, 4($v1)
/* 06F0C8 802AF8C8 2652F69A */  addiu $s2, %lo(gDialogX) # addiu $s2, $s2, -0x966
/* 06F0CC 802AF8CC 86F7D64C */  lh    $s7, %lo(gDialogTextPos)($s7)
/* 06F0D0 802AF8D0 A6400000 */  sh    $zero, ($s2)
/* 06F0D4 802AF8D4 240E000E */  li    $t6, 14
/* 06F0D8 802AF8D8 3C018033 */  lui   $at, %hi(gDialogY) # $at, 0x8033
/* 06F0DC 802AF8DC A42EF69C */  sh    $t6, %lo(gDialogY)($at)
/* 06F0E0 802AF8E0 810F0000 */  lb    $t7, ($t0)
/* 06F0E4 802AF8E4 3C1E8033 */  lui   $fp, %hi(gDialogY) # $fp, 0x8033
/* 06F0E8 802AF8E8 27DEF69C */  addiu $fp, %lo(gDialogY) # addiu $fp, $fp, -0x964
/* 06F0EC 802AF8EC 14EF0005 */  bne   $a3, $t7, .L802AF904
/* 06F0F0 802AF8F0 3C198030 */   lui   $t9, %hi(gDialogScrollOffsetY) # $t9, 0x8030
/* 06F0F4 802AF8F4 87D80000 */  lh    $t8, ($fp)
/* 06F0F8 802AF8F8 8739D63C */  lh    $t9, %lo(gDialogScrollOffsetY)($t9)
/* 06F0FC 802AF8FC 03194823 */  subu  $t1, $t8, $t9
/* 06F100 802AF900 A7C90000 */  sh    $t1, ($fp)
.L802AF904:
/* 06F104 802AF904 83AA005D */  lb    $t2, 0x5d($sp)
/* 06F108 802AF908 3C1E8033 */  lui   $fp, %hi(gDialogY) # $fp, 0x8033
/* 06F10C 802AF90C 27DEF69C */  addiu $fp, %lo(gDialogY) # addiu $fp, $fp, -0x964
/* 06F110 802AF910 154000C8 */  bnez  $t2, .L802AFC34
/* 06F114 802AF914 3C148030 */   lui   $s4, %hi(gDialogCharWidths) # $s4, 0x8030
/* 06F118 802AF918 2694D530 */  addiu $s4, %lo(gDialogCharWidths) # addiu $s4, $s4, -0x2ad0
.L802AF91C:
/* 06F11C 802AF91C 00132E00 */  sll   $a1, $s3, 0x18
/* 06F120 802AF920 00055E03 */  sra   $t3, $a1, 0x18
/* 06F124 802AF924 01602825 */  move  $a1, $t3
/* 06F128 802AF928 0C0ABBFE */  jal   change_and_flash_dialog_text_color_lines # func_802AEFF8
/* 06F12C 802AF92C 83A40073 */   lb    $a0, 0x73($sp)
/* 06F130 802AF930 8FAC0060 */  lw    $t4, 0x60($sp)
/* 06F134 802AF934 02EC6821 */  addu  $t5, $s7, $t4
/* 06F138 802AF938 91B00000 */  lbu   $s0, ($t5)
/* 06F13C 802AF93C 2A0100A3 */  slti  $at, $s0, 0xa3
/* 06F140 802AF940 1420000A */  bnez  $at, .L802AF96C
/* 06F144 802AF944 02001025 */   move  $v0, $s0
/* 06F148 802AF948 244EFF30 */  addiu $t6, $v0, -0xd0
/* 06F14C 802AF94C 2DC10030 */  sltiu $at, $t6, 0x30
/* 06F150 802AF950 1020009F */  beqz  $at, .L802AFBD0
/* 06F154 802AF954 000E7080 */   sll   $t6, $t6, 2
/* 06F158 802AF958 3C018030 */  lui   $at, %hi(jtbl_803059A0) # 0x8030
/* 06F15C 802AF95C 002E0821 */  addu  $at, $at, $t6
/* 06F160 802AF960 8C2E59A0 */  lw    $t6, %lo(jtbl_803059A0)($at) # 0x59a0($at)
/* 06F164 802AF964 01C00008 */  jr    $t6
/* 06F168 802AF968 00000000 */   nop
.L802AF96C:
/* 06F16C 802AF96C 244FFFA0 */  addiu $t7, $v0, -0x60
/* 06F170 802AF970 2DE10043 */  sltiu $at, $t7, 0x43
/* 06F174 802AF974 10200096 */  beqz  $at, .L802AFBD0
/* 06F178 802AF978 000F7880 */   sll   $t7, $t7, 2
/* 06F17C 802AF97C 3C018030 */  lui   $at, %hi(jtbl_80305A60) # 0x8030
/* 06F180 802AF980 002F0821 */  addu  $at, $at, $t7
/* 06F184 802AF984 8C2F5A60 */  lw    $t7, %lo(jtbl_80305A60)($at) # 0x5a60($at)
/* 06F188 802AF988 01E00008 */  jr    $t7
/* 06F18C 802AF98C 00000000 */   nop
glabel L_EU_802AF990
/* 06F190 802AF990 24180002 */  li    $t8, 2
/* 06F194 802AF994 1000009D */  b     .L802AFC0C
/* 06F198 802AF998 A3B8005D */   sb    $t8, 0x5d($sp)
glabel L_EU_802AF99C
/* 06F19C 802AF99C 26730001 */  addiu $s3, $s3, 1
/* 06F1A0 802AF9A0 0013CE00 */  sll   $t9, $s3, 0x18
/* 06F1A4 802AF9A4 00199E03 */  sra   $s3, $t9, 0x18
/* 06F1A8 802AF9A8 00132600 */  sll   $a0, $s3, 0x18
/* 06F1AC 802AF9AC 00045603 */  sra   $t2, $a0, 0x18
/* 06F1B0 802AF9B0 01402025 */  move  $a0, $t2
/* 06F1B4 802AF9B4 83A5005E */  lb    $a1, 0x5e($sp)
/* 06F1B8 802AF9B8 27A6005D */  addiu $a2, $sp, 0x5d
/* 06F1BC 802AF9BC 0C0ABD0B */  jal   handle_dialog_scroll_page_state # func_802AF42C
/* 06F1C0 802AF9C0 27A7005B */   addiu $a3, $sp, 0x5b
/* 06F1C4 802AF9C4 10000091 */  b     .L802AFC0C
/* 06F1C8 802AF9C8 A6400000 */   sh    $zero, ($s2)
glabel L_EU_802AF9CC
/* 06F1CC 802AF9CC 00403025 */  move  $a2, $v0
/* 06F1D0 802AF9D0 30CB000F */  andi  $t3, $a2, 0xf
/* 06F1D4 802AF9D4 01603025 */  move  $a2, $t3
/* 06F1D8 802AF9D8 02202025 */  move  $a0, $s1
/* 06F1DC 802AF9DC 0C0ABDB5 */  jal   render_dialog_lowercase_diacritic
/* 06F1E0 802AF9E0 24050024 */   li    $a1, 36
/* 06F1E4 802AF9E4 1000008A */  b     .L802AFC10
/* 06F1E8 802AF9E8 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AF9EC
/* 06F1EC 802AF9EC 00403025 */  move  $a2, $v0
/* 06F1F0 802AF9F0 30CC000F */  andi  $t4, $a2, 0xf
/* 06F1F4 802AF9F4 01803025 */  move  $a2, $t4
/* 06F1F8 802AF9F8 02202025 */  move  $a0, $s1
/* 06F1FC 802AF9FC 0C0ABDD6 */  jal   render_dialog_uppercase_diacritic
/* 06F200 802AFA00 2405000A */   li    $a1, 10
/* 06F204 802AFA04 10000082 */  b     .L802AFC10
/* 06F208 802AFA08 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFA0C
/* 06F20C 802AFA0C 00403025 */  move  $a2, $v0
/* 06F210 802AFA10 30CD000F */  andi  $t5, $a2, 0xf
/* 06F214 802AFA14 01A03025 */  move  $a2, $t5
/* 06F218 802AFA18 02202025 */  move  $a0, $s1
/* 06F21C 802AFA1C 0C0ABDB5 */  jal   render_dialog_lowercase_diacritic
/* 06F220 802AFA20 24050028 */   li    $a1, 40
/* 06F224 802AFA24 1000007A */  b     .L802AFC10
/* 06F228 802AFA28 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFA2C
/* 06F22C 802AFA2C 00403025 */  move  $a2, $v0
/* 06F230 802AFA30 30CE000F */  andi  $t6, $a2, 0xf
/* 06F234 802AFA34 01C03025 */  move  $a2, $t6
/* 06F238 802AFA38 02202025 */  move  $a0, $s1
/* 06F23C 802AFA3C 0C0ABDD6 */  jal   render_dialog_uppercase_diacritic
/* 06F240 802AFA40 2405000E */   li    $a1, 14
/* 06F244 802AFA44 10000072 */  b     .L802AFC10
/* 06F248 802AFA48 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFA4C
/* 06F24C 802AFA4C 00403025 */  move  $a2, $v0
/* 06F250 802AFA50 30CF000F */  andi  $t7, $a2, 0xf
/* 06F254 802AFA54 01E03025 */  move  $a2, $t7
/* 06F258 802AFA58 02202025 */  move  $a0, $s1
/* 06F25C 802AFA5C 0C0ABDB5 */  jal   render_dialog_lowercase_diacritic
/* 06F260 802AFA60 24050038 */   li    $a1, 56
/* 06F264 802AFA64 1000006A */  b     .L802AFC10
/* 06F268 802AFA68 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFA6C
/* 06F26C 802AFA6C 00403025 */  move  $a2, $v0
/* 06F270 802AFA70 30D8000F */  andi  $t8, $a2, 0xf
/* 06F274 802AFA74 03003025 */  move  $a2, $t8
/* 06F278 802AFA78 02202025 */  move  $a0, $s1
/* 06F27C 802AFA7C 0C0ABDD6 */  jal   render_dialog_uppercase_diacritic
/* 06F280 802AFA80 2405001E */   li    $a1, 30
/* 06F284 802AFA84 10000062 */  b     .L802AFC10
/* 06F288 802AFA88 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFA8C
/* 06F28C 802AFA8C 00403025 */  move  $a2, $v0
/* 06F290 802AFA90 30D9000F */  andi  $t9, $a2, 0xf
/* 06F294 802AFA94 03203025 */  move  $a2, $t9
/* 06F298 802AFA98 02202025 */  move  $a0, $s1
/* 06F29C 802AFA9C 0C0ABDB5 */  jal   render_dialog_lowercase_diacritic
/* 06F2A0 802AFAA0 24050032 */   li    $a1, 50
/* 06F2A4 802AFAA4 1000005A */  b     .L802AFC10
/* 06F2A8 802AFAA8 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFAAC
/* 06F2AC 802AFAAC 00403025 */  move  $a2, $v0
/* 06F2B0 802AFAB0 30C9000F */  andi  $t1, $a2, 0xf
/* 06F2B4 802AFAB4 01203025 */  move  $a2, $t1
/* 06F2B8 802AFAB8 02202025 */  move  $a0, $s1
/* 06F2BC 802AFABC 0C0ABDD6 */  jal   render_dialog_uppercase_diacritic
/* 06F2C0 802AFAC0 24050018 */   li    $a1, 24
/* 06F2C4 802AFAC4 10000052 */  b     .L802AFC10
/* 06F2C8 802AFAC8 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFACC
/* 06F2CC 802AFACC 00403025 */  move  $a2, $v0
/* 06F2D0 802AFAD0 30CA000F */  andi  $t2, $a2, 0xf
/* 06F2D4 802AFAD4 01403025 */  move  $a2, $t2
/* 06F2D8 802AFAD8 02202025 */  move  $a0, $s1
/* 06F2DC 802AFADC 0C0ABDB5 */  jal   render_dialog_lowercase_diacritic
/* 06F2E0 802AFAE0 240500EB */   li    $a1, 235
/* 06F2E4 802AFAE4 1000004A */  b     .L802AFC10
/* 06F2E8 802AFAE8 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFAEC
/* 06F2EC 802AFAEC 864B0000 */  lh    $t3, ($s2)
/* 06F2F0 802AFAF0 928C009E */  lbu   $t4, 0x9e($s4)
/* 06F2F4 802AFAF4 016C6821 */  addu  $t5, $t3, $t4
/* 06F2F8 802AFAF8 10000044 */  b     .L802AFC0C
/* 06F2FC 802AFAFC A64D0000 */   sh    $t5, ($s2)
glabel L_EU_802AFB00
/* 06F300 802AFB00 928F009E */  lbu   $t7, 0x9e($s4)
/* 06F304 802AFB04 864E0000 */  lh    $t6, ($s2)
/* 06F308 802AFB08 000FC040 */  sll   $t8, $t7, 1
/* 06F30C 802AFB0C 01D8C821 */  addu  $t9, $t6, $t8
/* 06F310 802AFB10 1000003E */  b     .L802AFC0C
/* 06F314 802AFB14 A6590000 */   sh    $t9, ($s2)
glabel L_EU_802AFB18
/* 06F318 802AFB18 00132E00 */  sll   $a1, $s3, 0x18
/* 06F31C 802AFB1C 00163600 */  sll   $a2, $s6, 0x18
/* 06F320 802AFB20 00065603 */  sra   $t2, $a2, 0x18
/* 06F324 802AFB24 00054E03 */  sra   $t1, $a1, 0x18
/* 06F328 802AFB28 01202825 */  move  $a1, $t1
/* 06F32C 802AFB2C 01403025 */  move  $a2, $t2
/* 06F330 802AFB30 00002025 */  move  $a0, $zero
/* 06F334 802AFB34 83A7005B */  lb    $a3, 0x5b($sp)
/* 06F338 802AFB38 AFB50010 */  sw    $s5, 0x10($sp)
/* 06F33C 802AFB3C 0C0ABD64 */  jal   render_multi_text_string_lines
/* 06F340 802AFB40 AFB10014 */   sw    $s1, 0x14($sp)
/* 06F344 802AFB44 240B0001 */  li    $t3, 1
/* 06F348 802AFB48 10000030 */  b     .L802AFC0C
/* 06F34C 802AFB4C A3AB005B */   sb    $t3, 0x5b($sp)
glabel L_EU_802AFB50
/* 06F350 802AFB50 00132E00 */  sll   $a1, $s3, 0x18
/* 06F354 802AFB54 00163600 */  sll   $a2, $s6, 0x18
/* 06F358 802AFB58 00066E03 */  sra   $t5, $a2, 0x18
/* 06F35C 802AFB5C 00056603 */  sra   $t4, $a1, 0x18
/* 06F360 802AFB60 01802825 */  move  $a1, $t4
/* 06F364 802AFB64 01A03025 */  move  $a2, $t5
/* 06F368 802AFB68 24040001 */  li    $a0, 1
/* 06F36C 802AFB6C 83A7005B */  lb    $a3, 0x5b($sp)
/* 06F370 802AFB70 AFB50010 */  sw    $s5, 0x10($sp)
/* 06F374 802AFB74 0C0ABD64 */  jal   render_multi_text_string_lines
/* 06F378 802AFB78 AFB10014 */   sw    $s1, 0x14($sp)
/* 06F37C 802AFB7C 240F0001 */  li    $t7, 1
/* 06F380 802AFB80 10000022 */  b     .L802AFC0C
/* 06F384 802AFB84 A3AF005B */   sb    $t7, 0x5b($sp)
glabel L_EU_802AFB88
/* 06F388 802AFB88 02202025 */  move  $a0, $s1
/* 06F38C 802AFB8C 0C0ABD1E */  jal   render_star_count_dialog_text
/* 06F390 802AFB90 27A5005B */   addiu $a1, $sp, 0x5b
/* 06F394 802AFB94 1000001E */  b     .L802AFC10
/* 06F398 802AFB98 83A9005D */   lb    $t1, 0x5d($sp)
glabel L_EU_802AFB9C
/* 06F39C 802AFB9C 87C60000 */  lh    $a2, ($fp)
/* 06F3A0 802AFBA0 02202025 */  move  $a0, $s1
/* 06F3A4 802AFBA4 86450000 */  lh    $a1, ($s2)
/* 06F3A8 802AFBA8 24C60008 */  addiu $a2, $a2, 8
/* 06F3AC 802AFBAC 00067400 */  sll   $t6, $a2, 0x10
/* 06F3B0 802AFBB0 000E3403 */  sra   $a2, $t6, 0x10
/* 06F3B4 802AFBB4 0C0ABC6E */  jal   render_generic_dialog_char_at_pos
/* 06F3B8 802AFBB8 240700F6 */   li    $a3, 246
/* 06F3BC 802AFBBC 86590000 */  lh    $t9, ($s2)
/* 06F3C0 802AFBC0 928900F6 */  lbu   $t1, 0xf6($s4)
/* 06F3C4 802AFBC4 03295021 */  addu  $t2, $t9, $t1
/* 06F3C8 802AFBC8 10000010 */  b     .L802AFC0C
/* 06F3CC 802AFBCC A64A0000 */   sh    $t2, ($s2)
glabel L_EU_802AFBD0
.L802AFBD0:
/* 06F3D0 802AFBD0 0275082A */  slt   $at, $s3, $s5
/* 06F3D4 802AFBD4 14200008 */  bnez  $at, .L802AFBF8
/* 06F3D8 802AFBD8 02B65821 */   addu  $t3, $s5, $s6
/* 06F3DC 802AFBDC 0173082A */  slt   $at, $t3, $s3
/* 06F3E0 802AFBE0 14200005 */  bnez  $at, .L802AFBF8
/* 06F3E4 802AFBE4 02202025 */   move  $a0, $s1
/* 06F3E8 802AFBE8 86450000 */  lh    $a1, ($s2)
/* 06F3EC 802AFBEC 87C60000 */  lh    $a2, ($fp)
/* 06F3F0 802AFBF0 0C0ABC6E */  jal   render_generic_dialog_char_at_pos
/* 06F3F4 802AFBF4 320700FF */   andi  $a3, $s0, 0xff
.L802AFBF8:
/* 06F3F8 802AFBF8 02906821 */  addu  $t5, $s4, $s0
/* 06F3FC 802AFBFC 91AF0000 */  lbu   $t7, ($t5)
/* 06F400 802AFC00 864C0000 */  lh    $t4, ($s2)
/* 06F404 802AFC04 018F7021 */  addu  $t6, $t4, $t7
/* 06F408 802AFC08 A64E0000 */  sh    $t6, ($s2)
.L802AFC0C:
/* 06F40C 802AFC0C 83A9005D */  lb    $t1, 0x5d($sp)
.L802AFC10:
/* 06F410 802AFC10 26F70001 */  addiu $s7, $s7, 1
/* 06F414 802AFC14 0017C400 */  sll   $t8, $s7, 0x10
/* 06F418 802AFC18 1120FF40 */  beqz  $t1, .L802AF91C
/* 06F41C 802AFC1C 0018BC03 */   sra   $s7, $t8, 0x10
/* 06F420 802AFC20 3C088030 */  lui   $t0, %hi(gDialogBoxState) # $t0, 0x8030
/* 06F424 802AFC24 3C068031 */  lui   $a2, %hi(gDisplayListHead) # $a2, 0x8031
/* 06F428 802AFC28 24C692A8 */  addiu $a2, %lo(gDisplayListHead) # addiu $a2, $a2, -0x6d58
/* 06F42C 802AFC2C 2508D630 */  addiu $t0, %lo(gDialogBoxState) # addiu $t0, $t0, -0x29d0
/* 06F430 802AFC30 24070002 */  li    $a3, 2
.L802AFC34:
/* 06F434 802AFC34 8CC30000 */  lw    $v1, ($a2)
/* 06F438 802AFC38 3C0D0200 */  lui   $t5, %hi(dl_ia_text_end) # $t5, 0x200
/* 06F43C 802AFC3C 25AD7418 */  addiu $t5, %lo(dl_ia_text_end) # addiu $t5, $t5, 0x7418
/* 06F440 802AFC40 246A0008 */  addiu $t2, $v1, 8
/* 06F444 802AFC44 ACCA0000 */  sw    $t2, ($a2)
/* 06F448 802AFC48 3C0B0600 */  lui   $t3, 0x600
/* 06F44C 802AFC4C AC6B0000 */  sw    $t3, ($v1)
/* 06F450 802AFC50 AC6D0004 */  sw    $t5, 4($v1)
/* 06F454 802AFC54 810C0000 */  lb    $t4, ($t0)
/* 06F458 802AFC58 24010001 */  li    $at, 1
/* 06F45C 802AFC5C 83AF005D */  lb    $t7, 0x5d($sp)
/* 06F460 802AFC60 55810009 */  bnel  $t4, $at, .L802AFC88
/* 06F464 802AFC64 8FBF0044 */   lw    $ra, 0x44($sp)
/* 06F468 802AFC68 15E70005 */  bne   $t7, $a3, .L802AFC80
/* 06F46C 802AFC6C 3C018030 */   lui   $at, %hi(gLastDialogPageStrPos)
/* 06F470 802AFC70 240EFFFF */  li    $t6, -1
/* 06F474 802AFC74 3C018030 */  lui   $at, %hi(gLastDialogPageStrPos) # $at, 0x8030
/* 06F478 802AFC78 10000002 */  b     .L802AFC84
/* 06F47C 802AFC7C A42ED648 */   sh    $t6, %lo(gLastDialogPageStrPos)($at)
.L802AFC80:
/* 06F480 802AFC80 A437D648 */  sh    $s7, %lo(gLastDialogPageStrPos)($at)
.L802AFC84:
/* 06F484 802AFC84 8FBF0044 */  lw    $ra, 0x44($sp)
.L802AFC88:
/* 06F488 802AFC88 3C018033 */  lui   $at, %hi(gLastDialogLineNum) # $at, 0x8033
/* 06F48C 802AFC8C A033F692 */  sb    $s3, %lo(gLastDialogLineNum)($at)
/* 06F490 802AFC90 8FB3002C */  lw    $s3, 0x2c($sp)
/* 06F494 802AFC94 8FB00020 */  lw    $s0, 0x20($sp)
/* 06F498 802AFC98 8FB10024 */  lw    $s1, 0x24($sp)
/* 06F49C 802AFC9C 8FB20028 */  lw    $s2, 0x28($sp)
/* 06F4A0 802AFCA0 8FB40030 */  lw    $s4, 0x30($sp)
/* 06F4A4 802AFCA4 8FB50034 */  lw    $s5, 0x34($sp)
/* 06F4A8 802AFCA8 8FB60038 */  lw    $s6, 0x38($sp)
/* 06F4AC 802AFCAC 8FB7003C */  lw    $s7, 0x3c($sp)
/* 06F4B0 802AFCB0 8FBE0040 */  lw    $fp, 0x40($sp)
/* 06F4B4 802AFCB4 03E00008 */  jr    $ra
/* 06F4B8 802AFCB8 27BD0070 */   addiu $sp, $sp, 0x70

