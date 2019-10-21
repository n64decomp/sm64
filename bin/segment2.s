# SM64 (US/JP/EU) Segment 02
.section .rodata
.include "macros.inc"
.include "PR/gbi.inc"

texture_hud_char_0:
.incbin "textures/segment2/segment2.00000.rgba16"

texture_hud_char_1:
.incbin "textures/segment2/segment2.00200.rgba16"

texture_hud_char_2:
.incbin "textures/segment2/segment2.00400.rgba16"

texture_hud_char_3:
.incbin "textures/segment2/segment2.00600.rgba16"

texture_hud_char_4:
.incbin "textures/segment2/segment2.00800.rgba16"

texture_hud_char_5:
.incbin "textures/segment2/segment2.00A00.rgba16"

texture_hud_char_6:
.incbin "textures/segment2/segment2.00C00.rgba16"

texture_hud_char_7:
.incbin "textures/segment2/segment2.00E00.rgba16"

texture_hud_char_8:
.incbin "textures/segment2/segment2.01000.rgba16"

texture_hud_char_9:
.incbin "textures/segment2/segment2.01200.rgba16"

texture_hud_char_A:
.incbin "textures/segment2/segment2.01400.rgba16"

texture_hud_char_B:
.incbin "textures/segment2/segment2.01600.rgba16"

texture_hud_char_C:
.incbin "textures/segment2/segment2.01800.rgba16"

texture_hud_char_D:
.incbin "textures/segment2/segment2.01A00.rgba16"

texture_hud_char_E:
.incbin "textures/segment2/segment2.01C00.rgba16"

texture_hud_char_F:
.incbin "textures/segment2/segment2.01E00.rgba16"

texture_hud_char_G:
.incbin "textures/segment2/segment2.02000.rgba16"

texture_hud_char_H:
.incbin "textures/segment2/segment2.02200.rgba16"

texture_hud_char_I:
.incbin "textures/segment2/segment2.02400.rgba16"

.ifdef VERSION_JP
texture_hud_char_J:
.incbin "textures/segment2/segment2.02600.rgba16"
.endif

texture_hud_char_K:
.incbin "textures/segment2/segment2.02800.rgba16"

texture_hud_char_L:
.incbin "textures/segment2/segment2.02A00.rgba16"

texture_hud_char_M:
.incbin "textures/segment2/segment2.02C00.rgba16"

texture_hud_char_N:
.incbin "textures/segment2/segment2.02E00.rgba16"

texture_hud_char_O:
.incbin "textures/segment2/segment2.03000.rgba16"

texture_hud_char_P:
.incbin "textures/segment2/segment2.03200.rgba16"

.ifdef VERSION_JP
texture_hud_char_Q:
.incbin "textures/segment2/segment2.03400.rgba16"
.endif

texture_hud_char_R:
.incbin "textures/segment2/segment2.03600.rgba16"

texture_hud_char_S:
.incbin "textures/segment2/segment2.03800.rgba16"

texture_hud_char_T:
.incbin "textures/segment2/segment2.03A00.rgba16"

texture_hud_char_U:
.incbin "textures/segment2/segment2.03C00.rgba16"

.if VERSION_JP == 1 || VERSION_EU == 1
texture_hud_char_V:
.incbin "textures/segment2/segment2.03E00.rgba16"
.endif

texture_hud_char_W:
.incbin "textures/segment2/segment2.04000.rgba16"

.ifdef VERSION_JP
texture_hud_char_X:
.incbin "textures/segment2/segment2.04200.rgba16"
.endif

texture_hud_char_Y:
.incbin "textures/segment2/segment2.04400.rgba16"

.if VERSION_JP == 1 || VERSION_EU == 1
texture_hud_char_Z:
.incbin "textures/segment2/segment2.04600.rgba16"
.endif

texture_hud_char_apostrophe:
.incbin "textures/segment2/segment2.04800.rgba16"

texture_hud_char_double_quote:
.incbin "textures/segment2/segment2.04A00.rgba16"

.ifdef VERSION_EU
texture_hud_char_umlaut:
.incbin "textures/segment2/segment2.umlaut.rgba16" # EU ¨
.endif

.ifdef VERSION_JP
texture_hud_char_exclamation:
.incbin "textures/segment2/segment2.04C00.rgba16" # JP !
.endif

.ifdef VERSION_JP
texture_hud_char_double_exclamation:
.incbin "textures/segment2/segment2.04E00.rgba16" # JP !!
.endif

.ifdef VERSION_JP
texture_hud_char_question:
.incbin "textures/segment2/segment2.05000.rgba16" # JP ?
.endif

.ifdef VERSION_JP
texture_hud_char_ampersand:
.incbin "textures/segment2/segment2.05200.rgba16" # JP &
.endif

.ifdef VERSION_JP
texture_hud_char_percent:
.incbin "textures/segment2/segment2.05400.rgba16" # JP %
.endif

texture_hud_char_multiply:
.incbin "textures/segment2/segment2.05600.rgba16"

texture_hud_char_coin:
.incbin "textures/segment2/segment2.05800.rgba16"

texture_hud_char_mario_head:
.incbin "textures/segment2/segment2.05A00.rgba16"

texture_hud_char_star:
.incbin "textures/segment2/segment2.05C00.rgba16"

.ifdef VERSION_JP
texture_hud_char_decimal_point:
.incbin "textures/segment2/segment2.05E00.rgba16"
.endif

.ifdef VERSION_JP
texture_hud_char_beta_key:
.incbin "textures/segment2/segment2.06000.rgba16"
.endif

texture_credits_char_3:
.incbin "textures/segment2/segment2.06200.rgba16"

texture_credits_char_4:
.incbin "textures/segment2/segment2.06280.rgba16"

texture_credits_char_6:
.incbin "textures/segment2/segment2.06300.rgba16"

texture_credits_char_A:
.incbin "textures/segment2/segment2.06380.rgba16"

texture_credits_char_B:
.incbin "textures/segment2/segment2.06400.rgba16"

texture_credits_char_C:
.incbin "textures/segment2/segment2.06480.rgba16"

texture_credits_char_D:
.incbin "textures/segment2/segment2.06500.rgba16"

texture_credits_char_E:
.incbin "textures/segment2/segment2.06580.rgba16"

texture_credits_char_F:
.incbin "textures/segment2/segment2.06600.rgba16"

texture_credits_char_G:
.incbin "textures/segment2/segment2.06680.rgba16"

texture_credits_char_H:
.incbin "textures/segment2/segment2.06700.rgba16"

texture_credits_char_I:
.incbin "textures/segment2/segment2.06780.rgba16"

texture_credits_char_J:
.incbin "textures/segment2/segment2.06800.rgba16"

texture_credits_char_K:
.incbin "textures/segment2/segment2.06880.rgba16"

texture_credits_char_L:
.incbin "textures/segment2/segment2.06900.rgba16"

texture_credits_char_M:
.incbin "textures/segment2/segment2.06980.rgba16"

texture_credits_char_N:
.incbin "textures/segment2/segment2.06A00.rgba16"

texture_credits_char_O:
.incbin "textures/segment2/segment2.06A80.rgba16"

texture_credits_char_P:
.incbin "textures/segment2/segment2.06B00.rgba16"

texture_credits_char_Q:
.incbin "textures/segment2/segment2.06B80.rgba16"

texture_credits_char_R:
.incbin "textures/segment2/segment2.06C00.rgba16"

texture_credits_char_S:
.incbin "textures/segment2/segment2.06C80.rgba16"

texture_credits_char_T:
.incbin "textures/segment2/segment2.06D00.rgba16"

texture_credits_char_U:
.incbin "textures/segment2/segment2.06D80.rgba16"

texture_credits_char_V:
.incbin "textures/segment2/segment2.06E00.rgba16"

texture_credits_char_W:
.incbin "textures/segment2/segment2.06E80.rgba16"

texture_credits_char_X:
.incbin "textures/segment2/segment2.06F00.rgba16"

texture_credits_char_Y:
.incbin "textures/segment2/segment2.06F80.rgba16"

texture_credits_char_Z:
.incbin "textures/segment2/segment2.07000.rgba16"

texture_credits_char_period:
.incbin "textures/segment2/segment2.07080.rgba16"

.ifdef VERSION_JP # JP Small Font
texture_font_char_jp_0:
    .incbin "textures/segment2/segment2.07100.ia1"

texture_font_char_jp_1:
    .incbin "textures/segment2/segment2.07110.ia1"

texture_font_char_jp_2:
    .incbin "textures/segment2/segment2.07120.ia1"

texture_font_char_jp_3:
    .incbin "textures/segment2/segment2.07130.ia1"

texture_font_char_jp_4:
    .incbin "textures/segment2/segment2.07140.ia1"

texture_font_char_jp_5:
    .incbin "textures/segment2/segment2.07150.ia1"

texture_font_char_jp_6:
    .incbin "textures/segment2/segment2.07160.ia1"

texture_font_char_jp_7:
    .incbin "textures/segment2/segment2.07170.ia1"

texture_font_char_jp_8:
    .incbin "textures/segment2/segment2.07180.ia1"

texture_font_char_jp_9:
    .incbin "textures/segment2/segment2.07190.ia1"

texture_font_char_jp_A:
    .incbin "textures/segment2/segment2.071A0.ia1"

texture_font_char_jp_B:
    .incbin "textures/segment2/segment2.071B0.ia1"

texture_font_char_jp_C:
    .incbin "textures/segment2/segment2.071C0.ia1"

texture_font_char_jp_D:
    .incbin "textures/segment2/segment2.071D0.ia1"

texture_font_char_jp_E:
    .incbin "textures/segment2/segment2.071E0.ia1"

texture_font_char_jp_F:
    .incbin "textures/segment2/segment2.071F0.ia1"

texture_font_char_jp_G:
    .incbin "textures/segment2/segment2.07200.ia1"

texture_font_char_jp_H:
    .incbin "textures/segment2/segment2.07210.ia1"

texture_font_char_jp_I:
    .incbin "textures/segment2/segment2.07220.ia1"

texture_font_char_jp_J:
    .incbin "textures/segment2/segment2.07230.ia1"

texture_font_char_jp_K:
    .incbin "textures/segment2/segment2.07240.ia1"

texture_font_char_jp_L:
    .incbin "textures/segment2/segment2.07250.ia1"

texture_font_char_jp_M:
    .incbin "textures/segment2/segment2.07260.ia1"

texture_font_char_jp_N:
    .incbin "textures/segment2/segment2.07270.ia1"

texture_font_char_jp_O:
    .incbin "textures/segment2/segment2.07280.ia1"

texture_font_char_jp_P:
    .incbin "textures/segment2/segment2.07290.ia1"

texture_font_char_jp_Q:
    .incbin "textures/segment2/segment2.072A0.ia1"

texture_font_char_jp_R:
    .incbin "textures/segment2/segment2.072B0.ia1"

texture_font_char_jp_S:
    .incbin "textures/segment2/segment2.072C0.ia1"

texture_font_char_jp_T:
    .incbin "textures/segment2/segment2.072D0.ia1"

texture_font_char_jp_U:
    .incbin "textures/segment2/segment2.072E0.ia1"

texture_font_char_jp_V:
    .incbin "textures/segment2/segment2.072F0.ia1"

texture_font_char_jp_W:
    .incbin "textures/segment2/segment2.07300.ia1"

texture_font_char_jp_X:
    .incbin "textures/segment2/segment2.07310.ia1"

texture_font_char_jp_Y:
    .incbin "textures/segment2/segment2.07320.ia1"

texture_font_char_jp_Z:
    .incbin "textures/segment2/segment2.07330.ia1"

texture_font_char_jp_long_vowel:
    .incbin "textures/segment2/segment2.07340.ia1"

texture_font_char_jp_exclamation:
    .incbin "textures/segment2/segment2.07350.ia1"

texture_font_char_jp_dakuten:
    .incbin "textures/segment2/segment2.07360.ia1"

texture_font_char_jp_handakuten:
    .incbin "textures/segment2/segment2.07370.ia1"

texture_font_char_jp_percent:
    .incbin "textures/segment2/segment2.07380.ia1"

texture_font_char_jp_question:
    .incbin "textures/segment2/segment2.07390.ia1"

texture_font_char_jp_left_right_arrow:
    .incbin "textures/segment2/segment2.073A0.ia1"

texture_font_char_jp_open_parentheses:
    .incbin "textures/segment2/segment2.073B0.ia1"

texture_font_char_jp_close_open_parentheses:
    .incbin "textures/segment2/segment2.073C0.ia1"

texture_font_char_jp_close_parentheses:
    .incbin "textures/segment2/segment2.073D0.ia1"

texture_font_char_jp_coin:
    .incbin "textures/segment2/segment2.073E0.ia1"

texture_font_char_jp_multiply:
    .incbin "textures/segment2/segment2.073F0.ia1"

texture_font_char_jp_star_filled:
    .incbin "textures/segment2/segment2.07400.ia1"

texture_font_char_jp_star_hollow:
    .incbin "textures/segment2/segment2.07410.ia1"

texture_font_char_jp_hiragana_a:
    .incbin "textures/segment2/segment2.07420.ia1"

