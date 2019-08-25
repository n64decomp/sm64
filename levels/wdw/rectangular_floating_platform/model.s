wdw_seg7_light_07013BE8: # 0x07013BE8 - 0x07013BF0
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00

wdw_seg7_light_07013BF0: # 0x07013BF0 - 0x07013C00
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_vertex_07013C00: # 0x07013C00 - 0x07013D00
vertex    256,    -63,    640,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    256,     64,    640,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,     64,    640,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -63,    640,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -63,    640,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     64,    640,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     64,   -639,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    -63,   -639,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    -63,   -639,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    256,     64,   -639,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -63,   -639,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -63,   -639,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     64,    640,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    -63,    640,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     64,   -639,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -255,     64,   -639,    990,    990,  0x00, 0x00, 0x81, 0xFF

wdw_seg7_vertex_07013D00: # 0x07013D00 - 0x07013D80
vertex    256,    -63,    640,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -63,    640,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -63,   -639,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    256,    -63,   -639,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex    256,     64,   -639,    990,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     64,    640,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    256,     64,    640,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     64,   -639,      0,  -1054,  0x00, 0x7F, 0x00, 0xFF

wdw_seg7_dl_07013D80: # 0x07013D80 - 0x07013DF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wdw_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wdw_seg7_light_07013BF0, 1
gsSPLight wdw_seg7_light_07013BE8, 2
gsSPVertex wdw_seg7_vertex_07013C00, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  8, 15,  9, 0x0
gsSPEndDisplayList

wdw_seg7_dl_07013DF8: # 0x07013DF8 - 0x07013E40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wdw_seg7_vertex_07013D00, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel wdw_seg7_dl_07013E40 # 0x07013E40 - 0x07013EB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wdw_seg7_dl_07013D80
gsSPDisplayList wdw_seg7_dl_07013DF8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
