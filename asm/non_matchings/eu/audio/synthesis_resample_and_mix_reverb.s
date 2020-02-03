glabel synthesis_resample_and_mix_reverb
/* 09F580 802DFD80 27BDFFA0 */  addiu $sp, $sp, -0x60
/* 09F584 802DFD84 AFB10020 */  sw    $s1, 0x20($sp)
/* 09F588 802DFD88 00068C00 */  sll   $s1, $a2, 0x10
/* 09F58C 802DFD8C 00117403 */  sra   $t6, $s1, 0x10
/* 09F590 802DFD90 000EC940 */  sll   $t9, $t6, 5
/* 09F594 802DFD94 032EC821 */  addu  $t9, $t9, $t6
/* 09F598 802DFD98 3C0D8022 */  lui   $t5, %hi(gSynthesisReverbs) # $t5, 0x8022
/* 09F59C 802DFD9C 25ADC1B0 */  addiu $t5, %lo(gSynthesisReverbs) # addiu $t5, $t5, -0x3e50
/* 09F5A0 802DFDA0 0019C8C0 */  sll   $t9, $t9, 3
/* 09F5A4 802DFDA4 01C08825 */  move  $s1, $t6
/* 09F5A8 802DFDA8 032D1821 */  addu  $v1, $t9, $t5
/* 09F5AC 802DFDAC 906E0003 */  lbu   $t6, 3($v1)
/* 09F5B0 802DFDB0 AFA7006C */  sw    $a3, 0x6c($sp)
/* 09F5B4 802DFDB4 00077C00 */  sll   $t7, $a3, 0x10
/* 09F5B8 802DFDB8 000F3C03 */  sra   $a3, $t7, 0x10
/* 09F5BC 802DFDBC 000E7880 */  sll   $t7, $t6, 2
/* 09F5C0 802DFDC0 01EE7823 */  subu  $t7, $t7, $t6
/* 09F5C4 802DFDC4 000F78C0 */  sll   $t7, $t7, 3
/* 09F5C8 802DFDC8 01EE7821 */  addu  $t7, $t7, $t6
/* 09F5CC 802DFDCC AFBF0024 */  sw    $ra, 0x24($sp)
/* 09F5D0 802DFDD0 AFB0001C */  sw    $s0, 0x1c($sp)
/* 09F5D4 802DFDD4 AFA50064 */  sw    $a1, 0x64($sp)
/* 09F5D8 802DFDD8 AFA60068 */  sw    $a2, 0x68($sp)
/* 09F5DC 802DFDDC 3C0D0200 */  lui   $t5, (0x02000740 >> 16) # lui $t5, 0x200
/* 09F5E0 802DFDE0 000F7880 */  sll   $t7, $t7, 2
/* 09F5E4 802DFDE4 35AD0740 */  ori   $t5, (0x02000740 & 0xFFFF) # ori $t5, $t5, 0x740
/* 09F5E8 802DFDE8 240E0280 */  li    $t6, 640
/* 09F5EC 802DFDEC 006FC021 */  addu  $t8, $v1, $t7
/* 09F5F0 802DFDF0 0007C880 */  sll   $t9, $a3, 2
/* 09F5F4 802DFDF4 AC8E0004 */  sw    $t6, 4($a0)
/* 09F5F8 802DFDF8 AC8D0000 */  sw    $t5, ($a0)
/* 09F5FC 802DFDFC 906F0004 */  lbu   $t7, 4($v1)
/* 09F600 802DFE00 0327C821 */  addu  $t9, $t9, $a3
/* 09F604 802DFE04 0019C880 */  sll   $t9, $t9, 2
/* 09F608 802DFE08 03194021 */  addu  $t0, $t8, $t9
/* 09F60C 802DFE0C 24010001 */  li    $at, 1
/* 09F610 802DFE10 25080030 */  addiu $t0, $t0, 0x30
/* 09F614 802DFE14 15E10033 */  bne   $t7, $at, .L80200894
/* 09F618 802DFE18 24900008 */   addiu $s0, $a0, 8
/* 09F61C 802DFE1C 9506000E */  lhu   $a2, 0xe($t0)
/* 09F620 802DFE20 85070010 */  lh    $a3, 0x10($t0)
/* 09F624 802DFE24 AFA8005C */  sw    $t0, 0x5c($sp)
/* 09F628 802DFE28 AFA30028 */  sw    $v1, 0x28($sp)
/* 09F62C 802DFE2C AFB10010 */  sw    $s1, 0x10($sp)
/* 09F630 802DFE30 02002025 */  move  $a0, $s0
/* 09F634 802DFE34 0C0B7E39 */  jal   synthesis_load_reverb_ring_buffer
/* 09F638 802DFE38 24050740 */   li    $a1, 1856
/* 09F63C 802DFE3C 8FA8005C */  lw    $t0, 0x5c($sp)
/* 09F640 802DFE40 00408025 */  move  $s0, $v0
/* 09F644 802DFE44 8FA30028 */  lw    $v1, 0x28($sp)
/* 09F648 802DFE48 85070012 */  lh    $a3, 0x12($t0)
/* 09F64C 802DFE4C 02002025 */  move  $a0, $s0
/* 09F650 802DFE50 00003025 */  move  $a2, $zero
/* 09F654 802DFE54 50E0000A */  beql  $a3, $zero, .L80200830
/* 09F658 802DFE58 3C0A0800 */   lui   $t2, 0x800
/* 09F65C 802DFE5C 85050010 */  lh    $a1, 0x10($t0)
/* 09F660 802DFE60 AFA30028 */  sw    $v1, 0x28($sp)
/* 09F664 802DFE64 AFB10010 */  sw    $s1, 0x10($sp)
/* 09F668 802DFE68 24A50740 */  addiu $a1, $a1, 0x740
/* 09F66C 802DFE6C 30B8FFFF */  andi  $t8, $a1, 0xffff
/* 09F670 802DFE70 0C0B7E39 */  jal   synthesis_load_reverb_ring_buffer
/* 09F674 802DFE74 03002825 */   move  $a1, $t8
/* 09F678 802DFE78 8FA30028 */  lw    $v1, 0x28($sp)
/* 09F67C 802DFE7C 3C0A0800 */  lui   $t2, 0x800
.L80200830:
/* 09F680 802DFE80 24500008 */  addiu $s0, $v0, 8
/* 09F684 802DFE84 24190280 */  li    $t9, 640
/* 09F688 802DFE88 AC590004 */  sw    $t9, 4($v0)
/* 09F68C 802DFE8C AC4A0000 */  sw    $t2, ($v0)
/* 09F690 802DFE90 02002825 */  move  $a1, $s0
/* 09F694 802DFE94 3C0D0C00 */  lui   $t5, (0x0C007FFF >> 16) # lui $t5, 0xc00
/* 09F698 802DFE98 3C0E0740 */  lui   $t6, (0x074004C0 >> 16) # lui $t6, 0x740
/* 09F69C 802DFE9C 35CE04C0 */  ori   $t6, (0x074004C0 & 0xFFFF) # ori $t6, $t6, 0x4c0
/* 09F6A0 802DFEA0 35AD7FFF */  ori   $t5, (0x0C007FFF & 0xFFFF) # ori $t5, $t5, 0x7fff
/* 09F6A4 802DFEA4 ACAD0000 */  sw    $t5, ($a1)
/* 09F6A8 802DFEA8 ACAE0004 */  sw    $t6, 4($a1)
/* 09F6AC 802DFEAC 946F0008 */  lhu   $t7, 8($v1)
/* 09F6B0 802DFEB0 34018000 */  li    $at, 32768
/* 09F6B4 802DFEB4 26100008 */  addiu $s0, $s0, 8
/* 09F6B8 802DFEB8 01E1C021 */  addu  $t8, $t7, $at
/* 09F6BC 802DFEBC 3319FFFF */  andi  $t9, $t8, 0xffff
/* 09F6C0 802DFEC0 3C010C00 */  lui   $at, 0xc00
/* 09F6C4 802DFEC4 02003025 */  move  $a2, $s0
/* 09F6C8 802DFEC8 3C0E0740 */  lui   $t6, (0x07400740 >> 16) # lui $t6, 0x740
/* 09F6CC 802DFECC 35CE0740 */  ori   $t6, (0x07400740 & 0xFFFF) # ori $t6, $t6, 0x740
/* 09F6D0 802DFED0 03216825 */  or    $t5, $t9, $at
/* 09F6D4 802DFED4 ACCD0000 */  sw    $t5, ($a2)
/* 09F6D8 802DFED8 ACCE0004 */  sw    $t6, 4($a2)
/* 09F6DC 802DFEDC 10000078 */  b     .L80200A70
/* 09F6E0 802DFEE0 26100008 */   addiu $s0, $s0, 8
.L80200894:
/* 09F6E4 802DFEE4 8D02000C */  lw    $v0, 0xc($t0)
/* 09F6E8 802DFEE8 850D0010 */  lh    $t5, 0x10($t0)
/* 09F6EC 802DFEEC 2401FFF0 */  li    $at, -16
/* 09F6F0 802DFEF0 304F0007 */  andi  $t7, $v0, 7
/* 09F6F4 802DFEF4 000FC440 */  sll   $t8, $t7, 0x11
/* 09F6F8 802DFEF8 0018CC03 */  sra   $t9, $t8, 0x10
/* 09F6FC 802DFEFC 032D5021 */  addu  $t2, $t9, $t5
/* 09F700 802DFF00 254A000F */  addiu $t2, $t2, 0xf
/* 09F704 802DFF04 03204825 */  move  $t1, $t9
/* 09F708 802DFF08 314EFFF0 */  andi  $t6, $t2, 0xfff0
/* 09F70C 802DFF0C 000E7C00 */  sll   $t7, $t6, 0x10
/* 09F710 802DFF10 000FC403 */  sra   $t8, $t7, 0x10
/* 09F714 802DFF14 03005025 */  move  $t2, $t8
/* 09F718 802DFF18 A7AA0058 */  sh    $t2, 0x58($sp)
/* 09F71C 802DFF1C A7A9005A */  sh    $t1, 0x5a($sp)
/* 09F720 802DFF20 AFA8005C */  sw    $t0, 0x5c($sp)
/* 09F724 802DFF24 AFA30028 */  sw    $v1, 0x28($sp)
/* 09F728 802DFF28 AFB10010 */  sw    $s1, 0x10($sp)
/* 09F72C 802DFF2C 02002025 */  move  $a0, $s0
/* 09F730 802DFF30 24050020 */  li    $a1, 32
/* 09F734 802DFF34 05210003 */  bgez  $t1, .L802008F4
/* 09F738 802DFF38 0009C843 */   sra   $t9, $t1, 1
/* 09F73C 802DFF3C 25210001 */  addiu $at, $t1, 1
/* 09F740 802DFF40 0001C843 */  sra   $t9, $at, 1
.L802008F4:
/* 09F744 802DFF44 00593023 */  subu  $a2, $v0, $t9
/* 09F748 802DFF48 30CDFFFF */  andi  $t5, $a2, 0xffff
/* 09F74C 802DFF4C 01A03025 */  move  $a2, $t5
/* 09F750 802DFF50 0C0B7E39 */  jal   synthesis_load_reverb_ring_buffer
/* 09F754 802DFF54 24070140 */   li    $a3, 320
/* 09F758 802DFF58 8FA8005C */  lw    $t0, 0x5c($sp)
/* 09F75C 802DFF5C 00408025 */  move  $s0, $v0
/* 09F760 802DFF60 8FA30028 */  lw    $v1, 0x28($sp)
/* 09F764 802DFF64 850E0012 */  lh    $t6, 0x12($t0)
/* 09F768 802DFF68 87A9005A */  lh    $t1, 0x5a($sp)
/* 09F76C 802DFF6C 87AA0058 */  lh    $t2, 0x58($sp)
/* 09F770 802DFF70 11C0000D */  beqz  $t6, .L80200958
/* 09F774 802DFF74 02002025 */   move  $a0, $s0
/* 09F778 802DFF78 25450020 */  addiu $a1, $t2, 0x20
/* 09F77C 802DFF7C 30AFFFFF */  andi  $t7, $a1, 0xffff
/* 09F780 802DFF80 24180140 */  li    $t8, 320
/* 09F784 802DFF84 030A3823 */  subu  $a3, $t8, $t2
/* 09F788 802DFF88 01E02825 */  move  $a1, $t7
/* 09F78C 802DFF8C 00003025 */  move  $a2, $zero
/* 09F790 802DFF90 AFB10010 */  sw    $s1, 0x10($sp)
/* 09F794 802DFF94 AFA30028 */  sw    $v1, 0x28($sp)
/* 09F798 802DFF98 0C0B7E39 */  jal   synthesis_load_reverb_ring_buffer
/* 09F79C 802DFF9C A7A9005A */   sh    $t1, 0x5a($sp)
/* 09F7A0 802DFFA0 8FA30028 */  lw    $v1, 0x28($sp)
/* 09F7A4 802DFFA4 87A9005A */  lh    $t1, 0x5a($sp)
.L80200958:
/* 09F7A8 802DFFA8 25390020 */  addiu $t9, $t1, 0x20
/* 09F7AC 802DFFAC 3C0A0800 */  lui   $t2, 0x800
/* 09F7B0 802DFFB0 332DFFFF */  andi  $t5, $t9, 0xffff
/* 09F7B4 802DFFB4 01AA7025 */  or    $t6, $t5, $t2
/* 09F7B8 802DFFB8 AC4E0000 */  sw    $t6, ($v0)
/* 09F7BC 802DFFBC 8FA50064 */  lw    $a1, 0x64($sp)
/* 09F7C0 802DFFC0 3C010740 */  lui   $at, 0x740
/* 09F7C4 802DFFC4 3C0B0500 */  lui   $t3, 0x500
/* 09F7C8 802DFFC8 00057840 */  sll   $t7, $a1, 1
/* 09F7CC 802DFFCC 31E5FFFF */  andi  $a1, $t7, 0xffff
/* 09F7D0 802DFFD0 00A1C825 */  or    $t9, $a1, $at
/* 09F7D4 802DFFD4 AC590004 */  sw    $t9, 4($v0)
/* 09F7D8 802DFFD8 90790000 */  lbu   $t9, ($v1)
/* 09F7DC 802DFFDC 946E000A */  lhu   $t6, 0xa($v1)
/* 09F7E0 802DFFE0 24500008 */  addiu $s0, $v0, 8
/* 09F7E4 802DFFE4 00196C00 */  sll   $t5, $t9, 0x10
/* 09F7E8 802DFFE8 01CB7825 */  or    $t7, $t6, $t3
/* 09F7EC 802DFFEC 01ED7025 */  or    $t6, $t7, $t5
/* 09F7F0 802DFFF0 02003025 */  move  $a2, $s0
/* 09F7F4 802DFFF4 ACCE0000 */  sw    $t6, ($a2)
/* 09F7F8 802DFFF8 8C780020 */  lw    $t8, 0x20($v1)
/* 09F7FC 802DFFFC 3C0C8000 */  lui   $t4, 0x8000
/* 09F800 802E0000 26100008 */  addiu $s0, $s0, 8
/* 09F804 802E0004 252F0160 */  addiu $t7, $t1, 0x160
/* 09F808 802E0008 030CC821 */  addu  $t9, $t8, $t4
/* 09F80C 802E000C ACD90004 */  sw    $t9, 4($a2)
/* 09F810 802E0010 31EDFFFF */  andi  $t5, $t7, 0xffff
/* 09F814 802E0014 02003825 */  move  $a3, $s0
/* 09F818 802E0018 3C010880 */  lui   $at, 0x880
/* 09F81C 802E001C 00A1C025 */  or    $t8, $a1, $at
/* 09F820 802E0020 01AA7025 */  or    $t6, $t5, $t2
/* 09F824 802E0024 ACEE0000 */  sw    $t6, ($a3)
/* 09F828 802E0028 ACF80004 */  sw    $t8, 4($a3)
/* 09F82C 802E002C 90780000 */  lbu   $t8, ($v1)
/* 09F830 802E0030 946F000A */  lhu   $t7, 0xa($v1)
/* 09F834 802E0034 26100008 */  addiu $s0, $s0, 8
/* 09F838 802E0038 0018CC00 */  sll   $t9, $t8, 0x10
/* 09F83C 802E003C 01EB6825 */  or    $t5, $t7, $t3
/* 09F840 802E0040 01B97825 */  or    $t7, $t5, $t9
/* 09F844 802E0044 02004025 */  move  $t0, $s0
/* 09F848 802E0048 AD0F0000 */  sw    $t7, ($t0)
/* 09F84C 802E004C 8C6E0024 */  lw    $t6, 0x24($v1)
/* 09F850 802E0050 26100008 */  addiu $s0, $s0, 8
/* 09F854 802E0054 02001025 */  move  $v0, $s0
/* 09F858 802E0058 01CCC021 */  addu  $t8, $t6, $t4
/* 09F85C 802E005C AD180004 */  sw    $t8, 4($t0)
/* 09F860 802E0060 26100008 */  addiu $s0, $s0, 8
/* 09F864 802E0064 240D0280 */  li    $t5, 640
/* 09F868 802E0068 AC4D0004 */  sw    $t5, 4($v0)
/* 09F86C 802E006C AC4A0000 */  sw    $t2, ($v0)
/* 09F870 802E0070 02002025 */  move  $a0, $s0
/* 09F874 802E0074 3C0F0740 */  lui   $t7, (0x074004C0 >> 16) # lui $t7, 0x740
/* 09F878 802E0078 3C190C00 */  lui   $t9, (0x0C007FFF >> 16) # lui $t9, 0xc00
/* 09F87C 802E007C 37397FFF */  ori   $t9, (0x0C007FFF & 0xFFFF) # ori $t9, $t9, 0x7fff
/* 09F880 802E0080 35EF04C0 */  ori   $t7, (0x074004C0 & 0xFFFF) # ori $t7, $t7, 0x4c0
/* 09F884 802E0084 AC8F0004 */  sw    $t7, 4($a0)
/* 09F888 802E0088 AC990000 */  sw    $t9, ($a0)
/* 09F88C 802E008C 946E0008 */  lhu   $t6, 8($v1)
/* 09F890 802E0090 34018000 */  li    $at, 32768
/* 09F894 802E0094 26100008 */  addiu $s0, $s0, 8
/* 09F898 802E0098 01C1C021 */  addu  $t8, $t6, $at
/* 09F89C 802E009C 02002825 */  move  $a1, $s0
/* 09F8A0 802E00A0 330DFFFF */  andi  $t5, $t8, 0xffff
/* 09F8A4 802E00A4 3C010C00 */  lui   $at, 0xc00
/* 09F8A8 802E00A8 3C0F0740 */  lui   $t7, (0x07400740 >> 16) # lui $t7, 0x740
/* 09F8AC 802E00AC 35EF0740 */  ori   $t7, (0x07400740 & 0xFFFF) # ori $t7, $t7, 0x740
/* 09F8B0 802E00B0 01A1C825 */  or    $t9, $t5, $at
/* 09F8B4 802E00B4 ACB90000 */  sw    $t9, ($a1)
/* 09F8B8 802E00B8 ACAF0004 */  sw    $t7, 4($a1)
/* 09F8BC 802E00BC 26100008 */  addiu $s0, $s0, 8
.L80200A70:
/* 09F8C0 802E00C0 8FBF0024 */  lw    $ra, 0x24($sp)
/* 09F8C4 802E00C4 02001025 */  move  $v0, $s0
/* 09F8C8 802E00C8 8FB0001C */  lw    $s0, 0x1c($sp)
/* 09F8CC 802E00CC 8FB10020 */  lw    $s1, 0x20($sp)
/* 09F8D0 802E00D0 03E00008 */  jr    $ra
/* 09F8D4 802E00D4 27BD0060 */   addiu $sp, $sp, 0x60
