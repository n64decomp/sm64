# Leaves

leaves_seg3_vertex_0301CBA0: # 0x0301CBA0
vertex    -10,    -10,      0,      0,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex     10,    -10,      0,    480,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex     10,     10,      0,    480,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -10,     10,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

leaves_seg3_texture_0301CBE0: # 0x0301CBE0
.incbin "actors/leaves/leaf.rgba16"

glabel leaves_seg3_dl_0301CDE0 # 0x0301CDE0 - 0x0301CE70
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, leaves_seg3_texture_0301CBE0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPVertex leaves_seg3_vertex_0301CBA0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
