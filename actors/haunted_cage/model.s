# Haunted Cage

haunted_cage_seg5_light_0500C258: # 0x0500C258
.byte 0x39, 0x0C, 0x0E, 0x00, 0x39, 0x0C, 0x0E, 0x00

haunted_cage_seg5_light_0500C260: # 0x0500C260
.byte 0x90, 0x1E, 0x25, 0x00, 0x90, 0x1E, 0x25, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

haunted_cage_seg5_light_0500C270: # 0x0500C270
.byte 0x47, 0x47, 0x47, 0x00, 0x47, 0x47, 0x47, 0x00

haunted_cage_seg5_light_0500C278: # 0x0500C278
.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

haunted_cage_seg5_texture_0500C288: # 0x0500C288
.incbin "actors/haunted_cage/bbh_cage_floor.rgba16"

haunted_cage_seg5_texture_0500CA88: # 0x0500CA88
.incbin "actors/haunted_cage/bbh_cage_double_ornament.rgba16"

haunted_cage_seg5_texture_0500D288: # 0x0500D288
.incbin "actors/haunted_cage/bbh_cage_ornament.rgba16"

haunted_cage_seg5_texture_0500D688: # 0x0500D688
.incbin "actors/haunted_cage/bbh_cage_wooden_base.rgba16"

haunted_cage_seg5_texture_0500DA88: # 0x0500DA88
.incbin "actors/haunted_cage/bbh_cage_bars.rgba16"

# possibly garbage. does not at all appear to be a texture and is unreferenced
# also could be some sort of shader mask from much earlier in development, considering
# Big Boo's Haunt was a very very early level. (0x0500E288)
.incbin "bin/boo_seg5_unknown.0E288.bin"

haunted_cage_seg5_vertex_0500EA88: # 0x0500EA88
vertex     47,     81,      0,   6100,   2042,  0x31, 0x73, 0xF1, 0xFF
vertex     40,     81,    -22,   7122,   2042,  0x31, 0x73, 0xF1, 0xFF
vertex      0,    101,      0,   6612,     66,  0x31, 0x73, 0xF1, 0xFF
vertex     40,     81,     23,   5078,   2042,  0x31, 0x74, 0x0F, 0xFF
vertex     47,     81,      0,   6100,   2042,  0x31, 0x74, 0x0F, 0xFF
vertex      0,    101,      0,   5590,     66,  0x31, 0x74, 0x0F, 0xFF
vertex     40,     81,    -22,   7122,   2042,  0x25, 0x73, 0xDB, 0xFF
vertex     23,     81,    -39,   8144,   2042,  0x25, 0x73, 0xDB, 0xFF
vertex      0,    101,      0,   7634,     66,  0x25, 0x73, 0xDB, 0xFF
vertex     23,     81,    -39,   8144,   2042,  0x0F, 0x73, 0xCE, 0xFF
vertex      0,     81,    -46,   9166,   2042,  0x0F, 0x73, 0xCE, 0xFF
vertex      0,    101,      0,   8656,     66,  0x0F, 0x73, 0xCE, 0xFF
vertex      0,     81,    -46,   9166,   2042,  0xF1, 0x73, 0xCE, 0xFF
vertex    -22,     81,    -39,  10188,   2042,  0xF1, 0x73, 0xCE, 0xFF
vertex      0,    101,      0,   9678,     66,  0xF1, 0x73, 0xCE, 0xFF

