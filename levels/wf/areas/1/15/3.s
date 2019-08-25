wf_seg7_vertex_0700AF40: # 0x0700AF40 - 0x0700AF80
vertex   -818,    102,   -460,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1228,    102,   -460,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1228,    102,    -50,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -818,    102,    -50,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

wf_seg7_dl_0700AF80: # 0x0700AF80 - 0x0700AFB8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, grass_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_0700AF40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700AFB8 # 0x0700AFB8 - 0x0700B028
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700AF80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
