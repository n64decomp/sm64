# Chair

# Unreferenced light
.byte 0x19, 0x0D, 0x06, 0x00, 0x19, 0x0D, 0x06, 0x00

.byte 0x64, 0x36, 0x1A, 0x00, 0x64, 0x36, 0x1A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chair_seg5_texture_05003060: # 0x05003060
.incbin "actors/chair/chair_front.rgba16"

chair_seg5_texture_05003860: # 0x05003860
.incbin "actors/chair/chair_leg.rgba16"

chair_seg5_texture_05004060: # 0x05004060
.incbin "actors/chair/chair_bottom.rgba16"

# unreferenced
chair_seg5_texture_05004460: # 0x05004460
.incbin "actors/chair/chair_surface_unused.rgba16"

chair_seg5_light_05004C60: # 0x05004C60
.byte 0x47, 0x47, 0x47, 0x00, 0x47, 0x47, 0x47, 0x00

chair_seg5_light_05004C68: # 0x05004C68
.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chair_seg5_vertex_05004C78: # 0x05004C78
vertex    334,    -20,      1,    474,   -182,  0x77, 0x00, 0xD6, 0xFF
vertex    287,    -20,   -132,   1212,     58,  0x77, 0x00, 0xD6, 0xFF
vertex    334,     25,      1,    474,   -182,  0x77, 0x00, 0xD6, 0xFF
vertex    334,     25,      1,    474,   -182,  0x77, 0x00, 0x2A, 0xFF
vertex    287,     25,    134,   -262,     58,  0x77, 0x00, 0x2A, 0xFF
vertex    334,    -20,      1,    474,   -182,  0x77, 0x00, 0x2A, 0xFF
vertex    287,    -20,    134,   -262,     58,  0x77, 0x00, 0x2A, 0xFF
vertex    287,    -20,   -132,   1212,     58,  0x00, 0x81, 0x00, 0xFF
vertex    334,    -20,      1,    474,   -182,  0x00, 0x81, 0x00, 0xFF
vertex    287,    -20,    134,   -262,     58,  0x00, 0x81, 0x00, 0xFF
vertex     -7,    -20,    -91,    986,   1536,  0xEF, 0x00, 0x83, 0xFF
vertex     -7,     25,    -91,    986,   1536,  0xEF, 0x00, 0x83, 0xFF
vertex    287,    -20,   -132,   1212,     58,  0xEF, 0x00, 0x83, 0xFF
vertex    287,     25,   -132,   1212,     58,  0xEF, 0x00, 0x83, 0xFF
vertex    287,     25,   -132,   1212,     58,  0x77, 0x00, 0xD6, 0xFF
vertex     -7,    -20,    -91,    986,   1536,  0x00, 0x81, 0x00, 0xFF

chair_seg5_vertex_05004D78: # 0x05004D78
vertex    287,     25,    134,   -262,     58,  0x00, 0x7F, 0x00, 0xFF
vertex    334,     25,      1,    474,   -182,  0x00, 0x7F, 0x00, 0xFF
vertex    287,     25,   -132,   1212,     58,  0x00, 0x7F, 0x00, 0xFF
vertex     -7,     25,    -91,    986,   1536,  0x00, 0x7F, 0x00, 0xFF
vertex     -7,     25,     93,    -34,   1536,  0x00, 0x7F, 0x00, 0xFF
vertex     -7,    -20,     93,    -34,   1536,  0xEF, 0x00, 0x7D, 0xFF
vertex    287,    -20,    134,   -262,     58,  0xEF, 0x00, 0x7D, 0xFF
vertex    287,     25,    134,   -262,     58,  0xEF, 0x00, 0x7D, 0xFF
vertex     -7,     25,     93,    -34,   1536,  0xEF, 0x00, 0x7D, 0xFF
vertex     -7,    -20,     93,    -34,   1536,  0x00, 0x81, 0x00, 0xFF
vertex     -7,    -20,    -91,    986,   1536,  0x00, 0x81, 0x00, 0xFF
vertex    287,    -20,    134,   -262,     58,  0x00, 0x81, 0x00, 0xFF

