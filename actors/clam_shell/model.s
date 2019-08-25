# Clam Shell

# Unreferenced light
.byte 0x1B, 0x23, 0x30, 0x00, 0x1B, 0x23, 0x30, 0x00

.byte 0x6D, 0x8F, 0xC3, 0x00, 0x6D, 0x8F, 0xC3, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x18, 0x28, 0x38, 0x00, 0x18, 0x28, 0x38, 0x00

.byte 0x60, 0xA2, 0xE2, 0x00, 0x60, 0xA2, 0xE2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

clam_shell_seg5_texture_05000030: # 0x05000030
.incbin "actors/clam_shell/clam_shell.rgba16"

clam_shell_seg5_texture_05000830: # 0x05000830
.incbin "actors/clam_shell/clam_shell_mouth.rgba16"

clam_shell_seg5_light_05001030: # 0x05001030
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

clam_shell_seg5_light_05001038: # 0x05001038
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

clam_shell_seg5_vertex_05001048: # 0x05001048
vertex    728,   -261,      0,    480,    566,  0x00, 0x7E, 0xF5, 0xFF
vertex    -10,      2,   -131,    580,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    404,    -50,   -528,    886,    318,  0xF5, 0x7E, 0x00, 0xFF
vertex    404,    -50,    529,     72,    318,  0x00, 0x7F, 0x00, 0xFF
vertex   1083,   -106,    435,    144,    838,  0xA8, 0xA8, 0x16, 0xFF
vertex    777,    -25,    658,    -26,    604,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1087,   -154,      0,    480,    842,  0x38, 0x71, 0x00, 0xFF
vertex   1214,     19,      0,    480,    940,  0xA7, 0xA7, 0x00, 0xFF
vertex    -10,      2,    132,    378,      0,  0x00, 0x81, 0x00, 0xFF
vertex   1083,   -106,   -434,    814,    838,  0x31, 0x63, 0x3D, 0xFF
vertex    777,    -25,   -657,    984,    604,  0xFF, 0xFF, 0xFF, 0xFF

clam_shell_seg5_vertex_050010F8: # 0x050010F8
vertex   1087,   -154,      0,    480,    816,  0x38, 0x71, 0x00, 0xFF
vertex   1214,     19,      0,    480,    906,  0xA7, 0xA7, 0x00, 0xFF
vertex   1083,   -106,   -434,    168,    814,  0x31, 0x63, 0x3D, 0xFF
vertex    728,   -261,      0,    480,    560,  0x00, 0x7E, 0xF5, 0xFF
vertex    -10,      2,    132,    574,     34,  0x00, 0x81, 0x00, 0xFF
vertex    404,    -50,    529,    856,    328,  0x00, 0x7F, 0x00, 0xFF
vertex   1083,   -106,    435,    790,    814,  0xA8, 0xA8, 0x16, 0xFF
vertex    777,    -25,    658,    948,    594,  0xFF, 0xFF, 0xFF, 0xFF
vertex    777,    -25,   -657,     10,    594,  0xFF, 0xFF, 0xFF, 0xFF
vertex    404,    -50,   -528,    102,    328,  0xF5, 0x7E, 0x00, 0xFF
vertex    -10,      2,   -131,    384,     34,  0xFF, 0xFF, 0xFF, 0xFF

glabel clam_shell_seg5_dl_050011A8 # 0x050011A8 - 0x05001238
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, clam_shell_seg5_texture_05000030
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight clam_shell_seg5_light_05001038, 1
gsSPLight clam_shell_seg5_light_05001030, 2
gsSPVertex clam_shell_seg5_vertex_05001048, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  4,  5,  3, 0x0,  4,  0,  6, 0x0
gsSP2Triangles  6,  7,  4, 0x0,  3,  8,  0, 0x0
gsSP2Triangles  6,  0,  9, 0x0,  2, 10,  9, 0x0
gsSP2Triangles  9,  7,  6, 0x0,  9,  0,  2, 0x0
gsSP1Triangle  8,  1,  0, 0x0
gsSPEndDisplayList

glabel clam_shell_seg5_dl_05001238 # 0x05001238 - 0x050012B8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, clam_shell_seg5_texture_05000830
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex clam_shell_seg5_vertex_050010F8, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  0,  3,  6, 0x0,  6,  1,  0, 0x0
gsSP2Triangles  2,  8,  9, 0x0,  9, 10,  3, 0x0
gsSP2Triangles  9,  3,  2, 0x0,  3, 10,  4, 0x0
gsSP1Triangle  2,  3,  0, 0x0
gsSPEndDisplayList

glabel clam_shell_seg5_dl_050012B8 # 0x050012B8 - 0x05001320
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList clam_shell_seg5_dl_050011A8
gsSPDisplayList clam_shell_seg5_dl_05001238
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

clam_shell_seg5_light_05001320: # 0x05001320
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

clam_shell_seg5_light_05001328: # 0x05001328
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

clam_shell_seg5_vertex_05001338: # 0x05001338
vertex    260,      0,      0,    480,    600,  0xF5, 0x7E, 0x07, 0xFF
vertex   -531,     -1,    132,    580,     -8,  0x00, 0x81, 0x00, 0xFF
vertex   -124,    -74,    529,    886,    304,  0xFF, 0xFF, 0xFF, 0xFF
vertex    692,    -45,      0,    480,    932,  0x81, 0x00, 0x00, 0xFF
vertex    556,   -160,   -434,    144,    828,  0x00, 0x81, 0x00, 0xFF
vertex    248,    -68,   -657,    -26,    590,  0x00, 0x00, 0x81, 0xFF
vertex   -124,    -74,   -528,     72,    304,  0xFF, 0xFF, 0xFF, 0xFF
vertex    248,    -68,    658,    984,    590,  0x0F, 0x7D, 0x0F, 0xFF
vertex    556,   -160,    435,    814,    828,  0x00, 0x00, 0x7F, 0xFF
vertex   -531,     -1,   -131,    378,     -8,  0x00, 0x81, 0x00, 0xFF

