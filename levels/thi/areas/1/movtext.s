.balign 4

thi_movtex_area1_short_side_water_data: # 0x0700E2BC
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale    10
movTex4BoxTris -8191, -8191
movTex4BoxTris -8191,  6246
movTex4BoxTris -5119,  6246
movTex4BoxTris -5119, -8191
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

thi_movtex_area1_large_side_water_data: # 0x0700E2DC
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale    10
movTex4BoxTris -4607,  4506
movTex4BoxTris -4607,  8192
movTex4BoxTris  6963,  8192
movTex4BoxTris  6963,  4506
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

thi_movtex_area1_mountain_top_water_data: # 0x0700E2FC
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale    10
movTex4BoxTris -1023, -2555
movTex4BoxTris -1023,  -507
movTex4BoxTris  1024,  -507
movTex4BoxTris  1024, -2555
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel thi_movtex_area1_water # 0x0700E31C
movTexJump 0, thi_movtex_area1_short_side_water_data
movTexJump 1, thi_movtex_area1_large_side_water_data
movTexJump 2, thi_movtex_area1_mountain_top_water_data
movTexEndLoad
movTexEndJump