haunted_cage_seg5_vertex_0500EB78: # 0x0500EB78
vertex    -22,     81,    -39,  10188,   2042,  0xDB, 0x73, 0xDB, 0xFF
vertex    -39,     81,    -22,  11210,   2042,  0xDB, 0x73, 0xDB, 0xFF
vertex      0,    101,      0,  10698,     66,  0xDB, 0x73, 0xDB, 0xFF
vertex    -39,     81,    -22,  11210,   2042,  0xCE, 0x73, 0xF1, 0xFF
vertex    -46,     81,      0,  12232,   2042,  0xCE, 0x73, 0xF1, 0xFF
vertex      0,    101,      0,  11722,     66,  0xCE, 0x73, 0xF1, 0xFF
vertex    -46,     81,      0,      0,   2042,  0xCE, 0x73, 0x0F, 0xFF
vertex    -39,     81,     23,    990,   2042,  0xCE, 0x73, 0x0F, 0xFF
vertex      0,    101,      0,    478,     66,  0xCE, 0x73, 0x0F, 0xFF
vertex    -39,     81,     23,    990,   2042,  0xDB, 0x73, 0x25, 0xFF
vertex    -22,     81,     40,   2012,   2042,  0xDB, 0x73, 0x25, 0xFF
vertex      0,    101,      0,   1502,     66,  0xDB, 0x73, 0x25, 0xFF
vertex    -22,     81,     40,   2012,   2042,  0xF1, 0x73, 0x31, 0xFF
vertex      0,     81,     47,   3034,   2042,  0xF1, 0x73, 0x31, 0xFF
vertex      0,    101,      0,   2524,     66,  0xF1, 0x73, 0x31, 0xFF

haunted_cage_seg5_vertex_0500EC68: # 0x0500EC68
vertex      0,     81,     47,   3034,   2042,  0x0F, 0x74, 0x31, 0xFF
vertex     23,     81,     40,   4056,   2042,  0x0F, 0x74, 0x31, 0xFF
vertex      0,    101,      0,   3546,     66,  0x0F, 0x74, 0x31, 0xFF
vertex     23,     81,     40,   4056,   2042,  0x24, 0x73, 0x24, 0xFF
vertex     40,     81,     23,   5078,   2042,  0x24, 0x73, 0x24, 0xFF
vertex      0,    101,      0,   4568,     66,  0x24, 0x73, 0x24, 0xFF

haunted_cage_seg5_vertex_0500ECC8: # 0x0500ECC8
vertex    -43,      0,    -25,  11210,    479,  0xA7, 0x00, 0xA7, 0xFF
vertex    -25,     10,    -43,  10188,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex    -25,      0,    -43,  10188,    479,  0xA7, 0x00, 0xA7, 0xFF
vertex     44,      0,    -25,   7122,    479,  0x7A, 0x00, 0xDE, 0xFF
vertex     51,     10,      0,   6100,      0,  0x7A, 0x00, 0xDE, 0xFF
vertex     51,      0,      0,   6100,    479,  0x7A, 0x00, 0xDE, 0xFF
vertex     26,      0,    -43,   8144,    479,  0x59, 0x00, 0xA7, 0xFF
vertex     44,     10,    -25,   7122,      0,  0x59, 0x00, 0xA7, 0xFF
vertex     44,      0,    -25,   7122,    479,  0x59, 0x00, 0xA7, 0xFF
vertex     44,     10,    -25,   7122,      0,  0x7A, 0x00, 0xDE, 0xFF
vertex     26,     10,    -43,   8144,      0,  0x59, 0x00, 0xA7, 0xFF
vertex     51,      0,      0,   6100,    479,  0x7A, 0x00, 0x21, 0xFF
vertex     51,     10,      0,   6100,      0,  0x7A, 0x00, 0x21, 0xFF
vertex     44,     10,     26,   5078,      0,  0x7A, 0x00, 0x21, 0xFF
vertex     44,      0,     26,   5078,    479,  0x7A, 0x00, 0x21, 0xFF

haunted_cage_seg5_vertex_0500EDB8: # 0x0500EDB8
vertex      0,      0,    -50,   9166,    479,  0x21, 0x00, 0x86, 0xFF
vertex     26,     10,    -43,   8144,      0,  0x21, 0x00, 0x86, 0xFF
vertex     26,      0,    -43,   8144,    479,  0x21, 0x00, 0x86, 0xFF
vertex      0,     10,    -50,   9166,      0,  0x21, 0x00, 0x86, 0xFF
vertex    -25,      0,    -43,  10188,    479,  0xDE, 0x00, 0x86, 0xFF
vertex      0,     10,    -50,   9166,      0,  0xDE, 0x00, 0x86, 0xFF
vertex      0,      0,    -50,   9166,    479,  0xDE, 0x00, 0x86, 0xFF
vertex    -25,     10,    -43,  10188,      0,  0xDE, 0x00, 0x86, 0xFF
vertex      0,      0,     51,   3034,    479,  0xDE, 0x00, 0x7A, 0xFF
vertex      0,     10,     51,   3034,      0,  0xDE, 0x00, 0x7A, 0xFF
vertex    -25,     10,     44,   2012,      0,  0xDE, 0x00, 0x7A, 0xFF
vertex    -43,      0,    -25,  11210,    479,  0xA7, 0x00, 0xA7, 0xFF
vertex    -43,     10,    -25,  11210,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex    -25,     10,    -43,  10188,      0,  0xA7, 0x00, 0xA7, 0xFF