clam_shell_seg5_vertex_050013D8: # 0x050013D8
vertex    556,   -160,    435,    790,    796,  0x00, 0x00, 0x7F, 0xFF
vertex    248,    -68,    658,    948,    568,  0x0F, 0x7D, 0x0F, 0xFF
vertex    260,      0,      0,    480,    576,  0xF5, 0x7E, 0x07, 0xFF
vertex    692,    -45,      0,    480,    896,  0x81, 0x00, 0x00, 0xFF
vertex    556,   -160,   -434,    168,    796,  0x00, 0x81, 0x00, 0xFF
vertex   -124,    -74,    529,    856,    292,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -124,    -74,   -528,    102,    292,  0xFF, 0xFF, 0xFF, 0xFF
vertex    248,    -68,   -657,     10,    568,  0x00, 0x00, 0x81, 0xFF
vertex   -531,     -1,    132,    574,     -8,  0x00, 0x81, 0x00, 0xFF
vertex   -531,     -1,   -131,    384,     -8,  0x00, 0x81, 0x00, 0xFF

glabel clam_shell_seg5_dl_05001478 # 0x05001478 - 0x050014F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, clam_shell_seg5_texture_05000030
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight clam_shell_seg5_light_05001328, 1
gsSPLight clam_shell_seg5_light_05001320, 2
gsSPVertex clam_shell_seg5_vertex_05001338, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  4,  5,  0, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  0,  7,  8, 0x0,  2,  7,  0, 0x0
gsSP2Triangles  8,  3,  0, 0x0,  0,  9,  1, 0x0
gsSP1Triangle  6,  9,  0, 0x0
gsSPEndDisplayList

glabel clam_shell_seg5_dl_050014F8 # 0x050014F8 - 0x05001568
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, clam_shell_seg5_texture_05000830
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex clam_shell_seg5_vertex_050013D8, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  6,  7,  2, 0x0,  2,  7,  4, 0x0
gsSP2Triangles  8,  9,  2, 0x0,  2,  9,  6, 0x0
gsSP1Triangle  5,  8,  2, 0x0
gsSPEndDisplayList

glabel clam_shell_seg5_dl_05001568 # 0x05001568 - 0x050015D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList clam_shell_seg5_dl_05001478
gsSPDisplayList clam_shell_seg5_dl_050014F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

clam_shell_seg5_animvalue_050015D0: # 0x050015D0
.hword 0x0000, 0x3FFF, 0x0E08, 0x1135, 0x1458, 0x1118, 0x0DBA, 0x1055
.hword 0x1326, 0x10AE, 0x0E3E, 0x1121, 0x13F2, 0x116A, 0x0E81, 0x0FAA
.hword 0x1127, 0x0FDC, 0x0E5C, 0x0E11, 0x0E00, 0x0E0D, 0x0E19, 0x0E08
.hword 0x22E4, 0x4D59, 0x6EC3, 0x7A37, 0x7C9F, 0x7E13, 0x7D78, 0x7E13
.hword 0x8001, 0x8001, 0x8001, 0x0000

clam_shell_seg5_animindex_05001618: # 0x05001618
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0022, 0x0001, 0x0020, 0x0001, 0x0021, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x001E, 0x0002

clam_shell_seg5_anim_05001654: # 0x05001654
.hword 1
.hword 0
.hword 0
.hword 0
.hword 0x1E
.hword 0x04
.word clam_shell_seg5_animvalue_050015D0
.word clam_shell_seg5_animindex_05001618
.word 0

clam_shell_seg5_animvalue_0500166C: # 0x0500166C
.hword 0x0000, 0x3FFF, 0x7E13, 0x7DFA, 0x7DB2, 0x7D3C, 0x7C99, 0x7BCC
.hword 0x7AD5, 0x79B7, 0x7874, 0x770C, 0x7582, 0x73D8, 0x720E, 0x7027
.hword 0x6E24, 0x6C08, 0x69D3, 0x6787, 0x6527, 0x62B3, 0x602E, 0x5D98
.hword 0x5AF5, 0x5845, 0x558A, 0x52C6, 0x4FFA, 0x4D28, 0x4A52, 0x477A
.hword 0x44A1, 0x41C9, 0x3EF3, 0x3C21, 0x3955, 0x3691, 0x33D6, 0x3126
.hword 0x2E83, 0x2BED, 0x2968, 0x26F4, 0x2494, 0x2248, 0x2013, 0x1DF7
.hword 0x1BF4, 0x1A0D, 0x1843, 0x1699, 0x150F, 0x13A7, 0x1264, 0x1146
.hword 0x104F, 0x0F82, 0x0EDF, 0x0E69, 0x0E21, 0x0E08, 0x8001, 0x8001
.hword 0x8001, 0x0000

clam_shell_seg5_animindex_050016F0: # 0x050016F0
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0040, 0x0001, 0x003E, 0x0001, 0x003F, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x003C, 0x0002

clam_shell_seg5_anim_0500172C: # 0x0500172C
.hword 1
.hword 0
.hword 0
.hword 0
.hword 0x3C
.hword 0x04
.word clam_shell_seg5_animvalue_0500166C
.word clam_shell_seg5_animindex_050016F0
.word 0

glabel clam_shell_seg5_anims_05001744 # 0x05001744
.word clam_shell_seg5_anim_05001654
.word clam_shell_seg5_anim_0500172C
.word 0
