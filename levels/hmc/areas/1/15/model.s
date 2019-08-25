hmc_seg7_vertex_07014B88: # 0x07014B88 - 0x07014BC8
vertex   3021,    922,   -296,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2407,    922,   -296,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2407,    307,   -296,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3021,    307,   -296,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_dl_07014BC8: # 0x07014BC8 - 0x07014C00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hmc_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex hmc_seg7_vertex_07014B88, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07014C00 # 0x07014C00 - 0x07014CB8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList hmc_seg7_dl_07014BC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
