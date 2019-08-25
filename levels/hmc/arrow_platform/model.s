hmc_seg7_light_07022B48: # 0x07022B48 - 0x07022B50
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

hmc_seg7_light_07022B50: # 0x07022B50 - 0x07022B60
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_07022B60: # 0x07022B60 - 0x07022C60
vertex    307,     51,    307,   3004,    -12,  0x00, 0x00, 0x7F, 0xFF
vertex   -306,      0,    307,     -2,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    307,      0,    307,   3004,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -306,     51,    307,     -2,    -12,  0x00, 0x00, 0x7F, 0xFF
vertex   -306,      0,   -306,     -2,    990,  0x00, 0x00, 0x81, 0xFF
vertex    307,     51,   -306,   3004,    -12,  0x00, 0x00, 0x81, 0xFF
vertex    307,      0,   -306,   3004,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -306,     51,   -306,     -2,    -12,  0x00, 0x00, 0x81, 0xFF
vertex    307,      0,   -306,   3004,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    307,     51,   -306,   3004,    -12,  0x7F, 0x00, 0x00, 0xFF
vertex    307,     51,    307,     -2,    -12,  0x7F, 0x00, 0x00, 0xFF
vertex    307,      0,    307,     -2,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -306,      0,    307,     -2,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -306,     51,    307,     -2,    -12,  0x81, 0x00, 0x00, 0xFF
vertex   -306,     51,   -306,   3004,    -12,  0x81, 0x00, 0x00, 0xFF
vertex   -306,      0,   -306,   3004,    990,  0x81, 0x00, 0x00, 0xFF

hmc_seg7_vertex_07022C60: # 0x07022C60 - 0x07022CE0
vertex    307,      0,    307,   3004,  -2046,  0x00, 0x81, 0x00, 0xFF
vertex   -306,      0,   -306,     -2,    960,  0x00, 0x81, 0x00, 0xFF
vertex    307,      0,   -306,   3004,    960,  0x00, 0x81, 0x00, 0xFF
vertex   -306,      0,    307,     -2,  -2046,  0x00, 0x81, 0x00, 0xFF
vertex    307,     51,   -306,   1982,  -1024,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,     51,   -306,  -1022,  -1024,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,     51,    307,  -1022,   1980,  0x00, 0x7F, 0x00, 0xFF
vertex    307,     51,    307,   1982,   1980,  0x00, 0x7F, 0x00, 0xFF

hmc_seg7_dl_07022CE0: # 0x07022CE0 - 0x07022D58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hmc_seg7_texture_07004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight hmc_seg7_light_07022B50, 1
gsSPLight hmc_seg7_light_07022B48, 2
gsSPVertex hmc_seg7_vertex_07022B60, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

hmc_seg7_dl_07022D58: # 0x07022D58 - 0x07022DA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hmc_seg7_texture_07003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_07022C60, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07022DA0 # 0x07022DA0 - 0x07022E78
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07022CE0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07022D58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
