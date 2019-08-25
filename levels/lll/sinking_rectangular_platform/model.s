lll_seg7_vertex_07019A98: # 0x07019A98 - 0x07019B18
vertex      5,     41,   1024,    -26,   1000,  0x0D, 0x7E, 0x00, 0xFF
vertex    384,      0,  -1023,   1006,  -4116,  0x0D, 0x7E, 0x00, 0xFF
vertex      5,     41,  -1023,    -14,  -4108,  0x0D, 0x7E, 0x00, 0xFF
vertex    384,      0,   1024,    994,    992,  0x0D, 0x7E, 0x00, 0xFF
vertex   -383,      0,  -1023,    -48,  -4040,  0xF3, 0x7E, 0x00, 0xFF
vertex      5,     41,   1024,   1008,    994,  0xF3, 0x7E, 0x00, 0xFF
vertex      5,     41,  -1023,    984,  -4052,  0xF3, 0x7E, 0x00, 0xFF
vertex   -383,      0,   1024,    -26,   1006,  0xF3, 0x7E, 0x00, 0xFF

lll_seg7_vertex_07019B18: # 0x07019B18 - 0x07019B78
vertex   -383,      0,  -1023,   7122,    990,  0x00, 0x00, 0x81, 0xFF
vertex      5,     41,  -1023,   4016,    662,  0x00, 0x00, 0x81, 0xFF
vertex    384,      0,  -1023,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    384,      0,   1024,   6100,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      5,     41,   1024,   3074,   -360,  0x00, 0x00, 0x7F, 0xFF
vertex   -380,      0,   1024,     -8,    -34,  0x00, 0x00, 0x7F, 0xFF

lll_seg7_dl_07019B78: # 0x07019B78 - 0x07019BD0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07019A98, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

lll_seg7_dl_07019BD0: # 0x07019BD0 - 0x07019C08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07019B18, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07019C08 # 0x07019C08 - 0x07019C80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07019B78
gsSPDisplayList lll_seg7_dl_07019BD0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
