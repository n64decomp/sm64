# Test Platform (small tiny platform 1/4th the size of a box. Probably used in early modeling tests?)

unknown_seg8_light_08026008: # 0x08026008
.byte 0x32, 0x32, 0x07, 0x00, 0x32, 0x32, 0x07, 0x00

unknown_seg8_light_08026010: # 0x08026010
.byte 0xC8, 0xC8, 0x1E, 0x00, 0xC8, 0xC8, 0x1E, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

unknown_seg8_vertex_08026020: # 0x08026020
vertex    200,   -100,    200,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex    200,   -100,   -200,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex    200,      0,   -200,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex    200,      0,    200,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex    200,   -100,    200,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex    200,      0,   -200,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex    200,   -100,   -200,      0,      0,  0x00, 0x81, 0x00, 0x00
vertex    200,   -100,    200,      0,      0,  0x00, 0x81, 0x00, 0x00
vertex   -200,   -100,   -200,      0,      0,  0x00, 0x81, 0x00, 0x00
vertex    200,   -100,    200,      0,      0,  0x00, 0x81, 0x00, 0x00
vertex   -200,   -100,    200,      0,      0,  0x00, 0x81, 0x00, 0x00
vertex   -200,   -100,   -200,      0,      0,  0x00, 0x81, 0x00, 0x00
vertex    200,      0,   -200,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex    200,   -100,   -200,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex   -200,   -100,   -200,      0,      0,  0x00, 0x00, 0x81, 0x00

unknown_seg8_vertex_08026110: # 0x08026110
vertex   -200,      0,   -200,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex    200,      0,   -200,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex   -200,   -100,   -200,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex   -200,   -100,   -200,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -200,   -100,    200,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -200,      0,   -200,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -200,   -100,    200,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -200,      0,    200,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -200,      0,   -200,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex    200,      0,    200,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    200,      0,   -200,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex   -200,      0,   -200,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex   -200,      0,    200,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex    200,      0,    200,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex   -200,      0,   -200,      0,      0,  0x00, 0x7F, 0x00, 0x00

unknown_seg8_vertex_08026200: # 0x08026200
vertex    200,   -100,    200,      0,      0,  0x00, 0x00, 0x7F, 0x00
vertex    200,      0,    200,      0,      0,  0x00, 0x00, 0x7F, 0x00
vertex   -200,   -100,    200,      0,      0,  0x00, 0x00, 0x7F, 0x00
vertex    200,      0,    200,      0,      0,  0x00, 0x00, 0x7F, 0x00
vertex   -200,      0,    200,      0,      0,  0x00, 0x00, 0x7F, 0x00
vertex   -200,   -100,    200,      0,      0,  0x00, 0x00, 0x7F, 0x00

glabel unknown_seg8_dl_08026260 # 0x08026260 - 0x080262F8
gsSPNumLights NUMLIGHTS_0 # I cannot tell if they meant to put 0 or 1 here.
gsSPLight unknown_seg8_light_08026010, 1
gsSPLight unknown_seg8_light_08026008, 2
gsSPVertex unknown_seg8_vertex_08026020, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex unknown_seg8_vertex_08026110, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex unknown_seg8_vertex_08026200, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList
