hmc_seg7_light_07022910: # 0x07022910 - 0x07022918
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

hmc_seg7_light_07022918: # 0x07022918 - 0x07022928
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_07022928: # 0x07022928 - 0x07022A08
vertex   -255,      0,   -255,    990,     96,  0xD6, 0xAC, 0xAC, 0xFF
vertex    256,    102,   -255,      0,      0,  0x2A, 0x54, 0xAC, 0xFF
vertex    256,      0,   -255,      0,     96,  0x67, 0xCD, 0xCD, 0xFF
vertex    256,      0,    256,    990,      0,  0x2A, 0xAC, 0x54, 0xFF
vertex   -255,      0,    256,    990,    990,  0x99, 0xCD, 0x33, 0xFF
vertex   -255,      0,   -255,      0,    990,  0xD6, 0xAC, 0xAC, 0xFF
vertex    256,      0,   -255,      0,      0,  0x67, 0xCD, 0xCD, 0xFF
vertex   -255,    102,    256,    990,    990,  0xD6, 0x54, 0x54, 0xFF
vertex    256,    102,    256,    990,      0,  0x67, 0x33, 0x33, 0xFF
vertex   -255,    102,   -255,      0,    990,  0x99, 0x33, 0xCD, 0xFF
vertex    256,      0,    256,    990,     96,  0x2A, 0xAC, 0x54, 0xFF
vertex   -255,    102,    256,      0,      0,  0xD6, 0x54, 0x54, 0xFF
vertex   -255,    102,   -255,    990,      0,  0x99, 0x33, 0xCD, 0xFF
vertex   -255,      0,    256,      0,     96,  0x99, 0xCD, 0x33, 0xFF

hmc_seg7_dl_07022A08: # 0x07022A08 - 0x07022AA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cave_09002800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight hmc_seg7_light_07022918, 1
gsSPLight hmc_seg7_light_07022910, 2
gsSPVertex hmc_seg7_vertex_07022928, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  1, 0x0
gsSP2Triangles  7,  1,  9, 0x0,  2,  8, 10, 0x0
gsSP2Triangles  2,  1,  8, 0x0, 10,  8, 11, 0x0
gsSP2Triangles  0, 12,  1, 0x0, 13, 12,  0, 0x0
gsSP2Triangles 10, 11, 13, 0x0, 13, 11, 12, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07022AA0 # 0x07022AA0 - 0x07022B48
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
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
gsSPDisplayList hmc_seg7_dl_07022A08
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
