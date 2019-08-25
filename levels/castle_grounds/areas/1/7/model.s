castle_grounds_seg7_vertex_0700BAB8: # 0x0700BAB8 - 0x0700BB38
vertex  -3532,  -1330,  -6069,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4044,  -1330,  -5557,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3532,  -1330,  -5557,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4044,  -1330,  -6069,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3225,   -562,  -2178,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3532,   -562,  -2178,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3225,   -562,  -1871,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3532,   -562,  -1871,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

castle_grounds_seg7_dl_0700BB38: # 0x0700BB38 - 0x0700BB80
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, outside_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex castle_grounds_seg7_vertex_0700BAB8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700BB80 # 0x0700BB80 - 0x0700BBF0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList castle_grounds_seg7_dl_0700BB38
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
