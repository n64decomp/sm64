bbh_seg7_vertex_07015408: # 0x07015408 - 0x07015508
vertex    358,   1434,  -1525,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex    -50,   1024,  -1525,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    358,   1024,  -1525,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   -410,    563,  -1519,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   -700,    563,  -1229,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   -700,    358,  -1229,      0,    480,  0xFF, 0x00, 0x00, 0x9A
vertex   -410,    358,  -1519,    990,    480,  0xFF, 0x00, 0x00, 0x9A
vertex   -599,    211,  -1129,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   -310,    211,  -1418,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    358,    614,  -1525,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex    -50,    205,  -1525,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    358,    205,  -1525,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    -50,    614,  -1525,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,    205,   -613,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,    614,  -1023,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,    205,  -1023,      0,    990,  0xFF, 0x00, 0x00, 0x9A

bbh_seg7_vertex_07015508: # 0x07015508 - 0x070155E8
vertex    358,   1434,  -1525,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex    -50,   1434,  -1525,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex    -50,   1024,  -1525,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,    205,  -1023,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,    614,   -613,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,    205,   -613,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,    614,  -1023,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,   1024,  -1023,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,   1434,  -1023,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,   1434,   -613,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   -706,   1024,   -613,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,    205,   -613,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,    614,   -613,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,    614,  -1023,      0,      0,  0xFF, 0x00, 0x00, 0x9A

bbh_seg7_vertex_070155E8: # 0x070155E8 - 0x07015628
vertex   1014,   1024,   -613,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,   1434,   -613,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,   1434,  -1023,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1014,   1024,  -1023,      0,    990,  0xFF, 0x00, 0x00, 0x9A

bbh_seg7_dl_07015628: # 0x07015628 - 0x070156E0
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_07015408, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 12, 10, 0x0, 13, 14, 15, 0x0
gsSPVertex bbh_seg7_vertex_07015508, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex bbh_seg7_vertex_070155E8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_070156E0 # 0x070156E0 - 0x07015750
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_07015628
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