haunted_cage_seg5_vertex_0500EE98: # 0x0500EE98
vertex    -50,      0,      0,  12232,    479,  0x86, 0x00, 0xDE, 0xFF
vertex    -43,     10,    -25,  11210,      0,  0x86, 0x00, 0xDE, 0xFF
vertex    -43,      0,    -25,  11210,    479,  0x86, 0x00, 0xDE, 0xFF
vertex    -50,     10,      0,  12232,      0,  0x86, 0x00, 0xDE, 0xFF
vertex    -43,      0,     26,    990,    479,  0x86, 0x00, 0x21, 0xFF
vertex    -43,     10,     26,    990,      0,  0x86, 0x00, 0x21, 0xFF
vertex    -50,     10,      0,      0,      0,  0x86, 0x00, 0x21, 0xFF
vertex    -50,      0,      0,      0,    479,  0x86, 0x00, 0x21, 0xFF
vertex    -25,      0,     44,   2012,    479,  0xA7, 0x00, 0x59, 0xFF
vertex    -43,     10,     26,    990,      0,  0xA7, 0x00, 0x59, 0xFF
vertex    -43,      0,     26,    990,    479,  0xA7, 0x00, 0x59, 0xFF
vertex    -25,     10,     44,   2012,      0,  0xA7, 0x00, 0x59, 0xFF
vertex      0,      0,     51,   3034,    479,  0xDE, 0x00, 0x7A, 0xFF
vertex    -25,     10,     44,   2012,      0,  0xDE, 0x00, 0x7A, 0xFF
vertex    -25,      0,     44,   2012,    479,  0xDE, 0x00, 0x7A, 0xFF

haunted_cage_seg5_vertex_0500EF88: # 0x0500EF88
vertex     26,      0,     44,   4056,    479,  0x21, 0x00, 0x7A, 0xFF
vertex      0,     10,     51,   3034,      0,  0x21, 0x00, 0x7A, 0xFF
vertex      0,      0,     51,   3034,    479,  0x21, 0x00, 0x7A, 0xFF
vertex     26,     10,     44,   4056,      0,  0x21, 0x00, 0x7A, 0xFF
vertex     44,      0,     26,   5078,    479,  0x59, 0x00, 0x59, 0xFF
vertex     26,     10,     44,   4056,      0,  0x59, 0x00, 0x59, 0xFF
vertex     26,      0,     44,   4056,    479,  0x59, 0x00, 0x59, 0xFF
vertex     44,     10,     26,   5078,      0,  0x59, 0x00, 0x59, 0xFF

haunted_cage_seg5_vertex_0500F008: # 0x0500F008
vertex     44,     64,    -25,   7122,    990,  0x74, 0x21, 0xDB, 0xFF
vertex     40,     81,    -22,   7122,    -72,  0x74, 0x21, 0xDB, 0xFF
vertex     47,     81,      0,   6100,    -72,  0x74, 0x21, 0xDB, 0xFF
vertex     26,     64,    -43,   8144,    990,  0x56, 0x23, 0xAA, 0xFF
vertex     40,     81,    -22,   7122,    -72,  0x56, 0x23, 0xAA, 0xFF
vertex     44,     64,    -25,   7122,    990,  0x56, 0x23, 0xAA, 0xFF
vertex     44,     64,    -25,   7122,    990,  0x77, 0x1C, 0xDF, 0xFF
vertex     47,     81,      0,   6100,    -72,  0x77, 0x1C, 0xDF, 0xFF
vertex     51,     64,      0,   6100,    990,  0x77, 0x1C, 0xDF, 0xFF
vertex     23,     81,    -39,   8144,    -72,  0x56, 0x23, 0xAA, 0xFF
vertex     51,     64,      0,   6100,    990,  0x76, 0x1B, 0x24, 0xFF
vertex     47,     81,      0,   6100,    -72,  0x76, 0x1B, 0x24, 0xFF
vertex     40,     81,     23,   5078,    -72,  0x76, 0x1B, 0x24, 0xFF
vertex     51,     64,      0,   6100,    990,  0x76, 0x21, 0x1F, 0xFF
vertex     40,     81,     23,   5078,    -72,  0x76, 0x21, 0x1F, 0xFF
vertex     44,     64,     26,   5078,    990,  0x76, 0x21, 0x1F, 0xFF

