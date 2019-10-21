# Checkerboard Platform

glabel checkerboard_platform_seg8_collision_0800D710 # 0x0800D710 - 0x0800D794
colInit
colVertexInit 0x8
colVertex 256, -25, -153
colVertex 256, 26, -153
colVertex 256, 26, 154
colVertex -255, 26, -153
colVertex -255, 26, 154
colVertex -255, -25, -153
colVertex -255, -25, 154
colVertex 256, -25, 154

colTriInit SURFACE_WALL_MISC, 12
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
