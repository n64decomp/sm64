hmc_seg7_vertex_070192B8: # 0x070192B8 - 0x07019328
vertex  -6041,   2247,  -7797,    990,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6348,   2094,  -7797,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6041,   2145,  -7797,    990,    820,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5733,   2196,  -7797,   2012,    650,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6041,   2401,  -7797,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6041,   1991,  -7797,    990,   1328,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6348,   2298,  -7797,      0,    308,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_dl_07019328: # 0x07019328 - 0x07019368
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cave_09009800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_070192B8, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07019368 # 0x07019368 - 0x07019430
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_XLU_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetEnvColor 255, 255, 255, 100
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07019328
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_XLU_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
