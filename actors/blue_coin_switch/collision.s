# Blue Coin Switch

glabel blue_coin_switch_seg8_collision_08000E98 # 0x08000E98 - 0x08000F10
colInit
colVertexInit 0x8
colVertex 26, 0, 26
colVertex 26, 26, 26
colVertex -25, 26, 26
colVertex -25, 0, 26
colVertex 26, 0, -25
colVertex 26, 26, -25
colVertex -25, 26, -25
colVertex -25, 0, -25

colTriInit SURFACE_DEFAULT, 10
colTri 0, 1, 2
colTri 0, 2, 3
colTri 4, 5, 1
colTri 5, 6, 2
colTri 5, 2, 1
colTri 7, 6, 5
colTri 7, 5, 4
colTri 3, 6, 7
colTri 3, 2, 6
colTri 4, 1, 0
colTriStop
colEnd