texture_font_char_jp_hiragana_i:
    .incbin "textures/segment2/segment2.07430.ia1"

texture_font_char_jp_hiragana_u:
    .incbin "textures/segment2/segment2.07440.ia1"

texture_font_char_jp_hiragana_c:
    .incbin "textures/segment2/segment2.07450.ia1"

texture_font_char_jp_hiragana_o:
    .incbin "textures/segment2/segment2.07460.ia1"

texture_font_char_jp_hiragana_ka:
    .incbin "textures/segment2/segment2.07470.ia1"

texture_font_char_jp_hiragana_ki:
    .incbin "textures/segment2/segment2.07480.ia1"

texture_font_char_jp_hiragana_ku:
    .incbin "textures/segment2/segment2.07490.ia1"

texture_font_char_jp_hiragana_ke:
    .incbin "textures/segment2/segment2.074A0.ia1"

texture_font_char_jp_hiragana_ko:
    .incbin "textures/segment2/segment2.074B0.ia1"

texture_font_char_jp_hiragana_sa:
    .incbin "textures/segment2/segment2.074C0.ia1"

texture_font_char_jp_hiragana_shi:
    .incbin "textures/segment2/segment2.074D0.ia1"

texture_font_char_jp_hiragana_su:
    .incbin "textures/segment2/segment2.074E0.ia1"

texture_font_char_jp_hiragana_se:
    .incbin "textures/segment2/segment2.074F0.ia1"

texture_font_char_jp_hiragana_so:
    .incbin "textures/segment2/segment2.07500.ia1"

texture_font_char_jp_hiragana_ta:
    .incbin "textures/segment2/segment2.07510.ia1"

texture_font_char_jp_hiragana_chi:
    .incbin "textures/segment2/segment2.07520.ia1"

texture_font_char_jp_hiragana_tsu:
    .incbin "textures/segment2/segment2.07530.ia1"

texture_font_char_jp_hiragana_te:
    .incbin "textures/segment2/segment2.07540.ia1"

texture_font_char_jp_hiragana_to:
    .incbin "textures/segment2/segment2.07550.ia1"

texture_font_char_jp_hiragana_na:
    .incbin "textures/segment2/segment2.07560.ia1"

texture_font_char_jp_hiragana_ni:
    .incbin "textures/segment2/segment2.07570.ia1"

texture_font_char_jp_hiragana_nu:
    .incbin "textures/segment2/segment2.07580.ia1"

texture_font_char_jp_hiragana_ne:
    .incbin "textures/segment2/segment2.07590.ia1"

texture_font_char_jp_hiragana_no:
    .incbin "textures/segment2/segment2.075A0.ia1"

texture_font_char_jp_hiragana_ha:
    .incbin "textures/segment2/segment2.075B0.ia1"

texture_font_char_jp_hiragana_hi:
    .incbin "textures/segment2/segment2.075C0.ia1"

texture_font_char_jp_hiragana_hu:
    .incbin "textures/segment2/segment2.075D0.ia1"

texture_font_char_jp_hiragana_he:
    .incbin "textures/segment2/segment2.075E0.ia1"

texture_font_char_jp_hiragana_ho:
    .incbin "textures/segment2/segment2.075F0.ia1"

texture_font_char_jp_hiragana_ma:
    .incbin "textures/segment2/segment2.07600.ia1"

texture_font_char_jp_hiragana_mi:
    .incbin "textures/segment2/segment2.07610.ia1"

texture_font_char_jp_hiragana_mu:
    .incbin "textures/segment2/segment2.07620.ia1"

texture_font_char_jp_hiragana_me:
    .incbin "textures/segment2/segment2.07630.ia1"

texture_font_char_jp_hiragana_mo:
    .incbin "textures/segment2/segment2.07640.ia1"

texture_font_char_jp_hiragana_ya:
    .incbin "textures/segment2/segment2.07650.ia1"

texture_font_char_jp_hiragana_yu:
    .incbin "textures/segment2/segment2.07660.ia1"

texture_font_char_jp_hiragana_yo:
    .incbin "textures/segment2/segment2.07670.ia1"

texture_font_char_jp_hiragana_ra:
    .incbin "textures/segment2/segment2.07680.ia1"

texture_font_char_jp_hiragana_ri:
    .incbin "textures/segment2/segment2.07690.ia1"

texture_font_char_jp_hiragana_ru:
    .incbin "textures/segment2/segment2.076A0.ia1"

texture_font_char_jp_hiragana_re:
    .incbin "textures/segment2/segment2.076B0.ia1"

texture_font_char_jp_hiragana_ro:
    .incbin "textures/segment2/segment2.076C0.ia1"

texture_font_char_jp_hiragana_wa:
    .incbin "textures/segment2/segment2.076D0.ia1"

texture_font_char_jp_hiragana_wo:
    .incbin "textures/segment2/segment2.076E0.ia1"

texture_font_char_jp_hiragana_n:
    .incbin "textures/segment2/segment2.076F0.ia1"

texture_font_char_jp_hiragana_small_e:
    .incbin "textures/segment2/segment2.07700.ia1"

texture_font_char_jp_hiragana_small_tsu:
    .incbin "textures/segment2/segment2.07710.ia1"

texture_font_char_jp_hiragana_small_ka:
    .incbin "textures/segment2/segment2.07720.ia1"

texture_font_char_jp_hiragana_small_yu:
    .incbin "textures/segment2/segment2.07730.ia1"

texture_font_char_jp_hiragana_small_yo:
    .incbin "textures/segment2/segment2.07740.ia1"

texture_font_char_jp_hiragana_small_a:
    .incbin "textures/segment2/segment2.07750.ia1"

texture_font_char_jp_hiragana_small_i:
    .incbin "textures/segment2/segment2.07760.ia1"

texture_font_char_jp_hiragana_small_o:
    .incbin "textures/segment2/segment2.07770.ia1"

texture_font_char_jp_hiragana_small_u:
    .incbin "textures/segment2/segment2.07780.ia1"

texture_font_char_jp_interpunct:
    .incbin "textures/segment2/segment2.07790.ia1"

texture_font_char_jp_comma:
    .incbin "textures/segment2/segment2.077A0.ia1"

texture_font_char_jp_katakana_a:
    .incbin "textures/segment2/segment2.077B0.ia1"

texture_font_char_jp_katakana_i:
    .incbin "textures/segment2/segment2.077C0.ia1"

texture_font_char_jp_katakana_u:
    .incbin "textures/segment2/segment2.077D0.ia1"

texture_font_char_jp_katakana_e:
    .incbin "textures/segment2/segment2.077E0.ia1"

texture_font_char_jp_katakana_o:
    .incbin "textures/segment2/segment2.077F0.ia1"

texture_font_char_jp_katakana_ka:
    .incbin "textures/segment2/segment2.07800.ia1"

texture_font_char_jp_katakana_ki:
    .incbin "textures/segment2/segment2.07810.ia1"

texture_font_char_jp_katakana_ku:
    .incbin "textures/segment2/segment2.07820.ia1"

texture_font_char_jp_katakana_ke:
    .incbin "textures/segment2/segment2.07830.ia1"

texture_font_char_jp_katakana_ko:
    .incbin "textures/segment2/segment2.07840.ia1"

texture_font_char_jp_katakana_sa:
    .incbin "textures/segment2/segment2.07850.ia1"

texture_font_char_jp_katakana_shi:
    .incbin "textures/segment2/segment2.07860.ia1"

texture_font_char_jp_katakana_su:
    .incbin "textures/segment2/segment2.07870.ia1"

texture_font_char_jp_katakana_se:
    .incbin "textures/segment2/segment2.07880.ia1"

texture_font_char_jp_katakana_so:
    .incbin "textures/segment2/segment2.07890.ia1"

texture_font_char_jp_katakana_ta:
    .incbin "textures/segment2/segment2.078A0.ia1"

texture_font_char_jp_katakana_chi:
    .incbin "textures/segment2/segment2.078B0.ia1"

texture_font_char_jp_katakana_tsu:
    .incbin "textures/segment2/segment2.078C0.ia1"

texture_font_char_jp_katakana_te:
    .incbin "textures/segment2/segment2.078D0.ia1"

texture_font_char_jp_katakana_to:
    .incbin "textures/segment2/segment2.078E0.ia1"

texture_font_char_jp_katakana_na:
    .incbin "textures/segment2/segment2.078F0.ia1"

texture_font_char_jp_katakana_ni:
    .incbin "textures/segment2/segment2.07900.ia1"

texture_font_char_jp_katakana_nu:
    .incbin "textures/segment2/segment2.07910.ia1"

texture_font_char_jp_katakana_ne:
    .incbin "textures/segment2/segment2.07920.ia1"

texture_font_char_jp_katakana_no:
    .incbin "textures/segment2/segment2.07930.ia1"

texture_font_char_jp_katakana_ha:
    .incbin "textures/segment2/segment2.07940.ia1"

texture_font_char_jp_katakana_hi:
    .incbin "textures/segment2/segment2.07950.ia1"

texture_font_char_jp_katakana_hu:
    .incbin "textures/segment2/segment2.07960.ia1"

texture_font_char_jp_katakana_he:
    .incbin "textures/segment2/segment2.07970.ia1"

texture_font_char_jp_katakana_ho:
    .incbin "textures/segment2/segment2.07980.ia1"

texture_font_char_jp_katakana_ma:
    .incbin "textures/segment2/segment2.07990.ia1"

texture_font_char_jp_katakana_mi:
    .incbin "textures/segment2/segment2.079A0.ia1"

texture_font_char_jp_katakana_mu:
    .incbin "textures/segment2/segment2.079B0.ia1"

texture_font_char_jp_katakana_me:
    .incbin "textures/segment2/segment2.079C0.ia1"

texture_font_char_jp_katakana_mo:
    .incbin "textures/segment2/segment2.079D0.ia1"

texture_font_char_jp_katakana_ya:
    .incbin "textures/segment2/segment2.079E0.ia1"

texture_font_char_jp_katakana_yu:
    .incbin "textures/segment2/segment2.079F0.ia1"

texture_font_char_jp_katakana_yo:
    .incbin "textures/segment2/segment2.07A00.ia1"

texture_font_char_jp_katakana_ra:
    .incbin "textures/segment2/segment2.07A10.ia1"

texture_font_char_jp_katakana_ri:
    .incbin "textures/segment2/segment2.07A20.ia1"

texture_font_char_jp_katakana_ru:
    .incbin "textures/segment2/segment2.07A30.ia1"

texture_font_char_jp_katakana_re:
    .incbin "textures/segment2/segment2.07A40.ia1"

texture_font_char_jp_katakana_ro:
    .incbin "textures/segment2/segment2.07A50.ia1"

texture_font_char_jp_katakana_wa:
    .incbin "textures/segment2/segment2.07A60.ia1"

texture_font_char_jp_katakana_n:
    .incbin "textures/segment2/segment2.07A70.ia1"

texture_font_char_jp_katakana_small_e:
    .incbin "textures/segment2/segment2.07A80.ia1"

texture_font_char_jp_katakana_small_tsu:
    .incbin "textures/segment2/segment2.07A90.ia1"

texture_font_char_jp_katakana_small_ka:
    .incbin "textures/segment2/segment2.07AA0.ia1"

texture_font_char_jp_katakana_small_yu:
    .incbin "textures/segment2/segment2.07AB0.ia1"

texture_font_char_jp_katakana_small_yo:
    .incbin "textures/segment2/segment2.07AC0.ia1"

texture_font_char_jp_katakana_small_a:
    .incbin "textures/segment2/segment2.07AD0.ia1"

texture_font_char_jp_katakana_small_i:
    .incbin "textures/segment2/segment2.07AE0.ia1"

texture_font_char_jp_katakana_small_u:
    .incbin "textures/segment2/segment2.07AF0.ia1"

texture_font_char_jp_katakana_small_o:
    .incbin "textures/segment2/segment2.07B00.ia1"

texture_font_char_jp_double_quotation_open:
    .incbin "textures/segment2/segment2.07B10.ia1"

texture_font_char_jp_double_quotation_close:
    .incbin "textures/segment2/segment2.07B20.ia1"

texture_font_char_jp_wave_dash:
    .incbin "textures/segment2/segment2.07B30.ia1"

texture_font_char_jp_ellipsis:
    .incbin "textures/segment2/segment2.07B40.ia1"
.elseif VERSION_EU == 1 # EU Small Font
texture_font_char_eu_0:
    .incbin "textures/segment2/font_graphics.05F00.ia1"

texture_font_char_eu_1:
    .incbin "textures/segment2/font_graphics.05F10.ia1"

texture_font_char_eu_2:
    .incbin "textures/segment2/font_graphics.05F20.ia1"

texture_font_char_eu_3:
    .incbin "textures/segment2/font_graphics.05F30.ia1"

texture_font_char_eu_4:
    .incbin "textures/segment2/font_graphics.05F40.ia1"

texture_font_char_eu_5:
    .incbin "textures/segment2/font_graphics.05F50.ia1"

texture_font_char_eu_6:
    .incbin "textures/segment2/font_graphics.05F60.ia1"

texture_font_char_eu_7:
    .incbin "textures/segment2/font_graphics.05F70.ia1"

