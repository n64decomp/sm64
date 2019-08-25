.balign 4
glabel wf_seg7_collision_kickable_board # 0x0700FC7C - 0x0700FD00
colInit
colVertexInit 0x8
colVertex -96, 0, 0
colVertex -96, 1178, 77
colVertex -96, 1178, 0
colVertex 95, 1178, 77
colVertex 95, 1178, 0
colVertex 95, 0, 0
colVertex 95, 0, 77
colVertex -96, 0, 77
colTriInit SURFACE_WALL_MISC, 12
colTri 0, 1, 2
colTri 2, 1, 3
colTri 2, 3, 4
colTri 2, 4, 5
colTri 2, 5, 0
colTri 4, 3, 6
colTri 4, 6, 5
colTri 0, 7, 1
colTri 3, 1, 7
colTri 3, 7, 6
colTri 5, 6, 7
colTri 5, 7, 0
colTriStop
colEnd
