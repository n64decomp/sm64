wf_seg7_light_0700F220: # 0x0700F220 - 0x0700F228
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700F228: # 0x0700F228 - 0x0700F238
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700F238: # 0x0700F238 - 0x0700F268
vertex      0,    384,   -378,  10188,   8162,  0x00, 0x7F, 0x00, 0xFF
vertex   -168,    384,   -378,   9514,   8162,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    384,    128,  10188,  10186,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700F268: # 0x0700F268 - 0x0700F2C8
vertex      0,   -383,    128,   1080,   3032,  0x88, 0x00, 0x28, 0xFF
vertex      0,    384,    128,   1080,      0,  0x88, 0x00, 0x28, 0xFF
vertex   -168,    384,   -378,  -1052,      0,  0x88, 0x00, 0x28, 0xFF
vertex      0,    384,   -378,   1992,      0,  0x7F, 0x00, 0x00, 0xFF
vertex      0,    384,    128,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex      0,   -383,    128,      0,   3032,  0x7F, 0x00, 0x00, 0xFF

wf_seg7_dl_0700F2C8: # 0x0700F2C8 - 0x0700F308
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700F228, 1
gsSPLight wf_seg7_light_0700F220, 2
gsSPVertex wf_seg7_vertex_0700F238, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

wf_seg7_dl_0700F308: # 0x0700F308 - 0x0700F340
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_0700F268, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700F340 # 0x0700F340 - 0x0700F3B8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700F2C8
gsSPDisplayList wf_seg7_dl_0700F308
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
