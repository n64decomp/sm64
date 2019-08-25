wf_seg7_light_0700F3B8: # 0x0700F3B8 - 0x0700F3C0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700F3C0: # 0x0700F3C0 - 0x0700F3D0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700F3D0: # 0x0700F3D0 - 0x0700F4C0
vertex    -96,      0,      0,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -96,   1178,     77,      0,    -54,  0x81, 0x00, 0x00, 0xFF
vertex    -96,   1178,      0,    990,    -54,  0x81, 0x00, 0x00, 0xFF
vertex    -96,   1178,      0,      0,    -54,  0x00, 0x00, 0x81, 0xFF
vertex     95,   1178,      0,    990,    -54,  0x00, 0x00, 0x81, 0xFF
vertex     95,      0,      0,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    -96,      0,      0,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex     95,   1178,      0,    990,    -54,  0x7F, 0x00, 0x00, 0xFF
vertex     95,   1178,     77,      0,    -54,  0x7F, 0x00, 0x00, 0xFF
vertex     95,      0,     77,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     95,      0,      0,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     95,   1178,     77,    990,    -54,  0x00, 0x00, 0x7F, 0xFF
vertex    -96,   1178,     77,      0,    -54,  0x00, 0x00, 0x7F, 0xFF
vertex    -96,      0,     77,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     95,      0,     77,    990,    990,  0x00, 0x00, 0x7F, 0xFF

wf_seg7_vertex_0700F4C0: # 0x0700F4C0 - 0x0700F570
vertex     95,      0,      0,   -152,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -96,      0,     77,   1122,    990,  0x00, 0x81, 0x00, 0xFF
vertex    -96,      0,      0,   1122,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -96,      0,      0,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -96,      0,     77,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -96,   1178,     77,      0,    -54,  0x81, 0x00, 0x00, 0xFF
vertex    -96,   1178,      0,   1122,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -96,   1178,     77,   1122,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     95,   1178,     77,   -152,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     95,   1178,      0,   -152,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     95,      0,     77,   -152,    990,  0x00, 0x81, 0x00, 0xFF

wf_seg7_dl_0700F570: # 0x0700F570 - 0x0700F610
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700F3C0, 1
gsSPLight wf_seg7_light_0700F3B8, 2
gsSPVertex wf_seg7_vertex_0700F3D0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex wf_seg7_vertex_0700F4C0, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle  0, 10,  1, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700F610 # 0x0700F610 - 0x0700F680
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700F570
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
