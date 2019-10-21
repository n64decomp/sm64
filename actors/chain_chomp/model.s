# Chain Chomp

.balign 8

# These 6 lights are unreferenced.
chain_chomp_seg6_light_06021388: # 0x06021388
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

chain_chomp_seg6_light_06021390: # 0x06021390
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chain_chomp_seg6_light_060213A0: # 0x060213A0
.byte 0x03, 0x03, 0x05, 0x00, 0x03, 0x03, 0x05, 0x00

chain_chomp_seg6_light_060213A8: # 0x060213A8
.byte 0x0D, 0x0F, 0x16, 0x00, 0x0D, 0x0F, 0x16, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chain_chomp_seg6_light_060213B8: # 0x060213B8
.byte 0x25, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00

chain_chomp_seg6_light_060213C0: # 0x060213C0
.byte 0x96, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chain_chomp_seg6_texture_060213D0: # 0x060213D0
.incbin "actors/chain_chomp/chain_chomp_bright_shine.rgba16"

chain_chomp_seg6_texture_06021BD0: # 0x06021BD0
.incbin "actors/chain_chomp/chain_chomp_dull_shine.rgba16"

chain_chomp_seg6_texture_060223D0: # 0x060223D0
.incbin "actors/chain_chomp/chain_chomp_tongue.rgba16"

chain_chomp_seg6_texture_06022BD0: # 0x06022BD0
.incbin "actors/chain_chomp/chain_chomp_tooth.rgba16"

chain_chomp_seg6_texture_060233D0: # 0x060233D0
.incbin "actors/chain_chomp/chain_chomp_eye.rgba16"

chain_chomp_seg6_vertex_06023BD0: # 0x06023BD0
vertex      0,      0,    582,    990,    380,  0xB2, 0xB2, 0xB2, 0xFF
vertex    411,      0,   -410,    118,    880,  0xB2, 0xB2, 0xB2, 0xFF
vertex      0,      0,   -581,    -52,    472,  0xB2, 0xB2, 0xB2, 0xFF
vertex    582,      0,      0,    496,   1020,  0xB2, 0xB2, 0xB2, 0xFF
vertex    411,      0,    411,    856,    816,  0xB2, 0xB2, 0xB2, 0xFF

