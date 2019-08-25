.balign 4
glabel wf_seg7_collision_trapezoid # 0x0700FB1C - 0x0700FB94
colInit
colVertexInit 0x8
colVertex -214, 102, -204
colVertex -214, 0, -204
colVertex -504, 0, 85
colVertex -504, 102, 85
colVertex 215, 102, -204
colVertex 505, 0, 85
colVertex 505, 102, 85
colVertex 215, 0, -204
colTriInit SURFACE_DEFAULT, 10
colTri 0, 1, 2
colTri 0, 2, 3
colTri 4, 0, 3
colTri 5, 2, 1
colTri 3, 2, 5
colTri 3, 5, 6
colTri 4, 3, 6
colTri 5, 1, 7
colTri 6, 5, 7
colTri 6, 7, 4
colTriStop
colEnd
