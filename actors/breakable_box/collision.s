# Breakable Box

glabel breakable_box_seg8_collision_08012D70 # 0x08012D70 - 0x08012DF4
colInit
colVertexInit 0x8
colVertex -100, 0, -100
colVertex -100, 0, 100
colVertex -100, 200, 100
colVertex 100, 0, 100
colVertex 100, 200, 100
colVertex 100, 0, -100
colVertex 100, 200, -100
colVertex -100, 200, -100

colTriInit SURFACE_CAM_NO_COL, 12
colTri 0, 1, 2
colTri 1, 3, 4
colTri 1, 4, 2
colTri 5, 3, 1
colTri 5, 1, 0
colTri 6, 4, 3
colTri 6, 3, 5
colTri 7, 4, 6
colTri 7, 2, 4
colTri 0, 2, 7
colTri 7, 6, 5
colTri 7, 5, 0
colTriStop
colEnd

.word 0
.word 0
