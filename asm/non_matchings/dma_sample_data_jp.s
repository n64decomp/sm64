glabel dma_sample_data
/* 0D2270 80317270 27BDFFA0 */  addiu $sp, $sp, -0x60
/* 0D2274 80317274 AFBE0040 */  sw    $fp, 0x40($sp)
/* 0D2278 80317278 AFB1003C */  sw    $s1, 0x3c($sp)
/* 0D227C 8031727C AFB00038 */  sw    $s0, 0x38($sp)
/* 0D2280 80317280 00A08025 */  move  $s0, $a1
/* 0D2284 80317284 00808825 */  move  $s1, $a0
/* 0D2288 80317288 03A0F025 */  move  $fp, $sp
/* 0D228C 8031728C AFBF0044 */  sw    $ra, 0x44($sp)
/* 0D2290 80317290 AFA60068 */  sw    $a2, 0x68($sp)
/* 0D2294 80317294 AFA7006C */  sw    $a3, 0x6c($sp)
/* 0D2298 80317298 14C0000A */  bnez  $a2, .L803172C4
/* 0D229C 8031729C 00005825 */   move  $t3, $zero
/* 0D22A0 803172A0 8FCF006C */  lw    $t7, 0x6c($fp)
/* 0D22A4 803172A4 3C188022 */  lui   $t8, %hi(sSampleDmaListSize1) # $t8, 0x8022
/* 0D22A8 803172A8 8F186B3C */  lw    $t8, %lo(sSampleDmaListSize1)($t8)
/* 0D22AC 803172AC 91E40000 */  lbu   $a0, ($t7)
/* 0D22B0 803172B0 3C068022 */  lui   $a2, %hi(sSampleDmas) # $a2, 0x8022
/* 0D22B4 803172B4 24C66538 */  addiu $a2, %lo(sSampleDmas) # addiu $a2, $a2, 0x6538
/* 0D22B8 803172B8 0098082B */  sltu  $at, $a0, $t8
/* 0D22BC 803172BC 14200052 */  bnez  $at, .L80317408
/* 0D22C0 803172C0 0004C100 */   sll   $t8, $a0, 4
.L803172C4:
/* 0D22C4 803172C4 3C048022 */  lui   $a0, %hi(sSampleDmaListSize1) # $a0, 0x8022
/* 0D22C8 803172C8 3C058022 */  lui   $a1, %hi(gSampleDmaNumListItems) # $a1, 0x8022
/* 0D22CC 803172CC 8CA56B38 */  lw    $a1, %lo(gSampleDmaNumListItems)($a1)
/* 0D22D0 803172D0 8C846B3C */  lw    $a0, %lo(sSampleDmaListSize1)($a0)
/* 0D22D4 803172D4 3C068022 */  lui   $a2, %hi(sSampleDmas) # $a2, 0x8022
/* 0D22D8 803172D8 24C66538 */  addiu $a2, %lo(sSampleDmas) # addiu $a2, $a2, 0x6538
/* 0D22DC 803172DC 0085082B */  sltu  $at, $a0, $a1
/* 0D22E0 803172E0 10200032 */  beqz  $at, .L803173AC
/* 0D22E4 803172E4 0004C900 */   sll   $t9, $a0, 4
.L803172E8:
/* 0D22E8 803172E8 00D91821 */  addu  $v1, $a2, $t9
/* 0D22EC 803172EC 8C6D0004 */  lw    $t5, 4($v1)
/* 0D22F0 803172F0 00604025 */  move  $t0, $v1
/* 0D22F4 803172F4 022D1023 */  subu  $v0, $s1, $t5
/* 0D22F8 803172F8 04420028 */  bltzl $v0, .L8031739C
/* 0D22FC 803172FC 24840001 */   addiu $a0, $a0, 1
/* 0D2300 80317300 946E000A */  lhu   $t6, 0xa($v1)
/* 0D2304 80317304 01D07823 */  subu  $t7, $t6, $s0
/* 0D2308 80317308 01E2082B */  sltu  $at, $t7, $v0
/* 0D230C 8031730C 54200023 */  bnezl $at, .L8031739C
/* 0D2310 80317310 24840001 */   addiu $a0, $a0, 1
/* 0D2314 80317314 9078000E */  lbu   $t8, 0xe($v1)
/* 0D2318 80317318 3C098022 */  lui   $t1, %hi(sSampleDmaReuseQueueTail2) # $t1, 0x8022
/* 0D231C 8031731C 25296D49 */  addiu $t1, %lo(sSampleDmaReuseQueueTail2) # addiu $t1, $t1, 0x6d49
/* 0D2320 80317320 17000014 */  bnez  $t8, .L80317374
/* 0D2324 80317324 3C198022 */   lui   $t9, %hi(sSampleDmaReuseQueueHead2) # $t9, 0x8022
/* 0D2328 80317328 91250000 */  lbu   $a1, ($t1)
/* 0D232C 8031732C 93396D4B */  lbu   $t9, %lo(sSampleDmaReuseQueueHead2)($t9)
/* 0D2330 80317330 53250011 */  beql  $t9, $a1, .L80317378
/* 0D2334 80317334 2418003C */   li    $t8, 60
/* 0D2338 80317338 9067000D */  lbu   $a3, 0xd($v1)
/* 0D233C 8031733C 3C0C8022 */  lui   $t4, %hi(sSampleDmaReuseQueue2) # $t4, 0x8022
/* 0D2340 80317340 258C6C48 */  addiu $t4, %lo(sSampleDmaReuseQueue2) # addiu $t4, $t4, 0x6c48
/* 0D2344 80317344 10A70009 */  beq   $a1, $a3, .L8031736C
/* 0D2348 80317348 01851021 */   addu  $v0, $t4, $a1
/* 0D234C 8031734C 904D0000 */  lbu   $t5, ($v0)
/* 0D2350 80317350 01877021 */  addu  $t6, $t4, $a3
/* 0D2354 80317354 A1CD0000 */  sb    $t5, ($t6)
/* 0D2358 80317358 90580000 */  lbu   $t8, ($v0)
/* 0D235C 8031735C 906F000D */  lbu   $t7, 0xd($v1)
/* 0D2360 80317360 0018C900 */  sll   $t9, $t8, 4
/* 0D2364 80317364 00D96821 */  addu  $t5, $a2, $t9
/* 0D2368 80317368 A1AF000D */  sb    $t7, 0xd($t5)
.L8031736C:
/* 0D236C 8031736C 24AE0001 */  addiu $t6, $a1, 1
/* 0D2370 80317370 A12E0000 */  sb    $t6, ($t1)
.L80317374:
/* 0D2374 80317374 2418003C */  li    $t8, 60
.L80317378:
/* 0D2378 80317378 A078000E */  sb    $t8, 0xe($v1)
/* 0D237C 8031737C 8FD9006C */  lw    $t9, 0x6c($fp)
/* 0D2380 80317380 A3240000 */  sb    $a0, ($t9)
/* 0D2384 80317384 8C6F0004 */  lw    $t7, 4($v1)
/* 0D2388 80317388 8C6E0000 */  lw    $t6, ($v1)
/* 0D238C 8031738C 022F6823 */  subu  $t5, $s1, $t7
/* 0D2390 80317390 10000077 */  b     .L80317570
/* 0D2394 80317394 01AE1021 */   addu  $v0, $t5, $t6
/* 0D2398 80317398 24840001 */  addiu $a0, $a0, 1
.L8031739C:
/* 0D239C 8031739C 0085082B */  sltu  $at, $a0, $a1
/* 0D23A0 803173A0 5420FFD1 */  bnezl $at, .L803172E8
/* 0D23A4 803173A4 0004C900 */   sll   $t9, $a0, 4
/* 0D23A8 803173A8 AFC80058 */  sw    $t0, 0x58($fp)
.L803173AC:
/* 0D23AC 803173AC 3C098022 */  lui   $t1, %hi(sSampleDmaReuseQueueTail2) # $t1, 0x8022
/* 0D23B0 803173B0 25296D49 */  addiu $t1, %lo(sSampleDmaReuseQueueTail2) # addiu $t1, $t1, 0x6d49
/* 0D23B4 803173B4 3C188022 */  lui   $t8, %hi(sSampleDmaReuseQueueHead2) # $t8, 0x8022
/* 0D23B8 803173B8 93186D4B */  lbu   $t8, %lo(sSampleDmaReuseQueueHead2)($t8)
/* 0D23BC 803173BC 91250000 */  lbu   $a1, ($t1)
/* 0D23C0 803173C0 3C068022 */  lui   $a2, %hi(sSampleDmas) # $a2, 0x8022
/* 0D23C4 803173C4 24C66538 */  addiu $a2, %lo(sSampleDmas) # addiu $a2, $a2, 0x6538
/* 0D23C8 803173C8 1305000D */  beq   $t8, $a1, .L80317400
/* 0D23CC 803173CC 8FC80058 */   lw    $t0, 0x58($fp)
/* 0D23D0 803173D0 8FD90068 */  lw    $t9, 0x68($fp)
/* 0D23D4 803173D4 3C0C8022 */  lui   $t4, %hi(sSampleDmaReuseQueue2) # $t4, 0x8022
/* 0D23D8 803173D8 258C6C48 */  addiu $t4, %lo(sSampleDmaReuseQueue2) # addiu $t4, $t4, 0x6c48
/* 0D23DC 803173DC 13200008 */  beqz  $t9, .L80317400
/* 0D23E0 803173E0 01857821 */   addu  $t7, $t4, $a1
/* 0D23E4 803173E4 91EA0000 */  lbu   $t2, ($t7)
/* 0D23E8 803173E8 24AD0001 */  addiu $t5, $a1, 1
/* 0D23EC 803173EC A12D0000 */  sb    $t5, ($t1)
/* 0D23F0 803173F0 000A7100 */  sll   $t6, $t2, 4
/* 0D23F4 803173F4 00CE4021 */  addu  $t0, $a2, $t6
/* 0D23F8 803173F8 240B0001 */  li    $t3, 1
/* 0D23FC 803173FC AFCA0048 */  sw    $t2, 0x48($fp)
.L80317400:
/* 0D2400 80317400 10000027 */  b     .L803174A0
/* 0D2404 80317404 00000000 */   nop   
.L80317408:
/* 0D2408 80317408 03064021 */  addu  $t0, $t8, $a2
/* 0D240C 8031740C 8D190004 */  lw    $t9, 4($t0)
/* 0D2410 80317410 02391823 */  subu  $v1, $s1, $t9
/* 0D2414 80317414 04600022 */  bltz  $v1, .L803174A0
/* 0D2418 80317418 00000000 */   nop   
/* 0D241C 8031741C 950F000A */  lhu   $t7, 0xa($t0)
/* 0D2420 80317420 01F06823 */  subu  $t5, $t7, $s0
/* 0D2424 80317424 01A3082B */  sltu  $at, $t5, $v1
/* 0D2428 80317428 1420001D */  bnez  $at, .L803174A0
/* 0D242C 8031742C 00000000 */   nop   
/* 0D2430 80317430 910E000E */  lbu   $t6, 0xe($t0)
/* 0D2434 80317434 3C058022 */  lui   $a1, %hi(sSampleDmaReuseQueueTail1) # $a1, 0x8022
/* 0D2438 80317438 24A56D48 */  addiu $a1, %lo(sSampleDmaReuseQueueTail1) # addiu $a1, $a1, 0x6d48
/* 0D243C 8031743C 55C00014 */  bnezl $t6, .L80317490
/* 0D2440 80317440 8D0F0000 */   lw    $t7, ($t0)
/* 0D2444 80317444 90A20000 */  lbu   $v0, ($a1)
/* 0D2448 80317448 9104000D */  lbu   $a0, 0xd($t0)
/* 0D244C 8031744C 3C078022 */  lui   $a3, %hi(sSampleDmaReuseQueue1) # $a3, 0x8022
/* 0D2450 80317450 24E76B48 */  addiu $a3, %lo(sSampleDmaReuseQueue1) # addiu $a3, $a3, 0x6b48
/* 0D2454 80317454 10440009 */  beq   $v0, $a0, .L8031747C
/* 0D2458 80317458 00E21821 */   addu  $v1, $a3, $v0
/* 0D245C 8031745C 90780000 */  lbu   $t8, ($v1)
/* 0D2460 80317460 00E4C821 */  addu  $t9, $a3, $a0
/* 0D2464 80317464 A3380000 */  sb    $t8, ($t9)
/* 0D2468 80317468 906D0000 */  lbu   $t5, ($v1)
/* 0D246C 8031746C 910F000D */  lbu   $t7, 0xd($t0)
/* 0D2470 80317470 000D7100 */  sll   $t6, $t5, 4
/* 0D2474 80317474 00CEC021 */  addu  $t8, $a2, $t6
/* 0D2478 80317478 A30F000D */  sb    $t7, 0xd($t8)
.L8031747C:
/* 0D247C 8031747C 24590001 */  addiu $t9, $v0, 1
/* 0D2480 80317480 A0B90000 */  sb    $t9, ($a1)
/* 0D2484 80317484 8D0D0004 */  lw    $t5, 4($t0)
/* 0D2488 80317488 022D1823 */  subu  $v1, $s1, $t5
/* 0D248C 8031748C 8D0F0000 */  lw    $t7, ($t0)
.L80317490:
/* 0D2490 80317490 240E0002 */  li    $t6, 2
/* 0D2494 80317494 A10E000E */  sb    $t6, 0xe($t0)
/* 0D2498 80317498 10000035 */  b     .L80317570
/* 0D249C 8031749C 006F1021 */   addu  $v0, $v1, $t7
.L803174A0:
/* 0D24A0 803174A0 1560000C */  bnez  $t3, .L803174D4
/* 0D24A4 803174A4 8FCA0048 */   lw    $t2, 0x48($fp)
/* 0D24A8 803174A8 3C058022 */  lui   $a1, %hi(sSampleDmaReuseQueueTail1) # $a1, 0x8022
/* 0D24AC 803174AC 24A56D48 */  addiu $a1, %lo(sSampleDmaReuseQueueTail1) # addiu $a1, $a1, 0x6d48
/* 0D24B0 803174B0 90A20000 */  lbu   $v0, ($a1)
/* 0D24B4 803174B4 3C078022 */  lui   $a3, %hi(sSampleDmaReuseQueue1) # $a3, 0x8022
/* 0D24B8 803174B8 24E76B48 */  addiu $a3, %lo(sSampleDmaReuseQueue1) # addiu $a3, $a3, 0x6b48
/* 0D24BC 803174BC 00E2C021 */  addu  $t8, $a3, $v0
/* 0D24C0 803174C0 930A0000 */  lbu   $t2, ($t8)
/* 0D24C4 803174C4 24590001 */  addiu $t9, $v0, 1
/* 0D24C8 803174C8 A0B90000 */  sb    $t9, ($a1)
/* 0D24CC 803174CC 000A6900 */  sll   $t5, $t2, 4
/* 0D24D0 803174D0 00CD4021 */  addu  $t0, $a2, $t5
.L803174D4:
/* 0D24D4 803174D4 9502000A */  lhu   $v0, 0xa($t0)
/* 0D24D8 803174D8 2401FFF0 */  li    $at, -16
/* 0D24DC 803174DC 3C098022 */  lui   $t1, %hi(gCurrAudioFrameDmaCount) # $t1, 0x8022
/* 0D24E0 803174E0 240E0002 */  li    $t6, 2
/* 0D24E4 803174E4 02218024 */  and   $s0, $s1, $at
/* 0D24E8 803174E8 25296D84 */  addiu $t1, %lo(gCurrAudioFrameDmaCount) # addiu $t1, $t1, 0x6d84
/* 0D24EC 803174EC A10E000E */  sb    $t6, 0xe($t0)
/* 0D24F0 803174F0 AD100004 */  sw    $s0, 4($t0)
/* 0D24F4 803174F4 A5020008 */  sh    $v0, 8($t0)
/* 0D24F8 803174F8 8D230000 */  lw    $v1, ($t1)
/* 0D24FC 803174FC 3C0E8022 */  lui   $t6, %hi(gCurrAudioFrameDmaIoMesgBufs) # $t6, 0x8022
/* 0D2500 80317500 25CE6000 */  addiu $t6, %lo(gCurrAudioFrameDmaIoMesgBufs) # addiu $t6, $t6, 0x6000
/* 0D2504 80317504 246F0001 */  addiu $t7, $v1, 1
/* 0D2508 80317508 AD2F0000 */  sw    $t7, ($t1)
/* 0D250C 8031750C 8D380000 */  lw    $t8, ($t1)
/* 0D2510 80317510 8D0F0000 */  lw    $t7, ($t0)
/* 0D2514 80317514 AFA20014 */  sw    $v0, 0x14($sp)
/* 0D2518 80317518 0018C880 */  sll   $t9, $t8, 2
/* 0D251C 8031751C 0338C821 */  addu  $t9, $t9, $t8
/* 0D2520 80317520 3C188022 */  lui   $t8, %hi(gCurrAudioFrameDmaQueue) # $t8, 0x8022
/* 0D2524 80317524 27185EE8 */  addiu $t8, %lo(gCurrAudioFrameDmaQueue) # addiu $t8, $t8, 0x5ee8
/* 0D2528 80317528 0019C880 */  sll   $t9, $t9, 2
/* 0D252C 8031752C 272DFFEC */  addiu $t5, $t9, -0x14
/* 0D2530 80317530 AFB80018 */  sw    $t8, 0x18($sp)
/* 0D2534 80317534 AFAF0010 */  sw    $t7, 0x10($sp)
/* 0D2538 80317538 AFCA0048 */  sw    $t2, 0x48($fp)
/* 0D253C 8031753C AFC80058 */  sw    $t0, 0x58($fp)
/* 0D2540 80317540 01AE2021 */  addu  $a0, $t5, $t6
/* 0D2544 80317544 02003825 */  move  $a3, $s0
/* 0D2548 80317548 00002825 */  move  $a1, $zero
/* 0D254C 8031754C 0C0C8D4C */  jal   osPiStartDma
/* 0D2550 80317550 00003025 */   move  $a2, $zero
/* 0D2554 80317554 8FCA0048 */  lw    $t2, 0x48($fp)
/* 0D2558 80317558 8FD9006C */  lw    $t9, 0x6c($fp)
/* 0D255C 8031755C 8FC80058 */  lw    $t0, 0x58($fp)
/* 0D2560 80317560 A32A0000 */  sb    $t2, ($t9)
/* 0D2564 80317564 8D0D0000 */  lw    $t5, ($t0)
/* 0D2568 80317568 01B17021 */  addu  $t6, $t5, $s1
/* 0D256C 8031756C 01D01023 */  subu  $v0, $t6, $s0
.L80317570:
/* 0D2570 80317570 8FDF0044 */  lw    $ra, 0x44($fp)
/* 0D2574 80317574 03C0E825 */  move  $sp, $fp
/* 0D2578 80317578 8FD00038 */  lw    $s0, 0x38($fp)
/* 0D257C 8031757C 8FD1003C */  lw    $s1, 0x3c($fp)
/* 0D2580 80317580 8FDE0040 */  lw    $fp, 0x40($fp)
/* 0D2584 80317584 03E00008 */  jr    $ra
/* 0D2588 80317588 27BD0060 */   addiu $sp, $sp, 0x60