glabel chair_seg5_dl_05004E38 # 0x05004E38 - 0x05004EE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chair_seg5_texture_05003060
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight chair_seg5_light_05004C68, 1
gsSPLight chair_seg5_light_05004C60, 2
gsSPVertex chair_seg5_vertex_05004C78, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 11, 13, 12, 0x0
gsSP2Triangles  1, 14,  2, 0x0, 15,  7,  9, 0x0
gsSPVertex chair_seg5_vertex_05004D78, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  2, 0x0
gsSP2Triangles  4,  0,  2, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  5,  7, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel chair_seg5_dl_05004EE8 # 0x05004EE8 - 0x05004F58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chair_seg5_dl_05004E38
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

chair_seg5_light_05004F58: # 0x05004F58
.byte 0x47, 0x47, 0x47, 0x00, 0x47, 0x47, 0x47, 0x00

chair_seg5_light_05004F60: # 0x05004F60
.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chair_seg5_vertex_05004F70: # 0x05004F70
vertex    208,    -20,   -125,   1934,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -38,     24,   -125,   1935,    990,  0x00, 0x00, 0x81, 0xFF
vertex    208,     24,   -125,   1934,      0,  0x00, 0x00, 0x81, 0xFF
vertex    208,     24,   -125,   1934,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -38,     24,    127,    -20,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    208,     24,    127,    -21,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -38,     24,   -125,   1935,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    208,    -20,    127,    -21,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    208,     24,   -125,   1934,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    208,     24,    127,    -21,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    208,    -20,   -125,   1934,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -38,    -20,   -125,   1935,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -38,     24,    127,    -20,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -38,     24,   -125,   1935,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -38,    -20,    127,    -20,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -38,    -20,   -125,   1935,    990,  0x00, 0x00, 0x81, 0xFF

chair_seg5_vertex_05005070: # 0x05005070
vertex    208,    -20,    127,    -21,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -38,    -20,   -125,   1935,    990,  0x00, 0x81, 0x00, 0xFF
vertex    208,    -20,   -125,   1934,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -38,    -20,    127,    -20,    990,  0x00, 0x81, 0x00, 0xFF
vertex    -38,    -20,    127,    577,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    208,    -20,    127,    511,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    208,     24,    127,    511,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -38,     24,    127,    577,    990,  0x00, 0x00, 0x7F, 0xFF

glabel chair_seg5_dl_050050F0 # 0x050050F0 - 0x05005190
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chair_seg5_texture_05004060
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight chair_seg5_light_05004F60, 1
gsSPLight chair_seg5_light_05004F58, 2
gsSPVertex chair_seg5_vertex_05004F70, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPVertex chair_seg5_vertex_05005070, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel chair_seg5_dl_05005190 # 0x05005190 - 0x05005200
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList chair_seg5_dl_050050F0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

chair_seg5_light_05005200: # 0x05005200
.byte 0x47, 0x47, 0x47, 0x00, 0x47, 0x47, 0x47, 0x00

chair_seg5_light_05005208: # 0x05005208
.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chair_seg5_vertex_05005218: # 0x05005218
vertex    146,    -22,    104,    998,    990,  0xEF, 0x00, 0x7D, 0xFF
vertex    146,     26,    104,    998,    990,  0xEF, 0x00, 0x7D, 0xFF
vertex     -8,     26,     82,    886,    -24,  0xEF, 0x00, 0x7D, 0xFF
vertex    146,     26,    104,    998,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,    -22,   -102,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,     26,   -102,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,    -22,    104,    998,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,     26,    104,    998,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     -8,     26,    -79,     78,    -24,  0x00, 0x7F, 0x00, 0xFF
vertex     -8,     26,     82,    886,    -24,  0x00, 0x7F, 0x00, 0xFF
vertex    146,     26,   -102,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    146,    -22,   -102,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex     -8,    -22,     82,    886,    -24,  0x00, 0x81, 0x00, 0xFF
vertex     -8,    -22,    -79,     78,    -24,  0x00, 0x81, 0x00, 0xFF
vertex    146,    -22,    104,    998,    990,  0x00, 0x81, 0x00, 0xFF

chair_seg5_vertex_05005308: # 0x05005308
vertex    146,     26,   -102,      0,    990,  0xEE, 0x00, 0x83, 0xFF
vertex    146,    -22,   -102,      0,    990,  0xEE, 0x00, 0x83, 0xFF
vertex     -8,    -22,    -79,     78,    -24,  0xEE, 0x00, 0x83, 0xFF
vertex     -8,     26,    -79,     78,    -24,  0xEE, 0x00, 0x83, 0xFF
vertex    146,    -22,    104,    998,    990,  0xEF, 0x00, 0x7D, 0xFF
vertex     -8,     26,     82,    886,    -24,  0xEF, 0x00, 0x7D, 0xFF
vertex     -8,    -22,     82,    886,    -24,  0xEF, 0x00, 0x7D, 0xFF

