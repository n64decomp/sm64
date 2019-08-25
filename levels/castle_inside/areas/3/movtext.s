inside_castle_movtex_green_room_water_data: # 0x07079090 - 0x070790F0
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale    10
movTex4BoxTris -3225, -4146
movTex4BoxTris -3225,  -255
movTex4BoxTris   870,  -255
movTex4BoxTris   870, -4146
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_JRB_WATER
movTexEnd

inside_castle_movtex_moat_leftover_water_data: # 0x070790B0 - 0x070790D0
movTexInitLoad     1
movTexRotSpeed     5
movTexRotScale     7
movTex4BoxTris   973, -1279
movTex4BoxTris   973,   256
movTex4BoxTris  5786,   256
movTex4BoxTris  5786, -1279
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

inside_castle_movtex_moat_water_data: # 0x070790D0 - 0x07079100
movTexInitLoad     1
movTexRotSpeed     3
movTexRotScale     5
movTex4BoxTris  5786, -1330
movTex4BoxTris  5786,   410
movTex4BoxTris  8038,   410
movTex4BoxTris  8038, -1330
movTexRot      ROTATE_COUNTER_CLOCKWISE
movTexAlpha     0x96
movTexDefine   TEXTURE_WATER
movTexEnd

glabel inside_castle_movtex_green_room_water # 0x070790F0 - 0x07079100
movTexJump 0, inside_castle_movtex_green_room_water_data
movTexEndLoad
movTexEndJump

glabel inside_castle_movtex_moat_water # 0x07079100 - 0x07079118
movTexJump 1, inside_castle_movtex_moat_leftover_water_data
movTexJump 2, inside_castle_movtex_moat_water_data
movTexEndLoad
movTexEndJump
