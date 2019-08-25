.late_rodata
glabel jtbl_80337BE0
    .word L80317BF0
    .word L80317BFC
    .word L80317C3C
    .word L80317C0C
    .word L80317C3C
    .word L80317C3C
    .word L80317C3C
    .word L80317C1C
    .word L80317C3C
    .word L80317C3C
    .word L80317C3C
    .word L80317C3C
    .word L80317C3C
    .word L80317C3C
    .word L80317C3C
    .word L80317C2C

glabel D_U_80338E00
    .word 0x4A2FC800 /* 2880000.0f */

glabel D_U_80338E04
    .word 0x4185B439 /* 16.713f */

.text
glabel func_80316928
/* 0D2948 80317948 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 0D294C 8031794C 3C0E8033 */  lui   $t6, %hi(gAudioLoadLock) # $t6, 0x8033
/* 0D2950 80317950 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0D2954 80317954 AFB30020 */  sw    $s3, 0x20($sp)
/* 0D2958 80317958 AFB2001C */  sw    $s2, 0x1c($sp)
/* 0D295C 8031795C AFB10018 */  sw    $s1, 0x18($sp)
/* 0D2960 80317960 AFB00014 */  sw    $s0, 0x14($sp)
/* 0D2964 80317964 AFA40038 */  sw    $a0, 0x38($sp)
/* 0D2968 80317968 25CE5004 */  addiu $t6, %lo(gAudioLoadLock) # addiu $t6, $t6, 0x5004
/* 0D296C 8031796C 8DCF0000 */  lw    $t7, ($t6)
/* 0D2970 80317970 51E0007A */  beql  $t7, $zero, .L80317B5C
/* 0D2974 80317974 8FB80038 */   lw    $t8, 0x38($sp)
/* 0D2978 80317978 0C0C5E3B */  jal   func_803168CC
/* 0D297C 8031797C 00000000 */   nop   
/* 0D2980 80317980 3C038022 */  lui   $v1, %hi(gMaxSimultaneousNotes) # $v1, 0x8022
/* 0D2984 80317984 8C636B70 */  lw    $v1, %lo(gMaxSimultaneousNotes)($v1)
/* 0D2988 80317988 00008025 */  move  $s0, $zero
/* 0D298C 8031798C 00002025 */  move  $a0, $zero
/* 0D2990 80317990 18600027 */  blez  $v1, .L80317A30
/* 0D2994 80317994 00008825 */   move  $s1, $zero
/* 0D2998 80317998 3C068022 */  lui   $a2, %hi(gAudioUpdatesPerFrame) # $a2, 0x8022
/* 0D299C 8031799C 3C058022 */  lui   $a1, %hi(gNotes) # $a1, 0x8022
/* 0D29A0 803179A0 24A52610 */  addiu $a1, %lo(gNotes) # addiu $a1, $a1, 0x2610
/* 0D29A4 803179A4 24C66B7E */  addiu $a2, %lo(gAudioUpdatesPerFrame) # addiu $a2, $a2, 0x6b7e
.L803179A8:
/* 0D29A8 803179A8 8CB80000 */  lw    $t8, ($a1)
/* 0D29AC 803179AC 26100001 */  addiu $s0, $s0, 1
/* 0D29B0 803179B0 03041021 */  addu  $v0, $t8, $a0
/* 0D29B4 803179B4 8C590000 */  lw    $t9, ($v0)
/* 0D29B8 803179B8 001967C2 */  srl   $t4, $t9, 0x1f
/* 0D29BC 803179BC 5180001A */  beql  $t4, $zero, .L80317A28
/* 0D29C0 803179C0 0203082A */   slt   $at, $s0, $v1
/* 0D29C4 803179C4 904D0055 */  lbu   $t5, 0x55($v0)
/* 0D29C8 803179C8 51A00017 */  beql  $t5, $zero, .L80317A28
/* 0D29CC 803179CC 0203082A */   slt   $at, $s0, $v1
/* 0D29D0 803179D0 80CE0000 */  lb    $t6, ($a2)
/* 0D29D4 803179D4 340F8000 */  li    $t7, 32768
/* 0D29D8 803179D8 3C038022 */  lui   $v1, %hi(gMaxSimultaneousNotes) # $v1, 0x8022
/* 0D29DC 803179DC 01EE001A */  div   $zero, $t7, $t6
/* 0D29E0 803179E0 0000C012 */  mflo  $t8
/* 0D29E4 803179E4 A4580062 */  sh    $t8, 0x62($v0)
/* 0D29E8 803179E8 8CB90000 */  lw    $t9, ($a1)
/* 0D29EC 803179EC 15C00002 */  bnez  $t6, .L803179F8
/* 0D29F0 803179F0 00000000 */   nop   
/* 0D29F4 803179F4 0007000D */  break 7
.L803179F8:
/* 0D29F8 803179F8 2401FFFF */  li    $at, -1
/* 0D29FC 803179FC 15C10004 */  bne   $t6, $at, .L80317A10
/* 0D2A00 80317A00 3C018000 */   lui   $at, 0x8000
/* 0D2A04 80317A04 15E10002 */  bne   $t7, $at, .L80317A10
/* 0D2A08 80317A08 00000000 */   nop   
/* 0D2A0C 80317A0C 0006000D */  break 6
.L80317A10:
/* 0D2A10 80317A10 03241021 */  addu  $v0, $t9, $a0
/* 0D2A14 80317A14 904C0054 */  lbu   $t4, 0x54($v0)
/* 0D2A18 80317A18 358D0010 */  ori   $t5, $t4, 0x10
/* 0D2A1C 80317A1C A04D0054 */  sb    $t5, 0x54($v0)
/* 0D2A20 80317A20 8C636B70 */  lw    $v1, %lo(gMaxSimultaneousNotes)($v1)
/* 0D2A24 80317A24 0203082A */  slt   $at, $s0, $v1
.L80317A28:
/* 0D2A28 80317A28 1420FFDF */  bnez  $at, .L803179A8
/* 0D2A2C 80317A2C 248400C0 */   addiu $a0, $a0, 0xc0
.L80317A30:
/* 0D2A30 80317A30 0C0C5E45 */  jal   wait_for_audio_frames
/* 0D2A34 80317A34 24040001 */   li    $a0, 1
/* 0D2A38 80317A38 26310001 */  addiu $s1, $s1, 1
/* 0D2A3C 80317A3C 2A2100F1 */  slti  $at, $s1, 0xf1
/* 0D2A40 80317A40 10200013 */  beqz  $at, .L80317A90
/* 0D2A44 80317A44 3C038022 */   lui   $v1, %hi(gMaxSimultaneousNotes) # $v1, 0x8022
/* 0D2A48 80317A48 8C636B70 */  lw    $v1, %lo(gMaxSimultaneousNotes)($v1)
/* 0D2A4C 80317A4C 00008025 */  move  $s0, $zero
/* 0D2A50 80317A50 3C028022 */  lui   $v0, %hi(gNotes) # $v0, 0x8022
/* 0D2A54 80317A54 1860000A */  blez  $v1, .L80317A80
/* 0D2A58 80317A58 00000000 */   nop   
/* 0D2A5C 80317A5C 8C422610 */  lw    $v0, %lo(gNotes)($v0)
.L80317A60:
/* 0D2A60 80317A60 8C4F0000 */  lw    $t7, ($v0)
/* 0D2A64 80317A64 000F77C2 */  srl   $t6, $t7, 0x1f
/* 0D2A68 80317A68 15C00005 */  bnez  $t6, .L80317A80
/* 0D2A6C 80317A6C 00000000 */   nop   
/* 0D2A70 80317A70 26100001 */  addiu $s0, $s0, 1
/* 0D2A74 80317A74 0203082A */  slt   $at, $s0, $v1
/* 0D2A78 80317A78 1420FFF9 */  bnez  $at, .L80317A60
/* 0D2A7C 80317A7C 244200C0 */   addiu $v0, $v0, 0xc0
.L80317A80:
/* 0D2A80 80317A80 12030003 */  beq   $s0, $v1, .L80317A90
/* 0D2A84 80317A84 00000000 */   nop   
/* 0D2A88 80317A88 1000FFE9 */  b     .L80317A30
/* 0D2A8C 80317A8C 00000000 */   nop   
.L80317A90:
/* 0D2A90 80317A90 0C0C5E3B */  jal   func_803168CC
/* 0D2A94 80317A94 00000000 */   nop   
/* 0D2A98 80317A98 0C0C5E45 */  jal   wait_for_audio_frames
/* 0D2A9C 80317A9C 24040003 */   li    $a0, 3
/* 0D2AA0 80317AA0 3C181971 */  lui   $t8, (0x19710515 >> 16) # lui $t8, 0x1971
/* 0D2AA4 80317AA4 3C198033 */  lui   $t9, %hi(gAudioLoadLock) # $t9, 0x8033
/* 0D2AA8 80317AA8 27395004 */  addiu $t9, %lo(gAudioLoadLock) # addiu $t9, $t9, 0x5004
/* 0D2AAC 80317AAC 37180515 */  ori   $t8, (0x19710515 & 0xFFFF) # ori $t8, $t8, 0x515
/* 0D2AB0 80317AB0 AF380000 */  sw    $t8, ($t9)
/* 0D2AB4 80317AB4 0C0C5E45 */  jal   wait_for_audio_frames
/* 0D2AB8 80317AB8 24040003 */   li    $a0, 3
/* 0D2ABC 80317ABC 3C138022 */  lui   $s3, %hi(gCurrAudioFrameDmaCount) # $s3, 0x8022
/* 0D2AC0 80317AC0 26736B84 */  addiu $s3, %lo(gCurrAudioFrameDmaCount) # addiu $s3, $s3, 0x6b84
/* 0D2AC4 80317AC4 8E710000 */  lw    $s1, ($s3)
/* 0D2AC8 80317AC8 3C128022 */  lui   $s2, %hi(gCurrAudioFrameDmaQueue) # $s2, 0x8022
/* 0D2ACC 80317ACC 26525CE8 */  addiu $s2, %lo(gCurrAudioFrameDmaQueue) # addiu $s2, $s2, 0x5ce8
/* 0D2AD0 80317AD0 1A200012 */  blez  $s1, .L80317B1C
/* 0D2AD4 80317AD4 00000000 */   nop   
/* 0D2AD8 80317AD8 8E6C0000 */  lw    $t4, ($s3)
.L80317ADC:
/* 0D2ADC 80317ADC 00008025 */  move  $s0, $zero
/* 0D2AE0 80317AE0 1980000C */  blez  $t4, .L80317B14
/* 0D2AE4 80317AE4 02402025 */   move  $a0, $s2
.L80317AE8:
/* 0D2AE8 80317AE8 00002825 */  move  $a1, $zero
/* 0D2AEC 80317AEC 0C0C8A00 */  jal   osRecvMesg
/* 0D2AF0 80317AF0 00003025 */   move  $a2, $zero
/* 0D2AF4 80317AF4 54400003 */  bnezl $v0, .L80317B04
/* 0D2AF8 80317AF8 8E6D0000 */   lw    $t5, ($s3)
/* 0D2AFC 80317AFC 2631FFFF */  addiu $s1, $s1, -1
/* 0D2B00 80317B00 8E6D0000 */  lw    $t5, ($s3)
.L80317B04:
/* 0D2B04 80317B04 26100001 */  addiu $s0, $s0, 1
/* 0D2B08 80317B08 020D082A */  slt   $at, $s0, $t5
/* 0D2B0C 80317B0C 5420FFF6 */  bnezl $at, .L80317AE8
/* 0D2B10 80317B10 02402025 */   move  $a0, $s2
.L80317B14:
/* 0D2B14 80317B14 5E20FFF1 */  bgtzl $s1, .L80317ADC
/* 0D2B18 80317B18 8E6C0000 */   lw    $t4, ($s3)
.L80317B1C:
/* 0D2B1C 80317B1C 3C038022 */  lui   $v1, %hi(gAiBuffers) # $v1, 0x8022
/* 0D2B20 80317B20 3C068022 */  lui   $a2, %hi(gAiBuffers + 0xC) # $a2, 0x8022
/* 0D2B24 80317B24 AE600000 */  sw    $zero, ($s3)
/* 0D2B28 80317B28 24C66C4C */  addiu $a2, %lo(gAiBuffers + 0xC) # addiu $a2, $a2, 0x6c4c
/* 0D2B2C 80317B2C 24636C40 */  addiu $v1, %lo(gAiBuffers) # addiu $v1, $v1, 0x6c40
/* 0D2B30 80317B30 24040A00 */  li    $a0, 2560
/* 0D2B34 80317B34 00001025 */  move  $v0, $zero
.L80317B38:
/* 0D2B38 80317B38 8C6F0000 */  lw    $t7, ($v1)
/* 0D2B3C 80317B3C 01E27021 */  addu  $t6, $t7, $v0
/* 0D2B40 80317B40 24420002 */  addiu $v0, $v0, 2
/* 0D2B44 80317B44 1444FFFC */  bne   $v0, $a0, .L80317B38
/* 0D2B48 80317B48 A5C00000 */   sh    $zero, ($t6)
/* 0D2B4C 80317B4C 24630004 */  addiu $v1, $v1, 4
/* 0D2B50 80317B50 5466FFF9 */  bnel  $v1, $a2, .L80317B38
/* 0D2B54 80317B54 00001025 */   move  $v0, $zero
/* 0D2B58 80317B58 8FB80038 */  lw    $t8, 0x38($sp)
.L80317B5C:
/* 0D2B5C 80317B5C 3C018022 */  lui   $at, %hi(gSampleDmaNumListItems) # $at, 0x8022
/* 0D2B60 80317B60 AC206938 */  sw    $zero, %lo(gSampleDmaNumListItems)($at)
/* 0D2B64 80317B64 97190006 */  lhu   $t9, 6($t8)
/* 0D2B68 80317B68 AFB9002C */  sw    $t9, 0x2c($sp)
/* 0D2B6C 80317B6C 0C0C965C */  jal   osAiSetFrequency
/* 0D2B70 80317B70 8F040000 */   lw    $a0, ($t8)
/* 0D2B74 80317B74 2401003C */  li    $at, 60
/* 0D2B78 80317B78 0041001A */  div   $zero, $v0, $at
/* 0D2B7C 80317B7C 8FA80038 */  lw    $t0, 0x38($sp)
/* 0D2B80 80317B80 3C038022 */  lui   $v1, %hi(gAiFrequency) # $v1, 0x8022
/* 0D2B84 80317B84 24636B64 */  addiu $v1, %lo(gAiFrequency) # addiu $v1, $v1, 0x6b64
/* 0D2B88 80317B88 AC620000 */  sw    $v0, ($v1)
/* 0D2B8C 80317B8C 910C0004 */  lbu   $t4, 4($t0)
/* 0D2B90 80317B90 00007812 */  mflo  $t7
/* 0D2B94 80317B94 3C0A8022 */  lui   $t2, %hi(D_80226D74) # $t2, 0x8022
/* 0D2B98 80317B98 3C0B8022 */  lui   $t3, %hi(gMaxSimultaneousNotes) # $t3, 0x8022
/* 0D2B9C 80317B9C 25EE000F */  addiu $t6, $t7, 0xf
/* 0D2BA0 80317BA0 2401FFF0 */  li    $at, -16
/* 0D2BA4 80317BA4 256B6B70 */  addiu $t3, %lo(gMaxSimultaneousNotes) # addiu $t3, $t3, 0x6b70
/* 0D2BA8 80317BA8 254A6B74 */  addiu $t2, %lo(D_80226D74) # addiu $t2, $t2, 0x6b74
/* 0D2BAC 80317BAC 01C1C824 */  and   $t9, $t6, $at
/* 0D2BB0 80317BB0 AD590000 */  sw    $t9, ($t2)
/* 0D2BB4 80317BB4 AD6C0000 */  sw    $t4, ($t3)
/* 0D2BB8 80317BB8 91180005 */  lbu   $t8, 5($t0)
/* 0D2BBC 80317BBC 3C098022 */  lui   $t1, %hi(D_802212A2) # $t1, 0x8022
/* 0D2BC0 80317BC0 25290EA2 */  addiu $t1, %lo(D_802212A2) # addiu $t1, $t1, 0xea2
/* 0D2BC4 80317BC4 A1380000 */  sb    $t8, ($t1)
/* 0D2BC8 80317BC8 812C0000 */  lb    $t4, ($t1)
/* 0D2BCC 80317BCC 258DFFFF */  addiu $t5, $t4, -1
/* 0D2BD0 80317BD0 2DA10010 */  sltiu $at, $t5, 0x10
/* 0D2BD4 80317BD4 10200019 */  beqz  $at, .L80317C3C
/* 0D2BD8 80317BD8 000D6880 */   sll   $t5, $t5, 2
/* 0D2BDC 80317BDC 3C018034 */  lui   $at, %hi(jtbl_80337BE0)
/* 0D2BE0 80317BE0 002D0821 */  addu  $at, $at, $t5
/* 0D2BE4 80317BE4 8C2D8DC0 */  lw    $t5, %lo(jtbl_80337BE0)($at)
/* 0D2BE8 80317BE8 01A00008 */  jr    $t5
/* 0D2BEC 80317BEC 00000000 */   nop   
glabel L80317BF0
/* 0D2BF0 80317BF0 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D2BF4 80317BF4 10000013 */  b     .L80317C44
/* 0D2BF8 80317BF8 A0200EA3 */   sb    $zero, %lo(D_802212A3)($at)
glabel L80317BFC
/* 0D2BFC 80317BFC 240F0001 */  li    $t7, 1
/* 0D2C00 80317C00 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D2C04 80317C04 1000000F */  b     .L80317C44
/* 0D2C08 80317C08 A02F0EA3 */   sb    $t7, %lo(D_802212A3)($at)
glabel L80317C0C
/* 0D2C0C 80317C0C 240E0002 */  li    $t6, 2
/* 0D2C10 80317C10 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D2C14 80317C14 1000000B */  b     .L80317C44
/* 0D2C18 80317C18 A02E0EA3 */   sb    $t6, %lo(D_802212A3)($at)
glabel L80317C1C
/* 0D2C1C 80317C1C 24190003 */  li    $t9, 3
/* 0D2C20 80317C20 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D2C24 80317C24 10000007 */  b     .L80317C44
/* 0D2C28 80317C28 A0390EA3 */   sb    $t9, %lo(D_802212A3)($at)
glabel L80317C2C
/* 0D2C2C 80317C2C 24180004 */  li    $t8, 4
/* 0D2C30 80317C30 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D2C34 80317C34 10000003 */  b     .L80317C44
/* 0D2C38 80317C38 A0380EA3 */   sb    $t8, %lo(D_802212A3)($at)
glabel L80317C3C
.L80317C3C:
/* 0D2C3C 80317C3C 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D2C40 80317C40 A0200EA3 */  sb    $zero, %lo(D_802212A3)($at)
.L80317C44:
/* 0D2C44 80317C44 910C0005 */  lbu   $t4, 5($t0)
/* 0D2C48 80317C48 3C018022 */  lui   $at, %hi(D_802212A0) # $at, 0x8022
/* 0D2C4C 80317C4C 3C198033 */  lui   $t9, %hi(gTatumsPerBeat) # $t9, 0x8033
/* 0D2C50 80317C50 A12C0000 */  sb    $t4, ($t1)
/* 0D2C54 80317C54 950D000A */  lhu   $t5, 0xa($t0)
/* 0D2C58 80317C58 87394FF4 */  lh    $t9, %lo(gTatumsPerBeat)($t9)
/* 0D2C5C 80317C5C 240C0001 */  li    $t4, 1
/* 0D2C60 80317C60 A42D0EA0 */  sh    $t5, %lo(D_802212A0)($at)
/* 0D2C64 80317C64 8D420000 */  lw    $v0, ($t2)
/* 0D2C68 80317C68 3C018022 */  lui   $at, %hi(gMinAiBufferLength) # $at, 0x8022
/* 0D2C6C 80317C6C 44998000 */  mtc1  $t9, $f16
/* 0D2C70 80317C70 244FFFF0 */  addiu $t7, $v0, -0x10
/* 0D2C74 80317C74 AC2F6B78 */  sw    $t7, %lo(gMinAiBufferLength)($at)
/* 0D2C78 80317C78 240100A0 */  li    $at, 160
/* 0D2C7C 80317C7C 0041001A */  div   $zero, $v0, $at
/* 0D2C80 80317C80 00001812 */  mflo  $v1
/* 0D2C84 80317C84 24630001 */  addiu $v1, $v1, 1
/* 0D2C88 80317C88 00032E00 */  sll   $a1, $v1, 0x18
/* 0D2C8C 80317C8C 00057603 */  sra   $t6, $a1, 0x18
/* 0D2C90 80317C90 01C02825 */  move  $a1, $t6
/* 0D2C94 80317C94 44852000 */  mtc1  $a1, $f4
/* 0D2C98 80317C98 3C018022 */  lui   $at, %hi(gAudioUpdatesPerFrame) # $at, 0x8022
/* 0D2C9C 80317C9C A0236B7E */  sb    $v1, %lo(gAudioUpdatesPerFrame)($at)
/* 0D2CA0 80317CA0 468021A0 */  cvt.s.w $f6, $f4
/* 0D2CA4 80317CA4 3C018034 */  lui   $at, %hi(D_U_80338E00) # $at, 0x8034
/* 0D2CA8 80317CA8 C4288E00 */  lwc1  $f8, %lo(D_U_80338E00)($at)
/* 0D2CAC 80317CAC 3C018034 */  lui   $at, %hi(D_U_80338E04) # $at, 0x8034
/* 0D2CB0 80317CB0 3C048022 */  lui   $a0, %hi(D_80221898) # $a0, 0x8022
/* 0D2CB4 80317CB4 468084A0 */  cvt.s.w $f18, $f16
/* 0D2CB8 80317CB8 46083282 */  mul.s $f10, $f6, $f8
/* 0D2CBC 80317CBC C4268E04 */  lwc1  $f6, %lo(D_U_80338E04)($at)
/* 0D2CC0 80317CC0 3C138022 */  lui   $s3, %hi(D_80226D6C) # $s3, 0x8022
/* 0D2CC4 80317CC4 26736B6C */  addiu $s3, %lo(D_80226D6C) # addiu $s3, $s3, 0x6b6c
/* 0D2CC8 80317CC8 24841498 */  addiu $a0, %lo(D_80221898) # addiu $a0, $a0, 0x1498
/* 0D2CCC 80317CCC 46125103 */  div.s $f4, $f10, $f18
/* 0D2CD0 80317CD0 46062203 */  div.s $f8, $f4, $f6
/* 0D2CD4 80317CD4 4458F800 */  cfc1  $t8, $31
/* 0D2CD8 80317CD8 44CCF800 */  ctc1  $t4, $31
/* 0D2CDC 80317CDC 00000000 */  nop   
/* 0D2CE0 80317CE0 46004424 */  cvt.w.s $f16, $f8
/* 0D2CE4 80317CE4 444CF800 */  cfc1  $t4, $31
/* 0D2CE8 80317CE8 00000000 */  nop   
/* 0D2CEC 80317CEC 318C0078 */  andi  $t4, $t4, 0x78
/* 0D2CF0 80317CF0 11800012 */  beqz  $t4, .L80317D3C
/* 0D2CF4 80317CF4 3C014F00 */   li    $at, 0x4F000000 # 2147483648.000000
/* 0D2CF8 80317CF8 44818000 */  mtc1  $at, $f16
/* 0D2CFC 80317CFC 240C0001 */  li    $t4, 1
/* 0D2D00 80317D00 46104401 */  sub.s $f16, $f8, $f16
/* 0D2D04 80317D04 44CCF800 */  ctc1  $t4, $31
/* 0D2D08 80317D08 00000000 */  nop   
/* 0D2D0C 80317D0C 46008424 */  cvt.w.s $f16, $f16
/* 0D2D10 80317D10 444CF800 */  cfc1  $t4, $31
/* 0D2D14 80317D14 00000000 */  nop   
/* 0D2D18 80317D18 318C0078 */  andi  $t4, $t4, 0x78
/* 0D2D1C 80317D1C 15800005 */  bnez  $t4, .L80317D34
/* 0D2D20 80317D20 00000000 */   nop   
/* 0D2D24 80317D24 440C8000 */  mfc1  $t4, $f16
/* 0D2D28 80317D28 3C018000 */  lui   $at, 0x8000
/* 0D2D2C 80317D2C 10000007 */  b     .L80317D4C
/* 0D2D30 80317D30 01816025 */   or    $t4, $t4, $at
.L80317D34:
/* 0D2D34 80317D34 10000005 */  b     .L80317D4C
/* 0D2D38 80317D38 240CFFFF */   li    $t4, -1
.L80317D3C:
/* 0D2D3C 80317D3C 440C8000 */  mfc1  $t4, $f16
/* 0D2D40 80317D40 00000000 */  nop   
/* 0D2D44 80317D44 0580FFFB */  bltz  $t4, .L80317D34
/* 0D2D48 80317D48 00000000 */   nop   
.L80317D4C:
/* 0D2D4C 80317D4C 3C018022 */  lui   $at, %hi(gTempoInternalToExternal) # $at, 0x8022
/* 0D2D50 80317D50 A42C6B7C */  sh    $t4, %lo(gTempoInternalToExternal)($at)
/* 0D2D54 80317D54 8D6D0000 */  lw    $t5, ($t3)
/* 0D2D58 80317D58 44D8F800 */  ctc1  $t8, $31
/* 0D2D5C 80317D5C 000D7880 */  sll   $t7, $t5, 2
/* 0D2D60 80317D60 01ED7821 */  addu  $t7, $t7, $t5
/* 0D2D64 80317D64 000F7880 */  sll   $t7, $t7, 2
/* 0D2D68 80317D68 01E50019 */  multu $t7, $a1
/* 0D2D6C 80317D6C 00007012 */  mflo  $t6
/* 0D2D70 80317D70 25D90140 */  addiu $t9, $t6, 0x140
/* 0D2D74 80317D74 AE790000 */  sw    $t9, ($s3)
/* 0D2D78 80317D78 8D0C000C */  lw    $t4, 0xc($t0)
/* 0D2D7C 80317D7C 8D180010 */  lw    $t8, 0x10($t0)
/* 0D2D80 80317D80 8D0F0014 */  lw    $t7, 0x14($t0)
/* 0D2D84 80317D84 8D0D0018 */  lw    $t5, 0x18($t0)
/* 0D2D88 80317D88 3C0E8022 */  lui   $t6, %hi(D_802212A8 + 8) # $t6, 0x8022
/* 0D2D8C 80317D8C 8DCE0EB0 */  lw    $t6, %lo(D_802212A8 + 8)($t6)
/* 0D2D90 80317D90 030C8021 */  addu  $s0, $t8, $t4
/* 0D2D94 80317D94 01AF8821 */  addu  $s1, $t5, $t7
/* 0D2D98 80317D98 02113021 */  addu  $a2, $s0, $s1
/* 0D2D9C 80317D9C 01C63823 */  subu  $a3, $t6, $a2
/* 0D2DA0 80317DA0 24E7FF00 */  addiu $a3, $a3, -0x100
/* 0D2DA4 80317DA4 AC870000 */  sw    $a3, ($a0)
/* 0D2DA8 80317DA8 0C0C5C61 */  jal   func_80316164
/* 0D2DAC 80317DAC AC86000C */   sw    $a2, 0xc($a0)
/* 0D2DB0 80317DB0 3C048022 */  lui   $a0, %hi(D_802218A8) # $a0, 0x8022
/* 0D2DB4 80317DB4 248414A8 */  addiu $a0, %lo(D_802218A8) # addiu $a0, $a0, 0x14a8
/* 0D2DB8 80317DB8 AC900000 */  sw    $s0, ($a0)
/* 0D2DBC 80317DBC 0C0C5C80 */  jal   func_803161E0
/* 0D2DC0 80317DC0 AC910004 */   sw    $s1, 4($a0)
/* 0D2DC4 80317DC4 8FA20038 */  lw    $v0, 0x38($sp)
/* 0D2DC8 80317DC8 3C048022 */  lui   $a0, %hi(D_802218B0) # $a0, 0x8022
/* 0D2DCC 80317DCC 248414B0 */  addiu $a0, %lo(D_802218B0) # addiu $a0, $a0, 0x14b0
/* 0D2DD0 80317DD0 8C59000C */  lw    $t9, 0xc($v0)
/* 0D2DD4 80317DD4 AC990000 */  sw    $t9, ($a0)
/* 0D2DD8 80317DD8 8C580010 */  lw    $t8, 0x10($v0)
/* 0D2DDC 80317DDC AC800008 */  sw    $zero, 8($a0)
/* 0D2DE0 80317DE0 0C0C5C9F */  jal   func_8031625C
/* 0D2DE4 80317DE4 AC980004 */   sw    $t8, 4($a0)
/* 0D2DE8 80317DE8 8FAC0038 */  lw    $t4, 0x38($sp)
/* 0D2DEC 80317DEC 8FAF0038 */  lw    $t7, 0x38($sp)
/* 0D2DF0 80317DF0 3C048022 */  lui   $a0, %hi(D_802218C0) # $a0, 0x8022
/* 0D2DF4 80317DF4 8D8D0014 */  lw    $t5, 0x14($t4)
/* 0D2DF8 80317DF8 248414C0 */  addiu $a0, %lo(D_802218C0) # addiu $a0, $a0, 0x14c0
/* 0D2DFC 80317DFC AC8D0000 */  sw    $t5, ($a0)
/* 0D2E00 80317E00 8DEE0018 */  lw    $t6, 0x18($t7)
/* 0D2E04 80317E04 AC800008 */  sw    $zero, 8($a0)
/* 0D2E08 80317E08 0C0C5CCE */  jal   func_80316318
/* 0D2E0C 80317E0C AC8E0004 */   sw    $t6, 4($a0)
/* 0D2E10 80317E10 0C0C5BA0 */  jal   reset_bank_and_seq_load_status
/* 0D2E14 80317E14 00000000 */   nop   
/* 0D2E18 80317E18 3C108022 */  lui   $s0, %hi(gAudioCmdBuffers) # $s0, 0x8022
/* 0D2E1C 80317E1C 3C128022 */  lui   $s2, %hi(D_802212C8) # $s2, 0x8022
/* 0D2E20 80317E20 3C118022 */  lui   $s1, %hi(gAudioCmdBuffers + 8) # $s1, 0x8022
/* 0D2E24 80317E24 26316B98 */  addiu $s1, %lo(gAudioCmdBuffers + 8) # addiu $s1, $s1, 0x6b98
/* 0D2E28 80317E28 26520EC8 */  addiu $s2, %lo(D_802212C8) # addiu $s2, $s2, 0xec8
/* 0D2E2C 80317E2C 26106B90 */  addiu $s0, %lo(gAudioCmdBuffers) # addiu $s0, $s0, 0x6b90
.L80317E30:
/* 0D2E30 80317E30 8E650000 */  lw    $a1, ($s3)
/* 0D2E34 80317E34 02402025 */  move  $a0, $s2
/* 0D2E38 80317E38 0005C8C0 */  sll   $t9, $a1, 3
/* 0D2E3C 80317E3C 0C0C5C10 */  jal   soundAlloc
/* 0D2E40 80317E40 03202825 */   move  $a1, $t9
/* 0D2E44 80317E44 26100004 */  addiu $s0, $s0, 4
/* 0D2E48 80317E48 1611FFF9 */  bne   $s0, $s1, .L80317E30
/* 0D2E4C 80317E4C AE02FFFC */   sw    $v0, -4($s0)
/* 0D2E50 80317E50 3C058022 */  lui   $a1, %hi(gMaxSimultaneousNotes) # $a1, 0x8022
/* 0D2E54 80317E54 8CA56B70 */  lw    $a1, %lo(gMaxSimultaneousNotes)($a1)
/* 0D2E58 80317E58 02402025 */  move  $a0, $s2
/* 0D2E5C 80317E5C 0005C080 */  sll   $t8, $a1, 2
/* 0D2E60 80317E60 0305C023 */  subu  $t8, $t8, $a1
/* 0D2E64 80317E64 0C0C5C10 */  jal   soundAlloc
/* 0D2E68 80317E68 00182980 */   sll   $a1, $t8, 6
/* 0D2E6C 80317E6C 3C018022 */  lui   $at, %hi(gNotes) # $at, 0x8022
/* 0D2E70 80317E70 0C0C6B6B */  jal   note_init_all
/* 0D2E74 80317E74 AC222610 */   sw    $v0, %lo(gNotes)($at)
/* 0D2E78 80317E78 0C0C68AD */  jal   init_note_free_list
/* 0D2E7C 80317E7C 00000000 */   nop   
/* 0D2E80 80317E80 8FA2002C */  lw    $v0, 0x2c($sp)
/* 0D2E84 80317E84 3C118022 */  lui   $s1, %hi(D_802211B0) # $s1, 0x8022
/* 0D2E88 80317E88 26310DB0 */  addiu $s1, %lo(D_802211B0) # addiu $s1, $s1, 0xdb0
/* 0D2E8C 80317E8C 14400005 */  bnez  $v0, .L80317EA4
/* 0D2E90 80317E90 240C0008 */   li    $t4, 8
/* 0D2E94 80317E94 3C118022 */  lui   $s1, %hi(D_802211B0) # $s1, 0x8022
/* 0D2E98 80317E98 26310DB0 */  addiu $s1, %lo(D_802211B0) # addiu $s1, $s1, 0xdb0
/* 0D2E9C 80317E9C 10000051 */  b     .L80317FE4
/* 0D2EA0 80317EA0 A2200001 */   sb    $zero, 1($s1)
.L80317EA4:
/* 0D2EA4 80317EA4 00028040 */  sll   $s0, $v0, 1
/* 0D2EA8 80317EA8 A22C0001 */  sb    $t4, 1($s1)
/* 0D2EAC 80317EAC 02002825 */  move  $a1, $s0
/* 0D2EB0 80317EB0 0C0C5C10 */  jal   soundAlloc
/* 0D2EB4 80317EB4 02402025 */   move  $a0, $s2
/* 0D2EB8 80317EB8 AE220014 */  sw    $v0, 0x14($s1)
/* 0D2EBC 80317EBC 02402025 */  move  $a0, $s2
/* 0D2EC0 80317EC0 0C0C5C10 */  jal   soundAlloc
/* 0D2EC4 80317EC4 02002825 */   move  $a1, $s0
/* 0D2EC8 80317EC8 8FAD002C */  lw    $t5, 0x2c($sp)
/* 0D2ECC 80317ECC 8FAF0038 */  lw    $t7, 0x38($sp)
/* 0D2ED0 80317ED0 AE220018 */  sw    $v0, 0x18($s1)
/* 0D2ED4 80317ED4 AE200008 */  sw    $zero, 8($s1)
/* 0D2ED8 80317ED8 AE20000C */  sw    $zero, 0xc($s1)
/* 0D2EDC 80317EDC A2200003 */  sb    $zero, 3($s1)
/* 0D2EE0 80317EE0 AE2D0010 */  sw    $t5, 0x10($s1)
/* 0D2EE4 80317EE4 95EE0008 */  lhu   $t6, 8($t7)
/* 0D2EE8 80317EE8 24190002 */  li    $t9, 2
/* 0D2EEC 80317EEC A2390002 */  sb    $t9, 2($s1)
/* 0D2EF0 80317EF0 3C038022 */  lui   $v1, %hi(D_802212A2) # $v1, 0x8022
/* 0D2EF4 80317EF4 A62E0004 */  sh    $t6, 4($s1)
/* 0D2EF8 80317EF8 80630EA2 */  lb    $v1, %lo(D_802212A2)($v1)
/* 0D2EFC 80317EFC 24010001 */  li    $at, 1
/* 0D2F00 80317F00 24180001 */  li    $t8, 1
/* 0D2F04 80317F04 10610037 */  beq   $v1, $at, .L80317FE4
/* 0D2F08 80317F08 340C8000 */   li    $t4, 32768
/* 0D2F0C 80317F0C 0183001A */  div   $zero, $t4, $v1
/* 0D2F10 80317F10 00006812 */  mflo  $t5
/* 0D2F14 80317F14 A2380000 */  sb    $t8, ($s1)
/* 0D2F18 80317F18 14600002 */  bnez  $v1, .L80317F24
/* 0D2F1C 80317F1C 00000000 */   nop   
/* 0D2F20 80317F20 0007000D */  break 7
.L80317F24:
/* 0D2F24 80317F24 2401FFFF */  li    $at, -1
/* 0D2F28 80317F28 14610004 */  bne   $v1, $at, .L80317F3C
/* 0D2F2C 80317F2C 3C018000 */   lui   $at, 0x8000
/* 0D2F30 80317F30 15810002 */  bne   $t4, $at, .L80317F3C
/* 0D2F34 80317F34 00000000 */   nop   
/* 0D2F38 80317F38 0006000D */  break 6
.L80317F3C:
/* 0D2F3C 80317F3C A62D0006 */  sh    $t5, 6($s1)
/* 0D2F40 80317F40 02402025 */  move  $a0, $s2
/* 0D2F44 80317F44 24050020 */  li    $a1, 32
/* 0D2F48 80317F48 0C0C5C10 */  jal   soundAlloc
/* 0D2F4C 80317F4C 00008025 */   move  $s0, $zero
/* 0D2F50 80317F50 AE22001C */  sw    $v0, 0x1c($s1)
/* 0D2F54 80317F54 02402025 */  move  $a0, $s2
/* 0D2F58 80317F58 0C0C5C10 */  jal   soundAlloc
/* 0D2F5C 80317F5C 24050020 */   li    $a1, 32
/* 0D2F60 80317F60 AE220020 */  sw    $v0, 0x20($s1)
/* 0D2F64 80317F64 02402025 */  move  $a0, $s2
/* 0D2F68 80317F68 0C0C5C10 */  jal   soundAlloc
/* 0D2F6C 80317F6C 24050020 */   li    $a1, 32
/* 0D2F70 80317F70 AE220024 */  sw    $v0, 0x24($s1)
/* 0D2F74 80317F74 02402025 */  move  $a0, $s2
/* 0D2F78 80317F78 0C0C5C10 */  jal   soundAlloc
/* 0D2F7C 80317F7C 24050020 */   li    $a1, 32
/* 0D2F80 80317F80 AE220028 */  sw    $v0, 0x28($s1)
/* 0D2F84 80317F84 3C0F8022 */  lui   $t7, %hi(gAudioUpdatesPerFrame) # $t7, 0x8022
/* 0D2F88 80317F88 81EF6B7E */  lb    $t7, %lo(gAudioUpdatesPerFrame)($t7)
/* 0D2F8C 80317F8C 3C118022 */  lui   $s1, %hi(D_802211B0) # $s1, 0x8022
/* 0D2F90 80317F90 26310DB0 */  addiu $s1, %lo(D_802211B0) # addiu $s1, $s1, 0xdb0
/* 0D2F94 80317F94 19E00013 */  blez  $t7, .L80317FE4
/* 0D2F98 80317F98 02402025 */   move  $a0, $s2
.L80317F9C:
/* 0D2F9C 80317F9C 0C0C5C10 */  jal   soundAlloc
/* 0D2FA0 80317FA0 24050280 */   li    $a1, 640
/* 0D2FA4 80317FA4 244E0140 */  addiu $t6, $v0, 0x140
/* 0D2FA8 80317FA8 AE220030 */  sw    $v0, 0x30($s1)
/* 0D2FAC 80317FAC AE2E0034 */  sw    $t6, 0x34($s1)
/* 0D2FB0 80317FB0 02402025 */  move  $a0, $s2
/* 0D2FB4 80317FB4 0C0C5C10 */  jal   soundAlloc
/* 0D2FB8 80317FB8 24050280 */   li    $a1, 640
/* 0D2FBC 80317FBC 24590140 */  addiu $t9, $v0, 0x140
/* 0D2FC0 80317FC0 3C188022 */  lui   $t8, %hi(gAudioUpdatesPerFrame) # $t8, 0x8022
/* 0D2FC4 80317FC4 AE220080 */  sw    $v0, 0x80($s1)
/* 0D2FC8 80317FC8 AE390084 */  sw    $t9, 0x84($s1)
/* 0D2FCC 80317FCC 83186B7E */  lb    $t8, %lo(gAudioUpdatesPerFrame)($t8)
/* 0D2FD0 80317FD0 26100001 */  addiu $s0, $s0, 1
/* 0D2FD4 80317FD4 26310014 */  addiu $s1, $s1, 0x14
/* 0D2FD8 80317FD8 0218082A */  slt   $at, $s0, $t8
/* 0D2FDC 80317FDC 5420FFEF */  bnezl $at, .L80317F9C
/* 0D2FE0 80317FE0 02402025 */   move  $a0, $s2
.L80317FE4:
/* 0D2FE4 80317FE4 3C048022 */  lui   $a0, %hi(gMaxSimultaneousNotes) # $a0, 0x8022
/* 0D2FE8 80317FE8 0C0C618D */  jal   func_8031758C
/* 0D2FEC 80317FEC 8C846B70 */   lw    $a0, %lo(gMaxSimultaneousNotes)($a0)
/* 0D2FF0 80317FF0 0C0C8BD0 */  jal   osWritebackDCacheAll
/* 0D2FF4 80317FF4 00000000 */   nop   
/* 0D2FF8 80317FF8 3C0C8033 */  lui   $t4, %hi(gAudioLoadLock) # $t4, 0x8033
/* 0D2FFC 80317FFC 258C5004 */  addiu $t4, %lo(gAudioLoadLock) # addiu $t4, $t4, 0x5004
/* 0D3000 80318000 8D8D0000 */  lw    $t5, ($t4)
/* 0D3004 80318004 3C0F7655 */  lui   $t7, (0x76557364 >> 16) # lui $t7, 0x7655
/* 0D3008 80318008 35EF7364 */  ori   $t7, (0x76557364 & 0xFFFF) # ori $t7, $t7, 0x7364
/* 0D300C 8031800C 51A00003 */  beql  $t5, $zero, .L8031801C
/* 0D3010 80318010 8FBF0024 */   lw    $ra, 0x24($sp)
/* 0D3014 80318014 AD8F0000 */  sw    $t7, ($t4)
/* 0D3018 80318018 8FBF0024 */  lw    $ra, 0x24($sp)
.L8031801C:
/* 0D301C 8031801C 8FB00014 */  lw    $s0, 0x14($sp)
/* 0D3020 80318020 8FB10018 */  lw    $s1, 0x18($sp)
/* 0D3024 80318024 8FB2001C */  lw    $s2, 0x1c($sp)
/* 0D3028 80318028 8FB30020 */  lw    $s3, 0x20($sp)
/* 0D302C 8031802C 03E00008 */  jr    $ra
/* 0D3030 80318030 27BD0038 */   addiu $sp, $sp, 0x38
