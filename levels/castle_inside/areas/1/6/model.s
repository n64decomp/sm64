inside_castle_seg7_light_0702A8F0: # 0x0702A8F0 - 0x0702A8F8
.byte 0x5F, 0x5F, 0x5F, 0x00, 0x5F, 0x5F, 0x5F, 0x00

inside_castle_seg7_light_0702A8F8: # 0x0702A8F8 - 0x0702A908
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_0702A908: # 0x0702A908 - 0x0702A998
vertex   -757,    -50,    717,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -1023,    -50,    983,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -757,    -50,    983,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -1023,    -50,    451,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -1289,    -50,    451,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -1289,    -50,    717,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -1023,    -50,    717,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -757,    -50,    451,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -1289,    -50,    983,      0,      0,  0x00, 0x7F, 0x00, 0xFF

inside_castle_seg7_dl_0702A998: # 0x0702A998 - 0x0702AA10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_0702A8F8, 1
gsSPLight inside_castle_seg7_light_0702A8F0, 2
gsSPVertex inside_castle_seg7_vertex_0702A908, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  3,  6, 0x0
gsSP2Triangles  7,  6,  0, 0x0,  6,  8,  1, 0x0
gsSP2Triangles  6,  5,  8, 0x0,  0,  6,  1, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_0702AA10 # 0x0702AA10 - 0x0702AA80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_0702A998
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