chain_chomp_seg6_vertex_06023C20: # 0x06023C20
vertex      0,   -581,      0,    448,   -130,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,   -536,   -156,    334,   -408,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -536,   -222,     58,   -276,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -536,    223,    818,    106,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,   -536,    157,    870,   -138,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -222,   -536,      0,    670,   -350,  0xFF, 0xFF, 0xFF, 0xFF
vertex    223,   -536,      0,    204,    180,  0xFF, 0xFF, 0xFF, 0xFF
vertex    157,   -536,    157,    542,    238,  0xFF, 0xFF, 0xFF, 0xFF
vertex    157,   -536,   -156,      4,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    291,   -410,   -290,   -390,    142,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,   -410,      0,    -22,    534,  0xFF, 0xFF, 0xFF, 0xFF
vertex    291,   -410,    291,    600,    640,  0xFF, 0xFF, 0xFF, 0xFF
vertex    370,   -216,   -369,   -652,    368,  0xFF, 0xFF, 0xFF, 0xFF
vertex    537,   -222,      0,   -196,    880,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -222,   -536,   -548,   -222,  0xFF, 0xFF, 0xFF, 0xFF
vertex    370,   -216,    370,    608,   1002,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_06023D20: # 0x06023D20
vertex    291,   -410,    291,    600,    640,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -410,    411,   1110,    398,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -536,    223,    818,    106,  0xFF, 0xFF, 0xFF, 0xFF
vertex    370,   -216,    370,    608,   1002,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,   -410,   -814,    606,  0xFF, 0xFF, 0xFF, 0xFF
vertex    537,   -222,      0,   -196,    880,  0xFF, 0xFF, 0xFF, 0xFF
vertex    370,   -216,   -369,   -652,    368,  0xFF, 0xFF, 0xFF, 0xFF
vertex    582,      0,      0,   -292,   1160,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,    411,    586,   1310,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -222,    537,   1282,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    582,   1306,    968,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,   -581,   -674,    -30,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -222,   -536,   -548,   -222,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,      0,    411,   1446,    334,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,   -222,    380,   1412,    114,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_06023E10: # 0x06023E10
vertex      0,   -410,   -410,   -290,   -308,  0xFF, 0xFF, 0xFF, 0xFF
vertex    291,   -410,   -290,   -390,    142,  0xFF, 0xFF, 0xFF, 0xFF
vertex    157,   -536,   -156,      4,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -222,   -536,   -548,   -222,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -536,   -222,     58,   -276,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -410,    411,   1110,    398,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,   -536,    157,    870,   -138,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -536,    223,    818,    106,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -290,   -410,    291,   1210,    -52,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -222,    537,   1282,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    582,   1306,    968,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,   -222,    380,   1412,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,   -410,      0,    840,   -444,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,   -536,   -156,    334,   -408,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -222,   -536,      0,    670,   -350,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_06023F00: # 0x06023F00
vertex   -410,      0,   -410,     44,   -372,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,   -581,   -674,    -30,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -222,   -536,   -548,   -222,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,   -222,   -379,    116,   -538,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -410,   -410,   -290,   -308,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -290,   -410,   -290,    218,   -550,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -536,   -222,     58,   -276,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,   -536,   -156,    334,   -408,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -290,   -410,    291,   1210,    -52,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -222,   -536,      0,    670,   -350,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,   -536,    157,    870,   -138,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,   -410,      0,    840,   -444,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,   -222,    380,   1412,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -536,   -222,      0,    928,   -400,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,      0,    411,   1446,    334,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -581,      0,      0,    924,   -222,  0xFF, 0xFF, 0xFF, 0xFF

glabel chain_chomp_seg6_dl_06024000 # 0x06024000 - 0x06024040
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_060223D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex chain_chomp_seg6_vertex_06023BD0, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP1Triangle  0,  4,  3, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024040 # 0x06024040 - 0x06024240
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_060213D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex chain_chomp_seg6_vertex_06023C20, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  5,  1, 0x0,  0,  4,  5, 0x0
gsSP2Triangles  0,  6,  7, 0x0,  0,  8,  6, 0x0
gsSP2Triangles  0,  2,  8, 0x0,  0,  7,  3, 0x0
gsSP2Triangles  9,  6,  8, 0x0,  9, 10,  6, 0x0
gsSP2Triangles 10,  7,  6, 0x0, 10, 11,  7, 0x0
gsSP2Triangles 11,  3,  7, 0x0, 12, 10,  9, 0x0
gsSP2Triangles 12, 13, 10, 0x0, 13, 11, 10, 0x0
gsSP2Triangles 14, 12,  9, 0x0, 13, 15, 11, 0x0
gsSPVertex chain_chomp_seg6_vertex_06023D20, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  7,  3,  5, 0x0,  7,  8,  3, 0x0
gsSP2Triangles  3,  9,  1, 0x0,  8,  9,  3, 0x0
gsSP2Triangles  8, 10,  9, 0x0, 11,  4,  6, 0x0
gsSP2Triangles 11,  6, 12, 0x0, 10, 13, 14, 0x0
gsSPVertex chain_chomp_seg6_vertex_06023E10, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  9,  8,  5, 0x0
gsSP2Triangles 10, 11,  9, 0x0,  9, 11,  8, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex chain_chomp_seg6_vertex_06023F00, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  3,  2,  4, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 11,  8, 0x0, 11,  5,  7, 0x0
gsSP2Triangles 13,  5, 11, 0x0, 12, 13, 11, 0x0
gsSP2Triangles 14, 13, 12, 0x0, 14, 15, 13, 0x0
gsSP2Triangles 15,  0,  3, 0x0, 13,  3,  5, 0x0
gsSP1Triangle 15,  3, 13, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024240 # 0x06024240 - 0x060242D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024000
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024040
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

