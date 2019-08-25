inside_castle_seg7_light_0705E310: # 0x0705E310 - 0x0705E318
.byte 0x00, 0x5F, 0x5F, 0x00, 0x00, 0x5F, 0x5F, 0x00

inside_castle_seg7_light_0705E318: # 0x0705E318 - 0x0705E328
.byte 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_0705E328: # 0x0705E328 - 0x0705E3E8
vertex   -101,   -429,   1075,    990,   -102,  0x00, 0x00, 0x81, 0x60
vertex   -562,   -858,   1075,      0,    990,  0x00, 0x00, 0x81, 0x60
vertex   -562,   -429,   1075,      0,   -102,  0x00, 0x00, 0x81, 0x60
vertex   -101,   -858,   1075,    990,    990,  0x00, 0x00, 0x81, 0x60
vertex   -562,   -858,   1075,      0,    990,  0x00, 0x81, 0x00, 0x60
vertex   -101,   -858,   1075,    990,    990,  0x00, 0x81, 0x00, 0x60
vertex   -101,   -858,   1178,    990,    990,  0x00, 0x81, 0x00, 0x60
vertex   -562,   -858,   1178,      0,    990,  0x00, 0x81, 0x00, 0x60
vertex   -562,   -460,   1178,      0,      0,  0x00, 0x00, 0x7F, 0x60
vertex   -101,   -858,   1178,    990,    990,  0x00, 0x00, 0x7F, 0x60
vertex   -101,   -460,   1178,    990,      0,  0x00, 0x00, 0x7F, 0x60
vertex   -562,   -858,   1178,      0,    990,  0x00, 0x00, 0x7F, 0x60

inside_castle_seg7_dl_0705E3E8: # 0x0705E3E8 - 0x0705E450
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, texture_castle_light
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_0705E318, 1
gsSPLight inside_castle_seg7_light_0705E310, 2
gsSPVertex inside_castle_seg7_vertex_0705E328, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_0705E450 # 0x0705E450 - 0x0705E4C0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_0705E3E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
