# Mushroom 1-Up

mushroom_1up_seg3_vertex_030295E8: # 0x030295E8
vertex     31,     31,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -30,     31,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -30,    -30,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex     31,    -30,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF

mushroom_1up_seg3_texture_03029628: # 0x03029628
.incbin "actors/mushroom_1up/1-up_mushroom.rgba16"

glabel mushroom_1up_seg3_dl_0302A628 # 0x0302A628 - 0x0302A660
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mushroom_1up_seg3_texture_03029628
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex mushroom_1up_seg3_vertex_030295E8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel mushroom_1up_seg3_dl_0302A660 # 0x0302A660 - 0x0302A6D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList mushroom_1up_seg3_dl_0302A628
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
