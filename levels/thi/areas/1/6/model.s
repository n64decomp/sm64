thi_seg7_light_070075A8: # 0x070075A8 - 0x070075B0
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

thi_seg7_light_070075B0: # 0x070075B0 - 0x070075C0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

thi_seg7_vertex_070075C0: # 0x070075C0 - 0x07007600
vertex   -101,      0,   -101,    406,    406,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,    102,    406,    552,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,   -101,    552,    406,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,    102,    552,    552,  0x00, 0x7F, 0x00, 0xFF

thi_seg7_dl_07007600: # 0x07007600 - 0x07007648
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, thi_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight thi_seg7_light_070075B0, 1
gsSPLight thi_seg7_light_070075A8, 2
gsSPVertex thi_seg7_vertex_070075C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPEndDisplayList

glabel thi_seg7_dl_07007648 # 0x07007648 - 0x070076A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_07007600
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
