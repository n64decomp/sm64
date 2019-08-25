ttc_seg7_light_07010DE8: # 0x07010DE8 - 0x07010DF0
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_07010DF0: # 0x07010DF0 - 0x07010E00
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_07010E00: # 0x07010E00 - 0x07010E80
vertex    102,      0,    102,   1982,    960,  0x49, 0xB7, 0x49, 0xFF
vertex   -101,      0,    102,      0,    960,  0xB7, 0xB7, 0x49, 0xFF
vertex    102,      0,   -101,   1982,  -1054,  0x49, 0xB7, 0xB7, 0xFF
vertex   -101,      0,   -101,      0,  -1054,  0xB7, 0xB7, 0xB7, 0xFF
vertex    102,    205,   -101,   1982,  -1054,  0x33, 0x67, 0xCD, 0xFF
vertex   -101,    205,    102,      0,    960,  0xCD, 0x67, 0x33, 0xFF
vertex    102,    205,    102,   1982,    960,  0x54, 0x2A, 0x54, 0xFF
vertex   -101,    205,   -101,      0,  -1054,  0xAC, 0x2A, 0xAC, 0xFF

ttc_seg7_vertex_07010E80: # 0x07010E80 - 0x07010F80
vertex    102,    205,    102,   2012,      0,  0x54, 0x2A, 0x54, 0xFF
vertex   -101,    205,    102,      0,      0,  0xCD, 0x67, 0x33, 0xFF
vertex   -101,      0,    102,      0,    990,  0xB7, 0xB7, 0x49, 0xFF
vertex    102,    205,    102,      0,      0,  0x54, 0x2A, 0x54, 0xFF
vertex    102,      0,    102,      0,    990,  0x49, 0xB7, 0x49, 0xFF
vertex    102,      0,   -101,   2012,    990,  0x49, 0xB7, 0xB7, 0xFF
vertex    102,    205,   -101,   2012,      0,  0x33, 0x67, 0xCD, 0xFF
vertex   -101,    205,   -101,   2012,      0,  0xAC, 0x2A, 0xAC, 0xFF
vertex    102,      0,   -101,      0,    990,  0x49, 0xB7, 0xB7, 0xFF
vertex   -101,      0,   -101,   2012,    990,  0xB7, 0xB7, 0xB7, 0xFF
vertex    102,    205,   -101,      0,      0,  0x33, 0x67, 0xCD, 0xFF
vertex   -101,    205,   -101,      0,      0,  0xAC, 0x2A, 0xAC, 0xFF
vertex   -101,      0,   -101,      0,    990,  0xB7, 0xB7, 0xB7, 0xFF
vertex   -101,      0,    102,   2012,    990,  0xB7, 0xB7, 0x49, 0xFF
vertex   -101,    205,    102,   2012,      0,  0xCD, 0x67, 0x33, 0xFF
vertex    102,      0,    102,   2012,    990,  0x49, 0xB7, 0x49, 0xFF

ttc_seg7_dl_07010F80: # 0x07010F80 - 0x07010FD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_07010DF0, 1
gsSPLight ttc_seg7_light_07010DE8, 2
gsSPVertex ttc_seg7_vertex_07010E00, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

ttc_seg7_dl_07010FD8: # 0x07010FD8 - 0x07011040
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_07010E80, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_07011040 # 0x07011040 - 0x07011108
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 200, 255, 255, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttc_seg7_dl_07010F80
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttc_seg7_dl_07010FD8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
