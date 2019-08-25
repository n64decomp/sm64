hmc_seg7_vertex_070079E8: # 0x070079E8 - 0x07007AE8
vertex  -6860,   1760,   3753,   5998,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1658,   3753,     70,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,   1658,   3753,   5998,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1536,   2545,   5998,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,   1536,   2545,     70,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,   1434,   2545,     70,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1434,   2545,   5998,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,   1331,   3548,   5998,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1331,   3548,     70,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1229,   3548,     70,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,   1229,   3548,   5998,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,   1024,   3343,   5998,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,    922,   3343,     70,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6860,    922,   3343,   5998,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1024,   3343,     70,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6245,   1760,   3753,     70,      0,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_dl_07007AE8: # 0x07007AE8 - 0x07007B50
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cave_09003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_070079E8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07007B50 # 0x07007B50 - 0x07007C08
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07007AE8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
