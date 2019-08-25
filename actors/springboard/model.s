# Springboard (unused)

springboard_seg5_light_05000000: # 0x05000000
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

springboard_seg5_light_05000008: # 0x05000008
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

springboard_seg5_texture_05000018: # 0x05000018
.incbin "actors/springboard/springboard_top_unused.rgba16"

springboard_seg5_texture_05000818: # 0x05000818
.incbin "actors/springboard/springboard_base_unused.rgba16"

springboard_seg5_vertex_05001018: # 0x05001018
vertex    205,      0,      0,   2524,    478,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,   -176,   1502,  -1292,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,   -176,   -542,  -1292,  0x00, 0x7F, 0x00, 0xFF
vertex    205,      0,      0,   2524,    478,  0x6D, 0x00, 0xC0, 0xFF
vertex    102,    -19,   -176,   1502,  -1292,  0x6D, 0x00, 0xC0, 0xFF
vertex    102,      0,   -176,   1502,  -1292,  0x6D, 0x00, 0xC0, 0xFF
vertex    102,      0,   -176,   1502,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex   -101,    -19,   -176,   -542,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex   -101,      0,   -176,   -542,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex    102,    -19,   -176,   1502,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex   -204,    -19,      0,  -1564,    478,  0x00, 0x81, 0x00, 0xFF
vertex   -101,    -19,   -176,   -542,  -1292,  0x00, 0x81, 0x00, 0xFF
vertex    102,    -19,   -176,   1502,  -1292,  0x00, 0x81, 0x00, 0xFF
vertex    102,    -19,    177,   1502,   2248,  0x00, 0x81, 0x00, 0xFF
vertex    205,    -19,      0,   2524,    478,  0x00, 0x81, 0x00, 0xFF
vertex    205,    -19,      0,   2524,    478,  0x6D, 0x00, 0xC0, 0xFF

springboard_seg5_vertex_05001118: # 0x05001118
vertex   -101,      0,   -176,   -542,  -1292,  0x93, 0x00, 0xC0, 0xFF
vertex   -101,    -19,   -176,   -542,  -1292,  0x93, 0x00, 0xC0, 0xFF
vertex   -204,    -19,      0,  -1564,    478,  0x93, 0x00, 0xC0, 0xFF
vertex    205,      0,      0,   2524,    478,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,   -176,   -542,  -1292,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,    177,   -542,   2248,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,      0,      0,  -1564,    478,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,      0,      0,  -1564,    478,  0x93, 0x00, 0xC0, 0xFF
vertex    102,    -19,    177,   1502,   2248,  0x00, 0x81, 0x00, 0xFF
vertex   -101,    -19,    177,   -542,   2248,  0x00, 0x81, 0x00, 0xFF
vertex   -204,    -19,      0,  -1564,    478,  0x00, 0x81, 0x00, 0xFF
vertex   -204,      0,      0,  -1564,    478,  0x93, 0x00, 0x3F, 0xFF
vertex   -204,    -19,      0,  -1564,    478,  0x93, 0x00, 0x3F, 0xFF
vertex   -101,    -19,    177,   -542,   2248,  0x93, 0x00, 0x3F, 0xFF
vertex   -101,      0,    177,   -542,   2248,  0x93, 0x00, 0x3F, 0xFF

springboard_seg5_vertex_05001208: # 0x05001208
vertex   -101,      0,    177,   -542,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,    -19,    177,   -542,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    102,    -19,    177,   1502,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    205,      0,      0,   2524,    478,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,    177,   -542,   2248,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,    177,   1502,   2248,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,    177,   1502,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    102,      0,    177,   1502,   2248,  0x6D, 0x00, 0x3F, 0xFF
vertex    102,    -19,    177,   1502,   2248,  0x6D, 0x00, 0x3F, 0xFF
vertex    205,    -19,      0,   2524,    478,  0x6D, 0x00, 0x3F, 0xFF
vertex    205,      0,      0,   2524,    478,  0x6D, 0x00, 0x3F, 0xFF

springboard_seg5_vertex_050012B8: # 0x050012B8
vertex    -76,    -55,   -132,      0,    990,  0x93, 0x00, 0xC1, 0xFF
vertex   -153,     56,      0,    990,      0,  0x93, 0x00, 0xC1, 0xFF
vertex    -76,     56,   -132,      0,      0,  0x93, 0x00, 0xC1, 0xFF
vertex    -76,     56,    133,    990,      0,  0x93, 0x00, 0x3F, 0xFF
vertex   -153,     56,      0,      0,      0,  0x93, 0x00, 0x3F, 0xFF
vertex   -153,    -55,      0,      0,    990,  0x93, 0x00, 0x3F, 0xFF
vertex    -76,    -55,    133,    990,    990,  0x93, 0x00, 0x3F, 0xFF
vertex     77,     56,    133,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,     56,    133,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,    -55,    133,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     77,    -55,    133,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    154,     56,      0,    990,      0,  0x6D, 0x00, 0x3F, 0xFF
vertex     77,     56,    133,      0,      0,  0x6D, 0x00, 0x3F, 0xFF
vertex     77,    -55,    133,      0,    990,  0x6D, 0x00, 0x3F, 0xFF
vertex    154,    -55,      0,    990,    990,  0x6D, 0x00, 0x3F, 0xFF