texture_font_char_eu_8:
    .incbin "textures/segment2/font_graphics.05F80.ia1"

texture_font_char_eu_9:
    .incbin "textures/segment2/font_graphics.05F90.ia1"

texture_font_char_eu_A:
    .incbin "textures/segment2/font_graphics.05FA0.ia1"

texture_font_char_eu_B:
    .incbin "textures/segment2/font_graphics.05FB0.ia1"

texture_font_char_eu_C:
    .incbin "textures/segment2/font_graphics.05FC0.ia1"

texture_font_char_eu_D:
    .incbin "textures/segment2/font_graphics.05FD0.ia1"

texture_font_char_eu_E:
    .incbin "textures/segment2/font_graphics.05FE0.ia1"

texture_font_char_eu_F:
    .incbin "textures/segment2/font_graphics.05FF0.ia1"

texture_font_char_eu_G:
    .incbin "textures/segment2/font_graphics.06000.ia1"

texture_font_char_eu_H:
    .incbin "textures/segment2/font_graphics.06010.ia1"

texture_font_char_eu_I:
    .incbin "textures/segment2/font_graphics.06020.ia1"

texture_font_char_eu_J:
    .incbin "textures/segment2/font_graphics.06030.ia1"

texture_font_char_eu_K:
    .incbin "textures/segment2/font_graphics.06040.ia1"

texture_font_char_eu_L:
    .incbin "textures/segment2/font_graphics.06050.ia1"

texture_font_char_eu_M:
    .incbin "textures/segment2/font_graphics.06060.ia1"

texture_font_char_eu_N:
    .incbin "textures/segment2/font_graphics.06070.ia1"

texture_font_char_eu_O:
    .incbin "textures/segment2/font_graphics.06080.ia1"

texture_font_char_eu_P:
    .incbin "textures/segment2/font_graphics.06090.ia1"

texture_font_char_eu_Q:
    .incbin "textures/segment2/font_graphics.060A0.ia1"

texture_font_char_eu_R:
    .incbin "textures/segment2/font_graphics.060B0.ia1"

texture_font_char_eu_S:
    .incbin "textures/segment2/font_graphics.060C0.ia1"

texture_font_char_eu_T:
    .incbin "textures/segment2/font_graphics.060D0.ia1"

texture_font_char_eu_U:
    .incbin "textures/segment2/font_graphics.060E0.ia1"

texture_font_char_eu_V:
    .incbin "textures/segment2/font_graphics.060F0.ia1"

texture_font_char_eu_W:
    .incbin "textures/segment2/font_graphics.06100.ia1"

texture_font_char_eu_X:
    .incbin "textures/segment2/font_graphics.06110.ia1"

texture_font_char_eu_Y:
    .incbin "textures/segment2/font_graphics.06120.ia1"

texture_font_char_eu_Z:
    .incbin "textures/segment2/font_graphics.06130.ia1"

texture_font_char_eu_a:
    .incbin "textures/segment2/font_graphics.06140.ia1"

texture_font_char_eu_b:
    .incbin "textures/segment2/font_graphics.06150.ia1"

texture_font_char_eu_c:
    .incbin "textures/segment2/font_graphics.06160.ia1"

texture_font_char_eu_d:
    .incbin "textures/segment2/font_graphics.06170.ia1"

texture_font_char_eu_e:
    .incbin "textures/segment2/font_graphics.06180.ia1"

texture_font_char_eu_f:
    .incbin "textures/segment2/font_graphics.06190.ia1"

texture_font_char_eu_g:
    .incbin "textures/segment2/font_graphics.061A0.ia1"

texture_font_char_eu_h:
    .incbin "textures/segment2/font_graphics.061B0.ia1"

texture_font_char_eu_i:
    .incbin "textures/segment2/font_graphics.061C0.ia1"

texture_font_char_eu_j:
    .incbin "textures/segment2/font_graphics.061D0.ia1"

texture_font_char_eu_k:
    .incbin "textures/segment2/font_graphics.061E0.ia1"

texture_font_char_eu_l:
    .incbin "textures/segment2/font_graphics.061F0.ia1"

texture_font_char_eu_m:
    .incbin "textures/segment2/font_graphics.06200.ia1"

texture_font_char_eu_n:
    .incbin "textures/segment2/font_graphics.06210.ia1"

texture_font_char_eu_o:
    .incbin "textures/segment2/font_graphics.06220.ia1"

texture_font_char_eu_p:
    .incbin "textures/segment2/font_graphics.06230.ia1"

texture_font_char_eu_q:
    .incbin "textures/segment2/font_graphics.06240.ia1"

texture_font_char_eu_r:
    .incbin "textures/segment2/font_graphics.06250.ia1"

texture_font_char_eu_s:
    .incbin "textures/segment2/font_graphics.06260.ia1"

texture_font_char_eu_t:
    .incbin "textures/segment2/font_graphics.06270.ia1"

texture_font_char_eu_u:
    .incbin "textures/segment2/font_graphics.06280.ia1"

texture_font_char_eu_v:
    .incbin "textures/segment2/font_graphics.06290.ia1"

texture_font_char_eu_w:
    .incbin "textures/segment2/font_graphics.062A0.ia1"

texture_font_char_eu_x:
    .incbin "textures/segment2/font_graphics.062B0.ia1"

texture_font_char_eu_y:
    .incbin "textures/segment2/font_graphics.062C0.ia1"

texture_font_char_eu_z:
    .incbin "textures/segment2/font_graphics.062D0.ia1"

texture_font_char_eu_left_right_arrow:
    .incbin "textures/segment2/font_graphics.062E0.ia1"

texture_font_char_eu_ampersand:
    .incbin "textures/segment2/font_graphics.062F0.ia1"

texture_font_char_eu_exclamation:
    .incbin "textures/segment2/font_graphics.06300.ia1"

texture_font_char_eu_coin:
    .incbin "textures/segment2/font_graphics.06310.ia1"

texture_font_char_eu_multiply:
    .incbin "textures/segment2/font_graphics.06320.ia1"

texture_font_char_eu_open_parentheses:
    .incbin "textures/segment2/font_graphics.06330.ia1"

texture_font_char_eu_close_open_parentheses:
    .incbin "textures/segment2/font_graphics.06340.ia1"

texture_font_char_eu_close_parentheses:
    .incbin "textures/segment2/font_graphics.06350.ia1"

texture_font_char_eu_tilde:
    .incbin "textures/segment2/font_graphics.06360.ia1"

texture_font_char_eu_period:
    .incbin "textures/segment2/font_graphics.06370.ia1"

texture_font_char_eu_percent:
    .incbin "textures/segment2/font_graphics.06380.ia1"

texture_font_char_eu_interpunct:
    .incbin "textures/segment2/font_graphics.06390.ia1"

texture_font_char_eu_comma:
    .incbin "textures/segment2/font_graphics.063A0.ia1"

texture_font_char_eu_apostrophe:
    .incbin "textures/segment2/font_graphics.063B0.ia1"

texture_font_char_eu_question:
    .incbin "textures/segment2/font_graphics.063C0.ia1"

texture_font_char_eu_star_filled:
    .incbin "textures/segment2/font_graphics.063D0.ia1"

texture_font_char_eu_star_hollow:
    .incbin "textures/segment2/font_graphics.063E0.ia1"

texture_font_char_eu_double_quote_open:
    .incbin "textures/segment2/font_graphics.063F0.ia1"

texture_font_char_eu_double_quote_close:
    .incbin "textures/segment2/font_graphics.06400.ia1"

texture_font_char_eu_colon:
    .incbin "textures/segment2/font_graphics.06410.ia1"

texture_font_char_EU_slash:
    .incbin "textures/segment2/font_graphics.06420.ia1"

texture_font_char_eu_button_A:
    .incbin "textures/segment2/font_graphics.06430.ia1"

texture_font_char_eu_button_B:
    .incbin "textures/segment2/font_graphics.06440.ia1"

texture_font_char_eu_button_C:
    .incbin "textures/segment2/font_graphics.06450.ia1"

texture_font_char_eu_button_Z:
    .incbin "textures/segment2/font_graphics.06460.ia1"

texture_font_char_eu_button_R:
    .incbin "textures/segment2/font_graphics.06470.ia1"

texture_font_char_eu_button_C_up:
    .incbin "textures/segment2/font_graphics.06480.ia1"

texture_font_char_eu_button_C_down:
    .incbin "textures/segment2/font_graphics.06490.ia1"

texture_font_char_eu_button_C_left:
    .incbin "textures/segment2/font_graphics.064A0.ia1"

texture_font_char_eu_button_C_right:
    .incbin "textures/segment2/font_graphics.064B0.ia1"

texture_font_char_eu_umlaut:
    .incbin "textures/segment2/font_graphics.064C0.ia1"

texture_font_char_eu_circumflex:
    .incbin "textures/segment2/font_graphics.064D0.ia1"

texture_font_char_eu_grave:
    .incbin "textures/segment2/font_graphics.064E0.ia1"

texture_font_char_eu_acute:
    .incbin "textures/segment2/font_graphics.064F0.ia1"

texture_font_char_eu_cedilla:
    .incbin "textures/segment2/font_graphics.06500.ia1"

texture_font_char_eu_unknown:
    .incbin "textures/segment2/font_graphics.06510.ia1"

texture_font_char_eu_Cedilla:
    .incbin "textures/segment2/font_graphics.06520.ia1"

texture_font_char_eu_eszeet:
    .incbin "textures/segment2/font_graphics.06530.ia1"

.else # US Small Font
texture_font_char_us_0:
    .incbin "textures/segment2/font_graphics.05900.ia4"

texture_font_char_us_1:
    .incbin "textures/segment2/font_graphics.05940.ia4"

texture_font_char_us_2:
    .incbin "textures/segment2/font_graphics.05980.ia4"

texture_font_char_us_3:
    .incbin "textures/segment2/font_graphics.059C0.ia4"

texture_font_char_us_4:
    .incbin "textures/segment2/font_graphics.05A00.ia4"

texture_font_char_us_5:
    .incbin "textures/segment2/font_graphics.05A40.ia4"

texture_font_char_us_6:
    .incbin "textures/segment2/font_graphics.05A80.ia4"

texture_font_char_us_7:
    .incbin "textures/segment2/font_graphics.05AC0.ia4"

texture_font_char_us_8:
    .incbin "textures/segment2/font_graphics.05B00.ia4"

texture_font_char_us_9:
    .incbin "textures/segment2/font_graphics.05B40.ia4"

texture_font_char_us_A:
    .incbin "textures/segment2/font_graphics.05B80.ia4"

texture_font_char_us_B:
    .incbin "textures/segment2/font_graphics.05BC0.ia4"

texture_font_char_us_C:
    .incbin "textures/segment2/font_graphics.05C00.ia4"

texture_font_char_us_D:
    .incbin "textures/segment2/font_graphics.05C40.ia4"

texture_font_char_us_E:
    .incbin "textures/segment2/font_graphics.05C80.ia4"

texture_font_char_us_F:
    .incbin "textures/segment2/font_graphics.05CC0.ia4"

texture_font_char_us_G:
    .incbin "textures/segment2/font_graphics.05D00.ia4"

texture_font_char_us_H:
    .incbin "textures/segment2/font_graphics.05D40.ia4"

texture_font_char_us_I:
    .incbin "textures/segment2/font_graphics.05D80.ia4"

texture_font_char_us_J:
    .incbin "textures/segment2/font_graphics.05DC0.ia4"

texture_font_char_us_K:
    .incbin "textures/segment2/font_graphics.05E00.ia4"

texture_font_char_us_L:
    .incbin "textures/segment2/font_graphics.05E40.ia4"

texture_font_char_us_M:
    .incbin "textures/segment2/font_graphics.05E80.ia4"

texture_font_char_us_N:
    .incbin "textures/segment2/font_graphics.05EC0.ia4"

texture_font_char_us_O:
    .incbin "textures/segment2/font_graphics.05F00.ia4"

texture_font_char_us_P:
    .incbin "textures/segment2/font_graphics.05F40.ia4"

texture_font_char_us_Q:
    .incbin "textures/segment2/font_graphics.05F80.ia4"

texture_font_char_us_R:
    .incbin "textures/segment2/font_graphics.05FC0.ia4"

texture_font_char_us_S:
    .incbin "textures/segment2/font_graphics.06000.ia4"

texture_font_char_us_T:
    .incbin "textures/segment2/font_graphics.06040.ia4"

texture_font_char_us_U:
    .incbin "textures/segment2/font_graphics.06080.ia4"

texture_font_char_us_V:
    .incbin "textures/segment2/font_graphics.060C0.ia4"

texture_font_char_us_W:
    .incbin "textures/segment2/font_graphics.06100.ia4"

texture_font_char_us_X:
    .incbin "textures/segment2/font_graphics.06140.ia4"

texture_font_char_us_Y:
    .incbin "textures/segment2/font_graphics.06180.ia4"

texture_font_char_us_Z:
    .incbin "textures/segment2/font_graphics.061C0.ia4"

texture_font_char_us_a:
    .incbin "textures/segment2/font_graphics.06200.ia4"

texture_font_char_us_b:
    .incbin "textures/segment2/font_graphics.06240.ia4"

