# Capswitch

glabel capswitch_collision_050033D0
colInit
colVertexInit 0x8
colVertex 292, 0, 254
colVertex 292, 0, -253
colVertex 292, 353, -253
colVertex -291, 0, -253
colVertex -291, 353, -253
colVertex -291, 0, 254
colVertex -291, 353, 254
colVertex 292, 353, 254

colTriInit SURFACE_SWITCH, 10
colTri 0, 1, 2
colTri 1, 3, 4
colTri 1, 4, 2
colTri 3, 5, 6
colTri 3, 6, 4
colTri 2, 4, 6
colTri 0, 2, 7
colTri 2, 6, 7
colTri 5, 7, 6
colTri 5, 0, 7
colTriStop
colEnd

glabel capswitch_collision_05003448
colInit
colVertexInit 0x8
colVertex 292, 0, 254
colVertex 292, 0, -253
colVertex 292, 145, -253
colVertex -291, 0, -253
colVertex -291, 145, -253
colVertex -291, 0, 254
colVertex -291, 145, 254
colVertex 292, 145, 254

colTriInit SURFACE_SWITCH, 10
colTri 0, 1, 2
colTri 1, 3, 4
colTri 1, 4, 2
colTri 3, 5, 6
colTri 3, 6, 4
colTri 2, 4, 6
colTri 0, 2, 7
colTri 2, 6, 7
colTri 5, 7, 6
colTri 5, 0, 7
colTriStop
colEnd
