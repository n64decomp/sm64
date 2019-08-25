.balign 4
glabel lll_seg7_collision_falling_wall # 0x070284DC - 0x0702856C
colInit
colVertexInit 0xA
colVertex 307, -101, 105
colVertex 307, 614, 105
colVertex 307, -101, 703
colVertex -306, 614, 105
colVertex -306, -101, 703
colVertex -306, -101, 105
colVertex -306, -101, 3
colVertex -306, 614, 3
colVertex 307, 614, 3
colVertex 307, -101, 3
colTriInit SURFACE_DEFAULT, 12
colTri 0, 1, 2
colTri 2, 1, 3
colTri 2, 3, 4
colTri 3, 5, 4
colTri 6, 7, 8
colTri 6, 8, 9
colTri 7, 1, 8
colTri 7, 3, 1
colTri 7, 6, 5
colTri 7, 5, 3
colTri 9, 8, 1
colTri 9, 1, 0
colTriStop
colEnd
