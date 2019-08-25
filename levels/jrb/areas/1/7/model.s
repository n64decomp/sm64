jrb_seg7_vertex_07007628: # 0x07007628 - 0x07007668
vertex   4569,  -5221,   2892,   4056,   6098,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5388,  -5221,   2892,   4056,  -2076,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5388,  -5221,   2073,  -4118,  -2076,  0xFF, 0xFF, 0xFF, 0xFF
vertex   4569,  -5221,   2073,  -4118,   6098,  0xFF, 0xFF, 0xFF, 0xFF

jrb_seg7_vertex_07007668: # 0x07007668 - 0x070076A8
vertex   7521,  -2815,   2397,   4736,   3544,  0xFF, 0xFF, 0xFF, 0xFF
vertex   7337,  -3532,   1704,  -2072,  -1566,  0xFF, 0xFF, 0xFF, 0xFF
vertex   7521,  -3532,   2397,  -2072,   3544,  0xFF, 0xFF, 0xFF, 0xFF
vertex   7337,  -2815,   1704,   4736,  -1566,  0xFF, 0xFF, 0xFF, 0xFF

jrb_seg7_dl_070076A8: # 0x070076A8 - 0x070076E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, jrb_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex jrb_seg7_vertex_07007628, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

jrb_seg7_dl_070076E0: # 0x070076E0 - 0x07007718
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, jrb_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex jrb_seg7_vertex_07007668, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel jrb_seg7_dl_07007718 # 0x07007718 - 0x070077F0
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 5, 80, 75, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList jrb_seg7_dl_070076A8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList jrb_seg7_dl_070076E0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
