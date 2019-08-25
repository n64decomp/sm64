cotmc_seg7_vertex_0700A1E0: # 0x0700A1E0 - 0x0700A2E0
vertex   -262,      0,  -3526,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -286,      0,  -3582,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -292,      0,  -3520,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -227,      0,  -3275,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    -84,      0,  -3544,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -257,      0,  -3270,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -563,      0,  -3860,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -563,      0,  -1632,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -157,      0,  -1841,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    -35,      0,  -2711,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    -64,      0,  -3354,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex     36,      0,  -3565,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    255,      0,  -4466,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    564,      0,  -3278,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    564,      0,  -3999,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex     50,      0,  -3387,      0,      0,  0x00, 0x00, 0x00, 0xFF

cotmc_seg7_vertex_0700A2E0: # 0x0700A2E0 - 0x0700A3D0
vertex     50,      0,  -3387,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    156,      0,  -3599,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex     36,      0,  -3565,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    166,      0,  -3407,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    330,      0,  -3661,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    341,      0,  -3413,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    255,      0,  -4466,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    403,      0,  -3337,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    564,      0,  -3278,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    388,      0,  -4829,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    564,      0,  -4781,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    564,      0,  -3999,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    537,      0,  -4960,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    661,      0,  -4877,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    628,      0,  -4947,      0,      0,  0x00, 0x00, 0x00, 0xFF

cotmc_seg7_dl_0700A3D0: # 0x0700A3D0 - 0x0700A4B8
gsSPVertex cotmc_seg7_vertex_0700A1E0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  5,  3,  0, 0x0,  5,  0,  2, 0x0
gsSP2Triangles  2,  1,  6, 0x0,  7,  5,  2, 0x0
gsSP2Triangles  2,  6,  7, 0x0,  7,  8,  5, 0x0
gsSP2Triangles  8,  9,  5, 0x0,  9,  3,  5, 0x0
gsSP2Triangles  3, 10,  4, 0x0, 10, 11,  4, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 10, 15, 11, 0x0
gsSPVertex cotmc_seg7_vertex_0700A2E0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  3,  4,  1, 0x0,  3,  5,  4, 0x0
gsSP2Triangles  6,  4,  7, 0x0,  4,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  6, 10, 0x0
gsSP2Triangles  6, 11, 10, 0x0,  9, 10, 12, 0x0
gsSP2Triangles 10, 13, 14, 0x0, 10, 14, 12, 0x0
gsSPEndDisplayList

glabel cotmc_seg7_dl_0700A4B8 # 0x0700A4B8 - 0x0700A508
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 180
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING
gsSPDisplayList cotmc_seg7_dl_0700A3D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
