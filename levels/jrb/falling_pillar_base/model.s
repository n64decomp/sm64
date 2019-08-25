jrb_seg7_light_0700AEF0: # 0x0700AEF0 - 0x0700AEF8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

jrb_seg7_light_0700AEF8: # 0x0700AEF8 - 0x0700AF08
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

jrb_seg7_vertex_0700AF08: # 0x0700AF08 - 0x0700AF58
vertex    102,      0,   -101,   2012,  -1054,  0x33, 0x67, 0xCC, 0xFF
vertex      0,    102,      0,    992,      0,  0x00, 0x7E, 0x00, 0xFF
vertex    102,      0,    102,   2012,    990,  0x33, 0x67, 0x33, 0xFF
vertex   -101,      0,   -101,      0,  -1054,  0xCC, 0x67, 0xCC, 0xFF
vertex   -101,      0,    102,      0,    990,  0xCC, 0x67, 0x33, 0xFF

jrb_seg7_dl_0700AF58: # 0x0700AF58 - 0x0700AFB0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPLight jrb_seg7_light_0700AEF8, 1
gsSPLight jrb_seg7_light_0700AEF0, 2
gsSPVertex jrb_seg7_vertex_0700AF08, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  1,  0,  3, 0x0
gsSPEndDisplayList

glabel jrb_seg7_dl_0700AFB0 # 0x0700AFB0 - 0x0700B058
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 5, 80, 75, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList jrb_seg7_dl_0700AF58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsSPEndDisplayList
