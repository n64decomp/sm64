.balign 4

ttm_movtex_puddle_data: # 0x07017104 - 0x07017124
movTexInitLoad     1
movTexRotSpeed   100
movTexRotScale     3
movTex4BoxTris -2047,  2765
movTex4BoxTris -2047,  5069
movTex4BoxTris  1946,  5069
movTex4BoxTris  1946,  2765
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel ttm_movtex_puddle # 0x07017124 - 0x07017134
movTexJump  0, ttm_movtex_puddle_data
movTexEndLoad
movTexEndJump

glabel ttm_movtex_tris_begin_waterfall # 0x07017134 - 0x07017174
movTexSpd    35
movTexTris 2191, -1638,  1188, 0, 0
movTexTris 2165,  1638,  1145, 3, 0
movTexTris 1625,  2286,   757, 4, 0
movTexTris 1756, -1638,  1457, 0, 1
movTexTris 1729,  1638,  1413, 3, 1
movTexTris 1221,  2286,  1077, 4, 1
movTexEnd

glabel ttm_movtex_tris_begin_puddle_waterfall # 0x07017174 - 0x070171A0
movTexSpd    30
movTexTris 3583, -1638,  2751, 0, 0
movTexTris 3583, -1638,   898, 5, 0
movTexTris 1586, -1638,  2751, 0, 2
movTexTris 1586, -1638,   898, 5, 2
movTexEnd

glabel ttm_movtex_tris_end_waterfall # 0x070171A0 - 0x070171E0
movTexSpd    25
movTexTris 3583, -3840,  2913, 0, 0
movTexTris 3583, -1889,  2913, 2, 0
movTexTris 3583, -1638,  2751, 3, 0
movTexTris 2559, -3840,  2913, 0, 1
movTexTris 2559, -1889,  2913, 2, 1
movTexTris 2457, -1638,  2751, 3, 1
movTexEnd

glabel ttm_movtex_tris_end_puddle_waterfall # 0x070171E0 - 0x0701720C
movTexSpd    20
movTexTris 3640, -3840,  3422, 0, 0
movTexTris 3792, -3840,  2849, 1, 0
movTexTris 2358, -3840,  3422, 0, 1
movTexTris 2358, -3840,  2849, 1, 1
movTexEnd

glabel ttm_movtex_tris_puddle_waterfall # 0x0701720C - 0x07017260
movTexSpd    15
movTexTris 1946, -4403,  4520, 0, 0
movTexTris 1992, -4096,  4520, 1, 0
movTexTris 3640, -4096,  3496, 3, 0
movTexTris 3640, -3840,  3422, 4, 0
movTexTris 1946, -4403,  4008, 0, 1
movTexTris 1992, -4096,  4008, 1, 1
movTexTris 2358, -4096,  3496, 3, 1
movTexTris 2358, -3840,  3422, 4, 1
movTexEnd

glabel ttm_dl_waterfall # 0x07017260 - 0x07017288
gsSP2Triangles  0,  1,  3, 0x0,  3,  1,  4, 0x0
gsSP2Triangles  1,  2,  4, 0x0,  4,  2,  5, 0x0
gsSPEndDisplayList

glabel ttm_dl_bottom_waterfall # 0x07017288 - 0x070172A0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSPEndDisplayList

glabel ttm_dl_puddle_waterfall # 0x070172A0 - 0x070172D8
gsSP2Triangles  0,  1,  4, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  1,  2,  5, 0x0,  5,  2,  6, 0x0
gsSP2Triangles  2,  3,  6, 0x0,  6,  3,  7, 0x0
gsSPEndDisplayList
