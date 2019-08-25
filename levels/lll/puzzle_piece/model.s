lll_seg7_vertex_0701A270: # 0x0701A270 - 0x0701A2B0
vertex   -245,      0,    246,      0,    992,  0x00, 0x7F, 0x00, 0xFF
vertex    246,      0,    246,    992,    992,  0x00, 0x7F, 0x00, 0xFF
vertex    246,      0,   -245,    992,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -245,      0,   -245,      0,      0,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_0701A2B0: # 0x0701A2B0 - 0x0701A2F0
vertex   -245,    -45,    246,      0,      0,  0x00, 0x00, 0x00, 0xC8
vertex    246,    -45,    246,      0,      0,  0x00, 0x00, 0x00, 0xC8
vertex    246,    -45,   -245,      0,      0,  0x00, 0x00, 0x00, 0xC8
vertex   -245,    -45,   -245,      0,      0,  0x00, 0x00, 0x00, 0xC8

lll_seg7_dl_0701A2F0: # 0x0701A2F0 - 0x0701A338
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

lll_seg7_dl_0701A338: # 0x0701A338 - 0x0701A388
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_0701A270, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel lll_seg7_dl_0701A388 # 0x0701A388 - 0x0701A3B8
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A3B8 # 0x0701A3B8 - 0x0701A3E8
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A3E8 # 0x0701A3E8 - 0x0701A418
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A418 # 0x0701A418 - 0x0701A448
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A448 # 0x0701A448 - 0x0701A478
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A478 # 0x0701A478 - 0x0701A4A8
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A4A8 # 0x0701A4A8 - 0x0701A4D8
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07009000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A4D8 # 0x0701A4D8 - 0x0701A508
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07009800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A508 # 0x0701A508 - 0x0701A538
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700A000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A538 # 0x0701A538 - 0x0701A568
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A568 # 0x0701A568 - 0x0701A598
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A598 # 0x0701A598 - 0x0701A5C8
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A5C8 # 0x0701A5C8 - 0x0701A5F8
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A5F8 # 0x0701A5F8 - 0x0701A628
gsSPDisplayList lll_seg7_dl_0701A2F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700C800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList lll_seg7_dl_0701A338
gsSPEndDisplayList

glabel lll_seg7_dl_0701A628 # 0x0701A628 - 0x0701A670
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPVertex lll_seg7_vertex_0701A2B0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