texture_font_char_us_c:
    .incbin "textures/segment2/font_graphics.06280.ia4"

texture_font_char_us_d:
    .incbin "textures/segment2/font_graphics.062C0.ia4"

texture_font_char_us_e:
    .incbin "textures/segment2/font_graphics.06300.ia4"

texture_font_char_us_f:
    .incbin "textures/segment2/font_graphics.06340.ia4"

texture_font_char_us_g:
    .incbin "textures/segment2/font_graphics.06380.ia4"

texture_font_char_us_h:
    .incbin "textures/segment2/font_graphics.063C0.ia4"

texture_font_char_us_i:
    .incbin "textures/segment2/font_graphics.06400.ia4"

texture_font_char_us_j:
    .incbin "textures/segment2/font_graphics.06440.ia4"

texture_font_char_us_k:
    .incbin "textures/segment2/font_graphics.06480.ia4"

texture_font_char_us_l:
    .incbin "textures/segment2/font_graphics.064C0.ia4"

texture_font_char_us_m:
    .incbin "textures/segment2/font_graphics.06500.ia4"

texture_font_char_us_n:
    .incbin "textures/segment2/font_graphics.06540.ia4"

texture_font_char_us_o:
    .incbin "textures/segment2/font_graphics.06580.ia4"

texture_font_char_us_p:
    .incbin "textures/segment2/font_graphics.065C0.ia4"

texture_font_char_us_q:
    .incbin "textures/segment2/font_graphics.06600.ia4"

texture_font_char_us_r:
    .incbin "textures/segment2/font_graphics.06640.ia4"

texture_font_char_us_s:
    .incbin "textures/segment2/font_graphics.06680.ia4"

texture_font_char_us_t:
    .incbin "textures/segment2/font_graphics.066C0.ia4"

texture_font_char_us_u:
    .incbin "textures/segment2/font_graphics.06700.ia4"

texture_font_char_us_v:
    .incbin "textures/segment2/font_graphics.06740.ia4"

texture_font_char_us_w:
    .incbin "textures/segment2/font_graphics.06780.ia4"

texture_font_char_us_x:
    .incbin "textures/segment2/font_graphics.067C0.ia4"

texture_font_char_us_y:
    .incbin "textures/segment2/font_graphics.06800.ia4"

texture_font_char_us_z:
    .incbin "textures/segment2/font_graphics.06840.ia4"

texture_font_char_us_left_right_arrow:
    .incbin "textures/segment2/font_graphics.06880.ia4"

texture_font_char_us_exclamation:
    .incbin "textures/segment2/font_graphics.068C0.ia4"

texture_font_char_us_coin:
    .incbin "textures/segment2/font_graphics.06900.ia4"

texture_font_char_us_multiply:
    .incbin "textures/segment2/font_graphics.06940.ia4"

texture_font_char_us_open_parentheses:
    .incbin "textures/segment2/font_graphics.06980.ia4"

texture_font_char_us_close_open_parentheses:
    .incbin "textures/segment2/font_graphics.069C0.ia4"

texture_font_char_us_close_parentheses:
    .incbin "textures/segment2/font_graphics.06A00.ia4"

texture_font_char_us_tilde:
    .incbin "textures/segment2/font_graphics.06A40.ia4"

texture_font_char_us_period:
    .incbin "textures/segment2/font_graphics.06A80.ia4"

texture_font_char_us_percent:
    .incbin "textures/segment2/font_graphics.06AC0.ia4"

texture_font_char_us_interpunct:
    .incbin "textures/segment2/font_graphics.06B00.ia4"

texture_font_char_us_comma:
    .incbin "textures/segment2/font_graphics.06B40.ia4"

texture_font_char_us_apostrophe:
    .incbin "textures/segment2/font_graphics.06B80.ia4"

texture_font_char_us_question:
    .incbin "textures/segment2/font_graphics.06BC0.ia4"

texture_font_char_us_star_filled:
    .incbin "textures/segment2/font_graphics.06C00.ia4"

texture_font_char_us_star_hollow:
    .incbin "textures/segment2/font_graphics.06C40.ia4"

texture_font_char_us_double_quote_open:
    .incbin "textures/segment2/font_graphics.06C80.ia4"

texture_font_char_us_double_quote_close:
    .incbin "textures/segment2/font_graphics.06CC0.ia4"

texture_font_char_us_ellipsis:
    .incbin "textures/segment2/font_graphics.06D00.ia4"

texture_font_char_us_slash:
    .incbin "textures/segment2/font_graphics.06D40.ia4"

texture_font_char_us_ampersand:
    .incbin "textures/segment2/font_graphics.06D80.ia4"

texture_font_char_us_button_A:
    .incbin "textures/segment2/font_graphics.06DC0.ia4"

texture_font_char_us_button_B:
    .incbin "textures/segment2/font_graphics.06E00.ia4"

texture_font_char_us_button_C:
    .incbin "textures/segment2/font_graphics.06E40.ia4"

texture_font_char_us_button_Z:
    .incbin "textures/segment2/font_graphics.06E80.ia4"

texture_font_char_us_button_R:
    .incbin "textures/segment2/font_graphics.06EC0.ia4"

texture_font_char_us_button_C_up:
    .incbin "textures/segment2/font_graphics.06F00.ia4"

texture_font_char_us_button_C_down:
    .incbin "textures/segment2/font_graphics.06F40.ia4"

texture_font_char_us_button_C_left:
    .incbin "textures/segment2/font_graphics.06F80.ia4"

texture_font_char_us_button_C_right:
    .incbin "textures/segment2/font_graphics.06FC0.ia4"
.endif

texture_hud_char_camera:
.incbin "textures/segment2/segment2.07B50.rgba16"

texture_hud_char_lakitu:
.incbin "textures/segment2/segment2.07D50.rgba16"

texture_hud_char_no_camera:
.incbin "textures/segment2/segment2.07F50.rgba16"

texture_hud_char_arrow_up:
.incbin "textures/segment2/segment2.08150.rgba16"

texture_hud_char_arrow_down:
.incbin "textures/segment2/segment2.081D0.rgba16"

# Main HUD print table 0x02008250-0x02008337
glabel main_hud_lut
.if VERSION_EU == 1
    .word texture_hud_char_0, texture_hud_char_1, texture_hud_char_2, texture_hud_char_3
    .word texture_hud_char_4, texture_hud_char_5, texture_hud_char_6, texture_hud_char_7
    .word texture_hud_char_8, texture_hud_char_9, texture_hud_char_A, texture_hud_char_B
    .word texture_hud_char_C, texture_hud_char_D, texture_hud_char_E, texture_hud_char_F
    .word texture_hud_char_G, texture_hud_char_H, texture_hud_char_I,               0x0
    .word texture_hud_char_K, texture_hud_char_L, texture_hud_char_M, texture_hud_char_N
    .word texture_hud_char_O, texture_hud_char_P,               0x0, texture_hud_char_R
    .word texture_hud_char_S, texture_hud_char_T, texture_hud_char_U, texture_hud_char_V
    .word texture_hud_char_W,               0x0, texture_hud_char_Y, texture_hud_char_Z
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0, texture_hud_char_multiply, texture_hud_char_coin
    .word texture_hud_char_mario_head, texture_hud_char_star,               0x0,               0x0
    .word texture_hud_char_apostrophe, texture_hud_char_double_quote, texture_hud_char_umlaut
.elseif VERSION_US == 1
    .word texture_hud_char_0, texture_hud_char_1, texture_hud_char_2, texture_hud_char_3
    .word texture_hud_char_4, texture_hud_char_5, texture_hud_char_6, texture_hud_char_7
    .word texture_hud_char_8, texture_hud_char_9, texture_hud_char_A, texture_hud_char_B
    .word texture_hud_char_C, texture_hud_char_D, texture_hud_char_E, texture_hud_char_F
    .word texture_hud_char_G, texture_hud_char_H, texture_hud_char_I,               0x0
    .word texture_hud_char_K, texture_hud_char_L, texture_hud_char_M, texture_hud_char_N
    .word texture_hud_char_O, texture_hud_char_P,               0x0, texture_hud_char_R
    .word texture_hud_char_S, texture_hud_char_T, texture_hud_char_U,               0x0
    .word texture_hud_char_W,               0x0, texture_hud_char_Y,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0, texture_hud_char_multiply, texture_hud_char_coin
    .word texture_hud_char_mario_head, texture_hud_char_star,               0x0,               0x0
    .word texture_hud_char_apostrophe, texture_hud_char_double_quote
.else
    .word texture_hud_char_0, texture_hud_char_1, texture_hud_char_2, texture_hud_char_3
    .word texture_hud_char_4, texture_hud_char_5, texture_hud_char_6, texture_hud_char_7
    .word texture_hud_char_8, texture_hud_char_9, texture_hud_char_A, texture_hud_char_B
    .word texture_hud_char_C, texture_hud_char_D, texture_hud_char_E, texture_hud_char_F
    .word texture_hud_char_G, texture_hud_char_H, texture_hud_char_I, texture_hud_char_J
    .word texture_hud_char_K, texture_hud_char_L, texture_hud_char_M, texture_hud_char_N
    .word texture_hud_char_O, texture_hud_char_P, texture_hud_char_Q, texture_hud_char_R
    .word texture_hud_char_S, texture_hud_char_T, texture_hud_char_U, texture_hud_char_V
    .word texture_hud_char_W, texture_hud_char_X, texture_hud_char_Y, texture_hud_char_Z
    .word texture_hud_char_exclamation, texture_hud_char_double_exclamation, texture_hud_char_question, texture_hud_char_ampersand
    .word texture_hud_char_percent,                 0x0,                      0x0,                  0x0
    .word                   0x0,                   0x0,                      0x0,                  0x0
    .word                   0x0,                   0x0, texture_hud_char_multiply, texture_hud_char_coin
    .word texture_hud_char_mario_head, texture_hud_char_star, texture_hud_char_decimal_point, texture_hud_char_beta_key
    .word texture_hud_char_apostrophe, texture_hud_char_double_quote
.endif

# Main small font print table 0x02008338-0x02008737
glabel main_font_lut
.if VERSION_EU == 1 # EU Font Table
    .word texture_font_char_eu_0, texture_font_char_eu_1, texture_font_char_eu_2, texture_font_char_eu_3
    .word texture_font_char_eu_4, texture_font_char_eu_5, texture_font_char_eu_6, texture_font_char_eu_7
    .word texture_font_char_eu_8, texture_font_char_eu_9, texture_font_char_eu_A, texture_font_char_eu_B
    .word texture_font_char_eu_C, texture_font_char_eu_D, texture_font_char_eu_E, texture_font_char_eu_F
    .word texture_font_char_eu_G, texture_font_char_eu_H, texture_font_char_eu_I, texture_font_char_eu_J
    .word texture_font_char_eu_K, texture_font_char_eu_L, texture_font_char_eu_M, texture_font_char_eu_N
    .word texture_font_char_eu_O, texture_font_char_eu_P, texture_font_char_eu_Q, texture_font_char_eu_R
    .word texture_font_char_eu_S, texture_font_char_eu_T, texture_font_char_eu_U, texture_font_char_eu_V
    .word texture_font_char_eu_W, texture_font_char_eu_X, texture_font_char_eu_Y, texture_font_char_eu_Z
    .word texture_font_char_eu_a, texture_font_char_eu_b, texture_font_char_eu_c, texture_font_char_eu_d
    .word texture_font_char_eu_e, texture_font_char_eu_f, texture_font_char_eu_g, texture_font_char_eu_h
    .word texture_font_char_eu_i, texture_font_char_eu_j, texture_font_char_eu_k, texture_font_char_eu_l
    .word texture_font_char_eu_m, texture_font_char_eu_n, texture_font_char_eu_o, texture_font_char_eu_p
    .word texture_font_char_eu_q, texture_font_char_eu_r, texture_font_char_eu_s, texture_font_char_eu_t
    .word texture_font_char_eu_u, texture_font_char_eu_v, texture_font_char_eu_w, texture_font_char_eu_x
    .word texture_font_char_eu_y, texture_font_char_eu_z, texture_font_char_eu_apostrophe, texture_font_char_eu_period
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word texture_font_char_eu_button_C_up
    .word texture_font_char_eu_button_C_down
    .word texture_font_char_eu_button_C_left
    .word texture_font_char_eu_button_C_right
    .word texture_font_char_eu_button_A
    .word texture_font_char_eu_button_B
    .word texture_font_char_eu_button_C
    .word texture_font_char_eu_button_Z
    .word texture_font_char_eu_button_R
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word texture_font_char_eu_comma
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word texture_font_char_EU_slash
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .word 0x0
    .word texture_font_char_eu_open_parentheses
    .word texture_font_char_eu_close_open_parentheses
    .word texture_font_char_eu_close_parentheses
    .word texture_font_char_eu_left_right_arrow
    .word texture_font_char_eu_ampersand
    .word texture_font_char_eu_colon
    .word texture_font_char_eu_acute
    .word texture_font_char_eu_circumflex
    .word texture_font_char_eu_umlaut
    .word texture_font_char_eu_grave
    .word texture_font_char_eu_unknown
    .word texture_font_char_eu_eszeet
    .word texture_font_char_eu_Cedilla
    .word texture_font_char_eu_cedilla
    .word 0x0, 0x0, 0x0
    .word texture_font_char_eu_exclamation
    .word texture_font_char_eu_percent
    .word texture_font_char_eu_question
    .word texture_font_char_eu_double_quote_open
    .word texture_font_char_eu_double_quote_close
    .word texture_font_char_eu_tilde
    .word 0x0
    .word texture_font_char_eu_coin
    .word texture_font_char_eu_star_filled
    .word texture_font_char_eu_multiply
    .word texture_font_char_eu_interpunct
    .word texture_font_char_eu_star_hollow
    .word 0x0, 0x0