haunted_cage_seg5_vertex_0500F108: # 0x0500F108
vertex      0,     81,    -46,   9166,    -72,  0x23, 0x21, 0x8B, 0xFF
vertex     23,     81,    -39,   8144,    -72,  0x23, 0x21, 0x8B, 0xFF
vertex     26,     64,    -43,   8144,    990,  0x23, 0x21, 0x8B, 0xFF
vertex      0,     64,    -50,   9166,    990,  0x20, 0x1C, 0x89, 0xFF
vertex      0,     81,    -46,   9166,    -72,  0x20, 0x1C, 0x89, 0xFF
vertex     26,     64,    -43,   8144,    990,  0x20, 0x1C, 0x89, 0xFF
vertex    -25,     64,    -43,  10188,    990,  0xDF, 0x1C, 0x89, 0xFF
vertex      0,     81,    -46,   9166,    -72,  0xDF, 0x1C, 0x89, 0xFF
vertex      0,     64,    -50,   9166,    990,  0xDF, 0x1C, 0x89, 0xFF
vertex    -25,     64,    -43,  10188,    990,  0xDB, 0x21, 0x8C, 0xFF
vertex    -22,     81,    -39,  10188,    -72,  0xDB, 0x21, 0x8C, 0xFF
vertex      0,     81,    -46,   9166,    -72,  0xDB, 0x21, 0x8C, 0xFF
vertex    -43,     64,    -25,  11210,    990,  0xAA, 0x23, 0xAA, 0xFF
vertex    -39,     81,    -22,  11210,    -72,  0xAA, 0x23, 0xAA, 0xFF
vertex    -25,     64,    -43,  10188,    990,  0xAA, 0x23, 0xAA, 0xFF
vertex    -22,     81,    -39,  10188,    -72,  0xAA, 0x23, 0xAA, 0xFF

haunted_cage_seg5_vertex_0500F208: # 0x0500F208
vertex    -50,     64,      0,  12232,    990,  0x8B, 0x21, 0xDF, 0xFF
vertex    -39,     81,    -22,  11210,    -72,  0x8B, 0x21, 0xDF, 0xFF
vertex    -43,     64,    -25,  11210,    990,  0x8B, 0x21, 0xDF, 0xFF
vertex    -50,     64,      0,  12232,    990,  0x8A, 0x1B, 0xDB, 0xFF
vertex    -46,     81,      0,  12232,    -72,  0x8A, 0x1B, 0xDB, 0xFF
vertex    -39,     81,    -22,  11210,    -72,  0x8A, 0x1B, 0xDB, 0xFF
vertex    -25,     64,     44,   2012,    990,  0xAA, 0x23, 0x56, 0xFF
vertex    -39,     81,     23,    990,    -72,  0xAA, 0x23, 0x56, 0xFF
vertex    -43,     64,     26,    990,    990,  0xAA, 0x23, 0x56, 0xFF
vertex    -43,     64,     26,    990,    990,  0x8B, 0x21, 0x23, 0xFF
vertex    -39,     81,     23,    990,    -72,  0x8B, 0x21, 0x23, 0xFF
vertex    -46,     81,      0,      0,    -72,  0x8B, 0x21, 0x23, 0xFF
vertex    -43,     64,     26,    990,    990,  0x89, 0x1C, 0x20, 0xFF
vertex    -46,     81,      0,      0,    -72,  0x89, 0x1C, 0x20, 0xFF
vertex    -50,     64,      0,      0,    990,  0x89, 0x1C, 0x20, 0xFF
vertex    -22,     81,     40,   2012,    -72,  0xAA, 0x23, 0x56, 0xFF