chain_chomp_seg6_vertex_060242D0: # 0x060242D0
vertex    157,    537,    157,  -1116,    776,  0xFF, 0xFF, 0xFF, 0xFF
vertex    223,    537,      0,   -898,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    582,      0,  -1454,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex    291,    411,    291,   -832,    966,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    411,    411,  -1600,   1136,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    537,    223,  -1532,    870,  0xFF, 0xFF, 0xFF, 0xFF
vertex    157,    537,   -156,  -1004,    328,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,    411,      0,   -428,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    537,   -222,  -1374,    234,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,    537,    157,  -1902,    776,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,    537,   -156,  -1790,    328,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -222,    537,      0,  -2008,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex    380,    223,    380,   -640,   1092,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    223,    537,  -1646,   1316,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_060243B0: # 0x060243B0
vertex      0,    411,   -410,  -1306,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex    291,    411,   -290,   -624,    138,  0xFF, 0xFF, 0xFF, 0xFF
vertex    380,    223,   -379,   -370,     10,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,    411,      0,   -428,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex    537,    223,      0,   -112,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex    380,    223,    380,   -640,   1092,  0xFF, 0xFF, 0xFF, 0xFF
vertex    157,    537,   -156,  -1004,    328,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,    411,   -574,   1136,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    582,  -1660,   1380,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    223,    537,  -1646,   1316,  0xFF, 0xFF, 0xFF, 0xFF
vertex    582,      0,      0,     -4,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,   -410,   -280,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    223,   -536,  -1262,   -214,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    411,    411,  -1600,   1136,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -290,    411,    291,  -2282,    966,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,    223,    380,  -2538,   1092,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_060244B0: # 0x060244B0
vertex      0,    223,   -536,  -1262,   -214,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,   -410,   -280,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,   -581,  -1246,   -278,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    537,   -222,  -1374,    234,  0xFF, 0xFF, 0xFF, 0xFF
vertex    157,    537,   -156,  -1004,    328,  0xFF, 0xFF, 0xFF, 0xFF
vertex    291,    411,   -290,   -624,    138,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    411,   -410,  -1306,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    537,    223,  -1532,    870,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -290,    411,    291,  -2282,    966,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    411,    411,  -1600,   1136,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,    537,    157,  -1902,    776,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,    223,    380,  -2538,   1092,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    223,    537,  -1646,   1316,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,      0,    411,  -2626,   1136,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    582,  -1660,   1380,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,    223,   -379,  -2266,     10,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_060245B0: # 0x060245B0
vertex   -290,    411,   -290,  -2076,    138,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    223,   -536,  -1262,   -214,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,    223,   -379,  -2266,     10,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    411,   -410,  -1306,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,   -581,  -1246,   -278,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,      0,   -410,  -2334,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,    537,   -156,  -1790,    328,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    537,   -222,  -1374,    234,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -156,    537,    157,  -1902,    776,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,    411,      0,  -2480,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -290,    411,    291,  -2282,    966,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -536,    223,      0,  -2794,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -379,    223,    380,  -2538,   1092,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -581,      0,      0,  -2904,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -410,      0,    411,  -2626,   1136,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -222,    537,      0,  -2008,    552,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_060246B0: # 0x060246B0
vertex      0,      0,   -581,   1154,    138,  0xFF, 0xFF, 0xFF, 0xFF
vertex    582,      0,      0,    470,   1104,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,    411,    -12,    822,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    582,   -210,    138,  0xFF, 0xFF, 0xFF, 0xFF
vertex    411,      0,   -410,    954,    822,  0xFF, 0xFF, 0xFF, 0xFF