.elseif VERSION_US == 1 # US Font Table
    .word texture_font_char_us_0, texture_font_char_us_1, texture_font_char_us_2, texture_font_char_us_3
    .word texture_font_char_us_4, texture_font_char_us_5, texture_font_char_us_6, texture_font_char_us_7
    .word texture_font_char_us_8, texture_font_char_us_9, texture_font_char_us_A, texture_font_char_us_B
    .word texture_font_char_us_C, texture_font_char_us_D, texture_font_char_us_E, texture_font_char_us_F
    .word texture_font_char_us_G, texture_font_char_us_H, texture_font_char_us_I, texture_font_char_us_J
    .word texture_font_char_us_K, texture_font_char_us_L, texture_font_char_us_M, texture_font_char_us_N
    .word texture_font_char_us_O, texture_font_char_us_P, texture_font_char_us_Q, texture_font_char_us_R
    .word texture_font_char_us_S, texture_font_char_us_T, texture_font_char_us_U, texture_font_char_us_V
    .word texture_font_char_us_W, texture_font_char_us_X, texture_font_char_us_Y, texture_font_char_us_Z
    .word texture_font_char_us_a, texture_font_char_us_b, texture_font_char_us_c, texture_font_char_us_d
    .word texture_font_char_us_e, texture_font_char_us_f, texture_font_char_us_g, texture_font_char_us_h
    .word texture_font_char_us_i, texture_font_char_us_j, texture_font_char_us_k, texture_font_char_us_l
    .word texture_font_char_us_m, texture_font_char_us_n, texture_font_char_us_o, texture_font_char_us_p
    .word texture_font_char_us_q, texture_font_char_us_r, texture_font_char_us_s, texture_font_char_us_t
    .word texture_font_char_us_u, texture_font_char_us_v, texture_font_char_us_w, texture_font_char_us_x
    .word texture_font_char_us_y, texture_font_char_us_z, texture_font_char_us_apostrophe, texture_font_char_us_period
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word texture_font_char_us_button_C_up, texture_font_char_us_button_C_down, texture_font_char_us_button_C_left, texture_font_char_us_button_C_right
    .word texture_font_char_us_button_A, texture_font_char_us_button_B, texture_font_char_us_button_C, texture_font_char_us_button_Z
    .word texture_font_char_us_button_R,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0, texture_font_char_us_comma
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0, texture_font_char_us_slash
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0, texture_font_char_us_open_parentheses, texture_font_char_us_close_open_parentheses, texture_font_char_us_close_parentheses
    .word texture_font_char_us_left_right_arrow, texture_font_char_us_ampersand, texture_font_char_us_ellipsis,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0,               0x0,               0x0
    .word               0x0,               0x0, texture_font_char_us_exclamation, texture_font_char_us_percent
    .word texture_font_char_us_question, texture_font_char_us_double_quote_open, texture_font_char_us_double_quote_close, texture_font_char_us_tilde
    .word               0x0, texture_font_char_us_coin, texture_font_char_us_star_filled, texture_font_char_us_multiply
    .word texture_font_char_us_interpunct, texture_font_char_us_star_hollow,               0x0,               0x0
.elseif VERSION_JP == 1
    .word texture_font_char_jp_0, texture_font_char_jp_1, texture_font_char_jp_2, texture_font_char_jp_3
    .word texture_font_char_jp_4, texture_font_char_jp_5, texture_font_char_jp_6, texture_font_char_jp_7
    .word texture_font_char_jp_8, texture_font_char_jp_9, texture_font_char_jp_A, texture_font_char_jp_B
    .word texture_font_char_jp_C, texture_font_char_jp_D, texture_font_char_jp_E, texture_font_char_jp_F
    .word texture_font_char_jp_G, texture_font_char_jp_H, texture_font_char_jp_I, texture_font_char_jp_J
    .word texture_font_char_jp_K, texture_font_char_jp_L, texture_font_char_jp_M, texture_font_char_jp_N
    .word texture_font_char_jp_O, texture_font_char_jp_P, texture_font_char_jp_Q, texture_font_char_jp_R
    .word texture_font_char_jp_S, texture_font_char_jp_T, texture_font_char_jp_U, texture_font_char_jp_V
    .word texture_font_char_jp_W, texture_font_char_jp_X, texture_font_char_jp_Y, texture_font_char_jp_Z
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word texture_font_char_jp_hiragana_a, texture_font_char_jp_hiragana_i, texture_font_char_jp_hiragana_u, texture_font_char_jp_hiragana_c
    .word texture_font_char_jp_hiragana_o, texture_font_char_jp_hiragana_ka, texture_font_char_jp_hiragana_ki, texture_font_char_jp_hiragana_ku
    .word texture_font_char_jp_hiragana_ke, texture_font_char_jp_hiragana_ko, texture_font_char_jp_hiragana_sa, texture_font_char_jp_hiragana_shi
    .word texture_font_char_jp_hiragana_su, texture_font_char_jp_hiragana_se, texture_font_char_jp_hiragana_so, texture_font_char_jp_hiragana_ta
    .word texture_font_char_jp_hiragana_chi, texture_font_char_jp_hiragana_tsu, texture_font_char_jp_hiragana_te, texture_font_char_jp_hiragana_to
    .word texture_font_char_jp_hiragana_na, texture_font_char_jp_hiragana_ni, texture_font_char_jp_hiragana_nu, texture_font_char_jp_hiragana_ne
    .word texture_font_char_jp_hiragana_no, texture_font_char_jp_hiragana_ha, texture_font_char_jp_hiragana_hi, texture_font_char_jp_hiragana_hu
    .word texture_font_char_jp_hiragana_he, texture_font_char_jp_hiragana_ho, texture_font_char_jp_hiragana_ma, texture_font_char_jp_hiragana_mi
    .word texture_font_char_jp_hiragana_mu, texture_font_char_jp_hiragana_me, texture_font_char_jp_hiragana_mo, texture_font_char_jp_hiragana_ya
    .word texture_font_char_jp_hiragana_yu, texture_font_char_jp_hiragana_yo, texture_font_char_jp_hiragana_ra, texture_font_char_jp_hiragana_ri
    .word texture_font_char_jp_hiragana_ru, texture_font_char_jp_hiragana_re, texture_font_char_jp_hiragana_ro, texture_font_char_jp_hiragana_wa
    .word texture_font_char_jp_hiragana_wo, texture_font_char_jp_hiragana_n,                   0x0, texture_font_char_jp_comma
    .word texture_font_char_jp_katakana_a, texture_font_char_jp_katakana_i, texture_font_char_jp_katakana_u, texture_font_char_jp_katakana_e
    .word texture_font_char_jp_katakana_o, texture_font_char_jp_katakana_ka, texture_font_char_jp_katakana_ki, texture_font_char_jp_katakana_ku
    .word texture_font_char_jp_katakana_ke, texture_font_char_jp_katakana_ko, texture_font_char_jp_katakana_sa, texture_font_char_jp_katakana_shi
    .word texture_font_char_jp_katakana_su, texture_font_char_jp_katakana_se, texture_font_char_jp_katakana_so, texture_font_char_jp_katakana_ta
    .word texture_font_char_jp_katakana_chi, texture_font_char_jp_katakana_tsu, texture_font_char_jp_katakana_te, texture_font_char_jp_katakana_to
    .word texture_font_char_jp_katakana_na, texture_font_char_jp_katakana_ni, texture_font_char_jp_katakana_nu, texture_font_char_jp_katakana_ne
    .word texture_font_char_jp_katakana_no, texture_font_char_jp_katakana_ha, texture_font_char_jp_katakana_hi, texture_font_char_jp_katakana_hu
    .word texture_font_char_jp_katakana_he, texture_font_char_jp_katakana_ho, texture_font_char_jp_katakana_ma, texture_font_char_jp_katakana_mi
    .word texture_font_char_jp_katakana_mu, texture_font_char_jp_katakana_me, texture_font_char_jp_katakana_mo, texture_font_char_jp_katakana_ya
    .word texture_font_char_jp_katakana_yu, texture_font_char_jp_katakana_yo, texture_font_char_jp_katakana_ra, texture_font_char_jp_katakana_ri
    .word texture_font_char_jp_katakana_ru, texture_font_char_jp_katakana_re, texture_font_char_jp_katakana_ro, texture_font_char_jp_katakana_wa
    .word                   0x0, texture_font_char_jp_katakana_n,                   0x0, texture_font_char_jp_long_vowel
    .word texture_font_char_jp_hiragana_small_e, texture_font_char_jp_hiragana_small_tsu, texture_font_char_jp_hiragana_small_ka, texture_font_char_jp_hiragana_small_yu
    .word texture_font_char_jp_hiragana_small_yo, texture_font_char_jp_hiragana_small_a, texture_font_char_jp_hiragana_small_i, texture_font_char_jp_hiragana_small_u
    .word texture_font_char_jp_hiragana_small_o,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word texture_font_char_jp_katakana_small_e, texture_font_char_jp_katakana_small_tsu, texture_font_char_jp_katakana_small_ka, texture_font_char_jp_katakana_small_yu
    .word texture_font_char_jp_katakana_small_yo, texture_font_char_jp_katakana_small_a, texture_font_char_jp_katakana_small_i, texture_font_char_jp_katakana_small_u
    .word texture_font_char_jp_katakana_small_o,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0, texture_font_char_jp_open_parentheses, texture_font_char_jp_close_open_parentheses, texture_font_char_jp_close_parentheses
    .word texture_font_char_jp_left_right_arrow,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word                   0x0,                   0x0,                   0x0,                   0x0
    .word texture_font_char_jp_dakuten, texture_font_char_jp_handakuten, texture_font_char_jp_exclamation, texture_font_char_jp_percent
    .word texture_font_char_jp_question, texture_font_char_jp_double_quotation_open, texture_font_char_jp_double_quotation_close, texture_font_char_jp_wave_dash
    .word texture_font_char_jp_ellipsis, texture_font_char_jp_coin, texture_font_char_jp_star_filled, texture_font_char_jp_multiply
    .word texture_font_char_jp_interpunct, texture_font_char_jp_star_hollow,                   0x0,                   0x0
.endif

# credits font LUT 0x02008738-0x020087CB
glabel main_credits_font_lut
.word                    0x0,                    0x0,                    0x0, texture_credits_char_3
.word texture_credits_char_4,                    0x0, texture_credits_char_6,                    0x0
.word                    0x0,                    0x0, texture_credits_char_A, texture_credits_char_B
.word texture_credits_char_C, texture_credits_char_D, texture_credits_char_E, texture_credits_char_F
.word texture_credits_char_G, texture_credits_char_H, texture_credits_char_I, texture_credits_char_J
.word texture_credits_char_K, texture_credits_char_L, texture_credits_char_M, texture_credits_char_N
.word texture_credits_char_O, texture_credits_char_P, texture_credits_char_Q, texture_credits_char_R
.word texture_credits_char_S, texture_credits_char_T, texture_credits_char_U, texture_credits_char_V
.word texture_credits_char_W, texture_credits_char_X, texture_credits_char_Y, texture_credits_char_Z
.word texture_credits_char_period

# HUD camera table 0x020087CC-0x020087E3
glabel main_hud_camera_lut
.word texture_hud_char_camera, texture_hud_char_mario_head, texture_hud_char_lakitu, texture_hud_char_no_camera
.word texture_hud_char_arrow_up, texture_hud_char_arrow_down

.macro textdata name
    .if VERSION_US == 1
        .include "build/us/text/\name\().s"
    .else /* NTSC-J 1.0 */
        .include "build/jp/text/\name\().s"
    .endif
.endm

.ifndef VERSION_EU
    textdata debug
    textdata dialog
    textdata level
    textdata star
.endif

.balign 0x10

glabel dl_hud_img_begin # 0x0200EC60 - 0x0200EC98
gsDPPipeSync
gsDPSetCycleType G_CYC_COPY
gsDPSetTexturePersp G_TP_NONE
gsDPSetAlphaCompare G_AC_THRESHOLD
gsDPSetBlendColor 255, 255, 255, 255
.ifdef VERSION_EU
gsDPSetRenderMode G_RM_NOOP, G_RM_NOOP2
gsDPSetTextureFilter G_TF_POINT
.else
gsDPSetRenderMode G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2
.endif
gsSPEndDisplayList

glabel dl_hud_img_load_tex_block # 0x0200EC98 - 0x0200ECC8
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPEndDisplayList

