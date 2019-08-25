wf_seg7_light_0700D0A8: # 0x0700D0A8 - 0x0700D0B0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700D0B0: # 0x0700D0B0 - 0x0700D0C0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700D0C0: # 0x0700D0C0 - 0x0700D1B0
vertex   -613,      0,  -2175, -20266,   -542,  0x81, 0x00, 0x00, 0xFF
vertex   -613,   -383,      0, -13316,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -613,      0,      0, -13316,   -542,  0x81, 0x00, 0x00, 0xFF
vertex    154,   -383,   2432,  -3096,    990,  0x81, 0x00, 0x00, 0xFF
vertex    154,    640,   2432,  -3096,  -2002,  0x81, 0x00, 0x00, 0xFF
vertex    154,      0,      0, -13316,   -542,  0x81, 0x00, 0x00, 0xFF
vertex    154,   -383,      0, -13316,    990,  0x81, 0x00, 0x00, 0xFF
vertex    614,    640,   2432,      0,      0,  0x00, 0x7A, 0xE0, 0xFF
vertex    614,      0,      0,      0, -10252,  0x00, 0x7A, 0xE0, 0xFF
vertex    154,      0,      0,  -1870, -10252,  0x00, 0x7A, 0xE0, 0xFF
vertex    154,    640,   2432,  -1870,      0,  0x00, 0x7A, 0xE0, 0xFF
vertex    154,   -383,      0,   3034,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    154,      0,      0,   3034,   -542,  0x00, 0x00, 0x7F, 0xFF
vertex   -613,      0,      0,    172,   -542,  0x00, 0x00, 0x7F, 0xFF
vertex   -613,   -383,      0,    172,    990,  0x00, 0x00, 0x7F, 0xFF

wf_seg7_vertex_0700D1B0: # 0x0700D1B0 - 0x0700D260
vertex    614,      0,  -2175,  -3914,   -542,  0x00, 0x00, 0x81, 0xFF
vertex   -613,   -383,  -2175,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -613,      0,  -2175,    990,   -542,  0x00, 0x00, 0x81, 0xFF
vertex   -613,      0,  -2175, -20266,   -542,  0x81, 0x00, 0x00, 0xFF
vertex   -613,   -383,  -2175, -20266,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -613,   -383,      0, -13316,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -613,      0,  -2175,  -3914,  -6164,  0x00, 0x7F, 0x00, 0xFF
vertex   -613,      0,      0,  -3914,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    614,      0,      0,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    614,      0,  -2175,    990,  -6164,  0x00, 0x7F, 0x00, 0xFF
vertex    614,   -383,  -2175,  -3914,    990,  0x00, 0x00, 0x81, 0xFF

wf_seg7_dl_0700D260: # 0x0700D260 - 0x0700D300
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700D0B0, 1
gsSPLight wf_seg7_light_0700D0A8, 2
gsSPVertex wf_seg7_vertex_0700D0C0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 14, 11, 13, 0x0
gsSPVertex wf_seg7_vertex_0700D1B0, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle  0, 10,  1, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700D300 # 0x0700D300 - 0x0700D370
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700D260
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
