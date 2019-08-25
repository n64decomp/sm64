glabel bowser_2_seg7_collision_lava # 0x070019F0 - 0x07001A66
colInit
colVertexInit 0x8
colVertex -2776, -1023, -6479
colVertex -6545, -1023, -2617
colVertex -6479, -1023, 2777
colVertex 6480, -1023, -2776
colVertex 2618, -1023, -6545
colVertex -2617, -1023, 6546
colVertex 6546, -1023, 2618
colVertex 2777, -1023, 6480
colTriInit SURFACE_BURNING, 6
colTri 0, 1, 2
colTri 0, 3, 4
colTri 0, 2, 5
colTri 0, 6, 3
colTri 0, 7, 6
colTri 0, 5, 7
colTriStop
colSpecialInit 2
special_object /*preset*/ special_null_start, /*pos*/  0, 1229,     0, /*yaw*/ 128 # unused, probably an early way to set intial position
special_object /*preset*/ special_bowser,     /*pos*/ -8, 1229, -1418
colEnd
