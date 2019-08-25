.balign 4

glabel lll_movtex_tris_lava_floor # 0x0702874C - 0x070287A8
movTexSpd      1
movTexTris  8191, 0,  8192, 0, 0
movTexTris     0, 0,  8192, 0, 2
movTexTris -8191, 0,  8192, 0, 4
movTexTris  8191, 0,     0, 2, 0
movTexTris     0, 0,     0, 2, 2
movTexTris -8191, 0,     0, 2, 4
movTexTris  8191, 0, -8192, 4, 0
movTexTris     0, 0, -8192, 4, 2
movTexTris -8191, 0, -8192, 4, 4

glabel lll_dl_lava_floor # 0x070287A8 - 0x070287F0
gsSP2Triangles  0,  3,  1, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  4,  7,  5, 0x0,  5,  7,  8, 0x0
gsSPEndDisplayList

lll_movtex_volcano_floor_lava_data:
movTexInitLoad     1
movTexRotSpeed     8
movTexRotScale     5
movTex4BoxTris -3071, -3071
movTex4BoxTris -3071,  3072
movTex4BoxTris  3072,  3072
movTex4BoxTris  3072, -3071
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0xC8
movTexDefine   TEXTURE_LAVA
movTexEnd

glabel lll_movtex_volcano_floor_lava
movTexJump 10, lll_movtex_volcano_floor_lava_data
movTexEndLoad
movTexEndJump

glabel lll_movtex_tris_lavafall_volcano # 0x07028820 - 0x070288C8
movTexSpd    50
movTexTris  655,  -86, -2934,  0, 0
movTexTris  527,  256, -2934,  2, 0
movTexTris  436, 1042, -2934,  4, 0
movTexTris  430, 2555, -2934,  7, 0
movTexTris  430, 5248, -2934, 11, 0
movTexTris  148,  -86, -2669,  0, 1
movTexTris  256,  281, -2823,  2, 1
movTexTris  138,  946, -2870,  4, 1
movTexTris    1, 2555, -2917,  7, 1
movTexTris    0, 5248, -2928, 11, 1
movTexTris   36,   63, -2766,  1, 1
movTexTris -574,  -86, -2934,  0, 2
movTexTris -471,  247, -2934,  2, 2
movTexTris -389,  775, -2934,  4, 2
movTexTris -390, 2555, -2934,  7, 2
movTexTris -430, 5248, -2934, 11, 2
movTexEnd
.hword 0 # alignment?

glabel lll_dl_lavafall_volcano # 0x070288C8 - 0x07028960
gsSP2Triangles 15, 14,  9, 0x0,  4,  9,  3, 0x0
gsSP2Triangles  9, 14,  8, 0x0,  9,  8,  3, 0x0
gsSP2Triangles 14, 13,  8, 0x0,  8, 13,  7, 0x0
gsSP2Triangles  8,  7,  2, 0x0,  8,  2,  3, 0x0
gsSP2Triangles 10,  6,  7, 0x0, 13, 10,  7, 0x0
gsSP2Triangles 13, 12, 10, 0x0, 12, 11, 10, 0x0
gsSP2Triangles 10, 11,  5, 0x0,  6, 10,  5, 0x0
gsSP2Triangles  6,  5,  0, 0x0,  6,  0,  1, 0x0
gsSP2Triangles  2,  6,  1, 0x0,  7,  6,  2, 0x0
gsSPEndDisplayList
