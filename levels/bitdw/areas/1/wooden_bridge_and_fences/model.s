bitdw_seg7_vertex_07003370: # 0x07003370 - 0x07003460
vertex     51,    410,  -1228,    912,    -30,  0xAF, 0xCE, 0x16, 0xFF
vertex  -1021,    492,  -1393, -10012,    -24,  0xAF, 0xCE, 0x16, 0xFF
vertex  -1021,    390,  -1393,  -9878,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex     51,    410,  -1228,    990,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex    256,    307,   -818,  -3578,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    264,    409,   -818,  -3614,    -28,  0xAF, 0xCE, 0x16, 0xFF
vertex     51,    307,  -1228,    990,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    264,    409,   -818,    786,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex    162,    417,   -818,   -234,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex    154,    315,   -818,   -234,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    256,    307,   -818,    786,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex   -146,    441,   -818,    800,    -30,  0xAF, 0xCE, 0x16, 0xFF
vertex  -1074,    512,   -818,  -8488,    -28,  0xAF, 0xCE, 0x16, 0xFF
vertex  -1074,    410,   -818,  -8410,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex   -146,    338,   -818,    878,    990,  0xAF, 0xCE, 0x16, 0xFF

bitdw_seg7_vertex_07003460: # 0x07003460 - 0x070034E0
vertex   -153,    205,   -818,    990,    990,  0xDF, 0xBF, 0x1F, 0xFF
vertex   -153,   -442,   1090,  -9072,    990,  0xDF, 0xBF, 0x1F, 0xFF
vertex   -153,   -215,   1058,  -8900,    -86,  0xDF, 0xBF, 0x1F, 0xFF
vertex   -146,    441,   -818,    990,      0,  0xDF, 0xBF, 0x1F, 0xFF
vertex    154,   -215,   1058,  -8900,    -86,  0xDF, 0xBF, 0x1F, 0xFF
vertex    154,   -442,   1090,  -9070,    990,  0xDF, 0xBF, 0x1F, 0xFF
vertex    162,    417,   -818,    990,      0,  0xDF, 0xBF, 0x1F, 0xFF
vertex    154,    205,   -818,    990,    990,  0xDF, 0xBF, 0x1F, 0xFF

bitdw_seg7_vertex_070034E0: # 0x070034E0 - 0x07003520
vertex    154,   -306,   1024,      0,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex    154,    315,   -818,   6440,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -146,    338,   -818,   6464,    972,  0xFF, 0xD4, 0x00, 0xFF
vertex   -153,   -306,   1024,      0,    988,  0xFF, 0xD4, 0x00, 0xFF

bitdw_seg7_dl_07003520: # 0x07003520 - 0x07003588
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_07003370, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2,  6, 0x0
gsSPEndDisplayList

bitdw_seg7_dl_07003588: # 0x07003588 - 0x070035D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_07003460, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSPEndDisplayList

bitdw_seg7_dl_070035D0: # 0x070035D0 - 0x07003608
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_070034E0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_07003608 # 0x07003608 - 0x07003688
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_07003520
gsSPDisplayList bitdw_seg7_dl_07003588
gsSPDisplayList bitdw_seg7_dl_070035D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
