vcutm_seg7_light_07009458: # 0x07009458 - 0x07009460
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

vcutm_seg7_light_07009460: # 0x07009460 - 0x07009470
.byte 0x88, 0x88, 0x88, 0x00, 0x88, 0x88, 0x88, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

vcutm_seg7_light_07009470: # 0x07009470 - 0x07009478
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

vcutm_seg7_light_07009478: # 0x07009478 - 0x07009488
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

vcutm_seg7_vertex_07009488: # 0x07009488 - 0x07009578
vertex    307,      0,    768,      0,   1960,  0x00, 0xC8, 0x71, 0xFF
vertex   -306,    102,    819,      0,    152,  0x00, 0xC8, 0x71, 0xFF
vertex   -306,      0,    768,      0,    100,  0x00, 0xC8, 0x71, 0xFF
vertex    307,    102,    819,      0,   2012,  0x00, 0xC8, 0x71, 0xFF
vertex    307,      0,   -767,    958,   1960,  0x7F, 0x00, 0x00, 0xFF
vertex    307,    102,    819,      0,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex    307,      0,    768,      0,   1960,  0x7F, 0x00, 0x00, 0xFF
vertex    307,    102,   -818,    990,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex    307,      0,    768,      0,   1960,  0x00, 0x81, 0x00, 0xFF
vertex   -306,      0,    768,      0,    100,  0x00, 0x81, 0x00, 0xFF
vertex   -306,      0,   -767,    958,    100,  0x00, 0x81, 0x00, 0xFF
vertex    307,      0,   -767,    958,   1960,  0x00, 0x81, 0x00, 0xFF
vertex   -306,      0,    768,      0,    100,  0x81, 0x00, 0x00, 0xFF
vertex   -306,    102,   -818,    990,    152,  0x81, 0x00, 0x00, 0xFF
vertex   -306,      0,   -767,    958,    100,  0x81, 0x00, 0x00, 0xFF

vcutm_seg7_vertex_07009578: # 0x07009578 - 0x070095E8
vertex   -306,      0,   -767,    958,    100,  0x00, 0xC8, 0x8F, 0xFF
vertex    307,    102,   -818,    990,   2012,  0x00, 0xC8, 0x8F, 0xFF
vertex    307,      0,   -767,    958,   1960,  0x00, 0xC8, 0x8F, 0xFF
vertex   -306,    102,   -818,    990,    152,  0x00, 0xC8, 0x8F, 0xFF
vertex   -306,      0,    768,      0,    100,  0x81, 0x00, 0x00, 0xFF
vertex   -306,    102,    819,      0,    152,  0x81, 0x00, 0x00, 0xFF
vertex   -306,    102,   -818,    990,    152,  0x81, 0x00, 0x00, 0xFF

vcutm_seg7_vertex_070095E8: # 0x070095E8 - 0x07009628
vertex    307,    102,   -818,    990,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,    102,   -818,    990,    152,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,    102,    819,      0,    152,  0x00, 0x7F, 0x00, 0xFF
vertex    307,    102,    819,      0,   2012,  0x00, 0x7F, 0x00, 0xFF

vcutm_seg7_dl_07009628: # 0x07009628 - 0x070096E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, vcutm_seg7_texture_07001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight vcutm_seg7_light_07009460, 1
gsSPLight vcutm_seg7_light_07009458, 2
gsSPVertex vcutm_seg7_vertex_07009488, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex vcutm_seg7_vertex_07009578, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP1Triangle  4,  5,  6, 0x0
gsSPLight vcutm_seg7_light_07009478, 1
gsSPLight vcutm_seg7_light_07009470, 2
gsSPVertex vcutm_seg7_vertex_070095E8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel vcutm_seg7_dl_070096E0 # 0x070096E0 - 0x07009750
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList vcutm_seg7_dl_07009628
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
