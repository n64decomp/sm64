# Whomp

glabel whomp_seg6_collision_06020A0C # 0x06020A0C - 0x06020A90
.ifdef VERSION_JP
colInit
colVertexInit 0x8
colVertex -200, 50, -100
colVertex 150, 50, -100
colVertex 150, 430, -100
colVertex -200, 430, -100
colVertex -200, 50, -3
colVertex 150, 430, -3
colVertex 150, 50, -3
colVertex -200, 430, -3

.else

colInit
colVertexInit 0x8
colVertex -150, 50, -100
colVertex 150, 50, -100
colVertex 150, 430, -100
colVertex -150, 430, -100
colVertex -150, 50, -3
colVertex 150, 430, -3
colVertex 150, 50, -3
colVertex -150, 430, -3
.endif

colTriInit SURFACE_CAM_NO_COL, 12
colTri 2, 1, 0
colTri 3, 2, 0
colTri 6, 5, 4
colTri 5, 7, 4
colTri 7, 5, 3
colTri 5, 2, 3
colTri 6, 4, 0
colTri 1, 6, 0
colTri 5, 1, 2
colTri 6, 1, 5
colTri 0, 7, 3
colTri 0, 4, 7
colTriStop
colEnd

.word 0
