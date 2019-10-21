# Cannon Base

cannon_base_seg8_light_08004988: # 0x08004988
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

cannon_base_seg8_light_08004990: # 0x08004990
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cannon_base_seg8_light_080049A0: # 0x080049A0
.byte 0x0E, 0x10, 0x4C, 0x00, 0x0E, 0x10, 0x4C, 0x00

cannon_base_seg8_light_080049A8: # 0x080049A8
.byte 0x30, 0x37, 0xFF, 0x00, 0x30, 0x37, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cannon_base_seg8_texture_080049B8: # 0x080049B8
.incbin "actors/cannon_base/cannon_base.rgba16"

cannon_base_seg8_vertex_080051B8: # 0x080051B8
vertex    102,   -101,     51,      0,   1758,  0x7F, 0x00, 0x00, 0xFF
vertex    102,   -101,    -50,    990,   1758,  0x7F, 0x00, 0x00, 0xFF
vertex    102,     51,    -50,    990,    228,  0x7F, 0x00, 0x00, 0xFF
vertex    102,     77,     26,    224,    -28,  0x7F, 0x00, 0x00, 0xFF
vertex    102,     51,     51,      0,    228,  0x7F, 0x00, 0x00, 0xFF
vertex    102,     77,    -25,    734,    -28,  0x7F, 0x00, 0x00, 0xFF
vertex   -101,     51,    -50,      0,    224,  0x81, 0x00, 0x00, 0xFF
vertex   -101,     77,     26,    734,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -101,     77,    -25,    224,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -101,   -101,    -50,      0,   1754,  0x81, 0x00, 0x00, 0xFF
vertex   -101,   -101,     51,    990,   1754,  0x81, 0x00, 0x00, 0xFF
vertex   -101,     51,     51,    990,    224,  0x81, 0x00, 0x00, 0xFF

cannon_base_seg8_vertex_08005278: # 0x08005278
vertex    -60,   -101,     51,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     61,   -101,     51,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     61,   -101,    -50,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    102,   -101,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     61,     51,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    102,     51,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     61,   -101,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     61,     51,    -50,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     61,   -101,    -50,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     61,   -101,     51,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     61,     77,     26,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     61,     77,    -25,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     61,     51,     51,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex    102,     51,    -50,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex     61,     51,    -50,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex     61,     77,    -25,      0,      0,  0x00, 0x58, 0xA5, 0xFF

cannon_base_seg8_vertex_08005378: # 0x08005378
vertex    102,     51,    -50,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex     61,     77,    -25,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex    102,     77,    -25,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex    102,     77,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     61,     77,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     61,     77,     26,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    102,     77,     26,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    102,     77,     26,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex     61,     77,     26,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex     61,     51,     51,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex    102,     51,     51,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex    102,     51,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     61,     51,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     61,   -101,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    102,   -101,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF

cannon_base_seg8_vertex_08005468: # 0x08005468
vertex    -60,   -101,     51,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     61,   -101,    -50,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -60,   -101,    -50,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,     77,    -25,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex    -60,     51,    -50,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex   -101,     51,    -50,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex   -101,     51,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -60,   -101,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -101,   -101,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -60,     51,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -60,   -101,     51,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -60,   -101,    -50,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -60,     51,    -50,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -60,     77,    -25,      0,      0,  0x00, 0x58, 0xA5, 0xFF
vertex    -60,     77,    -25,      0,      0,  0x7F, 0x00, 0x00, 0xFF

cannon_base_seg8_vertex_08005558: # 0x08005558
vertex   -101,   -101,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -60,     51,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,     51,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -60,   -101,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -60,   -101,     51,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -60,     77,    -25,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -60,     77,     26,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -60,     51,     51,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -101,     51,     51,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex    -60,     51,     51,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex    -60,     77,     26,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex   -101,     77,     26,      0,      0,  0x00, 0x58, 0x5B, 0xFF
vertex   -101,     77,     26,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -60,     77,     26,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -60,     77,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,     77,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF

glabel cannon_base_seg8_dl_08005658 # 0x08005658 - 0x080056D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cannon_base_seg8_texture_080049B8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight cannon_base_seg8_light_08004990, 1
gsSPLight cannon_base_seg8_light_08004988, 2
gsSPVertex cannon_base_seg8_vertex_080051B8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  2,  5, 0x0,  0,  5,  3, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9, 10, 0x0
gsSP2Triangles  6, 10, 11, 0x0,  6, 11,  7, 0x0
gsSPEndDisplayList

glabel cannon_base_seg8_dl_080056D0 # 0x080056D0 - 0x080057F8
gsSPLight cannon_base_seg8_light_080049A8, 1
gsSPLight cannon_base_seg8_light_080049A0, 2
gsSPVertex cannon_base_seg8_vertex_08005278, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10, 11, 0x0,  7, 12, 10, 0x0
gsSP2Triangles  7,  9, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex cannon_base_seg8_vertex_08005378, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex cannon_base_seg8_vertex_08005468, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0,  3, 13,  4, 0x0
gsSP1Triangle 10, 12, 14, 0x0
gsSPVertex cannon_base_seg8_vertex_08005558, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

glabel cannon_base_seg8_dl_080057F8 # 0x080057F8 - 0x08005870
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList cannon_base_seg8_dl_08005658
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList cannon_base_seg8_dl_080056D0
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
