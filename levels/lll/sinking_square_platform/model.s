lll_seg7_vertex_07019C80: # 0x07019C80 - 0x07019D20
vertex   -509,     41,   -511,    -30,      0,  0x00, 0x7E, 0x0A, 0xFF
vertex  -1023,      0,      0,   -542,    478,  0x00, 0x7E, 0x0A, 0xFF
vertex     -1,      0,      0,    476,    480,  0x00, 0x7E, 0x0A, 0xFF
vertex  -1023,      0,   1024,   -542,   1500,  0x00, 0x7E, 0x0A, 0xFF
vertex      0,      0,   1024,    480,   1500,  0x00, 0x7E, 0x0A, 0xFF
vertex   -509,     41,    512,    -30,    990,  0x00, 0x7E, 0x0A, 0xFF
vertex   1024,      0,   1024,   1502,   1500,  0x00, 0x7E, 0x0A, 0xFF
vertex    514,     41,    512,    992,    990,  0x00, 0x7E, 0x0A, 0xFF
vertex   1024,      0,      0,   1502,    478,  0x00, 0x7E, 0x0A, 0xFF
vertex    514,     41,   -511,    992,      0,  0x00, 0x7E, 0x0A, 0xFF

lll_seg7_vertex_07019D20: # 0x07019D20 - 0x07019E20
vertex      0,      0,  -1023,    480,   -544,  0xF6, 0x7E, 0x00, 0xFF
vertex     -1,      0,      0,    476,    480,  0xF6, 0x7E, 0x00, 0xFF
vertex    514,     41,   -511,    992,      0,  0xF6, 0x7E, 0x00, 0xFF
vertex   1024,      0,  -1023,   1502,   -544,  0x0A, 0x7E, 0x00, 0xFF
vertex    514,     41,   -511,    992,      0,  0x0A, 0x7E, 0x00, 0xFF
vertex   1024,      0,      0,   1502,    478,  0x0A, 0x7E, 0x00, 0xFF
vertex   1024,      0,   1024,   1502,   1500,  0x0A, 0x7E, 0x00, 0xFF
vertex    514,     41,    512,    992,    990,  0x0A, 0x7E, 0x00, 0xFF
vertex  -1023,      0,  -1023,   -542,   -544,  0xF6, 0x7E, 0x00, 0xFF
vertex  -1023,      0,      0,   -542,    478,  0xF6, 0x7E, 0x00, 0xFF
vertex   -509,     41,   -511,    -30,      0,  0xF6, 0x7E, 0x00, 0xFF
vertex  -1023,      0,   1024,   -542,   1500,  0xF6, 0x7E, 0x00, 0xFF
vertex   -509,     41,    512,    -30,    990,  0xF6, 0x7E, 0x00, 0xFF
vertex      0,      0,  -1023,    480,   -544,  0x0A, 0x7E, 0x00, 0xFF
vertex   -509,     41,   -511,    -30,      0,  0x0A, 0x7E, 0x00, 0xFF
vertex     -1,      0,      0,    476,    480,  0x0A, 0x7E, 0x00, 0xFF

lll_seg7_vertex_07019E20: # 0x07019E20 - 0x07019E80
vertex   -509,     41,    512,    -30,    990,  0x0A, 0x7E, 0x00, 0xFF
vertex      0,      0,   1024,    480,   1500,  0x0A, 0x7E, 0x00, 0xFF
vertex      0,      0,      0,    478,    480,  0x0A, 0x7E, 0x00, 0xFF
vertex      0,      0,   1024,    480,   1500,  0xF6, 0x7E, 0x00, 0xFF
vertex    514,     41,    512,    992,    990,  0xF6, 0x7E, 0x00, 0xFF
vertex      0,      0,      0,    478,    480,  0xF6, 0x7E, 0x00, 0xFF

lll_seg7_vertex_07019E80: # 0x07019E80 - 0x07019F20
vertex   1024,      0,  -1023,   1502,   -544,  0x00, 0x7E, 0xF6, 0xFF
vertex      0,      0,  -1023,    480,   -544,  0x00, 0x7E, 0xF6, 0xFF
vertex    514,     41,   -511,    992,      0,  0x00, 0x7E, 0xF6, 0xFF
vertex  -1023,      0,  -1023,   -542,   -544,  0x00, 0x7E, 0xF6, 0xFF
vertex   -509,     41,   -511,    -30,      0,  0x00, 0x7E, 0xF6, 0xFF
vertex  -1023,      0,      0,   -542,    478,  0x00, 0x7E, 0xF6, 0xFF
vertex   -509,     41,    512,    -30,    990,  0x00, 0x7E, 0xF6, 0xFF
vertex      0,      0,      0,    478,    480,  0x00, 0x7E, 0xF6, 0xFF
vertex    514,     41,    512,    992,    990,  0x00, 0x7E, 0xF6, 0xFF
vertex   1024,      0,      0,   1502,    478,  0x00, 0x7E, 0xF6, 0xFF

lll_seg7_dl_07019F20: # 0x07019F20 - 0x0701A010
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC50, 1
gsSPLight lll_seg7_light_0700FC48, 2
gsSPVertex lll_seg7_vertex_07019C80, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  2,  8,  9, 0x0
gsSPLight lll_seg7_light_0700FC68, 1
gsSPLight lll_seg7_light_0700FC60, 2
gsSPVertex lll_seg7_vertex_07019D20, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  5,  7, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  9, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex lll_seg7_vertex_07019E20, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07019E80, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  8,  9,  7, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_0701A010 # 0x0701A010 - 0x0701A080
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07019F20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
