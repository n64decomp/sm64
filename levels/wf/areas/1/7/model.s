wf_seg7_light_07006668: # 0x07006668 - 0x07006670
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_07006670: # 0x07006670 - 0x07006680
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_07006680: # 0x07006680 - 0x070066C0
vertex    256,   1075,   -255,  -9228,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,   1075,   -255,  -9228,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,   1075,    256, -11272,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex    256,   1075,    256, -11272,    990,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_070066C0: # 0x070066C0 - 0x07006780
vertex    256,   1075,    256,   3034,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,      0,   -255,   5078,   4258,  0x7F, 0x00, 0x00, 0xFF
vertex    256,   1075,   -255,   5078,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,      0,    256,   3034,   4258,  0x7F, 0x00, 0x00, 0xFF
vertex   -255,   1075,    256,  -1052,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    256,      0,    256,    990,   4258,  0x00, 0x00, 0x7F, 0xFF
vertex    256,   1075,    256,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,    256,  -1052,   4258,  0x00, 0x00, 0x7F, 0xFF
vertex    256,   1075,   -255,  -1052,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -255,      0,   -255,    990,   4258,  0x00, 0x00, 0x81, 0xFF
vertex   -255,   1075,   -255,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,      0,   -255,  -1052,   4258,  0x00, 0x00, 0x81, 0xFF

wf_seg7_dl_07006780: # 0x07006780 - 0x070067C8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_07006670, 1
gsSPLight wf_seg7_light_07006668, 2
gsSPVertex wf_seg7_vertex_07006680, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

wf_seg7_dl_070067C8: # 0x070067C8 - 0x07006820
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_070066C0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_07006820 # 0x07006820 - 0x07006898
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_07006780
gsSPDisplayList wf_seg7_dl_070067C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