haunted_cage_seg5_vertex_0500F308: # 0x0500F308
vertex      0,     64,     51,   3034,    990,  0xDF, 0x1C, 0x77, 0xFF
vertex      0,     81,     47,   3034,    -72,  0xDF, 0x1C, 0x77, 0xFF
vertex    -25,     64,     44,   2012,    990,  0xDF, 0x1C, 0x77, 0xFF
vertex      0,     81,     47,   3034,    -72,  0xDB, 0x21, 0x74, 0xFF
vertex    -22,     81,     40,   2012,    -72,  0xDB, 0x21, 0x74, 0xFF
vertex    -25,     64,     44,   2012,    990,  0xDB, 0x21, 0x74, 0xFF
vertex     26,     64,     44,   4056,    990,  0x23, 0x21, 0x75, 0xFF
vertex     23,     81,     40,   4056,    -72,  0x23, 0x21, 0x75, 0xFF
vertex      0,     81,     47,   3034,    -72,  0x23, 0x21, 0x75, 0xFF
vertex     26,     64,     44,   4056,    990,  0x20, 0x1C, 0x77, 0xFF
vertex      0,     81,     47,   3034,    -72,  0x20, 0x1C, 0x77, 0xFF
vertex      0,     64,     51,   3034,    990,  0x20, 0x1C, 0x77, 0xFF
vertex     40,     81,     23,   5078,    -72,  0x56, 0x23, 0x56, 0xFF
vertex     23,     81,     40,   4056,    -72,  0x56, 0x23, 0x56, 0xFF
vertex     26,     64,     44,   4056,    990,  0x56, 0x23, 0x56, 0xFF
vertex     44,     64,     26,   5078,    990,  0x56, 0x23, 0x56, 0xFF

haunted_cage_seg5_vertex_0500F408: # 0x0500F408
vertex    -43,      0,    -25,   5204,  -2624,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,     51,  -1052,  -8882,  0x00, 0x7F, 0x00, 0xFF
vertex     26,      0,     44,  -3342,  -7560,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,      0,     44,   1592,  -8882,  0x00, 0x7F, 0x00, 0xFF
vertex    -50,      0,      0,   5204,  -5268,  0x00, 0x7F, 0x00, 0xFF
vertex    -43,      0,     26,   3882,  -7560,  0x00, 0x7F, 0x00, 0xFF
vertex     26,      0,    -43,  -1052,    990,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,    -50,   1592,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     44,      0,    -25,  -3342,   -332,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,      0,    -43,   3882,   -332,  0x00, 0x7F, 0x00, 0xFF
vertex     51,      0,      0,  -4666,  -2624,  0x00, 0x7F, 0x00, 0xFF
vertex     44,      0,     26,  -4666,  -5268,  0x00, 0x7F, 0x00, 0xFF

glabel haunted_cage_seg5_dl_0500F4C8 # 0x0500F4C8 - 0x0500F660
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, haunted_cage_seg5_texture_0500D288
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight haunted_cage_seg5_light_0500C260, 1
gsSPLight haunted_cage_seg5_light_0500C258, 2
gsSPVertex haunted_cage_seg5_vertex_0500EA88, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500EB78, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500EC68, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight haunted_cage_seg5_light_0500C278, 1
gsSPLight haunted_cage_seg5_light_0500C270, 2
gsSPVertex haunted_cage_seg5_vertex_0500ECC8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  3,  9,  4, 0x0
gsSP2Triangles  6, 10,  7, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500EDB8, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500EE98, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500EF88, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel haunted_cage_seg5_dl_0500F660 # 0x0500F660 - 0x0500F760
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, haunted_cage_seg5_texture_0500CA88
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex haunted_cage_seg5_vertex_0500F008, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  3,  9,  4, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500F108, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 13, 15, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500F208, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0,  6, 15,  7, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500F308, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 15, 12, 14, 0x0
gsSPEndDisplayList

