# This file only has a collision entry and no model. It may have been some sort of
# collision hitbox for an object that didn't have a model.

# TODO: this appears to be a lid for an unused box
.balign 4
glabel jrb_seg7_collision_0700D1DC # 0x0700D1DC - 0x0700D20C
colInit
colVertexInit 0x4
colVertex 123, 0, -122
colVertex -122, 0, -122
colVertex -122, 0, 123
colVertex 123, 0, 123
colTriInit SURFACE_DEFAULT, 2
colTri 0, 1, 2
colTri 0, 2, 3
colTriStop
colEnd
