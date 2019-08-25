lll_seg7_vertex_070183F0: # 0x070183F0 - 0x07018470
vertex      0,   -101,   -191,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex      0,      0,    192,   3800,      0,  0x7F, 0x00, 0x00, 0xFF
vertex      0,   -101,    192,   3800,    990,  0x7F, 0x00, 0x00, 0xFF
vertex      0,      0,   -191,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -639,   -101,    192,   3800,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -639,      0,   -191,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -639,   -101,   -191,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -639,      0,    192,   3800,      0,  0x81, 0x00, 0x00, 0xFF

lll_seg7_vertex_07018470: # 0x07018470 - 0x070184B0
vertex      0,      0,   -191,  -5140,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -639,      0,   -191,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -639,      0,    192,      0,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,    192,  -5140,  -2076,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_070184B0: # 0x070184B0 - 0x070184F0
vertex      0,   -101,    192,  -3352,    862,  0x00, 0x81, 0x00, 0xFF
vertex   -639,   -101,    192,   -158,    862,  0x00, 0x81, 0x00, 0xFF
vertex   -639,   -101,   -191,   -158,  -1054,  0x00, 0x81, 0x00, 0xFF
vertex      0,   -101,   -191,  -3352,  -1054,  0x00, 0x81, 0x00, 0xFF

lll_seg7_vertex_070184F0: # 0x070184F0 - 0x07018570
vertex      0,   -101,    192,   5334,    990,  0x00, 0x00, 0x7F, 0xFF
vertex      0,      0,    192,   5334,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -639,      0,    192,  -1052,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -639,   -101,    192,  -1052,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -639,   -101,   -191,   2268,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -639,      0,   -191,   2268,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,      0,   -191,  -4118,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,   -101,   -191,  -4118,    990,  0x00, 0x00, 0x81, 0xFF

lll_seg7_dl_07018570: # 0x07018570 - 0x070185C8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_070183F0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

lll_seg7_dl_070185C8: # 0x070185C8 - 0x07018600
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_0900A000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07018470, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

lll_seg7_dl_07018600: # 0x07018600 - 0x07018638
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_070184B0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

lll_seg7_dl_07018638: # 0x07018638 - 0x07018680
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_070184F0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07018680 # 0x07018680 - 0x07018708
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07018570
gsSPDisplayList lll_seg7_dl_070185C8
gsSPDisplayList lll_seg7_dl_07018600
gsSPDisplayList lll_seg7_dl_07018638
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
