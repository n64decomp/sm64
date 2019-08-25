wf_seg7_light_0700F758: # 0x0700F758 - 0x0700F760
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700F760: # 0x0700F760 - 0x0700F770
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700F770: # 0x0700F770 - 0x0700F7B0
vertex      0,      0,   -107,    186,    990,  0x81, 0x00, 0x00, 0xFF
vertex      0,      0,    108,    722,    990,  0x81, 0x00, 0x00, 0xFF
vertex      0,    205,    108,    722,      0,  0x81, 0x00, 0x00, 0xFF
vertex      0,    205,   -107,    186,      0,  0x81, 0x00, 0x00, 0xFF

wf_seg7_dl_0700F7B0: # 0x0700F7B0 - 0x0700F7F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700F760, 1
gsSPLight wf_seg7_light_0700F758, 2
gsSPVertex wf_seg7_vertex_0700F770, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700F7F8 # 0x0700F7F8 - 0x0700F868
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700F7B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
