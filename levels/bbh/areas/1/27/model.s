bbh_seg7_vertex_07015750: # 0x07015750 - 0x07015840
vertex   1014,    307,   -818,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,    410,   -716,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    963,    410,   -818,    478,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,    512,   -818,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,    410,   -921,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,   1126,   -818,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,   1229,   -716,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    963,   1229,   -818,    478,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,   1229,   -921,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,   1331,   -818,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,   1229,   -716,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,   1126,   -818,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -654,   1229,   -818,    480,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,   1229,   -921,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,   1331,   -818,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_vertex_07015840: # 0x07015840 - 0x07015930
vertex   -706,    512,   -818,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,    410,   -716,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -654,    410,   -818,    480,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,    307,   -818,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -706,    410,   -921,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    256,    410,  -1525,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    154,    512,  -1525,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    154,    410,  -1474,    480,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex    154,    307,  -1525,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     51,    410,  -1525,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     51,   1229,  -1525,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    154,   1126,  -1525,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    154,   1229,  -1474,    480,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex    256,   1229,  -1525,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    154,   1331,  -1525,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_dl_07015930: # 0x07015930 - 0x07015A20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_07015750, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  3,  4,  2, 0x0,  4,  0,  2, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  8,  5,  7, 0x0
gsSP2Triangles  6,  9,  7, 0x0,  9,  8,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 11, 13, 12, 0x0
gsSP2Triangles 13, 14, 12, 0x0, 14, 10, 12, 0x0
gsSPVertex bbh_seg7_vertex_07015840, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  3,  4,  2, 0x0,  4,  0,  2, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  8,  5,  7, 0x0
gsSP2Triangles  6,  9,  7, 0x0,  9,  8,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 11, 13, 12, 0x0
gsSP2Triangles 13, 14, 12, 0x0, 14, 10, 12, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07015A20 # 0x07015A20 - 0x07015A90
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_07015930
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
