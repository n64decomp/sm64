.balign 4
glabel wf_seg7_collision_bullet_bill_cannon # 0x07010260 - 0x070102D8
colInit
colVertexInit 0x8
colVertex -127, 0, -127
colVertex 128, 256, -127
colVertex 128, 0, -127
colVertex 128, 256, 179
colVertex 128, 0, 179
colVertex -127, 256, -127
colVertex -127, 256, 179
colVertex -127, 0, 179
colTriInit SURFACE_DEFAULT, 10
colTri 0, 1, 2
colTri 2, 1, 3
colTri 2, 3, 4
colTri 0, 5, 1
colTri 5, 3, 1
colTri 5, 6, 3
colTri 4, 3, 6
colTri 4, 6, 7
colTri 7, 6, 5
colTri 7, 5, 0
colTriStop
colEnd
