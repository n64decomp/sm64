
glabel func_802aeeb0
/* 0AEEB0 80200000 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0AEEB4 80200004 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0AEEB8 80200008 0C0BD400 */  jal   __osDisableInt
/* 0AEEBC 8020000C AFA40020 */   sw    $a0, 0x20($sp)
/* 0AEEC0 80200010 3C0F8030 */  lui   $t7, %hi(D_80334914) # $t7, 0x8030
/* 0AEEC4 80200014 8DEF2EE4 */  lw    $t7, %lo(D_80334914)($t7)
/* 0AEEC8 80200018 8FAE0020 */  lw    $t6, 0x20($sp)
/* 0AEECC 8020001C AFA2001C */  sw    $v0, 0x1c($sp)
/* 0AEED0 80200020 3C188030 */  lui   $t8, %hi(D_80334914) # $t8, 0x8030
/* 0AEED4 80200024 ADEE0004 */  sw    $t6, 4($t7)
/* 0AEED8 80200028 8F182EE4 */  lw    $t8, %lo(D_80334914)($t8)
/* 0AEEDC 8020002C 97190000 */  lhu   $t9, ($t8)
/* 0AEEE0 80200030 37280010 */  ori   $t0, $t9, 0x10
/* 0AEEE4 80200034 A7080000 */  sh    $t0, ($t8)
/* 0AEEE8 80200038 0C0BD408 */  jal   __osRestoreInt
/* 0AEEEC 8020003C 8FA4001C */   lw    $a0, 0x1c($sp)
/* 0AEEF0 80200040 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0AEEF4 80200044 27BD0020 */  addiu $sp, $sp, 0x20
/* 0AEEF8 80200048 03E00008 */  jr    $ra
/* 0AEEFC 8020004C 00000000 */   nop

glabel func_802aef00
/* 0AEF00 80200050 3C028030 */  lui   $v0, %hi(D_8033489C)
/* 0AEF04 80200054 03E00008 */  jr    $ra
/* 0AEF08 80200058 8C422EFC */   lw    $v0, %lo(D_8033489C)($v0)

glabel func_802aef0c
/* 0AEF0C 8020005C 00000000 */  nop
/* 0AEF10 80200060 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 0AEF14 80200064 AFBF001C */  sw    $ra, 0x1c($sp)
/* 0AEF18 80200068 AFA40028 */  sw    $a0, 0x28($sp)
/* 0AEF1C 8020006C AFA5002C */  sw    $a1, 0x2c($sp)
/* 0AEF20 80200070 AFA60030 */  sw    $a2, 0x30($sp)
/* 0AEF24 80200074 0C0BD400 */  jal   __osDisableInt
/* 0AEF28 80200078 AFB00018 */   sw    $s0, 0x18($sp)
/* 0AEF2C 8020007C 8FAE0028 */  lw    $t6, 0x28($sp)
/* 0AEF30 80200080 3C188033 */  lui   $t8, %hi(D_80363830) # $t8, 0x8033
/* 0AEF34 80200084 8FA8002C */  lw    $t0, 0x2c($sp)
/* 0AEF38 80200088 271836D0 */  addiu $t8, %lo(D_80363830) # addiu $t8, $t8, 0x36d0
/* 0AEF3C 8020008C 000E78C0 */  sll   $t7, $t6, 3
/* 0AEF40 80200090 01F8C821 */  addu  $t9, $t7, $t8
/* 0AEF44 80200094 AFB90020 */  sw    $t9, 0x20($sp)
/* 0AEF48 80200098 AF280000 */  sw    $t0, ($t9)
/* 0AEF4C 8020009C 8FAA0020 */  lw    $t2, 0x20($sp)
/* 0AEF50 802000A0 8FA90030 */  lw    $t1, 0x30($sp)
/* 0AEF54 802000A4 00408025 */  move  $s0, $v0
/* 0AEF58 802000A8 02002025 */  move  $a0, $s0
/* 0AEF5C 802000AC 0C0BD408 */  jal   __osRestoreInt
/* 0AEF60 802000B0 AD490004 */   sw    $t1, 4($t2)
/* 0AEF64 802000B4 8FBF001C */  lw    $ra, 0x1c($sp)
/* 0AEF68 802000B8 8FB00018 */  lw    $s0, 0x18($sp)
/* 0AEF6C 802000BC 27BD0028 */  addiu $sp, $sp, 0x28
/* 0AEF70 802000C0 03E00008 */  jr    $ra