glabel chain_chomp_seg6_dl_06024700 # 0x06024700 - 0x06024900
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_06021BD0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex chain_chomp_seg6_vertex_060242D0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  5,  0,  2, 0x0
gsSP2Triangles  0,  5,  4, 0x0,  6,  1,  7, 0x0
gsSP2Triangles  1,  3,  7, 0x0,  1,  6,  2, 0x0
gsSP2Triangles  6,  8,  2, 0x0,  9,  5,  2, 0x0
gsSP2Triangles  8, 10,  2, 0x0, 10, 11,  2, 0x0
gsSP2Triangles 11,  9,  2, 0x0,  7,  3, 12, 0x0
gsSP2Triangles  3, 13, 12, 0x0,  3,  4, 13, 0x0
gsSPVertex chain_chomp_seg6_vertex_060243B0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  6,  3,  1, 0x0
gsSP2Triangles  4,  5,  7, 0x0,  5,  8,  7, 0x0
gsSP2Triangles  5,  9,  8, 0x0,  2,  4, 10, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  4,  7, 10, 0x0
gsSP2Triangles  2, 10, 11, 0x0, 12,  2, 11, 0x0
gsSP2Triangles  0,  2, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex chain_chomp_seg6_vertex_060244B0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0,  9, 11, 12, 0x0
gsSP2Triangles 12, 11, 13, 0x0, 12, 13, 14, 0x0
gsSP1Triangle 15,  0,  2, 0x0
gsSPVertex chain_chomp_seg6_vertex_060245B0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  2,  4,  5, 0x0,  6,  3,  0, 0x0
gsSP2Triangles  6,  7,  3, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  9,  0,  2, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 10,  9, 11, 0x0, 12, 13, 14, 0x0
gsSP2Triangles 12, 11, 13, 0x0, 11,  2,  5, 0x0
gsSP2Triangles  9,  2, 11, 0x0, 11,  5, 13, 0x0
gsSP2Triangles 15,  0,  9, 0x0, 15,  6,  0, 0x0
gsSP1Triangle  8, 15,  9, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024900 # 0x06024900 - 0x06024940
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_060223D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex chain_chomp_seg6_vertex_060246B0, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP1Triangle  0,  4,  1, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024940 # 0x06024940 - 0x060249D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024700
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024900
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

chain_chomp_seg6_light_060249D0: # 0x060249D0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

chain_chomp_seg6_light_060249D8: # 0x060249D8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

chain_chomp_seg6_vertex_060249E8: # 0x060249E8
vertex    341,   -287,    410,    990,      0,  0x69, 0xE7, 0x41, 0xFF
vertex    505,    -32,    246,      0,    990,  0x69, 0xE7, 0x41, 0xFF
vertex    374,    -49,    450,    990,    990,  0x69, 0xE7, 0x41, 0xFF
vertex    341,   -287,    410,    990,      0,  0x69, 0xE7, 0x42, 0xFF
vertex    473,   -270,    206,      0,      0,  0x69, 0xE7, 0x42, 0xFF
vertex    505,    -32,    246,      0,    990,  0x69, 0xE7, 0x42, 0xFF
vertex    374,    -49,   -449,    990,    990,  0x69, 0xE7, 0xBF, 0xFF
vertex    505,    -32,   -245,      0,    990,  0x69, 0xE7, 0xBF, 0xFF
vertex    341,   -287,   -409,    990,      0,  0x69, 0xE7, 0xBF, 0xFF
vertex    505,    -32,   -245,      0,    990,  0x69, 0xE7, 0xBE, 0xFF
vertex    473,   -270,   -205,      0,      0,  0x69, 0xE7, 0xBE, 0xFF
vertex    341,   -287,   -409,    990,      0,  0x69, 0xE7, 0xBE, 0xFF

