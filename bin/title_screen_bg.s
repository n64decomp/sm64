.section .rodata
.include "macros.inc"
.include "PR/gbi.inc"

title_screen_bg_vertex_0A000000: # 0x0A000000 - 0x0A000100
vertex      0,     60,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     60,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     80,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     80,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     40,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     40,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     60,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     60,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     20,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     20,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     40,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     40,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,      0,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     20,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     20,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel title_screen_bg_dl_0A000100 # 0x0A000100 - 0x0A000118
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_OPA_SURF, G_RM_AA_OPA_SURF2
# It could also be one of these:
# G_RM_AA_OPA_SURF, G_RM_RA_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_OPA_SURF2

gsSPEndDisplayList

glabel title_screen_bg_dl_0A000118 # 0x0A000118 - 0x0A000130
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex title_screen_bg_vertex_0A000000, 16, 0
gsSPEndDisplayList

glabel title_screen_bg_dl_0A000130 # 0x0A000130 - 0x0A000148
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel title_screen_bg_dl_0A000148 # 0x0A000148 - 0x0A000160
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel title_screen_bg_dl_0A000160 # 0x0A000160 - 0x0A000178
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel title_screen_bg_dl_0A000178 # 0x0A000178 - 0x0A000190
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

glabel title_screen_bg_dl_0A000190 # 0x0A000190 - 0x0A0001C0
gsDPPipeSync
gsSPTexture -1, -1, 0, 0, 0
gsSPSetGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsSPEndDisplayList

title_texture_0A0001C0: # 0x0A0001C0
.incbin "textures/title_screen_bg/title_screen_bg.001C0.rgba16"

title_texture_0A000E40: # 0x0A000E40
.incbin "textures/title_screen_bg/title_screen_bg.00E40.rgba16"

title_texture_0A001AC0: # 0x0A001AC0
.incbin "textures/title_screen_bg/title_screen_bg.01AC0.rgba16"

title_texture_0A002740: # 0x0A002740
.incbin "textures/title_screen_bg/title_screen_bg.02740.rgba16"

title_texture_0A0033C0: # 0x0A0033C0
.incbin "textures/title_screen_bg/title_screen_bg.033C0.rgba16"

title_texture_0A004040: # 0x0A004040
.incbin "textures/title_screen_bg/title_screen_bg.04040.rgba16"

title_texture_0A004CC0: # 0x0A004CC0
.incbin "textures/title_screen_bg/title_screen_bg.04CC0.rgba16"

title_texture_0A005940: # 0x0A005940
.incbin "textures/title_screen_bg/title_screen_bg.05940.rgba16"

glabel mario_title_texture_table # 0x0A0065C0
.word title_texture_0A0001C0, title_texture_0A000E40, title_texture_0A001AC0, title_texture_0A002740

glabel game_over_texture_table # 0x0A0065D0
.word title_texture_0A0033C0, title_texture_0A004040, title_texture_0A004CC0, title_texture_0A005940
.word 0x0, 0x0
