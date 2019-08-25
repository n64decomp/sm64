dl_cruiser_metal_holes_vertex_group: # 0x07002000 - 0x07002100
vertex  -4786,   -975,   4124,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4889,   -975,   4124,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4786,  -1057,   4185,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6721,   -715,   -565,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6721,   -797,   -503,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6823,   -797,   -503,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6823,   -715,   -565,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3250,  -1792,   5658,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3250,  -1874,   5719,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3353,  -1874,   5719,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3353,  -1792,   5658,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5757,  -1792,   5760,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5860,  -1792,   5760,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5757,  -1874,   5822,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5860,  -1874,   5822,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4889,  -1057,   4185,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF

dl_cruiser_metal_holes_model: # 0x07002100 - 0x07002168
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_metal_hole
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex dl_cruiser_metal_holes_vertex_group, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 12, 14, 13, 0x0,  1, 15,  2, 0x0
gsSPEndDisplayList

glabel dl_cruiser_metal_holes # 0x07002168 - 0x070021D8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList dl_cruiser_metal_holes_model
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
