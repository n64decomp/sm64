lll_seg7_vertex_0701A080: # 0x0701A080 - 0x0701A120
vertex      0,      0,      0,    480,    478,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,   -306,      0,    990,  0xFF, 0x00, 0x00, 0xFF
vertex    307,    307,   -306,    990,    990,  0xFF, 0x00, 0x00, 0xFF
vertex    307,    307,    307,    990,      0,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,    307,      0,      0,  0xFF, 0x00, 0x00, 0xFF
vertex      0,      0,      0,    480,    478,  0xC8, 0x00, 0x00, 0xFF
vertex   -306,    307,    307,      0,      0,  0xC8, 0x00, 0x00, 0xFF
vertex   -306,    307,   -306,      0,    990,  0xC8, 0x00, 0x00, 0xFF
vertex    307,    307,   -306,    990,    990,  0xC8, 0x00, 0x00, 0xFF
vertex    307,    307,    307,    990,      0,  0xC8, 0x00, 0x00, 0xFF

lll_seg7_vertex_0701A120: # 0x0701A120 - 0x0701A160
vertex    307,    307,    307,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,    307,   -306,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,    307,    307,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    307,    307,   -306,    990,      0,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_dl_0701A160: # 0x0701A160 - 0x0701A1A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_0701A080, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  8,  9, 0x0
gsSPEndDisplayList

lll_seg7_dl_0701A1A8: # 0x0701A1A8 - 0x0701A1F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_0701A120, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_0701A1F0 # 0x0701A1F0 - 0x0701A270
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_0701A160
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING
gsSPDisplayList lll_seg7_dl_0701A1A8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
