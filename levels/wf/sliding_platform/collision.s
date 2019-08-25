.balign 4
glabel wf_seg7_collision_sliding_brick_platform # 0x0700FAA4 - 0x0700FAEC
colInit
colVertexInit 0x6
colVertex 256, 0, 256
colVertex 256, -50, -255
colVertex 256, 0, -255
colVertex 256, -50, 256
colVertex -255, 0, -255
colVertex -255, 0, 256
colTriInit SURFACE_DEFAULT, 4
colTri 0, 1, 2
colTri 0, 3, 1
colTri 0, 4, 5
colTri 0, 2, 4
colTriStop
colEnd
