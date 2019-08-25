thi_movtex_area2_short_side_water_data: # 0x0700E33C
movTexInitLoad     1
movTexRotSpeed     3
movTexRotScale     3
movTex4BoxTris -2457, -2457
movTex4BoxTris -2457,  1874
movTex4BoxTris -1535,  1874
movTex4BoxTris -1535, -2457
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

thi_movtex_area2_large_side_water_data: # 0x0700E35C
movTexInitLoad     1
movTexRotSpeed     3
movTexRotScale     3
movTex4BoxTris -1381,  1352
movTex4BoxTris -1381,  2458
movTex4BoxTris  2089,  2458
movTex4BoxTris  2089,  1352
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

thi_movtex_area2_mountain_top_water_data: # 0x0700E37C
movTexInitLoad     1
movTexRotSpeed     3
movTexRotScale     3
movTex4BoxTris  -306,  -766
movTex4BoxTris  -306,  -152
movTex4BoxTris   307,  -152
movTex4BoxTris   307,  -766
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel thi_movtex_area2_water # 0x0700E39C
movTexJump 0, thi_movtex_area2_short_side_water_data
movTexJump 1, thi_movtex_area2_large_side_water_data
movTexJump 2, thi_movtex_area2_mountain_top_water_data
movTexEndLoad
movTexEndJump
