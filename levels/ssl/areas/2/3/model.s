ssl_seg7_vertex_0701F9D8: # 0x0701F9D8 - 0x0701FAD8
vertex   1024,   1485,   2621, -10762,   2520,  0x00, 0x00, 0x00, 0xFF
vertex   1024,   1485,   3113, -10762,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   1352,   1298,   3113, -14850,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   2970,    640,  -3378,   2524,  -4120,  0x00, 0x00, 0x00, 0xFF
vertex   2355,    640,  -3378,  -5140,  -4120,  0x00, 0x00, 0x00, 0xFF
vertex   2355,    640,  -3276,  -5140,  -2842,  0x00, 0x00, 0x00, 0xFF
vertex   2970,    640,  -3276,   2524,  -2842,  0x00, 0x00, 0x00, 0xFF
vertex   3174,    640,  -2559,   5078,   6098,  0x00, 0x00, 0x00, 0xFF
vertex   3174,    640,  -3173,   5078,  -1566,  0x00, 0x00, 0x00, 0xFF
vertex   3072,    640,  -3173,   3800,  -1566,  0x00, 0x00, 0x00, 0xFF
vertex   3072,    640,  -2559,   3800,   6098,  0x00, 0x00, 0x00, 0xFF
vertex    870,   1485,   2621,  -8844,   2522,  0x00, 0x00, 0x00, 0xFF
vertex   1352,   1298,   2621, -14850,   2520,  0x00, 0x00, 0x00, 0xFF
vertex    819,   1536,   2621,  -8206,   2522,  0x00, 0x00, 0x00, 0xFF
vertex    870,   1536,   3113,  -8844,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex    870,   1536,   2621,  -8844,   2522,  0x00, 0x00, 0x00, 0xFF

ssl_seg7_vertex_0701FAD8: # 0x0701FAD8 - 0x0701FBD8
vertex   1024,   1485,   3113, -10762,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex    870,   1485,   2621,  -8844,   2522,  0x00, 0x00, 0x00, 0xFF
vertex    870,   1485,   3113,  -8844,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex  -1023,   1485,   2621,  14788,   2522,  0x00, 0x00, 0x00, 0xFF
vertex  -1023,   1485,   3113,  14788,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   -869,   1485,   3113,  12870,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex  -1351,   1298,   2621,  18876,   2522,  0x00, 0x00, 0x00, 0xFF
vertex  -1351,   1298,   3113,  18876,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   -869,   1485,   2621,  12870,   2522,  0x00, 0x00, 0x00, 0xFF
vertex    819,   1536,   2621,  -8206,   2522,  0x00, 0x00, 0x00, 0xFF
vertex    819,   1536,   3113,  -8206,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex    870,   1536,   3113,  -8844,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex    819,   1510,   3113,  -8206,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   -818,   1306,   2621,  12232,   2522,  0x00, 0x00, 0x00, 0xFF
vertex   -818,   1510,   3113,  12232,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex    819,   1306,   2621,  -8206,   2522,  0x00, 0x00, 0x00, 0xFF

ssl_seg7_vertex_0701FBD8: # 0x0701FBD8 - 0x0701FC18
vertex   -869,   1536,   2621,  12870,   2522,  0x00, 0x00, 0x00, 0xFF
vertex   -869,   1536,   3113,  12870,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   -818,   1536,   3113,  12232,  -3610,  0x00, 0x00, 0x00, 0xFF
vertex   -818,   1536,   2621,  12232,   2522,  0x00, 0x00, 0x00, 0xFF

ssl_seg7_dl_0701FC18: # 0x0701FC18 - 0x0701FCE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ssl_seg7_vertex_0701F9D8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  1,  0, 11, 0x0
gsSP2Triangles  0,  2, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex ssl_seg7_vertex_0701FAD8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  3,  5,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex ssl_seg7_vertex_0701FBD8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_0701FCE0 # 0x0701FCE0 - 0x0701FD60
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 100
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_0701FC18
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
