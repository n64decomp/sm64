bits_seg7_vertex_0700B8B0: # 0x0700B8B0 - 0x0700B9B0
vertex    410,      0,    410,   2012,   1040,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,      0,   -409,   2012,  -3046,  0xFF, 0xD4, 0x00, 0xFF
vertex    154,    154,   -153,    -20,  -1770,  0xFF, 0xD4, 0x00, 0xFF
vertex    154,    154,    154,    -20,   -236,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,      0,   -409,   2012,   1040,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,      0,    410,   2012,  -3046,  0xFF, 0xD4, 0x00, 0xFF
vertex   -153,    154,    154,    -40,  -1770,  0xFF, 0xD4, 0x00, 0xFF
vertex   -153,    154,   -153,    -40,   -236,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,      0,    410,   2012,    990,  0xBE, 0xBE, 0x00, 0xFF
vertex    154,    154,    154,    -40,  -1820,  0xBE, 0xBE, 0x00, 0xFF
vertex   -153,    154,    154,    -40,   -288,  0xBE, 0xBE, 0x00, 0xFF
vertex    410,      0,    410,   2012,  -3098,  0xBE, 0xBE, 0x00, 0xFF
vertex   -409,      0,   -409,   2012,  -3098,  0xBE, 0xBE, 0x00, 0xFF
vertex   -153,    154,   -153,    -40,  -1820,  0xBE, 0xBE, 0x00, 0xFF
vertex    154,    154,   -153,    -40,   -288,  0xBE, 0xBE, 0x00, 0xFF
vertex    410,      0,   -409,   2012,    990,  0xBE, 0xBE, 0x00, 0xFF

bits_seg7_dl_0700B9B0: # 0x0700B9B0 - 0x0700BA18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bits_seg7_vertex_0700B8B0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_0700BA18 # 0x0700BA18 - 0x0700BA88
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bits_seg7_dl_0700B9B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
