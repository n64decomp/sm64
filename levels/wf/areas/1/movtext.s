wf_movtex_water_data: # 0x07011DE8
movTexInitLoad     1
movTexRotSpeed    10
movTexRotScale    10
movTex4BoxTris -1023, 1024
movTex4BoxTris -1023, 4096
movTex4BoxTris  3226, 4096
movTex4BoxTris  3226, 1024
movTexRot      ROTATE_CLOCKWISE
movTexAlpha     0x78
movTexDefine   TEXTURE_WATER
movTexEnd

glabel wf_movtex_water # 0x7011E08
movTexJump 0, wf_movtex_water_data
movTexEndLoad
movTexEndJump
