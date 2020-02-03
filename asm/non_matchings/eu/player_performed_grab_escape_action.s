glabel player_performed_grab_escape_action
/* 0D8190 80200000 3C028030 */  lui   $v0, %hi(gPlayer1Controller) # $v0, 0x8030
/* 0D8194 80200004 8C429794 */  lw    $v0, %lo(gPlayer1Controller)($v0)
/* 0D8198 80200008 3C0141F0 */  li    $at, 0x41F00000 # 30.000000
/* 0D819C 8020000C 44812000 */  mtc1  $at, $f4
/* 0D81A0 80200010 C440000C */  lwc1  $f0, 0xc($v0)
/* 0D81A4 80200014 00001825 */  move  $v1, $zero
/* 0D81A8 80200018 3C018039 */  lui   $at, %hi(sGrabReleaseState) # $at, 0x8039
/* 0D81AC 8020001C 4604003C */  c.lt.s $f0, $f4
/* 0D81B0 80200020 3C0E8039 */  lui   $t6, %hi(sGrabReleaseState) # $t6, 0x8039
/* 0D81B4 80200024 45000002 */  bc1f  .L81_80200030
/* 0D81B8 80200028 00000000 */   nop
/* 0D81BC 8020002C AC209C70 */  sw    $zero, %lo(sGrabReleaseState)($at)
.L81_80200030:
/* 0D81C0 80200030 8DCE9C70 */  lw    $t6, %lo(sGrabReleaseState)($t6)
/* 0D81C4 80200034 3C014220 */  li    $at, 0x42200000 # 40.000000
/* 0D81C8 80200038 55C0000B */  bnezl $t6, .L81_80200068
/* 0D81CC 8020003C 94580012 */   lhu   $t8, 0x12($v0)
/* 0D81D0 80200040 44813000 */  mtc1  $at, $f6
/* 0D81D4 80200044 3C018039 */  lui   $at, %hi(sGrabReleaseState) # $at, 0x8039
/* 0D81D8 80200048 240F0001 */  li    $t7, 1
/* 0D81DC 8020004C 4600303C */  c.lt.s $f6, $f0
/* 0D81E0 80200050 00000000 */  nop
/* 0D81E4 80200054 45020004 */  bc1fl .L81_80200068
/* 0D81E8 80200058 94580012 */   lhu   $t8, 0x12($v0)
/* 0D81EC 8020005C AC2F9C70 */  sw    $t7, %lo(sGrabReleaseState)($at)
/* 0D81F0 80200060 24030001 */  li    $v1, 1
/* 0D81F4 80200064 94580012 */  lhu   $t8, 0x12($v0)
.L81_80200068:
/* 0D81F8 80200068 33198000 */  andi  $t9, $t8, 0x8000
/* 0D81FC 8020006C 13200002 */  beqz  $t9, .L81_80200078
/* 0D8200 80200070 00000000 */   nop
/* 0D8204 80200074 24030001 */  li    $v1, 1
.L81_80200078:
/* 0D8208 80200078 03E00008 */  jr    $ra
/* 0D820C 8020007C 00601025 */   move  $v0, $v1