springboard_seg5_vertex_050013A8: # 0x050013A8
vertex     77,     56,   -132,    990,      0,  0x6D, 0x00, 0xC1, 0xFF
vertex    154,    -55,      0,      0,    990,  0x6D, 0x00, 0xC1, 0xFF
vertex     77,    -55,   -132,    990,    990,  0x6D, 0x00, 0xC1, 0xFF
vertex    -76,    -55,   -132,      0,    990,  0x93, 0x00, 0xC1, 0xFF
vertex   -153,    -55,      0,    990,    990,  0x93, 0x00, 0xC1, 0xFF
vertex   -153,     56,      0,    990,      0,  0x93, 0x00, 0xC1, 0xFF
vertex    -76,     56,   -132,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex     77,     56,   -132,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     77,    -55,   -132,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    -76,    -55,   -132,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    154,     56,      0,      0,      0,  0x6D, 0x00, 0xC1, 0xFF

springboard_seg5_vertex_05001458: # 0x05001458
vertex    102,     20,   -176,   1502,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex    102,      0,   -176,   1502,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex   -101,      0,   -176,   -542,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex   -101,     20,   -176,   -542,  -1292,  0x00, 0x00, 0x81, 0xFF
vertex    205,     20,      0,   2524,    480,  0x00, 0x7F, 0x00, 0xFF
vertex    102,     20,   -176,   1502,  -1292,  0x00, 0x7F, 0x00, 0xFF
vertex    102,     20,    177,   1502,   2248,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,     20,      0,  -1564,    480,  0x00, 0x7F, 0x00, 0xFF
vertex    205,     20,      0,   2524,    480,  0x6D, 0x00, 0xC0, 0xFF
vertex    102,      0,   -176,   1502,  -1292,  0x6D, 0x00, 0xC0, 0xFF
vertex    102,     20,   -176,   1502,  -1292,  0x6D, 0x00, 0xC0, 0xFF
vertex   -101,     20,   -176,   -542,  -1292,  0x00, 0x7F, 0x00, 0xFF
vertex    205,      0,      0,   2524,    480,  0x6D, 0x00, 0xC0, 0xFF
vertex   -101,     20,   -176,   -542,  -1292,  0x93, 0x00, 0xC0, 0xFF
vertex   -101,      0,   -176,   -542,  -1292,  0x93, 0x00, 0xC0, 0xFF
vertex   -204,      0,      0,  -1564,    480,  0x93, 0x00, 0xC0, 0xFF

springboard_seg5_vertex_05001558: # 0x05001558
vertex   -101,     20,   -176,   -542,  -1292,  0x93, 0x00, 0xC0, 0xFF
vertex   -204,      0,      0,  -1564,    480,  0x93, 0x00, 0xC0, 0xFF
vertex   -204,     20,      0,  -1564,    480,  0x93, 0x00, 0xC0, 0xFF
vertex    102,     20,    177,   1502,   2248,  0x6D, 0x00, 0x3F, 0xFF
vertex    205,      0,      0,   2524,    480,  0x6D, 0x00, 0x3F, 0xFF
vertex    205,     20,      0,   2524,    480,  0x6D, 0x00, 0x3F, 0xFF
vertex   -101,     20,    177,   -542,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    102,      0,    177,   1502,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    102,     20,    177,   1502,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    102,      0,    177,   1502,   2248,  0x6D, 0x00, 0x3F, 0xFF
vertex   -204,     20,      0,  -1564,    480,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,     20,    177,   -542,   2248,  0x00, 0x7F, 0x00, 0xFF
vertex    102,     20,    177,   1502,   2248,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,     20,      0,  -1564,    480,  0x93, 0x00, 0x3F, 0xFF
vertex   -204,      0,      0,  -1564,    480,  0x93, 0x00, 0x3F, 0xFF
vertex   -101,      0,    177,   -542,   2248,  0x93, 0x00, 0x3F, 0xFF

springboard_seg5_vertex_05001658: # 0x05001658
vertex   -204,     20,      0,  -1564,    480,  0x93, 0x00, 0x3F, 0xFF
vertex   -101,      0,    177,   -542,   2248,  0x93, 0x00, 0x3F, 0xFF
vertex   -101,     20,    177,   -542,   2248,  0x93, 0x00, 0x3F, 0xFF
vertex   -101,     20,    177,   -542,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,      0,    177,   -542,   2248,  0x00, 0x00, 0x7F, 0xFF
vertex    102,      0,    177,   1502,   2248,  0x00, 0x00, 0x7F, 0xFF

glabel springboard_checkerboard_seg5_dl_050016B8 # 0x050016B8 - 0x05001800
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, springboard_seg5_texture_05000018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight springboard_seg5_light_05000008, 1
gsSPLight springboard_seg5_light_05000000, 2
gsSPVertex springboard_seg5_vertex_05001018, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 10, 12, 0x0
gsSP2Triangles 13, 12, 14, 0x0,  3, 15,  4, 0x0
gsSPVertex springboard_seg5_vertex_05001118, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  0,  2,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex springboard_seg5_vertex_05001208, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  7,  8,  9, 0x0
gsSP1Triangle  7,  9, 10, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel springboard_spring_seg5_dl_05001800 # 0x05001800 - 0x05001900
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, springboard_seg5_texture_05000818
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight springboard_seg5_light_05000008, 1
gsSPLight springboard_seg5_light_05000000, 2
gsSPVertex springboard_seg5_vertex_050012B8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex springboard_seg5_vertex_050013A8, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle  0, 10,  1, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel springboard_checkerboard_seg5_dl_05001900 # 0x05001900 - 0x05001A28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, springboard_seg5_texture_05000018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight springboard_seg5_light_05000008, 1
gsSPLight springboard_seg5_light_05000000, 2
gsSPVertex springboard_seg5_vertex_05001458, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  5, 11,  7, 0x0
gsSP2Triangles  8, 12,  9, 0x0, 13, 14, 15, 0x0
gsSPVertex springboard_seg5_vertex_05001558, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  3,  9,  4, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex springboard_seg5_vertex_05001658, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
