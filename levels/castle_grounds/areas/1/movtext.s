castle_grounds_movtex_moat_water_data: # 0x07010E40 - 0x07010E60
movTexInitLoad     1
movTexRotSpeed    20
movTexRotScale    15
movTex4BoxTris -7129, -7222
movTex4BoxTris -7129,   -58
movTex4BoxTris  8253,   -58
movTex4BoxTris  8253, -7222
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

castle_grounds_movtex_lake_water_data: # 0x07010E60 - 0x07010E80
movTexInitLoad    1
movTexRotSpeed   15
movTexRotScale   10
movTex4BoxTris 1024,  -58
movTex4BoxTris 1024, 8137
movTex4BoxTris 8230, 8137
movTex4BoxTris 8230,  -58
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel castle_grounds_movtex_water # 0x07010E80
movTexJump 0, castle_grounds_movtex_moat_water_data
movTexJump 1, castle_grounds_movtex_lake_water_data
movTexEndLoad
movTexEndJump

glabel castle_grounds_movtex_tris_waterfall
movTexSpd     70
movTexTris -4469, -800, -6413, 0, 0
movTexTris -5525, 1171, -7026, 2, 0
movTexTris -6292, 2028, -7463, 4, 0
movTexTris -7302, 2955, -7461, 6, 0
movTexTris -4883, -800, -5690, 0, 3
movTexTris -5547, 1110, -6097, 2, 3
movTexTris -6732, 2587, -6770, 4, 3
movTexTris -7603, 3004, -7160, 6, 3
movTexTris -5580, -800, -4740, 0, 6
movTexTris -6205, 1068, -5347, 2, 6
movTexTris -7249, 2566, -6192, 4, 6
movTexTris -6895, -800, -4714, 0, 9
movTexTris -7201, 1083, -5071, 2, 9
movTexTris -7578, 2042, -5766, 4, 9
movTexTris -8132, 2961, -6761, 6, 9

glabel castle_grounds_dl_waterfall # 0x07010F30 - 0x07010FC0
gsSP2Triangles  0,  1,  5, 0x0,  0,  5,  4, 0x0
gsSP2Triangles  1,  2,  6, 0x0,  1,  6,  5, 0x0
gsSP2Triangles  2,  3,  6, 0x0,  3,  7,  6, 0x0
gsSP2Triangles  4,  5,  9, 0x0,  4,  9,  8, 0x0
gsSP2Triangles  5,  6,  9, 0x0,  6, 10,  9, 0x0
gsSP2Triangles  6,  7, 10, 0x0,  8,  9, 12, 0x0
gsSP2Triangles  8, 12, 11, 0x0,  9, 10, 13, 0x0
gsSP2Triangles  9, 13, 12, 0x0, 10,  7, 14, 0x0
gsSP1Triangle 10, 14, 13, 0x0
gsSPEndDisplayList
