bbh_movtex_merry_go_round_water_entrance_data: # 0x07026DE4
movTexInitLoad     1
movTexRotSpeed     0
movTexRotScale    20
movTex4BoxTris -4812,  1485
movTex4BoxTris -4812,  7270
movTex4BoxTris   640,  7270
movTex4BoxTris   640,  1485
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

bbh_movtex_merry_go_round_water_side_data: # 0x07026E14
movTexInitLoad     1
movTexRotSpeed     0
movTexRotScale    20
movTex4BoxTris  1536, -1637
movTex4BoxTris  1536,  2662
movTex4BoxTris  3789,  2662
movTex4BoxTris  3789, -1637
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel bbh_movtex_merry_go_round_water_entrance # 0x07026E24
movTexJump 0, bbh_movtex_merry_go_round_water_entrance_data
movTexEndLoad
movTexEndJump

glabel bbh_movtex_merry_go_round_water_side # 0x07026E34
movTexJump 1, bbh_movtex_merry_go_round_water_side_data
movTexEndLoad
movTexEndJump
