ddd_seg7_vertex_07005CB0: # 0x07005CB0 - 0x07005D90
vertex   7322,  -2746,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   7322,  -2746,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   7680,  -2746,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   7014,  -2746,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   7322,  -2746,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   7322,  -2746,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   7014,  -2746,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -2149,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -2149,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -1791,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -2457,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -2149,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -2149,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -2457,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

ddd_seg7_vertex_07005D90: # 0x07005D90 - 0x07005E70
vertex   5478,  -2746,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5478,  -2746,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5786,  -2746,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5786,  -2746,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5786,  -2746,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5786,  -2746,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   6144,  -2746,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5988,    244,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5734,    497,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5734,    497,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5734,    497,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5517,    715,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5517,    715,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   5734,    497,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

ddd_seg7_vertex_07005E70: # 0x07005E70 - 0x07005EE0
vertex   3123,  -4505,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -4505,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -4197,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -4197,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -4197,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -3839,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   3123,  -4197,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

ddd_seg7_dl_07005EE0: # 0x07005EE0 - 0x07005F78
gsSPVertex ddd_seg7_vertex_07005CB0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSPVertex ddd_seg7_vertex_07005D90, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSPVertex ddd_seg7_vertex_07005E70, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_07005F78 # 0x07005F78 - 0x07005FC8
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 98
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList ddd_seg7_dl_07005EE0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
