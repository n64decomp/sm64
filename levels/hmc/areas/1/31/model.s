hmc_seg7_vertex_07021828: # 0x07021828 - 0x07021918
vertex   4659,  -3870,   2652,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5171,  -4382,   2652,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4659,  -4382,   2652,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1280,  -3870,   2652,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1792,  -4382,   2652,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1280,  -4382,   2652,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1792,  -3870,   2652,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   2406,  -3870,   2652,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   2918,  -4382,   2652,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2406,  -4382,   2652,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2918,  -3870,   2652,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   3533,  -3870,   2652,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4045,  -3870,   2652,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4045,  -4382,   2652,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   3533,  -4382,   2652,    990,    990,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_vertex_07021918: # 0x07021918 - 0x07021A08
vertex   2406,  -4382,   2007,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2918,  -4382,   2007,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2918,  -3870,   2007,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4659,  -3870,   2652,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5171,  -3870,   2652,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5171,  -4382,   2652,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5786,  -3870,   2652,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   6298,  -4382,   2652,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5786,  -4382,   2652,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   6298,  -3870,   2652,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1280,  -4382,   2007,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1792,  -3870,   2007,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1280,  -3870,   2007,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1792,  -4382,   2007,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2406,  -3870,   2007,    990,      0,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_vertex_07021A08: # 0x07021A08 - 0x07021AC8
vertex   3533,  -4382,   2007,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4045,  -4382,   2007,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4045,  -3870,   2007,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   3533,  -3870,   2007,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4659,  -4382,   2007,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5171,  -3870,   2007,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4659,  -3870,   2007,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5171,  -4382,   2007,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5786,  -4382,   2007,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   6298,  -3870,   2007,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5786,  -3870,   2007,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   6298,  -4382,   2007,      0,    990,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_dl_07021AC8: # 0x07021AC8 - 0x07021BA0
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, cave_0900C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_07021828, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex hmc_seg7_vertex_07021918, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex hmc_seg7_vertex_07021A08, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07021BA0 # 0x07021BA0 - 0x07021C10
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07021AC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
