.balign 4 # 0x0700FA2E - 0x0700FA30

sl_movtex_snowman_water_data: # 0x0700FA30 - 0x0700FA50
movTexInitLoad     1
movTexRotSpeed     8
movTexRotScale    10
movTex4BoxTris -6194,  -409
movTex4BoxTris -6194,  4198
movTex4BoxTris   154,  4198
movTex4BoxTris   154,  -409
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha    0x96
movTexDefine   TEXTURE_WATER
movTexEnd

sl_movtex_ice_bully_water_data: # 0x0700FA50 - 0x0700FA70
movTexInitLoad     1
movTexRotSpeed     8
movTexRotScale    10
movTex4BoxTris -1279, -6143
movTex4BoxTris -1279, -3071
movTex4BoxTris  1792, -3071
movTex4BoxTris  1792, -6143
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha    0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel sl_movtex_water # 0x0700FA70 - 0x0700FA88
movTexJump 0, sl_movtex_snowman_water_data
movTexJump 1, sl_movtex_ice_bully_water_data
movTexEndLoad
movTexEndJump
