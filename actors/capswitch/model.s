# Capswitch

.balign 8
capswitch_seg5_light_05001BB8: # 0x05001BB8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

capswitch_seg5_light_05001BC0: # 0x05001BC0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

capswitch_seg5_light_05001BD0: # 0x05001BD0
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

capswitch_seg5_light_05001BD8: # 0x05001BD8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

capswitch_seg5_light_05001BE8: # 0x05001BE8
.byte 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00

capswitch_seg5_light_05001BF0: # 0x05001BF0
.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

capswitch_seg5_light_05001C00: # 0x05001C00
.byte 0x01, 0x2A, 0x09, 0x00, 0x01, 0x2A, 0x09, 0x00

capswitch_seg5_light_05001C08: # 0x05001C08
.byte 0x07, 0xA9, 0x25, 0x00, 0x07, 0xA9, 0x25, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

capswitch_seg5_light_05001C18: # 0x05001C18
.byte 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00

capswitch_seg5_light_05001C20: # 0x05001C20
.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

capswitch_seg5_light_05001C30: # 0x05001C30
.byte 0x3F, 0x25, 0x02, 0x00, 0x3F, 0x25, 0x02, 0x00

capswitch_seg5_light_05001C38: # 0x05001C38
.byte 0xFF, 0x96, 0x08, 0x00, 0xFF, 0x96, 0x08, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

capswitch_seg5_texture_05001C48: # 0x05001C48
.incbin "actors/capswitch/cap_switch_head.ia16"

capswitch_seg5_texture_05002C48: # 0x05002C48
.incbin "actors/capswitch/cap_switch_base.rgba16"

capswitch_seg5_vertex_05002CC8: # 0x05002CC8
vertex   -118,    262,   -203,   -130,    364,  0x00, 0x36, 0x8E, 0xFF
vertex    130,      0,   -224,   1144,   2144,  0x00, 0x0A, 0x82, 0xFF
vertex   -129,      0,   -224,   -184,   2144,  0x00, 0x0A, 0x82, 0xFF
vertex    119,    262,   -203,   1088,    364,  0x00, 0x36, 0x8E, 0xFF
vertex    109,    352,   -108,   1034,   -252,  0x00, 0x5C, 0xA9, 0xFF
vertex   -108,    352,   -108,    -74,   -252,  0x00, 0x5C, 0xA9, 0xFF
vertex   -129,      0,    225,   -184,   2144,  0x00, 0x0A, 0x7E, 0xFF
vertex    119,    262,    204,   1088,    364,  0x00, 0x36, 0x72, 0xFF
vertex   -118,    262,    204,   -130,    364,  0x00, 0x36, 0x72, 0xFF
vertex   -108,    352,    109,    -74,   -252,  0x00, 0x5C, 0x57, 0xFF
vertex    130,      0,    225,   1144,   2144,  0x00, 0x0A, 0x7E, 0xFF
vertex    109,    352,    109,   1034,   -252,  0x00, 0x5C, 0x57, 0xFF

glabel capswitch_seg5_dl_05002D88 # 0x05002D88 - 0x05002E00
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, capswitch_seg5_texture_05001C48
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight capswitch_seg5_light_05001BC0, 1
gsSPLight capswitch_seg5_light_05001BB8, 2
gsSPVertex capswitch_seg5_vertex_05002CC8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  4,  3,  0, 0x0,  5,  4,  0, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  7,  6, 10, 0x0, 11,  9,  7, 0x0
gsSPEndDisplayList

glabel cap_switch_exclamation_seg5_dl_05002E00 # 0x05002E00 - 0x05002E60
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList capswitch_seg5_dl_05002D88
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

