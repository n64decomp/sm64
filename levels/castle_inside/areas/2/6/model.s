inside_castle_seg7_light_0704A1B8: # 0x0704A1B8 - 0x0704A1C0
.byte 0x3D, 0x3D, 0x3F, 0x00, 0x3D, 0x3D, 0x3F, 0x00

inside_castle_seg7_light_0704A1C0: # 0x0704A1C0 - 0x0704A1D0
.byte 0xF5, 0xF5, 0xFF, 0x00, 0xF5, 0xF5, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_0704A1D0: # 0x0704A1D0 - 0x0704A290
vertex   4332,   1408,   3415,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   2125,   2647,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   1408,   2647,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   2125,   3415,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   1408,   1008,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   2125,    240,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   1408,    240,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   2125,   1008,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   1408,   2493,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   2125,   1162,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   1408,   1162,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4332,   2125,   2493,      0,      0,  0x81, 0x00, 0x00, 0xFF

inside_castle_seg7_dl_0704A290: # 0x0704A290 - 0x0704A2E0
gsSPLight inside_castle_seg7_light_0704A1C0, 1
gsSPLight inside_castle_seg7_light_0704A1B8, 2
gsSPVertex inside_castle_seg7_vertex_0704A1D0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_0704A2E0 # 0x0704A2E0 - 0x0704A368
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPLoadTextureBlock inside_castle_seg7_texture_0700A000, G_IM_FMT_IA, G_IM_SIZ_16b, 32, 32, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_WRAP | G_TX_NOMIRROR, 5, 5, G_TX_NOLOD, G_TX_NOLOD
gsSPTexture 1984, 1984, 0, 0, 1
gsSPDisplayList inside_castle_seg7_dl_0704A290
gsSPTexture 1984, 1984, 0, 0, 0
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