glabel haunted_cage_seg5_dl_0500F760 # 0x0500F760 - 0x0500F7D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, haunted_cage_seg5_texture_0500C288
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex haunted_cage_seg5_vertex_0500F408, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  4,  5, 0x0,  0,  5,  3, 0x0
gsSP2Triangles  0,  6,  7, 0x0,  0,  8,  6, 0x0
gsSP2Triangles  0,  7,  9, 0x0,  0, 10,  8, 0x0
gsSP2Triangles  0, 11, 10, 0x0,  0,  2, 11, 0x0
gsSPEndDisplayList

glabel haunted_cage_seg5_dl_0500F7D8 # 0x0500F7D8 - 0x0500F888
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList haunted_cage_seg5_dl_0500F4C8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList haunted_cage_seg5_dl_0500F660
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList haunted_cage_seg5_dl_0500F760
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

haunted_cage_seg5_light_0500F888: # 0x0500F888
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

haunted_cage_seg5_light_0500F890: # 0x0500F890
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

haunted_cage_seg5_vertex_0500F8A0: # 0x0500F8A0
vertex    -19,      0,     10,   3034,    479,  0x81, 0x00, 0x00, 0xFF
vertex    -19,     28,    -19,      0,  -2350,  0x81, 0x00, 0x00, 0xFF
vertex    -19,      0,    -19,      0,    479,  0x81, 0x00, 0x00, 0xFF
vertex     20,      0,     10,   4056,    479,  0x00, 0x00, 0x7F, 0xFF
vertex    -19,     28,     10,      0,  -2350,  0x00, 0x00, 0x7F, 0xFF
vertex    -19,      0,     10,      0,    479,  0x00, 0x00, 0x7F, 0xFF
vertex     20,     28,     10,   4056,  -2350,  0x00, 0x00, 0x7F, 0xFF
vertex    -19,      0,    -19,   4056,    479,  0x00, 0x00, 0x81, 0xFF
vertex     20,     28,    -19,      0,  -2350,  0x00, 0x00, 0x81, 0xFF
vertex     20,      0,    -19,      0,    479,  0x00, 0x00, 0x81, 0xFF
vertex    -19,     28,    -19,   4056,  -2350,  0x00, 0x00, 0x81, 0xFF
vertex     20,     28,    -19,   4056,  -2587,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,     28,    -19,      0,  -2587,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,     28,     10,      0,    479,  0x00, 0x7F, 0x00, 0xFF
vertex     20,     28,     10,   4056,    479,  0x00, 0x7F, 0x00, 0xFF

haunted_cage_seg5_vertex_0500F990: # 0x0500F990
vertex    -30,      0,     39,    990,    479,  0x81, 0x00, 0x00, 0xFF
vertex    -30,     10,     39,    990,   -543,  0x81, 0x00, 0x00, 0xFF
vertex    -30,     10,     29,      0,   -543,  0x81, 0x00, 0x00, 0xFF
vertex    -19,      0,     10,   3034,    479,  0x81, 0x00, 0x00, 0xFF
vertex    -19,     28,     10,   3034,  -2350,  0x81, 0x00, 0x00, 0xFF
vertex    -19,     28,    -19,      0,  -2350,  0x81, 0x00, 0x00, 0xFF
vertex     20,      0,    -19,   3034,    479,  0x7F, 0x00, 0x00, 0xFF
vertex     20,     28,     10,      0,  -2350,  0x7F, 0x00, 0x00, 0xFF
vertex     20,      0,     10,      0,    479,  0x7F, 0x00, 0x00, 0xFF
vertex     20,     28,    -19,   3034,  -2350,  0x7F, 0x00, 0x00, 0xFF
vertex    -19,      0,     39,    990,    479,  0x00, 0x00, 0x7F, 0xFF
vertex    -30,     10,     39,      0,   -543,  0x00, 0x00, 0x7F, 0xFF
vertex    -30,      0,     39,      0,    479,  0x00, 0x00, 0x7F, 0xFF
vertex    -19,     10,     39,    990,   -543,  0x00, 0x00, 0x7F, 0xFF
vertex    -30,      0,     29,      0,    479,  0x81, 0x00, 0x00, 0xFF

