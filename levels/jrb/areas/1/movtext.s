.balign 4

jrb_movtex_water_data: # 0x0700D28C - 0x0700D2AC
movTexInitLoad     1
movTexRotSpeed    20
movTexRotScale     6
movTex4BoxTris -6304,  -669
movTex4BoxTris -6304,  7814
movTex4BoxTris  7992,  7814
movTex4BoxTris  7992,  -669
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0xB4
movTexDefine   TEXTURE_JRB_WATER
movTexEnd

jrb_movtex_ocean_cave_water_data: # 0x0700D2AC - 0x0700D2CC
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale     2
movTex4BoxTris  4433, -4253
movTex4BoxTris  4433,  -669
movTex4BoxTris  5969,  -669
movTex4BoxTris  5969, -4253
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0xB4
movTexDefine   TEXTURE_JRB_WATER
movTexEnd

glabel jrb_movtex_water # 0x0700D2CC
movTexJump 0, jrb_movtex_water_data
movTexJump 1, jrb_movtex_ocean_cave_water_data
movTexEndLoad
movTexEndJump

jrb_movtex_intial_mist_data: # 0x0700D2E4, appears if you enter the course the first time, then it disappears when you grab the first star
movTexInitLoad     1
movTexRotSpeed    20
movTexRotScale    10
movTex4BoxTris -7818, -1125
movTex4BoxTris -7818,  7814
movTex4BoxTris  9055,  7814
movTex4BoxTris  9055, -1125
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x32
movTexDefine   TEXTURE_MIST
movTexEnd

glabel jrb_movtex_intial_mist # 0x0700D304
movTexJump 51, jrb_movtex_intial_mist_data
movTexEndLoad
movTexEndJump
