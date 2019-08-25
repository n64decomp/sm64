wf_seg7_light_0700EE30: # 0x0700EE30 - 0x0700EE38
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700EE38: # 0x0700EE38 - 0x0700EE48
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700EE48: # 0x0700EE48 - 0x0700EF48
vertex   -214,    102,   -204,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -214,      0,   -204,      0,    478,  0x81, 0x00, 0x00, 0xFF
vertex   -214,      0,    205,   2012,    478,  0x81, 0x00, 0x00, 0xFF
vertex   -214,    102,    205,   2012,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -214,    102,    205,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    215,      0,    205,   2012,    478,  0x00, 0x00, 0x7F, 0xFF
vertex    215,    102,    205,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -214,      0,    205,      0,    478,  0x00, 0x00, 0x7F, 0xFF
vertex    215,    102,    205,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    215,      0,   -204,   2012,    478,  0x7F, 0x00, 0x00, 0xFF
vertex    215,    102,   -204,   2012,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    215,      0,    205,      0,    478,  0x7F, 0x00, 0x00, 0xFF
vertex    215,    102,   -204,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -214,    102,    205,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    215,    102,    205,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -214,    102,   -204,      0,      0,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700EF48: # 0x0700EF48 - 0x0700EF88
vertex    215,      0,    205,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -214,      0,    205,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -214,      0,   -204,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    215,      0,   -204,    990,      0,  0x00, 0x81, 0x00, 0xFF

wf_seg7_dl_0700EF88: # 0x0700EF88 - 0x0700F018
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700EE38, 1
gsSPLight wf_seg7_light_0700EE30, 2
gsSPVertex wf_seg7_vertex_0700EE48, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex wf_seg7_vertex_0700EF48, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700F018 # 0x0700F018 - 0x0700F088
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700EF88
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
