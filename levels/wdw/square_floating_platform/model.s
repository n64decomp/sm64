wdw_seg7_light_07012938: # 0x07012938 - 0x07012940
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00

wdw_seg7_light_07012940: # 0x07012940 - 0x07012950
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_vertex_07012950: # 0x07012950 - 0x07012A50
vertex    256,    -63,    256,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    256,     64,    256,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,     64,    256,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -63,    256,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -63,    256,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     64,    256,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     64,   -255,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    -63,   -255,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    -63,   -255,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    256,     64,   -255,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -63,   -255,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -63,   -255,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     64,    256,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    -63,    256,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     64,   -255,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -255,     64,   -255,    990,    990,  0x00, 0x00, 0x81, 0xFF

wdw_seg7_vertex_07012A50: # 0x07012A50 - 0x07012AD0
vertex    256,    -63,    256,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -63,    256,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -63,   -255,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    256,    -63,   -255,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex    256,     64,   -255,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     64,    256,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    256,     64,    256,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     64,   -255,      0,      0,  0x00, 0x7F, 0x00, 0xFF

wdw_seg7_dl_07012AD0: # 0x07012AD0 - 0x07012B48
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wdw_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wdw_seg7_light_07012940, 1
gsSPLight wdw_seg7_light_07012938, 2
gsSPVertex wdw_seg7_vertex_07012950, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  8, 15,  9, 0x0
gsSPEndDisplayList

wdw_seg7_dl_07012B48: # 0x07012B48 - 0x07012B90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wdw_seg7_vertex_07012A50, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel wdw_seg7_dl_07012B90 # 0x07012B90 - 0x07012C08
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wdw_seg7_dl_07012AD0
gsSPDisplayList wdw_seg7_dl_07012B48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
