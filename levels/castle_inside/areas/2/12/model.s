inside_castle_seg7_light_07051A38: # 0x07051A38 - 0x07051A40
.byte 0x47, 0x3F, 0x17, 0x00, 0x47, 0x3F, 0x17, 0x00

inside_castle_seg7_light_07051A40: # 0x07051A40 - 0x07051A50
.byte 0xBF, 0xAA, 0x3F, 0x00, 0xBF, 0xAA, 0x3F, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_07051A50: # 0x07051A50 - 0x07051B10
vertex      0,   2611,   7130,      0,      0,  0x72, 0x00, 0xC9, 0x80
vertex      0,   2253,   7130,      0,      0,  0x72, 0x00, 0xC9, 0x80
vertex    -50,   2253,   7027,      0,      0,  0x72, 0x00, 0xC9, 0x80
vertex    -50,   2611,   7027,      0,      0,  0x72, 0x00, 0xC9, 0x80
vertex    -50,   2611,   7027,      0,      0,  0x00, 0x00, 0x81, 0x80
vertex    -50,   2253,   7027,      0,      0,  0x00, 0x00, 0x81, 0x80
vertex   -357,   2253,   7027,      0,      0,  0x00, 0x00, 0x81, 0x80
vertex   -357,   2611,   7027,      0,      0,  0x00, 0x00, 0x81, 0x80
vertex   -357,   2611,   7027,      0,      0,  0x8F, 0x00, 0xC7, 0x80
vertex   -357,   2253,   7027,      0,      0,  0x8F, 0x00, 0xC7, 0x80
vertex   -409,   2253,   7130,      0,      0,  0x8F, 0x00, 0xC7, 0x80
vertex   -409,   2611,   7130,      0,      0,  0x8F, 0x00, 0xC7, 0x80

inside_castle_seg7_dl_07051B10: # 0x07051B10 - 0x07051B60
gsSPLight inside_castle_seg7_light_07051A40, 1
gsSPLight inside_castle_seg7_light_07051A38, 2
gsSPVertex inside_castle_seg7_vertex_07051A50, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07051B60 # 0x07051B60 - 0x07051B88
gsDPPipeSync
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPDisplayList inside_castle_seg7_dl_07051B10
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