glabel chain_chomp_seg6_dl_06024AA8 # 0x06024AA8 - 0x06024B00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_060233D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight chain_chomp_seg6_light_060249D8, 1
gsSPLight chain_chomp_seg6_light_060249D0, 2
gsSPVertex chain_chomp_seg6_vertex_060249E8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024B00 # 0x06024B00 - 0x06024B70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024AA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

chain_chomp_seg6_vertex_06024B70: # 0x06024B70
vertex    568,     -6,      1,   -466,    -52,  0xFF, 0xFF, 0xFF, 0xFF
vertex    458,    227,    139,    756,    806,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,     -6,    263,    652,   -626,  0xFF, 0xFF, 0xFF, 0xFF
vertex    182,     -6,   -493,    -90,    384,  0xFF, 0xFF, 0xFF, 0xFF
vertex    225,     72,   -473,    664,    930,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,     -6,   -454,    666,   -726,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,     -6,   -454,   -306,    174,  0xFF, 0xFF, 0xFF, 0xFF
vertex    325,    107,   -419,    680,   1044,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,     -6,   -403,    772,   -792,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,     -6,   -403,   -114,     10,  0xFF, 0xFF, 0xFF, 0xFF
vertex    379,    160,   -332,    526,   1002,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,     -6,   -262,    578,   -702,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,     -6,   -262,   -172,     58,  0xFF, 0xFF, 0xFF, 0xFF
vertex    458,    227,   -138,    838,    944,  0xFF, 0xFF, 0xFF, 0xFF
vertex    568,     -6,      1,    916,   -848,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_06024C60: # 0x06024C60
vertex    284,     -6,    455,   -250,    814,  0xFF, 0xFF, 0xFF, 0xFF
vertex    225,     72,    474,    530,   1852,  0xFF, 0xFF, 0xFF, 0xFF
vertex    182,     -6,    494,    764,    134,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,     -6,    263,   -108,    910,  0xFF, 0xFF, 0xFF, 0xFF
vertex    379,    160,    333,    930,   1682,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,     -6,    404,    670,    278,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,     -6,    404,   -412,    892,  0xFF, 0xFF, 0xFF, 0xFF
vertex    325,    107,    420,    430,   1696,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,     -6,    455,    482,    364,  0xFF, 0xFF, 0xFF, 0xFF

glabel chain_chomp_seg6_dl_06024CF0 # 0x06024CF0 - 0x06024D60
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_06022BD0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex chain_chomp_seg6_vertex_06024B70, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex chain_chomp_seg6_vertex_06024C60, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  6,  7,  8, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024D60 # 0x06024D60 - 0x06024DD0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024CF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

chain_chomp_seg6_vertex_06024DD0: # 0x06024DD0
vertex    462,      7,    263,   1768,   -234,  0xFF, 0xFF, 0xFF, 0xFF
vertex    455,   -211,    139,    702,   -864,  0xFF, 0xFF, 0xFF, 0xFF
vertex    568,      7,      1,    294,    704,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,      7,   -454,   1636,   -244,  0xFF, 0xFF, 0xFF, 0xFF
vertex    225,    -71,   -473,    768,   -746,  0xFF, 0xFF, 0xFF, 0xFF
vertex    182,      7,   -493,    594,    640,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,      7,   -403,   1486,   -364,  0xFF, 0xFF, 0xFF, 0xFF
vertex    325,   -105,   -418,     94,   -766,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,      7,   -454,    268,    516,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,      7,   -262,   1448,   -274,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,   -156,   -332,    112,   -638,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,      7,   -403,    202,    610,  0xFF, 0xFF, 0xFF, 0xFF
vertex    568,      7,      1,   1208,   -184,  0xFF, 0xFF, 0xFF, 0xFF
vertex    455,   -211,   -138,    440,   -848,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,      7,   -262,    446,    714,  0xFF, 0xFF, 0xFF, 0xFF

