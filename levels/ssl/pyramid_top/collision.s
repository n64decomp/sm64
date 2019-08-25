.balign 4
glabel ssl_seg7_collision_pyramid_top # 0x070125F4 - 0x07012642
colInit
colVertexInit 0x5
colVertex -511, -255, 512
colVertex 512, -255, -511
colVertex 512, -255, 512
colVertex 0, 256, 0
colVertex -511, -255, -511
colTriInit SURFACE_HARD_SLIP, 6
colTri 0, 1, 2
colTri 0, 2, 3
colTri 2, 1, 3
colTri 0, 4, 1
colTri 1, 4, 3
colTri 4, 0, 3
colTriStop
colEnd
