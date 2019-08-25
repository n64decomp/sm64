inside_castle_seg7_vertex_07031608: # 0x07031608 - 0x070316C8
vertex   2001,   1024,  -2688,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1857,   1024,  -2833,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2001,    691,  -2688,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1857,    691,  -2833,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1857,   1024,  -2037,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2001,   1024,  -2182,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1857,    691,  -2037,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2001,    691,  -2182,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1205,    691,  -2688,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1350,   1024,  -2833,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1205,   1024,  -2688,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1350,    691,  -2833,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF

inside_castle_seg7_dl_070316C8: # 0x070316C8 - 0x07031720
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex inside_castle_seg7_vertex_07031608, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07031720 # 0x07031720 - 0x07031790
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList inside_castle_seg7_dl_070316C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
