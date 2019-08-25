rr_seg7_vertex_07002D40: # 0x07002D40 - 0x07002D80
vertex   -409,      0,   -204,    990,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,      0,    205,  -3096,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,      0,   -204,  -3096,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,      0,    205,    990,      0,  0xFF, 0xD4, 0x00, 0xFF

rr_seg7_vertex_07002D80: # 0x07002D80 - 0x07002E00
vertex    410,    113,   -204,   3590,    -12,  0xFF, 0xD4, 0x00, 0xFF
vertex   -406,    117,   -204,      0,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,   -112,   -204,    -42,    988,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,   -112,   -204,   3590,    988,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,    113,    205,   3590,    -12,  0xFF, 0xD4, 0x00, 0xFF
vertex   -406,    117,    205,      0,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,   -112,    205,    -42,    988,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,   -112,    205,   3590,    988,  0xFF, 0xD4, 0x00, 0xFF

rr_seg7_dl_07002E00: # 0x07002E00 - 0x07002E38
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_07002D40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

rr_seg7_dl_07002E38: # 0x07002E38 - 0x07002E80
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_07002D80, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_07002E80 # 0x07002E80 - 0x07002EF8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_07002E00
gsSPDisplayList rr_seg7_dl_07002E38
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
