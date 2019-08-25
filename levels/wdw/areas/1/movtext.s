.balign 0x8

wdw_movtex_area1_water_data: # 0x07018728
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale    10
movTex4BoxTris -3839, -3839
movTex4BoxTris -3839,  4608
movTex4BoxTris  4608,  4608
movTex4BoxTris  4608, -3839
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel wdw_movtex_area1_water # 0x07018748
movTexJump 0, wdw_movtex_area1_water_data
movTexEndLoad
movTexEndJump
