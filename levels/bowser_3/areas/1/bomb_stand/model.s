bowser_3_seg7_light_07004740: # 0x07004740 - 0x07004748
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07004748: # 0x07004748 - 0x07004758
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_07004758: # 0x07004758 - 0x07004848
vertex    205,    256,      0,    478,    478,  0x4D, 0x3E, 0xB2, 0xFF
vertex      0,    256,   -204,    734,    478,  0x4D, 0x3E, 0xB2, 0xFF
vertex      0,    512,      0,    606,      0,  0x4D, 0x3E, 0xB2, 0xFF
vertex      0,    256,    205,    224,    480,  0x4E, 0x3E, 0x4E, 0xFF
vertex    205,    256,      0,    478,    478,  0x4E, 0x3E, 0x4E, 0xFF
vertex      0,    512,      0,    352,      0,  0x4E, 0x3E, 0x4E, 0xFF
vertex    205,    256,      0,    478,    478,  0x4E, 0xC2, 0x4E, 0xFF
vertex      0,    256,    205,    224,    480,  0x4E, 0xC2, 0x4E, 0xFF
vertex      0,      0,      0,    352,    990,  0x4E, 0xC2, 0x4E, 0xFF
vertex      0,    256,   -204,    734,    478,  0x4D, 0xC2, 0xB2, 0xFF
vertex    205,    256,      0,    478,    478,  0x4D, 0xC2, 0xB2, 0xFF
vertex      0,      0,      0,    606,    990,  0x4D, 0xC2, 0xB2, 0xFF
vertex   -204,    256,      0,      0,    480,  0xB2, 0x3E, 0x4D, 0xFF
vertex      0,    256,    205,    224,    480,  0xB2, 0x3E, 0x4D, 0xFF
vertex      0,    512,      0,     96,      0,  0xB2, 0x3E, 0x4D, 0xFF

bowser_3_seg7_vertex_07004848: # 0x07004848 - 0x070048D8
vertex      0,    256,    205,    224,    480,  0xB2, 0xC2, 0x4D, 0xFF
vertex   -204,    256,      0,      0,    480,  0xB2, 0xC2, 0x4D, 0xFF
vertex      0,      0,      0,     96,    990,  0xB2, 0xC2, 0x4D, 0xFF
vertex      0,    256,   -204,    734,    478,  0xB2, 0x3E, 0xB2, 0xFF
vertex   -204,    256,      0,    990,    480,  0xB2, 0x3E, 0xB2, 0xFF
vertex      0,    512,      0,    862,      0,  0xB2, 0x3E, 0xB2, 0xFF
vertex   -204,    256,      0,    990,    480,  0xB2, 0xC2, 0xB2, 0xFF
vertex      0,    256,   -204,    734,    478,  0xB2, 0xC2, 0xB2, 0xFF
vertex      0,      0,      0,    862,    990,  0xB2, 0xC2, 0xB2, 0xFF

bowser_3_seg7_dl_070048D8: # 0x070048D8 - 0x07004958
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07004748, 1
gsSPLight bowser_3_seg7_light_07004740, 2
gsSPVertex bowser_3_seg7_vertex_07004758, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex bowser_3_seg7_vertex_07004848, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  6,  7,  8, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_07004958 # 0x07004958 - 0x070049C8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_070048D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
