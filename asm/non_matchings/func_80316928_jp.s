.late_rodata
glabel jtbl_80337BE0
    .word L80316BD0
    .word L80316BDC
    .word L80316C1C
    .word L80316BEC
    .word L80316C1C
    .word L80316C1C
    .word L80316C1C
    .word L80316BFC
    .word L80316C1C
    .word L80316C1C
    .word L80316C1C
    .word L80316C1C
    .word L80316C1C
    .word L80316C1C
    .word L80316C1C
    .word L80316C0C

.text
glabel func_80316928
/* 0D1928 80316928 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 0D192C 8031692C 3C0E8033 */  lui   $t6, %hi(gAudioLoadLock) # $t6, 0x8033
/* 0D1930 80316930 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0D1934 80316934 AFB30020 */  sw    $s3, 0x20($sp)
/* 0D1938 80316938 AFB2001C */  sw    $s2, 0x1c($sp)
/* 0D193C 8031693C AFB10018 */  sw    $s1, 0x18($sp)
/* 0D1940 80316940 AFB00014 */  sw    $s0, 0x14($sp)
/* 0D1944 80316944 AFA40038 */  sw    $a0, 0x38($sp)
/* 0D1948 80316948 25CE3EF4 */  addiu $t6, %lo(gAudioLoadLock) # addiu $t6, $t6, 0x3ef4
/* 0D194C 8031694C 8DCF0000 */  lw    $t7, ($t6)
/* 0D1950 80316950 51E0007A */  beql  $t7, $zero, .L80316B3C
/* 0D1954 80316954 8FB80038 */   lw    $t8, 0x38($sp)
/* 0D1958 80316958 0C0C5A33 */  jal   func_803168CC
/* 0D195C 8031695C 00000000 */   nop   
/* 0D1960 80316960 3C038022 */  lui   $v1, %hi(gMaxSimultaneousNotes) # $v1, 0x8022
/* 0D1964 80316964 8C636D70 */  lw    $v1, %lo(gMaxSimultaneousNotes)($v1)
/* 0D1968 80316968 00008025 */  move  $s0, $zero
/* 0D196C 8031696C 00002025 */  move  $a0, $zero
/* 0D1970 80316970 18600027 */  blez  $v1, .L80316A10
/* 0D1974 80316974 00008825 */   move  $s1, $zero
/* 0D1978 80316978 3C068022 */  lui   $a2, %hi(gAudioUpdatesPerFrame) # $a2, 0x8022
/* 0D197C 8031697C 3C058022 */  lui   $a1, %hi(gNotes) # $a1, 0x8022
/* 0D1980 80316980 24A52A10 */  addiu $a1, %lo(gNotes) # addiu $a1, $a1, 0x2a10
/* 0D1984 80316984 24C66D7E */  addiu $a2, %lo(gAudioUpdatesPerFrame) # addiu $a2, $a2, 0x6d7e
.L80316988:
/* 0D1988 80316988 8CB80000 */  lw    $t8, ($a1)
/* 0D198C 8031698C 26100001 */  addiu $s0, $s0, 1
/* 0D1990 80316990 03041021 */  addu  $v0, $t8, $a0
/* 0D1994 80316994 8C590000 */  lw    $t9, ($v0)
/* 0D1998 80316998 001967C2 */  srl   $t4, $t9, 0x1f
/* 0D199C 8031699C 5180001A */  beql  $t4, $zero, .L80316A08
/* 0D19A0 803169A0 0203082A */   slt   $at, $s0, $v1
/* 0D19A4 803169A4 904D0055 */  lbu   $t5, 0x55($v0)
/* 0D19A8 803169A8 51A00017 */  beql  $t5, $zero, .L80316A08
/* 0D19AC 803169AC 0203082A */   slt   $at, $s0, $v1
/* 0D19B0 803169B0 80CE0000 */  lb    $t6, ($a2)
/* 0D19B4 803169B4 340F8000 */  li    $t7, 32768
/* 0D19B8 803169B8 3C038022 */  lui   $v1, %hi(gMaxSimultaneousNotes) # $v1, 0x8022
/* 0D19BC 803169BC 01EE001A */  div   $zero, $t7, $t6
/* 0D19C0 803169C0 0000C012 */  mflo  $t8
/* 0D19C4 803169C4 A4580062 */  sh    $t8, 0x62($v0)
/* 0D19C8 803169C8 8CB90000 */  lw    $t9, ($a1)
/* 0D19CC 803169CC 15C00002 */  bnez  $t6, .L803169D8
/* 0D19D0 803169D0 00000000 */   nop   
/* 0D19D4 803169D4 0007000D */  break 7
.L803169D8:
/* 0D19D8 803169D8 2401FFFF */  li    $at, -1
/* 0D19DC 803169DC 15C10004 */  bne   $t6, $at, .L803169F0
/* 0D19E0 803169E0 3C018000 */   lui   $at, 0x8000
/* 0D19E4 803169E4 15E10002 */  bne   $t7, $at, .L803169F0
/* 0D19E8 803169E8 00000000 */   nop   
/* 0D19EC 803169EC 0006000D */  break 6
.L803169F0:
/* 0D19F0 803169F0 03241021 */  addu  $v0, $t9, $a0
/* 0D19F4 803169F4 904C0054 */  lbu   $t4, 0x54($v0)
/* 0D19F8 803169F8 358D0010 */  ori   $t5, $t4, 0x10
/* 0D19FC 803169FC A04D0054 */  sb    $t5, 0x54($v0)
/* 0D1A00 80316A00 8C636D70 */  lw    $v1, %lo(gMaxSimultaneousNotes)($v1)
/* 0D1A04 80316A04 0203082A */  slt   $at, $s0, $v1
.L80316A08:
/* 0D1A08 80316A08 1420FFDF */  bnez  $at, .L80316988
/* 0D1A0C 80316A0C 248400C0 */   addiu $a0, $a0, 0xc0
.L80316A10:
/* 0D1A10 80316A10 0C0C5A3D */  jal   wait_for_audio_frames
/* 0D1A14 80316A14 24040001 */   li    $a0, 1
/* 0D1A18 80316A18 26310001 */  addiu $s1, $s1, 1
/* 0D1A1C 80316A1C 2A2100F1 */  slti  $at, $s1, 0xf1
/* 0D1A20 80316A20 10200013 */  beqz  $at, .L80316A70
/* 0D1A24 80316A24 3C038022 */   lui   $v1, %hi(gMaxSimultaneousNotes) # $v1, 0x8022
/* 0D1A28 80316A28 8C636D70 */  lw    $v1, %lo(gMaxSimultaneousNotes)($v1)
/* 0D1A2C 80316A2C 00008025 */  move  $s0, $zero
/* 0D1A30 80316A30 3C028022 */  lui   $v0, %hi(gNotes) # $v0, 0x8022
/* 0D1A34 80316A34 1860000A */  blez  $v1, .L80316A60
/* 0D1A38 80316A38 00000000 */   nop   
/* 0D1A3C 80316A3C 8C422A10 */  lw    $v0, %lo(gNotes)($v0)
.L80316A40:
/* 0D1A40 80316A40 8C4F0000 */  lw    $t7, ($v0)
/* 0D1A44 80316A44 000F77C2 */  srl   $t6, $t7, 0x1f
/* 0D1A48 80316A48 15C00005 */  bnez  $t6, .L80316A60
/* 0D1A4C 80316A4C 00000000 */   nop   
/* 0D1A50 80316A50 26100001 */  addiu $s0, $s0, 1
/* 0D1A54 80316A54 0203082A */  slt   $at, $s0, $v1
/* 0D1A58 80316A58 1420FFF9 */  bnez  $at, .L80316A40
/* 0D1A5C 80316A5C 244200C0 */   addiu $v0, $v0, 0xc0
.L80316A60:
/* 0D1A60 80316A60 12030003 */  beq   $s0, $v1, .L80316A70
/* 0D1A64 80316A64 00000000 */   nop   
/* 0D1A68 80316A68 1000FFE9 */  b     .L80316A10
/* 0D1A6C 80316A6C 00000000 */   nop   
.L80316A70:
/* 0D1A70 80316A70 0C0C5A33 */  jal   func_803168CC
/* 0D1A74 80316A74 00000000 */   nop   
/* 0D1A78 80316A78 0C0C5A3D */  jal   wait_for_audio_frames
/* 0D1A7C 80316A7C 24040003 */   li    $a0, 3
/* 0D1A80 80316A80 3C181971 */  lui   $t8, (0x19710515 >> 16) # lui $t8, 0x1971
/* 0D1A84 80316A84 3C198033 */  lui   $t9, %hi(gAudioLoadLock) # $t9, 0x8033
/* 0D1A88 80316A88 27393EF4 */  addiu $t9, %lo(gAudioLoadLock) # addiu $t9, $t9, 0x3ef4
/* 0D1A8C 80316A8C 37180515 */  ori   $t8, (0x19710515 & 0xFFFF) # ori $t8, $t8, 0x515
/* 0D1A90 80316A90 AF380000 */  sw    $t8, ($t9)
/* 0D1A94 80316A94 0C0C5A3D */  jal   wait_for_audio_frames
/* 0D1A98 80316A98 24040003 */   li    $a0, 3
/* 0D1A9C 80316A9C 3C138022 */  lui   $s3, %hi(gCurrAudioFrameDmaCount) # $s3, 0x8022
/* 0D1AA0 80316AA0 26736D84 */  addiu $s3, %lo(gCurrAudioFrameDmaCount) # addiu $s3, $s3, 0x6d84
/* 0D1AA4 80316AA4 8E710000 */  lw    $s1, ($s3)
/* 0D1AA8 80316AA8 1A200014 */  blez  $s1, .L80316AFC
/* 0D1AAC 80316AAC 00000000 */   nop   
/* 0D1AB0 80316AB0 3C128022 */  lui   $s2, %hi(gCurrAudioFrameDmaQueue) # $s2, 0x8022
/* 0D1AB4 80316AB4 26525EE8 */  addiu $s2, %lo(gCurrAudioFrameDmaQueue) # addiu $s2, $s2, 0x5ee8
/* 0D1AB8 80316AB8 8E6C0000 */  lw    $t4, ($s3)
.L80316ABC:
/* 0D1ABC 80316ABC 00008025 */  move  $s0, $zero
/* 0D1AC0 80316AC0 1980000C */  blez  $t4, .L80316AF4
/* 0D1AC4 80316AC4 02402025 */   move  $a0, $s2
.L80316AC8:
/* 0D1AC8 80316AC8 00002825 */  move  $a1, $zero
/* 0D1ACC 80316ACC 0C0C8634 */  jal   osRecvMesg
/* 0D1AD0 80316AD0 00003025 */   move  $a2, $zero
/* 0D1AD4 80316AD4 54400003 */  bnezl $v0, .L80316AE4
/* 0D1AD8 80316AD8 8E6D0000 */   lw    $t5, ($s3)
/* 0D1ADC 80316ADC 2631FFFF */  addiu $s1, $s1, -1
/* 0D1AE0 80316AE0 8E6D0000 */  lw    $t5, ($s3)
.L80316AE4:
/* 0D1AE4 80316AE4 26100001 */  addiu $s0, $s0, 1
/* 0D1AE8 80316AE8 020D082A */  slt   $at, $s0, $t5
/* 0D1AEC 80316AEC 5420FFF6 */  bnezl $at, .L80316AC8
/* 0D1AF0 80316AF0 02402025 */   move  $a0, $s2
.L80316AF4:
/* 0D1AF4 80316AF4 5E20FFF1 */  bgtzl $s1, .L80316ABC
/* 0D1AF8 80316AF8 8E6C0000 */   lw    $t4, ($s3)
.L80316AFC:
/* 0D1AFC 80316AFC 3C038022 */  lui   $v1, %hi(gAiBuffers) # $v1, 0x8022
/* 0D1B00 80316B00 3C068022 */  lui   $a2, %hi(gAiBuffers + 0xC) # $a2, 0x8022
/* 0D1B04 80316B04 AE600000 */  sw    $zero, ($s3)
/* 0D1B08 80316B08 24C66E4C */  addiu $a2, %lo(gAiBuffers + 0xC) # addiu $a2, $a2, 0x6e4c
/* 0D1B0C 80316B0C 24636E40 */  addiu $v1, %lo(gAiBuffers) # addiu $v1, $v1, 0x6e40
/* 0D1B10 80316B10 24040A00 */  li    $a0, 2560
/* 0D1B14 80316B14 00001025 */  move  $v0, $zero
.L80316B18:
/* 0D1B18 80316B18 8C6F0000 */  lw    $t7, ($v1)
/* 0D1B1C 80316B1C 01E27021 */  addu  $t6, $t7, $v0
/* 0D1B20 80316B20 24420002 */  addiu $v0, $v0, 2
/* 0D1B24 80316B24 1444FFFC */  bne   $v0, $a0, .L80316B18
/* 0D1B28 80316B28 A5C00000 */   sh    $zero, ($t6)
/* 0D1B2C 80316B2C 24630004 */  addiu $v1, $v1, 4
/* 0D1B30 80316B30 5466FFF9 */  bnel  $v1, $a2, .L80316B18
/* 0D1B34 80316B34 00001025 */   move  $v0, $zero
/* 0D1B38 80316B38 8FB80038 */  lw    $t8, 0x38($sp)
.L80316B3C:
/* 0D1B3C 80316B3C 3C018022 */  lui   $at, %hi(gSampleDmaNumListItems) # $at, 0x8022
/* 0D1B40 80316B40 AC206B38 */  sw    $zero, %lo(gSampleDmaNumListItems)($at)
/* 0D1B44 80316B44 97190006 */  lhu   $t9, 6($t8)
/* 0D1B48 80316B48 AFB9002C */  sw    $t9, 0x2c($sp)
/* 0D1B4C 80316B4C 0C0C9290 */  jal   osAiSetFrequency
/* 0D1B50 80316B50 8F040000 */   lw    $a0, ($t8)
/* 0D1B54 80316B54 2401003C */  li    $at, 60
/* 0D1B58 80316B58 0041001A */  div   $zero, $v0, $at
/* 0D1B5C 80316B5C 8FA80038 */  lw    $t0, 0x38($sp)
/* 0D1B60 80316B60 3C038022 */  lui   $v1, %hi(gAiFrequency) # $v1, 0x8022
/* 0D1B64 80316B64 24636D64 */  addiu $v1, %lo(gAiFrequency) # addiu $v1, $v1, 0x6d64
/* 0D1B68 80316B68 AC620000 */  sw    $v0, ($v1)
/* 0D1B6C 80316B6C 910C0004 */  lbu   $t4, 4($t0)
/* 0D1B70 80316B70 00007812 */  mflo  $t7
/* 0D1B74 80316B74 3C0A8022 */  lui   $t2, %hi(D_80226D74) # $t2, 0x8022
/* 0D1B78 80316B78 3C0B8022 */  lui   $t3, %hi(gMaxSimultaneousNotes) # $t3, 0x8022
/* 0D1B7C 80316B7C 25EE000F */  addiu $t6, $t7, 0xf
/* 0D1B80 80316B80 2401FFF0 */  li    $at, -16
/* 0D1B84 80316B84 256B6D70 */  addiu $t3, %lo(gMaxSimultaneousNotes) # addiu $t3, $t3, 0x6d70
/* 0D1B88 80316B88 254A6D74 */  addiu $t2, %lo(D_80226D74) # addiu $t2, $t2, 0x6d74
/* 0D1B8C 80316B8C 01C1C824 */  and   $t9, $t6, $at
/* 0D1B90 80316B90 AD590000 */  sw    $t9, ($t2)
/* 0D1B94 80316B94 AD6C0000 */  sw    $t4, ($t3)
/* 0D1B98 80316B98 91180005 */  lbu   $t8, 5($t0)
/* 0D1B9C 80316B9C 3C098022 */  lui   $t1, %hi(D_802212A2) # $t1, 0x8022
/* 0D1BA0 80316BA0 252912A2 */  addiu $t1, %lo(D_802212A2) # addiu $t1, $t1, 0x12a2
/* 0D1BA4 80316BA4 A1380000 */  sb    $t8, ($t1)
/* 0D1BA8 80316BA8 812C0000 */  lb    $t4, ($t1)
/* 0D1BAC 80316BAC 258DFFFF */  addiu $t5, $t4, -1
/* 0D1BB0 80316BB0 2DA10010 */  sltiu $at, $t5, 0x10
/* 0D1BB4 80316BB4 10200019 */  beqz  $at, .L80316C1C
/* 0D1BB8 80316BB8 000D6880 */   sll   $t5, $t5, 2
/* 0D1BBC 80316BBC 3C018033 */  lui   $at, %hi(jtbl_80337BE0)
/* 0D1BC0 80316BC0 002D0821 */  addu  $at, $at, $t5
/* 0D1BC4 80316BC4 8C2D7BE0 */  lw    $t5, %lo(jtbl_80337BE0)($at)
/* 0D1BC8 80316BC8 01A00008 */  jr    $t5
/* 0D1BCC 80316BCC 00000000 */   nop   
glabel L80316BD0
/* 0D1BD0 80316BD0 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D1BD4 80316BD4 10000013 */  b     .L80316C24
/* 0D1BD8 80316BD8 A02012A3 */   sb    $zero, %lo(D_802212A3)($at)
glabel L80316BDC
/* 0D1BDC 80316BDC 240F0001 */  li    $t7, 1
/* 0D1BE0 80316BE0 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D1BE4 80316BE4 1000000F */  b     .L80316C24
/* 0D1BE8 80316BE8 A02F12A3 */   sb    $t7, %lo(D_802212A3)($at)
glabel L80316BEC
/* 0D1BEC 80316BEC 240E0002 */  li    $t6, 2
/* 0D1BF0 80316BF0 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D1BF4 80316BF4 1000000B */  b     .L80316C24
/* 0D1BF8 80316BF8 A02E12A3 */   sb    $t6, %lo(D_802212A3)($at)
glabel L80316BFC
/* 0D1BFC 80316BFC 24190003 */  li    $t9, 3
/* 0D1C00 80316C00 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D1C04 80316C04 10000007 */  b     .L80316C24
/* 0D1C08 80316C08 A03912A3 */   sb    $t9, %lo(D_802212A3)($at)
glabel L80316C0C
/* 0D1C0C 80316C0C 24180004 */  li    $t8, 4
/* 0D1C10 80316C10 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D1C14 80316C14 10000003 */  b     .L80316C24
/* 0D1C18 80316C18 A03812A3 */   sb    $t8, %lo(D_802212A3)($at)
.L80316C1C:
glabel L80316C1C
/* 0D1C1C 80316C1C 3C018022 */  lui   $at, %hi(D_802212A3) # $at, 0x8022
/* 0D1C20 80316C20 A02012A3 */  sb    $zero, %lo(D_802212A3)($at)
.L80316C24:
/* 0D1C24 80316C24 910C0005 */  lbu   $t4, 5($t0)
/* 0D1C28 80316C28 3C018022 */  lui   $at, %hi(D_802212A0) # $at, 0x8022
/* 0D1C2C 80316C2C 3C188033 */  lui   $t8, %hi(gTatumsPerBeat) # $t8, 0x8033
/* 0D1C30 80316C30 A12C0000 */  sb    $t4, ($t1)
/* 0D1C34 80316C34 950D000A */  lhu   $t5, 0xa($t0)
/* 0D1C38 80316C38 87183EE4 */  lh    $t8, %lo(gTatumsPerBeat)($t8)
/* 0D1C3C 80316C3C 3C138022 */  lui   $s3, %hi(D_80226D6C) # $s3, 0x8022
/* 0D1C40 80316C40 A42D12A0 */  sh    $t5, %lo(D_802212A0)($at)
/* 0D1C44 80316C44 8D420000 */  lw    $v0, ($t2)
/* 0D1C48 80316C48 3C018022 */  lui   $at, %hi(gMinAiBufferLength) # $at, 0x8022
/* 0D1C4C 80316C4C 26736D6C */  addiu $s3, %lo(D_80226D6C) # addiu $s3, $s3, 0x6d6c
/* 0D1C50 80316C50 244FFFF0 */  addiu $t7, $v0, -0x10
/* 0D1C54 80316C54 AC2F6D78 */  sw    $t7, %lo(gMinAiBufferLength)($at)
/* 0D1C58 80316C58 240100A0 */  li    $at, 160
/* 0D1C5C 80316C5C 0041001A */  div   $zero, $v0, $at
/* 0D1C60 80316C60 00001812 */  mflo  $v1
/* 0D1C64 80316C64 24630001 */  addiu $v1, $v1, 1
/* 0D1C68 80316C68 00032E00 */  sll   $a1, $v1, 0x18
/* 0D1C6C 80316C6C 00057603 */  sra   $t6, $a1, 0x18
/* 0D1C70 80316C70 000EC8C0 */  sll   $t9, $t6, 3
/* 0D1C74 80316C74 032EC823 */  subu  $t9, $t9, $t6
/* 0D1C78 80316C78 0019C940 */  sll   $t9, $t9, 5
/* 0D1C7C 80316C7C 032EC821 */  addu  $t9, $t9, $t6
/* 0D1C80 80316C80 0019C900 */  sll   $t9, $t9, 4
/* 0D1C84 80316C84 0338001A */  div   $zero, $t9, $t8
/* 0D1C88 80316C88 3C018022 */  lui   $at, %hi(gAudioUpdatesPerFrame) # $at, 0x8022
/* 0D1C8C 80316C8C A0236D7E */  sb    $v1, %lo(gAudioUpdatesPerFrame)($at)
/* 0D1C90 80316C90 00006012 */  mflo  $t4
/* 0D1C94 80316C94 01C02825 */  move  $a1, $t6
/* 0D1C98 80316C98 3C048022 */  lui   $a0, %hi(D_80221898) # $a0, 0x8022
/* 0D1C9C 80316C9C 24841898 */  addiu $a0, %lo(D_80221898) # addiu $a0, $a0, 0x1898
/* 0D1CA0 80316CA0 17000002 */  bnez  $t8, .L80316CAC
/* 0D1CA4 80316CA4 00000000 */   nop   
/* 0D1CA8 80316CA8 0007000D */  break 7
.L80316CAC:
/* 0D1CAC 80316CAC 2401FFFF */  li    $at, -1
/* 0D1CB0 80316CB0 17010004 */  bne   $t8, $at, .L80316CC4
/* 0D1CB4 80316CB4 3C018000 */   lui   $at, 0x8000
/* 0D1CB8 80316CB8 17210002 */  bne   $t9, $at, .L80316CC4
/* 0D1CBC 80316CBC 00000000 */   nop   
/* 0D1CC0 80316CC0 0006000D */  break 6
.L80316CC4:
/* 0D1CC4 80316CC4 3C018022 */  lui   $at, %hi(gTempoInternalToExternal) # $at, 0x8022
/* 0D1CC8 80316CC8 A42C6D7C */  sh    $t4, %lo(gTempoInternalToExternal)($at)
/* 0D1CCC 80316CCC 8D6D0000 */  lw    $t5, ($t3)
/* 0D1CD0 80316CD0 000D7880 */  sll   $t7, $t5, 2
/* 0D1CD4 80316CD4 01ED7821 */  addu  $t7, $t7, $t5
/* 0D1CD8 80316CD8 000F7880 */  sll   $t7, $t7, 2
/* 0D1CDC 80316CDC 01E50019 */  multu $t7, $a1
/* 0D1CE0 80316CE0 00007012 */  mflo  $t6
/* 0D1CE4 80316CE4 25D90140 */  addiu $t9, $t6, 0x140
/* 0D1CE8 80316CE8 AE790000 */  sw    $t9, ($s3)
/* 0D1CEC 80316CEC 8D0C000C */  lw    $t4, 0xc($t0)
/* 0D1CF0 80316CF0 8D180010 */  lw    $t8, 0x10($t0)
/* 0D1CF4 80316CF4 8D0F0014 */  lw    $t7, 0x14($t0)
/* 0D1CF8 80316CF8 8D0D0018 */  lw    $t5, 0x18($t0)
/* 0D1CFC 80316CFC 3C0E8022 */  lui   $t6, %hi(D_802212A8 + 8) # $t6, 0x8022
/* 0D1D00 80316D00 8DCE12B0 */  lw    $t6, %lo(D_802212A8 + 8)($t6)
/* 0D1D04 80316D04 030C8021 */  addu  $s0, $t8, $t4
/* 0D1D08 80316D08 01AF8821 */  addu  $s1, $t5, $t7
/* 0D1D0C 80316D0C 02113021 */  addu  $a2, $s0, $s1
/* 0D1D10 80316D10 01C63823 */  subu  $a3, $t6, $a2
/* 0D1D14 80316D14 24E7FF00 */  addiu $a3, $a3, -0x100
/* 0D1D18 80316D18 AC870000 */  sw    $a3, ($a0)
/* 0D1D1C 80316D1C 0C0C5859 */  jal   func_80316164
/* 0D1D20 80316D20 AC86000C */   sw    $a2, 0xc($a0)
/* 0D1D24 80316D24 3C048022 */  lui   $a0, %hi(D_802218A8) # $a0, 0x8022
/* 0D1D28 80316D28 248418A8 */  addiu $a0, %lo(D_802218A8) # addiu $a0, $a0, 0x18a8
/* 0D1D2C 80316D2C AC900000 */  sw    $s0, ($a0)
/* 0D1D30 80316D30 0C0C5878 */  jal   func_803161E0
/* 0D1D34 80316D34 AC910004 */   sw    $s1, 4($a0)
/* 0D1D38 80316D38 8FA20038 */  lw    $v0, 0x38($sp)
/* 0D1D3C 80316D3C 3C048022 */  lui   $a0, %hi(D_802218B0) # $a0, 0x8022
/* 0D1D40 80316D40 248418B0 */  addiu $a0, %lo(D_802218B0) # addiu $a0, $a0, 0x18b0
/* 0D1D44 80316D44 8C59000C */  lw    $t9, 0xc($v0)
/* 0D1D48 80316D48 AC990000 */  sw    $t9, ($a0)
/* 0D1D4C 80316D4C 8C580010 */  lw    $t8, 0x10($v0)
/* 0D1D50 80316D50 AC800008 */  sw    $zero, 8($a0)
/* 0D1D54 80316D54 0C0C5897 */  jal   func_8031625C
/* 0D1D58 80316D58 AC980004 */   sw    $t8, 4($a0)
/* 0D1D5C 80316D5C 8FAC0038 */  lw    $t4, 0x38($sp)
/* 0D1D60 80316D60 8FAF0038 */  lw    $t7, 0x38($sp)
/* 0D1D64 80316D64 3C048022 */  lui   $a0, %hi(D_802218C0) # $a0, 0x8022
/* 0D1D68 80316D68 8D8D0014 */  lw    $t5, 0x14($t4)
/* 0D1D6C 80316D6C 248418C0 */  addiu $a0, %lo(D_802218C0) # addiu $a0, $a0, 0x18c0
/* 0D1D70 80316D70 AC8D0000 */  sw    $t5, ($a0)
/* 0D1D74 80316D74 8DEE0018 */  lw    $t6, 0x18($t7)
/* 0D1D78 80316D78 AC800008 */  sw    $zero, 8($a0)
/* 0D1D7C 80316D7C 0C0C58C6 */  jal   func_80316318
/* 0D1D80 80316D80 AC8E0004 */   sw    $t6, 4($a0)
/* 0D1D84 80316D84 0C0C5798 */  jal   reset_bank_and_seq_load_status
/* 0D1D88 80316D88 00000000 */   nop   
/* 0D1D8C 80316D8C 3C108022 */  lui   $s0, %hi(gAudioCmdBuffers) # $s0, 0x8022
/* 0D1D90 80316D90 3C128022 */  lui   $s2, %hi(D_802212C8) # $s2, 0x8022
/* 0D1D94 80316D94 3C118022 */  lui   $s1, %hi(gAudioCmdBuffers + 8) # $s1, 0x8022
/* 0D1D98 80316D98 26316D98 */  addiu $s1, %lo(gAudioCmdBuffers + 8) # addiu $s1, $s1, 0x6d98
/* 0D1D9C 80316D9C 265212C8 */  addiu $s2, %lo(D_802212C8) # addiu $s2, $s2, 0x12c8
/* 0D1DA0 80316DA0 26106D90 */  addiu $s0, %lo(gAudioCmdBuffers) # addiu $s0, $s0, 0x6d90
.L80316DA4:
/* 0D1DA4 80316DA4 8E650000 */  lw    $a1, ($s3)
/* 0D1DA8 80316DA8 02402025 */  move  $a0, $s2
/* 0D1DAC 80316DAC 0005C8C0 */  sll   $t9, $a1, 3
/* 0D1DB0 80316DB0 0C0C5808 */  jal   soundAlloc
/* 0D1DB4 80316DB4 03202825 */   move  $a1, $t9
/* 0D1DB8 80316DB8 26100004 */  addiu $s0, $s0, 4
/* 0D1DBC 80316DBC 1611FFF9 */  bne   $s0, $s1, .L80316DA4
/* 0D1DC0 80316DC0 AE02FFFC */   sw    $v0, -4($s0)
/* 0D1DC4 80316DC4 3C058022 */  lui   $a1, %hi(gMaxSimultaneousNotes) # $a1, 0x8022
/* 0D1DC8 80316DC8 8CA56D70 */  lw    $a1, %lo(gMaxSimultaneousNotes)($a1)
/* 0D1DCC 80316DCC 02402025 */  move  $a0, $s2
/* 0D1DD0 80316DD0 0005C080 */  sll   $t8, $a1, 2
/* 0D1DD4 80316DD4 0305C023 */  subu  $t8, $t8, $a1
/* 0D1DD8 80316DD8 0C0C5808 */  jal   soundAlloc
/* 0D1DDC 80316DDC 00182980 */   sll   $a1, $t8, 6
/* 0D1DE0 80316DE0 3C018022 */  lui   $at, %hi(gNotes) # $at, 0x8022
/* 0D1DE4 80316DE4 0C0C6750 */  jal   note_init_all
/* 0D1DE8 80316DE8 AC222A10 */   sw    $v0, %lo(gNotes)($at)
/* 0D1DEC 80316DEC 0C0C6492 */  jal   init_note_free_list
/* 0D1DF0 80316DF0 00000000 */   nop   
/* 0D1DF4 80316DF4 8FA2002C */  lw    $v0, 0x2c($sp)
/* 0D1DF8 80316DF8 3C118022 */  lui   $s1, %hi(D_802211B0) # $s1, 0x8022
/* 0D1DFC 80316DFC 263111B0 */  addiu $s1, %lo(D_802211B0) # addiu $s1, $s1, 0x11b0
/* 0D1E00 80316E00 14400005 */  bnez  $v0, .L80316E18
/* 0D1E04 80316E04 240C0008 */   li    $t4, 8
/* 0D1E08 80316E08 3C118022 */  lui   $s1, %hi(D_802211B0) # $s1, 0x8022
/* 0D1E0C 80316E0C 263111B0 */  addiu $s1, %lo(D_802211B0) # addiu $s1, $s1, 0x11b0
/* 0D1E10 80316E10 10000051 */  b     .L80316F58
/* 0D1E14 80316E14 A2200001 */   sb    $zero, 1($s1)
.L80316E18:
/* 0D1E18 80316E18 00028040 */  sll   $s0, $v0, 1
/* 0D1E1C 80316E1C A22C0001 */  sb    $t4, 1($s1)
/* 0D1E20 80316E20 02002825 */  move  $a1, $s0
/* 0D1E24 80316E24 0C0C5808 */  jal   soundAlloc
/* 0D1E28 80316E28 02402025 */   move  $a0, $s2
/* 0D1E2C 80316E2C AE220014 */  sw    $v0, 0x14($s1)
/* 0D1E30 80316E30 02402025 */  move  $a0, $s2
/* 0D1E34 80316E34 0C0C5808 */  jal   soundAlloc
/* 0D1E38 80316E38 02002825 */   move  $a1, $s0
/* 0D1E3C 80316E3C 8FAD002C */  lw    $t5, 0x2c($sp)
/* 0D1E40 80316E40 8FAF0038 */  lw    $t7, 0x38($sp)
/* 0D1E44 80316E44 AE220018 */  sw    $v0, 0x18($s1)
/* 0D1E48 80316E48 AE200008 */  sw    $zero, 8($s1)
/* 0D1E4C 80316E4C AE20000C */  sw    $zero, 0xc($s1)
/* 0D1E50 80316E50 A2200003 */  sb    $zero, 3($s1)
/* 0D1E54 80316E54 AE2D0010 */  sw    $t5, 0x10($s1)
/* 0D1E58 80316E58 95EE0008 */  lhu   $t6, 8($t7)
/* 0D1E5C 80316E5C 24190002 */  li    $t9, 2
/* 0D1E60 80316E60 A2390002 */  sb    $t9, 2($s1)
/* 0D1E64 80316E64 3C038022 */  lui   $v1, %hi(D_802212A2) # $v1, 0x8022
/* 0D1E68 80316E68 A62E0004 */  sh    $t6, 4($s1)
/* 0D1E6C 80316E6C 806312A2 */  lb    $v1, %lo(D_802212A2)($v1)
/* 0D1E70 80316E70 24010001 */  li    $at, 1
/* 0D1E74 80316E74 24180001 */  li    $t8, 1
/* 0D1E78 80316E78 10610037 */  beq   $v1, $at, .L80316F58
/* 0D1E7C 80316E7C 340C8000 */   li    $t4, 32768
/* 0D1E80 80316E80 0183001A */  div   $zero, $t4, $v1
/* 0D1E84 80316E84 00006812 */  mflo  $t5
/* 0D1E88 80316E88 A2380000 */  sb    $t8, ($s1)
/* 0D1E8C 80316E8C 14600002 */  bnez  $v1, .L80316E98
/* 0D1E90 80316E90 00000000 */   nop   
/* 0D1E94 80316E94 0007000D */  break 7
.L80316E98:
/* 0D1E98 80316E98 2401FFFF */  li    $at, -1
/* 0D1E9C 80316E9C 14610004 */  bne   $v1, $at, .L80316EB0
/* 0D1EA0 80316EA0 3C018000 */   lui   $at, 0x8000
/* 0D1EA4 80316EA4 15810002 */  bne   $t4, $at, .L80316EB0
/* 0D1EA8 80316EA8 00000000 */   nop   
/* 0D1EAC 80316EAC 0006000D */  break 6
.L80316EB0:
/* 0D1EB0 80316EB0 A62D0006 */  sh    $t5, 6($s1)
/* 0D1EB4 80316EB4 02402025 */  move  $a0, $s2
/* 0D1EB8 80316EB8 24050020 */  li    $a1, 32
/* 0D1EBC 80316EBC 0C0C5808 */  jal   soundAlloc
/* 0D1EC0 80316EC0 00008025 */   move  $s0, $zero
/* 0D1EC4 80316EC4 AE22001C */  sw    $v0, 0x1c($s1)
/* 0D1EC8 80316EC8 02402025 */  move  $a0, $s2
/* 0D1ECC 80316ECC 0C0C5808 */  jal   soundAlloc
/* 0D1ED0 80316ED0 24050020 */   li    $a1, 32
/* 0D1ED4 80316ED4 AE220020 */  sw    $v0, 0x20($s1)
/* 0D1ED8 80316ED8 02402025 */  move  $a0, $s2
/* 0D1EDC 80316EDC 0C0C5808 */  jal   soundAlloc
/* 0D1EE0 80316EE0 24050020 */   li    $a1, 32
/* 0D1EE4 80316EE4 AE220024 */  sw    $v0, 0x24($s1)
/* 0D1EE8 80316EE8 02402025 */  move  $a0, $s2
/* 0D1EEC 80316EEC 0C0C5808 */  jal   soundAlloc
/* 0D1EF0 80316EF0 24050020 */   li    $a1, 32
/* 0D1EF4 80316EF4 AE220028 */  sw    $v0, 0x28($s1)
/* 0D1EF8 80316EF8 3C0F8022 */  lui   $t7, %hi(gAudioUpdatesPerFrame) # $t7, 0x8022
/* 0D1EFC 80316EFC 81EF6D7E */  lb    $t7, %lo(gAudioUpdatesPerFrame)($t7)
/* 0D1F00 80316F00 3C118022 */  lui   $s1, %hi(D_802211B0) # $s1, 0x8022
/* 0D1F04 80316F04 263111B0 */  addiu $s1, %lo(D_802211B0) # addiu $s1, $s1, 0x11b0
/* 0D1F08 80316F08 19E00013 */  blez  $t7, .L80316F58
/* 0D1F0C 80316F0C 02402025 */   move  $a0, $s2
.L80316F10:
/* 0D1F10 80316F10 0C0C5808 */  jal   soundAlloc
/* 0D1F14 80316F14 24050280 */   li    $a1, 640
/* 0D1F18 80316F18 244E0140 */  addiu $t6, $v0, 0x140
/* 0D1F1C 80316F1C AE220030 */  sw    $v0, 0x30($s1)
/* 0D1F20 80316F20 AE2E0034 */  sw    $t6, 0x34($s1)
/* 0D1F24 80316F24 02402025 */  move  $a0, $s2
/* 0D1F28 80316F28 0C0C5808 */  jal   soundAlloc
/* 0D1F2C 80316F2C 24050280 */   li    $a1, 640
/* 0D1F30 80316F30 24590140 */  addiu $t9, $v0, 0x140
/* 0D1F34 80316F34 3C188022 */  lui   $t8, %hi(gAudioUpdatesPerFrame) # $t8, 0x8022
/* 0D1F38 80316F38 AE220080 */  sw    $v0, 0x80($s1)
/* 0D1F3C 80316F3C AE390084 */  sw    $t9, 0x84($s1)
/* 0D1F40 80316F40 83186D7E */  lb    $t8, %lo(gAudioUpdatesPerFrame)($t8)
/* 0D1F44 80316F44 26100001 */  addiu $s0, $s0, 1
/* 0D1F48 80316F48 26310014 */  addiu $s1, $s1, 0x14
/* 0D1F4C 80316F4C 0218082A */  slt   $at, $s0, $t8
/* 0D1F50 80316F50 5420FFEF */  bnezl $at, .L80316F10
/* 0D1F54 80316F54 02402025 */   move  $a0, $s2
.L80316F58:
/* 0D1F58 80316F58 3C048022 */  lui   $a0, %hi(gMaxSimultaneousNotes) # $a0, 0x8022
/* 0D1F5C 80316F5C 0C0C5D63 */  jal   func_8031758C
/* 0D1F60 80316F60 8C846D70 */   lw    $a0, %lo(gMaxSimultaneousNotes)($a0)
/* 0D1F64 80316F64 0C0C8804 */  jal   osWritebackDCacheAll
/* 0D1F68 80316F68 00000000 */   nop   
/* 0D1F6C 80316F6C 3C0C8033 */  lui   $t4, %hi(gAudioLoadLock) # $t4, 0x8033
/* 0D1F70 80316F70 258C3EF4 */  addiu $t4, %lo(gAudioLoadLock) # addiu $t4, $t4, 0x3ef4
/* 0D1F74 80316F74 8D8D0000 */  lw    $t5, ($t4)
/* 0D1F78 80316F78 3C0F7655 */  lui   $t7, (0x76557364 >> 16) # lui $t7, 0x7655
/* 0D1F7C 80316F7C 35EF7364 */  ori   $t7, (0x76557364 & 0xFFFF) # ori $t7, $t7, 0x7364
/* 0D1F80 80316F80 51A00003 */  beql  $t5, $zero, .L80316F90
/* 0D1F84 80316F84 8FBF0024 */   lw    $ra, 0x24($sp)
/* 0D1F88 80316F88 AD8F0000 */  sw    $t7, ($t4)
/* 0D1F8C 80316F8C 8FBF0024 */  lw    $ra, 0x24($sp)
.L80316F90:
/* 0D1F90 80316F90 8FB00014 */  lw    $s0, 0x14($sp)
/* 0D1F94 80316F94 8FB10018 */  lw    $s1, 0x18($sp)
/* 0D1F98 80316F98 8FB2001C */  lw    $s2, 0x1c($sp)
/* 0D1F9C 80316F9C 8FB30020 */  lw    $s3, 0x20($sp)
/* 0D1FA0 80316FA0 03E00008 */  jr    $ra
/* 0D1FA4 80316FA4 27BD0038 */   addiu $sp, $sp, 0x38
