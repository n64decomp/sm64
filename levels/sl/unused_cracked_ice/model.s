sl_seg7_light_0700A7F0: # 0x0700A7F0 - 0x0700A7F8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

sl_seg7_light_0700A7F8: # 0x0700A7F8 - 0x0700A808
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

sl_seg7_vertex_0700A808: # 0x0700A808 - 0x0700A848
vertex   -101,      0,    102,    734,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,    102,    734,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,   -101,    224,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,   -101,    224,    224,  0x00, 0x7F, 0x00, 0xFF

sl_seg7_dl_0700A848: # 0x0700A848 - 0x0700A890
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sl_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight sl_seg7_light_0700A7F8, 1
gsSPLight sl_seg7_light_0700A7F0, 2
gsSPVertex sl_seg7_vertex_0700A808, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_0700A890 # 0x0700A890 - 0x0700A910
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 100
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sl_seg7_dl_0700A848
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
