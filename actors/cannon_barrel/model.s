# Cannon Barrel

cannon_barrel_seg8_light_08005878: # 0x08005878
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

cannon_barrel_seg8_light_08005880: # 0x08005880
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cannon_barrel_seg8_light_08005890: # 0x08005890
.byte 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0F, 0x00

cannon_barrel_seg8_light_08005898: # 0x08005898
.byte 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x32, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cannon_barrel_seg8_texture_080058A8: # 0x080058A8
.incbin "actors/cannon_barrel/cannon_barrel.rgba16"

cannon_barrel_seg8_vertex_080060A8: # 0x080060A8
vertex    -40,    236,     41,    176,    748,  0x45, 0x5D, 0xCD, 0xFF
vertex    -56,    236,      0,     64,    480,  0x66, 0x49, 0x0D, 0xFF
vertex    -81,    236,      0,    -98,    480,  0xB8, 0x68, 0x09, 0xFF
vertex    -57,    236,     58,     60,    864,  0xCC, 0x5C, 0x44, 0xFF
vertex    -40,    236,    -40,    176,    210,  0x2B, 0x68, 0x3A, 0xFF
vertex    -57,    236,    -57,     60,     94,  0xAE, 0x49, 0xC2, 0xFF
vertex      0,    236,    -81,    444,    -66,  0xF4, 0x5C, 0xAB, 0xFF
vertex      0,    236,    -56,    444,     98,  0xF6, 0x5C, 0x56, 0xFF
vertex     41,    236,    -40,    714,    210,  0xBC, 0x5D, 0x33, 0xFF
vertex     58,    236,    -57,    830,     94,  0x34, 0x5C, 0xBB, 0xFF
vertex     57,    236,      0,    826,    480,  0xAA, 0x5C, 0xF6, 0xFF
vertex     82,    236,      0,    990,    480,  0x55, 0x5C, 0xF4, 0xFF
vertex     58,    236,     58,    830,    864,  0x3A, 0x68, 0x2B, 0xFF
vertex     41,    236,     41,    714,    748,  0xC3, 0x4A, 0xAE, 0xFF
vertex      0,    236,     57,    444,    860,  0x09, 0x67, 0xB8, 0xFF
vertex      0,    236,     82,    444,   1022,  0x0D, 0x49, 0x66, 0xFF

cannon_barrel_seg8_vertex_080061A8: # 0x080061A8
vertex     41,    236,     41,      0,      0,  0xC3, 0x4A, 0xAE, 0xFF
vertex     41,    -19,     41,      0,      0,  0xAE, 0x4A, 0xC3, 0xFF
vertex      0,    -19,     57,      0,      0,  0xF3, 0x49, 0x9A, 0xFF
vertex    -40,    236,    -40,      0,      0,  0x2B, 0x68, 0x3A, 0xFF
vertex    -40,    -19,    -40,      0,      0,  0x2A, 0x73, 0x20, 0xFF
vertex      0,    -19,    -56,      0,      0,  0x10, 0x2A, 0x76, 0xFF
vertex    -56,    236,      0,      0,      0,  0x66, 0x49, 0x0D, 0xFF
vertex    -56,    -19,      0,      0,      0,  0x76, 0x2A, 0xF1, 0xFF
vertex     41,    -19,    -40,      0,      0,  0xC3, 0x4A, 0x52, 0xFF
vertex    -40,    -19,     41,      0,      0,  0x3E, 0x4A, 0xAE, 0xFF
vertex     57,    -19,      0,      0,      0,  0x9A, 0x49, 0x0D, 0xFF
vertex    -40,    236,     41,      0,      0,  0x45, 0x5D, 0xCD, 0xFF
vertex      0,    236,     57,      0,      0,  0x09, 0x67, 0xB8, 0xFF
vertex     57,    236,      0,      0,      0,  0xAA, 0x5C, 0xF6, 0xFF
vertex     41,    236,    -40,      0,      0,  0xBC, 0x5D, 0x33, 0xFF
vertex      0,    236,    -56,      0,      0,  0xF6, 0x5C, 0x56, 0xFF

