ddd_seg7_light_07009080: # 0x07009080 - 0x07009088
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

ddd_seg7_light_07009088: # 0x07009088 - 0x07009098
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ddd_seg7_vertex_07009098: # 0x07009098 - 0x070090D8
vertex   4941,  -1015,  -4197,   4056,  -3098,  0x00, 0x00, 0x7F, 0xFF
vertex   2893,  -1015,  -4197,      0,  -3098,  0x00, 0x00, 0x7F, 0xFF
vertex   2893,  -3063,  -4197,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   4941,  -3063,  -4197,   4056,    990,  0x00, 0x00, 0x7F, 0xFF

ddd_seg7_dl_070090D8: # 0x070090D8 - 0x07009120
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ddd_seg7_texture_07001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ddd_seg7_light_07009088, 1
gsSPLight ddd_seg7_light_07009080, 2
gsSPVertex ddd_seg7_vertex_07009098, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_07009120 # 0x07009120 - 0x07009190
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ddd_seg7_dl_070090D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
