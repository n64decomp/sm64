hmc_seg7_vertex_0701F700: # 0x0701F700 - 0x0701F7C0
vertex  -1689,  -4177,   -526,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex  -2201,  -4689,   -526,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex  -1689,  -4689,   -526,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex  -2201,  -4177,   -526,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex  -4863,  -4177,   -526,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex  -5375,  -4689,   -526,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex  -4863,  -4689,   -526,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex  -5375,  -4177,   -526,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex  -2774,   -101,  -6271,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex  -2774,    410,  -6783,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex  -2774,   -101,  -6783,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex  -2774,    410,  -6271,    990,      0,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_dl_0701F7C0: # 0x0701F7C0 - 0x0701F818
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, cave_0900C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_0701F700, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_0701F818 # 0x0701F818 - 0x0701F888
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_0701F7C0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
