bbh_seg7_light_070079B0: # 0x070079B0 - 0x070079B8
.byte 0x3F, 0x51, 0x66, 0x00, 0x3F, 0x51, 0x66, 0x00

bbh_seg7_light_070079B8: # 0x070079B8 - 0x070079C8
.byte 0x9E, 0xCC, 0xFF, 0x00, 0x9E, 0xCC, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_light_070079C8: # 0x070079C8 - 0x070079D0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_070079D0: # 0x070079D0 - 0x070079E0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_070079E0: # 0x070079E0 - 0x07007AA0
vertex   1331,    512,   2038,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex   1741,    512,   2038,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   1741,    102,   2038,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   1331,    102,   2038,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -409,   1536,   2038,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,   1536,   2038,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,   1126,   2038,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -409,   1126,   2038,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   1331,   1536,   2038,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex   1741,   1536,   2038,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   1741,   1126,   2038,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   1331,   1126,   2038,    990,    990,  0x00, 0x00, 0x81, 0xFF

bbh_seg7_vertex_07007AA0: # 0x07007AA0 - 0x07007AE0
vertex    512,   1075,   2038,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    922,    666,   2038,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    512,    666,   2038,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    922,   1075,   2038,      0,      0,  0x00, 0x00, 0x81, 0xFF

bbh_seg7_dl_07007AE0: # 0x07007AE0 - 0x07007B48
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_070079B8, 1
gsSPLight bbh_seg7_light_070079B0, 2
gsSPVertex bbh_seg7_vertex_070079E0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

bbh_seg7_dl_07007B48: # 0x07007B48 - 0x07007B90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_070079D0, 1
gsSPLight bbh_seg7_light_070079C8, 2
gsSPVertex bbh_seg7_vertex_07007AA0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07007B90 # 0x07007B90 - 0x07007C08
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_07007AE0
gsSPDisplayList bbh_seg7_dl_07007B48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