glabel dl_hud_img_end # 0x0200ECC8 - 0x0200ED00
gsDPPipeSync
gsDPSetTexturePersp G_TP_PERSP

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetAlphaCompare G_AC_NONE
.ifdef VERSION_EU
gsDPSetTextureFilter G_TF_BILERP
gsDPSetCycleType G_CYC_1CYCLE
.else
gsDPSetCycleType G_CYC_1CYCLE
gsSPTexture -1, -1, 0, 0, 0
.endif
gsSPEndDisplayList

glabel dl_rgba16_text_begin # 0x0200ED00 - 0x0200ED38
gsDPPipeSync
gsDPSetTexturePersp G_TP_NONE
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetRenderMode G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2
gsDPSetTextureFilter G_TF_POINT
gsSPEndDisplayList

glabel dl_rgba16_load_tex_block # 0x0200ED38 - 0x0200ED68
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPEndDisplayList

glabel dl_rgba16_text_end # 0x0200ED68 - 0x0200EDA8
gsDPPipeSync
gsDPSetTexturePersp G_TP_PERSP

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetTextureFilter G_TF_BILERP
gsSPTexture -1, -1, 0, 0, 0
gsSPEndDisplayList

vertex_text_bg_box: # 0x0200EDA8 - 0x0200EDE8
vertex      0,    -80,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    130,    -80,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    130,      0,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel dl_draw_text_bg_box # 0x0200EDE8 - 0x0200EE28
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_SHADE, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_SHADE, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetRenderMode G_RM_XLU_SURF, G_RM_XLU_SURF2
gsSPVertex vertex_text_bg_box, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

.ifndef VERSION_EU
vertex_ia8_char: # 0x0200EE28 - 0x0200EE68
.ifndef VERSION_JP
    vertex      0,      0,      0,      0,    256,  0xFF, 0xFF, 0xFF, 0xFF
    vertex      8,      0,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
    vertex      8,     16,      0,    480,      0,  0xFF, 0xFF, 0xFF, 0xFF
    vertex      0,     16,      0,    480,    256,  0xFF, 0xFF, 0xFF, 0xFF
.else
    vertex      0,      0,      0,      0,   1024,  0xFF, 0xFF, 0xFF, 0xFF
    vertex      8,      0,      0,    512,   1024,  0xFF, 0xFF, 0xFF, 0xFF
    vertex      8,     16,      0,    512,      0,  0xFF, 0xFF, 0xFF, 0xFF
    vertex      0,     16,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
.endif
.endif # !EU

.if VERSION_EU == 1
glabel dl_ia8_text_begin # 0x020073B0
    gsDPPipeSync
    gsDPSetTexturePersp G_TP_NONE
    gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
    gsDPSetEnvColor 255, 255, 255, 255
    gsDPSetRenderMode G_RM_XLU_SURF, G_RM_XLU_SURF2
    gsDPSetTextureFilter G_TF_POINT
    gsSPEndDisplayList

glabel dl_ia8_render_char # 0x020073E8 - 0x02007418
    gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_MIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_MIRROR, 4, G_TX_NOLOD
    gsDPLoadSync
    gsDPLoadBlock 7, 0, 0, 0x01F, 0x800
    gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_4b, 1, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_MIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_MIRROR, 4, G_TX_NOLOD
    gsDPSetTileSize 0, 0, 0, 60, 28
    gsSPEndDisplayList

glabel dl_ia8_text_end # 0x02007418 - 0x02007450
    gsDPPipeSync
    gsDPSetTexturePersp G_TP_PERSP
    gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
    gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
    gsDPSetEnvColor 255, 255, 255, 255
    gsDPSetTextureFilter G_TF_BILERP
    gsSPEndDisplayList

.elseif VERSION_US == 1
glabel dl_ia8_text_begin
    gsDPPipeSync
    gsSPClearGeometryMode G_LIGHTING
    gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
    gsDPSetEnvColor 255, 255, 255, 255
    gsDPSetRenderMode G_RM_XLU_SURF, G_RM_XLU_SURF2
    gsDPSetTextureFilter G_TF_POINT
    gsSPTexture 65535, 65535, 0, 0, 1
    gsSPEndDisplayList

glabel dl_ia8_render_char
    gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
    gsDPLoadSync
    gsDPLoadBlock 7, 0, 0, 0x1F, 0x800
    gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_4b, 1, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
    gsDPSetTileSize 0, 0, 0, 60, 28
    gsSPVertex vertex_ia8_char, 4, 0
    gsSP2Triangles  0,  1,  2, 0x0, 0,  2,  3, 0x0
    gsSPEndDisplayList
.else
glabel dl_ia8_text_begin # 0x0200EE68 - 0x0200EEA8
    gsDPPipeSync
    gsSPClearGeometryMode G_LIGHTING
    gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
    gsDPSetEnvColor 255, 255, 255, 255
    gsDPSetRenderMode G_RM_XLU_SURF, G_RM_XLU_SURF2
    gsDPSetTextureFilter G_TF_POINT
    gsSPTexture -32768, -32768, 0, 0, 1
    gsSPEndDisplayList

glabel dl_ia8_render_char # 0x0200EEA8 - 0x0200EEF0
    gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD
    gsDPLoadSync
    gsDPLoadBlock 7, 0, 0, 0x07F, 0x800
    gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 1, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD
    gsDPSetTileSize 0, 0, 0, 28, 60
    gsSPVertex vertex_ia8_char, 4, 0
    gsSP2Triangles  0,  1,  2, 0x0, 0,  2,  3, 0x0
    gsSPEndDisplayList
.endif

.ifndef VERSION_EU
glabel dl_ia8_text_end # 0x0200EEF0 - 0x0200EF30
gsDPPipeSync
gsSPTexture -1, -1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetTextureFilter G_TF_BILERP
gsSPEndDisplayList
.endif

vertex_triangle: # 0x0200EF30 - 0x0200EF60
vertex      0,      0,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      8,      8,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     16,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel dl_draw_triangle # 0x0200EF60 - 0x0200EFB0
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_SHADE, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_SHADE, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetRenderMode G_RM_XLU_SURF, G_RM_XLU_SURF2
gsDPSetTextureFilter G_TF_POINT
gsSPVertex vertex_triangle, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_LIGHTING

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

vertex_billboard_num: # 0x0200EFB0 - 0x0200EFF0
vertex    -32,    -32,      0,      0,   1024,  0xFF, 0xFF, 0xFF, 0xFF
vertex     32,    -32,      0,   1024,   1024,  0xFF, 0xFF, 0xFF, 0xFF
vertex     32,     32,      0,   1024,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -32,     32,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel dl_billboard_num_begin # 0x0200EFF0 - 0x0200F038
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -32768, -32768, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPEndDisplayList

glabel dl_billboard_num_end # 0x0200F038 - 0x0200F078
gsSPVertex vertex_billboard_num, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -32768, -32768, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel dl_billboard_num_0 # 0x0200F078 - 0x0200F0A8
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_1 # 0x0200F0A8 - 0x0200F0D8
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_2 # 0x0200F0D8 - 0x0200F108
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_3 # 0x0200F108 - 0x0200F138
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_3
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_4 # 0x0200F138 - 0x0200F168
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_4
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_5 # 0x0200F168 - 0x0200F198
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_5
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_6 # 0x0200F198 - 0x0200F1C8
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_6
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_7 # 0x0200F1C8 - 0x0200F1F8
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_7
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_8 # 0x0200F1F8 - 0x0200F228
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

glabel dl_billboard_num_9 # 0x0200F228 - 0x0200F258
gsSPDisplayList dl_billboard_num_begin
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_9
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPDisplayList dl_billboard_num_end
gsSPEndDisplayList

texture_shadow_quarter_circle:
.incbin "textures/segment2/shadow_quarter_circle.ia8"

texture_shadow_quarter_square:
.incbin "textures/segment2/shadow_quarter_square.ia8"

glabel texture_transition_star_half
.incbin "textures/segment2/segment2.0F458.ia8"

glabel texture_transition_circle_half
.incbin "textures/segment2/segment2.0FC58.ia8"

glabel texture_transition_mario
.incbin "textures/segment2/segment2.10458.ia8"

glabel texture_transition_bowser_half
.incbin "textures/segment2/segment2.11458.ia8"

glabel texture_waterbox_water
.incbin "textures/segment2/segment2.11C58.rgba16"

glabel texture_waterbox_jrb_water
.incbin "textures/segment2/segment2.12458.rgba16"

glabel texture_waterbox_unknown_water
.incbin "textures/segment2/segment2.12C58.rgba16"

glabel texture_waterbox_mist
.incbin "textures/segment2/segment2.13458.ia16"

glabel texture_waterbox_lava
.incbin "textures/segment2/segment2.13C58.rgba16"

# 14458-178CF: TODO
light_unused:
.byte 0x40, 0x40, 0x40, 0x00, 0x40, 0x40, 0x40, 0x00
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

matrix_identity: # 0x02014470 - 0x020144B0
.hword     1,     0,     0,     0
.hword     0,     1,     0,     0
.hword     0,     0,     1,     0
.hword     0,     0,     0,     1
.hword     0,     0,     0,     0
.hword     0,     0,     0,     0
.hword     0,     0,     0,     0
.hword     0,     0,     0,     0

matrix_fullscreen: # 0x020144B0 - 0x020144F0
.hword     0,     0,     0,     0
.hword     0,     0,     0,     0
.hword     0,     0,    -1,     0
.hword    -1,    -1,    -1,     1
.hword   409,     0,     0,     0
.hword     0,   546,     0,     0
.hword     0,     0,     0,     0
.hword     0,     0,     0,     0

glabel dl_draw_quad_verts_0123 # 0x020144F0 - 0x02014508
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel dl_draw_quad_verts_4567 # 0x02014508 - 0x02014520
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel dl_shadow_begin
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel dl_shadow_circle
gsSPDisplayList dl_shadow_begin
gsDPLoadTextureBlock texture_shadow_quarter_circle, G_IM_FMT_IA, G_IM_SIZ_8b, 16, 16, 0, G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 4, 4, G_TX_NOLOD, G_TX_NOLOD
gsSPEndDisplayList

glabel dl_shadow_square
gsSPDisplayList dl_shadow_begin
gsDPLoadTextureBlock texture_shadow_quarter_square, G_IM_FMT_IA, G_IM_SIZ_8b, 16, 16, 0, G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 4, 4, G_TX_NOLOD, G_TX_NOLOD
gsSPEndDisplayList

glabel dl_shadow_9_verts # 0x020145D8 - 0x02014620
gsSP2Triangles  0,  3,  4, 0x0,  0,  4,  1, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  4,  7,  8, 0x0,  4,  8,  5, 0x0
gsSPEndDisplayList

glabel dl_shadow_4_verts # 0x02014620 - 0x02014638
gsSP2Triangles  0,  2,  1, 0x0,  1,  2,  3, 0x0
gsSPEndDisplayList

glabel dl_shadow_end # 0x02014638 - 0x02014660
gsDPPipeSync
gsSPTexture -1, -1, 0, 0, 0
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel dl_proj_mtx_fullscreen # 0x02014660 - 0x02014698
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsSPMatrix matrix_identity, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH
gsSPMatrix matrix_fullscreen, G_MTX_PROJECTION
gsSPMatrix matrix_identity, G_MTX_LOAD
gsSPPerspNormalize 0xFFFF
gsSPEndDisplayList

glabel dl_screen_transition_end # 0x02014698 - 0x020146C0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_OPA_SURF, G_RM_OPA_SURF2
# It could also be one of these:
# G_RM_OPA_SURF, G_RM_OPA_CI2; G_RM_OPA_CI, G_RM_OPA_SURF2; G_RM_PASS, G_RM_OPA_SURF2;

gsSPEndDisplayList

glabel dl_transition_draw_filled_region # 0x020146C0 - 0x02014708
gsSP2Triangles  0,  4,  1, 0x0,  1,  4,  5, 0x0
gsSP2Triangles  1,  5,  2, 0x0,  2,  5,  6, 0x0
gsSP2Triangles  2,  6,  7, 0x0,  2,  7,  3, 0x0
gsSP2Triangles  3,  4,  0, 0x0,  3,  7,  4, 0x0
gsSPEndDisplayList

glabel dl_skybox_begin # 0x02014708 - 0x02014738
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPPerspNormalize 0xFFFF
gsSPMatrix matrix_identity, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH
gsSPEndDisplayList

glabel dl_skybox_tex_settings # 0x02014738 - 0x02014768
gsSPMatrix matrix_identity, G_MTX_LOAD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel dl_skybox_end # 0x02014768 - 0x02014790
gsDPPipeSync
gsSPTexture -1, -1, 0, 0, 0
gsSPSetGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel dl_waterbox_rgba16_begin # 0x02014790 - 0x020147D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel dl_waterbox_ia16_begin # 0x020147D0 - 0x02014810
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel dl_waterbox_end # 0x02014810 - 0x02014838
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

texture_ia8_up_arrow: # 0x02014838 - 0x02014878
.incbin "textures/segment2/segment2.14838.ia8"

glabel dl_ia8_up_arrow_begin # 0x02014878 - 0x020148B0
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetRenderMode G_RM_XLU_SURF, G_RM_NOOP2
gsSPPerspNormalize 0xFFFF
gsSPMatrix matrix_identity, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH
gsSPEndDisplayList

