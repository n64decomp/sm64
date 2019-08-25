sl_seg7_light_0700A910: # 0x0700A910 - 0x0700A918
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

sl_seg7_light_0700A918: # 0x0700A918 - 0x0700A928
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

sl_seg7_vertex_0700A928: # 0x0700A928 - 0x0700A958
vertex     -8,      0,      5,      0,      0,  0x00, 0x7F, 0x00, 0x64
vertex      9,      0,      5,      0,      0,  0x00, 0x7F, 0x00, 0x64
vertex      0,      0,     -9,      0,      0,  0x00, 0x7F, 0x00, 0x64

sl_seg7_dl_0700A958: # 0x0700A958 - 0x0700A980
gsSPLight sl_seg7_light_0700A918, 1
gsSPLight sl_seg7_light_0700A910, 2
gsSPVertex sl_seg7_vertex_0700A928, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_0700A980 # 0x0700A980 - 0x0700A9B0
gsDPPipeSync
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPDisplayList sl_seg7_dl_0700A958
gsDPPipeSync
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
