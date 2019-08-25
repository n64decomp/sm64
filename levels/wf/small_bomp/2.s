wf_seg7_light_0700D780: # 0x0700D780 - 0x0700D788
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700D788: # 0x0700D788 - 0x0700D798
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700D798: # 0x0700D798 - 0x0700D898
vertex   -252,    261,     75,      0,  -3138,  0x0C, 0x7E, 0x00, 0xFF
vertex    259,    210,    -96,   1194,      0,  0x0C, 0x7E, 0x00, 0xFF
vertex   -252,    261,    -77,   1194,  -3138,  0x0C, 0x7E, 0x00, 0xFF
vertex    259,    210,     95,      0,      0,  0x0C, 0x7E, 0x00, 0xFF
vertex   -252,    210,   -128,   2522,    -34,  0x00, 0x00, 0x81, 0xFF
vertex    259,      5,   -128,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -252,      5,   -128,   2520,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -252,    210,   -128,   2522,    -34,  0x07, 0x13, 0x83, 0xFF
vertex    259,    210,    -96,    468,    -34,  0x07, 0x13, 0x83, 0xFF
vertex    259,      5,   -128,      0,    990,  0x07, 0x13, 0x83, 0xFF
vertex   -252,    261,    -77,   4056,    412,  0x05, 0x59, 0xA7, 0xFF
vertex    259,    210,    -96,    478,    990,  0x05, 0x59, 0xA7, 0xFF
vertex   -252,    210,   -128,   4056,    990,  0x05, 0x59, 0xA7, 0xFF
vertex   -252,    210,    127,  -3096,    990,  0x05, 0x5A, 0x58, 0xFF
vertex    259,    210,     95,    480,    990,  0x05, 0x5A, 0x58, 0xFF
vertex   -252,    261,     75,  -3096,    412,  0x05, 0x5A, 0x58, 0xFF

wf_seg7_vertex_0700D898: # 0x0700D898 - 0x0700D8F8
vertex   -252,      5,    127,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    259,      5,    127,   2012,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -252,    210,    127,      0,    182,  0x00, 0x00, 0x7F, 0xFF
vertex    259,      5,    127,   2012,    990,  0x07, 0x13, 0x7D, 0xFF
vertex    259,    210,     95,   2012,    162,  0x07, 0x13, 0x7D, 0xFF
vertex   -252,    210,    127,      0,    182,  0x07, 0x13, 0x7D, 0xFF

wf_seg7_vertex_0700D8F8: # 0x0700D8F8 - 0x0700D938
vertex    259,      5,   -128,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    259,    210,     95,     96,    172,  0x7F, 0x00, 0x00, 0xFF
vertex    259,      5,    127,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    259,    210,    -96,    862,    172,  0x7F, 0x00, 0x00, 0xFF

wf_seg7_dl_0700D938: # 0x0700D938 - 0x0700D9B8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700D788, 1
gsSPLight wf_seg7_light_0700D780, 2
gsSPVertex wf_seg7_vertex_0700D798, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex wf_seg7_vertex_0700D898, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

wf_seg7_dl_0700D9B8: # 0x0700D9B8 - 0x0700D9F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wf_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_0700D8F8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700D9F0 # 0x0700D9F0 - 0x0700DA68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700D938
gsSPDisplayList wf_seg7_dl_0700D9B8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
