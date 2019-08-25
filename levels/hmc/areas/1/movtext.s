.balign 4

hmc_movtex_dorrie_pool_water_data: # 0x0702B8E0
movTexInitLoad     1
movTexRotSpeed    20
movTexRotScale    12
movTex4BoxTris -7628, -2559
movTex4BoxTris -7628,  7654
movTex4BoxTris   563,  7654
movTex4BoxTris   563, -2559
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel hmc_movtex_dorrie_pool_water
movTexJump 0, hmc_movtex_dorrie_pool_water_data
movTexEndLoad
movTexEndJump

hmc_movtex_toxic_maze_rot_count_clock_mist_data: # 0x0702B910
movTexInitLoad    1
movTexRotSpeed   15
movTexRotScale    3
movTex4BoxTris 1690, -6348
movTex4BoxTris 1690,   819
movTex4BoxTris 6298,   819
movTex4BoxTris 6298, -6348
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha    0x78
movTexDefine   TEXTURE_MIST
movTexEnd

hmc_movtex_toxic_maze_rot_clock_mist_data: # 0x0702B930
movTexInitLoad    1
movTexRotSpeed    8
movTexRotScale    3
movTex4BoxTris 1690, -6348
movTex4BoxTris 1690,   819
movTex4BoxTris 6298,   819
movTex4BoxTris 6298, -6348
movTexRot      ROTATE_CLOCKWISE
movTexAlpha    0xB4
movTexDefine   TEXTURE_MIST
movTexEnd

glabel hmc_movtex_toxic_maze_mist
movTexJump 50, hmc_movtex_toxic_maze_rot_count_clock_mist_data
movTexJump 51, hmc_movtex_toxic_maze_rot_clock_mist_data
movTexEndLoad
movTexEndJump
