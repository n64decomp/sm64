bowser_3_seg7_light_07002CE0: # 0x07002CE0 - 0x07002CE8
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07002CE8: # 0x07002CE8 - 0x07002CF8
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_07002CF8: # 0x07002CF8 - 0x07002D00
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07002D00: # 0x07002D00 - 0x07002D10
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_07002D10: # 0x07002D10 - 0x07002D70
vertex      0,  -2364,   1262,   1366,  -1156,  0x08, 0x90, 0x39, 0xFF
vertex   1498,  -1852,   2050,    580,  -2652,  0x08, 0x90, 0x39, 0xFF
vertex      0,  -1340,   3277,   -644,  -1156,  0x08, 0x90, 0x39, 0xFF
vertex   1498,  -1852,   2050,    580,  -2652,  0x16, 0x99, 0x46, 0xFF
vertex   1946,  -1340,   2662,      0,  -3098,  0x16, 0x99, 0x46, 0xFF
vertex      0,  -1340,   3277,   -644,  -1156,  0x16, 0x99, 0x46, 0xFF

bowser_3_seg7_vertex_07002D70: # 0x07002D70 - 0x07002DB0
vertex      0,    307,   3277,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   1946,    307,   2662,   2284,    582,  0x00, 0x7F, 0x00, 0xFF
vertex   1498,    307,   2050,   1986,    174,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   1262,    990,   -350,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07002DB0: # 0x07002DB0 - 0x07002EB0
vertex      0,  -1340,   3277,    958,   2012,  0x81, 0x00, 0x00, 0xFF
vertex      0,    307,   3277,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex      0,  -2364,   1262,  -1052,   2012,  0x81, 0x00, 0x00, 0xFF
vertex   1498,    307,   2050,    234,      0,  0x66, 0x00, 0xB5, 0xFF
vertex   1946,    307,   2662,    990,      0,  0x66, 0x00, 0xB5, 0xFF
vertex   1946,  -1340,   2662,    990,   2012,  0x66, 0x00, 0xB5, 0xFF
vertex   1498,  -1852,   2050,    234,   2012,  0x66, 0x00, 0xB5, 0xFF
vertex      0,  -2364,   1262,    990,   2012,  0x3B, 0x00, 0x90, 0xFF
vertex      0,    307,   1262,    990,      0,  0x3B, 0x00, 0x90, 0xFF
vertex   1498,    307,   2050,   -698,      0,  0x3B, 0x00, 0x90, 0xFF
vertex   1498,  -1852,   2050,   -698,   2012,  0x3B, 0x00, 0x90, 0xFF
vertex   1946,  -1340,   2662,   5340,   1816,  0x26, 0x00, 0x79, 0xFF
vertex      0,    307,   3277,   3800,    172,  0x26, 0x00, 0x79, 0xFF
vertex      0,  -1340,   3277,   3800,   1816,  0x26, 0x00, 0x79, 0xFF
vertex   1946,    307,   2662,   5340,    172,  0x26, 0x00, 0x79, 0xFF
vertex      0,    307,   1262,  -1020,      0,  0x81, 0x00, 0x00, 0xFF

bowser_3_seg7_dl_07002EB0: # 0x07002EB0 - 0x07002F20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07002CE8, 1
gsSPLight bowser_3_seg7_light_07002CE0, 2
gsSPVertex bowser_3_seg7_vertex_07002D10, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_07002D00, 1
gsSPLight bowser_3_seg7_light_07002CF8, 2
gsSPVertex bowser_3_seg7_vertex_07002D70, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07002F20: # 0x07002F20 - 0x07002F88
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07002DB0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  1, 15,  2, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_07002F88 # 0x07002F88 - 0x07003018
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07002EB0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07002F20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
