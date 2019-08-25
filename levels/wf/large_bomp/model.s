wf_seg7_light_0700DA68: # 0x0700DA68 - 0x0700DA70
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700DA70: # 0x0700DA70 - 0x0700DA80
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700DA80: # 0x0700DA80 - 0x0700DB70
vertex   -252,      5,    253,  -2074,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    259,      5,    253,    762,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    195,    210,    253,    408,   -146,  0x00, 0x00, 0x7F, 0xFF
vertex    259,      5,   -258,    540,   1116,  0x57, 0x1B, 0xA9, 0xFF
vertex    195,    210,   -258,    540,    -72,  0x57, 0x1B, 0xA9, 0xFF
vertex    259,    210,   -194,    156,     34,  0x57, 0x1B, 0xA9, 0xFF
vertex    195,    210,   -258,    364,    990,  0x24, 0x74, 0xDC, 0xFF
vertex    136,    261,   -155,    530,    500,  0x24, 0x74, 0xDC, 0xFF
vertex    259,    210,   -194,      0,    990,  0x24, 0x74, 0xDC, 0xFF
vertex    259,    210,    189,    764,   -144,  0x57, 0x1B, 0x57, 0xFF
vertex    195,    210,    253,    368,   -116,  0x57, 0x1B, 0x57, 0xFF
vertex    259,      5,    253,    764,   1004,  0x57, 0x1B, 0x57, 0xFF
vertex    259,    210,    189,    990,    990,  0x24, 0x73, 0x24, 0xFF
vertex    136,    261,    151,    990,   -352,  0x24, 0x73, 0x24, 0xFF
vertex    195,    210,    253,    520,    452,  0x24, 0x73, 0x24, 0xFF

wf_seg7_vertex_0700DB70: # 0x0700DB70 - 0x0700DC60
vertex   -252,    261,   -155,   4056,    412,  0x00, 0x71, 0xC8, 0xFF
vertex    136,    261,   -155,    950,    412,  0x00, 0x71, 0xC8, 0xFF
vertex    195,    210,   -258,    478,    990,  0x00, 0x71, 0xC8, 0xFF
vertex   -252,      5,    253,  -2074,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    195,    210,    253,    408,   -146,  0x00, 0x00, 0x7F, 0xFF
vertex   -252,    210,    253,  -2074,   -146,  0x00, 0x00, 0x7F, 0xFF
vertex   -252,    210,    253,  -3096,    990,  0x00, 0x71, 0x38, 0xFF
vertex    195,    210,    253,    480,    990,  0x00, 0x71, 0x38, 0xFF
vertex   -252,    261,    151,  -3096,    412,  0x00, 0x71, 0x38, 0xFF
vertex    136,    261,    151,      8,    412,  0x00, 0x71, 0x38, 0xFF
vertex   -252,    261,    151,      0,  -3138,  0x00, 0x7F, 0x00, 0xFF
vertex    136,    261,   -155,   1194,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -252,    261,   -155,   1194,  -3138,  0x00, 0x7F, 0x00, 0xFF
vertex    136,    261,    151,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -252,    210,   -258,   4056,    990,  0x00, 0x71, 0xC8, 0xFF

wf_seg7_vertex_0700DC60: # 0x0700DC60 - 0x0700DCE0
vertex   -252,    210,   -258,    762,   -146,  0x00, 0x00, 0x81, 0xFF
vertex    259,      5,   -258,  -2074,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -252,      5,   -258,    762,    990,  0x00, 0x00, 0x81, 0xFF
vertex    195,    210,   -258,  -1720,   -146,  0x00, 0x00, 0x81, 0xFF
vertex    136,    261,   -155,    582,    -72,  0x30, 0x75, 0x00, 0xFF
vertex    259,    210,    189,   -796,    990,  0x30, 0x75, 0x00, 0xFF
vertex    259,    210,   -194,    734,    990,  0x30, 0x75, 0x00, 0xFF
vertex    136,    261,    151,   -644,    -72,  0x30, 0x75, 0x00, 0xFF

wf_seg7_vertex_0700DCE0: # 0x0700DCE0 - 0x0700DD20
vertex    259,      5,   -258,   1118,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    259,    210,   -194,    958,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    259,    210,    189,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    259,      5,    253,   -158,    990,  0x7F, 0x00, 0x00, 0xFF

wf_seg7_dl_0700DD20: # 0x0700DD20 - 0x0700DDE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700DA70, 1
gsSPLight wf_seg7_light_0700DA68, 2
gsSPVertex wf_seg7_vertex_0700DA80, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex wf_seg7_vertex_0700DB70, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  7,  9,  8, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex wf_seg7_vertex_0700DC60, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

wf_seg7_dl_0700DDE8: # 0x0700DDE8 - 0x0700DE20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wf_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_0700DCE0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700DE20 # 0x0700DE20 - 0x0700DE98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700DD20
gsSPDisplayList wf_seg7_dl_0700DDE8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