haunted_cage_seg5_vertex_0500FA80: # 0x0500FA80
vertex    -30,      0,     29,    990,    479,  0x00, 0x00, 0x81, 0xFF
vertex    -30,     10,     29,    990,   -543,  0x00, 0x00, 0x81, 0xFF
vertex    -19,     10,     29,      0,   -543,  0x00, 0x00, 0x81, 0xFF
vertex    -19,      0,     29,      0,    479,  0x00, 0x00, 0x81, 0xFF
vertex    -19,      0,     29,    990,    479,  0x7F, 0x00, 0x00, 0xFF
vertex    -19,     10,     39,     38,   -616,  0x7F, 0x00, 0x00, 0xFF
vertex    -19,      0,     39,      0,    408,  0x7F, 0x00, 0x00, 0xFF
vertex    -19,     10,     29,   1062,   -545,  0x7F, 0x00, 0x00, 0xFF
vertex    -19,     10,     39,    990,    479,  0x00, 0x7F, 0x00, 0xFF
vertex    -30,     10,     29,      0,   -543,  0x00, 0x7F, 0x00, 0xFF
vertex    -30,     10,     39,      0,    479,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,     10,     29,    990,   -543,  0x00, 0x7F, 0x00, 0xFF

glabel haunted_cage_seg5_dl_0500FB40 # 0x0500FB40 - 0x0500FC28
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, haunted_cage_seg5_texture_0500D688
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight haunted_cage_seg5_light_0500F890, 1
gsSPLight haunted_cage_seg5_light_0500F888, 2
gsSPVertex haunted_cage_seg5_vertex_0500F8A0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500F990, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500FA80, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel haunted_cage_seg5_dl_0500FC28 # 0x0500FC28 - 0x0500FC98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList haunted_cage_seg5_dl_0500FB40
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

haunted_cage_seg5_light_0500FC98: # 0x0500FC98
.byte 0x2C, 0x2C, 0x2C, 0x00, 0x2C, 0x2C, 0x2C, 0x00

haunted_cage_seg5_light_0500FCA0: # 0x0500FCA0
.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

haunted_cage_seg5_vertex_0500FCB0: # 0x0500FCB0
vertex    -43,     10,     26,   8484,    990,  0x86, 0x00, 0x21, 0xFF
vertex    -43,     64,     26,   8484,   6370,  0x86, 0x00, 0x21, 0xFF
vertex    -50,     64,      0,  10188,   6370,  0x86, 0x00, 0x21, 0xFF
vertex     51,     10,      0,      0,    990,  0x7A, 0x00, 0x21, 0xFF
vertex     51,     64,      0,      0,   6370,  0x7A, 0x00, 0x21, 0xFF
vertex     44,     64,     26,   1672,   6370,  0x7A, 0x00, 0x21, 0xFF
vertex     44,     10,     26,   1672,    990,  0x7A, 0x00, 0x21, 0xFF
vertex     44,     10,     26,   1672,    990,  0x59, 0x00, 0x59, 0xFF
vertex     44,     64,     26,   1672,   6370,  0x59, 0x00, 0x59, 0xFF
vertex     26,     64,     44,   3374,   6370,  0x59, 0x00, 0x59, 0xFF
vertex     26,     10,     44,   3374,    990,  0x59, 0x00, 0x59, 0xFF
vertex     26,     10,     44,   3374,    990,  0x21, 0x00, 0x7A, 0xFF
vertex     26,     64,     44,   3374,   6370,  0x21, 0x00, 0x7A, 0xFF
vertex      0,     64,     51,   5078,   6370,  0x21, 0x00, 0x7A, 0xFF
vertex      0,     10,     51,   5078,    990,  0x21, 0x00, 0x7A, 0xFF

