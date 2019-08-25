hmc_seg7_vertex_0701A150: # 0x0701A150 - 0x0701A240
vertex  -3583,   2253,  -3276,  -4118,  -7186,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2253,  -2764,    990,   3032,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2253,  -2764,    990,  -2076,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2355,  -2764,  -2074,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2253,  -2252,   3034,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2355,  -2252,   3034,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2253,  -2764,  -2074,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3583,   2355,  -2252,   8144,  -5142,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2355,  -2252,   3034,  -5142,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2355,  -2764,   3034,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3583,   2355,  -3276,   8144,   5076,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2047,   2355,  -3276,  -7184,   5076,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2355,  -2252,  -2074,  -5142,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2047,   2355,  -2252,  -7184,  -5142,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2047,   2253,  -3276,  -4118,   8142,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_vertex_0701A240: # 0x0701A240 - 0x0701A340
vertex  -3071,   2253,  -2764,    990,  -2076,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2253,  -2252,   6100,  -2076,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3583,   2253,  -2252,   6100,  -7186,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3583,   2253,  -3276,  -4118,  -7186,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2047,   2253,  -3276,  -4118,   8142,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2047,   2253,  -2252,   6100,   8142,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2253,  -2764,    990,   3032,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2253,  -2252,   6100,   3032,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2355,  -2252,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2253,  -2764,   5078,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2355,  -2764,   5078,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2253,  -2252,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2355,  -2764,  -2074,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2253,  -2764,   3034,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2559,   2355,  -2764,   3034,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   2253,  -2764,  -2074,    990,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_dl_0701A340: # 0x0701A340 - 0x0701A400
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cave_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_0701A150, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  9,  3, 11, 0x0
gsSP2Triangles  9, 11, 10, 0x0,  3, 12, 13, 0x0
gsSP2Triangles  3, 13, 11, 0x0,  0, 14,  1, 0x0
gsSPVertex hmc_seg7_vertex_0701A240, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_0701A400 # 0x0701A400 - 0x0701A4B8
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
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_0701A340
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