chain_chomp_seg6_vertex_06024EC0: # 0x06024EC0
vertex    182,      7,    494,    860,    726,  0xFF, 0xFF, 0xFF, 0xFF
vertex    225,    -71,    474,    378,    266,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,      7,    455,    288,   1474,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,      7,    404,   1210,    638,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,   -156,    333,    294,    170,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,      7,    263,    160,   1602,  0xFF, 0xFF, 0xFF, 0xFF
vertex    284,      7,    455,    830,    718,  0xFF, 0xFF, 0xFF, 0xFF
vertex    325,   -105,    419,    360,    204,  0xFF, 0xFF, 0xFF, 0xFF
vertex    403,      7,    404,    192,   1584,  0xFF, 0xFF, 0xFF, 0xFF

glabel chain_chomp_seg6_dl_06024F50 # 0x06024F50 - 0x06024FC0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, chain_chomp_seg6_texture_06022BD0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex chain_chomp_seg6_vertex_06024DD0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex chain_chomp_seg6_vertex_06024EC0, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  6,  7,  8, 0x0
gsSPEndDisplayList

glabel chain_chomp_seg6_dl_06024FC0 # 0x06024FC0 - 0x06025030
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList chain_chomp_seg6_dl_06024F50
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

chain_chomp_seg6_animvalue_06025030: # 0x06025030
.hword 0x0000, 0x3FFF, 0x9602, 0x9483, 0x90D2, 0x8C1B, 0x878E, 0x845A
.hword 0x83AC, 0x88AE, 0x9264, 0x9BC5, 0x9FC9, 0x9C7C, 0x950F, 0x8C27
.hword 0x846D, 0x808A, 0x8348, 0x8ABB, 0x9273, 0x9602, 0x6FB2, 0x70C6
.hword 0x7369, 0x76BA, 0x79D6, 0x7BDD, 0x7BEB, 0x7752, 0x6ED7, 0x66CA
.hword 0x6379, 0x6692, 0x6D54, 0x756C, 0x7C87, 0x8054, 0x7E7C, 0x78B0
.hword 0x728D, 0x6FB2, 0x9602, 0x9483, 0x90D2, 0x8C1B, 0x878E, 0x845A
.hword 0x83AC, 0x88AE, 0x9264, 0x9BC5, 0x9FC9, 0x9C7C, 0x950F, 0x8C27
.hword 0x846D, 0x808A, 0x8348, 0x8ABB, 0x9273, 0x9602, 0x6FB2, 0x70C6
.hword 0x7369, 0x76BA, 0x79D6, 0x7BDD, 0x7BEB, 0x7752, 0x6ED7, 0x66CA
.hword 0x6379, 0x6692, 0x6D54, 0x756C, 0x7C87, 0x8054, 0x7E7C, 0x78B0
.hword 0x728D, 0x6FB2, 0x6FB2, 0x70C6, 0x7369, 0x76BA, 0x79D6, 0x7BDD
.hword 0x7BEB, 0x7752, 0x6ED7, 0x66CA, 0x6379, 0x6692, 0x6D54, 0x756C
.hword 0x7C87, 0x8054, 0x7E7C, 0x78B0, 0x728D, 0x6FB2, 0x3FFF, 0x0000

chain_chomp_seg6_animindex_06025100: # 0x06025100
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0014, 0x002A, 0x0001, 0x0000, 0x0001, 0x0000, 0x0014, 0x0002
.hword 0x0001, 0x0000, 0x0001, 0x0066, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0014, 0x0052, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0014, 0x003E, 0x0001, 0x0000, 0x0001, 0x0000, 0x0014, 0x0016

chain_chomp_seg6_anim_06025160: # 0x06025160
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x14
.hword 0x07
.word chain_chomp_seg6_animvalue_06025030
.word chain_chomp_seg6_animindex_06025100
.word 0

glabel chain_chomp_seg6_anims_06025178 # 0x06025178
.word chain_chomp_seg6_anim_06025160
.word 0
