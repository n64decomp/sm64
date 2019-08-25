ttc_seg7_light_070100B0: # 0x070100B0 - 0x070100B8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_070100B8: # 0x070100B8 - 0x070100C8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_070100C8: # 0x070100C8 - 0x070101C8
vertex    102,    102,   -450,    224,    990,  0x38, 0x71, 0x00, 0xFF
vertex   -101,    102,     10,   2268,      0,  0xCD, 0x67, 0x33, 0xFF
vertex    102,    102,     10,    224,      0,  0x54, 0x2A, 0x54, 0xFF
vertex    102,    102,     10,   2268,      0,  0x54, 0x2A, 0x54, 0xFF
vertex    102,   -101,   -450,    224,    990,  0x71, 0xC8, 0x00, 0xFF
vertex    102,    102,   -450,   2268,    990,  0x38, 0x71, 0x00, 0xFF
vertex    102,   -101,     10,    224,      0,  0x33, 0x99, 0x33, 0xFF
vertex   -101,    102,   -450,  -1308,    990,  0x8F, 0x38, 0x00, 0xFF
vertex   -101,   -101,   -450,    734,    990,  0xC8, 0x8F, 0x00, 0xFF
vertex   -101,   -101,     10,    734,      0,  0xAC, 0xD6, 0x54, 0xFF
vertex   -101,    102,     10,  -1308,      0,  0xCD, 0x67, 0x33, 0xFF
vertex    102,   -101,     10,   2268,      0,  0x33, 0x99, 0x33, 0xFF
vertex   -101,   -101,     10,    224,      0,  0xAC, 0xD6, 0x54, 0xFF
vertex   -101,   -101,   -450,    224,    990,  0xC8, 0x8F, 0x00, 0xFF
vertex    102,   -101,   -450,   2268,    990,  0x71, 0xC8, 0x00, 0xFF
vertex   -101,    102,   -450,   2268,    990,  0x8F, 0x38, 0x00, 0xFF

ttc_seg7_vertex_070101C8: # 0x070101C8 - 0x07010208
vertex    102,    102,     10,    990,     16,  0x54, 0x2A, 0x54, 0xFF
vertex   -101,   -101,     10,      0,    990,  0xAC, 0xD6, 0x54, 0xFF
vertex    102,   -101,     10,    990,    990,  0x33, 0x99, 0x33, 0xFF
vertex   -101,    102,     10,      0,     16,  0xCD, 0x67, 0x33, 0xFF

ttc_seg7_dl_07010208: # 0x07010208 - 0x07010280
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_070100B8, 1
gsSPLight ttc_seg7_light_070100B0, 2
gsSPVertex ttc_seg7_vertex_070100C8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

ttc_seg7_dl_07010280: # 0x07010280 - 0x070102B8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_070101C8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_070102B8 # 0x070102B8 - 0x07010380
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
gsSPDisplayList ttc_seg7_dl_07010208
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttc_seg7_dl_07010280
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
