totwc_seg7_vertex_07007930: # 0x07007930 - 0x07007970
vertex   1024,    512,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1023,    512,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1023,   -511,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1024,   -511,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

totwc_seg7_dl_07007970: # 0x07007970 - 0x070079A8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, totwc_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex totwc_seg7_vertex_07007930, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel totwc_seg7_dl_070079A8 # 0x070079A8 - 0x07007A18
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList totwc_seg7_dl_07007970
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