glabel chair_seg5_dl_05005378 # 0x05005378 - 0x05005408
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chair_seg5_texture_05003860
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight chair_seg5_light_05005208, 1
gsSPLight chair_seg5_light_05005200, 2
gsSPVertex chair_seg5_vertex_05005218, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex chair_seg5_vertex_05005308, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP1Triangle  4,  5,  6, 0x0
gsSPEndDisplayList

glabel chair_seg5_dl_05005408 # 0x05005408 - 0x05005478
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chair_seg5_dl_05005378
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

chair_seg5_light_05005478: # 0x05005478
.byte 0x47, 0x47, 0x47, 0x00, 0x47, 0x47, 0x47, 0x00

chair_seg5_light_05005480: # 0x05005480
.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chair_seg5_vertex_05005490: # 0x05005490
vertex    146,    -19,    104,    998,    990,  0xEF, 0x00, 0x7D, 0xFF
vertex    146,     29,    104,    998,    990,  0xEF, 0x00, 0x7D, 0xFF
vertex     -8,     29,     82,    886,    -40,  0xEF, 0x00, 0x7D, 0xFF
vertex    146,     29,    104,    998,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,    -19,   -102,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,     29,   -102,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,    -19,    104,    998,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    146,     29,    104,    998,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     -8,     29,    -79,     78,    -40,  0x00, 0x7F, 0x00, 0xFF
vertex     -8,     29,     82,    886,    -40,  0x00, 0x7F, 0x00, 0xFF
vertex    146,     29,   -102,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    146,    -19,   -102,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex     -8,    -19,     82,    886,    -40,  0x00, 0x81, 0x00, 0xFF
vertex     -8,    -19,    -79,     78,    -40,  0x00, 0x81, 0x00, 0xFF
vertex    146,    -19,    104,    998,    990,  0x00, 0x81, 0x00, 0xFF

chair_seg5_vertex_05005580: # 0x05005580
vertex    146,     29,   -102,      0,    990,  0xEE, 0x00, 0x83, 0xFF
vertex    146,    -19,   -102,      0,    990,  0xEE, 0x00, 0x83, 0xFF
vertex     -8,    -19,    -79,     78,    -40,  0xEE, 0x00, 0x83, 0xFF
vertex     -8,     29,    -79,     78,    -40,  0xEE, 0x00, 0x83, 0xFF
vertex    146,    -19,    104,    998,    990,  0xEF, 0x00, 0x7D, 0xFF
vertex     -8,     29,     82,    886,    -40,  0xEF, 0x00, 0x7D, 0xFF
vertex     -8,    -19,     82,    886,    -40,  0xEF, 0x00, 0x7D, 0xFF

glabel chair_seg5_dl_050055F0 # 0x050055F0 - 0x05005680
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chair_seg5_texture_05003860
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight chair_seg5_light_05005480, 1
gsSPLight chair_seg5_light_05005478, 2
gsSPVertex chair_seg5_vertex_05005490, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex chair_seg5_vertex_05005580, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP1Triangle  4,  5,  6, 0x0
gsSPEndDisplayList

glabel chair_seg5_dl_05005680 # 0x05005680 - 0x050056F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chair_seg5_dl_050055F0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

chair_seg5_animvalue_050056F0: # 0x050056F0
.hword 0x0000, 0x0099, 0xFFAA, 0xC001, 0xC001, 0xC001, 0x3FFF, 0x0000

chair_seg5_animindex_05005700: # 0x05005700
.hword 0x0001, 0x0000, 0x0001, 0x0001, 0x0001, 0x0002, 0x0001, 0x0000
.hword 0x0001, 0x0003, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0004, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0005, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0006

chair_seg5_anim_0500576C: # 0x0500576C
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x64
.hword 0x08
.word chair_seg5_animvalue_050056F0
.word chair_seg5_animindex_05005700
.word 0

glabel chair_seg5_anims_05005784 # 0x05005784
.word chair_seg5_anim_0500576C