glabel dl_rgba16_unknown_tex_settings # 0x020148B0 - 0x020148E0
gsSPMatrix matrix_identity, G_MTX_LOAD
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel dl_ia8_up_arrow_load_texture_block # 0x020148E0 - 0x02014938
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 1, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 28, 28
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_8b, 1, texture_ia8_up_arrow
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x03F, 0x800
gsSPEndDisplayList

glabel dl_ia8_up_arrow_end # 0x02014938 - 0x02014958
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

seg2_light_02014958: # 0x02014958 - 0x02014960
.byte 0x50, 0x50, 0x50, 0x00, 0x50, 0x50, 0x50, 0x00

seg2_light_02014960: # 0x02014960 - 0x02014970
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x32, 0x32, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00

glabel dl_paintings_rippling_begin # 0x02014970 - 0x020149A8
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPLight seg2_light_02014960, 1
gsSPLight seg2_light_02014958, 2
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel dl_paintings_rippling_end # 0x020149A8 - 0x020149C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel dl_paintings_env_mapped_begin # 0x020149C8 - 0x02014A00
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight seg2_light_02014960, 1
gsSPLight seg2_light_02014958, 2
gsSPTexture 16384, 16384, 0, 0, 1
gsSPEndDisplayList

glabel dl_paintings_env_mapped_end # 0x02014A00 - 0x02014A30
gsSPTexture 16384, 16384, 0, 0, 0
gsDPPipeSync
gsSPGeometryMode G_TEXTURE_GEN, G_LIGHTING, G_ORDER_SFIRST
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel dl_paintings_draw_ripples # 0x02014A30 - 0x02014A60
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPEndDisplayList

# 14A60-15BAD: count and triangles?
# 14A60: triangle mesh
glabel seg2_triangle_mesh # 0x02014A60
.hword 157
.hword 614, 583,   0 # 0
.hword 614, 614,   0 # 1
.hword 562, 614,   0 # 2
.hword 562, 553,   1 # 3
.hword 614, 522,   0 # 4
.hword 511, 583,   1 # 5
.hword 511, 614,   0 # 6
.hword 307, 614,   0 # 7
.hword 307, 583,   1 # 8
.hword 358, 614,   0 # 9
.hword 256, 614,   0 # 10
.hword 256, 553,   1 # 11
.hword 307, 522,   1 # 12
.hword 358, 553,   1 # 13
.hword 409, 583,   1 # 14
.hword 460, 614,   0 # 15
.hword 511, 522,   1 # 16
.hword 460, 553,   1 # 17
.hword 409, 522,   1 # 18
.hword 562, 307,   1 # 19
.hword 614, 338,   0 # 20
.hword 562, 430,   1 # 21
.hword 614, 399,   0 # 22
.hword 562, 368,   1 # 23
.hword 511, 338,   1 # 24
.hword 460, 307,   1 # 25
.hword 460, 430,   1 # 26
.hword 511, 399,   1 # 27
.hword 511, 460,   1 # 28
.hword 409, 338,   1 # 29
.hword 460, 368,   1 # 30
.hword 358, 307,   1 # 31
.hword 409, 460,   1 # 32
.hword 358, 430,   1 # 33
.hword 409, 399,   1 # 34
.hword 358, 368,   1 # 35
.hword 307, 338,   1 # 36
.hword 256, 307,   1 # 37
.hword 307, 399,   1 # 38
.hword 256, 430,   1 # 39
.hword 307, 460,   1 # 40
.hword 614, 460,   0 # 41
.hword 562, 491,   1 # 42
.hword 460, 491,   1 # 43
.hword 358, 491,   1 # 44
.hword 256, 491,   1 # 45
.hword 409, 276,   1 # 46
.hword 511, 276,   1 # 47
.hword 307, 276,   1 # 48
.hword 614,  31,   0 # 49
.hword 614,   0,   0 # 50
.hword 562,   0,   0 # 51
.hword 562, 123,   1 # 52
.hword 614,  92,   0 # 53
.hword 511,  31,   1 # 54
.hword 562,  61,   1 # 55
.hword 460,   0,   0 # 56
.hword 511,   0,   0 # 57
.hword 460, 123,   1 # 58
.hword 511,  92,   1 # 59
.hword 511, 153,   1 # 60
.hword 409,  31,   1 # 61
.hword 460,  61,   1 # 62
.hword 358,   0,   0 # 63
.hword 409,   0,   0 # 64
.hword 409,  92,   1 # 65
.hword 358, 123,   1 # 66
.hword 409, 153,   1 # 67
.hword 307,  31,   1 # 68
.hword 358,  61,   1 # 69
.hword 256,   0,   0 # 70
.hword 307,   0,   0 # 71
.hword 256, 123,   1 # 72
.hword 307,  92,   1 # 73
.hword 307, 153,   1 # 74
.hword 614, 153,   0 # 75
.hword 562, 246,   1 # 76
.hword 614, 215,   0 # 77
.hword 562, 184,   1 # 78
.hword 460, 246,   1 # 79
.hword 511, 215,   1 # 80
.hword 460, 184,   1 # 81
.hword 358, 246,   1 # 82
.hword 409, 215,   1 # 83
.hword 358, 184,   1 # 84
.hword 256, 246,   1 # 85
.hword 307, 215,   1 # 86
.hword 205, 583,   1 # 87
.hword   0, 614,   0 # 88
.hword   0, 583,   0 # 89
.hword  51, 614,   0 # 90
.hword  51, 553,   1 # 91
.hword 102, 583,   1 # 92
.hword 205, 522,   1 # 93
.hword 153, 553,   1 # 94
.hword 153, 614,   0 # 95
.hword 102, 522,   1 # 96
.hword 256, 368,   1 # 97
.hword 205, 338,   1 # 98
.hword 153, 307,   1 # 99
.hword 153, 430,   1 # 100
.hword 205, 399,   1 # 101
.hword 205, 460,   1 # 102
.hword 153, 368,   1 # 103
.hword 102, 338,   1 # 104
.hword  51, 307,   1 # 105
.hword  51, 430,   1 # 106
.hword 102, 399,   1 # 107
.hword 102, 460,   1 # 108
.hword  51, 368,   1 # 109
.hword   0, 338,   0 # 110
.hword   0, 460,   0 # 111
.hword 153, 491,   1 # 112
.hword  51, 491,   1 # 113
.hword 153, 246,   1 # 114
.hword 102, 276,   1 # 115
.hword 205, 276,   1 # 116
.hword   0, 276,   0 # 117
.hword  51, 246,   1 # 118
.hword 205,  31,   1 # 119
.hword 256,  61,   1 # 120
.hword 205,   0,   0 # 121
.hword 153,   0,   0 # 122
.hword 205, 153,   1 # 123
.hword 205,  92,   1 # 124
.hword 153, 123,   1 # 125
.hword 102,  31,   1 # 126
.hword 153,  61,   1 # 127
.hword 102,   0,   0 # 128
.hword  51,   0,   0 # 129
.hword  51, 123,   1 # 130
.hword 102,  92,   1 # 131
.hword 102, 153,   1 # 132
.hword   0,  31,   0 # 133
.hword  51,  61,   1 # 134
.hword   0, 153,   0 # 135
.hword 256, 184,   1 # 136
.hword 205, 215,   1 # 137
.hword 153, 184,   1 # 138
.hword 102, 215,   1 # 139
.hword  51, 184,   1 # 140
.hword 409, 614,   0 # 141
.hword 614, 307,   0 # 142
.hword 614, 276,   0 # 143
.hword 511, 307,   1 # 144
.hword 409, 307,   1 # 145
.hword 307, 307,   1 # 146
.hword 205, 614,   0 # 147
.hword   0, 522,   0 # 148
.hword 102, 614,   0 # 149
.hword 205, 307,   1 # 150
.hword 102, 307,   1 # 151
.hword   0, 399,   0 # 152
.hword   0, 307,   0 # 153
.hword   0, 215,   0 # 154
.hword   0,  92,   0 # 155
.hword   0,   0,   0 # 156
# triangles
.hword 264
.hword   8,  12,  13 # 0
.hword   0,   1,   2 # 1
.hword   3,   0,   2 # 2
.hword   4,   0,   3 # 3
.hword   5,   2,   6 # 4
.hword   2,   5,   3 # 5
.hword   7,   8,   9 # 6
.hword   8,   7,  10 # 7
.hword  11,   8,  10 # 8
.hword  12,   8,  11 # 9
.hword   9,   8,  13 # 10
.hword  13,  14,   9 # 11
.hword  14, 141,   9 # 12
.hword   5,   6,  15 # 13
.hword   5,  16,   3 # 14
.hword  16,   5,  17 # 15
.hword  17,   5,  15 # 16
.hword  14,  15, 141 # 17
.hword  15,  14,  17 # 18
.hword  18,  14,  13 # 19
.hword  14,  18,  17 # 20
.hword  19, 142,  20 # 21
.hword  19,  20,  23 # 22
.hword  28,  27,  21 # 23
.hword  21,  23,  22 # 24
.hword  22,  41,  21 # 25
.hword  20,  22,  23 # 26
.hword  23,  24,  19 # 27
.hword  21,  27,  23 # 28
.hword  24,  23,  27 # 29
.hword  25, 144,  24 # 30
.hword  19,  24, 144 # 31
.hword  24,  27,  30 # 32
.hword  25,  24,  30 # 33
.hword  26,  30,  27 # 34
.hword  27,  28,  26 # 35
.hword  36,  38,  97 # 36
.hword  26,  34,  30 # 37
.hword  29,  30,  34 # 38
.hword  30,  29,  25 # 39
.hword  25,  29, 145 # 40
.hword  31, 145,  29 # 41
.hword  31,  29,  35 # 42
.hword  29,  34,  35 # 43
.hword  32,  34,  26 # 44
.hword  33,  35,  34 # 45
.hword  34,  32,  33 # 46
.hword  33,  38,  35 # 47
.hword  35,  36,  31 # 48
.hword  36,  35,  38 # 49
.hword  37,  36,  97 # 50
.hword  37, 146,  36 # 51
.hword  31,  36, 146 # 52
.hword  28,  16,  43 # 53
.hword  38,  40,  39 # 54
.hword  39,  97,  38 # 55
.hword  40,  38,  33 # 56
.hword  21,  41,  42 # 57
.hword  41,   4,  42 # 58
.hword   3,  42,   4 # 59
.hword  42,  28,  21 # 60
.hword  28,  42,  16 # 61
.hword   3,  16,  42 # 62
.hword  26,  28,  43 # 63
.hword  17,  43,  16 # 64
.hword  43,  32,  26 # 65
.hword  32,  43,  18 # 66
.hword  17,  18,  43 # 67
.hword  33,  32,  44 # 68
.hword  32,  18,  44 # 69
.hword  13,  44,  18 # 70
.hword  44,  40,  33 # 71
.hword  13,  12,  44 # 72
.hword  40,  44,  12 # 73
.hword  39,  40,  45 # 74
.hword  40,  12,  45 # 75
.hword  48,  31, 146 # 76
.hword  11,  45,  12 # 77
.hword  25,  47, 144 # 78
.hword  46,  25, 145 # 79
.hword  47,  19, 144 # 80
.hword  19, 143, 142 # 81
.hword  31,  46, 145 # 82
.hword  60,  59,  52 # 83
.hword  49,  53,  55 # 84
.hword  50,  49,  51 # 85
.hword  51,  49,  55 # 86
.hword  52,  55,  53 # 87
.hword  53,  75,  52 # 88
.hword  54,  55,  59 # 89
.hword  52,  59,  55 # 90
.hword  55,  54,  51 # 91
.hword  54,  59,  62 # 92
.hword  56,  54,  62 # 93
.hword  57,  54,  56 # 94
.hword  54,  57,  51 # 95
.hword  58,  62,  59 # 96
.hword  59,  60,  58 # 97
.hword  68,  71,  63 # 98
.hword  61,  62,  65 # 99
.hword  58,  65,  62 # 100
.hword  62,  61,  56 # 101
.hword  61,  65,  69 # 102
.hword  63,  61,  69 # 103
.hword  64,  61,  63 # 104
.hword  61,  64,  56 # 105
.hword  65,  67,  66 # 106
.hword  66,  69,  65 # 107
.hword  67,  65,  58 # 108
.hword  68,  69,  73 # 109
.hword  69,  68,  63 # 110
.hword  66,  73,  69 # 111
.hword  68,  73, 120 # 112
.hword  70,  68, 120 # 113
.hword  71,  68,  70 # 114
.hword  72, 120,  73 # 115
.hword  73,  74,  72 # 116
.hword  74,  73,  66 # 117
.hword  75,  77,  78 # 118
.hword  52,  75,  78 # 119
.hword  76,  78,  77 # 120
.hword  77, 143,  76 # 121
.hword  76,  80,  78 # 122
.hword  60,  78,  80 # 123
.hword  78,  60,  52 # 124
.hword  46,  83,  79 # 125
.hword  58,  60,  81 # 126
.hword  60,  80,  81 # 127
.hword  79,  81,  80 # 128
.hword  80,  47,  79 # 129
.hword  47,  80,  76 # 130
.hword  81,  67,  58 # 131
.hword  67,  81,  83 # 132
.hword  79,  83,  81 # 133
.hword  66,  67,  84 # 134
.hword  67,  83,  84 # 135
.hword  82,  84,  83 # 136
.hword  83,  46,  82 # 137
.hword  84,  74,  66 # 138
.hword  82,  86,  84 # 139
.hword  74,  84,  86 # 140
.hword  74,  86, 136 # 141
.hword  72,  74, 136 # 142
.hword  85, 136,  86 # 143
.hword  86,  48,  85 # 144
.hword  48,  86,  82 # 145
.hword  25,  46,  79 # 146
.hword  79,  47,  25 # 147
.hword  82,  46,  31 # 148
.hword  19,  47,  76 # 149
.hword  76, 143,  19 # 150
.hword  31,  48,  82 # 151
.hword  37,  48, 146 # 152
.hword  85,  48,  37 # 153
.hword  10,  87,  11 # 154
.hword  87,  10, 147 # 155
.hword  92,  95, 149 # 156
.hword  88,  89,  90 # 157
.hword  89, 148,  91 # 158
.hword  90,  89,  91 # 159
.hword  91,  92,  90 # 160
.hword  92, 149,  90 # 161
.hword  93,  87,  94 # 162
.hword  87,  93,  11 # 163
.hword  94,  87,  95 # 164
.hword  87, 147,  95 # 165
.hword  95,  92,  94 # 166
.hword  96,  92,  91 # 167
.hword  92,  96,  94 # 168
.hword  39, 101,  97 # 169
.hword  97,  98,  37 # 170
.hword  98,  97, 101 # 171
.hword  99,  98, 103 # 172
.hword  99, 150,  98 # 173
.hword  37,  98, 150 # 174
.hword  98, 101, 103 # 175
.hword 100, 103, 101 # 176
.hword 101, 102, 100 # 177
.hword 102, 101,  39 # 178
.hword 100, 107, 103 # 179
.hword 103, 104,  99 # 180
.hword 104, 103, 107 # 181
.hword 105, 104, 109 # 182
.hword 105, 151, 104 # 183
.hword  99, 104, 151 # 184
.hword 104, 107, 109 # 185
.hword 106, 109, 107 # 186
.hword 107, 108, 106 # 187
.hword 108, 107, 100 # 188
.hword 109, 110, 105 # 189
.hword 106, 152, 109 # 190
.hword 110, 109, 152 # 191
.hword 105, 110, 153 # 192
.hword 111, 152, 106 # 193
.hword  11,  93,  45 # 194
.hword 102,  45,  93 # 195
.hword  45, 102,  39 # 196
.hword 102,  93, 112 # 197
.hword 100, 102, 112 # 198
.hword  94, 112,  93 # 199
.hword 112, 108, 100 # 200
.hword 108, 112,  96 # 201
.hword  94,  96, 112 # 202
.hword 106, 108, 113 # 203
.hword 108,  96, 113 # 204
.hword  91, 113,  96 # 205
.hword  91, 148, 113 # 206
.hword 113, 111, 106 # 207
.hword 111, 113, 148 # 208
.hword 114, 116,  99 # 209
.hword  99, 115, 114 # 210
.hword 115,  99, 151 # 211
.hword  99, 116, 150 # 212
.hword  72, 124, 120 # 213
.hword 116,  37, 150 # 214
.hword  37, 116,  85 # 215
.hword 117, 105, 153 # 216
.hword 105, 115, 151 # 217
.hword 105, 117, 118 # 218
.hword 118, 115, 105 # 219
.hword 119, 120, 124 # 220
.hword 120, 119,  70 # 221
.hword 119, 124, 127 # 222
.hword 119, 121,  70 # 223
.hword 121, 119, 122 # 224
.hword 122, 119, 127 # 225
.hword 123, 124,  72 # 226
.hword 124, 123, 125 # 227
.hword 125, 127, 124 # 228
.hword 126, 127, 131 # 229
.hword 127, 126, 122 # 230
.hword 125, 131, 127 # 231
.hword 126, 131, 134 # 232
.hword 128, 126, 129 # 233
.hword 129, 126, 134 # 234
.hword 126, 128, 122 # 235
.hword 136, 123,  72 # 236
.hword 130, 134, 131 # 237
.hword 131, 132, 130 # 238
.hword 132, 131, 125 # 239
.hword 133, 134, 155 # 240
.hword 134, 133, 129 # 241
.hword 130, 155, 134 # 242
.hword 133, 156, 129 # 243
.hword 135, 155, 130 # 244
.hword 123, 136, 137 # 245
.hword  85, 137, 136 # 246
.hword 139, 115, 118 # 247
.hword 123, 137, 138 # 248
.hword 125, 123, 138 # 249
.hword 114, 138, 137 # 250
.hword 137, 116, 114 # 251
.hword 116, 137,  85 # 252
.hword 114, 139, 138 # 253
.hword 132, 138, 139 # 254
.hword 138, 132, 125 # 255
.hword 132, 139, 140 # 256
.hword 130, 132, 140 # 257
.hword 115, 139, 114 # 258
.hword 118, 140, 139 # 259
.hword 135, 140, 154 # 260
.hword 118, 154, 140 # 261
.hword 140, 135, 130 # 262
.hword 117, 154, 118 # 263
.hword 0 # TODO: alignment?

