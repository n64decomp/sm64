ttm_seg7_light_0700C0E0: # 0x0700C0E0 - 0x0700C0E8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttm_seg7_light_0700C0E8: # 0x0700C0E8 - 0x0700C0F8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_light_0700C0F8: # 0x0700C0F8 - 0x0700C100
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700C100: # 0x0700C100 - 0x0700C110
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_light_0700C110: # 0x0700C110 - 0x0700C118
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_light_0700C118: # 0x0700C118 - 0x0700C128
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700C128: # 0x0700C128 - 0x0700C228
vertex    162,    256,     35,      0,  -2076,  0xA6, 0x00, 0xA7, 0xFF
vertex     18,   -255,    180,    990,    480,  0xA6, 0x00, 0xA7, 0xFF
vertex     18,    256,    180,    990,  -2076,  0xA6, 0x00, 0xA7, 0xFF
vertex     18,    256,    180,      0,  -1566,  0x5A, 0x00, 0xA7, 0xFF
vertex     18,   -255,    180,      0,    990,  0x5A, 0x00, 0xA7, 0xFF
vertex   -126,   -255,     35,    990,    990,  0x5A, 0x00, 0xA7, 0xFF
vertex   -126,    256,     35,    990,  -1566,  0x5A, 0x00, 0xA7, 0xFF
vertex   -126,    256,     35,    990,  -2076,  0x59, 0x00, 0x59, 0xFF
vertex   -126,   -255,     35,    990,    480,  0x59, 0x00, 0x59, 0xFF
vertex     18,   -255,   -109,      0,    478,  0x59, 0x00, 0x59, 0xFF
vertex     18,    256,   -109,      0,  -2076,  0x59, 0x00, 0x59, 0xFF
vertex     18,    256,   -109,    990,  -1566,  0xA7, 0x00, 0x59, 0xFF
vertex    162,   -255,     35,      0,    990,  0xA7, 0x00, 0x59, 0xFF
vertex    162,    256,     35,      0,  -1566,  0xA7, 0x00, 0x59, 0xFF
vertex     18,   -255,   -109,    990,    990,  0xA7, 0x00, 0x59, 0xFF
vertex    162,   -255,     35,      0,    478,  0xA6, 0x00, 0xA7, 0xFF

ttm_seg7_vertex_0700C228: # 0x0700C228 - 0x0700C2A8
vertex    307,    256,     35,  14686, -17952,  0x00, 0x7F, 0x00, 0xFF
vertex     18,    256,   -253,  14108, -18530,  0x00, 0x7F, 0x00, 0xFF
vertex    162,    256,     35,  14396, -17952,  0x00, 0x7F, 0x00, 0xFF
vertex     18,    256,   -109,  14108, -18240,  0x00, 0x7F, 0x00, 0xFF
vertex   -126,    256,     35,  13818, -17952,  0x00, 0x7F, 0x00, 0xFF
vertex   -271,    256,     35,  13528, -17952,  0x00, 0x7F, 0x00, 0xFF
vertex     18,    256,    325,  14108, -17374,  0x00, 0x7F, 0x00, 0xFF
vertex     18,    256,    180,  14108, -17662,  0x00, 0x7F, 0x00, 0xFF

ttm_seg7_vertex_0700C2A8: # 0x0700C2A8 - 0x0700C2E8
vertex     18,   -255,    180,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    162,   -255,     35,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     18,   -255,   -109,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -126,   -255,     35,      0,      0,  0x00, 0x7F, 0x00, 0xFF

ttm_seg7_dl_0700C2E8: # 0x0700C2E8 - 0x0700C360
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700C0E8, 1
gsSPLight ttm_seg7_light_0700C0E0, 2
gsSPVertex ttm_seg7_vertex_0700C128, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

ttm_seg7_dl_0700C360: # 0x0700C360 - 0x0700C3D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700C100, 1
gsSPLight ttm_seg7_light_0700C0F8, 2
gsSPVertex ttm_seg7_vertex_0700C228, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  3,  1, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  2,  7,  6, 0x0
gsSP2Triangles  7,  4,  5, 0x0,  7,  5,  6, 0x0
gsSPEndDisplayList

ttm_seg7_dl_0700C3D8: # 0x0700C3D8 - 0x0700C408
gsSPLight ttm_seg7_light_0700C118, 1
gsSPLight ttm_seg7_light_0700C110, 2
gsSPVertex ttm_seg7_vertex_0700C2A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700C408 # 0x0700C408 - 0x0700C488
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700C2E8
gsSPDisplayList ttm_seg7_dl_0700C360
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList ttm_seg7_dl_0700C3D8
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
