sl_seg7_light_0700A620: # 0x0700A620 - 0x0700A628
.byte 0x73, 0x73, 0x73, 0x00, 0x73, 0x73, 0x73, 0x00

sl_seg7_light_0700A628: # 0x0700A628 - 0x0700A638
.byte 0xE6, 0xE6, 0xE6, 0x00, 0xE6, 0xE6, 0xE6, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

sl_seg7_vertex_0700A638: # 0x0700A638 - 0x0700A718
vertex    102,      0,   -255,   2522,   2010,  0x59, 0x59, 0x00, 0xFF
vertex      0,    102,    256,      0,   1498,  0x59, 0x59, 0x00, 0xFF
vertex    102,      0,    256,      0,   2010,  0x59, 0x59, 0x00, 0xFF
vertex      0,    102,   -255,   2522,   1500,  0x59, 0x59, 0x00, 0xFF
vertex      0,    102,   -255,   2522,   1500,  0xA6, 0x59, 0x00, 0xFF
vertex   -101,      0,    256,      0,    990,  0xA6, 0x59, 0x00, 0xFF
vertex      0,    102,    256,      0,   1498,  0xA6, 0x59, 0x00, 0xFF
vertex   -101,      0,   -255,   2522,    990,  0xA6, 0x59, 0x00, 0xFF
vertex      0,    102,    256,    478,    480,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,      0,    256,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    102,      0,    256,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    102,      0,   -255,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -101,      0,   -255,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex      0,    102,   -255,    478,    480,  0x00, 0x00, 0x81, 0xFF

sl_seg7_dl_0700A718: # 0x0700A718 - 0x0700A780
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight sl_seg7_light_0700A628, 1
gsSPLight sl_seg7_light_0700A620, 2
gsSPVertex sl_seg7_vertex_0700A638, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_0700A780 # 0x0700A780 - 0x0700A7F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sl_seg7_dl_0700A718
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
