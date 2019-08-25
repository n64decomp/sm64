wdw_seg7_light_07012F18: # 0x07012F18 - 0x07012F20
.byte 0x99, 0x99, 0x00, 0x00, 0x99, 0x99, 0x00, 0x00

wdw_seg7_light_07012F20: # 0x07012F20 - 0x07012F30
.byte 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_light_07012F30: # 0x07012F30 - 0x07012F38
.byte 0x00, 0x00, 0x99, 0x00, 0x00, 0x00, 0x99, 0x00

wdw_seg7_light_07012F38: # 0x07012F38 - 0x07012F48
.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_light_07012F48: # 0x07012F48 - 0x07012F50
.byte 0x00, 0x99, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00

wdw_seg7_light_07012F50: # 0x07012F50 - 0x07012F60
.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_light_07012F60: # 0x07012F60 - 0x07012F68
.byte 0x99, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00

wdw_seg7_light_07012F68: # 0x07012F68 - 0x07012F78
.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_vertex_07012F78: # 0x07012F78 - 0x07012FD8
vertex    -50,     51,    -50,    990,      0,  0xA6, 0x58, 0x00, 0xFF
vertex    -50,     51,     51,      0,      0,  0xA6, 0x58, 0x00, 0xFF
vertex      0,    102,      0,    480,    932,  0xA6, 0x58, 0x00, 0xFF
vertex     51,     51,    -50,    990,      0,  0x59, 0xA7, 0x00, 0xFF
vertex     51,     51,     51,      0,      0,  0x59, 0xA7, 0x00, 0xFF
vertex      0,      0,      0,    480,    932,  0x59, 0xA7, 0x00, 0xFF

wdw_seg7_vertex_07012FD8: # 0x07012FD8 - 0x07013038
vertex     51,     51,     51,    990,      0,  0x59, 0x59, 0x00, 0xFF
vertex     51,     51,    -50,      0,      0,  0x59, 0x59, 0x00, 0xFF
vertex      0,    102,      0,    478,    932,  0x59, 0x59, 0x00, 0xFF
vertex    -50,     51,     51,    990,      0,  0xA6, 0xA8, 0x00, 0xFF
vertex    -50,     51,    -50,      0,      0,  0xA6, 0xA8, 0x00, 0xFF
vertex      0,      0,      0,    478,    932,  0xA6, 0xA8, 0x00, 0xFF

wdw_seg7_vertex_07013038: # 0x07013038 - 0x07013098
vertex    -50,     51,     51,    990,      0,  0x00, 0x59, 0x59, 0xFF
vertex     51,     51,     51,      0,      0,  0x00, 0x59, 0x59, 0xFF
vertex      0,    102,      0,    480,    932,  0x00, 0x59, 0x59, 0xFF
vertex    -50,     51,    -50,    990,      0,  0x00, 0xA8, 0xA6, 0xFF
vertex     51,     51,    -50,      0,      0,  0x00, 0xA8, 0xA6, 0xFF
vertex      0,      0,      0,    480,    932,  0x00, 0xA8, 0xA6, 0xFF

wdw_seg7_vertex_07013098: # 0x07013098 - 0x070130F8
vertex     51,     51,     51,    990,      0,  0x00, 0xA7, 0x59, 0xFF
vertex    -50,     51,     51,      0,      0,  0x00, 0xA7, 0x59, 0xFF
vertex      0,      0,      0,    478,    932,  0x00, 0xA7, 0x59, 0xFF
vertex     51,     51,    -50,    990,      0,  0x00, 0x58, 0xA6, 0xFF
vertex    -50,     51,    -50,      0,      0,  0x00, 0x58, 0xA6, 0xFF
vertex      0,    102,      0,    478,    932,  0x00, 0x58, 0xA6, 0xFF

wdw_seg7_dl_070130F8: # 0x070130F8 - 0x070131B8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wdw_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wdw_seg7_light_07012F20, 1
gsSPLight wdw_seg7_light_07012F18, 2
gsSPVertex wdw_seg7_vertex_07012F78, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight wdw_seg7_light_07012F38, 1
gsSPLight wdw_seg7_light_07012F30, 2
gsSPVertex wdw_seg7_vertex_07012FD8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight wdw_seg7_light_07012F50, 1
gsSPLight wdw_seg7_light_07012F48, 2
gsSPVertex wdw_seg7_vertex_07013038, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight wdw_seg7_light_07012F68, 1
gsSPLight wdw_seg7_light_07012F60, 2
gsSPVertex wdw_seg7_vertex_07013098, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel wdw_seg7_dl_070131B8 # 0x070131B8 - 0x07013238
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 200
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wdw_seg7_dl_070130F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
