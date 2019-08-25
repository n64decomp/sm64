ddd_movtex_area1_water_data: # 0x0700FC78
movTexInitLoad     2
movTexRotSpeed    20   # area 1 general water
movTexRotScale    20
movTex4BoxTris -7167, -4095
movTex4BoxTris -7167,  4096
movTex4BoxTris  1024,  4096
movTex4BoxTris  1024, -4095
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0xA0
movTexDefine   TEXTURE_WATER
movTexEnd
movTexRotSpeed     0   # entrance to area 2 water
movTexRotScale     5
movTex4BoxTris  2048,  -768
movTex4BoxTris  2048,   768
movTex4BoxTris  6144,   768
movTex4BoxTris  6144,  -768
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0xA0
movTexDefine   TEXTURE_WATER
movTexEnd

glabel ddd_movtex_area1_water # 0x0700FCB4
movTexJump 0, ddd_movtex_area1_water_data
movTexEndLoad
movTexEndJump
