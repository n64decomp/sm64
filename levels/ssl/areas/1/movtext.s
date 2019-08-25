ssl_movtex_puddle_water_data: # 0x07012758 - 0x07012778
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale     3
movTex4BoxTris -6911, -7167
movTex4BoxTris -6911, -4607
movTex4BoxTris -4223, -4607
movTex4BoxTris -4223, -7167
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel ssl_movtex_puddle_water # 0x07012778
movTexJump 0, ssl_movtex_puddle_water_data
movTexEndLoad
movTexEndJump

ssl_movtex_toxbox_quicksand_large_mist: # 0x07012788 - 0x070127A8
movTexInitLoad     1
movTexRotSpeed    40
movTexRotScale     2
movTex4BoxTris  1024, -7065
movTex4BoxTris  1024,  -716
movTex4BoxTris  7578,  -716
movTex4BoxTris  7578, -7065
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER # vertex shaded to another color
movTexEnd

ssl_movtex_toxbox_quicksand_short_mist: # 0x070127A8 - 0x070127C8
movTexInitLoad     1
movTexRotSpeed    40
movTexRotScale     2
movTex4BoxTris -3993, -7065
movTex4BoxTris -3993, -4197
movTex4BoxTris  1024, -4197
movTex4BoxTris  1024, -7065
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER # vertex shaded to another color
movTexEnd

glabel ssl_movtex_toxbox_quicksand_mist # 0x070127C8 - 0x070127E0
movTexJump 51, ssl_movtex_toxbox_quicksand_large_mist
movTexJump 52, ssl_movtex_toxbox_quicksand_short_mist
movTexEndLoad
movTexEndJump

glabel ssl_dl_quicksand_begin # 0x070127E0
gsSPBranchList ssl_dl_quicksand_pit_begin

glabel ssl_dl_quicksand_end # 0x070127E8
gsSPBranchList ssl_dl_quicksand_pit_end

glabel ssl_movtex_tris_pyramid_quicksand # 0x070127F0 - 0x070128B8
movTexSpd        20
movTexRotTris -4096, -256,  1024,  23, 123, -15, 0, 0
movTexRotTris     0, -256,  1024, -15, 123, -23, 0, 2
movTexRotTris     0, -256, -3072, -23, 123,  15, 0, 4
movTexRotTris -4096, -256, -3072,  17, 123,  23, 0, 2
movTexRotTris -4096,    0,  2048,  17, 123, -21, 1, 0
movTexRotTris     0,    0,  2048,  -6, 126, -12, 1, 2
movTexRotTris  1024,    0,  1024, -14, 126,   2, 1, 2
movTexRotTris  1024,    0, -3072,  -6, 125, -16, 1, 4
movTexRotTris     0,    0, -4096,   7, 125, -15, 1, 4
movTexRotTris -4096,    0, -4096,  10, 125, -12, 1, 2
movTexRotTris -5120,    0, -3072,  14, 126,   4, 1, 2
movTexRotTris -5120,    0,  1024,  12, 126,  -6, 1, 0
movTexRotEnd

glabel ssl_dl_pyramid_quicksand # 0x070128B8 - 0x07012900
gsSP2Triangles  0,  4,  1, 0x0,  1,  4,  5, 0x0
gsSP2Triangles  1,  6,  2, 0x0,  2,  6,  7, 0x0
gsSP2Triangles  2,  8,  3, 0x0,  3,  8,  9, 0x0
gsSP2Triangles  0,  3, 10, 0x0,  0, 10, 11, 0x0
gsSPEndDisplayList

glabel ssl_movtex_tris_pyramid_corners_quicksand # 0x07012900 - 0x07012A08
movTexSpd        20
movTexRotTris -4096, -256,  1024,  23, 123, -15, 0, 1
movTexRotTris     0, -256,  1024, -15, 123, -23, 0, 3
movTexRotTris     0, -256, -3072, -23, 123,  15, 0, 5
movTexRotTris -4096, -256, -3072,  17, 123,  23, 0, 3
movTexRotTris -4096,    0,  2048,  17, 123, -21, 1, 0
movTexRotTris     0,    0,  2048,  -6, 126, -12, 1, 2
movTexRotTris  1024,    0,  1024, -14, 126,   2, 1, 2
movTexRotTris  1024,    0, -3072,  -6, 125, -16, 1, 4
movTexRotTris     0,    0, -4096,   7, 125, -15, 1, 4
movTexRotTris -4096,    0, -4096,  10, 125, -12, 1, 2
movTexRotTris -5120,    0, -3072,  14, 126,   4, 1, 2
movTexRotTris -5120,    0,  1024,  12, 126,  -6, 1, 0
movTexRotTris -4608,    0,  1536,  15, 125, -14, 1, 1
movTexRotTris   512,    0,  1536, -10, 126,  -5, 1, 3
movTexRotTris   512,    0, -3584,   1, 125, -15, 1, 5
movTexRotTris -4608,    0, -3584,  12, 126,  -4, 1, 3
movTexRotEnd

glabel ssl_dl_pyramid_corners_quicksand # 0x07012A08 - 0x07012A50
gsSP2Triangles  0, 11, 12, 0x0,  0, 12,  4, 0x0
gsSP2Triangles  1,  5, 13, 0x0,  1, 13,  6, 0x0
gsSP2Triangles  2,  7, 14, 0x0,  2, 14,  8, 0x0
gsSP2Triangles  3,  9, 15, 0x0,  3, 15, 10, 0x0
gsSPEndDisplayList

glabel ssl_movtex_tris_sides_quicksand # 0x07012A50 - 0x07012B48
movTexSpd        20
movTexRotTris -8192, -512,  8704,   0, 113,  56, 0,  0
movTexRotTris -8192, -256,  8192,   0, 113,  56, 1,  0
movTexRotTris -8192,    0,  7680,   0, 106,  69, 2,  0
movTexRotTris     0, -512,  8704,   0, 113,  56, 0,  3
movTexRotTris     0, -256,  8192,   0, 113,  56, 1,  3
movTexRotTris     0,    0,  7680,   2, 122,  34, 2,  3
movTexRotTris  8704, -512,  8704,  29, 119,  29, 0,  6
movTexRotTris  8192, -256,  8192,  29, 119,  29, 1,  6
movTexRotTris  7680,    0,  7680,   6, 126,   6, 2,  6
movTexRotTris  8704, -512,     0,  56, 113,   0, 0,  9
movTexRotTris  8192, -256,     0,  56, 113,   0, 1,  9
movTexRotTris  7680,    0,     0,  20, 125,   0, 2,  9
movTexRotTris  8704, -512, -8192,  56, 113,   0, 0, 12
movTexRotTris  8192, -256, -8192,  56, 113,   0, 1, 12
movTexRotTris  7680,    0, -8192,  43, 119,   0, 2, 12
movTexRotEnd

glabel ssl_dl_sides_quicksand # 0x07012B48 - 0x07012BD0
gsSP2Triangles  2,  1,  5, 0x0,  1,  4,  5, 0x0
gsSP2Triangles  0,  3,  1, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  4,  7,  5, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  4,  3,  7, 0x0,  3,  6,  7, 0x0
gsSP2Triangles  8,  7, 11, 0x0, 11,  7, 10, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  7,  6,  9, 0x0
gsSP2Triangles 11, 10, 13, 0x0, 11, 13, 14, 0x0
gsSP2Triangles 10,  9, 13, 0x0, 13,  9, 12, 0x0
gsSPEndDisplayList