cannon_barrel_seg8_vertex_080062A8: # 0x080062A8
vertex     82,    -19,      0,      0,      0,  0x74, 0xCE, 0x0B, 0xFF
vertex     58,    -19,     58,      0,      0,  0x49, 0xCE, 0x5A, 0xFF
vertex      0,    -71,      0,      0,      0,  0x00, 0x82, 0x00, 0xFF
vertex      0,    -19,     82,      0,      0,  0xF4, 0xCE, 0x74, 0xFF
vertex     58,    236,     58,      0,      0,  0x3A, 0x68, 0x2B, 0xFF
vertex      0,    236,     82,      0,      0,  0x0D, 0x49, 0x66, 0xFF
vertex     82,    236,      0,      0,      0,  0x55, 0x5C, 0xF4, 0xFF
vertex    -57,    236,     58,      0,      0,  0xCC, 0x5C, 0x44, 0xFF
vertex    -57,    -19,     58,      0,      0,  0xA6, 0xCF, 0x49, 0xFF
vertex     58,    -19,    -57,      0,      0,  0x5A, 0xCF, 0xB6, 0xFF
vertex     58,    236,    -57,      0,      0,  0x34, 0x5C, 0xBB, 0xFF
vertex      0,    -19,    -81,      0,      0,  0x0B, 0xCF, 0x8C, 0xFF
vertex      0,    236,    -81,      0,      0,  0xF4, 0x5C, 0xAB, 0xFF
vertex    -57,    -19,    -57,      0,      0,  0xB6, 0xCF, 0xA6, 0xFF
vertex    -81,    236,      0,      0,      0,  0xB8, 0x68, 0x09, 0xFF
vertex    -57,    236,    -57,      0,      0,  0xAE, 0x49, 0xC2, 0xFF

cannon_barrel_seg8_vertex_080063A8: # 0x080063A8
vertex    -81,    -19,      0,      0,      0,  0x8C, 0xCF, 0xF4, 0xFF
vertex    -57,    -19,    -57,      0,      0,  0xB6, 0xCF, 0xA6, 0xFF
vertex      0,    -71,      0,      0,      0,  0x00, 0x82, 0x00, 0xFF
vertex    -57,    236,    -57,      0,      0,  0xAE, 0x49, 0xC2, 0xFF
vertex    -81,    236,      0,      0,      0,  0xB8, 0x68, 0x09, 0xFF
vertex    -57,    -19,     58,      0,      0,  0xA6, 0xCF, 0x49, 0xFF

glabel cannon_barrel_seg8_dl_08006408 # 0x08006408 - 0x080064C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cannon_barrel_seg8_texture_080058A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight cannon_barrel_seg8_light_08005880, 1
gsSPLight cannon_barrel_seg8_light_08005878, 2
gsSPVertex cannon_barrel_seg8_vertex_080060A8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  4,  5, 0x0,  2,  1,  4, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  4,  7,  6, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  7,  9,  6, 0x0
gsSP2Triangles  8, 10, 11, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 10, 12, 11, 0x0, 10, 13, 12, 0x0
gsSP2Triangles 14, 15, 12, 0x0, 14,  3, 15, 0x0
gsSP2Triangles 14,  0,  3, 0x0, 14, 12, 13, 0x0
gsSPEndDisplayList

glabel cannon_barrel_seg8_dl_080064C0 # 0x080064C0 - 0x08006660
gsSPLight cannon_barrel_seg8_light_08005898, 1
gsSPLight cannon_barrel_seg8_light_08005890, 2
gsSPVertex cannon_barrel_seg8_vertex_080061A8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  4, 0x0,  6,  4,  3, 0x0
gsSP2Triangles  4,  8,  5, 0x0,  4,  7,  9, 0x0
gsSP2Triangles  4,  9,  2, 0x0,  4,  2,  1, 0x0
gsSP2Triangles  4,  1, 10, 0x0,  4, 10,  8, 0x0
gsSP2Triangles 11,  9,  7, 0x0, 11,  7,  6, 0x0
gsSP2Triangles 12,  2,  9, 0x0, 12,  9, 11, 0x0
gsSP2Triangles  0,  2, 12, 0x0, 13, 10,  1, 0x0
gsSP2Triangles 13,  1,  0, 0x0, 14,  8, 10, 0x0
gsSP2Triangles 14, 10, 13, 0x0, 15,  8, 14, 0x0
gsSP2Triangles 15,  5,  8, 0x0,  3,  5, 15, 0x0
gsSPVertex cannon_barrel_seg8_vertex_080062A8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  1,  4,  5, 0x0,  1,  5,  3, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  6,  4, 0x0
gsSP2Triangles  3,  5,  7, 0x0,  3,  8,  2, 0x0
gsSP2Triangles  3,  7,  8, 0x0,  9,  0,  2, 0x0
gsSP2Triangles  9,  6,  0, 0x0,  9, 10,  6, 0x0
gsSP2Triangles 11,  9,  2, 0x0, 11, 10,  9, 0x0
gsSP2Triangles 11, 12, 10, 0x0, 13, 11,  2, 0x0
gsSP2Triangles 13, 12, 11, 0x0,  8,  7, 14, 0x0
gsSP1Triangle 13, 15, 12, 0x0
gsSPVertex cannon_barrel_seg8_vertex_080063A8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  5,  0,  2, 0x0
gsSP1Triangle  5,  4,  0, 0x0
gsSPEndDisplayList

glabel cannon_barrel_seg8_dl_08006660 # 0x08006660 - 0x080066C8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList cannon_barrel_seg8_dl_08006408
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList cannon_barrel_seg8_dl_080064C0
gsSPEndDisplayList
