hmc_seg7_light_0700FF70: # 0x0700FF70 - 0x0700FF78
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

hmc_seg7_light_0700FF78: # 0x0700FF78 - 0x0700FF88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_0700FF88: # 0x0700FF88 - 0x07010008
vertex   3891,      0,   4608,   1756,   -798,  0x00, 0x7F, 0x00, 0xFF
vertex   4403,      0,   4813,   2522,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   4198,      0,   4608,   2522,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   4403,      0,   5120,   1756,   1754,  0x00, 0x7F, 0x00, 0xFF
vertex   4198,      0,   5325,    734,   1754,  0x00, 0x7F, 0x00, 0xFF
vertex   3891,      0,   5325,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   3686,      0,   5120,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   3686,      0,   4813,    734,   -798,  0x00, 0x7F, 0x00, 0xFF

hmc_seg7_dl_07010008: # 0x07010008 - 0x07010070
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cave_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight hmc_seg7_light_0700FF78, 1
gsSPLight hmc_seg7_light_0700FF70, 2
gsSPVertex hmc_seg7_vertex_0700FF88, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  0,  5,  4, 0x0
gsSP2Triangles  0,  6,  5, 0x0,  0,  7,  6, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07010070 # 0x07010070 - 0x07010118
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_DECAL2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07010008
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_DECAL, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
