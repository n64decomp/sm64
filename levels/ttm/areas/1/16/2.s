ttm_seg7_vertex_0700EB40: # 0x0700EB40 - 0x0700EC00
vertex    205,     57,   1382,   -720,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    578,    -34,   1027,   4404,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    578,     67,   1027,   4424,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,    -44,   1382,   -740,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    578,    -34,   1027,   -246,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1229,     57,    614,   7428,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    578,     67,   1027,   -258,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1229,    -44,    614,   7442,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -562,    -44,    358,   -262,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,     57,   1382,  12512,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -580,     57,    335,   -560,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,    -44,   1382,  12512,    990,  0xFF, 0xFF, 0xFF, 0xFF

ttm_seg7_dl_0700EC00: # 0x0700EC00 - 0x0700EC58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttm_seg7_vertex_0700EB40, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700EC58 # 0x0700EC58 - 0x0700ECC8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700EC00
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
