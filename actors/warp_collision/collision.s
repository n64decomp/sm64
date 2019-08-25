# Warp Collision (seems strange to put these collision in another file. Only instance of this seperation thus far. Not sure what this is doing as a file.)

glabel door_seg3_collision_0301CE78 # 0x0301CE78 - 0x0301CECC
colInit
colVertexInit 0x8
colVertex -80, 240, 30
colVertex 80, 240, 30
colVertex 80, 0, 30
colVertex -80, 0, 30
colVertex -80, 240, -30
colVertex 80, 0, -30
colVertex 80, 240, -30
colVertex -80, 0, -30

colTriInit SURFACE_DEFAULT, 4
colTri 2, 1, 0
colTri 3, 2, 0
colTri 6, 5, 4
colTri 5, 7, 4
colTriStop
colEnd

glabel lll_hexagonal_mesh_seg3_collision_0301CECC # 0x0301CECC - 0x0301CEFC
colInit
colVertexInit 0x4
colVertex -200, 0, -200
colVertex 200, 0, -200
colVertex 200, 0, 200
colVertex -200, 0, 200

colTriInit SURFACE_DEFAULT, 2
colTri 2, 1, 0
colTri 3, 2, 0
colTriStop
colEnd
