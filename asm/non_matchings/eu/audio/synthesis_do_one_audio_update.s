glabel synthesis_do_one_audio_update
/* 09FA28 802E0228 27BDFF40 */  addiu $sp, $sp, -0xc0
/* 09FA2C 802E022C 3C0A8022 */  lui   $t2, %hi(gNumSynthesisReverbs) # $t2, 0x8022
/* 09FA30 802E0230 254AC5E3 */  addiu $t2, %lo(gNumSynthesisReverbs) # addiu $t2, $t2, -0x3a1d
/* 09FA34 802E0234 81480000 */  lb    $t0, ($t2)
/* 09FA38 802E0238 AFBE0040 */  sw    $fp, 0x40($sp)
/* 09FA3C 802E023C AFB40030 */  sw    $s4, 0x30($sp)
/* 09FA40 802E0240 AFB20028 */  sw    $s2, 0x28($sp)
/* 09FA44 802E0244 00C0A025 */  move  $s4, $a2
/* 09FA48 802E0248 00E0F025 */  move  $fp, $a3
/* 09FA4C 802E024C AFBF0044 */  sw    $ra, 0x44($sp)
/* 09FA50 802E0250 AFB7003C */  sw    $s7, 0x3c($sp)
/* 09FA54 802E0254 AFB60038 */  sw    $s6, 0x38($sp)
/* 09FA58 802E0258 AFB50034 */  sw    $s5, 0x34($sp)
/* 09FA5C 802E025C AFB3002C */  sw    $s3, 0x2c($sp)
/* 09FA60 802E0260 AFB10024 */  sw    $s1, 0x24($sp)
/* 09FA64 802E0264 AFB00020 */  sw    $s0, 0x20($sp)
/* 09FA68 802E0268 AFA400C0 */  sw    $a0, 0xc0($sp)
/* 09FA6C 802E026C AFA500C4 */  sw    $a1, 0xc4($sp)
/* 09FA70 802E0270 1500001D */  bnez  $t0, .L80200C98
/* 09FA74 802E0274 00009025 */   move  $s2, $zero
/* 09FA78 802E0278 3C048023 */  lui   $a0, %hi(gMaxSimultaneousNotes) # $a0, 0x8023
/* 09FA7C 802E027C 8C849808 */  lw    $a0, %lo(gMaxSimultaneousNotes)($a0)
/* 09FA80 802E0280 00008825 */  move  $s1, $zero
/* 09FA84 802E0284 18800016 */  blez  $a0, .L80200C90
/* 09FA88 802E0288 00000000 */   nop
/* 09FA8C 802E028C 00870019 */  multu $a0, $a3
/* 09FA90 802E0290 3C0E8022 */  lui   $t6, %hi(gNoteSubsEu) # $t6, 0x8022
/* 09FA94 802E0294 8DCEC5E4 */  lw    $t6, %lo(gNoteSubsEu)($t6)
/* 09FA98 802E0298 27A50084 */  addiu $a1, $sp, 0x84
/* 09FA9C 802E029C 00007812 */  mflo  $t7
/* 09FAA0 802E02A0 000FC100 */  sll   $t8, $t7, 4
/* 09FAA4 802E02A4 01D81021 */  addu  $v0, $t6, $t8
.L80200C58:
/* 09FAA8 802E02A8 8C590000 */  lw    $t9, ($v0)
/* 09FAAC 802E02AC 00B26021 */  addu  $t4, $a1, $s2
/* 09FAB0 802E02B0 00195FC2 */  srl   $t3, $t9, 0x1f
/* 09FAB4 802E02B4 51600006 */  beql  $t3, $zero, .L80200C80
/* 09FAB8 802E02B8 26310001 */   addiu $s1, $s1, 1
/* 09FABC 802E02BC 26520001 */  addiu $s2, $s2, 1
/* 09FAC0 802E02C0 00126C00 */  sll   $t5, $s2, 0x10
/* 09FAC4 802E02C4 000D9403 */  sra   $s2, $t5, 0x10
/* 09FAC8 802E02C8 A1910000 */  sb    $s1, ($t4)
/* 09FACC 802E02CC 26310001 */  addiu $s1, $s1, 1
.L80200C80:
/* 09FAD0 802E02D0 0224082A */  slt   $at, $s1, $a0
/* 09FAD4 802E02D4 1420FFF4 */  bnez  $at, .L80200C58
/* 09FAD8 802E02D8 24420010 */   addiu $v0, $v0, 0x10
/* 09FADC 802E02DC 00008825 */  move  $s1, $zero
.L80200C90:
/* 09FAE0 802E02E0 10000049 */  b     .L80200DB8
/* 09FAE4 802E02E4 00009825 */   move  $s3, $zero
.L80200C98:
/* 09FAE8 802E02E8 19000026 */  blez  $t0, .L80200D34
/* 09FAEC 802E02EC 00009825 */   move  $s3, $zero
/* 09FAF0 802E02F0 3C048023 */  lui   $a0, %hi(gMaxSimultaneousNotes) # $a0, 0x8023
/* 09FAF4 802E02F4 8C849808 */  lw    $a0, %lo(gMaxSimultaneousNotes)($a0)
/* 09FAF8 802E02F8 27A50084 */  addiu $a1, $sp, 0x84
.L80200CAC:
/* 09FAFC 802E02FC 1880001A */  blez  $a0, .L80200D18
/* 09FB00 802E0300 00008825 */   move  $s1, $zero
/* 09FB04 802E0304 009E0019 */  multu $a0, $fp
/* 09FB08 802E0308 3C098022 */  lui   $t1, %hi(gNoteSubsEu) # $t1, 0x8022
/* 09FB0C 802E030C 8D29C5E4 */  lw    $t1, %lo(gNoteSubsEu)($t1)
/* 09FB10 802E0310 00001812 */  mflo  $v1
/* 09FB14 802E0314 00000000 */  nop
/* 09FB18 802E0318 00000000 */  nop
.L80200CCC:
/* 09FB1C 802E031C 00037100 */  sll   $t6, $v1, 4
/* 09FB20 802E0320 01C91021 */  addu  $v0, $t6, $t1
/* 09FB24 802E0324 8C580000 */  lw    $t8, ($v0)
/* 09FB28 802E0328 0018CFC2 */  srl   $t9, $t8, 0x1f
/* 09FB2C 802E032C 5320000B */  beql  $t9, $zero, .L80200D0C
/* 09FB30 802E0330 26310001 */   addiu $s1, $s1, 1
/* 09FB34 802E0334 904B0001 */  lbu   $t3, 1($v0)
/* 09FB38 802E0338 00B26821 */  addu  $t5, $a1, $s2
/* 09FB3C 802E033C 000B6142 */  srl   $t4, $t3, 5
/* 09FB40 802E0340 566C0006 */  bnel  $s3, $t4, .L80200D0C
/* 09FB44 802E0344 26310001 */   addiu $s1, $s1, 1
/* 09FB48 802E0348 26520001 */  addiu $s2, $s2, 1
/* 09FB4C 802E034C 00127C00 */  sll   $t7, $s2, 0x10
/* 09FB50 802E0350 000F9403 */  sra   $s2, $t7, 0x10
/* 09FB54 802E0354 A1B10000 */  sb    $s1, ($t5)
/* 09FB58 802E0358 26310001 */  addiu $s1, $s1, 1
.L80200D0C:
/* 09FB5C 802E035C 0224082A */  slt   $at, $s1, $a0
/* 09FB60 802E0360 1420FFEE */  bnez  $at, .L80200CCC
/* 09FB64 802E0364 24630001 */   addiu $v1, $v1, 1
.L80200D18:
/* 09FB68 802E0368 26730001 */  addiu $s3, $s3, 1
/* 09FB6C 802E036C 0013C400 */  sll   $t8, $s3, 0x10
/* 09FB70 802E0370 00189C03 */  sra   $s3, $t8, 0x10
/* 09FB74 802E0374 0268082A */  slt   $at, $s3, $t0
/* 09FB78 802E0378 1420FFE0 */  bnez  $at, .L80200CAC
/* 09FB7C 802E037C 00000000 */   nop
/* 09FB80 802E0380 00009825 */  move  $s3, $zero
.L80200D34:
/* 09FB84 802E0384 3C048023 */  lui   $a0, %hi(gMaxSimultaneousNotes) # $a0, 0x8023
/* 09FB88 802E0388 8C849808 */  lw    $a0, %lo(gMaxSimultaneousNotes)($a0)
/* 09FB8C 802E038C 27A50084 */  addiu $a1, $sp, 0x84
/* 09FB90 802E0390 00008825 */  move  $s1, $zero
/* 09FB94 802E0394 5880001D */  blezl $a0, .L80200DBC
/* 09FB98 802E0398 02801025 */   move  $v0, $s4
/* 09FB9C 802E039C 009E0019 */  multu $a0, $fp
/* 09FBA0 802E03A0 3C098022 */  lui   $t1, %hi(gNoteSubsEu) # $t1, 0x8022
/* 09FBA4 802E03A4 8D29C5E4 */  lw    $t1, %lo(gNoteSubsEu)($t1)
/* 09FBA8 802E03A8 00001812 */  mflo  $v1
/* 09FBAC 802E03AC 00000000 */  nop
/* 09FBB0 802E03B0 00000000 */  nop
.L80200D64:
/* 09FBB4 802E03B4 00035900 */  sll   $t3, $v1, 4
/* 09FBB8 802E03B8 01691021 */  addu  $v0, $t3, $t1
/* 09FBBC 802E03BC 8C4C0000 */  lw    $t4, ($v0)
/* 09FBC0 802E03C0 000C6FC2 */  srl   $t5, $t4, 0x1f
/* 09FBC4 802E03C4 51A0000C */  beql  $t5, $zero, .L80200DA8
/* 09FBC8 802E03C8 26310001 */   addiu $s1, $s1, 1
/* 09FBCC 802E03CC 904F0001 */  lbu   $t7, 1($v0)
/* 09FBD0 802E03D0 00B2C021 */  addu  $t8, $a1, $s2
/* 09FBD4 802E03D4 000F7142 */  srl   $t6, $t7, 5
/* 09FBD8 802E03D8 01C8082A */  slt   $at, $t6, $t0
/* 09FBDC 802E03DC 54200006 */  bnezl $at, .L80200DA8
/* 09FBE0 802E03E0 26310001 */   addiu $s1, $s1, 1
/* 09FBE4 802E03E4 26520001 */  addiu $s2, $s2, 1
/* 09FBE8 802E03E8 0012CC00 */  sll   $t9, $s2, 0x10
/* 09FBEC 802E03EC 00199403 */  sra   $s2, $t9, 0x10
/* 09FBF0 802E03F0 A3110000 */  sb    $s1, ($t8)
/* 09FBF4 802E03F4 26310001 */  addiu $s1, $s1, 1
.L80200DA8:
/* 09FBF8 802E03F8 0224082A */  slt   $at, $s1, $a0
/* 09FBFC 802E03FC 1420FFED */  bnez  $at, .L80200D64
/* 09FC00 802E0400 24630001 */   addiu $v1, $v1, 1
/* 09FC04 802E0404 00008825 */  move  $s1, $zero
.L80200DB8:
/* 09FC08 802E0408 02801025 */  move  $v0, $s4
.L80200DBC:
/* 09FC0C 802E040C 3C0C0200 */  lui   $t4, (0x020004C0 >> 16) # lui $t4, 0x200
/* 09FC10 802E0410 358C04C0 */  ori   $t4, (0x020004C0 & 0xFFFF) # ori $t4, $t4, 0x4c0
/* 09FC14 802E0414 240D0280 */  li    $t5, 640
/* 09FC18 802E0418 AC4D0004 */  sw    $t5, 4($v0)
/* 09FC1C 802E041C AC4C0000 */  sw    $t4, ($v0)
/* 09FC20 802E0420 814F0000 */  lb    $t7, ($t2)
/* 09FC24 802E0424 3C178022 */  lui   $s7, %hi(gNotes) # $s7, 0x8022
/* 09FC28 802E0428 26940008 */  addiu $s4, $s4, 8
/* 09FC2C 802E042C 19E00053 */  blez  $t7, .L80200F2C
/* 09FC30 802E0430 26F73D60 */   addiu $s7, %lo(gNotes) # addiu $s7, $s7, 0x3d60
/* 09FC34 802E0434 3C158022 */  lui   $s5, %hi(gNoteSubsEu) # $s5, 0x8022
/* 09FC38 802E0438 26B5C5E4 */  addiu $s5, %lo(gNoteSubsEu) # addiu $s5, $s5, -0x3a1c
/* 09FC3C 802E043C 241600C0 */  li    $s6, 192
/* 09FC40 802E0440 00137140 */  sll   $t6, $s3, 5
.L80200DF4:
/* 09FC44 802E0444 01D37021 */  addu  $t6, $t6, $s3
/* 09FC48 802E0448 3C188022 */  lui   $t8, %hi(gSynthesisReverbs) # $t8, 0x8022
/* 09FC4C 802E044C 2718C1B0 */  addiu $t8, %lo(gSynthesisReverbs) # addiu $t8, $t8, -0x3e50
/* 09FC50 802E0450 000E70C0 */  sll   $t6, $t6, 3
/* 09FC54 802E0454 01D8C821 */  addu  $t9, $t6, $t8
/* 09FC58 802E0458 AFB90060 */  sw    $t9, 0x60($sp)
/* 09FC5C 802E045C 932B0001 */  lbu   $t3, 1($t9)
/* 09FC60 802E0460 3C018022 */  lui   $at, %hi(gUseReverb) # $at, 0x8022
/* 09FC64 802E0464 02802025 */  move  $a0, $s4
/* 09FC68 802E0468 000B6600 */  sll   $t4, $t3, 0x18
/* 09FC6C 802E046C 000C6E03 */  sra   $t5, $t4, 0x18
/* 09FC70 802E0470 11A0000A */  beqz  $t5, .L80200E4C
/* 09FC74 802E0474 A02BC5E2 */   sb    $t3, %lo(gUseReverb)($at)
/* 09FC78 802E0478 00133400 */  sll   $a2, $s3, 0x10
/* 09FC7C 802E047C 001E3C00 */  sll   $a3, $fp, 0x10
/* 09FC80 802E0480 00077403 */  sra   $t6, $a3, 0x10
/* 09FC84 802E0484 00067C03 */  sra   $t7, $a2, 0x10
/* 09FC88 802E0488 01E03025 */  move  $a2, $t7
/* 09FC8C 802E048C 01C03825 */  move  $a3, $t6
/* 09FC90 802E0490 0C0B7F60 */  jal   synthesis_resample_and_mix_reverb
/* 09FC94 802E0494 8FA500C4 */   lw    $a1, 0xc4($sp)
/* 09FC98 802E0498 0040A025 */  move  $s4, $v0
.L80200E4C:
/* 09FC9C 802E049C 0232082A */  slt   $at, $s1, $s2
/* 09FCA0 802E04A0 10200022 */  beqz  $at, .L80200EDC
/* 09FCA4 802E04A4 27B80084 */   addiu $t8, $sp, 0x84
/* 09FCA8 802E04A8 02388021 */  addu  $s0, $s1, $t8
.L80200E5C:
/* 09FCAC 802E04AC 3C198023 */  lui   $t9, %hi(gMaxSimultaneousNotes) # $t9, 0x8023
/* 09FCB0 802E04B0 8F399808 */  lw    $t9, %lo(gMaxSimultaneousNotes)($t9)
/* 09FCB4 802E04B4 92030000 */  lbu   $v1, ($s0)
/* 09FCB8 802E04B8 8EA90000 */  lw    $t1, ($s5)
/* 09FCBC 802E04BC 03D90019 */  multu $fp, $t9
/* 09FCC0 802E04C0 00035900 */  sll   $t3, $v1, 4
/* 09FCC4 802E04C4 012B6021 */  addu  $t4, $t1, $t3
/* 09FCC8 802E04C8 00001012 */  mflo  $v0
/* 09FCCC 802E04CC 00026900 */  sll   $t5, $v0, 4
/* 09FCD0 802E04D0 018D7821 */  addu  $t7, $t4, $t5
/* 09FCD4 802E04D4 91EE0001 */  lbu   $t6, 1($t7)
/* 09FCD8 802E04D8 000EC142 */  srl   $t8, $t6, 5
/* 09FCDC 802E04DC 56780014 */  bnel  $s3, $t8, .L80200EE0
/* 09FCE0 802E04E0 8FAE0060 */   lw    $t6, 0x60($sp)
/* 09FCE4 802E04E4 00760019 */  multu $v1, $s6
/* 09FCE8 802E04E8 8EEB0000 */  lw    $t3, ($s7)
/* 09FCEC 802E04EC 8FAF00C4 */  lw    $t7, 0xc4($sp)
/* 09FCF0 802E04F0 00626021 */  addu  $t4, $v1, $v0
/* 09FCF4 802E04F4 000C6900 */  sll   $t5, $t4, 4
/* 09FCF8 802E04F8 01A92821 */  addu  $a1, $t5, $t1
/* 09FCFC 802E04FC 8FA700C0 */  lw    $a3, 0xc0($sp)
/* 09FD00 802E0500 AFB40014 */  sw    $s4, 0x14($sp)
/* 09FD04 802E0504 AFAF0010 */  sw    $t7, 0x10($sp)
/* 09FD08 802E0508 0000C812 */  mflo  $t9
/* 09FD0C 802E050C 032B2021 */  addu  $a0, $t9, $t3
/* 09FD10 802E0510 0C0B81BC */  jal   synthesis_process_note
/* 09FD14 802E0514 24860010 */   addiu $a2, $a0, 0x10
/* 09FD18 802E0518 26310001 */  addiu $s1, $s1, 1
/* 09FD1C 802E051C 0232082A */  slt   $at, $s1, $s2
/* 09FD20 802E0520 0040A025 */  move  $s4, $v0
/* 09FD24 802E0524 1420FFE1 */  bnez  $at, .L80200E5C
/* 09FD28 802E0528 26100001 */   addiu $s0, $s0, 1
.L80200EDC:
/* 09FD2C 802E052C 8FAE0060 */  lw    $t6, 0x60($sp)
.L80200EE0:
/* 09FD30 802E0530 00132C00 */  sll   $a1, $s3, 0x10
/* 09FD34 802E0534 0005CC03 */  sra   $t9, $a1, 0x10
/* 09FD38 802E0538 91D80001 */  lbu   $t8, 1($t6)
/* 09FD3C 802E053C 03202825 */  move  $a1, $t9
/* 09FD40 802E0540 02802025 */  move  $a0, $s4
/* 09FD44 802E0544 13000005 */  beqz  $t8, .L80200F0C
/* 09FD48 802E0548 001E3400 */   sll   $a2, $fp, 0x10
/* 09FD4C 802E054C 00065C03 */  sra   $t3, $a2, 0x10
/* 09FD50 802E0550 0C0B8036 */  jal   func_eu_802e00d8
/* 09FD54 802E0554 01603025 */   move  $a2, $t3
/* 09FD58 802E0558 0040A025 */  move  $s4, $v0
.L80200F0C:
/* 09FD5C 802E055C 3C0F8022 */  lui   $t7, %hi(gNumSynthesisReverbs) # $t7, 0x8022
/* 09FD60 802E0560 81EFC5E3 */  lb    $t7, %lo(gNumSynthesisReverbs)($t7)
/* 09FD64 802E0564 26730001 */  addiu $s3, $s3, 1
/* 09FD68 802E0568 00136400 */  sll   $t4, $s3, 0x10
/* 09FD6C 802E056C 000C9C03 */  sra   $s3, $t4, 0x10
/* 09FD70 802E0570 026F082A */  slt   $at, $s3, $t7
/* 09FD74 802E0574 5420FFB3 */  bnezl $at, .L80200DF4
/* 09FD78 802E0578 00137140 */   sll   $t6, $s3, 5
.L80200F2C:
/* 09FD7C 802E057C 3C158022 */  lui   $s5, %hi(gNoteSubsEu) # $s5, 0x8022
/* 09FD80 802E0580 3C178022 */  lui   $s7, %hi(gNotes) # $s7, 0x8022
/* 09FD84 802E0584 0232082A */  slt   $at, $s1, $s2
/* 09FD88 802E0588 26F73D60 */  addiu $s7, %lo(gNotes) # addiu $s7, $s7, 0x3d60
/* 09FD8C 802E058C 26B5C5E4 */  addiu $s5, %lo(gNoteSubsEu) # addiu $s5, $s5, -0x3a1c
/* 09FD90 802E0590 1020002E */  beqz  $at, .L80200FFC
/* 09FD94 802E0594 241600C0 */   li    $s6, 192
/* 09FD98 802E0598 27AE0084 */  addiu $t6, $sp, 0x84
/* 09FD9C 802E059C 022E8021 */  addu  $s0, $s1, $t6
/* 09FDA0 802E05A0 24130001 */  li    $s3, 1
.L80200F54:
/* 09FDA4 802E05A4 3C188023 */  lui   $t8, %hi(gMaxSimultaneousNotes) # $t8, 0x8023
/* 09FDA8 802E05A8 8F189808 */  lw    $t8, %lo(gMaxSimultaneousNotes)($t8)
/* 09FDAC 802E05AC 92030000 */  lbu   $v1, ($s0)
/* 09FDB0 802E05B0 8EA90000 */  lw    $t1, ($s5)
/* 09FDB4 802E05B4 03D80019 */  multu $fp, $t8
/* 09FDB8 802E05B8 0003C900 */  sll   $t9, $v1, 4
/* 09FDBC 802E05BC 01395821 */  addu  $t3, $t1, $t9
/* 09FDC0 802E05C0 3C0F8022 */  lui   $t7, %hi(gBankLoadStatus)
/* 09FDC4 802E05C4 3C011000 */  lui   $at, 0x1000
/* 09FDC8 802E05C8 00001012 */  mflo  $v0
/* 09FDCC 802E05CC 00026100 */  sll   $t4, $v0, 4
/* 09FDD0 802E05D0 016C6821 */  addu  $t5, $t3, $t4
/* 09FDD4 802E05D4 91A40002 */  lbu   $a0, 2($t5)
/* 09FDD8 802E05D8 01E47821 */  addu  $t7, $t7, $a0
/* 09FDDC 802E05DC 91EF2C18 */  lbu   $t7, %lo(gBankLoadStatus)($t7)
/* 09FDE0 802E05E0 29EE0002 */  slti  $t6, $t7, 2
/* 09FDE4 802E05E4 39CE0001 */  xori  $t6, $t6, 1
/* 09FDE8 802E05E8 166E0010 */  bne   $s3, $t6, .L80200FDC
/* 09FDEC 802E05EC 00117A00 */   sll   $t7, $s1, 8
/* 09FDF0 802E05F0 00760019 */  multu $v1, $s6
/* 09FDF4 802E05F4 8EF90000 */  lw    $t9, ($s7)
/* 09FDF8 802E05F8 8FAD00C4 */  lw    $t5, 0xc4($sp)
/* 09FDFC 802E05FC 00625821 */  addu  $t3, $v1, $v0
/* 09FE00 802E0600 000B6100 */  sll   $t4, $t3, 4
/* 09FE04 802E0604 01892821 */  addu  $a1, $t4, $t1
/* 09FE08 802E0608 8FA700C0 */  lw    $a3, 0xc0($sp)
/* 09FE0C 802E060C AFB40014 */  sw    $s4, 0x14($sp)
/* 09FE10 802E0610 AFAD0010 */  sw    $t5, 0x10($sp)
/* 09FE14 802E0614 0000C012 */  mflo  $t8
/* 09FE18 802E0618 03192021 */  addu  $a0, $t8, $t9
/* 09FE1C 802E061C 0C0B81BC */  jal   synthesis_process_note
/* 09FE20 802E0620 24860010 */   addiu $a2, $a0, 0x10
/* 09FE24 802E0624 10000005 */  b     .L80200FEC
/* 09FE28 802E0628 0040A025 */   move  $s4, $v0
.L80200FDC:
/* 09FE2C 802E062C 008F7021 */  addu  $t6, $a0, $t7
/* 09FE30 802E0630 01C1C021 */  addu  $t8, $t6, $at
/* 09FE34 802E0634 3C018023 */  lui   $at, %hi(gAudioErrorFlags) # $at, 0x8023
/* 09FE38 802E0638 AC3898F0 */  sw    $t8, %lo(gAudioErrorFlags)($at)
.L80200FEC:
/* 09FE3C 802E063C 26310001 */  addiu $s1, $s1, 1
/* 09FE40 802E0640 0232082A */  slt   $at, $s1, $s2
/* 09FE44 802E0644 1420FFD7 */  bnez  $at, .L80200F54
/* 09FE48 802E0648 26100001 */   addiu $s0, $s0, 1
.L80200FFC:
/* 09FE4C 802E064C 3C080800 */  lui   $t0, 0x800
/* 09FE50 802E0650 02802025 */  move  $a0, $s4
/* 09FE54 802E0654 AC880000 */  sw    $t0, ($a0)
/* 09FE58 802E0658 8FA300C4 */  lw    $v1, 0xc4($sp)
/* 09FE5C 802E065C 26940008 */  addiu $s4, $s4, 8
/* 09FE60 802E0660 02802825 */  move  $a1, $s4
/* 09FE64 802E0664 0003C840 */  sll   $t9, $v1, 1
/* 09FE68 802E0668 332BFFFF */  andi  $t3, $t9, 0xffff
/* 09FE6C 802E066C AC8B0004 */  sw    $t3, 4($a0)
/* 09FE70 802E0670 26940008 */  addiu $s4, $s4, 8
/* 09FE74 802E0674 3C0D04C0 */  lui   $t5, (0x04C00600 >> 16) # lui $t5, 0x4c0
/* 09FE78 802E0678 35AD0600 */  ori   $t5, (0x04C00600 & 0xFFFF) # ori $t5, $t5, 0x600
/* 09FE7C 802E067C 3C0C0D00 */  lui   $t4, 0xd00
/* 09FE80 802E0680 02803025 */  move  $a2, $s4
/* 09FE84 802E0684 ACAC0000 */  sw    $t4, ($a1)
/* 09FE88 802E0688 ACAD0004 */  sw    $t5, 4($a1)
/* 09FE8C 802E068C 00197840 */  sll   $t7, $t9, 1
/* 09FE90 802E0690 31EEFFFF */  andi  $t6, $t7, 0xffff
/* 09FE94 802E0694 26940008 */  addiu $s4, $s4, 8
/* 09FE98 802E0698 ACCE0004 */  sw    $t6, 4($a2)
/* 09FE9C 802E069C ACC80000 */  sw    $t0, ($a2)
/* 09FEA0 802E06A0 02803825 */  move  $a3, $s4
/* 09FEA4 802E06A4 3C180600 */  lui   $t8, 0x600
/* 09FEA8 802E06A8 ACF80000 */  sw    $t8, ($a3)
/* 09FEAC 802E06AC 8FB900C0 */  lw    $t9, 0xc0($sp)
/* 09FEB0 802E06B0 3C018000 */  lui   $at, 0x8000
/* 09FEB4 802E06B4 26820008 */  addiu $v0, $s4, 8
/* 09FEB8 802E06B8 03215821 */  addu  $t3, $t9, $at
/* 09FEBC 802E06BC ACEB0004 */  sw    $t3, 4($a3)
/* 09FEC0 802E06C0 8FBF0044 */  lw    $ra, 0x44($sp)
/* 09FEC4 802E06C4 8FBE0040 */  lw    $fp, 0x40($sp)
/* 09FEC8 802E06C8 8FB7003C */  lw    $s7, 0x3c($sp)
/* 09FECC 802E06CC 8FB60038 */  lw    $s6, 0x38($sp)
/* 09FED0 802E06D0 8FB50034 */  lw    $s5, 0x34($sp)
/* 09FED4 802E06D4 8FB40030 */  lw    $s4, 0x30($sp)
/* 09FED8 802E06D8 8FB3002C */  lw    $s3, 0x2c($sp)
/* 09FEDC 802E06DC 8FB20028 */  lw    $s2, 0x28($sp)
/* 09FEE0 802E06E0 8FB10024 */  lw    $s1, 0x24($sp)
/* 09FEE4 802E06E4 8FB00020 */  lw    $s0, 0x20($sp)
/* 09FEE8 802E06E8 03E00008 */  jr    $ra
/* 09FEEC 802E06EC 27BD00C0 */   addiu $sp, $sp, 0xc0
