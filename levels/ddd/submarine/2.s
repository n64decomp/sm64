ddd_seg7_light_0700AF78: # 0x0700AF78 - 0x0700AF80
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

ddd_seg7_light_0700AF80: # 0x0700AF80 - 0x0700AF90
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ddd_seg7_vertex_0700AF90: # 0x0700AF90 - 0x0700B010
vertex   3804,    776,     61,    990,   2012,  0x81, 0x00, 0x00, 0xFF
vertex   3804,   1134,   -296,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   3804,    776,   -296,      0,   2012,  0x81, 0x00, 0x00, 0xFF
vertex   3804,   1134,     61,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   4029,    776,   -296,      0,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex   4029,   1134,     61,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   4029,    776,     61,    990,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex   4029,   1134,   -296,      0,      0,  0x7F, 0x00, 0x00, 0xFF

ddd_seg7_dl_0700B010: # 0x0700B010 - 0x0700B068
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ddd_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight ddd_seg7_light_0700AF80, 1
gsSPLight ddd_seg7_light_0700AF78, 2
gsSPVertex ddd_seg7_vertex_0700AF90, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_0700B068 # 0x0700B068 - 0x0700B0D8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList ddd_seg7_dl_0700B010
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