capswitch_seg5_vertex_05002E60: # 0x05002E60
vertex    147,      0,   -253,      0,    499,  0x29, 0x00, 0x88, 0xFF
vertex   -146,      0,   -253,      0,   -436,  0xAD, 0x00, 0xA1, 0xFF
vertex   -146,    137,   -253,    407,   -436,  0xD3, 0x48, 0xA3, 0xFF
vertex   -146,      0,    254,      0,   -436,  0xD7, 0x00, 0x77, 0xFF
vertex    147,      0,    254,      0,    499,  0x53, 0x00, 0x5F, 0xFF
vertex    147,    137,    254,    407,    499,  0x2D, 0x48, 0x5D, 0xFF
vertex    293,    137,      0,    407,    967,  0x68, 0x48, 0x07, 0xFF
vertex    293,      0,      0,      0,    967,  0x7C, 0x00, 0xE8, 0xFF
vertex    147,    137,   -253,    407,    499,  0x3A, 0x47, 0xAA, 0xFF
vertex    111,    170,   -192,    510,    386,  0x23, 0x72, 0xD7, 0xFF
vertex    222,    170,      0,    510,    741,  0x35, 0x72, 0x0A, 0xFF
vertex   -146,    137,    254,    407,   -436,  0xC6, 0x47, 0x56, 0xFF
vertex    111,    170,    193,    510,    386,  0x11, 0x72, 0x33, 0xFF
vertex   -292,    137,      0,    407,   -904,  0x98, 0x48, 0xF9, 0xFF
vertex   -110,    170,    193,    510,   -323,  0xDD, 0x72, 0x29, 0xFF
vertex   -221,    170,      0,    510,   -678,  0xCB, 0x72, 0xF6, 0xFF

capswitch_seg5_vertex_05002F60: # 0x05002F60
vertex   -146,      0,   -253,      0,   -436,  0xAD, 0x00, 0xA1, 0xFF
vertex   -292,      0,      0,      0,   -904,  0x84, 0x00, 0x17, 0xFF
vertex   -292,    137,      0,    407,   -904,  0x98, 0x48, 0xF9, 0xFF
vertex    147,    137,   -253,    407,    499,  0x3A, 0x47, 0xAA, 0xFF
vertex   -146,    137,   -253,    407,   -436,  0xD3, 0x48, 0xA3, 0xFF
vertex   -110,    170,   -192,    510,   -323,  0xEF, 0x72, 0xCD, 0xFF
vertex   -221,    170,      0,    510,   -678,  0xCB, 0x72, 0xF6, 0xFF
vertex    111,    170,   -192,    510,    386,  0x23, 0x72, 0xD7, 0xFF
vertex   -146,    137,    254,    407,   -436,  0xC6, 0x47, 0x56, 0xFF
vertex    111,    170,    193,    510,    386,  0x11, 0x72, 0x33, 0xFF
vertex   -110,    170,    193,    510,   -323,  0xDD, 0x72, 0x29, 0xFF
vertex   -146,      0,    254,      0,   -436,  0xD7, 0x00, 0x77, 0xFF

glabel capswitch_seg5_dl_05003020 # 0x05003020 - 0x05003120
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, capswitch_seg5_texture_05002C48
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x03F, 0x200
gsSPLight capswitch_seg5_light_05001BD8, 1
gsSPLight capswitch_seg5_light_05001BD0, 2
gsSPVertex capswitch_seg5_vertex_05002E60, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  4,  7,  6, 0x0
gsSP2Triangles  7,  8,  6, 0x0,  6,  9, 10, 0x0
gsSP2Triangles  6,  8,  9, 0x0,  5,  6, 10, 0x0
gsSP2Triangles 11,  5, 12, 0x0,  3,  5, 11, 0x0
gsSP2Triangles  5, 10, 12, 0x0,  7,  0,  8, 0x0
gsSP2Triangles  0,  2,  8, 0x0, 13, 14, 15, 0x0
gsSP1Triangle  1, 13,  2, 0x0
gsSPVertex capswitch_seg5_vertex_05002F60, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  4,  2,  6, 0x0
gsSP2Triangles  3,  5,  7, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  1,  8,  2, 0x0,  1, 11,  8, 0x0
gsSP1Triangle  2,  8, 10, 0x0
gsSPEndDisplayList

glabel cap_switch_base_seg5_dl_05003120 # 0x05003120 - 0x05003180
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 2, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 12
gsSPDisplayList capswitch_seg5_dl_05003020
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

