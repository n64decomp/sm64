# Heart

heart_seg8_vertex_0800D7A0: # 0x0800D7A0
vertex    -50,    -50,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xB4
vertex     50,    -50,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xB4
vertex     50,     50,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xB4
vertex    -50,     50,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xB4

heart_seg8_texture_0800D7E0: # 0x0800D7E0
.incbin "actors/heart/spinning_heart.rgba16"

glabel heart_seg8_dl_0800DFE0 # 0x0800DFE0 - 0x0800E078
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, heart_seg8_texture_0800D7E0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex heart_seg8_vertex_0800D7A0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
