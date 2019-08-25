ccm_seg7_light_0700B118: # 0x0700B118 - 0x0700B120
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ccm_seg7_light_0700B120: # 0x0700B120 - 0x0700B130
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_vertex_0700B130: # 0x0700B130 - 0x0700B190
vertex    768,  -1535,   5118,    820,    450,  0x2C, 0x76, 0xF8, 0xFF
vertex    805,  -1535,   5320,      0,    990,  0x2C, 0x76, 0xF8, 0xFF
vertex   2566,  -2303,   3621,      0, -11806,  0x2C, 0x76, 0xF8, 0xFF
vertex    768,  -1535,   5118,    820,    450,  0x1D, 0x78, 0xE5, 0xFF
vertex   2566,  -2303,   3621,      0, -11806,  0x1D, 0x78, 0xE5, 0xFF
vertex   2391,  -2303,   3433,   1246, -11830,  0x1D, 0x78, 0xE5, 0xFF

ccm_seg7_dl_0700B190: # 0x0700B190 - 0x0700B1D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_0700B120, 1
gsSPLight ccm_seg7_light_0700B118, 2
gsSPVertex ccm_seg7_vertex_0700B130, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0700B1D8 # 0x0700B1D8 - 0x0700B248
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0700B190
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
