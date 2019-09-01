# Purple Switch

purple_switch_seg8_light_0800C090: # 0x0800C090
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

purple_switch_seg8_light_0800C098: # 0x0800C098
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

purple_switch_seg8_texture_0800C0A8: # 0x0800C0A8
.incbin "actors/purple_switch/purple_switch_base.rgba16"

purple_switch_seg8_texture_0800C128: # 0x0800C128
.incbin "actors/purple_switch/purple_switch_exclamation_point.rgba16"

purple_switch_seg8_vertex_0800C528: # 0x0800C528
vertex    102,      0,   -101,      0,   -543,  0x53, 0x5F, 0x00, 0xFF
vertex     61,     36,    -60,   1326,   -287,  0x53, 0x5F, 0x00, 0xFF
vertex     61,     36,     61,   1326,    478,  0x53, 0x5F, 0x00, 0xFF
vertex   -101,      0,   -101,      0,    734,  0x00, 0x5F, 0xAD, 0xFF
vertex     61,     36,    -60,   1326,   -287,  0x00, 0x5F, 0xAD, 0xFF
vertex    102,      0,   -101,      0,   -543,  0x00, 0x5F, 0xAD, 0xFF
vertex    -60,     36,    -60,   1326,    478,  0x00, 0x5F, 0xAD, 0xFF
vertex   -101,      0,    102,      0,    734,  0xAD, 0x5F, 0x00, 0xFF
vertex    -60,     36,    -60,   1326,   -287,  0xAD, 0x5F, 0x00, 0xFF
vertex   -101,      0,   -101,      0,   -543,  0xAD, 0x5F, 0x00, 0xFF
vertex    -60,     36,     61,   1326,    478,  0xAD, 0x5F, 0x00, 0xFF
vertex    102,      0,    102,      0,   -543,  0x00, 0x5F, 0x53, 0xFF
vertex     61,     36,     61,   1326,   -287,  0x00, 0x5F, 0x53, 0xFF
vertex    -60,     36,     61,   1326,    478,  0x00, 0x5F, 0x53, 0xFF
vertex   -101,      0,    102,      0,    734,  0x00, 0x5F, 0x53, 0xFF
vertex    102,      0,    102,      0,    734,  0x53, 0x5F, 0x00, 0xFF

purple_switch_seg8_vertex_0800C628: # 0x0800C628
vertex     61,     36,    -60,    607,   -134,  0x00, 0x7F, 0x00, 0xFF
vertex    -60,     36,     61,   -159,   1090,  0x00, 0x7F, 0x00, 0xFF
vertex     61,     36,     61,    607,   1090,  0x00, 0x7F, 0x00, 0xFF
vertex    -60,     36,    -60,   -159,   -134,  0x00, 0x7F, 0x00, 0xFF

glabel purple_switch_seg8_dl_0800C668 # 0x0800C668 - 0x0800C6E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, purple_switch_seg8_texture_0800C0A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x03F, 0x200
gsSPLight purple_switch_seg8_light_0800C098, 1
gsSPLight purple_switch_seg8_light_0800C090, 2
gsSPVertex purple_switch_seg8_vertex_0800C528, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel purple_switch_seg8_dl_0800C6E0 # 0x0800C6E0 - 0x0800C718
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, purple_switch_seg8_texture_0800C128
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPVertex purple_switch_seg8_vertex_0800C628, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel purple_switch_seg8_dl_0800C718 # 0x0800C718 - 0x0800C7A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 2, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 12
gsSPDisplayList purple_switch_seg8_dl_0800C668
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList purple_switch_seg8_dl_0800C6E0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