capswitch_seg5_vertex_05003180: #0x05003180
vertex   -118,    262,   -203,      0,      0,  0xD9, 0x37, 0x95, 0xFF
vertex    130,      0,   -224,      0,      0,  0x29, 0x0B, 0x89, 0xFF
vertex   -129,      0,   -224,      0,      0,  0xAE, 0x0A, 0xA0, 0xFF
vertex    119,    262,   -203,      0,      0,  0x49, 0x2C, 0xA3, 0xFF
vertex    260,      0,      0,      0,      0,  0x7C, 0x0A, 0xE8, 0xFF
vertex   -238,    262,      0,      0,      0,  0x8E, 0x34, 0xF4, 0xFF
vertex   -108,    352,   -108,      0,      0,  0xDB, 0x75, 0xE0, 0xFF
vertex    109,    352,   -108,      0,      0,  0x25, 0x6D, 0xCD, 0xFF
vertex    239,    262,      0,      0,      0,  0x72, 0x34, 0x0C, 0xFF
vertex   -259,      0,      0,      0,      0,  0x84, 0x0A, 0x18, 0xFF
vertex   -118,    262,    204,      0,      0,  0xB7, 0x2C, 0x5D, 0xFF
vertex   -108,    352,    109,      0,      0,  0xDB, 0x6D, 0x33, 0xFF
vertex   -129,      0,    225,      0,      0,  0xD7, 0x0B, 0x77, 0xFF
vertex    119,    262,    204,      0,      0,  0x27, 0x37, 0x6B, 0xFF
vertex    109,    352,    109,      0,      0,  0x25, 0x75, 0x20, 0xFF
vertex    130,      0,    225,      0,      0,  0x52, 0x0A, 0x5F, 0xFF

glabel capswitch_seg5_dl_05003280 # 0x05003280 - 0x05003350
gsSPVertex capswitch_seg5_vertex_05003180, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  1,  0,  3, 0x0,  2,  5,  0, 0x0
gsSP2Triangles  0,  5,  6, 0x0,  7,  3,  0, 0x0
gsSP2Triangles  6,  7,  0, 0x0,  8,  3,  7, 0x0
gsSP2Triangles  4,  3,  8, 0x0,  9, 10,  5, 0x0
gsSP2Triangles 11,  6,  5, 0x0,  5, 10, 11, 0x0
gsSP2Triangles  5,  2,  9, 0x0, 10,  9, 12, 0x0
gsSP2Triangles 12, 13, 10, 0x0, 10, 13, 11, 0x0
gsSP2Triangles  6, 11, 14, 0x0, 14, 11, 13, 0x0
gsSP2Triangles  6, 14,  7, 0x0, 15,  8, 13, 0x0
gsSP2Triangles 13,  8, 14, 0x0, 13, 12, 15, 0x0
gsSP2Triangles  8, 15,  4, 0x0,  7, 14,  8, 0x0
gsSPEndDisplayList

glabel capswitch_seg5_dl_05003350 # 0x05003350 - 0x05003370
gsSPLight capswitch_seg5_light_05001BF0, 1
gsSPLight capswitch_seg5_light_05001BE8, 2
gsSPDisplayList capswitch_seg5_dl_05003280
gsSPEndDisplayList

glabel capswitch_seg5_dl_05003370 # 0x05003370 - 0x05003390
gsSPLight capswitch_seg5_light_05001C08, 1
gsSPLight capswitch_seg5_light_05001C00, 2
gsSPDisplayList capswitch_seg5_dl_05003280
gsSPEndDisplayList

glabel capswitch_seg5_dl_05003390 # 0x05003390 - 0x050033B0
gsSPLight capswitch_seg5_light_05001C20, 1
gsSPLight capswitch_seg5_light_05001C18, 2
gsSPDisplayList capswitch_seg5_dl_05003280
gsSPEndDisplayList

glabel capswitch_seg5_dl_050033B0 # 0x050033B0 - 0x050033D0
gsSPLight capswitch_seg5_light_05001C38, 1
gsSPLight capswitch_seg5_light_05001C30, 2
gsSPDisplayList capswitch_seg5_dl_05003280
gsSPEndDisplayList
