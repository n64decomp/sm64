ttm_seg7_light_0700BC70: # 0x0700BC70 - 0x0700BC78
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttm_seg7_light_0700BC78: # 0x0700BC78 - 0x0700BC88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_light_0700BC88: # 0x0700BC88 - 0x0700BC90
.byte 0x5D, 0x5D, 0x5D, 0x00, 0x5D, 0x5D, 0x5D, 0x00

ttm_seg7_light_0700BC90: # 0x0700BC90 - 0x0700BCA0
.byte 0xBB, 0xBB, 0xBB, 0x00, 0xBB, 0xBB, 0xBB, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700BCA0: # 0x0700BCA0 - 0x0700BCE0
vertex    307,     32,    307,      0,   2418,  0x00, 0x7F, 0x00, 0xFF
vertex    307,     32,   -409,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,     32,   -409,  -1256,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,     32,    307,  -1256,   2418,  0x00, 0x7F, 0x00, 0xFF

ttm_seg7_vertex_0700BCE0: # 0x0700BCE0 - 0x0700BDA0
vertex    307,     32,   -409,      0,    990,  0x58, 0x5A, 0x00, 0xFF
vertex    307,     32,    307,      0,   2418,  0x58, 0x5A, 0x00, 0xFF
vertex    355,    -15,    355,     64,   2514,  0x58, 0x5A, 0x00, 0xFF
vertex    355,    -15,    355,     64,   2514,  0x00, 0x5A, 0x58, 0xFF
vertex    307,     32,    307,      0,   2418,  0x00, 0x5A, 0x58, 0xFF
vertex   -369,    -30,    370,  -1380,   2544,  0x00, 0x5A, 0x58, 0xFF
vertex    307,     32,    307,      0,   2418,  0x00, 0x5A, 0x59, 0xFF
vertex   -306,     32,    307,  -1256,   2418,  0x00, 0x5A, 0x59, 0xFF
vertex   -369,    -30,    370,  -1380,   2544,  0x00, 0x5A, 0x59, 0xFF
vertex   -369,    -30,    370,  -1380,   2544,  0xA7, 0x5A, 0x00, 0xFF
vertex   -306,     32,    307,  -1256,   2418,  0xA7, 0x5A, 0x00, 0xFF
vertex   -306,     32,   -409,  -1256,    990,  0xA7, 0x5A, 0x00, 0xFF

ttm_seg7_dl_0700BDA0: # 0x0700BDA0 - 0x0700BE20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700BC78, 1
gsSPLight ttm_seg7_light_0700BC70, 2
gsSPVertex ttm_seg7_vertex_0700BCA0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPLight ttm_seg7_light_0700BC90, 1
gsSPLight ttm_seg7_light_0700BC88, 2
gsSPVertex ttm_seg7_vertex_0700BCE0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700BE20 # 0x0700BE20 - 0x0700BE90
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700BDA0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
