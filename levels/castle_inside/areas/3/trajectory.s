inside_castle_seg7_trajectory_mips_0: # 0x07078EF8 - 0x07078F2C
trajectory_init
trajectory_pos /*pos*/ -1831, -1177, -1178
trajectory_pos /*pos*/ -1810, -1177,   284
trajectory_pos /*pos*/ -2210, -1192,   715
trajectory_pos /*pos*/ -3505, -1279,   715
trajectory_pos /*pos*/ -3968, -1279,   -31
trajectory_pos /*pos*/ -4021, -1381, -1242
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_1: # 0x07078F2C - 0x07078F68
trajectory_init
trajectory_pos /*pos*/ -3674, -1379,  -962
trajectory_pos /*pos*/ -3813, -1279,   -41
trajectory_pos /*pos*/ -3628, -1279,   755
trajectory_pos /*pos*/ -2210, -1192,   715
trajectory_pos /*pos*/ -1810, -1177,   284
trajectory_pos /*pos*/ -1842, -1177, -1078
trajectory_pos /*pos*/ -1604, -1177, -1445
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_2: # 0x07078F68 - 0x07078F7C
trajectory_init
trajectory_pos /*pos*/ -1463, -1210, -2231
trajectory_pos /*pos*/ -1515, -1279, -3094
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_3: # 0x07078F7C - 0x07078FA8
trajectory_init
trajectory_pos /*pos*/ -2019, -1279, -3077
trajectory_pos /*pos*/ -2559, -1279, -3043
trajectory_pos /*pos*/ -2957, -1279, -2747
trajectory_pos /*pos*/ -3031, -1262, -1947
trajectory_pos /*pos*/ -2846, -1262, -1321
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_4: # 0x07078FA8 - 0x07078FD4
trajectory_init
trajectory_pos /*pos*/ -3005, -1197, -1874
trajectory_pos /*pos*/ -2967, -1279, -2582
trajectory_pos /*pos*/ -2559, -1279, -3043
trajectory_pos /*pos*/ -1984, -1262, -3068
trajectory_pos /*pos*/ -1432, -1262, -3038
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_5: # 0x07078FD4 - 0x07078FE8
trajectory_init
trajectory_pos /*pos*/ -1387, -1254, -2541
trajectory_pos /*pos*/ -1541, -1177, -1446
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_6: # 0x07078FE8 - 0x07079004
trajectory_init
trajectory_pos /*pos*/  -894, -1223, -1421
trajectory_pos /*pos*/  -306, -1279, -1601
trajectory_pos /*pos*/  -192, -1279, -2196
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_7: # 0x07079004 - 0x07079020
trajectory_init
trajectory_pos /*pos*/  -187, -1279, -1662
trajectory_pos /*pos*/  -805, -1238, -1406
trajectory_pos /*pos*/ -1549, -1177, -1446
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_8: # 0x07079020 - 0x07079044
trajectory_init
trajectory_pos /*pos*/ -1092, -1279, -3188
trajectory_pos /*pos*/  -593, -1279, -3175
trajectory_pos /*pos*/  -200, -1279, -2940
trajectory_pos /*pos*/  -216, -1279, -2139
trajectory_end

.balign 4
inside_castle_seg7_trajectory_mips_9: # 0x07079044 - 0x07079068
trajectory_init
trajectory_pos /*pos*/  -214, -1279, -2432
trajectory_pos /*pos*/  -160, -1283, -2900
trajectory_pos /*pos*/  -640, -1283, -3220
trajectory_pos /*pos*/ -1469, -1279, -3108
trajectory_end

.balign 4
glabel inside_castle_seg7_trajectory_mips # 0x07079068 - 0x07079090
.word inside_castle_seg7_trajectory_mips_0, inside_castle_seg7_trajectory_mips_1
.word inside_castle_seg7_trajectory_mips_2, inside_castle_seg7_trajectory_mips_3
.word inside_castle_seg7_trajectory_mips_4, inside_castle_seg7_trajectory_mips_5
.word inside_castle_seg7_trajectory_mips_6, inside_castle_seg7_trajectory_mips_7
.word inside_castle_seg7_trajectory_mips_8, inside_castle_seg7_trajectory_mips_9
