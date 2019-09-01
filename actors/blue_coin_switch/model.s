# Blue Coin Switch

blue_coin_switch_seg8_light_08000000: # 0x08000000
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

blue_coin_switch_seg8_light_08000008: # 0x08000008
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

blue_coin_switch_seg8_texture_08000018: # 0x08000018
.incbin "actors/blue_coin_switch/blue_coin_switch_side.rgba16"

blue_coin_switch_seg8_texture_08000418: # 0x08000418
.incbin "actors/blue_coin_switch/blue_coin_switch_top.rgba16"

blue_coin_switch_seg8_vertex_08000C18: # 0x08000C18
vertex     26,      0,     26,    990,    479,  0x00, 0x00, 0x7F, 0xFF
vertex     26,     26,     26,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -25,     26,     26,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -25,      0,     26,      0,    479,  0x00, 0x00, 0x7F, 0xFF
vertex    -25,      0,    -25,    990,    479,  0x00, 0x00, 0x81, 0xFF
vertex     26,     26,    -25,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     26,      0,    -25,      0,    479,  0x00, 0x00, 0x81, 0xFF
vertex    -25,     26,    -25,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -25,      0,     26,    990,    479,  0x81, 0x00, 0x00, 0xFF
vertex    -25,     26,    -25,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -25,      0,    -25,      0,    479,  0x81, 0x00, 0x00, 0xFF
vertex    -25,     26,     26,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex     26,      0,    -25,    990,    479,  0x7F, 0x00, 0x00, 0xFF
vertex     26,     26,    -25,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     26,     26,     26,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     26,      0,     26,      0,    479,  0x7F, 0x00, 0x00, 0xFF

blue_coin_switch_seg8_vertex_08000D18: # 0x08000D18
vertex     26,     26,    -25,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,     26,     26,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     26,     26,     26,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,     26,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF

glabel blue_coin_switch_seg8_dl_08000D58 # 0x08000D58 - 0x08000DD0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, blue_coin_switch_seg8_texture_08000018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight blue_coin_switch_seg8_light_08000008, 1
gsSPLight blue_coin_switch_seg8_light_08000000, 2
gsSPVertex blue_coin_switch_seg8_vertex_08000C18, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

glabel blue_coin_switch_seg8_dl_08000DD0 # 0x08000DD0 - 0x08000E08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, blue_coin_switch_seg8_texture_08000418
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex blue_coin_switch_seg8_vertex_08000D18, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel blue_coin_switch_seg8_dl_08000E08 # 0x08000E08 - 0x08000E98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList blue_coin_switch_seg8_dl_08000D58
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList blue_coin_switch_seg8_dl_08000DD0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
