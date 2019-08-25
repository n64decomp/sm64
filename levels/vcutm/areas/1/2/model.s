vcutm_seg7_light_07007F90: # 0x07007F90 - 0x07007F98
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

vcutm_seg7_light_07007F98: # 0x07007F98 - 0x07007FA8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

vcutm_seg7_vertex_07007FA8: # 0x07007FA8 - 0x07008068
vertex   4915,      0,  -5099,  -3096,   4054,  0x00, 0x00, 0x81, 0xFF
vertex   4116,    819,  -5099,   5078,  -4120,  0x00, 0x00, 0x81, 0xFF
vertex   4915,    819,  -5099,  -3096,  -4120,  0x00, 0x00, 0x81, 0xFF
vertex   4116,      0,  -5099,   5078,   4054,  0x00, 0x00, 0x81, 0xFF
vertex   4915,    819,  -4320,   5078,  -2076,  0x00, 0x00, 0x7F, 0xFF
vertex   4116,      0,  -4320,  -3096,   6098,  0x00, 0x00, 0x7F, 0xFF
vertex   4915,      0,  -4320,   5078,   6098,  0x00, 0x00, 0x7F, 0xFF
vertex   4116,    819,  -4320,  -3096,  -2076,  0x00, 0x00, 0x7F, 0xFF
vertex   4116,    819,  -4320,   4056,  -4120,  0x81, 0x00, 0x00, 0xFF
vertex   4116,      0,  -5099,  -4118,   4054,  0x81, 0x00, 0x00, 0xFF
vertex   4116,      0,  -4320,   4056,   4054,  0x81, 0x00, 0x00, 0xFF
vertex   4116,    819,  -5099,  -4118,  -4120,  0x81, 0x00, 0x00, 0xFF

vcutm_seg7_dl_07008068: # 0x07008068 - 0x070080D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, vcutm_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight vcutm_seg7_light_07007F98, 1
gsSPLight vcutm_seg7_light_07007F90, 2
gsSPVertex vcutm_seg7_vertex_07007FA8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel vcutm_seg7_dl_070080D0 # 0x070080D0 - 0x07008140
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList vcutm_seg7_dl_07008068
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
