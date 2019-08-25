ttm_seg7_light_0700BE90: # 0x0700BE90 - 0x0700BE98
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700BE98: # 0x0700BE98 - 0x0700BEA8
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_light_0700BEA8: # 0x0700BEA8 - 0x0700BEB0
.byte 0x5D, 0x5D, 0x5D, 0x00, 0x5D, 0x5D, 0x5D, 0x00

ttm_seg7_light_0700BEB0: # 0x0700BEB0 - 0x0700BEC0
.byte 0xBB, 0xBB, 0xBB, 0x00, 0xBB, 0xBB, 0xBB, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700BEC0: # 0x0700BEC0 - 0x0700BF40
vertex    614,  -1486,   -697,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -613,  -1486,   -697,   2420,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -613,   1487,   -697,   2420,  -4946,  0x00, 0x00, 0x81, 0xFF
vertex    205,   1487,   -697,    786,  -4946,  0x00, 0x00, 0x81, 0xFF
vertex   -613,   1282,    717,      0,  -1470,  0x00, 0x00, 0x7F, 0xFF
vertex   -613,     49,    717,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    614,     49,    717,   2420,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    205,   1282,    717,   1604,  -1470,  0x00, 0x00, 0x7F, 0xFF

ttm_seg7_vertex_0700BF40: # 0x0700BF40 - 0x0700BFE0
vertex    205,   1282,    717,   1604,    990,  0x00, 0x7D, 0x12, 0xFF
vertex    205,   1487,   -697,   1604,  -1864,  0x00, 0x7D, 0x12, 0xFF
vertex   -613,   1282,    717,      0,    990,  0x00, 0x7D, 0x12, 0xFF
vertex   -613,   1487,   -697,      0,  -1864,  0x00, 0x7D, 0x12, 0xFF
vertex    205,   1282,    717,   4874,  -4536,  0x78, 0x27, 0x05, 0xFF
vertex    614,     49,    717,   4874,  -2076,  0x78, 0x27, 0x05, 0xFF
vertex    205,   1487,   -697,   7698,  -4946,  0x78, 0x27, 0x05, 0xFF
vertex    614,  -1486,   -697,   7698,    990,  0x7C, 0x11, 0xEE, 0xFF
vertex    205,   1487,   -697,   7698,  -4946,  0x7C, 0x11, 0xEE, 0xFF
vertex    614,     49,    717,   4874,  -2076,  0x7C, 0x11, 0xEE, 0xFF

ttm_seg7_dl_0700BFE0: # 0x0700BFE0 - 0x0700C070
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700BE98, 1
gsSPLight ttm_seg7_light_0700BE90, 2
gsSPVertex ttm_seg7_vertex_0700BEC0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  7,  4, 0x0
gsSPLight ttm_seg7_light_0700BEB0, 1
gsSPLight ttm_seg7_light_0700BEA8, 2
gsSPVertex ttm_seg7_vertex_0700BF40, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700C070 # 0x0700C070 - 0x0700C0E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700BFE0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
