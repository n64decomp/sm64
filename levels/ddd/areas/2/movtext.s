ddd_movtex_area2_water_data: # 0x0700FCC4
movTexInitLoad     2
movTexRotSpeed    20   # area 2 general water
movTexRotSpeed    20
movTex4BoxTris     0, -5119
movTex4BoxTris     0,  7168
movTex4BoxTris  8192,  7168
movTex4BoxTris  8192, -5119
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0xA0
movTexDefine   TEXTURE_WATER
movTexEnd
movTexRotSpeed     0   # entrance to area 1 water
movTexRotSpeed     5
movTex4BoxTris -6144,  -768
movTex4BoxTris -6144,   768
movTex4BoxTris -2048,   768
movTex4BoxTris -2048,  -768
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0xA0
movTexDefine   TEXTURE_WATER
movTexEnd

glabel ddd_movtex_area2_water # 0x0700FD00
movTexJump 0, ddd_movtex_area2_water_data
movTexEndLoad
movTexEndJump
