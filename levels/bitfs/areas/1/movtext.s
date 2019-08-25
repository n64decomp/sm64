.balign 4

glabel bitfs_movtex_tris_lava_first_section # 0x07015AF0 - 0x07015B1C
movTexSpd   2
movTexTris -7450,   205,  1050, 0, 0
movTexTris  4838,   205,  1050, 6, 0
movTexTris  4838,   205, -1108, 6, 2
movTexTris -7450,   205, -1108, 0, 2
movTexEnd

glabel bitfs_movtex_tris_lava_second_section # 0x07015B1C - 0x07015B48
movTexSpd  -3
movTexTris -4531,  3487,  1050, 0, 0
movTexTris  5658,  3487,  1050, 6, 0
movTexTris  5658,  3487, -1108, 6, 2
movTexTris -4531,  3487, -1108, 0, 2
movTexEnd

glabel bitfs_movtex_tris_lava_floor # 0x07015B48 - 0x07015BA8
movTexSpd  -2
movTexTris  8191, -3067,  8192, 0, 0
movTexTris     0, -3067,  8192, 0, 2
movTexTris -8191, -3067,  8192, 0, 4
movTexTris  8191, -3067,     0, 2, 0
movTexTris     0, -3067,     0, 2, 2
movTexTris -8191, -3067,     0, 2, 4
movTexTris  8191, -3067, -8192, 4, 0
movTexTris     0, -3067, -8192, 4, 2
movTexTris -8191, -3067, -8192, 4, 4
movTexEnd

glabel bitfs_dl_lava_sections # 0x07015BA8 - 0x07015BC0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bitfs_dl_lava_floor # 0x07015BC0 - 0x07015C08
gsSP2Triangles  0,  3,  1, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  4,  7,  5, 0x0,  5,  7,  8, 0x0
gsSPEndDisplayList
