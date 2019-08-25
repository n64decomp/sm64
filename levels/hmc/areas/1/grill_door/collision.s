glabel hmc_seg7_collision_0702B65C # 0x0702B65C - 0x0702B6E0
.ifdef VERSION_JP
colInit
colVertexInit 0x8
colVertex 410, 0, 51
colVertex 410, 819, -50
colVertex 410, 819, 51
colVertex 0, 819, 51
colVertex 0, 0, 51
colVertex 0, 819, -50
colVertex 410, 0, -50
colVertex 0, 0, -50
colTriInit SURFACE_DEFAULT, 12
colTri 0, 1, 2
colTri 2, 3, 4
colTri 2, 4, 0
colTri 2, 1, 5
colTri 2, 5, 3
colTri 6, 5, 1
colTri 0, 6, 1
colTri 6, 7, 5
colTri 3, 5, 7
colTri 3, 7, 4
colTri 4, 7, 6
colTri 4, 6, 0
colTriStop
colEnd
.else
colInit
colVertexInit 0x8
colVertex 410, 0, 51
colVertex 410, 719, -50 # 819 changed to 719 in non-JP builds
colVertex 410, 719, 51
colVertex 0, 719, 51
colVertex 0, 0, 51
colVertex 0, 719, -50
colVertex 410, 0, -50
colVertex 0, 0, -50
colTriInit SURFACE_DEFAULT, 12
colTri 0, 1, 2
colTri 2, 3, 4
colTri 2, 4, 0
colTri 2, 1, 5
colTri 2, 5, 3
colTri 6, 5, 1
colTri 0, 6, 1
colTri 6, 7, 5
colTri 3, 5, 7
colTri 3, 7, 4
colTri 4, 7, 6
colTri 4, 6, 0
colTriStop
colEnd
.endif
