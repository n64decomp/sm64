# Test Platform (small tiny platform 1/4th the size of a box. Probably used in early modeling tests?)

glabel unknown_seg8_collision_080262F8 # 0x080262F8 - 0x0802637C
colInit
colVertexInit 0x8
colVertex 200, 0, -200
colVertex 200, -100, -200
colVertex 200, -100, 200
colVertex 200, 0, 200
colVertex -200, -100, -200
colVertex -200, -100, 200
colVertex -200, 0, -200
colVertex -200, 0, 200

colTriInit SURFACE_DEFAULT, 12
colTri 2, 1, 0
colTri 3, 2, 0
colTri 1, 2, 4
colTri 2, 5, 4
colTri 0, 1, 4
colTri 6, 0, 4
colTri 4, 5, 6
colTri 5, 7, 6
colTri 3, 0, 6
colTri 7, 3, 6
colTri 2, 3, 5
colTri 3, 7, 5
colTriStop
colEnd
