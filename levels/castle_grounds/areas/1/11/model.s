# TODO: what is this? 0700C4C0-0700C4C8 [8,8]
.word 0, 0

castle_grounds_seg7_light_0700C4C8: # 0x0700C4C8 - 0x0700C4D0
.byte 0x66, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00

castle_grounds_seg7_light_0700C4D0: # 0x0700C4D0 - 0x0700C4E0
.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

castle_grounds_seg7_light_0700C4E0: # 0x0700C4E0 - 0x0700C4E8
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

castle_grounds_seg7_light_0700C4E8: # 0x0700C4E8 - 0x0700C4F8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# TODO: what is this? 0700C4F8-0700C500 [8,8]
.word 0, 0

castle_grounds_seg7_vertex_0700C500: # 0x0700C500 - 0x0700C530
vertex      0,      0,     75,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    287,      0,      0,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,    -74,      0,      0,  0x00, 0x7F, 0x00, 0x00

castle_grounds_seg7_vertex_0700C530: # 0x0700C530 - 0x0700C570
vertex      0,      0,    150,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    287,      0,     75,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    287,      0,    -74,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,   -149,      0,      0,  0x00, 0x7F, 0x00, 0xFF

castle_grounds_seg7_vertex_0700C570: # 0x0700C570 - 0x0700C5B0
vertex      0,      0,    240,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    345,      0,    150,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    345,      0,   -149,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,   -239,      0,      0,  0x00, 0x7F, 0x00, 0xFF

castle_grounds_seg7_vertex_0700C5B0: # 0x0700C5B0 - 0x0700C5F0
vertex      0,      0,    360,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    460,      0,    240,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    460,      0,   -239,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,   -359,      0,      0,  0x00, 0x7F, 0x00, 0xFF

castle_grounds_seg7_vertex_0700C5F0: # 0x0700C5F0 - 0x0700C640
vertex    460,      0,   -359,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,   -479,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,      0,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,    480,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    460,      0,    360,      0,      0,  0x00, 0x7F, 0x00, 0xFF

castle_grounds_seg7_vertex_0700C640: # 0x0700C640 - 0x0700C670
vertex    460,      0,    360,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    460,      0,   -359,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,      0,      0,      0,  0x00, 0x7F, 0x00, 0x00

glabel castle_grounds_seg7_dl_0700C670 # 0x0700C670 - 0x0700C6A8
gsSPClearGeometryMode G_CULL_BACK
gsSPLight castle_grounds_seg7_light_0700C4D0, 1
gsSPLight castle_grounds_seg7_light_0700C4C8, 2
gsSPVertex castle_grounds_seg7_vertex_0700C500, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700C6A8 # 0x0700C6A8 - 0x0700C6E8
gsSPClearGeometryMode G_CULL_BACK
gsSPLight castle_grounds_seg7_light_0700C4D0, 1
gsSPLight castle_grounds_seg7_light_0700C4C8, 2
gsSPVertex castle_grounds_seg7_vertex_0700C530, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700C6E8 # 0x0700C6E8 - 0x0700C728
gsSPClearGeometryMode G_CULL_BACK
gsSPLight castle_grounds_seg7_light_0700C4D0, 1
gsSPLight castle_grounds_seg7_light_0700C4C8, 2
gsSPVertex castle_grounds_seg7_vertex_0700C570, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700C728 # 0x0700C728 - 0x0700C768
gsSPClearGeometryMode G_CULL_BACK
gsSPLight castle_grounds_seg7_light_0700C4D0, 1
gsSPLight castle_grounds_seg7_light_0700C4C8, 2
gsSPVertex castle_grounds_seg7_vertex_0700C5B0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700C768 # 0x0700C768 - 0x0700C7C8
gsSPClearGeometryMode G_CULL_BACK
gsSPLight castle_grounds_seg7_light_0700C4E8, 1
gsSPLight castle_grounds_seg7_light_0700C4E0, 2
gsSPVertex castle_grounds_seg7_vertex_0700C5F0, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSPLight castle_grounds_seg7_light_0700C4D0, 1
gsSPLight castle_grounds_seg7_light_0700C4C8, 2
gsSPVertex castle_grounds_seg7_vertex_0700C640, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList
