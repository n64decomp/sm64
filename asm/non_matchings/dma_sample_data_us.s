glabel dma_sample_data
/* 0D3300 80318300 27BDFF90 */  addiu $sp, $sp, -0x70
/* 0D3304 80318304 AFBE0040 */  sw    $fp, 0x40($sp)
/* 0D3308 80318308 AFB1003C */  sw    $s1, 0x3c($sp)
/* 0D330C 8031830C AFB00038 */  sw    $s0, 0x38($sp)
/* 0D3310 80318310 00A08025 */  move  $s0, $a1
/* 0D3314 80318314 00808825 */  move  $s1, $a0
/* 0D3318 80318318 03A0F025 */  move  $fp, $sp
/* 0D331C 8031831C AFBF0044 */  sw    $ra, 0x44($sp)
/* 0D3320 80318320 AFA60078 */  sw    $a2, 0x78($sp)
/* 0D3324 80318324 AFA7007C */  sw    $a3, 0x7c($sp)
/* 0D3328 80318328 14C0000A */  bnez  $a2, .L80318354
/* 0D332C 8031832C 00005025 */   move  $t2, $zero
/* 0D3330 80318330 8FCF007C */  lw    $t7, 0x7c($fp)
/* 0D3334 80318334 3C188022 */  lui   $t8, %hi(sSampleDmaListSize1) # $t8, 0x8022
/* 0D3338 80318338 8F18693C */  lw    $t8, %lo(sSampleDmaListSize1)($t8)
/* 0D333C 8031833C 91E40000 */  lbu   $a0, ($t7)
/* 0D3340 80318340 3C068022 */  lui   $a2, %hi(sSampleDmas) # $a2, 0x8022
/* 0D3344 80318344 24C66338 */  addiu $a2, %lo(sSampleDmas) # addiu $a2, $a2, 0x6338
/* 0D3348 80318348 0098082B */  sltu  $at, $a0, $t8
/* 0D334C 8031834C 14200052 */  bnez  $at, .L80318498
/* 0D3350 80318350 00046100 */   sll   $t4, $a0, 4
.L80318354:
/* 0D3354 80318354 3C048022 */  lui   $a0, %hi(sSampleDmaListSize1) # $a0, 0x8022
/* 0D3358 80318358 3C058022 */  lui   $a1, %hi(gSampleDmaNumListItems) # $a1, 0x8022
/* 0D335C 8031835C 8CA56938 */  lw    $a1, %lo(gSampleDmaNumListItems)($a1)
/* 0D3360 80318360 8C84693C */  lw    $a0, %lo(sSampleDmaListSize1)($a0)
/* 0D3364 80318364 3C068022 */  lui   $a2, %hi(sSampleDmas) # $a2, 0x8022
/* 0D3368 80318368 24C66338 */  addiu $a2, %lo(sSampleDmas) # addiu $a2, $a2, 0x6338
/* 0D336C 8031836C 0085082B */  sltu  $at, $a0, $a1
/* 0D3370 80318370 10200032 */  beqz  $at, .L8031843C
/* 0D3374 80318374 0004C900 */   sll   $t9, $a0, 4
.L80318378:
/* 0D3378 80318378 00D91821 */  addu  $v1, $a2, $t9
/* 0D337C 8031837C 8C6C0004 */  lw    $t4, 4($v1)
/* 0D3380 80318380 00604025 */  move  $t0, $v1
/* 0D3384 80318384 022C1023 */  subu  $v0, $s1, $t4
/* 0D3388 80318388 04420028 */  bltzl $v0, .L8031842C
/* 0D338C 8031838C 24840001 */   addiu $a0, $a0, 1
/* 0D3390 80318390 946D000A */  lhu   $t5, 0xa($v1)
/* 0D3394 80318394 01B07023 */  subu  $t6, $t5, $s0
/* 0D3398 80318398 01C2082B */  sltu  $at, $t6, $v0
/* 0D339C 8031839C 54200023 */  bnezl $at, .L8031842C
/* 0D33A0 803183A0 24840001 */   addiu $a0, $a0, 1
/* 0D33A4 803183A4 906F000E */  lbu   $t7, 0xe($v1)
/* 0D33A8 803183A8 3C098022 */  lui   $t1, %hi(sSampleDmaReuseQueueTail2) # $t1, 0x8022
/* 0D33AC 803183AC 25296B49 */  addiu $t1, %lo(sSampleDmaReuseQueueTail2) # addiu $t1, $t1, 0x6b49
/* 0D33B0 803183B0 15E00014 */  bnez  $t7, .L80318404
/* 0D33B4 803183B4 3C188022 */   lui   $t8, %hi(sSampleDmaReuseQueueHead2) # $t8, 0x8022
/* 0D33B8 803183B8 91250000 */  lbu   $a1, ($t1)
/* 0D33BC 803183BC 93186B4B */  lbu   $t8, %lo(sSampleDmaReuseQueueHead2)($t8)
/* 0D33C0 803183C0 53050011 */  beql  $t8, $a1, .L80318408
/* 0D33C4 803183C4 240C003C */   li    $t4, 60
/* 0D33C8 803183C8 9067000D */  lbu   $a3, 0xd($v1)
/* 0D33CC 803183CC 3C0B8022 */  lui   $t3, %hi(sSampleDmaReuseQueue2) # $t3, 0x8022
/* 0D33D0 803183D0 256B6A48 */  addiu $t3, %lo(sSampleDmaReuseQueue2) # addiu $t3, $t3, 0x6a48
/* 0D33D4 803183D4 10A70009 */  beq   $a1, $a3, .L803183FC
/* 0D33D8 803183D8 01651021 */   addu  $v0, $t3, $a1
/* 0D33DC 803183DC 90590000 */  lbu   $t9, ($v0)
/* 0D33E0 803183E0 01676021 */  addu  $t4, $t3, $a3
/* 0D33E4 803183E4 A1990000 */  sb    $t9, ($t4)
/* 0D33E8 803183E8 904E0000 */  lbu   $t6, ($v0)
/* 0D33EC 803183EC 906D000D */  lbu   $t5, 0xd($v1)
/* 0D33F0 803183F0 000E7900 */  sll   $t7, $t6, 4
/* 0D33F4 803183F4 00CFC021 */  addu  $t8, $a2, $t7
/* 0D33F8 803183F8 A30D000D */  sb    $t5, 0xd($t8)
.L803183FC:
/* 0D33FC 803183FC 24B90001 */  addiu $t9, $a1, 1
/* 0D3400 80318400 A1390000 */  sb    $t9, ($t1)
.L80318404:
/* 0D3404 80318404 240C003C */  li    $t4, 60
.L80318408:
/* 0D3408 80318408 A06C000E */  sb    $t4, 0xe($v1)
/* 0D340C 8031840C 8FCE007C */  lw    $t6, 0x7c($fp)
/* 0D3410 80318410 A1C40000 */  sb    $a0, ($t6)
/* 0D3414 80318414 8C6F0004 */  lw    $t7, 4($v1)
/* 0D3418 80318418 8C780000 */  lw    $t8, ($v1)
/* 0D341C 8031841C 022F6823 */  subu  $t5, $s1, $t7
/* 0D3420 80318420 1000007D */  b     .L80318618
/* 0D3424 80318424 01B81021 */   addu  $v0, $t5, $t8
/* 0D3428 80318428 24840001 */  addiu $a0, $a0, 1
.L8031842C:
/* 0D342C 8031842C 0085082B */  sltu  $at, $a0, $a1
/* 0D3430 80318430 5420FFD1 */  bnezl $at, .L80318378
/* 0D3434 80318434 0004C900 */   sll   $t9, $a0, 4
/* 0D3438 80318438 AFC80068 */  sw    $t0, 0x68($fp)
.L8031843C:
/* 0D343C 8031843C 3C098022 */  lui   $t1, %hi(sSampleDmaReuseQueueTail2) # $t1, 0x8022
/* 0D3440 80318440 25296B49 */  addiu $t1, %lo(sSampleDmaReuseQueueTail2) # addiu $t1, $t1, 0x6b49
/* 0D3444 80318444 3C198022 */  lui   $t9, %hi(sSampleDmaReuseQueueHead2) # $t9, 0x8022
/* 0D3448 80318448 93396B4B */  lbu   $t9, %lo(sSampleDmaReuseQueueHead2)($t9)
/* 0D344C 8031844C 91250000 */  lbu   $a1, ($t1)
/* 0D3450 80318450 3C068022 */  lui   $a2, %hi(sSampleDmas) # $a2, 0x8022
/* 0D3454 80318454 24C66338 */  addiu $a2, %lo(sSampleDmas) # addiu $a2, $a2, 0x6338
/* 0D3458 80318458 13250035 */  beq   $t9, $a1, .L80318530
/* 0D345C 8031845C 8FC80068 */   lw    $t0, 0x68($fp)
/* 0D3460 80318460 8FCC0078 */  lw    $t4, 0x78($fp)
/* 0D3464 80318464 3C0B8022 */  lui   $t3, %hi(sSampleDmaReuseQueue2) # $t3, 0x8022
/* 0D3468 80318468 256B6A48 */  addiu $t3, %lo(sSampleDmaReuseQueue2) # addiu $t3, $t3, 0x6a48
/* 0D346C 8031846C 11800030 */  beqz  $t4, .L80318530
/* 0D3470 80318470 01657021 */   addu  $t6, $t3, $a1
/* 0D3474 80318474 91CF0000 */  lbu   $t7, ($t6)
/* 0D3478 80318478 24AD0001 */  addiu $t5, $a1, 1
/* 0D347C 8031847C 240A0001 */  li    $t2, 1
/* 0D3480 80318480 AFCF0058 */  sw    $t7, 0x58($fp)
/* 0D3484 80318484 A12D0000 */  sb    $t5, ($t1)
/* 0D3488 80318488 8FD80058 */  lw    $t8, 0x58($fp)
/* 0D348C 8031848C 0018C900 */  sll   $t9, $t8, 4
/* 0D3490 80318490 10000027 */  b     .L80318530
/* 0D3494 80318494 00D94021 */   addu  $t0, $a2, $t9
.L80318498:
/* 0D3498 80318498 01864021 */  addu  $t0, $t4, $a2
/* 0D349C 8031849C 8D0E0004 */  lw    $t6, 4($t0)
/* 0D34A0 803184A0 022E1823 */  subu  $v1, $s1, $t6
/* 0D34A4 803184A4 04600022 */  bltz  $v1, .L80318530
/* 0D34A8 803184A8 00000000 */   nop   
/* 0D34AC 803184AC 950F000A */  lhu   $t7, 0xa($t0)
/* 0D34B0 803184B0 01F06823 */  subu  $t5, $t7, $s0
/* 0D34B4 803184B4 01A3082B */  sltu  $at, $t5, $v1
/* 0D34B8 803184B8 1420001D */  bnez  $at, .L80318530
/* 0D34BC 803184BC 00000000 */   nop   
/* 0D34C0 803184C0 9118000E */  lbu   $t8, 0xe($t0)
/* 0D34C4 803184C4 3C058022 */  lui   $a1, %hi(sSampleDmaReuseQueueTail1) # $a1, 0x8022
/* 0D34C8 803184C8 24A56B48 */  addiu $a1, %lo(sSampleDmaReuseQueueTail1) # addiu $a1, $a1, 0x6b48
/* 0D34CC 803184CC 57000014 */  bnezl $t8, .L80318520
/* 0D34D0 803184D0 8D0D0000 */   lw    $t5, ($t0)
/* 0D34D4 803184D4 90A20000 */  lbu   $v0, ($a1)
/* 0D34D8 803184D8 9104000D */  lbu   $a0, 0xd($t0)
/* 0D34DC 803184DC 3C078022 */  lui   $a3, %hi(sSampleDmaReuseQueue1) # $a3, 0x8022
/* 0D34E0 803184E0 24E76948 */  addiu $a3, %lo(sSampleDmaReuseQueue1) # addiu $a3, $a3, 0x6948
/* 0D34E4 803184E4 10440009 */  beq   $v0, $a0, .L8031850C
/* 0D34E8 803184E8 00E21821 */   addu  $v1, $a3, $v0
/* 0D34EC 803184EC 90790000 */  lbu   $t9, ($v1)
/* 0D34F0 803184F0 00E46021 */  addu  $t4, $a3, $a0
/* 0D34F4 803184F4 A1990000 */  sb    $t9, ($t4)
/* 0D34F8 803184F8 906F0000 */  lbu   $t7, ($v1)
/* 0D34FC 803184FC 910E000D */  lbu   $t6, 0xd($t0)
/* 0D3500 80318500 000F6900 */  sll   $t5, $t7, 4
/* 0D3504 80318504 00CDC021 */  addu  $t8, $a2, $t5
/* 0D3508 80318508 A30E000D */  sb    $t6, 0xd($t8)
.L8031850C:
/* 0D350C 8031850C 24590001 */  addiu $t9, $v0, 1
/* 0D3510 80318510 A0B90000 */  sb    $t9, ($a1)
/* 0D3514 80318514 8D0C0004 */  lw    $t4, 4($t0)
/* 0D3518 80318518 022C1823 */  subu  $v1, $s1, $t4
/* 0D351C 8031851C 8D0D0000 */  lw    $t5, ($t0)
.L80318520:
/* 0D3520 80318520 240F0002 */  li    $t7, 2
/* 0D3524 80318524 A10F000E */  sb    $t7, 0xe($t0)
/* 0D3528 80318528 1000003B */  b     .L80318618
/* 0D352C 8031852C 006D1021 */   addu  $v0, $v1, $t5
.L80318530:
/* 0D3530 80318530 1540000E */  bnez  $t2, .L8031856C
/* 0D3534 80318534 240D0002 */   li    $t5, 2
/* 0D3538 80318538 3C058022 */  lui   $a1, %hi(sSampleDmaReuseQueueTail1) # $a1, 0x8022
/* 0D353C 8031853C 24A56B48 */  addiu $a1, %lo(sSampleDmaReuseQueueTail1) # addiu $a1, $a1, 0x6b48
/* 0D3540 80318540 90A20000 */  lbu   $v0, ($a1)
/* 0D3544 80318544 3C078022 */  lui   $a3, %hi(sSampleDmaReuseQueue1) # $a3, 0x8022
/* 0D3548 80318548 24E76948 */  addiu $a3, %lo(sSampleDmaReuseQueue1) # addiu $a3, $a3, 0x6948
/* 0D354C 8031854C 00E27021 */  addu  $t6, $a3, $v0
/* 0D3550 80318550 91D80000 */  lbu   $t8, ($t6)
/* 0D3554 80318554 24590001 */  addiu $t9, $v0, 1
/* 0D3558 80318558 AFD80058 */  sw    $t8, 0x58($fp)
/* 0D355C 8031855C A0B90000 */  sb    $t9, ($a1)
/* 0D3560 80318560 8FCC0058 */  lw    $t4, 0x58($fp)
/* 0D3564 80318564 000C7900 */  sll   $t7, $t4, 4
/* 0D3568 80318568 00CF4021 */  addu  $t0, $a2, $t7
.L8031856C:
/* 0D356C 8031856C 9510000A */  lhu   $s0, 0xa($t0)
/* 0D3570 80318570 2401FFF0 */  li    $at, -16
/* 0D3574 80318574 02211024 */  and   $v0, $s1, $at
/* 0D3578 80318578 A10D000E */  sb    $t5, 0xe($t0)
/* 0D357C 8031857C AD020004 */  sw    $v0, 4($t0)
/* 0D3580 80318580 8D040000 */  lw    $a0, ($t0)
/* 0D3584 80318584 A5100008 */  sh    $s0, 8($t0)
/* 0D3588 80318588 AFC80068 */  sw    $t0, 0x68($fp)
/* 0D358C 8031858C AFC20048 */  sw    $v0, 0x48($fp)
/* 0D3590 80318590 0C0C90EC */  jal   osInvalDCache
/* 0D3594 80318594 02002825 */   move  $a1, $s0
/* 0D3598 80318598 3C038022 */  lui   $v1, %hi(gCurrAudioFrameDmaCount) # $v1, 0x8022
/* 0D359C 8031859C 24636B84 */  addiu $v1, %lo(gCurrAudioFrameDmaCount) # addiu $v1, $v1, 0x6b84
/* 0D35A0 803185A0 8C620000 */  lw    $v0, ($v1)
/* 0D35A4 803185A4 8FC80068 */  lw    $t0, 0x68($fp)
/* 0D35A8 803185A8 3C0F8022 */  lui   $t7, %hi(gCurrAudioFrameDmaIoMesgBufs) # $t7, 0x8022
/* 0D35AC 803185AC 244E0001 */  addiu $t6, $v0, 1
/* 0D35B0 803185B0 AC6E0000 */  sw    $t6, ($v1)
/* 0D35B4 803185B4 8C780000 */  lw    $t8, ($v1)
/* 0D35B8 803185B8 8D0D0000 */  lw    $t5, ($t0)
/* 0D35BC 803185BC 8FC70048 */  lw    $a3, 0x48($fp)
/* 0D35C0 803185C0 0018C880 */  sll   $t9, $t8, 2
/* 0D35C4 803185C4 0338C821 */  addu  $t9, $t9, $t8
/* 0D35C8 803185C8 0019C880 */  sll   $t9, $t9, 2
/* 0D35CC 803185CC 3C0E8022 */  lui   $t6, %hi(gCurrAudioFrameDmaQueue) # $t6, 0x8022
/* 0D35D0 803185D0 25CE5CE8 */  addiu $t6, %lo(gCurrAudioFrameDmaQueue) # addiu $t6, $t6, 0x5ce8
/* 0D35D4 803185D4 272CFFEC */  addiu $t4, $t9, -0x14
/* 0D35D8 803185D8 25EF5E00 */  addiu $t7, %lo(gCurrAudioFrameDmaIoMesgBufs) # addiu $t7, $t7, 0x5e00
/* 0D35DC 803185DC 018F2021 */  addu  $a0, $t4, $t7
/* 0D35E0 803185E0 AFAE0018 */  sw    $t6, 0x18($sp)
/* 0D35E4 803185E4 AFB00014 */  sw    $s0, 0x14($sp)
/* 0D35E8 803185E8 00002825 */  move  $a1, $zero
/* 0D35EC 803185EC 00003025 */  move  $a2, $zero
/* 0D35F0 803185F0 0C0C9118 */  jal   osPiStartDma
/* 0D35F4 803185F4 AFAD0010 */   sw    $t5, 0x10($sp)
/* 0D35F8 803185F8 8FD80058 */  lw    $t8, 0x58($fp)
/* 0D35FC 803185FC 8FD9007C */  lw    $t9, 0x7c($fp)
/* 0D3600 80318600 8FC80068 */  lw    $t0, 0x68($fp)
/* 0D3604 80318604 A3380000 */  sb    $t8, ($t9)
/* 0D3608 80318608 8D0C0000 */  lw    $t4, ($t0)
/* 0D360C 8031860C 8FCD0048 */  lw    $t5, 0x48($fp)
/* 0D3610 80318610 01917821 */  addu  $t7, $t4, $s1
/* 0D3614 80318614 01ED1023 */  subu  $v0, $t7, $t5
.L80318618:
/* 0D3618 80318618 8FDF0044 */  lw    $ra, 0x44($fp)
/* 0D361C 8031861C 03C0E825 */  move  $sp, $fp
/* 0D3620 80318620 8FD00038 */  lw    $s0, 0x38($fp)
/* 0D3624 80318624 8FD1003C */  lw    $s1, 0x3c($fp)
/* 0D3628 80318628 8FDE0040 */  lw    $fp, 0x40($fp)
/* 0D362C 8031862C 03E00008 */  jr    $ra
/* 0D3630 80318630 27BD0070 */   addiu $sp, $sp, 0x70
