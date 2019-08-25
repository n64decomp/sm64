inside_castle_seg7_light_0703BD28: # 0x0703BD28 - 0x0703BD30
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

inside_castle_seg7_light_0703BD30: # 0x0703BD30 - 0x0703BD40
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_0703BD40: # 0x0703BD40 - 0x0703BE40
vertex    -76,      0,    -15,    478,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -76,      0,     15,    992,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -76,    256,     15,    992,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -76,    256,    -15,   1100,    460,  0x00, 0x7F, 0x00, 0xFF
vertex     79,    256,     15,   -650,    240,  0x00, 0x7F, 0x00, 0xFF
vertex     79,    256,    -15,   -542,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    -76,    256,     15,    990,    -34,  0x00, 0x7F, 0x00, 0xFF
vertex     79,      0,    -15,   1234,   -116,  0x00, 0x81, 0x00, 0xFF
vertex    -76,      0,     15,   -174,    868,  0x00, 0x81, 0x00, 0xFF
vertex    -76,      0,    -15,   -604,    498,  0x00, 0x81, 0x00, 0xFF
vertex     79,      0,     15,   1664,    254,  0x00, 0x81, 0x00, 0xFF
vertex     79,      0,     15,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     79,      0,    -15,    584,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     79,    256,    -15,    584,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     79,    256,     15,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -76,    256,    -15,    480,      0,  0x81, 0x00, 0x00, 0xFF

inside_castle_seg7_vertex_0703BE40: # 0x0703BE40 - 0x0703BE80
vertex    -76,      0,     15,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex     79,      0,     15,    990,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex     79,    256,     15,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,    256,     15,      0,      0,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_vertex_0703BE80: # 0x0703BE80 - 0x0703BEC0
vertex     79,      0,    -15,      0,   2012,  0x00, 0x00, 0x81, 0xFF
vertex    -76,    256,    -15,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex     79,    256,    -15,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -76,      0,    -15,    990,   2012,  0x00, 0x00, 0x81, 0xFF

inside_castle_seg7_dl_0703BEC0: # 0x0703BEC0 - 0x0703BF38
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_0703BD30, 1
gsSPLight inside_castle_seg7_light_0703BD28, 2
gsSPVertex inside_castle_seg7_vertex_0703BD40, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

inside_castle_seg7_dl_0703BF38: # 0x0703BF38 - 0x0703BF70
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex inside_castle_seg7_vertex_0703BE40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

inside_castle_seg7_dl_0703BF70: # 0x0703BF70 - 0x0703BFA8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex inside_castle_seg7_vertex_0703BE80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_0703BFA8 # 0x0703BFA8 - 0x0703C040
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_0703BEC0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList inside_castle_seg7_dl_0703BF38
gsSPDisplayList inside_castle_seg7_dl_0703BF70
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