haunted_cage_seg5_vertex_0500FDA0: # 0x0500FDA0
vertex      0,     10,     51,   5078,    990,  0xDE, 0x00, 0x7A, 0xFF
vertex      0,     64,     51,   5078,   6370,  0xDE, 0x00, 0x7A, 0xFF
vertex    -25,     64,     44,   6782,   6370,  0xDE, 0x00, 0x7A, 0xFF
vertex    -25,     10,     44,   6782,    990,  0xDE, 0x00, 0x7A, 0xFF
vertex    -25,     10,     44,   6782,    990,  0xA7, 0x00, 0x59, 0xFF
vertex    -25,     64,     44,   6782,   6370,  0xA7, 0x00, 0x59, 0xFF
vertex    -43,     64,     26,   8484,   6370,  0xA7, 0x00, 0x59, 0xFF
vertex    -43,     10,     26,   8484,    990,  0xA7, 0x00, 0x59, 0xFF
vertex     26,     10,    -43,  17002,    990,  0x59, 0x00, 0xA7, 0xFF
vertex     44,     64,    -25,  18704,   6370,  0x59, 0x00, 0xA7, 0xFF
vertex     44,     10,    -25,  18704,    990,  0x59, 0x00, 0xA7, 0xFF
vertex    -43,     10,     26,   8484,    990,  0x86, 0x00, 0x21, 0xFF
vertex    -50,     64,      0,  10188,   6370,  0x86, 0x00, 0x21, 0xFF
vertex    -50,     10,      0,  10188,    990,  0x86, 0x00, 0x21, 0xFF

haunted_cage_seg5_vertex_0500FE80: # 0x0500FE80
vertex    -50,     10,      0,  10188,    990,  0x86, 0x00, 0xDE, 0xFF
vertex    -50,     64,      0,  10188,   6370,  0x86, 0x00, 0xDE, 0xFF
vertex    -43,     64,    -25,  11892,   6370,  0x86, 0x00, 0xDE, 0xFF
vertex    -43,     10,    -25,  11892,    990,  0x86, 0x00, 0xDE, 0xFF
vertex    -43,     10,    -25,  11892,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex    -43,     64,    -25,  11892,   6370,  0xA7, 0x00, 0xA7, 0xFF
vertex    -25,     64,    -43,  13594,   6370,  0xA7, 0x00, 0xA7, 0xFF
vertex    -25,     10,    -43,  13594,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex    -25,     10,    -43,  13594,    990,  0xDE, 0x00, 0x86, 0xFF
vertex    -25,     64,    -43,  13594,   6370,  0xDE, 0x00, 0x86, 0xFF
vertex      0,     64,    -50,  15298,   6370,  0xDE, 0x00, 0x86, 0xFF
vertex      0,     10,    -50,  15298,    990,  0xDE, 0x00, 0x86, 0xFF
vertex      0,     10,    -50,  15298,    990,  0x21, 0x00, 0x86, 0xFF
vertex      0,     64,    -50,  15298,   6370,  0x21, 0x00, 0x86, 0xFF
vertex     26,     64,    -43,  17002,   6370,  0x21, 0x00, 0x86, 0xFF
vertex     26,     10,    -43,  17002,    990,  0x21, 0x00, 0x86, 0xFF

haunted_cage_seg5_vertex_0500FF80: # 0x0500FF80
vertex     26,     10,    -43,  17002,    990,  0x59, 0x00, 0xA7, 0xFF
vertex     26,     64,    -43,  17002,   6370,  0x59, 0x00, 0xA7, 0xFF
vertex     44,     64,    -25,  18704,   6370,  0x59, 0x00, 0xA7, 0xFF
vertex     44,     10,    -25,  18704,    990,  0x7A, 0x00, 0xDE, 0xFF
vertex     44,     64,    -25,  18704,   6370,  0x7A, 0x00, 0xDE, 0xFF
vertex     51,     64,      0,  20408,   6370,  0x7A, 0x00, 0xDE, 0xFF
vertex     51,     10,      0,  20408,    990,  0x7A, 0x00, 0xDE, 0xFF

glabel haunted_cage_seg5_dl_0500FFF0 # 0x0500FFF0 - 0x05010100
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, haunted_cage_seg5_texture_0500DA88
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight haunted_cage_seg5_light_0500FCA0, 1
gsSPLight haunted_cage_seg5_light_0500FC98, 2
gsSPVertex haunted_cage_seg5_vertex_0500FCB0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500FDA0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500FE80, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex haunted_cage_seg5_vertex_0500FF80, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  3,  5,  6, 0x0
gsSPEndDisplayList

glabel haunted_cage_seg5_dl_05010100 # 0x05010100 - 0x05010170
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList haunted_cage_seg5_dl_0500FFF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
