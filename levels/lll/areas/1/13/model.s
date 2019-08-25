lll_seg7_light_07017578: # 0x07017578 - 0x07017580
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

lll_seg7_light_07017580: # 0x07017580 - 0x07017590
.byte 0xFE, 0xFF, 0xFF, 0x00, 0xFE, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

lll_seg7_vertex_07017590: # 0x07017590 - 0x07017650
vertex   -511,    154,    128,      0,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   -511,    154,    512,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    512,    154,    512,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    512,    154,    128,    990,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   -511,    307,   -127,    -30,    732,  0x00, 0x6C, 0x41, 0xFF
vertex   -511,    154,    128,      0,   1232,  0x00, 0x6C, 0x41, 0xFF
vertex    512,    154,    128,    988,   1246,  0x00, 0x6C, 0x41, 0xFF
vertex    512,    307,   -127,    992,    746,  0x00, 0x6C, 0x41, 0xFF
vertex   -511,    307,   -511,      0,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -511,    307,   -127,      0,   -288,  0x00, 0x7F, 0x00, 0xFF
vertex    512,    307,   -127,    990,   -288,  0x00, 0x7F, 0x00, 0xFF
vertex    512,    307,   -511,    990,  -1054,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_07017650: # 0x07017650 - 0x07017740
vertex   -511,      0,   -511,   4056,    990,  0x00, 0x00, 0x81, 0xFF
vertex    512,    307,   -511,    650,      0,  0x00, 0x00, 0x81, 0xFF
vertex    512,      0,   -511,    650,    990,  0x00, 0x00, 0x81, 0xFF
vertex    512,      0,   -511,   2352,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    512,    307,   -511,   2352,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    512,    307,   -127,   1076,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    512,    154,    128,    224,    480,  0x7F, 0x00, 0x00, 0xFF
vertex    512,      0,    512,  -1052,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    512,    154,    512,  -1052,    480,  0x7F, 0x00, 0x00, 0xFF
vertex   -511,    154,    128,   2098,    480,  0x81, 0x00, 0x00, 0xFF
vertex   -511,    307,   -127,   1246,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -511,      0,   -511,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -511,      0,    512,   3374,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -511,    154,    512,   3374,    480,  0x81, 0x00, 0x00, 0xFF
vertex   -511,    307,   -511,      0,      0,  0x81, 0x00, 0x00, 0xFF

lll_seg7_vertex_07017740: # 0x07017740 - 0x070177B0
vertex    512,      0,    512,   3374,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -511,    154,    512,      0,    478,  0x00, 0x00, 0x7F, 0xFF
vertex   -511,      0,    512,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -511,      0,   -511,   4056,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -511,    307,   -511,   4056,      0,  0x00, 0x00, 0x81, 0xFF
vertex    512,    307,   -511,    650,      0,  0x00, 0x00, 0x81, 0xFF
vertex    512,    154,    512,   3374,    478,  0x00, 0x00, 0x7F, 0xFF

lll_seg7_dl_070177B0: # 0x070177B0 - 0x07017818
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_07017580, 1
gsSPLight lll_seg7_light_07017578, 2
gsSPVertex lll_seg7_vertex_07017590, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

lll_seg7_dl_07017818: # 0x07017818 - 0x070178A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07017650, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  3,  6,  7, 0x0
gsSP2Triangles  6,  8,  7, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13,  9, 0x0, 12,  9, 11, 0x0
gsSP1Triangle 10, 14, 11, 0x0
gsSPVertex lll_seg7_vertex_07017740, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_070178A8 # 0x070178A8 - 0x07017938
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_070177B0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07017818
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
