wf_seg7_light_0700D370: # 0x0700D370 - 0x0700D378
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700D378: # 0x0700D378 - 0x0700D388
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700D388: # 0x0700D388 - 0x0700D488
vertex   -252,    261,     75,      0,  -3138,  0x00, 0x7F, 0x00, 0xFF
vertex    136,    261,    -77,   1194,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -252,    261,    -77,   1194,  -3138,  0x00, 0x7F, 0x00, 0xFF
vertex    136,    261,    -77,    582,    -72,  0x30, 0x75, 0x00, 0xFF
vertex    136,    261,     75,   -644,    -72,  0x30, 0x75, 0x00, 0xFF
vertex    259,    210,     95,   -796,    990,  0x30, 0x75, 0x00, 0xFF
vertex    259,    210,    -96,    734,    990,  0x30, 0x75, 0x00, 0xFF
vertex   -252,    210,   -128,    762,   -146,  0x00, 0x00, 0x81, 0xFF
vertex    259,      5,   -128,  -2074,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -252,      5,   -128,    762,    990,  0x00, 0x00, 0x81, 0xFF
vertex    195,    210,   -128,  -1720,   -146,  0x00, 0x00, 0x81, 0xFF
vertex   -252,    261,    -77,   4056,    412,  0x00, 0x59, 0xA7, 0xFF
vertex    195,    210,   -128,    478,    990,  0x00, 0x59, 0xA7, 0xFF
vertex   -252,    210,   -128,   4056,    990,  0x00, 0x59, 0xA7, 0xFF
vertex    136,    261,    -77,    950,    412,  0x00, 0x59, 0xA7, 0xFF
vertex    136,    261,     75,      0,      0,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700D488: # 0x0700D488 - 0x0700D568
vertex    195,    210,    127,    480,    990,  0x00, 0x5A, 0x58, 0xFF
vertex    136,    261,     75,      8,    412,  0x00, 0x5A, 0x58, 0xFF
vertex   -252,    261,     75,  -3096,    412,  0x00, 0x5A, 0x58, 0xFF
vertex   -252,    210,    127,  -3096,    990,  0x00, 0x5A, 0x58, 0xFF
vertex   -252,      5,    127,  -2074,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    259,      5,    127,    762,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    195,    210,    127,    408,   -146,  0x00, 0x00, 0x7F, 0xFF
vertex   -252,    210,    127,  -2074,   -146,  0x00, 0x00, 0x7F, 0xFF
vertex    259,    210,     95,    990,    990,  0x20, 0x68, 0x41, 0xFF
vertex    136,    261,     75,    990,   -352,  0x20, 0x68, 0x41, 0xFF
vertex    195,    210,    127,    520,    452,  0x20, 0x68, 0x41, 0xFF
vertex    259,      5,   -128,    540,   1116,  0x38, 0x11, 0x90, 0xFF
vertex    195,    210,   -128,    540,    -72,  0x38, 0x11, 0x90, 0xFF
vertex    259,    210,    -96,    156,     34,  0x38, 0x11, 0x90, 0xFF

wf_seg7_vertex_0700D568: # 0x0700D568 - 0x0700D5C8
vertex    259,    210,     95,    764,   -144,  0x38, 0x11, 0x70, 0xFF
vertex    195,    210,    127,    368,   -116,  0x38, 0x11, 0x70, 0xFF
vertex    259,      5,    127,    764,   1004,  0x38, 0x11, 0x70, 0xFF
vertex    195,    210,   -128,    364,    990,  0x20, 0x67, 0xBF, 0xFF
vertex    136,    261,    -77,    530,    500,  0x20, 0x67, 0xBF, 0xFF
vertex    259,    210,    -96,      0,    990,  0x20, 0x67, 0xBF, 0xFF

wf_seg7_vertex_0700D5C8: # 0x0700D5C8 - 0x0700D608
vertex    259,      5,   -128,   1118,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    259,    210,     95,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    259,      5,    127,   -158,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    259,    210,    -96,    958,      0,  0x7F, 0x00, 0x00, 0xFF

wf_seg7_dl_0700D608: # 0x0700D608 - 0x0700D6D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700D378, 1
gsSPLight wf_seg7_light_0700D370, 2
gsSPVertex wf_seg7_vertex_0700D388, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPVertex wf_seg7_vertex_0700D488, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex wf_seg7_vertex_0700D568, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

wf_seg7_dl_0700D6D0: # 0x0700D6D0 - 0x0700D708
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wf_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_0700D5C8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700D708 # 0x0700D708 - 0x0700D780
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700D608
gsSPDisplayList wf_seg7_dl_0700D6D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