glabel seg2_mesh_order # 0x02015444: TODO
.hword   3,   1,   2,   3,   1,   1,   4
.hword   1,   2,   4,   5,   6,   2,   3,   5
.hword  14,  59,  62,   3,   3,  58,  59,   6
.hword   4,   5,  13,  14,  15,  16,   2,   4
.hword  13,   2,   6,   7,   6,   0,   6,   7
.hword   8,   9,  10,   4,   6,  10,  11,  12
.hword   4,   7,   8, 154, 155,   6,   8,   9
.hword  77, 154, 163, 194,   6,   0,   9,  72
.hword  73,  75,  77,   6,   0,  10,  11,  19
.hword  70,  72,   6,  11,  12,  17,  18,  19
.hword  20,   4,  13,  16,  17,  18,   6,  14
.hword  15,  53,  61,  62,  64,   6,  15,  16
.hword  18,  20,  64,  67,   6,  19,  20,  66
.hword  67,  69,  70,   8,  21,  22,  27,  31
.hword  80,  81, 149, 150,   3,  21,  22,  26
.hword   6,  23,  24,  25,  28,  57,  60,   3
.hword  24,  25,  26,   6,  22,  24,  26,  27
.hword  28,  29,   6,  27,  29,  30,  31,  32
.hword  33,   8,  30,  33,  39,  40,  78,  79
.hword 146, 147,   6,  34,  35,  37,  44,  63
.hword  65,   6,  23,  28,  29,  32,  34,  35
.hword   6,  23,  35,  53,  60,  61,  63,   6
.hword  38,  39,  40,  41,  42,  43,   6,  32
.hword  33,  34,  37,  38,  39,   8,  41,  42
.hword  48,  52,  76,  82, 148, 151,   6,  44
.hword  46,  65,  66,  68,  69,   6,  45,  46
.hword  47,  56,  68,  71,   6,  37,  38,  43
.hword  44,  45,  46,   6,  42,  43,  45,  47
.hword  48,  49,   6,  36,  48,  49,  50,  51
.hword  52,   8,  50,  51, 152, 153, 170, 174
.hword 214, 215,   6,  36,  47,  49,  54,  55
.hword  56,   6,  54,  55,  74, 169, 178, 196
.hword   6,  54,  56,  71,  73,  74,  75,   3
.hword  25,  57,  58,   6,  57,  58,  59,  60
.hword  61,  62,   6,  53,  63,  64,  65,  66
.hword  67,   6,  68,  69,  70,  71,  72,  73
.hword   6,  74,  75,  77, 194, 195, 196,   6
.hword  79,  82, 125, 137, 146, 148,   6,  78
.hword  80, 129, 130, 147, 149,   6,  76, 144
.hword 145, 151, 152, 153,   3,  84,  85,  86
.hword   1,  85,   4,  85,  86,  91,  95,   6
.hword  83,  87,  88,  90, 119, 124,   3,  84
.hword  87,  88,   6,  89,  91,  92,  93,  94
.hword  95,   6,  84,  86,  87,  89,  90,  91
.hword   4,  93,  94, 101, 105,   2,  94,  95
.hword   6,  96,  97, 100, 108, 126, 131,   6
.hword  83,  89,  90,  92,  96,  97,   6,  83
.hword  97, 123, 124, 126, 127,   6,  99, 101
.hword 102, 103, 104, 105,   6,  92,  93,  96
.hword  99, 100, 101,   4,  98, 103, 104, 110
.hword   2, 104, 105,   6,  99, 100, 102, 106
.hword 107, 108,   6, 106, 107, 111, 117, 134
.hword 138,   6, 106, 108, 131, 132, 134, 135
.hword   6,  98, 109, 110, 112, 113, 114,   6
.hword 102, 103, 107, 109, 110, 111,   4, 113
.hword 114, 221, 223,   2,  98, 114,   6, 115
.hword 116, 142, 213, 226, 236,   6, 109, 111
.hword 112, 115, 116, 117,   6, 116, 117, 138
.hword 140, 141, 142,   3,  88, 118, 119,   6
.hword 120, 121, 122, 130, 149, 150,   3, 118
.hword 120, 121,   6, 118, 119, 120, 122, 123
.hword 124,   6, 125, 128, 129, 133, 146, 147
.hword   6, 122, 123, 127, 128, 129, 130,   6
.hword 126, 127, 128, 131, 132, 133,   6, 136
.hword 137, 139, 145, 148, 151,   6, 125, 132
.hword 133, 135, 136, 137,   6, 134, 135, 136
.hword 138, 139, 140,   6, 143, 144, 153, 215
.hword 246, 252,   6, 139, 140, 141, 143, 144
.hword 145,   6, 154, 155, 162, 163, 164, 165
.hword   1, 157,   3, 157, 158, 159,   4, 157
.hword 159, 160, 161,   6, 158, 159, 160, 167
.hword 205, 206,   6, 156, 160, 161, 166, 167
.hword 168,   6, 162, 163, 194, 195, 197, 199
.hword   6, 162, 164, 166, 168, 199, 202,   4
.hword 156, 164, 165, 166,   6, 167, 168, 201
.hword 202, 204, 205,   6,  36,  50,  55, 169
.hword 170, 171,   6, 170, 171, 172, 173, 174
.hword 175,   8, 172, 173, 180, 184, 209, 210
.hword 211, 212,   6, 176, 177, 179, 188, 198
.hword 200,   6, 169, 171, 175, 176, 177, 178
.hword   6, 177, 178, 195, 196, 197, 198,   6
.hword 172, 175, 176, 179, 180, 181,   6, 180
.hword 181, 182, 183, 184, 185,   8, 182, 183
.hword 189, 192, 216, 217, 218, 219,   6, 186
.hword 187, 190, 193, 203, 207,   6, 179, 181
.hword 185, 186, 187, 188,   6, 187, 188, 200
.hword 201, 203, 204,   6, 182, 185, 186, 189
.hword 190, 191,   3, 189, 191, 192,   3, 193
.hword 207, 208,   6, 197, 198, 199, 200, 201
.hword 202,   6, 203, 204, 205, 206, 207, 208
.hword   6, 209, 210, 250, 251, 253, 258,   6
.hword 210, 211, 217, 219, 247, 258,   6, 209
.hword 212, 214, 215, 251, 252,   3, 216, 218
.hword 263,   6, 218, 219, 247, 259, 261, 263
.hword   6, 220, 221, 222, 223, 224, 225,   6
.hword 112, 113, 115, 213, 220, 221,   2, 223
.hword 224,   4, 224, 225, 230, 235,   6, 226
.hword 227, 236, 245, 248, 249,   6, 213, 220
.hword 222, 226, 227, 228,   6, 227, 228, 231
.hword 239, 249, 255,   6, 229, 230, 232, 233
.hword 234, 235,   6, 222, 225, 228, 229, 230
.hword 231,   2, 233, 235,   4, 233, 234, 241
.hword 243,   6, 237, 238, 242, 244, 257, 262
.hword   6, 229, 231, 232, 237, 238, 239,   6
.hword 238, 239, 254, 255, 256, 257,   3, 240
.hword 241, 243,   6, 232, 234, 237, 240, 241
.hword 242,   3, 244, 260, 262,   6, 141, 142
.hword 143, 236, 245, 246,   6, 245, 246, 248
.hword 250, 251, 252,   6, 248, 249, 250, 253
.hword 254, 255,   6, 247, 253, 254, 256, 258
.hword 259,   6, 256, 257, 259, 260, 261, 262
.hword   2,  12,  17,   2,  21,  81,   3,  81
.hword 121, 150,   4,  30,  31,  78,  80,   4
.hword  40,  41,  79,  82,   4,  51,  52,  76
.hword 152,   2, 155, 165,   3, 158, 206, 208
.hword   2, 156, 161,   4, 173, 174, 212, 214
.hword   4, 183, 184, 211, 217,   3, 190, 191
.hword 193,   2, 192, 216,   3, 260, 261, 263
.hword   3, 240, 242, 244,   1, 243
