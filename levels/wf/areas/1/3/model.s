wf_seg7_vertex_07005328: # 0x07005328 - 0x07005418
vertex   3840,   1075,  -1458,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3661,   1075,  -1100,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   4019,   1075,  -1100,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -2278,    730,   1953,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -2163,    641,   1617,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -2394,    641,   1617,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3392,   1959,    979,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3277,   1832,   1341,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3533,   1832,   1341,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3277,   1364,   2669,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3533,   1364,   2669,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3392,   1492,   2307,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3840,   1075,  -2482,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3661,   1075,  -2124,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   4019,   1075,  -2124,      0,      0,  0xFF, 0xFF, 0x00, 0x80

wf_seg7_vertex_07005418: # 0x07005418 - 0x070054D8
vertex   3533,   2304,   -101,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3533,   2304,   -409,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3277,   2304,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -2277,   1024,   3379,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -2149,   1024,   3123,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -2405,   1024,   3123,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -1279,   1024,   3482,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -1279,   1024,   3686,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex  -1074,   1024,   3584,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3277,   1165,  -2940,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3405,   1309,  -2729,      0,      0,  0xFF, 0xFF, 0x00, 0x80
vertex   3533,   1165,  -2940,      0,      0,  0xFF, 0xFF, 0x00, 0x80

wf_seg7_dl_070054D8: # 0x070054D8 - 0x07005538
gsSPVertex wf_seg7_vertex_07005328, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex wf_seg7_vertex_07005418, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_07005538 # 0x07005538 - 0x07005568
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsSPDisplayList wf_seg7_dl_070054D8
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
