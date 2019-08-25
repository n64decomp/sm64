jrb_movtex_sinked_boat_water_data: # 0x0701137C
movTexInitLoad     1
movTexRotSpeed    20
movTexRotScale     6
movTex4BoxTris -4095, -4095
movTex4BoxTris -4095,  4096
movTex4BoxTris  4096,  4096
movTex4BoxTris  4096, -4095
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0xB4
movTexDefine   TEXTURE_JRB_WATER
movTexEnd

glabel jrb_movtex_sinked_boat_water # 0x0701139C
movTexJump 0, jrb_movtex_sinked_boat_water_data
movTexEndLoad
movTexEndJump
