inside_castle_seg7_light_07068908: # 0x07068908 - 0x07068910
.byte 0x5F, 0x5F, 0x5F, 0x00, 0x5F, 0x5F, 0x5F, 0x00

inside_castle_seg7_light_07068910: # 0x07068910 - 0x07068920
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_07068920: # 0x07068920 - 0x07068960
vertex   -153,      0,    154,   5078,   4564,  0x00, 0x7F, 0x00, 0xFF
vertex    154,      0,    154,   6612,   4564,  0x00, 0x7F, 0x00, 0xFF
vertex    154,      0,   -153,   6612,   3032,  0x00, 0x7F, 0x00, 0xFF
vertex   -153,      0,   -153,   5078,   3032,  0x00, 0x7F, 0x00, 0xFF

inside_castle_seg7_vertex_07068960: # 0x07068960 - 0x07068A60
vertex   -153,      0,    154,  -5140,  -3098,  0x00, 0x00, 0x7F, 0xFF
vertex   -153,   -409,    154,  -5140,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    154,   -409,    154,  -2074,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -153,      0,   -153,   2012,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -153,   -409,    154,   5078,   4054,  0x81, 0x00, 0x00, 0xFF
vertex   -153,      0,    154,   5078,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -153,   -409,   -153,   2012,   4054,  0x81, 0x00, 0x00, 0xFF
vertex    154,      0,   -153,  -2074,  -3098,  0x00, 0x00, 0x81, 0xFF
vertex   -153,   -409,   -153,  -5140,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -153,      0,   -153,  -5140,  -3098,  0x00, 0x00, 0x81, 0xFF
vertex    154,   -409,   -153,  -2074,    990,  0x00, 0x00, 0x81, 0xFF
vertex    154,      0,    154,   5078,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    154,   -409,   -153,   2012,   4054,  0x7F, 0x00, 0x00, 0xFF
vertex    154,      0,   -153,   2012,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    154,   -409,    154,   5078,   4054,  0x7F, 0x00, 0x00, 0xFF
vertex    154,      0,    154,  -2074,  -3098,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_dl_07068A60: # 0x07068A60 - 0x07068AA8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_07068910, 1
gsSPLight inside_castle_seg7_light_07068908, 2
gsSPVertex inside_castle_seg7_vertex_07068920, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

inside_castle_seg7_dl_07068AA8: # 0x07068AA8 - 0x07068B10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex inside_castle_seg7_vertex_07068960, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07068B10 # 0x07068B10 - 0x07068B88
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_07068A60
gsSPDisplayList inside_castle_seg7_dl_07068AA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
