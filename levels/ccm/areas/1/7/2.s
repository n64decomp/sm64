ccm_seg7_vertex_0700F4C0: # 0x0700F4C0 - 0x0700F500
vertex    233,   -275,     91,      0,      0,  0x99, 0x99, 0x99, 0xFF
vertex    233,   -378,     91,      0,    990,  0x99, 0x99, 0x99, 0xFF
vertex    308,   -275,     21,    990,      0,  0x99, 0x99, 0x99, 0xFF
vertex    308,   -378,     21,    990,    990,  0x99, 0x99, 0x99, 0xFF

ccm_seg7_vertex_0700F500: # 0x0700F500 - 0x0700F5C0
vertex   -116,    100,    541,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    573,   -104,    -99,   6232,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    573,    100,    -99,   6236,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -116,   -104,    541,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -611,    307,      9,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -116,   -104,    541,   4992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -116,    100,    541,   4996,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -611,    102,      9,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    573,    100,    -99,   4996,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     44,    102,   -669,   -384,   -104,  0xFF, 0xFF, 0xFF, 0xFF
vertex     44,    307,   -669,   -384,    918,  0xFF, 0xFF, 0xFF, 0xFF
vertex    573,   -104,    -99,   4992,      0,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_dl_0700F5C0: # 0x0700F5C0 - 0x0700F5F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_0700F4C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPEndDisplayList

ccm_seg7_dl_0700F5F8: # 0x0700F5F8 - 0x0700F650
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex ccm_seg7_vertex_0700F500, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0700F650 # 0x0700F650 - 0x0700F6E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0700F5C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList ccm_seg7_dl_0700F5F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
