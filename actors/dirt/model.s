# Dirt

dirt_seg3_light_0302BD68: # 0x0302BD68
.byte 0x3F, 0x19, 0x19, 0x00, 0x3F, 0x19, 0x19, 0x00

dirt_seg3_light_0302BD70: # 0x0302BD70
.byte 0xFF, 0x64, 0x64, 0x00, 0xFF, 0x64, 0x64, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

dirt_seg3_light_0302BD80: # 0x0302BD80
.byte 0x19, 0x3F, 0x19, 0x00, 0x19, 0x3F, 0x19, 0x00

dirt_seg3_light_0302BD88: # 0x0302BD88
.byte 0x64, 0xFF, 0x64, 0x00, 0x64, 0xFF, 0x64, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

dirt_seg3_light_0302BD98: # 0x0302BD98
.byte 0x19, 0x19, 0x3F, 0x00, 0x19, 0x19, 0x3F, 0x00

dirt_seg3_light_0302BDA0: # 0x0302BDA0
.byte 0x64, 0x64, 0xFF, 0x00, 0x64, 0x64, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

dirt_seg3_light_0302BDB0: # 0x0302BDB0
.byte 0x3F, 0x3F, 0x19, 0x00, 0x3F, 0x3F, 0x19, 0x00

dirt_seg3_light_0302BDB8: # 0x0302BDB8
.byte 0xFF, 0xFF, 0x64, 0x00, 0xFF, 0xFF, 0x64, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

dirt_seg3_vertex_0302BDC8: # 0x0302BDC8
vertex   -101,    -60,      0,   -130,    467,  0x00, 0x00, 0x7F, 0xFF
vertex    102,    -60,      0,    599,    467,  0x00, 0x00, 0x7F, 0xFF
vertex      0,     92,      0,    234,    -81,  0x00, 0x00, 0x7F, 0xFF

dirt_seg3_texture_0302BDF8: # 0x0302BDF8
.incbin "actors/dirt/dirt_particle.rgba16"

glabel dirt_seg3_dl_0302BFF8 # 0x0302BFF8 - 0x0302C028
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, dirt_seg3_texture_0302BDF8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPVertex dirt_seg3_vertex_0302BDC8, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C028 # 0x0302C028 - 0x0302C098
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPDisplayList dirt_seg3_dl_0302BFF8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

dirt_seg3_vertex_0302C098: # 0x0302C098
vertex    -10,      0,     10,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex     10,      0,     10,      0,      0,  0x00, 0x7F, 0x00, 0x00
vertex      0,      0,    -10,      0,      0,  0x00, 0x7F, 0x00, 0x00

dirt_seg3_vertex_0302C0C8: # 0x0302C0C8
vertex    -10,     10,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex     10,     10,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex      0,    -10,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

dirt_seg3_vertex_0302C0F8: # 0x0302C0F8
vertex      0,     -8,      0,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex    -32,     80,      0,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex     32,     80,      0,      0,      0,  0x00, 0x00, 0x81, 0x00
vertex    -52,     28,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -116,     80,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -84,    -52,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     52,     28,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     84,    -52,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    116,     80,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,    160,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF

dirt_seg3_vertex_0302C198: # 0x0302C198
vertex      0,     -8,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex    -32,     80,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex     32,     80,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex    -52,     28,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   -116,     80,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex    -84,    -52,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex     52,     28,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex     84,    -52,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex    116,     80,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex      0,    160,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

glabel dirt_seg3_dl_0302C238 # 0x0302C238 - 0x0302C298
gsSPClearGeometryMode G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C0F8, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  0,  5,  3, 0x0,  6,  7,  0, 0x0
gsSP2Triangles  2,  8,  6, 0x0,  1,  9,  2, 0x0
gsSP2Triangles  0,  3,  1, 0x0,  2,  6,  0, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C298 # 0x0302C298 - 0x0302C2B8
gsSPLight dirt_seg3_light_0302BD70, 1
gsSPLight dirt_seg3_light_0302BD68, 2
gsSPDisplayList dirt_seg3_dl_0302C238
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C2B8 # 0x0302C2B8 - 0x0302C2D8
gsSPLight dirt_seg3_light_0302BD88, 1
gsSPLight dirt_seg3_light_0302BD80, 2
gsSPDisplayList dirt_seg3_dl_0302C238
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C2D8 # 0x0302C2D8 - 0x0302C2F8
gsSPLight dirt_seg3_light_0302BDA0, 1
gsSPLight dirt_seg3_light_0302BD98, 2
gsSPDisplayList dirt_seg3_dl_0302C238
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C2F8 # 0x0302C2F8 - 0x0302C318
gsSPLight dirt_seg3_light_0302BDB8, 1
gsSPLight dirt_seg3_light_0302BDB0, 2
gsSPDisplayList dirt_seg3_dl_0302C238
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C318 # 0x0302C318 - 0x0302C378
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C198, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  0,  5,  3, 0x0,  6,  7,  0, 0x0
gsSP2Triangles  2,  8,  6, 0x0,  1,  9,  2, 0x0
gsSP2Triangles  0,  3,  1, 0x0,  2,  6,  0, 0x0
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C378 # 0x0302C378 - 0x0302C3B0
gsSPLight dirt_seg3_light_0302BD70, 1
gsSPLight dirt_seg3_light_0302BD68, 2
gsSPClearGeometryMode G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C098, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C3B0 # 0x0302C3B0 - 0x0302C3E8
gsSPLight dirt_seg3_light_0302BD88, 1
gsSPLight dirt_seg3_light_0302BD80, 2
gsSPClearGeometryMode G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C098, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C3E8 # 0x0302C3E8 - 0x0302C420
gsSPLight dirt_seg3_light_0302BDA0, 1
gsSPLight dirt_seg3_light_0302BD98, 2
gsSPClearGeometryMode G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C098, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C420 # 0x0302C420 - 0x0302C458
gsSPLight dirt_seg3_light_0302BDB8, 1
gsSPLight dirt_seg3_light_0302BDB0, 2
gsSPClearGeometryMode G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C098, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel dirt_seg3_dl_0302C458 # 0x0302C458 - 0x0302C480
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPVertex dirt_seg3_vertex_0302C0C8, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
