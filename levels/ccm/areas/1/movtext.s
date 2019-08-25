.balign 4

ccm_movtex_penguin_puddle_water_data: # 0x070166E8
movTexInitLoad    1
movTexRotSpeed    5
movTexRotScale    2
movTex4BoxTris 3137, 4228
movTex4BoxTris 3137, 4945
movTex4BoxTris 3925, 4945
movTex4BoxTris 3925, 4228
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha    0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel ccm_movtex_penguin_puddle_water # 0x07016708 - 0x07016718
movTexJump 0, ccm_movtex_penguin_puddle_water_data
movTexEndLoad
movTexEndJump
