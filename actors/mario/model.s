# Mario

mario_amb_light_group1: # 0x04000000 # solid color dark blue - butt, left thigh, right thigh - all polys
.byte 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x00

mario_diff_light_group1: # 0x04000008 # solid color light blue - butt, left thigh, right thigh - all polys
.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_amb_light_group2: # 0x04000018 # solid color dark red - left & right arm, torso (tshirt part), caps - all polys
.byte 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00

mario_diff_light_group2: # 0x04000020 # solid color light red - left & right arm, torso (tshirt part), caps - all polys
.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_amb_light_group3: # 0x04000030 # solid color gray - metal butt & left thigh - normal left & right hand closed & open (with cap too) and all wings - all polys
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

mario_diff_light_group3: # 0x04000038 # solid color white - metal butt & left thigh - normal left & right hand closed & open (with cap too) and all wings - all polys
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_amb_light_group4: # 0x04000048 # solid color dark brown 1 - foot - all polys
.byte 0x39, 0x0E, 0x07, 0x00, 0x39, 0x0E, 0x07, 0x00

mario_diff_light_group4: # 0x04000050 # solid color light brown 1 - foot - all polys
.byte 0x72, 0x1C, 0x0E, 0x00, 0x72, 0x1C, 0x0E, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_amb_light_group5: # 0x04000060 # solid color dark skin - face (cap on and off dls) - all polys
.byte 0x7F, 0x60, 0x3C, 0x00, 0x7F, 0x60, 0x3C, 0x00
 
mario_diff_light_group5: # 0x04000068 # solid color light skin - face (cap on and off dls) - all polys
.byte 0xFE, 0xC1, 0x79, 0x00, 0xFE, 0xC1, 0x79, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_amb_light_group6: # 0x04000078  # solid color dark brown 2 - hair - all polys
.byte 0x39, 0x03, 0x00, 0x00, 0x39, 0x03, 0x00, 0x00

mario_diff_light_group6: # 0x04000080 # solid color light brown 2 - hair - all polys
.byte 0x73, 0x06, 0x00, 0x00, 0x73, 0x06, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_texture_metal: # 0x04000090
.incbin "actors/mario/mario_metal.rgba16"

mario_texture_yellow_button: # 0x04001090
.incbin "actors/mario/mario_overalls_button.rgba16"

mario_texture_m_logo: # 0x04001890
.incbin "actors/mario/mario_logo.rgba16"

mario_texture_hair_sideburn: # 0x04002090
.incbin "actors/mario/mario_sideburn.rgba16"

mario_texture_mustache: # 0x04002890
.incbin "actors/mario/mario_mustache.rgba16"

mario_texture_eyes_front: # 0x04003090
.incbin "actors/mario/mario_eyes_center.rgba16"

mario_texture_eyes_half_closed: # 0x04003890
.incbin "actors/mario/mario_eyes_half_closed.rgba16"

mario_texture_eyes_closed: # 0x04004090
.incbin "actors/mario/mario_eyes_closed.rgba16"

# Unreferenced
mario_texture_eyes_closed_unused1: # 0x04004890
.incbin "actors/mario/mario_eyes_closed_unused_0.rgba16"

# Unreferenced
mario_texture_eyes_closed_unused2: # 0x04005090
.incbin "actors/mario/mario_eyes_closed_unused_1.rgba16"

mario_texture_eyes_right: # 0x04005890
.incbin "actors/mario/mario_eyes_left_unused.rgba16"

mario_texture_eyes_left: # 0x04006090
.incbin "actors/mario/mario_eyes_right_unused.rgba16"

mario_texture_eyes_up: # 0x04006890
.incbin "actors/mario/mario_eyes_up_unused.rgba16"

mario_texture_eyes_down: # 0x04007090
.incbin "actors/mario/mario_eyes_down_unused.rgba16"

mario_texture_eyes_dead: # 0x04007890
.incbin "actors/mario/mario_eyes_dead.rgba16"

mario_texture_wings_half_1: # 0x04008090
.incbin "actors/mario/mario_wing.rgba16"

mario_texture_wings_half_2: # 0x04009090
.incbin "actors/mario/mario_wing_tip.rgba16"

mario_texture_metal_wings_half_1: # 0x0400A090
.incbin "actors/mario/mario_metal_wing_unused.rgba16"

mario_texture_metal_wings_half_2: # 0x0400B090
.incbin "actors/mario/mario_metal_wing_tip_unused.rgba16"

mario_butt_dl_vertex_group1: # 0x0400C090
vertex     -9,     73,    -34,      0,      0,  0xC2, 0x6B, 0xE6, 0x00
vertex     -9,     73,     34,      0,      0,  0xBE, 0x6A, 0x12, 0x00
vertex     22,     82,    -26,      0,      0,  0x07, 0x7E, 0xF5, 0x00
vertex     73,     11,      0,      0,      0,  0x7E, 0x04, 0x00, 0x00
vertex     55,    -61,    -36,      0,      0,  0x67, 0xBE, 0xE1, 0x00
vertex     44,    -10,    -92,      0,      0,  0x4F, 0xF2, 0x9E, 0x00
vertex      7,     33,     95,      0,      0,  0xE6, 0x26, 0x75, 0x00
vertex     44,     -9,     92,      0,      0,  0x4F, 0xF2, 0x62, 0x00
vertex     43,     40,     91,      0,      0,  0x4E, 0x30, 0x57, 0x00
vertex      8,     -8,    -99,      0,      0,  0xF3, 0xEE, 0x84, 0x00
vertex     36,    -51,    -79,      0,      0,  0x30, 0xB8, 0xA4, 0x00
vertex     26,    -74,    -46,      0,      0,  0x18, 0x88, 0xE2, 0x00
vertex     36,    -52,     79,      0,      0,  0x30, 0xB8, 0x5C, 0x00
vertex     26,    -74,     45,      0,      0,  0x12, 0x88, 0x22, 0x00
vertex     55,    -61,     36,      0,      0,  0x60, 0xB3, 0x1A, 0x00

mario_butt_dl_vertex_group2: # 0x0400C180
vertex     -5,     59,     72,      0,      0,  0xC0, 0x52, 0x47, 0x00
vertex     -9,     73,     34,      0,      0,  0xBE, 0x6A, 0x12, 0x00
vertex    -32,     40,     39,      0,      0,  0x8B, 0x25, 0x1D, 0x00
vertex     52,     70,     38,      0,      0,  0x53, 0x5D, 0x16, 0x00
vertex     22,     82,     26,      0,      0,  0x07, 0x7D, 0x11, 0x00
vertex     27,     72,     63,      0,      0,  0x06, 0x6C, 0x42, 0x00
vertex     43,     40,    -91,      0,      0,  0x4E, 0x30, 0xA9, 0x00
vertex     27,     72,    -63,      0,      0,  0x07, 0x6B, 0xBE, 0x00
vertex     52,     70,    -39,      0,      0,  0x59, 0x56, 0xE5, 0x00
vertex     -5,     59,    -72,      0,      0,  0xC0, 0x52, 0xB9, 0x00
vertex    -17,     32,    -79,      0,      0,  0xA4, 0x23, 0xB1, 0x00
vertex    -32,     40,    -39,      0,      0,  0x89, 0x25, 0xEB, 0x00
vertex     73,     11,      0,      0,      0,  0x7E, 0x04, 0x00, 0x00
vertex     43,     40,     91,      0,      0,  0x4E, 0x30, 0x57, 0x00

mario_butt_dl_vertex_group3: # 0x0400C260
vertex    -14,    -74,      0,      0,      0,  0xCB, 0x8D, 0x00, 0x00
vertex     -9,    -69,     55,      0,      0,  0xCD, 0x97, 0x30, 0x00
vertex    -31,    -51,     42,      0,      0,  0x8D, 0xD7, 0x1F, 0x00
vertex     26,    -74,    -46,      0,      0,  0x18, 0x88, 0xE2, 0x00
vertex     -9,    -69,    -55,      0,      0,  0xCD, 0x97, 0xD0, 0x00
vertex      4,    -48,    -86,      0,      0,  0xD8, 0xBA, 0x9F, 0x00
vertex      4,    -49,     86,      0,      0,  0xD8, 0xB9, 0x61, 0x00
vertex     26,    -74,     45,      0,      0,  0x12, 0x88, 0x22, 0x00
vertex    -32,     40,     39,      0,      0,  0x8B, 0x25, 0x1D, 0x00
vertex     -9,     73,     34,      0,      0,  0xBE, 0x6A, 0x12, 0x00
vertex    -32,     40,    -39,      0,      0,  0x89, 0x25, 0xEB, 0x00
vertex     27,     72,     63,      0,      0,  0x06, 0x6C, 0x42, 0x00
vertex     -5,     59,     72,      0,      0,  0xC0, 0x52, 0x47, 0x00
vertex     52,     70,    -39,      0,      0,  0x59, 0x56, 0xE5, 0x00
vertex     22,     82,    -26,      0,      0,  0x07, 0x7E, 0xF5, 0x00
vertex     52,     70,     38,      0,      0,  0x53, 0x5D, 0x16, 0x00

mario_butt_dl_vertex_group4: # 0x0400C360
vertex      6,     33,    -95,      0,      0,  0xE6, 0x26, 0x8B, 0x00
vertex     27,     72,    -63,      0,      0,  0x07, 0x6B, 0xBE, 0x00
vertex     43,     40,    -91,      0,      0,  0x4E, 0x30, 0xA9, 0x00
vertex    -31,    -51,     42,      0,      0,  0x8D, 0xD7, 0x1F, 0x00
vertex    -31,    -51,    -42,      0,      0,  0x91, 0xD0, 0xDC, 0x00
vertex    -14,    -74,      0,      0,      0,  0xCB, 0x8D, 0x00, 0x00
vertex     -9,    -69,    -55,      0,      0,  0xCD, 0x97, 0xD0, 0x00
vertex     73,     11,      0,      0,      0,  0x7E, 0x04, 0x00, 0x00
vertex     44,    -10,    -92,      0,      0,  0x4F, 0xF2, 0x9E, 0x00
vertex     52,     70,     38,      0,      0,  0x53, 0x5D, 0x16, 0x00
vertex     52,     70,    -39,      0,      0,  0x59, 0x56, 0xE5, 0x00
vertex     43,     40,     91,      0,      0,  0x4E, 0x30, 0x57, 0x00
vertex     44,     -9,     92,      0,      0,  0x4F, 0xF2, 0x62, 0x00
vertex      7,     33,     95,      0,      0,  0xE6, 0x26, 0x75, 0x00
vertex     27,     72,     63,      0,      0,  0x06, 0x6C, 0x42, 0x00

mario_butt_dl_vertex_group5: # 0x0400C450
vertex     -5,     59,    -72,      0,      0,  0xC0, 0x52, 0xB9, 0x00
vertex     -9,     73,    -34,      0,      0,  0xC2, 0x6B, 0xE6, 0x00
vertex     27,     72,    -63,      0,      0,  0x07, 0x6B, 0xBE, 0x00
vertex    -32,     40,    -39,      0,      0,  0x89, 0x25, 0xEB, 0x00
vertex    -32,     40,     39,      0,      0,  0x8B, 0x25, 0x1D, 0x00
vertex    -18,     32,     79,      0,      0,  0xA4, 0x23, 0x4F, 0x00
vertex     -5,     59,     72,      0,      0,  0xC0, 0x52, 0x47, 0x00
vertex     22,     82,    -26,      0,      0,  0x07, 0x7E, 0xF5, 0x00
vertex     52,     70,    -39,      0,      0,  0x59, 0x56, 0xE5, 0x00
vertex     27,     72,     63,      0,      0,  0x06, 0x6C, 0x42, 0x00
vertex     43,     40,     91,      0,      0,  0x4E, 0x30, 0x57, 0x00
vertex     52,     70,     38,      0,      0,  0x53, 0x5D, 0x16, 0x00
vertex      8,     -8,     99,      0,      0,  0xF3, 0xEF, 0x7C, 0x00
vertex     36,    -52,     79,      0,      0,  0x30, 0xB8, 0x5C, 0x00
vertex     44,     -9,     92,      0,      0,  0x4F, 0xF2, 0x62, 0x00

mario_butt_dl_vertex_group6: # 0x0400C540
vertex      6,     33,    -95,      0,      0,  0xE6, 0x26, 0x8B, 0x00
vertex     43,     40,    -91,      0,      0,  0x4E, 0x30, 0xA9, 0x00
vertex     44,    -10,    -92,      0,      0,  0x4F, 0xF2, 0x9E, 0x00
vertex     44,     -9,     92,      0,      0,  0x4F, 0xF2, 0x62, 0x00
vertex     36,    -52,     79,      0,      0,  0x30, 0xB8, 0x5C, 0x00
vertex     55,    -61,     36,      0,      0,  0x60, 0xB3, 0x1A, 0x00
vertex    -18,     32,     79,      0,      0,  0xA4, 0x23, 0x4F, 0x00
vertex      7,     33,     95,      0,      0,  0xE6, 0x26, 0x75, 0x00
vertex     -5,     59,     72,      0,      0,  0xC0, 0x52, 0x47, 0x00
vertex    -20,     -7,     81,      0,      0,  0xA3, 0xF9, 0x55, 0x00
vertex      8,     -8,     99,      0,      0,  0xF3, 0xEF, 0x7C, 0x00
vertex      4,    -49,     86,      0,      0,  0xD8, 0xB9, 0x61, 0x00
vertex    -20,     -8,    -81,      0,      0,  0xA3, 0xF8, 0xAB, 0x00
vertex      8,     -8,    -99,      0,      0,  0xF3, 0xEE, 0x84, 0x00
vertex      4,    -48,    -86,      0,      0,  0xD8, 0xBA, 0x9F, 0x00

mario_butt_dl_vertex_group7: # 0x0400C630
vertex     -5,     59,    -72,      0,      0,  0xC0, 0x52, 0xB9, 0x00
vertex      6,     33,    -95,      0,      0,  0xE6, 0x26, 0x8B, 0x00
vertex    -17,     32,    -79,      0,      0,  0xA4, 0x23, 0xB1, 0x00
vertex    -20,     -8,    -81,      0,      0,  0xA3, 0xF8, 0xAB, 0x00
vertex      7,     33,     95,      0,      0,  0xE6, 0x26, 0x75, 0x00
vertex    -18,     32,     79,      0,      0,  0xA4, 0x23, 0x4F, 0x00
vertex    -20,     -7,     81,      0,      0,  0xA3, 0xF9, 0x55, 0x00
vertex    -32,     40,    -39,      0,      0,  0x89, 0x25, 0xEB, 0x00
vertex     55,    -61,     36,      0,      0,  0x60, 0xB3, 0x1A, 0x00
vertex     73,     11,      0,      0,      0,  0x7E, 0x04, 0x00, 0x00
vertex     44,     -9,     92,      0,      0,  0x4F, 0xF2, 0x62, 0x00
vertex     55,    -61,    -36,      0,      0,  0x67, 0xBE, 0xE1, 0x00
vertex     36,    -51,    -79,      0,      0,  0x30, 0xB8, 0xA4, 0x00
vertex     44,    -10,    -92,      0,      0,  0x4F, 0xF2, 0x9E, 0x00
vertex      8,     -8,    -99,      0,      0,  0xF3, 0xEE, 0x84, 0x00

mario_butt_dl_vertex_group8: # 0x0400C720
vertex      8,     -8,     99,      0,      0,  0xF3, 0xEF, 0x7C, 0x00
vertex      4,    -49,     86,      0,      0,  0xD8, 0xB9, 0x61, 0x00
vertex     36,    -52,     79,      0,      0,  0x30, 0xB8, 0x5C, 0x00
vertex     -9,     73,    -34,      0,      0,  0xC2, 0x6B, 0xE6, 0x00
vertex     22,     82,    -26,      0,      0,  0x07, 0x7E, 0xF5, 0x00
vertex     27,     72,    -63,      0,      0,  0x07, 0x6B, 0xBE, 0x00
vertex     27,     72,     63,      0,      0,  0x06, 0x6C, 0x42, 0x00
vertex     -5,     59,     72,      0,      0,  0xC0, 0x52, 0x47, 0x00
vertex      7,     33,     95,      0,      0,  0xE6, 0x26, 0x75, 0x00
vertex      6,     33,    -95,      0,      0,  0xE6, 0x26, 0x8B, 0x00
vertex     -5,     59,    -72,      0,      0,  0xC0, 0x52, 0xB9, 0x00
vertex     22,     82,     26,      0,      0,  0x07, 0x7D, 0x11, 0x00
vertex     52,     70,     38,      0,      0,  0x53, 0x5D, 0x16, 0x00
vertex     -9,     73,     34,      0,      0,  0xBE, 0x6A, 0x12, 0x00
vertex    -32,     40,    -39,      0,      0,  0x89, 0x25, 0xEB, 0x00
vertex     26,    -74,     45,      0,      0,  0x12, 0x88, 0x22, 0x00

mario_butt_dl_vertex_group9: # 0x0400C820
vertex      4,    -48,    -86,      0,      0,  0xD8, 0xBA, 0x9F, 0x00
vertex     36,    -51,    -79,      0,      0,  0x30, 0xB8, 0xA4, 0x00
vertex     26,    -74,    -46,      0,      0,  0x18, 0x88, 0xE2, 0x00
vertex    -20,     -7,     81,      0,      0,  0xA3, 0xF9, 0x55, 0x00
vertex    -18,     32,     79,      0,      0,  0xA4, 0x23, 0x4F, 0x00
vertex    -32,     40,     39,      0,      0,  0x8B, 0x25, 0x1D, 0x00
vertex      8,     -8,    -99,      0,      0,  0xF3, 0xEE, 0x84, 0x00
vertex      7,     33,     95,      0,      0,  0xE6, 0x26, 0x75, 0x00
vertex      8,     -8,     99,      0,      0,  0xF3, 0xEF, 0x7C, 0x00
vertex     44,     -9,     92,      0,      0,  0x4F, 0xF2, 0x62, 0x00
vertex     -9,     73,     34,      0,      0,  0xBE, 0x6A, 0x12, 0x00
vertex     22,     82,     26,      0,      0,  0x07, 0x7D, 0x11, 0x00
vertex     22,     82,    -26,      0,      0,  0x07, 0x7E, 0xF5, 0x00
vertex     -9,    -69,    -55,      0,      0,  0xCD, 0x97, 0xD0, 0x00
vertex    -31,    -51,    -42,      0,      0,  0x91, 0xD0, 0xDC, 0x00
vertex    -20,     -8,    -81,      0,      0,  0xA3, 0xF8, 0xAB, 0x00

mario_butt_dl_vertex_group10: # 0x0400C920
vertex    -31,    -51,     42,      0,      0,  0x8D, 0xD7, 0x1F, 0x00
vertex     -9,    -69,     55,      0,      0,  0xCD, 0x97, 0x30, 0x00
vertex      4,    -49,     86,      0,      0,  0xD8, 0xB9, 0x61, 0x00
vertex    -20,     -7,     81,      0,      0,  0xA3, 0xF9, 0x55, 0x00
vertex    -32,     40,     39,      0,      0,  0x8B, 0x25, 0x1D, 0x00
vertex    -32,     40,    -39,      0,      0,  0x89, 0x25, 0xEB, 0x00
vertex    -20,     -8,    -81,      0,      0,  0xA3, 0xF8, 0xAB, 0x00
vertex    -31,    -51,    -42,      0,      0,  0x91, 0xD0, 0xDC, 0x00
vertex     55,    -61,     36,      0,      0,  0x60, 0xB3, 0x1A, 0x00
vertex     26,    -74,     45,      0,      0,  0x12, 0x88, 0x22, 0x00
vertex     26,    -74,    -46,      0,      0,  0x18, 0x88, 0xE2, 0x00
vertex    -14,    -74,      0,      0,      0,  0xCB, 0x8D, 0x00, 0x00
vertex     -9,    -69,    -55,      0,      0,  0xCD, 0x97, 0xD0, 0x00
vertex     55,    -61,    -36,      0,      0,  0x67, 0xBE, 0xE1, 0x00

glabel mario_butt_dl # 0x0400CA00 - 0x0400CC98
gsSPVertex mario_butt_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  5, 10, 0x0
gsSP2Triangles  4, 11, 10, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_butt_dl_vertex_group2, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12,  3, 13, 0x0,  6,  8, 12, 0x0
gsSPVertex mario_butt_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  1,  7, 0x0,  8,  9, 10, 0x0
gsSP2Triangles 11,  9, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_butt_dl_vertex_group4, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  7,  8,  2, 0x0
gsSP2Triangles  9,  7, 10, 0x0, 11, 12,  7, 0x0
gsSP1Triangle 13, 11, 14, 0x0
gsSPVertex mario_butt_dl_vertex_group5, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  2,  7,  8, 0x0
gsSP2Triangles  9, 10, 11, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_butt_dl_vertex_group6, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  7, 0x0
gsSP2Triangles 11, 10,  9, 0x0, 12, 13, 14, 0x0
gsSP1Triangle  0, 13, 12, 0x0
gsSPVertex mario_butt_dl_vertex_group7, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  2,  3, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9,  8, 11, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 13, 14,  1, 0x0
gsSPVertex mario_butt_dl_vertex_group8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  5, 0x0
gsSP2Triangles  4, 11, 12, 0x0,  6, 11, 13, 0x0
gsSP2Triangles 13,  3, 14, 0x0, 15,  2,  1, 0x0
gsSPVertex mario_butt_dl_vertex_group9, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  1,  0,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0,  0, 13, 14, 0x0
gsSP1Triangle 15,  0, 14, 0x0
gsSPVertex mario_butt_dl_vertex_group10, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  3,  4,  0, 0x0,  0,  4,  5, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  7,  0, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSP2Triangles  9,  1, 11, 0x0, 11, 12, 10, 0x0
gsSP1Triangle 10, 13,  8, 0x0
gsSPEndDisplayList

glabel mario_butt # 0x0400CC98 - 0x0400CCC8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_butt_dl
gsSPEndDisplayList

glabel mario_metal_butt # 0x0400CCC8 - 0x0400CD40
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_butt_dl
gsSPEndDisplayList

mario_left_arm_shared_dl_vertex_group1: # 0x0400CD40
vertex      7,     27,     20,      0,      0,  0xDA, 0x61, 0x47, 0x00
vertex     59,     20,     15,      0,      0,  0x44, 0x4A, 0x4C, 0x00
vertex     59,     21,    -21,      0,      0,  0x37, 0x67, 0xD0, 0x00
vertex      6,    -16,     32,      0,      0,  0xD5, 0xDC, 0x71, 0x00
vertex     58,    -15,     25,      0,      0,  0x32, 0xC6, 0x64, 0x00
vertex      5,    -42,     -5,      0,      0,  0xD3, 0x8A, 0xFF, 0x00
vertex     57,    -36,     -5,      0,      0,  0x3E, 0x93, 0xEF, 0x00
vertex      6,    -13,    -42,      0,      0,  0xD6, 0xDE, 0x8E, 0x00
vertex     58,    -13,    -34,      0,      0,  0x3B, 0xFB, 0x90, 0x00
vertex      7,     29,    -26,      0,      0,  0xDA, 0x62, 0xBB, 0x00
vertex     -8,     17,    -17,      0,      0,  0x90, 0x2A, 0xD6, 0x00
vertex     -8,     16,     10,      0,      0,  0x9A, 0x44, 0x1D, 0x00
vertex     -8,     -9,    -27,      0,      0,  0x8E, 0xE8, 0xCE, 0x00
vertex     -9,    -26,     -5,      0,      0,  0x96, 0xBD, 0x0E, 0x00
vertex     -8,    -11,     18,      0,      0,  0x8B, 0xFF, 0x2F, 0x00

mario_left_arm_shared_dl_vertex_group2: # 0x0400CE30
vertex     68,     13,    -16,      0,      0,  0x6A, 0x38, 0xD9, 0x00
vertex     68,    -10,    -25,      0,      0,  0x75, 0xE7, 0xD9, 0x00
vertex     58,    -13,    -34,      0,      0,  0x3B, 0xFB, 0x90, 0x00
vertex     59,     20,     15,      0,      0,  0x44, 0x4A, 0x4C, 0x00
vertex     68,     12,      9,      0,      0,  0x78, 0x1F, 0x1B, 0x00
vertex     67,    -12,     16,      0,      0,  0x6F, 0xE8, 0x37, 0x00
vertex     57,    -36,     -5,      0,      0,  0x3E, 0x93, 0xEF, 0x00
vertex     67,    -26,     -5,      0,      0,  0x6E, 0xC2, 0xFE, 0x00
vertex     58,    -15,     25,      0,      0,  0x32, 0xC6, 0x64, 0x00
vertex     59,     21,    -21,      0,      0,  0x37, 0x67, 0xD0, 0x00
vertex      7,     27,     20,      0,      0,  0xDA, 0x61, 0x47, 0x00
vertex     -8,    -11,     18,      0,      0,  0x8B, 0xFF, 0x2F, 0x00
vertex      6,    -16,     32,      0,      0,  0xD5, 0xDC, 0x71, 0x00
vertex     -9,    -26,     -5,      0,      0,  0x96, 0xBD, 0x0E, 0x00
vertex      5,    -42,     -5,      0,      0,  0xD3, 0x8A, 0xFF, 0x00

mario_left_arm_shared_dl_vertex_group3: # 0x0400CF20
vertex      5,    -42,     -5,      0,      0,  0xD3, 0x8A, 0xFF, 0x00
vertex     -8,     -9,    -27,      0,      0,  0x8E, 0xE8, 0xCE, 0x00
vertex      6,    -13,    -42,      0,      0,  0xD6, 0xDE, 0x8E, 0x00
vertex     -8,     17,    -17,      0,      0,  0x90, 0x2A, 0xD6, 0x00
vertex      7,     29,    -26,      0,      0,  0xDA, 0x62, 0xBB, 0x00
vertex     -8,     16,     10,      0,      0,  0x9A, 0x44, 0x1D, 0x00
vertex      7,     27,     20,      0,      0,  0xDA, 0x61, 0x47, 0x00
vertex     58,    -13,    -34,      0,      0,  0x3B, 0xFB, 0x90, 0x00
vertex     57,    -36,     -5,      0,      0,  0x3E, 0x93, 0xEF, 0x00
vertex      6,    -16,     32,      0,      0,  0xD5, 0xDC, 0x71, 0x00
vertex     58,    -15,     25,      0,      0,  0x32, 0xC6, 0x64, 0x00
vertex     59,     20,     15,      0,      0,  0x44, 0x4A, 0x4C, 0x00
vertex     59,     21,    -21,      0,      0,  0x37, 0x67, 0xD0, 0x00
vertex     -8,    -11,     18,      0,      0,  0x8B, 0xFF, 0x2F, 0x00

mario_left_arm_shared_dl_vertex_group4: # 0x0400D000
vertex     68,     12,      9,      0,      0,  0x78, 0x1F, 0x1B, 0x00
vertex     68,    -10,    -25,      0,      0,  0x75, 0xE7, 0xD9, 0x00
vertex     68,     13,    -16,      0,      0,  0x6A, 0x38, 0xD9, 0x00
vertex     67,    -12,     16,      0,      0,  0x6F, 0xE8, 0x37, 0x00
vertex     67,    -26,     -5,      0,      0,  0x6E, 0xC2, 0xFE, 0x00
vertex     -8,     17,    -17,      0,      0,  0x90, 0x2A, 0xD6, 0x00
vertex     -8,     -9,    -27,      0,      0,  0x8E, 0xE8, 0xCE, 0x00
vertex     -8,    -11,     18,      0,      0,  0x8B, 0xFF, 0x2F, 0x00
vertex     -9,    -26,     -5,      0,      0,  0x96, 0xBD, 0x0E, 0x00

glabel mario_left_arm_shared_dl # 0x0400D090 - 0x0400D1D8
gsSPVertex mario_left_arm_shared_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  8,  6, 0x0
gsSP2Triangles  9,  2,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  7, 12, 10, 0x0,  5, 13, 12, 0x0
gsSP2Triangles  3, 14, 13, 0x0,  0, 11, 14, 0x0
gsSPVertex mario_left_arm_shared_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  5,  4,  3, 0x0,  6,  7,  5, 0x0
gsSP2Triangles  1,  7,  6, 0x0,  2,  1,  6, 0x0
gsSP2Triangles  6,  5,  8, 0x0,  8,  5,  3, 0x0
gsSP2Triangles  3,  0,  9, 0x0,  9,  0,  2, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_left_arm_shared_dl_vertex_group3, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  2,  4,  7, 0x0
gsSP2Triangles  0,  2,  8, 0x0,  9,  0, 10, 0x0
gsSP2Triangles  6,  9, 11, 0x0,  4,  6, 12, 0x0
gsSP1Triangle 13,  5,  3, 0x0
gsSPVertex mario_left_arm_shared_dl_vertex_group4, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  3,  4,  1, 0x0,  5,  6,  7, 0x0
gsSP1Triangle  6,  8,  7, 0x0
gsSPEndDisplayList

glabel mario_left_arm # 0x0400D1D8 - 0x0400D1F8
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_left_arm_shared_dl
gsSPEndDisplayList

mario_left_forearm_shared_dl_vertex: # 0x0400D1F8
vertex     -2,     19,     16,      0,      0,  0xDB, 0x61, 0x48, 0x00
vertex     47,     14,     13,      0,      0,  0x44, 0x44, 0x51, 0x00
vertex     47,     16,    -19,      0,      0,  0x45, 0x61, 0xD6, 0x00
vertex     -3,    -17,     26,      0,      0,  0xD7, 0xDB, 0x71, 0x00
vertex     46,    -17,     22,      0,      0,  0x41, 0xC7, 0x5C, 0x00
vertex     -3,    -38,     -4,      0,      0,  0xD4, 0x89, 0xFE, 0x00
vertex     45,    -34,     -4,      0,      0,  0x3F, 0x95, 0xE8, 0x00
vertex     -3,    -14,    -34,      0,      0,  0xD7, 0xDE, 0x8E, 0x00
vertex     46,    -14,    -30,      0,      0,  0x42, 0xF4, 0x95, 0x00
vertex     -2,     21,    -21,      0,      0,  0xDB, 0x63, 0xBB, 0x00
vertex    -14,     13,    -15,      0,      0,  0x93, 0x2C, 0xD3, 0x00
vertex    -14,     11,     10,      0,      0,  0x93, 0x3B, 0x19, 0x00
vertex    -15,    -11,    -24,      0,      0,  0x9A, 0xDE, 0xBE, 0x00
vertex    -15,    -27,     -4,      0,      0,  0x8B, 0xD2, 0x0A, 0x00
vertex    -15,    -13,     17,      0,      0,  0x9B, 0xFB, 0x4C, 0x00
vertex     58,     -7,     -3,      0,      0,  0x7E, 0xFC, 0x00, 0x00

glabel mario_left_forearm_shared_dl # 0x0400D2F8 - 0x0400D3E8
gsSPVertex mario_left_forearm_shared_dl_vertex, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  8,  6, 0x0
gsSP2Triangles  9,  2,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  7, 12, 10, 0x0,  5, 13, 12, 0x0
gsSP2Triangles  3, 14, 13, 0x0,  0, 11, 14, 0x0
gsSP2Triangles  8, 15,  6, 0x0,  6, 15,  4, 0x0
gsSP2Triangles  4, 15,  1, 0x0,  1, 15,  2, 0x0
gsSP2Triangles  2, 15,  8, 0x0,  0, 14,  3, 0x0
gsSP2Triangles  3, 13,  5, 0x0,  5, 12,  7, 0x0
gsSP2Triangles  7, 10,  9, 0x0,  9, 11,  0, 0x0
gsSP2Triangles  7,  9,  8, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  9,  0,  2, 0x0, 12, 13, 10, 0x0
gsSP2Triangles 13, 11, 10, 0x0, 13, 14, 11, 0x0
gsSPEndDisplayList

mario_left_hand_closed_shared_dl_vertex_group1: # 0x0400D3E8
vertex     36,      6,     42,      0,      0,  0xE1, 0xF0, 0x79, 0x00
vertex     17,     -1,     27,      0,      0,  0x00, 0xFD, 0x7F, 0x00
vertex     34,    -41,      3,      0,      0,  0x42, 0xA3, 0x36, 0x00
vertex     26,    -25,    -32,      0,      0,  0x09, 0xC7, 0x8F, 0x00
vertex      4,     24,    -31,      0,      0,  0xD5, 0x3F, 0x9C, 0x00
vertex     33,      7,    -44,      0,      0,  0xC6, 0xFE, 0x90, 0x00
vertex     -1,     39,      5,      0,      0,  0xEA, 0x6E, 0x3A, 0x00
vertex      5,     -6,     36,      0,      0,  0x44, 0x1B, 0x67, 0x00
vertex    -10,     26,    -38,      0,      0,  0xF0, 0x41, 0x95, 0x00
vertex     17,    -38,    -39,      0,      0,  0x1A, 0xB7, 0x9D, 0x00
vertex     86,     29,     41,      0,      0,  0x4B, 0x20, 0x60, 0x00
vertex     59,     81,      8,      0,      0,  0x11, 0x7A, 0x1D, 0x00
vertex    107,    -26,      4,      0,      0,  0x67, 0xC5, 0x2B, 0x00
vertex     61,     12,    -60,      0,      0,  0x00, 0x21, 0x86, 0x00
vertex     90,     17,    -46,      0,      0,  0x43, 0x35, 0xA3, 0x00
vertex    100,     -6,    -46,      0,      0,  0x63, 0x0A, 0xB3, 0x00

mario_left_hand_closed_shared_dl_vertex_group2: # 0x0400D4E8
vertex     90,     17,    -46,      0,      0,  0x43, 0x35, 0xA3, 0x00
vertex     57,     55,    -37,      0,      0,  0x22, 0x54, 0xA9, 0x00
vertex     99,     40,    -16,      0,      0,  0x6C, 0x3C, 0xE5, 0x00
vertex     32,     63,    -28,      0,      0,  0xD0, 0x4F, 0xAA, 0x00
vertex     12,     59,     10,      0,      0,  0xAA, 0x58, 0x1B, 0x00
vertex     59,     81,      8,      0,      0,  0x11, 0x7A, 0x1D, 0x00
vertex     80,    -31,    -61,      0,      0,  0x0C, 0xB2, 0x9D, 0x00
vertex    100,     -6,    -46,      0,      0,  0x63, 0x0A, 0xB3, 0x00
vertex    107,    -26,      4,      0,      0,  0x67, 0xC5, 0x2B, 0x00
vertex     61,     12,    -60,      0,      0,  0x00, 0x21, 0x86, 0x00
vertex     33,      7,    -44,      0,      0,  0xC6, 0xFE, 0x90, 0x00
vertex     86,     29,     41,      0,      0,  0x4B, 0x20, 0x60, 0x00
vertex     58,    -45,      7,      0,      0,  0x01, 0x85, 0x1C, 0x00
vertex     36,      6,     42,      0,      0,  0xE1, 0xF0, 0x79, 0x00

mario_left_hand_closed_shared_dl_vertex_group3: # 0x0400D5C8
vertex     27,    -58,      6,      0,      0,  0xA3, 0xAD, 0x12, 0x00
vertex    -14,    -14,     -4,      0,      0,  0x8C, 0xCD, 0x02, 0x00
vertex     17,    -38,    -39,      0,      0,  0x1A, 0xB7, 0x9D, 0x00
vertex    -10,     26,    -38,      0,      0,  0xF0, 0x41, 0x95, 0x00
vertex    -18,     45,      8,      0,      0,  0x84, 0xF3, 0x13, 0x00
vertex      5,     -6,     36,      0,      0,  0x99, 0xD2, 0x38, 0x00
vertex     34,    -41,      3,      0,      0,  0x42, 0xA3, 0x36, 0x00
vertex     27,    -58,      6,      0,      0,  0x73, 0xD5, 0x1D, 0x00
vertex     26,    -25,    -32,      0,      0,  0x09, 0xC7, 0x8F, 0x00
vertex    -18,     45,      8,      0,      0,  0x2D, 0x71, 0x21, 0x00
vertex     -1,     39,      5,      0,      0,  0xEA, 0x6E, 0x3A, 0x00
vertex      5,     -6,     36,      0,      0,  0x44, 0x1B, 0x67, 0x00
vertex     36,      6,     42,      0,      0,  0xE1, 0xF0, 0x79, 0x00
vertex     12,     59,     10,      0,      0,  0xAA, 0x58, 0x1B, 0x00
vertex     58,    -45,      7,      0,      0,  0x01, 0x85, 0x1C, 0x00

mario_left_hand_closed_shared_dl_vertex_group4: # 0x0400D6B8
vertex     26,    -25,    -32,      0,      0,  0x09, 0xC7, 0x8F, 0x00
vertex     33,      7,    -44,      0,      0,  0xC6, 0xFE, 0x90, 0x00
vertex     80,    -31,    -61,      0,      0,  0x0C, 0xB2, 0x9D, 0x00
vertex     58,    -45,      7,      0,      0,  0x01, 0x85, 0x1C, 0x00
vertex     34,    -41,      3,      0,      0,  0x42, 0xA3, 0x36, 0x00
vertex     61,     12,    -60,      0,      0,  0x00, 0x21, 0x86, 0x00
vertex     12,     59,     10,      0,      0,  0xAA, 0x58, 0x1B, 0x00
vertex     32,     63,    -28,      0,      0,  0xD0, 0x4F, 0xAA, 0x00
vertex      4,     24,    -31,      0,      0,  0xD5, 0x3F, 0x9C, 0x00
vertex     -1,     39,      5,      0,      0,  0xEA, 0x6E, 0x3A, 0x00

glabel mario_left_hand_closed_shared_dl # 0x0400D758 - 0x0400D8F0
gsSPVertex mario_left_hand_closed_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  1,  0, 0x0,  2,  1,  7, 0x0
gsSP2Triangles  7,  1,  6, 0x0,  6,  4,  8, 0x0
gsSP2Triangles  8,  4,  3, 0x0,  9,  3,  2, 0x0
gsSP2Triangles  0, 10, 11, 0x0, 12, 10,  0, 0x0
gsSP1Triangle 13, 14, 15, 0x0
gsSPVertex mario_left_hand_closed_shared_dl_vertex_group2, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  1,  3, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9, 10,  3, 0x0,  1,  0,  9, 0x0
gsSP2Triangles  9,  3,  1, 0x0,  5,  2,  1, 0x0
gsSP2Triangles  0,  2,  7, 0x0,  7,  2,  8, 0x0
gsSP2Triangles  8,  2, 11, 0x0, 11,  2,  5, 0x0
gsSP2Triangles  9,  7,  6, 0x0,  6,  8, 12, 0x0
gsSP2Triangles 12,  8, 13, 0x0, 13,  5,  4, 0x0
gsSPVertex mario_left_hand_closed_shared_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  1,  4, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  5,  1,  0, 0x0,  6,  7,  2, 0x0
gsSP2Triangles  8,  2,  3, 0x0,  3,  9, 10, 0x0
gsSP2Triangles 10,  9, 11, 0x0, 11,  7,  6, 0x0
gsSP2Triangles 10, 12, 13, 0x0,  6, 14, 12, 0x0
gsSPVertex mario_left_hand_closed_shared_dl_vertex_group4, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  1,  5,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  9,  6, 0x0
gsSP1Triangle  7,  1,  8, 0x0
gsSPEndDisplayList

glabel mario_left_hand_closed # 0x0400D8F0 - 0x0400D910
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_left_hand_closed_shared_dl
gsSPEndDisplayList

mario_right_arm_shared_dl_vertex_group1: # 0x0400D910
vertex     57,    -14,    -22,      0,      0,  0x33, 0xCF, 0x97, 0x00
vertex      5,    -44,      5,      0,      0,  0xD3, 0x8A, 0xF7, 0x00
vertex      6,    -15,    -30,      0,      0,  0xD6, 0xE6, 0x8C, 0x00
vertex     57,    -38,      6,      0,      0,  0x3E, 0x93, 0x07, 0x00
vertex      6,    -19,     44,      0,      0,  0xD5, 0xD4, 0x6E, 0x00
vertex     57,    -17,     37,      0,      0,  0x33, 0xE8, 0x71, 0x00
vertex      7,     25,     32,      0,      0,  0xD9, 0x5C, 0x4D, 0x00
vertex     58,     17,     27,      0,      0,  0x44, 0x59, 0x39, 0x00
vertex      7,     27,    -13,      0,      0,  0xDA, 0x67, 0xC2, 0x00
vertex     58,     19,     -9,      0,      0,  0x3E, 0x4A, 0xAF, 0x00
vertex     -9,    -28,      6,      0,      0,  0x96, 0xBF, 0xEC, 0x00
vertex     -9,    -10,    -15,      0,      0,  0x8F, 0x01, 0xC7, 0x00
vertex     -8,     15,     -5,      0,      0,  0x91, 0x39, 0xED, 0x00
vertex     -8,     14,     22,      0,      0,  0x99, 0x2E, 0x38, 0x00
vertex     -9,    -13,     30,      0,      0,  0x8A, 0xE9, 0x26, 0x00
vertex     67,    -12,    -13,      0,      0,  0x68, 0xEB, 0xBC, 0x00

mario_right_arm_shared_dl_vertex_group2: # 0x0400DA10
vertex     57,    -38,      6,      0,      0,  0x3E, 0x93, 0x07, 0x00
vertex     67,    -14,     28,      0,      0,  0x6F, 0xE8, 0x37, 0x00
vertex     57,    -17,     37,      0,      0,  0x33, 0xE8, 0x71, 0x00
vertex     58,     17,     27,      0,      0,  0x44, 0x59, 0x39, 0x00
vertex     67,     11,     -4,      0,      0,  0x78, 0x26, 0xF1, 0x00
vertex     58,     19,     -9,      0,      0,  0x3E, 0x4A, 0xAF, 0x00
vertex     67,     10,     21,      0,      0,  0x71, 0x2A, 0x25, 0x00
vertex     66,    -28,      6,      0,      0,  0x75, 0xD1, 0xFE, 0x00
vertex     67,    -12,    -13,      0,      0,  0x68, 0xEB, 0xBC, 0x00
vertex     -9,    -13,     30,      0,      0,  0x8A, 0xE9, 0x26, 0x00
vertex     -9,    -28,      6,      0,      0,  0x96, 0xBF, 0xEC, 0x00
vertex      5,    -44,      5,      0,      0,  0xD3, 0x8A, 0xF7, 0x00
vertex     -8,     14,     22,      0,      0,  0x99, 0x2E, 0x38, 0x00
vertex      6,    -19,     44,      0,      0,  0xD5, 0xD4, 0x6E, 0x00
vertex     -8,     15,     -5,      0,      0,  0x91, 0x39, 0xED, 0x00
vertex      7,     25,     32,      0,      0,  0xD9, 0x5C, 0x4D, 0x00

mario_right_arm_shared_dl_vertex_group3: # 0x0400DB10
vertex     -9,    -10,    -15,      0,      0,  0x8F, 0x01, 0xC7, 0x00
vertex     -8,     15,     -5,      0,      0,  0x91, 0x39, 0xED, 0x00
vertex      7,     27,    -13,      0,      0,  0xDA, 0x67, 0xC2, 0x00
vertex     -9,    -28,      6,      0,      0,  0x96, 0xBF, 0xEC, 0x00
vertex      6,    -15,    -30,      0,      0,  0xD6, 0xE6, 0x8C, 0x00
vertex     58,     19,     -9,      0,      0,  0x3E, 0x4A, 0xAF, 0x00
vertex     57,    -14,    -22,      0,      0,  0x33, 0xCF, 0x97, 0x00
vertex     58,     17,     27,      0,      0,  0x44, 0x59, 0x39, 0x00
vertex     57,    -17,     37,      0,      0,  0x33, 0xE8, 0x71, 0x00
vertex      7,     25,     32,      0,      0,  0xD9, 0x5C, 0x4D, 0x00
vertex     57,    -38,      6,      0,      0,  0x3E, 0x93, 0x07, 0x00
vertex      6,    -19,     44,      0,      0,  0xD5, 0xD4, 0x6E, 0x00
vertex      5,    -44,      5,      0,      0,  0xD3, 0x8A, 0xF7, 0x00
vertex     67,    -12,    -13,      0,      0,  0x68, 0xEB, 0xBC, 0x00
vertex     67,     11,     -4,      0,      0,  0x78, 0x26, 0xF1, 0x00
vertex     66,    -28,      6,      0,      0,  0x75, 0xD1, 0xFE, 0x00

mario_right_arm_shared_dl_vertex_group4: # 0x0400DC10
vertex     -9,    -10,    -15,      0,      0,  0x8F, 0x01, 0xC7, 0x00
vertex     -9,    -28,      6,      0,      0,  0x96, 0xBF, 0xEC, 0x00
vertex     -9,    -13,     30,      0,      0,  0x8A, 0xE9, 0x26, 0x00
vertex     -8,     15,     -5,      0,      0,  0x91, 0x39, 0xED, 0x00
vertex     -8,     14,     22,      0,      0,  0x99, 0x2E, 0x38, 0x00
vertex     67,     11,     -4,      0,      0,  0x78, 0x26, 0xF1, 0x00
vertex     67,    -14,     28,      0,      0,  0x6F, 0xE8, 0x37, 0x00
vertex     66,    -28,      6,      0,      0,  0x75, 0xD1, 0xFE, 0x00
vertex     67,     10,     21,      0,      0,  0x71, 0x2A, 0x25, 0x00

glabel mario_right_arm_shared_dl # 0x0400DCA0 - 0x0400DDE8
gsSPVertex mario_right_arm_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  8,  6, 0x0
gsSP2Triangles  9,  2,  8, 0x0,  1, 10,  2, 0x0
gsSP2Triangles  2, 11,  8, 0x0,  8, 12,  6, 0x0
gsSP2Triangles  6, 13,  4, 0x0,  4, 14,  1, 0x0
gsSP2Triangles  9, 15,  0, 0x0,  0, 15,  3, 0x0
gsSPVertex mario_right_arm_shared_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  4,  5, 0x0,  3,  6,  4, 0x0
gsSP2Triangles  1,  6,  3, 0x0,  0,  7,  1, 0x0
gsSP2Triangles  8,  7,  0, 0x0,  5,  4,  8, 0x0
gsSP2Triangles  9, 10, 11, 0x0, 12,  9, 13, 0x0
gsSP1Triangle 14, 12, 15, 0x0
gsSPVertex mario_right_arm_shared_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  5,  2, 0x0
gsSP2Triangles  8,  7,  9, 0x0, 10,  8, 11, 0x0
gsSP2Triangles  6, 10, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_right_arm_shared_dl_vertex_group4, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  5,  6,  7, 0x0
gsSP1Triangle  5,  8,  6, 0x0
gsSPEndDisplayList

glabel mario_right_arm # 0x0400DDE8 - 0x0400DE08
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_right_arm_shared_dl
gsSPEndDisplayList

mario_right_forearm_shared_dl_vertex: # 0x0400DE08
vertex     47,    -15,    -19,      0,      0,  0x41, 0xCF, 0x9F, 0x00
vertex     -3,    -39,      6,      0,      0,  0xD4, 0x8A, 0xF8, 0x00
vertex     -2,    -15,    -23,      0,      0,  0xD7, 0xE5, 0x8C, 0x00
vertex     46,    -36,      6,      0,      0,  0x3F, 0x94, 0x0F, 0x00
vertex     -2,    -18,     38,      0,      0,  0xD6, 0xD5, 0x6F, 0x00
vertex     47,    -17,     34,      0,      0,  0x42, 0xEC, 0x6A, 0x00
vertex     -1,     18,     28,      0,      0,  0xDB, 0x5D, 0x4D, 0x00
vertex     48,     13,     25,      0,      0,  0x45, 0x5D, 0x32, 0x00
vertex     -1,     20,     -9,      0,      0,  0xDB, 0x67, 0xC1, 0x00
vertex     48,     15,     -7,      0,      0,  0x45, 0x4C, 0xB6, 0x00
vertex    -14,    -28,      6,      0,      0,  0x90, 0xC9, 0xEF, 0x00
vertex    -14,    -12,    -13,      0,      0,  0x91, 0x01, 0xC3, 0x00
vertex    -13,     12,     -4,      0,      0,  0x9E, 0x4B, 0xE7, 0x00
vertex    -13,     10,     21,      0,      0,  0x8D, 0x22, 0x28, 0x00
vertex    -14,    -14,     28,      0,      0,  0x9A, 0xD8, 0x3F, 0x00
vertex     59,     -8,      7,      0,      0,  0x7F, 0xFD, 0x00, 0x00

glabel mario_right_forearm_shared_dl # 0x0400DF08 - 0x0400DFF8
gsSPVertex mario_right_forearm_shared_dl_vertex, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  8,  6, 0x0
gsSP2Triangles  9,  2,  8, 0x0,  1, 10,  2, 0x0
gsSP2Triangles  2, 11,  8, 0x0,  8, 12,  6, 0x0
gsSP2Triangles  6, 13,  4, 0x0,  4, 14,  1, 0x0
gsSP2Triangles  9, 15,  0, 0x0,  0, 15,  3, 0x0
gsSP2Triangles  3, 15,  5, 0x0,  5, 15,  7, 0x0
gsSP2Triangles  7, 15,  9, 0x0, 14, 10,  1, 0x0
gsSP2Triangles 13, 14,  4, 0x0, 12, 13,  6, 0x0
gsSP2Triangles 11, 12,  8, 0x0, 10, 11,  2, 0x0
gsSP2Triangles  9,  0,  2, 0x0,  7,  9,  8, 0x0
gsSP2Triangles  5,  7,  6, 0x0,  3,  5,  4, 0x0
gsSP2Triangles  0,  3,  1, 0x0, 11, 13, 12, 0x0
gsSP2Triangles 11, 10, 13, 0x0, 10, 14, 13, 0x0
gsSPEndDisplayList

mario_right_hand_closed_dl_vertex_group1: # 0x0400DFF8
vertex     35,      9,    -37,      0,      0,  0xE5, 0xF5, 0x85, 0x00
vertex     55,    -44,     -4,      0,      0,  0x00, 0x86, 0xDF, 0x00
vertex     31,    -40,     -1,      0,      0,  0x43, 0xA4, 0xC9, 0x00
vertex     10,     60,     -4,      0,      0,  0xAC, 0x5A, 0xE5, 0x00
vertex     -2,     41,     -1,      0,      0,  0xED, 0x70, 0xC9, 0x00
vertex     24,    -57,     -4,      0,      0,  0x73, 0xD4, 0xE6, 0x00
vertex      4,     -3,    -33,      0,      0,  0x48, 0x1E, 0x9D, 0x00
vertex    -19,     47,     -4,      0,      0,  0x30, 0x72, 0xE5, 0x00
vertex    -14,     26,     41,      0,      0,  0xED, 0x3D, 0x6D, 0x00
vertex     13,    -38,     41,      0,      0,  0x15, 0xB3, 0x61, 0x00
vertex     23,    -26,     35,      0,      0,  0x04, 0xC3, 0x6E, 0x00
vertex     24,    -57,     -4,      0,      0,  0xA2, 0xAF, 0xE7, 0x00
vertex    -16,    -12,      6,      0,      0,  0x8C, 0xCF, 0xF8, 0x00
vertex      4,     -3,    -33,      0,      0,  0x9B, 0xD5, 0xC2, 0x00
vertex    -19,     47,     -4,      0,      0,  0x85, 0xF5, 0xE7, 0x00
vertex     58,     81,      0,      0,      0,  0x14, 0x7B, 0xE9, 0x00

mario_right_hand_closed_dl_vertex_group2: # 0x0400E0F8
vertex     35,      9,    -37,      0,      0,  0xE5, 0xF5, 0x85, 0x00
vertex    104,    -26,      1,      0,      0,  0x68, 0xC5, 0xD7, 0x00
vertex     55,    -44,     -4,      0,      0,  0x00, 0x86, 0xDF, 0x00
vertex     75,    -33,     66,      0,      0,  0x08, 0xAF, 0x60, 0x00
vertex     96,     -8,     52,      0,      0,  0x60, 0x06, 0x51, 0x00
vertex     57,     10,     66,      0,      0,  0xFD, 0x1C, 0x7B, 0x00
vertex     58,     81,      0,      0,      0,  0x14, 0x7B, 0xE9, 0x00
vertex     97,     39,     24,      0,      0,  0x6B, 0x3A, 0x21, 0x00
vertex     86,     30,    -33,      0,      0,  0x4F, 0x22, 0xA4, 0x00
vertex     86,     15,     52,      0,      0,  0x40, 0x30, 0x61, 0x00
vertex     54,     54,     44,      0,      0,  0x20, 0x51, 0x5C, 0x00
vertex     29,     62,     34,      0,      0,  0xCE, 0x4C, 0x57, 0x00
vertex     29,      6,     49,      0,      0,  0xC2, 0xFA, 0x6E, 0x00
vertex     10,     60,     -4,      0,      0,  0xAC, 0x5A, 0xE5, 0x00

mario_right_hand_closed_dl_vertex_group3: # 0x0400E1D8
vertex     31,    -40,     -1,      0,      0,  0x43, 0xA4, 0xC9, 0x00
vertex     23,    -26,     35,      0,      0,  0x04, 0xC3, 0x6E, 0x00
vertex     13,    -38,     41,      0,      0,  0x15, 0xB3, 0x61, 0x00
vertex      1,     24,     35,      0,      0,  0xD2, 0x3C, 0x65, 0x00
vertex    -14,     26,     41,      0,      0,  0xED, 0x3D, 0x6D, 0x00
vertex     -2,     41,     -1,      0,      0,  0xED, 0x70, 0xC9, 0x00
vertex     15,      0,    -23,      0,      0,  0x04, 0x01, 0x82, 0x00
vertex      4,     -3,    -33,      0,      0,  0x48, 0x1E, 0x9D, 0x00
vertex     35,      9,    -37,      0,      0,  0xE5, 0xF5, 0x85, 0x00
vertex     29,      6,     49,      0,      0,  0xC2, 0xFA, 0x6E, 0x00
vertex     55,    -44,     -4,      0,      0,  0x00, 0x86, 0xDF, 0x00
vertex     75,    -33,     66,      0,      0,  0x08, 0xAF, 0x60, 0x00
vertex     57,     10,     66,      0,      0,  0xFD, 0x1C, 0x7B, 0x00
vertex     10,     60,     -4,      0,      0,  0xAC, 0x5A, 0xE5, 0x00
vertex     29,     62,     34,      0,      0,  0xCE, 0x4C, 0x57, 0x00

glabel mario_right_hand_closed_dl # 0x0400E2C8 - 0x0400E458
gsSPVertex mario_right_hand_closed_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  2,  5,  6, 0x0,  6,  7,  4, 0x0
gsSP2Triangles  4,  7,  8, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  9,  5,  2, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 13, 12, 14, 0x0, 14, 12,  8, 0x0
gsSP2Triangles  8, 12,  9, 0x0,  9, 12, 11, 0x0
gsSP1Triangle  3, 15,  0, 0x0
gsSPVertex mario_right_hand_closed_dl_vertex_group2, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  4,  5, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  8,  7,  1, 0x0,  1,  7,  4, 0x0
gsSP2Triangles  4,  7,  9, 0x0, 10,  7,  6, 0x0
gsSP2Triangles  9, 10,  5, 0x0, 10, 11,  5, 0x0
gsSP2Triangles 11, 12,  5, 0x0,  1,  4,  3, 0x0
gsSP2Triangles 11, 10,  6, 0x0,  6, 13, 11, 0x0
gsSP2Triangles  7, 10,  9, 0x0,  4,  9,  5, 0x0
gsSP2Triangles  0,  8,  1, 0x0,  6,  8,  0, 0x0
gsSPVertex mario_right_hand_closed_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  7,  6,  0, 0x0,  8,  6,  5, 0x0
gsSP2Triangles  9,  3,  1, 0x0,  0,  6,  8, 0x0
gsSP2Triangles 10, 11,  1, 0x0, 11,  9,  1, 0x0
gsSP2Triangles 11, 12,  9, 0x0,  1,  0, 10, 0x0
gsSP2Triangles 13,  5,  3, 0x0,  3,  9, 14, 0x0
gsSP1Triangle 14, 13,  3, 0x0
gsSPEndDisplayList

glabel mario_right_hand_closed # 0x0400E458 - 0x0400E478
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_right_hand_closed_dl
gsSPEndDisplayList

glabel mario_metal_right_hand_closed # 0x0400E478 - 0x0400E4A8
gsSPDisplayList mario_right_hand_closed_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsSPEndDisplayList

mario_left_thigh_dl_vertex_group1: # 0x0400E4A8
vertex      1,    -44,      8,      0,      0,  0xAB, 0xA2, 0x00, 0x00
vertex    -15,      0,      7,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex      0,    -13,    -32,      0,      0,  0x9F, 0xE1, 0xB5, 0x00
vertex     -4,     37,    -17,      0,      0,  0x9E, 0x30, 0xC0, 0x00
vertex     -5,     37,     31,      0,      0,  0xA0, 0x3F, 0x34, 0x00
vertex     -1,    -12,     47,      0,      0,  0x9E, 0xE3, 0x49, 0x00
vertex     95,     -5,     48,      0,      0,  0x4E, 0xE9, 0x60, 0x00
vertex    116,     10,      8,      0,      0,  0x7E, 0x09, 0x01, 0x00
vertex     91,     45,     32,      0,      0,  0x3C, 0x4E, 0x4F, 0x00
vertex     92,     45,    -16,      0,      0,  0x35, 0x5D, 0xBD, 0x00
vertex     96,     -5,    -31,      0,      0,  0x50, 0xE8, 0xA1, 0x00
vertex     98,    -37,      8,      0,      0,  0x46, 0x97, 0x01, 0x00
vertex     19,    -15,    -42,      0,      0,  0xEC, 0xD9, 0x8A, 0x00
vertex     14,     48,    -23,      0,      0,  0xD7, 0x67, 0xC5, 0x00
vertex     13,     48,     38,      0,      0,  0xE7, 0x6D, 0x3A, 0x00
vertex     18,    -15,     58,      0,      0,  0xEA, 0xDA, 0x76, 0x00

mario_left_thigh_dl_vertex_group2: # 0x0400E5A8
vertex     18,    -15,     58,      0,      0,  0xEA, 0xDA, 0x76, 0x00
vertex      1,    -44,      8,      0,      0,  0xAB, 0xA2, 0x00, 0x00
vertex     21,    -54,      8,      0,      0,  0xF0, 0x83, 0x00, 0x00
vertex     19,    -15,    -42,      0,      0,  0xEC, 0xD9, 0x8A, 0x00
vertex     -1,    -12,     47,      0,      0,  0x9E, 0xE3, 0x49, 0x00
vertex    -15,      0,      7,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     98,    -37,      8,      0,      0,  0x46, 0x97, 0x01, 0x00
vertex     13,     48,     38,      0,      0,  0xE7, 0x6D, 0x3A, 0x00
vertex     91,     45,     32,      0,      0,  0x3C, 0x4E, 0x4F, 0x00
vertex     14,     48,    -23,      0,      0,  0xD7, 0x67, 0xC5, 0x00
vertex     92,     45,    -16,      0,      0,  0x35, 0x5D, 0xBD, 0x00
vertex     96,     -5,    -31,      0,      0,  0x50, 0xE8, 0xA1, 0x00
vertex     95,     -5,     48,      0,      0,  0x4E, 0xE9, 0x60, 0x00
vertex      0,    -13,    -32,      0,      0,  0x9F, 0xE1, 0xB5, 0x00
vertex     -5,     37,     31,      0,      0,  0xA0, 0x3F, 0x34, 0x00
vertex     -4,     37,    -17,      0,      0,  0x9E, 0x30, 0xC0, 0x00

glabel mario_left_thigh_dl # 0x0400E6A8 - 0x0400E7B0
gsSPVertex mario_left_thigh_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  1,  4, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  9,  7, 10, 0x0, 10,  7, 11, 0x0
gsSP2Triangles 11,  7,  6, 0x0, 12,  3, 13, 0x0
gsSP2Triangles 13,  4, 14, 0x0, 14,  4, 15, 0x0
gsSPVertex mario_left_thigh_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  4,  5,  1, 0x0,  0,  2,  6, 0x0
gsSP2Triangles  7,  0,  8, 0x0,  9,  7, 10, 0x0
gsSP2Triangles  3,  9, 10, 0x0,  2,  3,  6, 0x0
gsSP2Triangles  3, 11,  6, 0x0, 10, 11,  3, 0x0
gsSP2Triangles  7,  8, 10, 0x0,  0, 12,  8, 0x0
gsSP2Triangles  6, 12,  0, 0x0,  1, 13,  3, 0x0
gsSP2Triangles  0,  4,  1, 0x0, 14,  4,  0, 0x0
gsSP2Triangles  9, 15, 14, 0x0,  3, 13, 15, 0x0
gsSPEndDisplayList

glabel mario_left_thigh # 0x0400E7B0 - 0x0400E7E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_left_thigh_dl
gsSPEndDisplayList

glabel mario_metal_left_thigh # 0x0400E7E0 - 0x0400E858
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_left_thigh_dl
gsSPEndDisplayList

mario_left_leg_shared_dl_vertex: # 0x0400E858
vertex      4,    -37,      9,      0,      0,  0xC1, 0x93, 0x00, 0x00
vertex     64,    -46,      9,      0,      0,  0x4B, 0x9A, 0x01, 0x00
vertex     65,    -11,     54,      0,      0,  0x2D, 0xDB, 0x70, 0x00
vertex      8,     44,     33,      0,      0,  0xCC, 0x5E, 0x43, 0x00
vertex     68,     45,     37,      0,      0,  0x52, 0x4B, 0x3C, 0x00
vertex     69,     45,    -18,      0,      0,  0x42, 0x61, 0xD1, 0x00
vertex      9,     44,    -16,      0,      0,  0xC4, 0x4D, 0xAF, 0x00
vertex     66,    -11,    -36,      0,      0,  0x2E, 0xDA, 0x91, 0x00
vertex      6,     -6,    -31,      0,      0,  0xB4, 0xE5, 0x9F, 0x00
vertex      6,     -6,     49,      0,      0,  0xB3, 0xE7, 0x60, 0x00
vertex    -14,      8,      8,      0,      0,  0x82, 0x06, 0xFF, 0x00
vertex     81,      3,      9,      0,      0,  0x7E, 0xFA, 0x01, 0x00

glabel mario_left_leg_shared_dl # 0x0400E918 - 0x0400E9C8
gsSPVertex mario_left_leg_shared_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  4, 0x0
gsSP2Triangles  3,  4,  5, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  0,  7,  1, 0x0,  0,  8,  7, 0x0
gsSP2Triangles  7,  8,  6, 0x0,  5,  6,  3, 0x0
gsSP2Triangles  3,  9,  2, 0x0,  2,  9,  0, 0x0
gsSP2Triangles  3, 10,  9, 0x0,  5, 11,  7, 0x0
gsSP2Triangles  7, 11,  1, 0x0,  1, 11,  2, 0x0
gsSP2Triangles  2, 11,  4, 0x0,  4, 11,  5, 0x0
gsSP2Triangles  9, 10,  0, 0x0,  0, 10,  8, 0x0
gsSP2Triangles  8, 10,  6, 0x0,  6, 10,  3, 0x0
gsSPEndDisplayList

mario_left_foot_shared_dl_vertex_group1: # 0x0400E9C8
vertex    110,      9,     35,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    110,      8,    -20,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     76,     20,    -41,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     78,     21,     61,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -12,     53,    -32,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -11,     54,     53,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -39,     64,     -8,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -41,     65,     26,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     43,    -18,     54,      0,      0,  0x07, 0xB3, 0x64, 0x00
vertex     78,     21,     61,      0,      0,  0x15, 0xDB, 0x77, 0x00
vertex    -11,     54,     53,      0,      0,  0xD9, 0x00, 0x78, 0x00
vertex     44,    -12,    -33,      0,      0,  0x01, 0xB7, 0x99, 0x00
vertex    -35,     11,    -21,      0,      0,  0xB5, 0xD2, 0xA5, 0x00
vertex    -12,     53,    -32,      0,      0,  0xD7, 0xFD, 0x89, 0x00
vertex    -34,     12,     44,      0,      0,  0xB2, 0xD2, 0x58, 0x00
vertex     76,     20,    -41,      0,      0,  0x0C, 0xD8, 0x89, 0x00

mario_left_foot_shared_dl_vertex_group2: # 0x0400EAC8
vertex     44,    -12,    -33,      0,      0,  0x01, 0xB7, 0x99, 0x00
vertex     76,     20,    -41,      0,      0,  0x0C, 0xD8, 0x89, 0x00
vertex    110,      8,    -20,      0,      0,  0x44, 0xAD, 0xBE, 0x00
vertex     80,    -31,      7,      0,      0,  0x34, 0x8D, 0xFB, 0x00
vertex    110,      9,     35,      0,      0,  0x4C, 0xAF, 0x3C, 0x00
vertex     78,     21,     61,      0,      0,  0x15, 0xDB, 0x77, 0x00
vertex     43,    -18,     54,      0,      0,  0x07, 0xB3, 0x64, 0x00
vertex    -34,     12,     44,      0,      0,  0xB2, 0xD2, 0x58, 0x00
vertex    -11,     54,     53,      0,      0,  0xD9, 0x00, 0x78, 0x00
vertex    -41,     65,     26,      0,      0,  0x90, 0x17, 0x35, 0x00
vertex    -39,     64,     -8,      0,      0,  0x93, 0x16, 0xC4, 0x00
vertex    -35,     11,    -21,      0,      0,  0xB5, 0xD2, 0xA5, 0x00
vertex    -54,     15,      8,      0,      0,  0x88, 0xD8, 0xFD, 0x00
vertex    -12,     53,    -32,      0,      0,  0xD7, 0xFD, 0x89, 0x00
vertex     27,    -35,     11,      0,      0,  0xDB, 0x87, 0xFC, 0x00

glabel mario_left_foot_shared_dl # 0x0400EBB8 - 0x0400ECA0
gsSPVertex mario_left_foot_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  3,  2,  4, 0x0,  5,  3,  4, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 14,  8, 10, 0x0, 11, 13, 15, 0x0
gsSPVertex mario_left_foot_shared_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  4, 0x0
gsSP2Triangles  2,  3,  0, 0x0,  4,  5,  6, 0x0
gsSP2Triangles  6,  3,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP2Triangles 12,  9, 10, 0x0,  9, 12,  7, 0x0
gsSP2Triangles 14,  0,  3, 0x0, 11,  0, 14, 0x0
gsSP2Triangles  3,  6, 14, 0x0, 14,  6,  7, 0x0
gsSP2Triangles 14,  7, 12, 0x0, 12, 11, 14, 0x0
gsSPEndDisplayList

glabel mario_left_foot # 0x0400ECA0 - 0x0400ECC0
gsSPLight mario_diff_light_group4, 1
gsSPLight mario_amb_light_group4, 2
gsSPDisplayList mario_left_foot_shared_dl
gsSPEndDisplayList

mario_right_thigh_shared_dl_vertex_group1: # 0x0400ECC0
vertex     98,    -35,    -10,      0,      0,  0x47, 0x97, 0xFC, 0x00
vertex     19,    -16,     41,      0,      0,  0xEE, 0xD6, 0x76, 0x00
vertex     22,    -54,     -9,      0,      0,  0xF2, 0x82, 0xFD, 0x00
vertex     91,     46,     16,      0,      0,  0x35, 0x5C, 0x44, 0x00
vertex     13,     48,     24,      0,      0,  0xD6, 0x66, 0x3E, 0x00
vertex     12,     49,    -37,      0,      0,  0xE5, 0x6E, 0xC9, 0x00
vertex     90,     47,    -32,      0,      0,  0x3B, 0x50, 0xB2, 0x00
vertex     18,    -13,    -58,      0,      0,  0xEA, 0xDC, 0x89, 0x00
vertex      1,    -44,     -9,      0,      0,  0xAD, 0xA1, 0xFF, 0x00
vertex    -15,      0,     -7,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     -1,    -11,    -47,      0,      0,  0x9D, 0xE3, 0xB7, 0x00
vertex     -6,     38,    -31,      0,      0,  0x9E, 0x3F, 0xCF, 0x00
vertex     -5,     36,     18,      0,      0,  0x9E, 0x2D, 0x42, 0x00
vertex     95,     -3,    -49,      0,      0,  0x4D, 0xEC, 0x9E, 0x00
vertex    116,     11,     -9,      0,      0,  0x7E, 0x0B, 0xFE, 0x00
vertex     96,     -5,     30,      0,      0,  0x51, 0xE7, 0x5D, 0x00

mario_right_thigh_shared_dl_vertex_group2: # 0x0400EDC0
vertex     -5,     36,     18,      0,      0,  0x9E, 0x2D, 0x42, 0x00
vertex    -15,      0,     -7,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex      0,    -14,     31,      0,      0,  0xA0, 0xDF, 0x4B, 0x00
vertex      1,    -44,     -9,      0,      0,  0xAD, 0xA1, 0xFF, 0x00
vertex     19,    -16,     41,      0,      0,  0xEE, 0xD6, 0x76, 0x00
vertex     -6,     38,    -31,      0,      0,  0x9E, 0x3F, 0xCF, 0x00
vertex     13,     48,     24,      0,      0,  0xD6, 0x66, 0x3E, 0x00
vertex     18,    -13,    -58,      0,      0,  0xEA, 0xDC, 0x89, 0x00
vertex     -1,    -11,    -47,      0,      0,  0x9D, 0xE3, 0xB7, 0x00
vertex     95,     -3,    -49,      0,      0,  0x4D, 0xEC, 0x9E, 0x00
vertex     98,    -35,    -10,      0,      0,  0x47, 0x97, 0xFC, 0x00
vertex     90,     47,    -32,      0,      0,  0x3B, 0x50, 0xB2, 0x00
vertex     91,     46,     16,      0,      0,  0x35, 0x5C, 0x44, 0x00
vertex     12,     49,    -37,      0,      0,  0xE5, 0x6E, 0xC9, 0x00
vertex     96,     -5,     30,      0,      0,  0x51, 0xE7, 0x5D, 0x00

glabel mario_right_thigh_shared_dl # 0x0400EEB0 - 0x0400EFB8
gsSPVertex mario_right_thigh_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  6,  7,  5, 0x0
gsSP2Triangles  0,  2,  7, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  1,  8,  2, 0x0,  2,  8,  7, 0x0
gsSP2Triangles  7, 11,  5, 0x0,  5, 11,  4, 0x0
gsSP2Triangles  4, 12,  1, 0x0, 13, 14,  0, 0x0
gsSP2Triangles  0, 14, 15, 0x0, 15, 14,  3, 0x0
gsSP2Triangles  3, 14,  6, 0x0,  6, 14, 13, 0x0
gsSP2Triangles 10,  9, 11, 0x0, 11,  9, 12, 0x0
gsSPVertex mario_right_thigh_shared_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  5,  0,  6, 0x0
gsSP2Triangles  7,  8,  5, 0x0,  3,  8,  7, 0x0
gsSP2Triangles  4,  2,  3, 0x0,  7,  9, 10, 0x0
gsSP2Triangles 11,  9,  7, 0x0, 12, 11, 13, 0x0
gsSP2Triangles  4, 14, 12, 0x0, 10, 14,  4, 0x0
gsSPEndDisplayList

glabel mario_right_thigh # 0x0400EFB8 - 0x0400EFD8
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_right_thigh_shared_dl
gsSPEndDisplayList

mario_right_leg_shared_dl_vertex_group1: # 0x0400EFD8
vertex     63,    -45,    -12,      0,      0,  0xF2, 0x9B, 0x4A, 0x00
vertex     66,    -11,     34,      0,      0,  0xF2, 0x9B, 0x4A, 0x00
vertex      4,    -36,    -10,      0,      0,  0xC0, 0x93, 0xFE, 0x00
vertex     66,    -11,     34,      0,      0,  0xFB, 0x22, 0x7A, 0x00
vertex     69,     45,     18,      0,      0,  0xFC, 0x22, 0x7A, 0x00
vertex      9,     44,     16,      0,      0,  0xC6, 0x4B, 0x53, 0x00
vertex     69,     45,     18,      0,      0,  0xFF, 0x7F, 0x03, 0x00
vertex     69,     46,    -37,      0,      0,  0xFF, 0x7F, 0x03, 0x00
vertex      9,     46,    -33,      0,      0,  0xCD, 0x60, 0xC0, 0x00
vertex     69,     46,    -37,      0,      0,  0xF7, 0x27, 0x88, 0x00
vertex     65,     -9,    -56,      0,      0,  0xF8, 0x28, 0x88, 0x00
vertex     65,     -9,    -56,      0,      0,  0xEF, 0xA0, 0xB0, 0x00
vertex     63,    -45,    -12,      0,      0,  0xEF, 0xA0, 0xB0, 0x00
vertex      6,     -6,     30,      0,      0,  0xB4, 0xE4, 0x61, 0x00
vertex    -13,     10,     -9,      0,      0,  0x82, 0x08, 0x02, 0x00
vertex      5,     -3,    -50,      0,      0,  0xB2, 0xEA, 0xA0, 0x00

mario_right_leg_shared_dl_vertex_group2: # 0x0400F0D8
vertex     65,     -9,    -56,      0,      0,  0x75, 0xEE, 0xD5, 0x00
vertex     83,      4,    -10,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     63,    -45,    -12,      0,      0,  0x75, 0xD1, 0xFD, 0x00
vertex     66,    -11,     34,      0,      0,  0x77, 0xEC, 0x26, 0x00
vertex     69,     45,     18,      0,      0,  0x7A, 0x18, 0x17, 0x00
vertex     69,     46,    -37,      0,      0,  0x79, 0x19, 0xE6, 0x00
vertex      4,    -36,    -10,      0,      0,  0xC0, 0x93, 0xFE, 0x00
vertex      5,     -3,    -50,      0,      0,  0xB2, 0xEA, 0xA0, 0x00
vertex     65,     -9,    -56,      0,      0,  0xEF, 0xA0, 0xB0, 0x00
vertex     65,     -9,    -56,      0,      0,  0xF8, 0x28, 0x88, 0x00
vertex      9,     46,    -33,      0,      0,  0xCD, 0x60, 0xC0, 0x00
vertex      9,     44,     16,      0,      0,  0xC6, 0x4B, 0x53, 0x00
vertex     69,     45,     18,      0,      0,  0xFF, 0x7F, 0x03, 0x00
vertex      6,     -6,     30,      0,      0,  0xB4, 0xE4, 0x61, 0x00
vertex     66,    -11,     34,      0,      0,  0xFB, 0x22, 0x7A, 0x00
vertex     66,    -11,     34,      0,      0,  0xF2, 0x9B, 0x4A, 0x00

glabel mario_right_leg_shared_dl # 0x0400F1D8 - 0x0400F290
gsSPVertex mario_right_leg_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  8, 0x0
gsSP2Triangles 11, 12,  2, 0x0, 13, 14,  2, 0x0
gsSP2Triangles  2, 14, 15, 0x0, 15, 14,  8, 0x0
gsSP2Triangles  8, 14,  5, 0x0,  5, 14, 13, 0x0
gsSPVertex mario_right_leg_shared_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  1,  4, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  5,  1,  0, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9,  7, 10, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 11, 13, 14, 0x0, 15, 13,  6, 0x0
gsSPEndDisplayList

mario_right_foot_dl_vertex_group1: # 0x0400F290
vertex     27,    -35,    -11,      0,      0,  0xDC, 0x87, 0x06, 0x00
vertex    -36,     11,     19,      0,      0,  0xB5, 0xD3, 0x5B, 0x00
vertex    -54,     14,    -10,      0,      0,  0x89, 0xD6, 0x03, 0x00
vertex    -34,     11,    -46,      0,      0,  0xB4, 0xD0, 0xA8, 0x00
vertex     43,    -18,    -55,      0,      0,  0x0A, 0xB2, 0x9D, 0x00
vertex     80,    -29,     -7,      0,      0,  0x36, 0x8E, 0x08, 0x00
vertex     44,    -11,     32,      0,      0,  0x01, 0xB8, 0x68, 0x00
vertex    -42,     64,    -29,      0,      0,  0x90, 0x14, 0xC9, 0x00
vertex    -40,     63,      5,      0,      0,  0x92, 0x15, 0x3B, 0x00
vertex    -14,     54,     29,      0,      0,  0xD5, 0xFE, 0x77, 0x00
vertex    -11,     53,    -56,      0,      0,  0xDA, 0xFE, 0x87, 0x00
vertex    110,     11,    -36,      0,      0,  0x4E, 0xB0, 0xC6, 0x00
vertex     78,     22,    -61,      0,      0,  0x17, 0xD9, 0x8A, 0x00
vertex    109,     11,     20,      0,      0,  0x45, 0xAF, 0x44, 0x00
vertex     75,     23,     40,      0,      0,  0x0B, 0xDA, 0x78, 0x00

mario_right_foot_dl_vertex_group2: # 0x0400F380
vertex    -42,     64,    -29,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -40,     63,      5,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -11,     53,    -56,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -14,     54,     29,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex     78,     22,    -61,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex     75,     23,     40,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    110,     11,    -36,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    109,     11,     20,      0,      0,  0x29, 0x77, 0x00, 0x00

glabel mario_right_foot_dl # 0x0400F400 - 0x0400F4E8
gsSPVertex mario_right_foot_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  3,  4,  0, 0x0,  0,  4,  5, 0x0
gsSP2Triangles  0,  6,  1, 0x0,  5,  6,  0, 0x0
gsSP2Triangles  3,  2,  7, 0x0,  8,  7,  2, 0x0
gsSP2Triangles  1,  9,  8, 0x0,  2,  1,  8, 0x0
gsSP2Triangles  7, 10,  3, 0x0, 11,  5,  4, 0x0
gsSP2Triangles  4, 12, 11, 0x0,  6,  5, 13, 0x0
gsSP2Triangles 11, 13,  5, 0x0, 13, 14,  6, 0x0
gsSP2Triangles 14,  9,  6, 0x0, 10,  4,  3, 0x0
gsSP2Triangles  9,  1,  6, 0x0, 10, 12,  4, 0x0
gsSPVertex mario_right_foot_dl_vertex_group2, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  3,  4,  2, 0x0,  3,  5,  4, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  5,  7,  6, 0x0
gsSPEndDisplayList

glabel mario_right_foot # 0x0400F4E8 - 0x0400F528
gsSPLight mario_diff_light_group4, 1
gsSPLight mario_amb_light_group4, 2
gsSPDisplayList mario_right_foot_dl
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetAlphaCompare G_AC_NONE
gsSPEndDisplayList

glabel mario_metal_right_foot # 0x0400F528 - 0x0400F568
gsSPDisplayList mario_right_foot_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetAlphaCompare G_AC_NONE
gsSPEndDisplayList

mario_yellow_button_dl_vertex: # 0x0400F568
vertex      9,     89,     41,    180,    962,  0x14, 0x78, 0x23, 0xFF
vertex      3,     77,     62,    682,    966,  0x04, 0x6A, 0x44, 0xFF
vertex     47,     75,     35,     34,    106,  0x39, 0x6A, 0x26, 0xFF
vertex     28,     85,     30,    -60,    572,  0x2C, 0x76, 0x08, 0xFF
vertex     17,     66,     76,    966,    590,  0x19, 0x58, 0x57, 0xFF
vertex     32,     62,     74,    902,    252,  0x29, 0x53, 0x56, 0xFF
vertex     48,     64,     59,    548,      0,  0x4D, 0x51, 0x3A, 0xFF
vertex      9,     89,    -40,    776,    920,  0x10, 0x7B, 0xE7, 0xFF
vertex     28,     85,    -29,    990,    512,  0x2D, 0x75, 0xF2, 0xFF
vertex     47,     75,    -34,    850,     72,  0x3E, 0x6A, 0xE2, 0xFF
vertex      3,     77,    -61,    264,    972,  0x03, 0x6A, 0xBB, 0xFF
vertex     48,     64,    -58,    312,      0,  0x4D, 0x50, 0xC5, 0xFF
vertex     32,     62,    -73,    -24,    310,  0x29, 0x52, 0xA9, 0xFF
vertex     17,     66,    -75,    -58,    642,  0x17, 0x58, 0xA8, 0xFF

mario_tshirt_shared_dl_vertex_group1: # 0x0400F648
vertex     47,     75,    -34,      0,      0,  0x3E, 0x6A, 0xE2, 0xFF
vertex     47,     75,     35,      0,      0,  0x39, 0x6A, 0x26, 0xFF
vertex     82,     37,     27,      0,      0,  0x66, 0x48, 0x14, 0xFF
vertex     82,     37,    -26,      0,      0,  0x69, 0x43, 0xEC, 0xFF
vertex    100,      1,     24,      0,      0,  0x7A, 0x17, 0x16, 0xFF
vertex    100,      1,    -23,      0,      0,  0x7C, 0x09, 0xEA, 0xFF
vertex      6,    -10,    -92,      0,      0,  0x00, 0xEB, 0x83, 0xFF
vertex     47,      3,    -88,      0,      0,  0x30, 0x09, 0x8B, 0xFF
vertex     46,    -34,    -83,      0,      0,  0x24, 0xC8, 0x95, 0xFF
vertex     12,     33,    -90,      0,      0,  0x11, 0x20, 0x87, 0xFF
vertex     20,    -61,    -67,      0,      0,  0x0A, 0x9A, 0xB7, 0xFF
vertex     66,    -52,    -50,      0,      0,  0x3B, 0x9A, 0xD3, 0xFF
vertex     84,    -29,    -62,      0,      0,  0x5F, 0xDE, 0xB4, 0xFF
vertex     20,    -61,     68,      0,      0,  0x0A, 0x99, 0x49, 0xFF
vertex     66,    -52,     51,      0,      0,  0x3B, 0x9A, 0x2D, 0xFF
vertex     46,    -34,     84,      0,      0,  0x24, 0xC8, 0x6B, 0xFF

mario_tshirt_shared_dl_vertex_group2: # 0x0400F748
vertex     20,    -61,     68,      0,      0,  0x0A, 0x99, 0x49, 0xFF
vertex     46,    -34,     84,      0,      0,  0x24, 0xC8, 0x6B, 0xFF
vertex      6,    -11,     93,      0,      0,  0x00, 0xEA, 0x7C, 0xFF
vertex     47,      3,     89,      0,      0,  0x30, 0x08, 0x75, 0xFF
vertex     84,    -29,     63,      0,      0,  0x5F, 0xDE, 0x4C, 0xFF
vertex     66,    -52,     51,      0,      0,  0x3B, 0x9A, 0x2D, 0xFF
vertex     13,     33,     91,      0,      0,  0x12, 0x20, 0x79, 0xFF
vertex    100,      1,    -23,      0,      0,  0x7C, 0x09, 0xEA, 0xFF
vertex    100,      1,     24,      0,      0,  0x7A, 0x17, 0x16, 0xFF
vertex     93,    -36,     26,      0,      0,  0x6B, 0xBF, 0x0D, 0xFF
vertex     93,    -36,    -25,      0,      0,  0x66, 0xB7, 0xF0, 0xFF
vertex     54,    -63,      0,      0,      0,  0x30, 0x8B, 0x00, 0xFF
vertex     80,     14,     62,      0,      0,  0x60, 0x28, 0x47, 0xFF
vertex     44,     51,     75,      0,      0,  0x3C, 0x34, 0x62, 0xFF

mario_tshirt_shared_dl_vertex_group3: # 0x0400F828
vertex     80,     14,    -61,      0,      0,  0x60, 0x28, 0xB8, 0xFF
vertex     47,      3,    -88,      0,      0,  0x30, 0x09, 0x8B, 0xFF
vertex     43,     51,    -74,      0,      0,  0x3C, 0x32, 0x9D, 0xFF
vertex     84,    -29,    -62,      0,      0,  0x5F, 0xDE, 0xB4, 0xFF
vertex     12,     33,    -90,      0,      0,  0x11, 0x20, 0x87, 0xFF

mario_pants_overalls_shared_dl_vertex_group1: # 0x0400F878
vertex     47,     75,    -34,      0,      0,  0x3E, 0x6A, 0xE2, 0xFF
vertex     28,     85,     30,      0,      0,  0x2C, 0x76, 0x08, 0xFF
vertex     47,     75,     35,      0,      0,  0x39, 0x6A, 0x26, 0xFF
vertex     28,     85,    -29,      0,      0,  0x2D, 0x75, 0xF2, 0xFF
vertex      9,     89,     41,      0,      0,  0x14, 0x78, 0x23, 0xFF
vertex      9,     89,    -40,      0,      0,  0x10, 0x7B, 0xE7, 0xFF
vertex    -15,     88,     35,      0,      0,  0xEC, 0x7A, 0x1C, 0xFF
vertex    -15,     87,    -35,      0,      0,  0xEA, 0x76, 0xDA, 0xFF
vertex      3,     77,    -61,      0,      0,  0x03, 0x6A, 0xBB, 0xFF
vertex    -43,     83,    -24,      0,      0,  0xCC, 0x72, 0xEE, 0xFF
vertex    -28,     63,    -74,      0,      0,  0xD1, 0x4F, 0xAA, 0xFF
vertex    -40,     72,    -54,      0,      0,  0xC5, 0x5F, 0xC6, 0xFF
vertex    -40,     72,     55,      0,      0,  0xC4, 0x5E, 0x3A, 0xFF
vertex    -43,     83,     25,      0,      0,  0xBC, 0x69, 0x11, 0xFF
vertex    -28,     63,     75,      0,      0,  0xD0, 0x50, 0x55, 0xFF

mario_pants_overalls_shared_dl_vertex_group2: # 0x0400F968
vertex     80,     14,    -61,      0,      0,  0x60, 0x28, 0xB8, 0xFF
vertex     43,     51,    -74,      0,      0,  0x3C, 0x32, 0x9D, 0xFF
vertex     48,     64,    -58,      0,      0,  0x4D, 0x50, 0xC5, 0xFF
vertex      3,     77,     62,      0,      0,  0x04, 0x6A, 0x44, 0xFF
vertex      9,     89,     41,      0,      0,  0x14, 0x78, 0x23, 0xFF
vertex    -15,     88,     35,      0,      0,  0xEC, 0x7A, 0x1C, 0xFF
vertex     47,     75,     35,      0,      0,  0x39, 0x6A, 0x26, 0xFF
vertex     48,     64,     59,      0,      0,  0x4D, 0x51, 0x3A, 0xFF
vertex     82,     37,     27,      0,      0,  0x66, 0x48, 0x14, 0xFF
vertex     32,     62,     74,      0,      0,  0x29, 0x53, 0x56, 0xFF
vertex     44,     51,     75,      0,      0,  0x3C, 0x34, 0x62, 0xFF
vertex     80,     14,     62,      0,      0,  0x60, 0x28, 0x47, 0xFF
vertex    100,      1,     24,      0,      0,  0x7A, 0x17, 0x16, 0xFF
vertex     82,     37,    -26,      0,      0,  0x69, 0x43, 0xEC, 0xFF
vertex     32,     62,    -73,      0,      0,  0x29, 0x52, 0xA9, 0xFF
vertex     47,     75,    -34,      0,      0,  0x3E, 0x6A, 0xE2, 0xFF

mario_pants_overalls_shared_dl_vertex_group3: # 0x0400FA68
vertex     80,     14,    -61,      0,      0,  0x60, 0x28, 0xB8, 0xFF
vertex     82,     37,    -26,      0,      0,  0x69, 0x43, 0xEC, 0xFF
vertex    100,      1,    -23,      0,      0,  0x7C, 0x09, 0xEA, 0xFF
vertex     20,    -61,    -67,      0,      0,  0x0A, 0x9A, 0xB7, 0xFF
vertex     66,    -52,    -50,      0,      0,  0x3B, 0x9A, 0xD3, 0xFF
vertex     54,    -63,      0,      0,      0,  0x30, 0x8B, 0x00, 0xFF
vertex    -27,    -25,    -86,      0,      0,  0xCB, 0xD5, 0x96, 0xFF
vertex      6,    -10,    -92,      0,      0,  0x00, 0xEB, 0x83, 0xFF
vertex    -29,    -58,    -59,      0,      0,  0xC9, 0x9A, 0xCF, 0xFF
vertex      8,    -74,      0,      0,      0,  0xFD, 0x82, 0x00, 0xFF
vertex    -59,    -28,    -37,      0,      0,  0x90, 0xD5, 0xD9, 0xFF
vertex    -30,    -66,      0,      0,      0,  0xB8, 0x98, 0x00, 0xFF
vertex    -27,     26,    -89,      0,      0,  0xC7, 0x0F, 0x90, 0xFF
vertex     12,     33,    -90,      0,      0,  0x11, 0x20, 0x87, 0xFF
vertex     20,    -61,     68,      0,      0,  0x0A, 0x99, 0x49, 0xFF
vertex     66,    -52,     51,      0,      0,  0x3B, 0x9A, 0x2D, 0xFF

mario_pants_overalls_shared_dl_vertex_group4: # 0x0400FB68
vertex      8,    -74,      0,      0,      0,  0xFD, 0x82, 0x00, 0xFF
vertex     20,    -61,     68,      0,      0,  0x0A, 0x99, 0x49, 0xFF
vertex    -29,    -58,     59,      0,      0,  0xC8, 0x99, 0x30, 0xFF
vertex    -27,    -25,     87,      0,      0,  0xCB, 0xD3, 0x69, 0xFF
vertex      6,    -11,     93,      0,      0,  0x00, 0xEA, 0x7C, 0xFF
vertex    -27,     26,     91,      0,      0,  0xC8, 0x0E, 0x70, 0xFF
vertex     13,     33,     91,      0,      0,  0x12, 0x20, 0x79, 0xFF
vertex    -59,    -28,     38,      0,      0,  0x8D, 0xD8, 0x21, 0xFF
vertex    -30,    -66,      0,      0,      0,  0xB8, 0x98, 0x00, 0xFF
vertex    -28,     63,    -74,      0,      0,  0xD1, 0x4F, 0xAA, 0xFF
vertex    -27,     26,    -89,      0,      0,  0xC7, 0x0F, 0x90, 0xFF
vertex    -71,     54,    -29,      0,      0,  0x8F, 0x2A, 0xDA, 0xFF
vertex    -59,    -28,    -37,      0,      0,  0x90, 0xD5, 0xD9, 0xFF
vertex    -71,     54,     30,      0,      0,  0x94, 0x2A, 0x31, 0xFF
vertex    -43,     83,     25,      0,      0,  0xBC, 0x69, 0x11, 0xFF
vertex    -43,     83,    -24,      0,      0,  0xCC, 0x72, 0xEE, 0xFF

mario_pants_overalls_shared_dl_vertex_group5: # 0x0400FC68
vertex    -71,     54,    -29,      0,      0,  0x8F, 0x2A, 0xDA, 0xFF
vertex    -43,     83,    -24,      0,      0,  0xCC, 0x72, 0xEE, 0xFF
vertex    -40,     72,    -54,      0,      0,  0xC5, 0x5F, 0xC6, 0xFF
vertex    -59,    -28,    -37,      0,      0,  0x90, 0xD5, 0xD9, 0xFF
vertex    -59,    -28,     38,      0,      0,  0x8D, 0xD8, 0x21, 0xFF
vertex    -28,     63,    -74,      0,      0,  0xD1, 0x4F, 0xAA, 0xFF
vertex    -43,     83,     25,      0,      0,  0xBC, 0x69, 0x11, 0xFF
vertex    -71,     54,     30,      0,      0,  0x94, 0x2A, 0x31, 0xFF
vertex    -30,    -66,      0,      0,      0,  0xB8, 0x98, 0x00, 0xFF
vertex    -27,     26,     91,      0,      0,  0xC8, 0x0E, 0x70, 0xFF
vertex    -28,     63,     75,      0,      0,  0xD0, 0x50, 0x55, 0xFF
vertex    -40,     72,     55,      0,      0,  0xC4, 0x5E, 0x3A, 0xFF
vertex     13,     33,     91,      0,      0,  0x12, 0x20, 0x79, 0xFF
vertex     -4,     58,     84,      0,      0,  0xFB, 0x43, 0x6B, 0xFF

mario_pants_overalls_shared_dl_vertex_group6: # 0x0400FD48
vertex    -27,     26,    -89,      0,      0,  0xC7, 0x0F, 0x90, 0xFF
vertex     -4,     58,    -82,      0,      0,  0xF9, 0x42, 0x94, 0xFF
vertex     12,     33,    -90,      0,      0,  0x11, 0x20, 0x87, 0xFF
vertex    -28,     63,    -74,      0,      0,  0xD1, 0x4F, 0xAA, 0xFF
vertex     80,     14,    -61,      0,      0,  0x60, 0x28, 0xB8, 0xFF
vertex    100,      1,    -23,      0,      0,  0x7C, 0x09, 0xEA, 0xFF
vertex     84,    -29,    -62,      0,      0,  0x5F, 0xDE, 0xB4, 0xFF
vertex     93,    -36,    -25,      0,      0,  0x66, 0xB7, 0xF0, 0xFF
vertex     66,    -52,    -50,      0,      0,  0x3B, 0x9A, 0xD3, 0xFF
vertex     54,    -63,      0,      0,      0,  0x30, 0x8B, 0x00, 0xFF
vertex     66,    -52,     51,      0,      0,  0x3B, 0x9A, 0x2D, 0xFF
vertex     93,    -36,     26,      0,      0,  0x6B, 0xBF, 0x0D, 0xFF
vertex     84,    -29,     63,      0,      0,  0x5F, 0xDE, 0x4C, 0xFF
vertex    100,      1,     24,      0,      0,  0x7A, 0x17, 0x16, 0xFF
vertex     80,     14,     62,      0,      0,  0x60, 0x28, 0x47, 0xFF

mario_pants_overalls_shared_dl_vertex_group7: # 0x0400FE38
vertex     17,     66,    -75,      0,      0,  0x17, 0x58, 0xA8, 0xFF
vertex     -4,     58,    -82,      0,      0,  0xF9, 0x42, 0x94, 0xFF
vertex      3,     77,    -61,      0,      0,  0x03, 0x6A, 0xBB, 0xFF
vertex    -28,     63,    -74,      0,      0,  0xD1, 0x4F, 0xAA, 0xFF
vertex     32,     62,     74,      0,      0,  0x29, 0x53, 0x56, 0xFF
vertex     17,     66,     76,      0,      0,  0x19, 0x58, 0x57, 0xFF
vertex     13,     33,     91,      0,      0,  0x12, 0x20, 0x79, 0xFF
vertex    -28,     63,     75,      0,      0,  0xD0, 0x50, 0x55, 0xFF
vertex     -4,     58,     84,      0,      0,  0xFB, 0x43, 0x6B, 0xFF
vertex      3,     77,     62,      0,      0,  0x04, 0x6A, 0x44, 0xFF
vertex    -15,     88,     35,      0,      0,  0xEC, 0x7A, 0x1C, 0xFF
vertex     12,     33,    -90,      0,      0,  0x11, 0x20, 0x87, 0xFF
vertex     32,     62,    -73,      0,      0,  0x29, 0x52, 0xA9, 0xFF
vertex     43,     51,    -74,      0,      0,  0x3C, 0x32, 0x9D, 0xFF
vertex     44,     51,     75,      0,      0,  0x3C, 0x34, 0x62, 0xFF

glabel mario_yellow_button_dl # 0x0400FF28 - 0x0400FF88
gsSPVertex mario_yellow_button_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  5,  6,  2, 0x0
gsSP2Triangles  4,  5,  2, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0,  9, 11, 12, 0x0
gsSP2Triangles 12, 13,  9, 0x0, 13, 10,  9, 0x0
gsSPEndDisplayList

glabel mario_pants_overalls_shared_dl # 0x0400FF88 - 0x04010260
gsSPVertex mario_pants_overalls_shared_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  1,  5, 0x0,  1,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  7,  5,  8, 0x0,  9,  6,  7, 0x0
gsSP2Triangles  7,  8, 10, 0x0, 10, 11,  7, 0x0
gsSP2Triangles  9,  7, 11, 0x0, 12,  6, 13, 0x0
gsSP2Triangles  9, 13,  6, 0x0,  6, 12, 14, 0x0
gsSPVertex mario_pants_overalls_shared_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  7, 0x0
gsSP2Triangles  7, 10, 11, 0x0, 11,  8,  7, 0x0
gsSP2Triangles 12,  8, 11, 0x0, 13,  0,  2, 0x0
gsSP2Triangles  2,  1, 14, 0x0,  2, 15, 13, 0x0
gsSPVertex mario_pants_overalls_shared_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  7, 0x0,  3,  8,  6, 0x0
gsSP2Triangles  5,  9,  3, 0x0,  8,  3,  9, 0x0
gsSP2Triangles  6,  8, 10, 0x0, 11, 10,  8, 0x0
gsSP2Triangles  9, 11,  8, 0x0,  6, 12,  7, 0x0
gsSP2Triangles 12,  6, 10, 0x0,  7, 12, 13, 0x0
gsSP2Triangles 14,  5, 15, 0x0, 14,  9,  5, 0x0
gsSPVertex mario_pants_overalls_shared_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  5,  4,  6, 0x0
gsSP2Triangles  4,  5,  3, 0x0,  2,  3,  7, 0x0
gsSP2Triangles  7,  3,  5, 0x0,  8,  2,  7, 0x0
gsSP2Triangles  2,  8,  0, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 11, 10, 0x0, 11,  7, 13, 0x0
gsSP1Triangle 14, 15, 11, 0x0
gsSPVertex mario_pants_overalls_shared_dl_vertex_group5, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  2,  5,  0, 0x0,  6,  0,  7, 0x0
gsSP2Triangles  4,  3,  8, 0x0,  9,  7,  4, 0x0
gsSP2Triangles  7, 10, 11, 0x0, 11,  6,  7, 0x0
gsSP2Triangles  9, 12, 13, 0x0, 10,  9, 13, 0x0
gsSP1Triangle  7,  9, 10, 0x0
gsSPVertex mario_pants_overalls_shared_dl_vertex_group6, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  8,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 14, 12, 13, 0x0, 11, 10,  9, 0x0
gsSPVertex mario_pants_overalls_shared_dl_vertex_group7, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0,  9,  8,  5, 0x0
gsSP2Triangles  5,  8,  6, 0x0, 11,  1,  0, 0x0
gsSP2Triangles 11, 12, 13, 0x0,  6, 14,  4, 0x0
gsSP1Triangle 11,  0, 12, 0x0
gsSPEndDisplayList

glabel mario_tshirt_shared_dl # 0x04010260 - 0x04010348
gsSPVertex mario_tshirt_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  3,  2, 0x0,  4,  5,  3, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles  6,  8, 10, 0x0, 11,  8, 12, 0x0
gsSP2Triangles 12,  8,  7, 0x0,  8, 11, 10, 0x0
gsSP1Triangle 13, 14, 15, 0x0
gsSPVertex mario_tshirt_shared_dl_vertex_group2, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  3,  1,  4, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  6,  2,  3, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 10,  9, 0x0
gsSP2Triangles 12,  3,  4, 0x0, 13,  3, 12, 0x0
gsSP1Triangle  6,  3, 13, 0x0
gsSPVertex mario_tshirt_shared_dl_vertex_group3, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP1Triangle  1,  4,  2, 0x0
gsSPEndDisplayList

glabel mario_torso_dl # 0x04010348 - 0x04010370
gsSPDisplayList mario_pants_overalls_shared_dl
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_tshirt_shared_dl
gsSPEndDisplayList

glabel mario_torso # 0x04010370 - 0x040103F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_yellow_button
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_yellow_button_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_torso_dl
gsSPEndDisplayList

glabel mario_metal_torso_shared_dl # 0x040103F0 - 0x04010410
gsSPDisplayList mario_yellow_button_dl
gsSPDisplayList mario_pants_overalls_shared_dl
gsSPDisplayList mario_tshirt_shared_dl
gsSPEndDisplayList

mario_m_logo_dl_vertex: # 0x04010410
vertex    195,     93,     32,    744,    732,  0x51, 0x54, 0x30, 0xFF
vertex    153,     33,     95,   1250,   1066,  0x04, 0x46, 0x69, 0xFF
vertex    252,     62,     70,   1032,    152,  0x39, 0x4A, 0x55, 0xFF
vertex    272,     85,      0,    472,    -16,  0x5F, 0x54, 0x00, 0xFF
vertex    252,     62,    -69,    -78,    158,  0x39, 0x4A, 0xAB, 0xFF
vertex    195,     93,    -31,    232,    736,  0x51, 0x54, 0xCF, 0xFF
vertex    153,     33,    -94,   -258,   1076,  0x03, 0x46, 0x97, 0xFF

mario_eyes_cap_on_dl_vertex: # 0x04010480
vertex    145,    101,      0,    480,    446,  0x13, 0x7D, 0x00, 0xFF
vertex    108,    105,      0,    488,    854,  0x69, 0x46, 0x00, 0xFF
vertex     97,    103,     25,    724,    958,  0x40, 0x5A, 0x3D, 0xFF
vertex     97,    103,    -24,    256,    970,  0x40, 0x5A, 0xC3, 0xFF
vertex    175,     91,    -38,    106,    130,  0xC6, 0x6D, 0xE7, 0xFF
vertex    144,     83,    -66,   -146,    460,  0x19, 0x5B, 0xAD, 0xFF
vertex    104,     87,    -69,   -160,    898,  0x30, 0x5C, 0xB7, 0xFF
vertex    175,     91,     39,    842,    112,  0xC6, 0x6D, 0x19, 0xFF
vertex    153,     33,    -94,   -404,    342,  0x03, 0x46, 0x97, 0xFF
vertex    104,     87,     70,   1138,    864,  0x30, 0x5C, 0x49, 0xFF
vertex    144,     83,     67,   1108,    428,  0x19, 0x5B, 0x53, 0xFF
vertex    153,     33,     95,   1362,    296,  0x04, 0x46, 0x69, 0xFF

mario_hair_sideburn_cap_on_dl_vertex: # 0x04010540
vertex    120,    -12,   -109,    916,    184,  0xED, 0x24, 0x88, 0xFF
vertex     96,     49,    -93,    -70,    700,  0x11, 0x27, 0x89, 0xFF
vertex    153,     33,    -94,     90,    -58,  0x03, 0x46, 0x97, 0xFF
vertex     85,    -23,   -110,   1150,    582,  0x06, 0x59, 0xA6, 0xFF
vertex     42,      0,   -102,    842,   1210,  0xC3, 0x05, 0x92, 0xFF
vertex     44,     44,    -96,    118,   1334,  0xDA, 0x21, 0x8C, 0xFF
vertex     96,     49,     94,    -74,    726,  0x10, 0x28, 0x77, 0xFF
vertex     44,     44,     97,    196,   1366,  0xDA, 0x21, 0x74, 0xFF
vertex     42,      0,    103,    968,   1192,  0xC3, 0x05, 0x6E, 0xFF
vertex     85,    -23,    111,   1238,    518,  0x04, 0x58, 0x5A, 0xFF
vertex    120,    -11,    111,    922,    122,  0xED, 0x24, 0x78, 0xFF
vertex    153,     33,     95,     22,    -68,  0x04, 0x46, 0x69, 0xFF

mario_mustache_cap_on_dl_vertex_group1: # 0x04010600
vertex     77,    108,     34,    342,    368,  0x0E, 0x16, 0x7C, 0xFF
vertex     92,     88,     84,    898,    -18,  0x23, 0x59, 0x53, 0xFF
vertex     97,    103,     25,    224,    146,  0x40, 0x5A, 0x3D, 0xFF
vertex     48,     94,     76,    888,    564,  0xD7, 0x60, 0x47, 0xFF
vertex     52,    111,     31,    354,    690,  0xA8, 0x33, 0x4B, 0xFF
vertex     27,    100,     30,    442,    982,  0xB1, 0x60, 0x16, 0xFF
vertex     41,    109,      0,     70,    924,  0x95, 0x44, 0x00, 0xFF
vertex     44,     44,     97,   1296,    438,  0xDA, 0x21, 0x74, 0xFF
vertex      3,     54,     52,    892,   1090,  0x95, 0x1D, 0x3C, 0xFF
vertex     52,    111,    -30,    340,    684,  0xA8, 0x32, 0xB5, 0xFF
vertex     48,     94,    -75,    856,    608,  0xD7, 0x60, 0xB9, 0xFF
vertex     27,    100,    -29,    394,    998,  0xB1, 0x60, 0xEA, 0xFF
vertex      3,     54,    -51,    806,   1162,  0x95, 0x1D, 0xC4, 0xFF
vertex     44,     44,    -96,   1250,    518,  0xDA, 0x21, 0x8C, 0xFF
vertex     77,    108,    -33,    362,    344,  0x0E, 0x16, 0x84, 0xFF
vertex     41,    109,      0,     50,    900,  0x95, 0x44, 0x00, 0xFF

mario_mustache_cap_on_dl_vertex_group2: # 0x04010700
vertex     48,     94,    -75,    856,    608,  0xD7, 0x60, 0xB9, 0xFF
vertex     77,    108,    -33,    362,    344,  0x0E, 0x16, 0x84, 0xFF
vertex     92,     88,    -83,    922,     -4,  0x23, 0x59, 0xAD, 0xFF
vertex     97,    103,    -24,    274,    100,  0x40, 0x5A, 0xC3, 0xFF
vertex     44,     44,    -96,   1250,    518,  0xDA, 0x21, 0x8C, 0xFF

mario_face_cap_dl_vertex_group1: # 0x04010750
vertex    164,    -89,    -74,      0,      0,  0x51, 0xA9, 0xD5, 0xFF
vertex    122,   -139,    -48,      0,      0,  0x28, 0x94, 0xCD, 0xFF
vertex    131,    -56,   -123,      0,      0,  0xDE, 0xD4, 0x8F, 0xFF
vertex    187,     -6,   -133,      0,      0,  0x1E, 0x04, 0x85, 0xFF
vertex    120,    -12,   -109,      0,      0,  0xED, 0x24, 0x88, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xD9, 0xB0, 0xA7, 0xFF
vertex     77,   -138,    -50,      0,      0,  0xBC, 0x9E, 0xD8, 0xFF
vertex     64,   -103,    -51,      0,      0,  0xDE, 0x94, 0xC7, 0xFF
vertex    122,   -139,     49,      0,      0,  0x2D, 0x8F, 0x22, 0xFF
vertex     77,   -138,     51,      0,      0,  0xC1, 0xA4, 0x3C, 0xFF
vertex     64,   -103,     52,      0,      0,  0xC9, 0x9A, 0x31, 0xFF
vertex    131,    -56,    124,      0,      0,  0xDF, 0xD3, 0x71, 0xFF
vertex    164,    -89,     75,      0,      0,  0x4E, 0xA6, 0x2B, 0xFF
vertex     91,    -54,     86,      0,      0,  0xD9, 0xAF, 0x59, 0xFF
vertex    187,     -6,    134,      0,      0,  0x1F, 0x04, 0x7A, 0xFF
vertex    120,    -11,    111,      0,      0,  0xED, 0x24, 0x78, 0xFF

mario_face_cap_dl_vertex_group2: # 0x04010850
vertex    153,     33,    -94,      0,      0,  0x03, 0x46, 0x97, 0xFF
vertex    187,     -6,   -133,      0,      0,  0x1E, 0x04, 0x85, 0xFF
vertex    120,    -12,   -109,      0,      0,  0xED, 0x24, 0x88, 0xFF
vertex    175,     91,    -38,      0,      0,  0xC6, 0x6D, 0xE7, 0xFF
vertex    173,    132,    -65,      0,      0,  0xDA, 0x5A, 0xB0, 0xFF
vertex    195,     93,    -31,      0,      0,  0x51, 0x54, 0xCF, 0xFF
vertex    252,     62,    -69,      0,      0,  0x39, 0x4A, 0xAB, 0xFF
vertex    164,    -89,    -74,      0,      0,  0x51, 0xA9, 0xD5, 0xFF
vertex    271,      0,    -41,      0,      0,  0x6E, 0xCF, 0xDC, 0xFF
vertex    187,     -6,    134,      0,      0,  0x1F, 0x04, 0x7A, 0xFF
vertex    153,     33,     95,      0,      0,  0x04, 0x46, 0x69, 0xFF
vertex    120,    -11,    111,      0,      0,  0xED, 0x24, 0x78, 0xFF
vertex    252,     62,     70,      0,      0,  0x39, 0x4A, 0x55, 0xFF
vertex    271,      0,     42,      0,      0,  0x71, 0xDC, 0x2B, 0xFF
vertex    164,    -89,     75,      0,      0,  0x4E, 0xA6, 0x2B, 0xFF

mario_face_cap_dl_vertex_group3: # 0x04010940
vertex    195,     93,     32,      0,      0,  0x51, 0x54, 0x30, 0xFF
vertex    173,    132,     66,      0,      0,  0xDA, 0x5A, 0x50, 0xFF
vertex    153,     33,     95,      0,      0,  0x04, 0x46, 0x69, 0xFF
vertex    175,     91,     39,      0,      0,  0xC6, 0x6D, 0x19, 0xFF
vertex    164,    -89,    -74,      0,      0,  0x51, 0xA9, 0xD5, 0xFF
vertex    271,      0,    -41,      0,      0,  0x6E, 0xCF, 0xDC, 0xFF
vertex    164,    -89,     75,      0,      0,  0x4E, 0xA6, 0x2B, 0xFF
vertex    271,      0,     42,      0,      0,  0x71, 0xDC, 0x2B, 0xFF
vertex    252,     62,    -69,      0,      0,  0x39, 0x4A, 0xAB, 0xFF
vertex    272,     85,      0,      0,      0,  0x5F, 0x54, 0x00, 0xFF
vertex    182,    155,      0,      0,      0,  0xED, 0x7D, 0x00, 0xFF
vertex    195,     93,    -31,      0,      0,  0x51, 0x54, 0xCF, 0xFF
vertex    175,     91,    -38,      0,      0,  0xC6, 0x6D, 0xE7, 0xFF
vertex    173,    132,    -65,      0,      0,  0xDA, 0x5A, 0xB0, 0xFF
vertex    252,     62,     70,      0,      0,  0x39, 0x4A, 0x55, 0xFF

mario_face_part_cap_on_dl_vertex_group1: # 0x04010A30
vertex     41,    109,      0,      0,      0,  0x95, 0x44, 0x00, 0xFF
vertex     27,    100,    -29,      0,      0,  0xB1, 0x60, 0xEA, 0xFF
vertex     27,    100,     30,      0,      0,  0xB1, 0x60, 0x16, 0xFF
vertex     -7,     62,      0,      0,      0,  0x85, 0x1D, 0x00, 0xFF
vertex      3,     54,     52,      0,      0,  0x95, 0x1D, 0x3C, 0xFF
vertex      3,     54,    -51,      0,      0,  0x95, 0x1D, 0xC4, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     42,      0,    103,      0,      0,  0xC3, 0x05, 0x6E, 0xFF
vertex     44,     44,     97,      0,      0,  0xDA, 0x21, 0x74, 0xFF
vertex     42,      0,   -102,      0,      0,  0xC3, 0x05, 0x92, 0xFF
vertex     44,     44,    -96,      0,      0,  0xDA, 0x21, 0x8C, 0xFF
vertex     64,    -25,    135,      0,      0,  0xCC, 0xE5, 0x70, 0xFF
vertex     91,    -54,     86,      0,      0,  0xD9, 0xAF, 0x59, 0xFF
vertex    102,    -33,    135,      0,      0,  0x30, 0x18, 0x72, 0xFF

mario_face_part_cap_on_dl_vertex_group2: # 0x04010B20
vertex    102,    -33,   -134,      0,      0,  0x32, 0x19, 0x8F, 0xFF
vertex    120,    -12,   -109,      0,      0,  0xED, 0x24, 0x88, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xD9, 0xB0, 0xA7, 0xFF
vertex     64,    -25,    135,      0,      0,  0xCC, 0xE5, 0x70, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     91,    -54,     86,      0,      0,  0xD9, 0xAF, 0x59, 0xFF
vertex    120,    -11,    111,      0,      0,  0xED, 0x24, 0x78, 0xFF
vertex     85,    -23,    111,      0,      0,  0x04, 0x58, 0x5A, 0xFF
vertex    102,    -33,    135,      0,      0,  0x30, 0x18, 0x72, 0xFF
vertex     42,      0,    103,      0,      0,  0xC3, 0x05, 0x6E, 0xFF
vertex     85,    -23,   -110,      0,      0,  0x06, 0x59, 0xA6, 0xFF
vertex     64,    -25,   -134,      0,      0,  0xCC, 0xE5, 0x90, 0xFF
vertex     42,      0,   -102,      0,      0,  0xC3, 0x05, 0x92, 0xFF
vertex     33,    165,      0,      0,      0,  0x8F, 0x38, 0x09, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF

mario_face_part_cap_on_dl_vertex_group3: # 0x04010C20
vertex     56,    -45,    -76,      0,      0,  0xE3, 0xCA, 0x92, 0xFF
vertex     64,    -25,   -134,      0,      0,  0xCC, 0xE5, 0x90, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xD9, 0xB0, 0xA7, 0xFF
vertex     42,      0,   -102,      0,      0,  0xC3, 0x05, 0x92, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     42,      0,    103,      0,      0,  0xC3, 0x05, 0x6E, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF
vertex     47,    131,     41,      0,      0,  0xB0, 0xE4, 0x5E, 0xFF
vertex     33,    165,      0,      0,      0,  0x8F, 0x38, 0x09, 0xFF
vertex     52,    111,     31,      0,      0,  0xA8, 0x33, 0x4B, 0xFF
vertex     52,    111,    -30,      0,      0,  0xA8, 0x32, 0xB5, 0xFF
vertex     41,    109,      0,      0,      0,  0x95, 0x44, 0x00, 0xFF
vertex     77,    108,     34,      0,      0,  0x0E, 0x16, 0x7C, 0xFF

mario_face_part_cap_on_dl_vertex_group4: # 0x04010D10
vertex     92,     88,     84,      0,      0,  0x23, 0x59, 0x53, 0xFF
vertex    104,     87,     70,      0,      0,  0x30, 0x5C, 0x49, 0xFF
vertex     97,    103,     25,      0,      0,  0x40, 0x5A, 0x3D, 0xFF
vertex    117,    128,      0,      0,      0,  0x7A, 0xE1, 0x06, 0xFF
vertex    102,    129,     41,      0,      0,  0x45, 0xD6, 0x61, 0xFF
vertex     77,    108,     34,      0,      0,  0x0E, 0x16, 0x7C, 0xFF
vertex    108,    105,      0,      0,      0,  0x69, 0x46, 0x00, 0xFF
vertex     97,    103,    -24,      0,      0,  0x40, 0x5A, 0xC3, 0xFF
vertex    119,    161,      0,      0,      0,  0x79, 0x23, 0xF6, 0xFF
vertex    104,    162,     41,      0,      0,  0x52, 0x27, 0x58, 0xFF
vertex    102,    129,    -40,      0,      0,  0x50, 0xDC, 0xA6, 0xFF
vertex     75,    130,     46,      0,      0,  0x00, 0xEC, 0x7D, 0xFF
vertex     78,    163,     46,      0,      0,  0x03, 0x55, 0x5D, 0xFF
vertex    101,    179,      0,      0,      0,  0x27, 0x78, 0x00, 0xFF
vertex     52,    164,     41,      0,      0,  0xC8, 0x3D, 0x5F, 0xFF
vertex     47,    131,     41,      0,      0,  0xB0, 0xE4, 0x5E, 0xFF

mario_face_part_cap_on_dl_vertex_group5: # 0x04010E10
vertex     47,    131,     41,      0,      0,  0xB0, 0xE4, 0x5E, 0xFF
vertex     52,    164,     41,      0,      0,  0xC8, 0x3D, 0x5F, 0xFF
vertex     33,    165,      0,      0,      0,  0x8F, 0x38, 0x09, 0xFF
vertex     75,    130,     46,      0,      0,  0x00, 0xEC, 0x7D, 0xFF
vertex     77,    108,     34,      0,      0,  0x0E, 0x16, 0x7C, 0xFF
vertex     78,    163,     46,      0,      0,  0x03, 0x55, 0x5D, 0xFF
vertex     60,    181,      0,      0,      0,  0xEA, 0x7C, 0x00, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex     96,     49,     94,      0,      0,  0x10, 0x28, 0x77, 0xFF
vertex    153,     33,     95,      0,      0,  0x04, 0x46, 0x69, 0xFF
vertex    144,     83,     67,      0,      0,  0x19, 0x5B, 0x53, 0xFF
vertex    101,    179,      0,      0,      0,  0x27, 0x78, 0x00, 0xFF
vertex    104,     87,     70,      0,      0,  0x30, 0x5C, 0x49, 0xFF
vertex     92,     88,     84,      0,      0,  0x23, 0x59, 0x53, 0xFF
vertex     44,     44,     97,      0,      0,  0xDA, 0x21, 0x74, 0xFF

mario_face_part_cap_on_dl_vertex_group6: # 0x04010F00
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex     31,    -84,      0,      0,      0,  0xA0, 0xAE, 0x00, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex    144,     83,    -66,      0,      0,  0x19, 0x5B, 0xAD, 0xFF
vertex    153,     33,    -94,      0,      0,  0x03, 0x46, 0x97, 0xFF
vertex     96,     49,    -93,      0,      0,  0x11, 0x27, 0x89, 0xFF
vertex     92,     88,    -83,      0,      0,  0x23, 0x59, 0xAD, 0xFF
vertex    104,     87,    -69,      0,      0,  0x30, 0x5C, 0xB7, 0xFF
vertex     44,     44,    -96,      0,      0,  0xDA, 0x21, 0x8C, 0xFF
vertex     75,    130,    -45,      0,      0,  0x00, 0xEC, 0x83, 0xFF
vertex     78,    163,    -45,      0,      0,  0x03, 0x54, 0xA2, 0xFF
vertex    104,    162,    -40,      0,      0,  0x44, 0x31, 0xA1, 0xFF
vertex     97,    103,    -24,      0,      0,  0x40, 0x5A, 0xC3, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex     47,    131,    -40,      0,      0,  0xBC, 0xDE, 0x9C, 0xFF
vertex     60,    181,      0,      0,      0,  0xEA, 0x7C, 0x00, 0xFF

mario_face_part_cap_on_dl_vertex_group7: # 0x04011000
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex     47,    131,    -40,      0,      0,  0xBC, 0xDE, 0x9C, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF
vertex     77,    108,    -33,      0,      0,  0x0E, 0x16, 0x84, 0xFF
vertex     52,    111,    -30,      0,      0,  0xA8, 0x32, 0xB5, 0xFF
vertex     75,    130,    -45,      0,      0,  0x00, 0xEC, 0x83, 0xFF
vertex    104,    162,    -40,      0,      0,  0x44, 0x31, 0xA1, 0xFF
vertex    102,    129,    -40,      0,      0,  0x50, 0xDC, 0xA6, 0xFF
vertex    119,    161,      0,      0,      0,  0x79, 0x23, 0xF6, 0xFF
vertex     97,    103,    -24,      0,      0,  0x40, 0x5A, 0xC3, 0xFF
vertex     78,    163,    -45,      0,      0,  0x03, 0x54, 0xA2, 0xFF
vertex     60,    181,      0,      0,      0,  0xEA, 0x7C, 0x00, 0xFF
vertex    101,    179,      0,      0,      0,  0x27, 0x78, 0x00, 0xFF

mario_face_back_hair_cap_on_dl_vertex_group1: # 0x040110D0
vertex     31,    -84,      0,      0,      0,  0xA0, 0xAE, 0x00, 0xFF
vertex     36,   -116,    -35,      0,      0,  0xFB, 0x8E, 0x37, 0xFF
vertex     64,   -103,    -51,      0,      0,  0xDE, 0x94, 0xC7, 0xFF
vertex     31,    -85,     87,      0,      0,  0xDB, 0xFD, 0x79, 0xFF
vertex     35,   -120,     68,      0,      0,  0xDA, 0x94, 0x35, 0xFF
vertex     58,   -114,     60,      0,      0,  0x57, 0xB4, 0x32, 0xFF
vertex     64,   -103,     52,      0,      0,  0xC9, 0x9A, 0x31, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     36,   -116,     36,      0,      0,  0xFB, 0x8E, 0xC9, 0xFF
vertex     91,    -54,     86,      0,      0,  0xD9, 0xAF, 0x59, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     35,   -120,    -67,      0,      0,  0xDA, 0x94, 0xCB, 0xFF
vertex     58,   -114,    -59,      0,      0,  0x57, 0xB4, 0xCE, 0xFF
vertex     31,    -85,    -86,      0,      0,  0xDB, 0xFD, 0x87, 0xFF
vertex     56,    -45,    -76,      0,      0,  0xE3, 0xCA, 0x92, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF

mario_face_back_hair_cap_on_dl_vertex_group2: # 0x040111D0
vertex     31,    -85,    -86,      0,      0,  0xDB, 0xFD, 0x87, 0xFF
vertex     35,   -120,    -67,      0,      0,  0xDA, 0x94, 0xCB, 0xFF
vertex      9,    -88,    -58,      0,      0,  0x87, 0xDF, 0xF5, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex     56,    -45,    -76,      0,      0,  0xE3, 0xCA, 0x92, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xD9, 0xB0, 0xA7, 0xFF
vertex     64,   -103,    -51,      0,      0,  0xDE, 0x94, 0xC7, 0xFF
vertex     31,    -84,      0,      0,      0,  0xA0, 0xAE, 0x00, 0xFF
vertex     36,   -116,     36,      0,      0,  0xFB, 0x8E, 0xC9, 0xFF
vertex      9,    -88,     59,      0,      0,  0x87, 0xDF, 0x0B, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     36,   -116,    -35,      0,      0,  0xFB, 0x8E, 0x37, 0xFF
vertex     35,   -120,     68,      0,      0,  0xDA, 0x94, 0x35, 0xFF
vertex     31,    -85,     87,      0,      0,  0xDB, 0xFD, 0x79, 0xFF

glabel mario_m_logo_dl # 0x040112B0 - 0x040112E8
gsSPVertex mario_m_logo_dl_vertex, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  2,  3,  0, 0x0,  3,  5,  0, 0x0
gsSP1Triangle  4,  6,  5, 0x0
gsSPEndDisplayList

glabel mario_eyes_cap_on_dl # 0x040112E8 - 0x04011350
gsSPVertex mario_eyes_cap_on_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  0,  4, 0x0,  6,  3,  5, 0x0
gsSP2Triangles  3,  1,  0, 0x0,  4,  0,  7, 0x0
gsSP2Triangles  5,  4,  8, 0x0,  2,  9, 10, 0x0
gsSP2Triangles 10,  7,  2, 0x0, 11,  7, 10, 0x0
gsSP1Triangle  7,  0,  2, 0x0
gsSPEndDisplayList

glabel mario_hair_sideburn_cap_on_dl # 0x04011350 - 0x040113A0
gsSPVertex mario_hair_sideburn_cap_on_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  4,  5,  1, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  9,  6, 0x0
gsSP2Triangles  9, 10,  6, 0x0, 11,  6, 10, 0x0
gsSPEndDisplayList

glabel mario_mustache_cap_on_dl # 0x040113A0 - 0x04011438
gsSPVertex mario_mustache_cap_on_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  5,  3,  4, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  7,  3,  8, 0x0
gsSP2Triangles  8,  3,  5, 0x0,  3,  7,  1, 0x0
gsSP2Triangles  9, 10, 11, 0x0, 12, 10, 13, 0x0
gsSP2Triangles 11, 10, 12, 0x0, 10,  9, 14, 0x0
gsSP1Triangle 15,  9, 11, 0x0
gsSPVertex mario_mustache_cap_on_dl_vertex_group2, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP1Triangle  2,  4,  0, 0x0
gsSPEndDisplayList

glabel mario_face_part_cap_on_dl # 0x04011438 - 0x040116F8
gsSPVertex mario_face_part_cap_on_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  4,  2, 0x0,  1,  5,  3, 0x0
gsSP2Triangles  6,  7,  3, 0x0,  7,  4,  3, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  4,  7,  8, 0x0
gsSP2Triangles  9,  4,  8, 0x0, 10,  6,  5, 0x0
gsSP2Triangles 10,  5, 11, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_face_part_cap_on_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  5,  6,  8, 0x0
gsSP2Triangles  3,  8,  7, 0x0,  9,  3,  7, 0x0
gsSP2Triangles  3,  9,  4, 0x0, 10, 11, 12, 0x0
gsSP2Triangles  0, 10,  1, 0x0, 10,  0, 11, 0x0
gsSP2Triangles 11,  0,  2, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_face_part_cap_on_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  3,  0,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11,  9,  8, 0x0
gsSP2Triangles 12, 13,  8, 0x0,  8, 13, 11, 0x0
gsSP1Triangle  9, 11, 14, 0x0
gsSPVertex mario_face_part_cap_on_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  2, 0x0
gsSP2Triangles  5,  2,  4, 0x0,  2,  6,  3, 0x0
gsSP2Triangles  3,  6,  7, 0x0,  8,  9,  3, 0x0
gsSP2Triangles  9,  4,  3, 0x0,  7, 10,  3, 0x0
gsSP2Triangles  3, 10,  8, 0x0, 11,  4,  9, 0x0
gsSP2Triangles 12, 11,  9, 0x0, 13,  9,  8, 0x0
gsSP2Triangles  9, 13, 12, 0x0,  4, 11,  5, 0x0
gsSP1Triangle 14, 15, 11, 0x0
gsSPVertex mario_face_part_cap_on_dl_vertex_group5, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  1,  5,  6, 0x0,  1,  3,  5, 0x0
gsSP2Triangles  2,  1,  6, 0x0,  2,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  6,  5, 11, 0x0
gsSP2Triangles 12, 13,  8, 0x0, 10, 12,  8, 0x0
gsSP1Triangle 14,  8, 13, 0x0
gsSPVertex mario_face_part_cap_on_dl_vertex_group6, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  6,  5,  8, 0x0
gsSP2Triangles  5,  7,  3, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  6, 12,  7, 0x0, 13, 10,  9, 0x0
gsSP2Triangles 14, 13,  9, 0x0, 15, 10, 13, 0x0
gsSPVertex mario_face_part_cap_on_dl_vertex_group7, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  1,  5,  3, 0x0,  2,  1,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  7,  6,  8, 0x0
gsSP2Triangles  7,  9,  3, 0x0,  5,  7,  3, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12,  6, 10, 0x0
gsSP1Triangle 12,  8,  6, 0x0
gsSPEndDisplayList

glabel mario_face_cap_dl # 0x040116F8 - 0x04011870
gsSPVertex mario_face_cap_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  4, 0x0
gsSP2Triangles  4,  2,  5, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  2,  1,  6, 0x0,  6,  7,  2, 0x0
gsSP2Triangles  5,  2,  7, 0x0,  6,  1,  8, 0x0
gsSP2Triangles  8,  1,  0, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10,  7,  6, 0x0,  9, 10,  6, 0x0
gsSP2Triangles 11, 10,  9, 0x0,  9,  8, 11, 0x0
gsSP2Triangles 11,  8, 12, 0x0,  0, 12,  8, 0x0
gsSP2Triangles 13, 10, 11, 0x0, 11, 12, 14, 0x0
gsSP2Triangles 15, 11, 14, 0x0, 13, 11, 15, 0x0
gsSPVertex mario_face_cap_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  4,  5,  0, 0x0,  0,  6,  1, 0x0
gsSP2Triangles  7,  1,  8, 0x0,  8,  1,  6, 0x0
gsSP2Triangles  9, 10, 11, 0x0,  9, 12, 10, 0x0
gsSP2Triangles 12,  9, 13, 0x0, 13,  9, 14, 0x0
gsSPVertex mario_face_cap_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9,  5, 0x0,  0, 10,  1, 0x0
gsSP2Triangles  1, 10,  3, 0x0, 11, 10,  0, 0x0
gsSP2Triangles 12,  3, 10, 0x0, 12, 10, 13, 0x0
gsSP2Triangles 13, 10, 11, 0x0,  5,  9,  7, 0x0
gsSP1Triangle  7,  9, 14, 0x0
gsSPEndDisplayList

glabel mario_face_back_hair_cap_on_dl # 0x04011870 - 0x04011960
gsSPVertex mario_face_back_hair_cap_on_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  8,  6, 0x0
gsSP2Triangles  5,  4,  8, 0x0,  7,  3,  5, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  6,  9,  7, 0x0
gsSP2Triangles  0,  6,  8, 0x0,  3,  7, 10, 0x0
gsSP2Triangles  1, 11, 12, 0x0, 12, 13, 14, 0x0
gsSP2Triangles 11, 13, 12, 0x0,  1, 12,  2, 0x0
gsSP2Triangles 14,  2, 12, 0x0, 15, 14, 13, 0x0
gsSPVertex mario_face_back_hair_cap_on_dl_vertex_group2, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  3,  2, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  9, 10,  7, 0x0
gsSP2Triangles  2,  1, 11, 0x0,  2, 11,  7, 0x0
gsSP2Triangles  9, 12, 13, 0x0, 10,  9, 13, 0x0
gsSP1Triangle  8, 12,  9, 0x0
gsSPEndDisplayList

glabel mario_face_cap_on_dl # 0x04011960 - 0x040119A0
gsSPDisplayList mario_face_part_cap_on_dl
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_face_cap_dl
gsSPLight mario_diff_light_group6, 1
gsSPLight mario_amb_light_group6, 2
gsSPDisplayList mario_face_back_hair_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_front # 0x040119A0 - 0x04011A90
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_front
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_half_closed # 0x04011A90 - 0x04011B80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_half_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_closed # 0x04011B80 - 0x04011C70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_right # 0x04011C70 - 0x04011D60
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_right
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_left # 0x04011D60 - 0x04011E50
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_left
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_up # 0x04011E50 - 0x04011F40
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_up
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_down # 0x04011F40 - 0x04012030
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_down
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_cap_on_eyes_dead # 0x04012030 - 0x04012120
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_dead
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_on_dl
gsSPEndDisplayList

glabel mario_metal_cap_on_shared_dl # 0x04012120 - 0x04012160
gsSPDisplayList mario_m_logo_dl
gsSPDisplayList mario_eyes_cap_on_dl
gsSPDisplayList mario_hair_sideburn_cap_on_dl
gsSPDisplayList mario_mustache_cap_on_dl
gsSPDisplayList mario_face_part_cap_on_dl
gsSPDisplayList mario_face_cap_dl
gsSPDisplayList mario_face_back_hair_cap_on_dl
gsSPEndDisplayList

# Unreferenced light
.byte 0x3F, 0x30, 0x1E, 0x00, 0x3F, 0x30, 0x1E, 0x00

.byte 0xFE, 0xC1, 0x79, 0x00, 0xFE, 0xC1, 0x79, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x1C, 0x01, 0x00, 0x00, 0x1C, 0x01, 0x00, 0x00

.byte 0x73, 0x06, 0x00, 0x00, 0x73, 0x06, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_eyes_cap_off_dl_vertex: # 0x04012190
vertex    104,     87,    -69,   -160,    898,  0x30, 0x5C, 0xB7, 0xFF
vertex     97,    103,    -24,    256,    970,  0x40, 0x5A, 0xC3, 0xFF
vertex    144,     83,    -66,   -146,    460,  0x19, 0x5B, 0xAD, 0xFF
vertex    153,     33,     95,   1362,    296,  0x05, 0x38, 0x71, 0xFF
vertex    175,     91,     39,    842,    112,  0x01, 0x75, 0x2F, 0xFF
vertex    144,     83,     67,   1108,    428,  0x19, 0x5B, 0x53, 0xFF
vertex    145,    101,      0,    480,    446,  0x13, 0x7D, 0x00, 0xFF
vertex     97,    103,     25,    724,    958,  0x40, 0x5A, 0x3D, 0xFF
vertex    175,     91,    -38,    106,    130,  0xF5, 0x73, 0xCC, 0xFF
vertex    104,     87,     70,   1138,    864,  0x30, 0x5C, 0x49, 0xFF
vertex    153,     33,    -94,   -404,    342,  0xFE, 0x36, 0x8E, 0xFF
vertex    108,    105,      0,    488,    854,  0x69, 0x46, 0x00, 0xFF

mario_hair_sideburn_cap_off_dl_vertex: # 0x04012250
vertex     42,      0,    103,    968,   1192,  0xC3, 0x05, 0x6E, 0xFF
vertex     85,    -23,    111,   1238,    518,  0x04, 0x58, 0x5A, 0xFF
vertex     96,     49,     94,    -74,    726,  0x10, 0x28, 0x77, 0xFF
vertex     44,     44,     97,    196,   1366,  0xDA, 0x21, 0x74, 0xFF
vertex    153,     33,     95,     22,    -68,  0x05, 0x38, 0x71, 0xFF
vertex    120,    -11,    111,    922,    122,  0xFF, 0x13, 0x7D, 0xFF
vertex     42,      0,   -102,    842,   1210,  0xC3, 0x05, 0x92, 0xFF
vertex     44,     44,    -96,    118,   1334,  0xDA, 0x21, 0x8C, 0xFF
vertex     96,     49,    -93,    -70,    700,  0x11, 0x27, 0x89, 0xFF
vertex     85,    -23,   -110,   1150,    582,  0x06, 0x59, 0xA6, 0xFF
vertex    120,    -12,   -109,    916,    184,  0xFF, 0x13, 0x83, 0xFF
vertex    153,     33,    -94,     90,    -58,  0xFE, 0x36, 0x8E, 0xFF

mario_mustache_cap_off_dl_vertex_group1: # 0x04012310
vertex     92,     88,    -83,    992,    -10,  0x23, 0x59, 0xAD, 0xFF
vertex     77,    108,    -33,    360,    296,  0x0E, 0x16, 0x84, 0xFF
vertex     97,    103,    -24,    298,     20,  0x40, 0x5A, 0xC3, 0xFF
vertex     48,     94,    -75,    844,    640,  0xD7, 0x60, 0xB9, 0xFF
vertex     44,     44,    -96,   1272,    592,  0xDA, 0x21, 0x8C, 0xFF
vertex     52,    111,    -30,    294,    656,  0xA8, 0x32, 0xB5, 0xFF
vertex     92,     88,     84,    948,     -8,  0x23, 0x59, 0x53, 0xFF
vertex     77,    108,     34,    330,    316,  0x0E, 0x16, 0x7C, 0xFF
vertex     48,     94,     76,    848,    630,  0xD7, 0x60, 0x47, 0xFF
vertex     97,    103,     25,    248,     50,  0x40, 0x5A, 0x3D, 0xFF
vertex     52,    111,     31,    292,    670,  0xA8, 0x33, 0x4B, 0xFF
vertex     44,     44,     97,   1276,    566,  0xDA, 0x21, 0x74, 0xFF
vertex      3,     54,     52,    768,   1210,  0x95, 0x1D, 0x3C, 0xFF
vertex     27,    100,     30,    336,   1006,  0xB1, 0x60, 0x16, 0xFF
vertex      3,     54,    -51,    720,   1228,  0x95, 0x1D, 0xC4, 0xFF
vertex     41,    109,      0,    -30,    876,  0x95, 0x44, 0x00, 0xFF

mario_mustache_cap_off_dl_vertex_group2: # 0x04012410
vertex     41,    109,      0,    -38,    852,  0x95, 0x44, 0x00, 0xFF
vertex     52,    111,    -30,    294,    656,  0xA8, 0x32, 0xB5, 0xFF
vertex     27,    100,    -29,    310,   1002,  0xB1, 0x60, 0xEA, 0xFF
vertex     48,     94,    -75,    844,    640,  0xD7, 0x60, 0xB9, 0xFF
vertex      3,     54,    -51,    720,   1228,  0x95, 0x1D, 0xC4, 0xFF

mario_face_part_cap_off_dl_vertex_group1: # 0x04012460
vertex     97,    103,     25,      0,      0,  0x40, 0x5A, 0x3D, 0xFF
vertex    108,    105,      0,      0,      0,  0x69, 0x46, 0x00, 0xFF
vertex    117,    128,      0,      0,      0,  0x7A, 0xE1, 0x06, 0xFF
vertex     92,     88,    -83,      0,      0,  0x23, 0x59, 0xAD, 0xFF
vertex     97,    103,    -24,      0,      0,  0x40, 0x5A, 0xC3, 0xFF
vertex    104,     87,    -69,      0,      0,  0x30, 0x5C, 0xB7, 0xFF
vertex     96,     49,    -93,      0,      0,  0x11, 0x27, 0x89, 0xFF
vertex     44,     44,    -96,      0,      0,  0xDA, 0x21, 0x8C, 0xFF
vertex    102,    129,    -40,      0,      0,  0x50, 0xDC, 0xA6, 0xFF
vertex     77,    108,    -33,      0,      0,  0x0E, 0x16, 0x84, 0xFF
vertex    144,     83,    -66,      0,      0,  0x19, 0x5B, 0xAD, 0xFF
vertex     44,     44,     97,      0,      0,  0xDA, 0x21, 0x74, 0xFF
vertex     96,     49,     94,      0,      0,  0x10, 0x28, 0x77, 0xFF
vertex     92,     88,     84,      0,      0,  0x23, 0x59, 0x53, 0xFF
vertex    104,     87,     70,      0,      0,  0x30, 0x5C, 0x49, 0xFF

mario_face_part_cap_off_dl_vertex_group2: # 0x04012550
vertex     -7,     62,      0,      0,      0,  0x85, 0x1D, 0x00, 0xFF
vertex      3,     54,     52,      0,      0,  0x95, 0x1D, 0x3C, 0xFF
vertex     27,    100,     30,      0,      0,  0xB1, 0x60, 0x16, 0xFF
vertex    144,     83,     67,      0,      0,  0x19, 0x5B, 0x53, 0xFF
vertex    104,     87,     70,      0,      0,  0x30, 0x5C, 0x49, 0xFF
vertex     96,     49,     94,      0,      0,  0x10, 0x28, 0x77, 0xFF
vertex    117,    128,      0,      0,      0,  0x7A, 0xE1, 0x06, 0xFF
vertex    102,    129,     41,      0,      0,  0x45, 0xD6, 0x61, 0xFF
vertex     97,    103,     25,      0,      0,  0x40, 0x5A, 0x3D, 0xFF
vertex     77,    108,     34,      0,      0,  0x0E, 0x16, 0x7C, 0xFF
vertex     44,     44,     97,      0,      0,  0xDA, 0x21, 0x74, 0xFF
vertex     42,      0,    103,      0,      0,  0xC3, 0x05, 0x6E, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     64,    -25,    135,      0,      0,  0xCC, 0xE5, 0x70, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     85,    -23,    111,      0,      0,  0x04, 0x58, 0x5A, 0xFF

mario_face_part_cap_off_dl_vertex_group3: # 0x04012650
vertex     96,     49,     94,      0,      0,  0x10, 0x28, 0x77, 0xFF
vertex    153,     33,     95,      0,      0,  0x05, 0x38, 0x71, 0xFF
vertex    144,     83,     67,      0,      0,  0x19, 0x5B, 0x53, 0xFF
vertex     64,    -25,    135,      0,      0,  0xCC, 0xE5, 0x70, 0xFF
vertex     91,    -54,     86,      0,      0,  0xE9, 0xA9, 0x59, 0xFF
vertex    102,    -33,    135,      0,      0,  0x30, 0x18, 0x72, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     85,    -23,    111,      0,      0,  0x04, 0x58, 0x5A, 0xFF
vertex    120,    -11,    111,      0,      0,  0xFF, 0x13, 0x7D, 0xFF
vertex     52,    111,    -30,      0,      0,  0xA8, 0x32, 0xB5, 0xFF
vertex     41,    109,      0,      0,      0,  0x95, 0x44, 0x00, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF
vertex     85,    -23,   -110,      0,      0,  0x06, 0x59, 0xA6, 0xFF
vertex     64,    -25,   -134,      0,      0,  0xCC, 0xE5, 0x90, 0xFF
vertex     42,      0,   -102,      0,      0,  0xC3, 0x05, 0x92, 0xFF

mario_face_part_cap_off_dl_vertex_group4: # 0x04012740
vertex     27,    100,     30,      0,      0,  0xB1, 0x60, 0x16, 0xFF
vertex     27,    100,    -29,      0,      0,  0xB1, 0x60, 0xEA, 0xFF
vertex     -7,     62,      0,      0,      0,  0x85, 0x1D, 0x00, 0xFF
vertex      3,     54,    -51,      0,      0,  0x95, 0x1D, 0xC4, 0xFF
vertex     41,    109,      0,      0,      0,  0x95, 0x44, 0x00, 0xFF
vertex    144,     83,    -66,      0,      0,  0x19, 0x5B, 0xAD, 0xFF
vertex    153,     33,    -94,      0,      0,  0xFE, 0x36, 0x8E, 0xFF
vertex     96,     49,    -93,      0,      0,  0x11, 0x27, 0x89, 0xFF
vertex     42,      0,   -102,      0,      0,  0xC3, 0x05, 0x92, 0xFF
vertex     44,     44,    -96,      0,      0,  0xDA, 0x21, 0x8C, 0xFF
vertex     64,    -25,   -134,      0,      0,  0xCC, 0xE5, 0x90, 0xFF
vertex    102,    -33,   -134,      0,      0,  0x32, 0x19, 0x8F, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xE8, 0xAA, 0xA7, 0xFF
vertex     85,    -23,   -110,      0,      0,  0x06, 0x59, 0xA6, 0xFF
vertex    120,    -12,   -109,      0,      0,  0xFF, 0x13, 0x83, 0xFF

mario_face_part_cap_off_dl_vertex_group5: # 0x04012830
vertex     33,    165,      0,      0,      0,  0x8F, 0x38, 0x09, 0xFF
vertex     60,    181,      0,      0,      0,  0xEA, 0x7C, 0x00, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex    102,    -33,   -134,      0,      0,  0x32, 0x19, 0x8F, 0xFF
vertex    120,    -12,   -109,      0,      0,  0xFF, 0x13, 0x83, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xE8, 0xAA, 0xA7, 0xFF
vertex     56,    -45,    -76,      0,      0,  0xE3, 0xCA, 0x92, 0xFF
vertex     64,    -25,   -134,      0,      0,  0xCC, 0xE5, 0x90, 0xFF
vertex     42,      0,   -102,      0,      0,  0xC3, 0x05, 0x92, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex      3,     54,    -51,      0,      0,  0x95, 0x1D, 0xC4, 0xFF
vertex     -7,     62,      0,      0,      0,  0x85, 0x1D, 0x00, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     52,    164,     41,      0,      0,  0xC8, 0x3D, 0x5F, 0xFF
vertex     78,    163,     46,      0,      0,  0x03, 0x55, 0x5D, 0xFF
vertex    101,    179,      0,      0,      0,  0x27, 0x78, 0x00, 0xFF

mario_face_part_cap_off_dl_vertex_group6: # 0x04012930
vertex    104,    162,     41,      0,      0,  0x52, 0x27, 0x58, 0xFF
vertex    101,    179,      0,      0,      0,  0x27, 0x78, 0x00, 0xFF
vertex     78,    163,     46,      0,      0,  0x03, 0x55, 0x5D, 0xFF
vertex     52,    164,     41,      0,      0,  0xC8, 0x3D, 0x5F, 0xFF
vertex     75,    130,     46,      0,      0,  0x00, 0xEC, 0x7D, 0xFF
vertex    119,    161,      0,      0,      0,  0x79, 0x23, 0xF6, 0xFF
vertex    104,    162,    -40,      0,      0,  0x44, 0x31, 0xA1, 0xFF
vertex     78,    163,    -45,      0,      0,  0x03, 0x54, 0xA2, 0xFF
vertex     60,    181,      0,      0,      0,  0xEA, 0x7C, 0x00, 0xFF
vertex     47,    131,     41,      0,      0,  0xB0, 0xE4, 0x5E, 0xFF
vertex     33,    165,      0,      0,      0,  0x8F, 0x38, 0x09, 0xFF
vertex    102,    129,     41,      0,      0,  0x45, 0xD6, 0x61, 0xFF
vertex     77,    108,     34,      0,      0,  0x0E, 0x16, 0x7C, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF
vertex    117,    128,      0,      0,      0,  0x7A, 0xE1, 0x06, 0xFF

mario_face_part_cap_off_dl_vertex_group7: # 0x04012A30
vertex     52,    111,     31,      0,      0,  0xA8, 0x33, 0x4B, 0xFF
vertex     47,    131,     41,      0,      0,  0xB0, 0xE4, 0x5E, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF
vertex     77,    108,     34,      0,      0,  0x0E, 0x16, 0x7C, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF
vertex     78,    163,    -45,      0,      0,  0x03, 0x54, 0xA2, 0xFF
vertex     75,    130,    -45,      0,      0,  0x00, 0xEC, 0x83, 0xFF
vertex    104,    162,    -40,      0,      0,  0x44, 0x31, 0xA1, 0xFF
vertex     60,    181,      0,      0,      0,  0xEA, 0x7C, 0x00, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex     31,    -84,      0,      0,      0,  0xA0, 0xAE, 0x00, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     41,    109,      0,      0,      0,  0x95, 0x44, 0x00, 0xFF
vertex     47,    131,    -40,      0,      0,  0xBC, 0xDE, 0x9C, 0xFF
vertex    102,    129,    -40,      0,      0,  0x50, 0xDC, 0xA6, 0xFF
vertex     77,    108,    -33,      0,      0,  0x0E, 0x16, 0x84, 0xFF

mario_face_part_cap_off_dl_vertex_group8: # 0x04012B30
vertex    102,    129,    -40,      0,      0,  0x50, 0xDC, 0xA6, 0xFF
vertex    104,    162,    -40,      0,      0,  0x44, 0x31, 0xA1, 0xFF
vertex    119,    161,      0,      0,      0,  0x79, 0x23, 0xF6, 0xFF
vertex    117,    128,      0,      0,      0,  0x7A, 0xE1, 0x06, 0xFF
vertex     32,    132,      0,      0,      0,  0x84, 0xE8, 0xF8, 0xFF
vertex     47,    131,    -40,      0,      0,  0xBC, 0xDE, 0x9C, 0xFF
vertex     52,    111,    -30,      0,      0,  0xA8, 0x32, 0xB5, 0xFF
vertex     77,    108,    -33,      0,      0,  0x0E, 0x16, 0x84, 0xFF
vertex     52,    164,    -40,      0,      0,  0xB8, 0x34, 0xA6, 0xFF

mario_face_hair_cap_off_dl_vertex_group1: # 0x04012BC0
vertex    153,     33,    -94,      0,      0,  0xFE, 0x36, 0x8E, 0xFF
vertex    200,     70,    -97,      0,      0,  0x07, 0x48, 0x99, 0xFF
vertex    182,     -9,   -115,      0,      0,  0x2F, 0xFE, 0x8B, 0xFF
vertex    153,     33,     95,      0,      0,  0x05, 0x38, 0x71, 0xFF
vertex    200,     75,     84,      0,      0,  0x10, 0x52, 0x5F, 0xFF
vertex    151,     72,     70,      0,      0,  0xE4, 0x5C, 0x51, 0xFF
vertex    120,    -11,    111,      0,      0,  0xFF, 0x13, 0x7D, 0xFF
vertex    181,     -9,    116,      0,      0,  0x2D, 0x01, 0x76, 0xFF
vertex    175,     91,     39,      0,      0,  0x01, 0x75, 0x2F, 0xFF
vertex    209,     86,     60,      0,      0,  0x38, 0x60, 0x3C, 0xFF
vertex    227,     35,     75,      0,      0,  0x6D, 0x12, 0x3D, 0xFF
vertex    175,     91,    -38,      0,      0,  0xF5, 0x73, 0xCC, 0xFF
vertex    151,     72,    -68,      0,      0,  0xD6, 0x5B, 0xB3, 0xFF
vertex    221,     35,    -73,      0,      0,  0x71, 0x03, 0xC8, 0xFF
vertex    211,     91,    -71,      0,      0,  0x31, 0x46, 0xA3, 0xFF
vertex    227,    -14,    -58,      0,      0,  0x72, 0xF1, 0xCC, 0xFF

mario_face_hair_cap_off_dl_vertex_group2: # 0x04012CC0
vertex    120,    -12,   -109,      0,      0,  0xFF, 0x13, 0x83, 0xFF
vertex    153,     33,    -94,      0,      0,  0xFE, 0x36, 0x8E, 0xFF
vertex    182,     -9,   -115,      0,      0,  0x2F, 0xFE, 0x8B, 0xFF
vertex    227,    -14,     59,      0,      0,  0x72, 0xEC, 0x32, 0xFF
vertex    241,    -34,      0,      0,      0,  0x7A, 0xE0, 0x00, 0xFF
vertex    237,     64,      0,      0,      0,  0x7E, 0xF9, 0xFF, 0xFF
vertex    189,   -102,     73,      0,      0,  0x50, 0xBB, 0x44, 0xFF
vertex    181,     -9,    116,      0,      0,  0x2D, 0x01, 0x76, 0xFF
vertex    227,     35,     75,      0,      0,  0x6D, 0x12, 0x3D, 0xFF
vertex    189,   -102,    -71,      0,      0,  0x50, 0xB9, 0xBD, 0xFF
vertex    227,    -14,    -58,      0,      0,  0x72, 0xF1, 0xCC, 0xFF
vertex    200,   -117,      0,      0,      0,  0x3F, 0x93, 0x00, 0xFF
vertex    221,     35,    -73,      0,      0,  0x71, 0x03, 0xC8, 0xFF
vertex    248,    104,    -43,      0,      0,  0x76, 0x2C, 0xF3, 0xFF
vertex    231,     81,     33,      0,      0,  0x71, 0x27, 0x2A, 0xFF

mario_face_hair_cap_off_dl_vertex_group3: # 0x04012DB0
vertex    221,     35,    -73,      0,      0,  0x71, 0x03, 0xC8, 0xFF
vertex    211,     91,    -71,      0,      0,  0x31, 0x46, 0xA3, 0xFF
vertex    232,     69,    -34,      0,      0,  0x72, 0xE4, 0xD1, 0xFF
vertex    237,     64,      0,      0,      0,  0x7E, 0xF9, 0xFF, 0xFF
vertex    175,     91,    -38,      0,      0,  0xF5, 0x73, 0xCC, 0xFF
vertex    201,    125,    -13,      0,      0,  0xE4, 0x7B, 0xFB, 0xFF
vertex    160,     96,      0,      0,      0,  0xB7, 0x67, 0xFE, 0xFF
vertex    189,   -102,    -71,      0,      0,  0x50, 0xB9, 0xBD, 0xFF
vertex    116,   -124,    -67,      0,      0,  0xFC, 0x8F, 0xC8, 0xFF
vertex    145,    -84,   -104,      0,      0,  0xEF, 0xCF, 0x8D, 0xFF
vertex    182,     -9,   -115,      0,      0,  0x2F, 0xFE, 0x8B, 0xFF
vertex    200,   -117,      0,      0,      0,  0x3F, 0x93, 0x00, 0xFF
vertex    189,   -102,     73,      0,      0,  0x50, 0xBB, 0x44, 0xFF
vertex    116,   -126,     68,      0,      0,  0xFB, 0x8F, 0x38, 0xFF
vertex    119,   -134,      0,      0,      0,  0xE8, 0x84, 0xFF, 0xFF
vertex    145,    -83,    105,      0,      0,  0xEF, 0xD0, 0x73, 0xFF

mario_face_hair_cap_off_dl_vertex_group4: # 0x04012EB0
vertex    145,    -83,    105,      0,      0,  0xEF, 0xD0, 0x73, 0xFF
vertex    189,   -102,     73,      0,      0,  0x50, 0xBB, 0x44, 0xFF
vertex    181,     -9,    116,      0,      0,  0x2D, 0x01, 0x76, 0xFF
vertex    201,    125,    -13,      0,      0,  0xE4, 0x7B, 0xFB, 0xFF
vertex    209,     86,     60,      0,      0,  0x38, 0x60, 0x3C, 0xFF
vertex    248,    104,    -43,      0,      0,  0x76, 0x2C, 0xF3, 0xFF
vertex    231,     81,     33,      0,      0,  0x71, 0x27, 0x2A, 0xFF
vertex    232,     69,    -34,      0,      0,  0x72, 0xE4, 0xD1, 0xFF
vertex    211,     91,    -71,      0,      0,  0x31, 0x46, 0xA3, 0xFF
vertex    237,     64,      0,      0,      0,  0x7E, 0xF9, 0xFF, 0xFF
vertex    227,     35,     75,      0,      0,  0x6D, 0x12, 0x3D, 0xFF
vertex    175,     91,     39,      0,      0,  0x01, 0x75, 0x2F, 0xFF
vertex    160,     96,      0,      0,      0,  0xB7, 0x67, 0xFE, 0xFF
vertex     64,   -103,     52,      0,      0,  0xF3, 0x8B, 0x2E, 0xFF
vertex     64,   -103,    -51,      0,      0,  0xF3, 0x8B, 0xD2, 0xFF
vertex    119,   -134,      0,      0,      0,  0xE8, 0x84, 0xFF, 0xFF

mario_face_hair_cap_off_dl_vertex_group5: # 0x04012FB0
vertex    145,    -83,    105,      0,      0,  0xEF, 0xD0, 0x73, 0xFF
vertex    181,     -9,    116,      0,      0,  0x2D, 0x01, 0x76, 0xFF
vertex    120,    -11,    111,      0,      0,  0xFF, 0x13, 0x7D, 0xFF
vertex     64,   -103,    -51,      0,      0,  0xF3, 0x8B, 0xD2, 0xFF
vertex    116,   -124,    -67,      0,      0,  0xFC, 0x8F, 0xC8, 0xFF
vertex    119,   -134,      0,      0,      0,  0xE8, 0x84, 0xFF, 0xFF
vertex    145,    -84,   -104,      0,      0,  0xEF, 0xCF, 0x8D, 0xFF
vertex    182,     -9,   -115,      0,      0,  0x2F, 0xFE, 0x8B, 0xFF
vertex    120,    -12,   -109,      0,      0,  0xFF, 0x13, 0x83, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xE8, 0xAA, 0xA7, 0xFF
vertex     64,   -103,     52,      0,      0,  0xF3, 0x8B, 0x2E, 0xFF
vertex    116,   -126,     68,      0,      0,  0xFB, 0x8F, 0x38, 0xFF
vertex     91,    -54,     86,      0,      0,  0xE9, 0xA9, 0x59, 0xFF
vertex     31,    -84,      0,      0,      0,  0xA0, 0xAE, 0x00, 0xFF
vertex     36,   -116,     36,      0,      0,  0xFB, 0x8E, 0xC9, 0xFF
vertex      9,    -88,     59,      0,      0,  0x87, 0xDF, 0x0B, 0xFF

mario_face_hair_cap_off_dl_vertex_group6: # 0x040130B0
vertex     64,   -103,     52,      0,      0,  0xF3, 0x8B, 0x2E, 0xFF
vertex     91,    -54,     86,      0,      0,  0xE9, 0xA9, 0x59, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     31,    -84,      0,      0,      0,  0xA0, 0xAE, 0x00, 0xFF
vertex     36,   -116,     36,      0,      0,  0xFB, 0x8E, 0xC9, 0xFF
vertex     58,   -114,     60,      0,      0,  0x57, 0xB4, 0x32, 0xFF
vertex     36,   -116,    -35,      0,      0,  0xFB, 0x8E, 0x37, 0xFF
vertex     64,   -103,    -51,      0,      0,  0xF3, 0x8B, 0xD2, 0xFF
vertex     56,    -45,    -76,      0,      0,  0xE3, 0xCA, 0x92, 0xFF
vertex     91,    -54,    -85,      0,      0,  0xE8, 0xAA, 0xA7, 0xFF
vertex     58,   -114,    -59,      0,      0,  0x57, 0xB4, 0xCE, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex      9,    -88,    -58,      0,      0,  0x87, 0xDF, 0xF5, 0xFF
vertex      9,    -88,     59,      0,      0,  0x87, 0xDF, 0x0B, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF
vertex     35,   -120,    -67,      0,      0,  0xDA, 0x94, 0xCB, 0xFF

mario_face_hair_cap_off_dl_vertex_group7: # 0x040131B0
vertex     36,   -116,     36,      0,      0,  0xFB, 0x8E, 0xC9, 0xFF
vertex     35,   -120,     68,      0,      0,  0xDA, 0x94, 0x35, 0xFF
vertex      9,    -88,     59,      0,      0,  0x87, 0xDF, 0x0B, 0xFF
vertex     58,   -114,     60,      0,      0,  0x57, 0xB4, 0x32, 0xFF
vertex     35,   -120,    -67,      0,      0,  0xDA, 0x94, 0xCB, 0xFF
vertex     31,    -85,    -86,      0,      0,  0xDB, 0xFD, 0x87, 0xFF
vertex     58,   -114,    -59,      0,      0,  0x57, 0xB4, 0xCE, 0xFF
vertex      9,    -88,    -58,      0,      0,  0x87, 0xDF, 0xF5, 0xFF
vertex     56,    -45,    -76,      0,      0,  0xE3, 0xCA, 0x92, 0xFF
vertex     17,    -52,    -46,      0,      0,  0x89, 0xF8, 0xD7, 0xFF
vertex     31,    -85,     87,      0,      0,  0xDB, 0xFD, 0x79, 0xFF
vertex     56,    -45,     77,      0,      0,  0xE3, 0xCA, 0x6E, 0xFF
vertex     17,    -52,     47,      0,      0,  0x89, 0xF8, 0x29, 0xFF

mario_face_part_cap_off_dl_vertex_group9: # 0x04013280
vertex     44,     44,     97,      0,      0,  0xDA, 0x21, 0x74, 0xFF
vertex     48,     94,     76,      0,      0,  0xD7, 0x60, 0x47, 0xFF
vertex      3,     54,     52,      0,      0,  0x95, 0x1D, 0x3C, 0xFF

glabel mario_eyes_cap_off_dl # 0x040132B0 - 0x04013318
gsSPVertex mario_eyes_cap_off_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  8,  6,  4, 0x0
gsSP2Triangles  5,  4,  7, 0x0,  7,  9,  5, 0x0
gsSP2Triangles  2,  8, 10, 0x0,  1,  6,  8, 0x0
gsSP2Triangles  1,  8,  2, 0x0,  6, 11,  7, 0x0
gsSP1Triangle  1, 11,  6, 0x0
gsSPEndDisplayList

glabel mario_mustache_cap_off_dl # 0x04013318 - 0x040133A8
gsSPVertex mario_mustache_cap_off_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  3,  5,  1, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  7,  6,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0,  8, 11,  6, 0x0
gsSP2Triangles 12,  8, 13, 0x0, 13,  8, 10, 0x0
gsSP2Triangles 14,  3,  4, 0x0, 13, 10, 15, 0x0
gsSPVertex mario_mustache_cap_off_dl_vertex_group2, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP1Triangle  2,  3,  4, 0x0
gsSPEndDisplayList

glabel mario_hair_sideburn_cap_off_dl # 0x040133A8 - 0x040133F8
gsSPVertex mario_hair_sideburn_cap_off_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  4,  2,  5, 0x0,  1,  5,  2, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  9,  6, 0x0
gsSP2Triangles  9,  8, 10, 0x0, 10,  8, 11, 0x0
gsSPEndDisplayList

glabel mario_face_part_cap_off_dl # 0x040133F8 - 0x040136D0
gsSPVertex mario_face_part_cap_off_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  3,  6,  7, 0x0
gsSP2Triangles  4,  8,  2, 0x0,  8,  4,  9, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  6,  5, 10, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 14, 13, 12, 0x0
gsSP1Triangle 13, 14,  0, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  8,  7, 0x0
gsSP2Triangles 10,  1, 11, 0x0,  1, 12, 11, 0x0
gsSP2Triangles 12,  1,  0, 0x0, 13, 11, 14, 0x0
gsSP2Triangles 12, 14, 11, 0x0, 11, 13, 15, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  3,  5,  7, 0x0
gsSP2Triangles  8,  7,  5, 0x0,  4,  8,  5, 0x0
gsSP2Triangles  9, 10, 11, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group4, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  1,  0, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  3,  9, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 13, 11, 10, 0x0, 11, 13, 14, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group5, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  5, 0x0,  8,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8,  6,  9, 0x0
gsSP2Triangles  9, 11, 10, 0x0,  9, 12, 11, 0x0
gsSP2Triangles  0, 13,  1, 0x0, 13, 14,  1, 0x0
gsSP1Triangle  1, 14, 15, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group6, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  2, 0x0
gsSP2Triangles  2,  4,  0, 0x0,  1,  0,  5, 0x0
gsSP2Triangles  1,  6,  7, 0x0,  1,  5,  6, 0x0
gsSP2Triangles  7,  8,  1, 0x0,  3,  9,  4, 0x0
gsSP2Triangles  9,  3, 10, 0x0,  4, 11,  0, 0x0
gsSP2Triangles 11,  4, 12, 0x0,  4,  9, 12, 0x0
gsSP2Triangles 10, 13, 14, 0x0,  0, 11, 15, 0x0
gsSP2Triangles  5,  0, 15, 0x0, 14,  9, 10, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group7, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  8,  5,  4, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  2, 12,  0, 0x0, 13,  4,  6, 0x0
gsSP2Triangles  6, 14, 15, 0x0,  6,  7, 14, 0x0
gsSP1Triangle 13,  6, 15, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group8, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  6,  5, 0x0
gsSP1Triangle  8,  5,  4, 0x0
gsSPVertex mario_face_part_cap_off_dl_vertex_group9, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel mario_face_hair_cap_off_dl # 0x040136D0 - 0x040139C0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  7, 0x0,  3,  7,  4, 0x0
gsSP2Triangles  8,  4,  9, 0x0,  7, 10,  4, 0x0
gsSP2Triangles  4, 10,  9, 0x0,  8,  5,  4, 0x0
gsSP2Triangles 11,  1, 12, 0x0,  1,  0, 12, 0x0
gsSP2Triangles  1, 13,  2, 0x0,  1, 11, 14, 0x0
gsSP2Triangles 13,  1, 14, 0x0, 15,  2, 13, 0x0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  3,  7,  6, 0x0
gsSP2Triangles  8,  7,  3, 0x0,  5,  8,  3, 0x0
gsSP2Triangles  9, 10,  4, 0x0, 11,  4,  6, 0x0
gsSP2Triangles 11,  9,  4, 0x0, 10,  5,  4, 0x0
gsSP2Triangles 10, 12,  5, 0x0,  5, 13, 14, 0x0
gsSP2Triangles  8,  5, 14, 0x0,  9,  2, 10, 0x0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  1,  4,  5, 0x0,  4,  6,  5, 0x0
gsSP2Triangles  7,  8,  9, 0x0, 10,  7,  9, 0x0
gsSP2Triangles  8,  7, 11, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 14, 11, 13, 0x0, 14,  8, 11, 0x0
gsSP1Triangle 15, 13, 12, 0x0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  7,  8,  5, 0x0
gsSP2Triangles  8,  3,  5, 0x0,  9,  7,  5, 0x0
gsSP2Triangles 10,  6,  4, 0x0,  4,  3, 11, 0x0
gsSP2Triangles  3, 12, 11, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group5, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  4,  3, 0x0,  7,  6,  8, 0x0
gsSP2Triangles  9,  6,  3, 0x0,  6,  9,  8, 0x0
gsSP2Triangles 10, 11,  0, 0x0, 12,  0,  2, 0x0
gsSP2Triangles 10,  0, 12, 0x0, 10,  5, 11, 0x0
gsSP2Triangles 13, 14, 15, 0x0, 13,  3, 10, 0x0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group6, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  5,  0,  2, 0x0,  5,  4,  0, 0x0
gsSP2Triangles  3,  6,  7, 0x0,  8,  9,  7, 0x0
gsSP2Triangles  6, 10,  7, 0x0,  8,  7, 10, 0x0
gsSP2Triangles  3, 11, 12, 0x0, 13, 14,  3, 0x0
gsSP2Triangles 12,  6,  3, 0x0,  6, 15, 10, 0x0
gsSP1Triangle 12, 15,  6, 0x0
gsSPVertex mario_face_hair_cap_off_dl_vertex_group7, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  4,  7, 0x0
gsSP2Triangles  6,  5,  8, 0x0,  9,  8,  5, 0x0
gsSP2Triangles  5,  7,  9, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 11, 10,  3, 0x0, 12,  2, 10, 0x0
gsSP2Triangles  2,  1, 10, 0x0, 10,  1,  3, 0x0
gsSPEndDisplayList

glabel mario_face_cap_off_dl # 0x040139C0 - 0x040139E8
gsSPDisplayList mario_face_part_cap_off_dl
gsSPLight mario_diff_light_group6, 1
gsSPLight mario_amb_light_group6, 2
gsSPDisplayList mario_face_hair_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_front # 0x040139E8 - 0x04013AB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_front
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_half_closed # 0x04013AB8 - 0x04013B88
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_half_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_closed # 0x04013B88 - 0x04013C58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_right # 0x04013C58 - 0x04013D28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_right
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_left # 0x04013D28 - 0x04013DF8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_left
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_up # 0x04013DF8 - 0x04013EC8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_up
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_down # 0x04013EC8 - 0x04013F98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_down
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_cap_off_eyes_dead # 0x04013F98 - 0x04014068
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_dead
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_mustache_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_hair_sideburn
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_face_cap_off_dl
gsSPEndDisplayList

glabel mario_metal_cap_off_shared_dl # 0x04014068 - 0x04014098
gsSPDisplayList mario_eyes_cap_off_dl
gsSPDisplayList mario_mustache_cap_off_dl
gsSPDisplayList mario_hair_sideburn_cap_off_dl
gsSPDisplayList mario_face_part_cap_off_dl
gsSPDisplayList mario_face_hair_cap_off_dl
gsSPEndDisplayList

mario_medium_poly_butt_dl_vertex_group1: # 0x04014098
vertex      0,     78,     37,      0,      0,  0xC7, 0x6F, 0x14, 0x00
vertex     44,     80,     46,      0,      0,  0x36, 0x68, 0x2E, 0x00
vertex     43,     80,    -45,      0,      0,  0x2C, 0x70, 0xDB, 0x00
vertex     -6,    -84,     50,      0,      0,  0xD5, 0x90, 0x26, 0x00
vertex     41,    -86,    -45,      0,      0,  0x35, 0x90, 0xE7, 0x00
vertex     41,    -86,     45,      0,      0,  0x44, 0x9B, 0x1F, 0x00
vertex    -33,    -45,    -31,      0,      0,  0x87, 0xE9, 0xE3, 0x00
vertex    -33,    -45,     31,      0,      0,  0x86, 0xE5, 0x15, 0x00
vertex    -32,     43,    -22,      0,      0,  0x8B, 0x2D, 0xF0, 0x00
vertex     -2,     41,     95,      0,      0,  0xBA, 0x3B, 0x57, 0x00
vertex     -5,    -45,     97,      0,      0,  0xC7, 0xDE, 0x6B, 0x00
vertex     44,     36,     95,      0,      0,  0x3D, 0x22, 0x69, 0x00
vertex     -5,    -45,    -97,      0,      0,  0xC7, 0xDD, 0x95, 0x00
vertex     -2,     41,    -95,      0,      0,  0xBA, 0x3B, 0xAA, 0x00
vertex     44,     35,    -96,      0,      0,  0x3C, 0x22, 0x96, 0x00
vertex     -6,    -84,    -50,      0,      0,  0xC1, 0x9A, 0xD9, 0x00

mario_medium_poly_butt_dl_vertex_group2: # 0x04014198
vertex     -2,     41,     95,      0,      0,  0xBA, 0x3B, 0x57, 0x00
vertex      0,     78,     37,      0,      0,  0xC7, 0x6F, 0x14, 0x00
vertex    -32,     43,     22,      0,      0,  0x8C, 0x2C, 0x18, 0x00
vertex      0,     78,    -37,      0,      0,  0xC5, 0x6C, 0xE2, 0x00
vertex     -2,     41,    -95,      0,      0,  0xBA, 0x3B, 0xAA, 0x00
vertex    -32,     43,    -22,      0,      0,  0x8B, 0x2D, 0xF0, 0x00
vertex    -33,    -45,     31,      0,      0,  0x86, 0xE5, 0x15, 0x00
vertex    -33,    -45,    -31,      0,      0,  0x87, 0xE9, 0xE3, 0x00
vertex     -6,    -84,    -50,      0,      0,  0xC1, 0x9A, 0xD9, 0x00
vertex     43,    -48,    -97,      0,      0,  0x3B, 0xC1, 0xA4, 0x00
vertex     41,    -86,    -45,      0,      0,  0x35, 0x90, 0xE7, 0x00
vertex     -6,    -84,     50,      0,      0,  0xD5, 0x90, 0x26, 0x00
vertex     41,    -86,     45,      0,      0,  0x44, 0x9B, 0x1F, 0x00
vertex     43,    -48,     97,      0,      0,  0x3B, 0xC2, 0x5C, 0x00
vertex     44,     36,     95,      0,      0,  0x3D, 0x22, 0x69, 0x00
vertex     44,     80,     46,      0,      0,  0x36, 0x68, 0x2E, 0x00

mario_medium_poly_butt_dl_vertex_group3: # 0x04014298
vertex     -2,     41,    -95,      0,      0,  0xBA, 0x3B, 0xAA, 0x00
vertex     43,     80,    -45,      0,      0,  0x2C, 0x70, 0xDB, 0x00
vertex     44,     35,    -96,      0,      0,  0x3C, 0x22, 0x96, 0x00
vertex      0,     78,    -37,      0,      0,  0xC5, 0x6C, 0xE2, 0x00
vertex     44,     80,     46,      0,      0,  0x36, 0x68, 0x2E, 0x00
vertex      0,     78,     37,      0,      0,  0xC7, 0x6F, 0x14, 0x00
vertex     -2,     41,     95,      0,      0,  0xBA, 0x3B, 0x57, 0x00
vertex    -32,     43,    -22,      0,      0,  0x8B, 0x2D, 0xF0, 0x00
vertex     43,    -48,     97,      0,      0,  0x3B, 0xC2, 0x5C, 0x00
vertex     -5,    -45,     97,      0,      0,  0xC7, 0xDE, 0x6B, 0x00
vertex     -6,    -84,     50,      0,      0,  0xD5, 0x90, 0x26, 0x00
vertex     -6,    -84,    -50,      0,      0,  0xC1, 0x9A, 0xD9, 0x00
vertex     -5,    -45,    -97,      0,      0,  0xC7, 0xDD, 0x95, 0x00
vertex     43,    -48,    -97,      0,      0,  0x3B, 0xC1, 0xA4, 0x00
vertex    -33,    -45,     31,      0,      0,  0x86, 0xE5, 0x15, 0x00
vertex    -33,    -45,    -31,      0,      0,  0x87, 0xE9, 0xE3, 0x00

mario_medium_poly_butt_dl_vertex_group4: # 0x04014398
vertex     -5,    -45,     97,      0,      0,  0xC7, 0xDE, 0x6B, 0x00
vertex     43,    -48,     97,      0,      0,  0x3B, 0xC2, 0x5C, 0x00
vertex     44,     36,     95,      0,      0,  0x3D, 0x22, 0x69, 0x00
vertex    -33,    -45,     31,      0,      0,  0x86, 0xE5, 0x15, 0x00
vertex    -32,     43,     22,      0,      0,  0x8C, 0x2C, 0x18, 0x00
vertex    -32,     43,    -22,      0,      0,  0x8B, 0x2D, 0xF0, 0x00
vertex     -6,    -84,     50,      0,      0,  0xD5, 0x90, 0x26, 0x00
vertex     -6,    -84,    -50,      0,      0,  0xC1, 0x9A, 0xD9, 0x00
vertex     41,    -86,    -45,      0,      0,  0x35, 0x90, 0xE7, 0x00
vertex     43,     80,    -45,      0,      0,  0x2C, 0x70, 0xDB, 0x00
vertex      0,     78,    -37,      0,      0,  0xC5, 0x6C, 0xE2, 0x00
vertex      0,     78,     37,      0,      0,  0xC7, 0x6F, 0x14, 0x00
vertex     85,     -5,      0,      0,      0,  0x7F, 0xFE, 0x00, 0x00
vertex     44,     35,    -96,      0,      0,  0x3C, 0x22, 0x96, 0x00
vertex     43,    -48,    -97,      0,      0,  0x3B, 0xC1, 0xA4, 0x00
vertex     41,    -86,     45,      0,      0,  0x44, 0x9B, 0x1F, 0x00

mario_medium_poly_butt_dl_vertex_group5: # 0x04014498
vertex     44,     36,     95,      0,      0,  0x3D, 0x22, 0x69, 0x00
vertex     85,     -5,      0,      0,      0,  0x7F, 0xFE, 0x00, 0x00
vertex     44,     80,     46,      0,      0,  0x36, 0x68, 0x2E, 0x00
vertex     43,     80,    -45,      0,      0,  0x2C, 0x70, 0xDB, 0x00

glabel mario_medium_poly_butt_dl # 0x040144D8 - 0x04014638
gsSPVertex mario_medium_poly_butt_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15,  6, 0x0
gsSP1Triangle  3, 10,  7, 0x0
gsSPVertex mario_medium_poly_butt_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  7,  5,  4, 0x0
gsSP2Triangles  7,  8,  6, 0x0,  9, 10,  8, 0x0
gsSP2Triangles 11, 12, 13, 0x0,  2,  1,  5, 0x0
gsSP1Triangle 14, 15,  0, 0x0
gsSPVertex mario_medium_poly_butt_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  3,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 10, 14, 0x0,  0, 12, 15, 0x0
gsSP2Triangles 14,  9,  6, 0x0,  2, 13, 12, 0x0
gsSPVertex mario_medium_poly_butt_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 12, 13, 0x0, 13, 12, 14, 0x0
gsSP2Triangles 14, 12,  8, 0x0,  8, 12, 15, 0x0
gsSP2Triangles 15, 12,  1, 0x0,  1, 12,  2, 0x0
gsSPVertex mario_medium_poly_butt_dl_vertex_group5, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_butt # 0x04014638 - 0x04014668
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_medium_poly_butt_dl
gsSPEndDisplayList

glabel mario_metal_medium_poly_butt # 0x04014668 - 0x040146E0
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_medium_poly_butt_dl
gsSPEndDisplayList

mario_medium_poly_left_arm_shared_dl_vertex: # 0x040146E0
vertex     -6,    -32,    -22,      0,      0,  0x08, 0x84, 0x18, 0x00
vertex     60,    -27,    -18,      0,      0,  0x3D, 0xC5, 0xA3, 0x00
vertex     60,    -18,     26,      0,      0,  0x5C, 0xBE, 0x36, 0x00
vertex     -6,    -32,    -22,      0,      0,  0x07, 0xF5, 0x82, 0x00
vertex     -7,     21,    -27,      0,      0,  0x07, 0xF5, 0x82, 0x00
vertex     59,     16,    -22,      0,      0,  0x5B, 0x4F, 0xDA, 0x00
vertex     -7,     20,     18,      0,      0,  0x0C, 0x73, 0x32, 0x00
vertex     59,     14,     14,      0,      0,  0x38, 0x4B, 0x55, 0x00
vertex     -6,    -21,     33,      0,      0,  0x0B, 0x2A, 0x77, 0x00
vertex     -7,     21,    -27,      0,      0,  0x0A, 0x7E, 0x04, 0x00
vertex     -6,    -21,     33,      0,      0,  0x08, 0x84, 0x18, 0x00
vertex     -7,     21,    -27,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -6,    -32,    -22,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -6,    -21,     33,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -7,     20,     18,      0,      0,  0x81, 0xFF, 0x00, 0x00

glabel mario_medium_poly_left_arm_shared_dl # 0x040147D0 - 0x04014840
gsSPVertex mario_medium_poly_left_arm_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  4,  5,  1, 0x0,  6,  7,  5, 0x0
gsSP2Triangles  8,  2,  7, 0x0,  6,  8,  7, 0x0
gsSP2Triangles  9,  6,  5, 0x0, 10,  0,  2, 0x0
gsSP2Triangles  5,  2,  1, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 13, 14, 11, 0x0,  5,  7,  2, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_left_arm # 0x04014840 - 0x04014860
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_medium_poly_left_arm_shared_dl
gsSPEndDisplayList

mario_medium_poly_left_forearm_shared_dl_vertex: # 0x04014860
vertex     -9,    -29,    -18,      0,      0,  0x05, 0x84, 0x19, 0x00
vertex     53,    -26,    -17,      0,      0,  0x59, 0xD0, 0xB5, 0x00
vertex     53,    -17,     24,      0,      0,  0x3D, 0xAB, 0x47, 0x00
vertex     -9,    -29,    -18,      0,      0,  0x04, 0xF3, 0x82, 0x00
vertex     -9,     16,    -24,      0,      0,  0x04, 0xF4, 0x82, 0x00
vertex     53,     13,    -21,      0,      0,  0x3B, 0x64, 0xCE, 0x00
vertex     -9,     15,     15,      0,      0,  0x07, 0x75, 0x30, 0x00
vertex     53,     13,     12,      0,      0,  0x52, 0x41, 0x47, 0x00
vertex     -9,    -19,     28,      0,      0,  0x07, 0x2C, 0x76, 0x00
vertex     -9,     16,    -24,      0,      0,  0x06, 0x7E, 0x02, 0x00
vertex     -9,    -19,     28,      0,      0,  0x05, 0x84, 0x1A, 0x00
vertex     -9,     16,    -24,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -9,    -29,    -18,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -9,    -19,     28,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -9,     15,     15,      0,      0,  0x81, 0xFF, 0x00, 0x00

glabel mario_medium_poly_left_forearm_shared_dl # 0x04014950 - 0x040149C0
gsSPVertex mario_medium_poly_left_forearm_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  4,  5,  1, 0x0,  6,  7,  5, 0x0
gsSP2Triangles  8,  2,  7, 0x0,  6,  8,  7, 0x0
gsSP2Triangles  9,  6,  5, 0x0, 10,  0,  2, 0x0
gsSP2Triangles  1,  7,  2, 0x0,  1,  5,  7, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 13, 14, 11, 0x0
gsSPEndDisplayList

mario_medium_poly_left_hand_closed_shared_dl_vertex_group1: # 0x040149C0
vertex     31,     10,     40,      0,      0,  0xD8, 0xED, 0x76, 0x00
vertex     12,      1,     26,      0,      0,  0xF1, 0xF7, 0x7D, 0x00
vertex     27,    -32,     -3,      0,      0,  0x06, 0x82, 0x0B, 0x00
vertex     11,      2,    -28,      0,      0,  0xCA, 0xF6, 0x8E, 0x00
vertex     44,    -22,    -46,      0,      0,  0xDE, 0xB9, 0x9D, 0x00
vertex     18,     37,    -31,      0,      0,  0xC7, 0x28, 0x97, 0x00
vertex     -2,     36,     -2,      0,      0,  0xB0, 0x61, 0x03, 0x00
vertex     -5,     -5,     34,      0,      0,  0x2F, 0x13, 0x74, 0x00
vertex     -6,     -5,    -32,      0,      0,  0x1C, 0x0E, 0x86, 0x00
vertex     81,     32,     40,      0,      0,  0x48, 0x1F, 0x63, 0x00
vertex     55,     84,      9,      0,      0,  0x14, 0x74, 0x2C, 0x00
vertex    102,    -23,      6,      0,      0,  0x64, 0xC4, 0x31, 0x00
vertex     95,     43,    -12,      0,      0,  0x6E, 0x36, 0xE0, 0x00
vertex     54,     58,    -32,      0,      0,  0x02, 0x4E, 0x9D, 0x00
vertex     84,    -10,    -41,      0,      0,  0x39, 0xE2, 0x93, 0x00
vertex     53,    -42,      9,      0,      0,  0x04, 0x83, 0x0F, 0x00

mario_medium_poly_left_hand_closed_shared_dl_vertex_group2: # 0x04014AC0
vertex     31,     10,     40,      0,      0,  0xD8, 0xED, 0x76, 0x00
vertex     55,     84,      9,      0,      0,  0x14, 0x74, 0x2C, 0x00
vertex      7,     62,     10,      0,      0,  0xA7, 0x5A, 0x00, 0x00
vertex     27,    -32,     -3,      0,      0,  0x06, 0x82, 0x0B, 0x00
vertex     14,    -51,     -2,      0,      0,  0x37, 0xD5, 0x97, 0x00
vertex     -6,     -5,    -32,      0,      0,  0x1C, 0x0E, 0x86, 0x00
vertex    -26,     40,     -1,      0,      0,  0x05, 0x48, 0x98, 0x00
vertex     -2,     36,     -2,      0,      0,  0xB0, 0x61, 0x03, 0x00
vertex    -26,     40,     -1,      0,      0,  0x11, 0x50, 0x60, 0x00
vertex     -5,     -5,     34,      0,      0,  0x2F, 0x13, 0x74, 0x00
vertex     14,    -51,     -2,      0,      0,  0x49, 0xD5, 0x5E, 0x00
vertex     18,     37,    -31,      0,      0,  0xC7, 0x28, 0x97, 0x00
vertex     44,    -22,    -46,      0,      0,  0xDE, 0xB9, 0x9D, 0x00
vertex     53,    -42,      9,      0,      0,  0x04, 0x83, 0x0F, 0x00
vertex     54,     58,    -32,      0,      0,  0x02, 0x4E, 0x9D, 0x00

mario_medium_poly_left_hand_closed_shared_dl_vertex_group3: # 0x04014BB0
vertex     54,     58,    -32,      0,      0,  0x02, 0x4E, 0x9D, 0x00
vertex     95,     43,    -12,      0,      0,  0x6E, 0x36, 0xE0, 0x00
vertex     84,    -10,    -41,      0,      0,  0x39, 0xE2, 0x93, 0x00
vertex      7,     62,     10,      0,      0,  0xA7, 0x5A, 0x00, 0x00
vertex     55,     84,      9,      0,      0,  0x14, 0x74, 0x2C, 0x00
vertex     53,    -42,      9,      0,      0,  0x04, 0x83, 0x0F, 0x00
vertex    102,    -23,      6,      0,      0,  0x64, 0xC4, 0x31, 0x00
vertex     18,     37,    -31,      0,      0,  0xC7, 0x28, 0x97, 0x00
vertex     44,    -22,    -46,      0,      0,  0xDE, 0xB9, 0x9D, 0x00
vertex     11,      2,    -28,      0,      0,  0xCA, 0xF6, 0x8E, 0x00
vertex     -5,     -5,     34,      0,      0,  0x8C, 0xCE, 0x01, 0x00
vertex     -6,     -5,    -32,      0,      0,  0x8C, 0xCE, 0x01, 0x00
vertex     14,    -51,     -2,      0,      0,  0x8C, 0xCE, 0x01, 0x00
vertex    -26,     40,     -1,      0,      0,  0x8C, 0xCE, 0x01, 0x00

glabel mario_medium_poly_left_hand_closed_shared_dl # 0x04014C90 - 0x04014DC0
gsSPVertex mario_medium_poly_left_hand_closed_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  5,  3,  6, 0x0,  6,  1,  0, 0x0
gsSP2Triangles  2,  1,  7, 0x0,  7,  1,  6, 0x0
gsSP2Triangles  6,  3,  8, 0x0,  3,  2,  8, 0x0
gsSP2Triangles  0,  9, 10, 0x0, 11,  9,  0, 0x0
gsSP2Triangles 10, 12, 13, 0x0, 14, 12, 11, 0x0
gsSP2Triangles 11, 12,  9, 0x0,  9, 12, 10, 0x0
gsSP1Triangle 15, 11,  0, 0x0
gsSPVertex mario_medium_poly_left_hand_closed_shared_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  9, 10,  3, 0x0,  7,  0,  2, 0x0
gsSP2Triangles  7,  2, 11, 0x0,  3, 12, 13, 0x0
gsSP2Triangles  3, 13,  0, 0x0, 11,  2, 14, 0x0
gsSPVertex mario_medium_poly_left_hand_closed_shared_dl_vertex_group3, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  5,  2,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  2,  8, 0x0,  7,  0,  2, 0x0
gsSP2Triangles  5,  8,  2, 0x0, 10, 11, 12, 0x0
gsSP1Triangle 10, 13, 11, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_left_hand_closed # 0x04014DC0 - 0x04014DE0
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_medium_poly_left_hand_closed_shared_dl
gsSPEndDisplayList

mario_medium_poly_right_arm_shared_dl_vertex: # 0x04014DE0
vertex     60,    -28,     22,      0,      0,  0x3B, 0xC7, 0x60, 0x00
vertex     60,    -19,    -19,      0,      0,  0x5A, 0xBC, 0xC7, 0x00
vertex     60,     14,     24,      0,      0,  0x5B, 0x4F, 0x26, 0x00
vertex     -7,    -31,     24,      0,      0,  0x04, 0x84, 0xE6, 0x00
vertex     -7,    -20,    -27,      0,      0,  0x04, 0x84, 0xE6, 0x00
vertex     -8,     21,    -15,      0,      0,  0x11, 0x73, 0xCE, 0x00
vertex     -8,     22,     27,      0,      0,  0x0E, 0x7E, 0xFD, 0x00
vertex     60,     13,     -9,      0,      0,  0x3C, 0x46, 0xAA, 0x00
vertex     -7,    -20,    -27,      0,      0,  0x0E, 0x23, 0x88, 0x00
vertex     -8,     22,     27,      0,      0,  0x03, 0xFA, 0x7E, 0x00
vertex     -7,    -31,     24,      0,      0,  0x03, 0xFA, 0x7E, 0x00
vertex     -7,    -20,    -27,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -7,    -31,     24,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -8,     22,     27,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex     -8,     21,    -15,      0,      0,  0x81, 0xFF, 0x00, 0x00

glabel mario_medium_poly_right_arm_shared_dl # 0x04014ED0 - 0x04014F40
gsSPVertex mario_medium_poly_right_arm_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  2,  5,  6, 0x0,  7,  8,  5, 0x0
gsSP2Triangles  7,  1,  8, 0x0,  2,  7,  5, 0x0
gsSP2Triangles  0,  2,  9, 0x0,  0,  9, 10, 0x0
gsSP2Triangles  1,  0,  3, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 13, 14, 11, 0x0,  1,  7,  2, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_right_arm # 0x04014F40 - 0x04014F60
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_medium_poly_right_arm_shared_dl
gsSPEndDisplayList

mario_medium_poly_right_forearm_shared_dl_vertex: # 0x04014F60
vertex     -5,    -18,    -24,      0,      0,  0x81, 0xFE, 0x03, 0x00
vertex     -3,    -29,     21,      0,      0,  0x81, 0xFE, 0x03, 0x00
vertex     -4,     17,     26,      0,      0,  0x81, 0xFE, 0x03, 0x00
vertex     52,     13,    -10,      0,      0,  0x51, 0x40, 0xB7, 0x00
vertex     53,     13,     22,      0,      0,  0x3D, 0x63, 0x31, 0x00
vertex     53,    -26,     19,      0,      0,  0x5B, 0xD0, 0x49, 0x00
vertex     52,    -17,    -21,      0,      0,  0x3A, 0xAC, 0xB6, 0x00
vertex     -3,    -29,     21,      0,      0,  0x04, 0x85, 0xE4, 0x00
vertex     -5,    -18,    -24,      0,      0,  0x03, 0x85, 0xE3, 0x00
vertex     -5,     17,    -12,      0,      0,  0x09, 0x75, 0xD1, 0x00
vertex     -4,     17,     26,      0,      0,  0x08, 0x7E, 0x00, 0x00
vertex     -5,    -18,    -24,      0,      0,  0x06, 0x2A, 0x89, 0x00
vertex     -4,     17,     26,      0,      0,  0x06, 0xF5, 0x7E, 0x00
vertex     -3,    -29,     21,      0,      0,  0x06, 0xF4, 0x7E, 0x00
vertex     -5,     17,    -12,      0,      0,  0x81, 0xFE, 0x03, 0x00

glabel mario_medium_poly_right_forearm_shared_dl # 0x04015050 - 0x040150C0
gsSPVertex mario_medium_poly_right_forearm_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  4,  9, 10, 0x0,  3, 11,  9, 0x0
gsSP2Triangles  3,  6, 11, 0x0,  4,  3,  9, 0x0
gsSP2Triangles  5,  4, 12, 0x0,  5, 12, 13, 0x0
gsSP2Triangles  6,  5,  7, 0x0,  2, 14,  0, 0x0
gsSPEndDisplayList

mario_medium_poly_right_hand_closed_dl_vertex_group1: # 0x040150C0
vertex     -7,     -4,     36,      0,      0,  0x8C, 0xCD, 0xFD, 0x00
vertex    -26,     40,      0,      0,      0,  0x8C, 0xCD, 0xFD, 0x00
vertex     -4,     -7,    -34,      0,      0,  0x8C, 0xCD, 0xFD, 0x00
vertex     14,    -51,      7,      0,      0,  0x8C, 0xCD, 0xFD, 0x00
vertex     81,     -8,     49,      0,      0,  0x36, 0xE6, 0x6F, 0x00
vertex     42,    -20,     54,      0,      0,  0xD9, 0xBB, 0x62, 0x00
vertex     54,    -42,     -4,      0,      0,  0x04, 0x82, 0xF6, 0x00
vertex     52,     59,     37,      0,      0,  0xFF, 0x55, 0x5E, 0x00
vertex     16,     38,     35,      0,      0,  0xC1, 0x2D, 0x63, 0x00
vertex     10,      3,     33,      0,      0,  0xC3, 0xFA, 0x6E, 0x00
vertex    102,    -23,      0,      0,      0,  0x65, 0xC1, 0xD7, 0x00
vertex     55,     84,     -8,      0,      0,  0x15, 0x73, 0xD1, 0x00
vertex      7,     62,    -11,      0,      0,  0xA7, 0x5A, 0xF9, 0x00
vertex     94,     43,     18,      0,      0,  0x6D, 0x38, 0x21, 0x00
vertex     32,      8,    -40,      0,      0,  0xDA, 0xE8, 0x8A, 0x00
vertex     26,    -32,      8,      0,      0,  0x08, 0x82, 0xFA, 0x00

mario_medium_poly_right_hand_closed_dl_vertex_group2: # 0x040151C0
vertex     16,     38,     35,      0,      0,  0xC1, 0x2D, 0x63, 0x00
vertex      7,     62,    -11,      0,      0,  0xA7, 0x5A, 0xF9, 0x00
vertex     -3,     37,      3,      0,      0,  0xB0, 0x62, 0xF7, 0x00
vertex     32,      8,    -40,      0,      0,  0xDA, 0xE8, 0x8A, 0x00
vertex     26,    -32,      8,      0,      0,  0x08, 0x82, 0xFA, 0x00
vertex     14,    -51,      7,      0,      0,  0x4F, 0xD0, 0xAA, 0x00
vertex     -4,     -7,    -34,      0,      0,  0x37, 0x10, 0x8F, 0x00
vertex    -26,     40,      0,      0,      0,  0x15, 0x51, 0xA1, 0x00
vertex    -26,     40,      0,      0,      0,  0x02, 0x4F, 0x62, 0x00
vertex     -7,     -4,     36,      0,      0,  0x19, 0x13, 0x7A, 0x00
vertex     14,    -51,      7,      0,      0,  0x36, 0xD7, 0x6B, 0x00
vertex     55,     84,     -8,      0,      0,  0x15, 0x73, 0xD1, 0x00
vertex    102,    -23,      0,      0,      0,  0x65, 0xC1, 0xD7, 0x00
vertex     54,    -42,     -4,      0,      0,  0x04, 0x82, 0xF6, 0x00
vertex     94,     43,     18,      0,      0,  0x6D, 0x38, 0x21, 0x00
vertex     83,     30,    -39,      0,      0,  0x4E, 0x1C, 0xA1, 0x00

mario_medium_poly_right_hand_closed_dl_vertex_group3: # 0x040152C0
vertex    102,    -23,      0,      0,      0,  0x65, 0xC1, 0xD7, 0x00
vertex     94,     43,     18,      0,      0,  0x6D, 0x38, 0x21, 0x00
vertex     81,     -8,     49,      0,      0,  0x36, 0xE6, 0x6F, 0x00
vertex     52,     59,     37,      0,      0,  0xFF, 0x55, 0x5E, 0x00
vertex     55,     84,     -8,      0,      0,  0x15, 0x73, 0xD1, 0x00
vertex     32,      8,    -40,      0,      0,  0xDA, 0xE8, 0x8A, 0x00
vertex     83,     30,    -39,      0,      0,  0x4E, 0x1C, 0xA1, 0x00
vertex     -7,     -4,     36,      0,      0,  0x19, 0x13, 0x7A, 0x00
vertex     26,    -32,      8,      0,      0,  0x08, 0x82, 0xFA, 0x00
vertex     10,      3,     33,      0,      0,  0xC3, 0xFA, 0x6E, 0x00
vertex     -3,     37,      3,      0,      0,  0xB0, 0x62, 0xF7, 0x00
vertex     13,      0,    -26,      0,      0,  0xF5, 0xF2, 0x83, 0x00
vertex     -4,     -7,    -34,      0,      0,  0x37, 0x10, 0x8F, 0x00
vertex     16,     38,     35,      0,      0,  0xC1, 0x2D, 0x63, 0x00
vertex     42,    -20,     54,      0,      0,  0xD9, 0xBB, 0x62, 0x00

glabel mario_medium_poly_right_hand_closed_dl # 0x040153B0 - 0x040154E0
gsSPVertex mario_medium_poly_right_hand_closed_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  8, 0x0
gsSP2Triangles  5,  4,  8, 0x0,  9,  5,  8, 0x0
gsSP2Triangles 10,  4,  6, 0x0,  7, 11, 12, 0x0
gsSP2Triangles  4, 13,  7, 0x0,  7, 12,  8, 0x0
gsSP2Triangles 14,  6, 15, 0x0,  6,  5, 15, 0x0
gsSPVertex mario_medium_poly_right_hand_closed_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  7,  2, 0x0
gsSP2Triangles  2,  8,  9, 0x0,  9, 10,  4, 0x0
gsSP2Triangles  1, 11,  3, 0x0,  3, 12, 13, 0x0
gsSP2Triangles 11, 14, 15, 0x0, 15, 14, 12, 0x0
gsSPVertex mario_medium_poly_right_hand_closed_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  4, 0x0
gsSP2Triangles  5,  6,  0, 0x0,  4,  6,  5, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  7,  9, 10, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11,  8, 0x0
gsSP2Triangles  5, 11, 10, 0x0, 10,  9, 13, 0x0
gsSP2Triangles 14,  9,  8, 0x0,  8, 11,  5, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_right_hand_closed # 0x040154E0 - 0x04015500
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_medium_poly_right_hand_closed_dl
gsSPEndDisplayList

glabel mario_metal_medium_poly_right_hand_closed # 0x04015500 - 0x04015530
gsSPDisplayList mario_medium_poly_right_hand_closed_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsSPEndDisplayList

mario_medium_poly_left_thigh_dl_vertex: # 0x04015530
vertex     18,    -12,     58,      0,      0,  0x13, 0xDD, 0x78, 0x00
vertex     22,    -52,      8,      0,      0,  0x1C, 0x85, 0x01, 0x00
vertex     99,    -35,      8,      0,      0,  0x3E, 0x92, 0x01, 0x00
vertex     14,     51,     38,      0,      0,  0x08, 0x75, 0x30, 0x00
vertex     92,     47,     33,      0,      0,  0x36, 0x4B, 0x56, 0x00
vertex     14,     50,    -23,      0,      0,  0x0A, 0x65, 0xB5, 0x00
vertex     92,     47,    -16,      0,      0,  0x47, 0x55, 0xC5, 0x00
vertex     19,    -13,    -42,      0,      0,  0x15, 0xDB, 0x89, 0x00
vertex     96,     -3,    -31,      0,      0,  0x68, 0xF1, 0xBA, 0x00
vertex     96,     -3,     48,      0,      0,  0x71, 0xF8, 0x38, 0x00
vertex     19,    -13,    -42,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     22,    -52,      8,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     18,    -12,     58,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     14,     51,     38,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     14,     50,    -23,      0,      0,  0x82, 0xF7, 0xFF, 0x00

glabel mario_medium_poly_left_thigh_dl # 0x04015620 - 0x040156B0
gsSPVertex mario_medium_poly_left_thigh_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  5,  3,  6, 0x0,  7,  5,  6, 0x0
gsSP2Triangles  1,  7,  2, 0x0,  7,  8,  2, 0x0
gsSP2Triangles  6,  8,  7, 0x0,  3,  4,  6, 0x0
gsSP2Triangles  0,  9,  4, 0x0,  2,  9,  0, 0x0
gsSP2Triangles  9,  2,  8, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 12, 13, 10, 0x0, 13, 14, 10, 0x0
gsSP2Triangles  8,  6,  9, 0x0,  6,  4,  9, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_left_thigh # 0x040156B0 - 0x040156E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_medium_poly_left_thigh_dl
gsSPEndDisplayList

glabel mario_metal_medium_poly_left_thigh # 0x040156E0 - 0x04015758
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_medium_poly_left_thigh_dl
gsSPEndDisplayList

mario_medium_poly_left_leg_shared_dl_vertex: # 0x04015758
vertex      5,    -35,      9,      0,      0,  0xCA, 0x8E, 0x00, 0x00
vertex     65,    -44,     10,      0,      0,  0xEE, 0x83, 0x01, 0x00
vertex     66,     -9,     54,      0,      0,  0xF2, 0xDC, 0x78, 0x00
vertex      9,     46,     33,      0,      0,  0xD5, 0x61, 0x45, 0x00
vertex     69,     47,     37,      0,      0,  0xF9, 0x66, 0x4B, 0x00
vertex     70,     47,    -18,      0,      0,  0xFB, 0x74, 0xCF, 0x00
vertex     10,     46,    -16,      0,      0,  0xAF, 0x40, 0xB7, 0x00
vertex     67,     -9,    -36,      0,      0,  0xF4, 0xDA, 0x88, 0x00
vertex      7,     -4,    -31,      0,      0,  0x9B, 0xEE, 0xB6, 0x00
vertex      7,     -4,     49,      0,      0,  0x8F, 0xF5, 0x37, 0x00
vertex     66,     -9,     54,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     65,    -44,     10,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     67,     -9,    -36,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     70,     47,    -18,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     69,     47,     37,      0,      0,  0x7E, 0xFA, 0x01, 0x00

glabel mario_medium_poly_left_leg_shared_dl # 0x04015848 - 0x040158D8
gsSPVertex mario_medium_poly_left_leg_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  4, 0x0
gsSP2Triangles  3,  4,  5, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  0,  7,  1, 0x0,  0,  8,  7, 0x0
gsSP2Triangles  7,  8,  6, 0x0,  5,  6,  3, 0x0
gsSP2Triangles  3,  9,  2, 0x0,  2,  9,  0, 0x0
gsSP2Triangles 10, 11, 12, 0x0,  8,  0,  9, 0x0
gsSP2Triangles  9,  6,  8, 0x0,  9,  3,  6, 0x0
gsSP2Triangles 12, 13, 10, 0x0, 13, 14, 10, 0x0
gsSPEndDisplayList

mario_medium_poly_left_foot_shared_dl_vertex_group1: # 0x040158D8
vertex    108,     10,     36,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    108,      9,    -20,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     75,     21,    -41,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     76,     22,     61,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -14,     55,    -27,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -13,     55,     49,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -41,     65,      9,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     41,    -18,     54,      0,      0,  0x04, 0xB4, 0x65, 0x00
vertex     76,     22,     61,      0,      0,  0x12, 0xDD, 0x78, 0x00
vertex    -13,     55,     49,      0,      0,  0xCE, 0x07, 0x74, 0x00
vertex     42,    -11,    -33,      0,      0,  0xFF, 0xB8, 0x98, 0x00
vertex    -37,     12,    -16,      0,      0,  0xA1, 0xCF, 0xBD, 0x00
vertex    -14,     55,    -27,      0,      0,  0xCC, 0x02, 0x8D, 0x00
vertex    -36,     13,     39,      0,      0,  0xA0, 0xD0, 0x42, 0x00
vertex     75,     21,    -41,      0,      0,  0x09, 0xDA, 0x88, 0x00
vertex    108,      9,    -20,      0,      0,  0x44, 0xAD, 0xBE, 0x00

mario_medium_poly_left_foot_shared_dl_vertex_group2: # 0x040159D8
vertex     78,    -30,      7,      0,      0,  0x34, 0x8D, 0xFB, 0x00
vertex    108,      9,    -20,      0,      0,  0x44, 0xAD, 0xBE, 0x00
vertex    108,     10,     36,      0,      0,  0x4C, 0xAF, 0x3C, 0x00
vertex     42,    -11,    -33,      0,      0,  0xFF, 0xB8, 0x98, 0x00
vertex     76,     22,     61,      0,      0,  0x12, 0xDD, 0x78, 0x00
vertex     41,    -18,     54,      0,      0,  0x04, 0xB4, 0x65, 0x00
vertex    -36,     13,     39,      0,      0,  0xA0, 0xD0, 0x42, 0x00
vertex    -13,     55,     49,      0,      0,  0xCE, 0x07, 0x74, 0x00
vertex    -41,     65,      9,      0,      0,  0x83, 0x15, 0x00, 0x00
vertex    -14,     55,    -27,      0,      0,  0xCC, 0x02, 0x8D, 0x00
vertex    -37,     12,    -16,      0,      0,  0xA1, 0xCF, 0xBD, 0x00
vertex     25,    -34,     11,      0,      0,  0xDD, 0x87, 0xFB, 0x00

glabel mario_medium_poly_left_foot_shared_dl # 0x04015A98 - 0x04015B60
gsSPVertex mario_medium_poly_left_foot_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  3,  2,  4, 0x0,  5,  3,  4, 0x0
gsSP2Triangles  6,  5,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13,  7,  9, 0x0
gsSP2Triangles 10, 12, 14, 0x0, 10, 14, 15, 0x0
gsSPVertex mario_medium_poly_left_foot_shared_dl_vertex_group2, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  2,  4,  5, 0x0,  5,  0,  2, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  9, 10, 0x0
gsSP2Triangles 11,  3,  0, 0x0, 10,  3, 11, 0x0
gsSP2Triangles  0,  5, 11, 0x0, 11,  5,  6, 0x0
gsSP2Triangles 11,  6, 10, 0x0,  6,  8, 10, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_left_foot # 0x04015B60 - 0x04015B80
gsSPLight mario_diff_light_group4, 1
gsSPLight mario_amb_light_group4, 2
gsSPDisplayList mario_medium_poly_left_foot_shared_dl
gsSPEndDisplayList

mario_medium_poly_right_thigh_shared_dl_vertex: # 0x04015B80
vertex     18,    -11,    -58,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     23,    -52,     -9,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     20,    -14,     41,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     97,     -3,     30,      0,      0,  0x69, 0xF1, 0x45, 0x00
vertex     99,    -33,    -10,      0,      0,  0x40, 0x93, 0xFC, 0x00
vertex     95,     -1,    -49,      0,      0,  0x71, 0xFB, 0xC7, 0x00
vertex     18,    -11,    -58,      0,      0,  0x12, 0xE0, 0x87, 0x00
vertex     91,     49,    -33,      0,      0,  0x34, 0x4E, 0xAB, 0x00
vertex     92,     48,     16,      0,      0,  0x47, 0x55, 0x3D, 0x00
vertex     13,     52,    -37,      0,      0,  0x06, 0x76, 0xD3, 0x00
vertex     20,    -14,     41,      0,      0,  0x16, 0xD9, 0x76, 0x00
vertex     23,    -52,     -9,      0,      0,  0x1D, 0x85, 0xFD, 0x00
vertex     14,     50,     24,      0,      0,  0x0A, 0x63, 0x4D, 0x00
vertex     13,     52,    -37,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     14,     50,     24,      0,      0,  0x82, 0xF5, 0x02, 0x00

glabel mario_medium_poly_right_thigh_shared_dl # 0x04015C70 - 0x04015D00
gsSPVertex mario_medium_poly_right_thigh_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  5,  4, 0x0,  7,  5,  6, 0x0
gsSP2Triangles  8,  7,  9, 0x0, 10,  3,  8, 0x0
gsSP2Triangles  4,  3, 10, 0x0,  4, 10, 11, 0x0
gsSP2Triangles  8, 12, 10, 0x0,  8,  9, 12, 0x0
gsSP2Triangles  7,  6,  9, 0x0,  4, 11,  6, 0x0
gsSP2Triangles  5,  8,  3, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  2, 13,  0, 0x0,  2, 14, 13, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_right_thigh # 0x04015D00 - 0x04015D20
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_medium_poly_right_thigh_shared_dl
gsSPEndDisplayList

mario_medium_poly_right_leg_shared_dl_vertex: # 0x04015D20
vertex      6,     -1,    -50,      0,      0,  0x8E, 0xF7, 0xCA, 0x00
vertex      5,    -34,    -11,      0,      0,  0xC9, 0x8E, 0xFE, 0x00
vertex      7,     -4,     30,      0,      0,  0x9B, 0xED, 0x4A, 0x00
vertex     67,     -9,     34,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     64,    -43,    -12,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     66,     -7,    -56,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     66,     -7,    -56,      0,      0,  0xF1, 0xDE, 0x87, 0x00
vertex     10,     48,    -33,      0,      0,  0xD6, 0x63, 0xBE, 0x00
vertex     10,     46,     16,      0,      0,  0xB1, 0x3F, 0x4B, 0x00
vertex     71,     47,     18,      0,      0,  0xFD, 0x73, 0x33, 0x00
vertex     67,     -9,     34,      0,      0,  0xF4, 0xD8, 0x77, 0x00
vertex     64,    -43,    -12,      0,      0,  0xEC, 0x83, 0xFD, 0x00
vertex     70,     49,    -37,      0,      0,  0xFA, 0x67, 0xB8, 0x00
vertex     71,     47,     18,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     70,     49,    -37,      0,      0,  0x7E, 0xF9, 0xFE, 0x00

glabel mario_medium_poly_right_leg_shared_dl # 0x04015E10 - 0x04015EA0
gsSPVertex mario_medium_poly_right_leg_shared_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  1,  0,  6, 0x0,  6,  0,  7, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  8,  2, 10, 0x0
gsSP2Triangles 10,  2,  1, 0x0, 11, 10,  1, 0x0
gsSP2Triangles 10,  9,  8, 0x0,  9, 12,  7, 0x0
gsSP2Triangles 12,  6,  7, 0x0,  6, 11,  1, 0x0
gsSP2Triangles  5, 13,  3, 0x0,  5, 14, 13, 0x0
gsSP2Triangles  2,  8,  0, 0x0,  8,  7,  0, 0x0
gsSPEndDisplayList

mario_medium_poly_right_foot_dl_vertex_group1: # 0x04015EA0
vertex    -38,     12,     14,      0,      0,  0xA1, 0xCF, 0x43, 0x00
vertex    -43,     65,    -12,      0,      0,  0x83, 0x13, 0xFF, 0x00
vertex    -36,     12,    -41,      0,      0,  0xA1, 0xCE, 0xBE, 0x00
vertex     25,    -34,    -11,      0,      0,  0xDF, 0x86, 0x07, 0x00
vertex     41,    -18,    -55,      0,      0,  0x07, 0xB3, 0x9C, 0x00
vertex     79,    -29,     -7,      0,      0,  0x36, 0x8E, 0x08, 0x00
vertex     42,    -10,     32,      0,      0,  0xFF, 0xBA, 0x69, 0x00
vertex    -15,     55,     24,      0,      0,  0xCB, 0x04, 0x73, 0x00
vertex    -14,     54,    -51,      0,      0,  0xCF, 0x04, 0x8C, 0x00
vertex    108,     11,    -36,      0,      0,  0x4E, 0xB0, 0xC6, 0x00
vertex     76,     23,    -62,      0,      0,  0x14, 0xDB, 0x89, 0x00
vertex    107,     12,     20,      0,      0,  0x45, 0xAF, 0x44, 0x00
vertex     74,     24,     40,      0,      0,  0x08, 0xDC, 0x79, 0x00
vertex    -15,     55,     24,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -14,     54,    -51,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -43,     65,    -12,      0,      0,  0x29, 0x77, 0x00, 0x00

mario_medium_poly_right_foot_dl_vertex_group2: # 0x04015FA0
vertex    -15,     55,     24,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex     76,     23,    -62,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -14,     54,    -51,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex     74,     24,     40,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    108,     11,    -36,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    107,     12,     20,      0,      0,  0x29, 0x77, 0x00, 0x00

glabel mario_medium_poly_right_foot_dl # 0x04016000 - 0x040160C8
gsSPVertex mario_medium_poly_right_foot_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  0, 0x0,  5,  6,  3, 0x0
gsSP2Triangles  0,  7,  1, 0x0,  1,  8,  2, 0x0
gsSP2Triangles  9,  5,  4, 0x0,  4, 10,  9, 0x0
gsSP2Triangles  6,  5, 11, 0x0,  9, 11,  5, 0x0
gsSP2Triangles 11, 12,  6, 0x0, 12,  7,  6, 0x0
gsSP2Triangles  8,  4,  2, 0x0,  7,  0,  6, 0x0
gsSP2Triangles  8, 10,  4, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_medium_poly_right_foot_dl_vertex_group2, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  3,  4,  1, 0x0,  3,  5,  4, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_right_foot # 0x040160C8 - 0x04016108
gsSPLight mario_diff_light_group4, 1
gsSPLight mario_amb_light_group4, 2
gsSPDisplayList mario_medium_poly_right_foot_dl
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetAlphaCompare G_AC_NONE
gsSPEndDisplayList

glabel mario_metal_medium_poly_right_foot # 0x04016108 - 0x04016148
gsSPDisplayList mario_medium_poly_right_foot_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetAlphaCompare G_AC_NONE
gsSPEndDisplayList

mario_seg4_vertex_04016148: # 0x04016148
vertex     75,     24,    -60,    -74,   -930,  0x60, 0x27, 0xB8, 0xFF
vertex     36,     47,    -76,   -174,    168,  0x2E, 0x36, 0x98, 0xFF
vertex     44,     78,    -35,    988,     92,  0x45, 0x65, 0xE2, 0xFF
vertex    -26,     49,    -87,   -538,   1590,  0xC4, 0x29, 0x99, 0xFF
vertex      1,     87,    -53,    638,   1164,  0x0E, 0x74, 0xD1, 0xFF
vertex      1,     87,     54,   2522,    702,  0x11, 0x74, 0x2F, 0xFF
vertex      1,     87,     54,    272,   1122,  0x11, 0x74, 0x2F, 0xFF
vertex     44,     78,     37,    -92,    108,  0x47, 0x5F, 0x2A, 0xFF
vertex     44,     78,    -35,  -1398,   -128,  0x45, 0x65, 0xE2, 0xFF
vertex    -26,     49,     88,   1514,   1490,  0xC4, 0x29, 0x67, 0xFF
vertex     36,     47,     77,   1110,    130,  0x2F, 0x37, 0x68, 0xFF
vertex     75,     24,     60,    968,   -926,  0x62, 0x27, 0x46, 0xFF

mario_seg4_vertex_04016208: # 0x04016208
vertex     82,     37,     28,      0,      0,  0x71, 0x36, 0x0E, 0xFF
vertex     82,     37,    -28,      0,      0,  0x71, 0x35, 0xEA, 0xFF
vertex     44,     78,    -35,      0,      0,  0x45, 0x65, 0xE2, 0xFF
vertex     44,     78,     37,      0,      0,  0x47, 0x5F, 0x2A, 0xFF
vertex     95,    -39,    -25,      0,      0,  0x79, 0xE6, 0xE8, 0xFF
vertex     95,    -39,     25,      0,      0,  0x75, 0xDB, 0x1D, 0xFF
vertex     54,    -68,      0,      0,      0,  0x2D, 0x8A, 0x00, 0xFF
vertex     56,     -4,     79,      0,      0,  0x39, 0x04, 0x71, 0xFF
vertex     75,     24,     60,      0,      0,  0x62, 0x27, 0x46, 0xFF
vertex     36,     47,     77,      0,      0,  0x2F, 0x37, 0x68, 0xFF
vertex      9,      0,     94,      0,      0,  0x0E, 0x03, 0x7E, 0xFF
vertex     22,    -41,     87,      0,      0,  0x1F, 0xC9, 0x6D, 0xFF
vertex     83,    -29,     58,      0,      0,  0x54, 0xC8, 0x4C, 0xFF
vertex     83,    -29,    -58,      0,      0,  0x52, 0xC9, 0xB2, 0xFF
vertex     40,    -66,    -47,      0,      0,  0x1D, 0x91, 0xCB, 0xFF
vertex     22,    -41,    -86,      0,      0,  0x1E, 0xCA, 0x92, 0xFF

mario_seg4_vertex_04016308: # 0x04016308
vertex     36,     47,    -76,      0,      0,  0x2E, 0x36, 0x98, 0xFF
vertex     75,     24,    -60,      0,      0,  0x60, 0x27, 0xB8, 0xFF
vertex     56,     -4,    -77,      0,      0,  0x38, 0x04, 0x8F, 0xFF
vertex      9,      0,    -93,      0,      0,  0x0E, 0x03, 0x82, 0xFF
vertex     83,    -29,    -58,      0,      0,  0x52, 0xC9, 0xB2, 0xFF
vertex     22,    -41,    -86,      0,      0,  0x1E, 0xCA, 0x92, 0xFF
vertex     22,    -41,     87,      0,      0,  0x1F, 0xC9, 0x6D, 0xFF
vertex     40,    -66,     48,      0,      0,  0x1D, 0x91, 0x35, 0xFF
vertex     83,    -29,     58,      0,      0,  0x54, 0xC8, 0x4C, 0xFF

mario_seg4_vertex_04016398: # 0x04016398
vertex     83,    -29,    -58,      0,      0,  0x52, 0xC9, 0xB2, 0xFF
vertex     95,    -39,    -25,      0,      0,  0x79, 0xE6, 0xE8, 0xFF
vertex     54,    -68,      0,      0,      0,  0x2D, 0x8A, 0x00, 0xFF
vertex     75,     24,    -60,      0,      0,  0x60, 0x27, 0xB8, 0xFF
vertex     82,     37,    -28,      0,      0,  0x71, 0x35, 0xEA, 0xFF
vertex     40,    -66,    -47,      0,      0,  0x1D, 0x91, 0xCB, 0xFF
vertex     44,     78,    -35,      0,      0,  0x45, 0x65, 0xE2, 0xFF
vertex     75,     24,     60,      0,      0,  0x62, 0x27, 0x46, 0xFF
vertex     82,     37,     28,      0,      0,  0x71, 0x36, 0x0E, 0xFF
vertex     44,     78,     37,      0,      0,  0x47, 0x5F, 0x2A, 0xFF
vertex     83,    -29,     58,      0,      0,  0x54, 0xC8, 0x4C, 0xFF
vertex     95,    -39,     25,      0,      0,  0x75, 0xDB, 0x1D, 0xFF
vertex     40,    -66,     48,      0,      0,  0x1D, 0x91, 0x35, 0xFF
vertex      1,     87,    -53,      0,      0,  0x0E, 0x74, 0xD1, 0xFF
vertex    -30,     88,     42,      0,      0,  0xD3, 0x72, 0x1F, 0xFF
vertex      1,     87,     54,      0,      0,  0x11, 0x74, 0x2F, 0xFF

mario_seg4_vertex_04016498: # 0x04016498
vertex      1,     87,    -53,      0,      0,  0x0E, 0x74, 0xD1, 0xFF
vertex    -30,     88,    -41,      0,      0,  0xC7, 0x6A, 0xDA, 0xFF
vertex    -30,     88,     42,      0,      0,  0xD3, 0x72, 0x1F, 0xFF
vertex    -26,     49,    -87,      0,      0,  0xC4, 0x29, 0x99, 0xFF
vertex    -71,     56,      0,      0,      0,  0x89, 0x2B, 0x00, 0xFF
vertex    -26,     49,     88,      0,      0,  0xC4, 0x29, 0x67, 0xFF
vertex      1,     87,     54,      0,      0,  0x11, 0x74, 0x2F, 0xFF
vertex    -59,    -44,      0,      0,      0,  0x88, 0xD8, 0x00, 0xFF
vertex    -26,    -72,    -38,      0,      0,  0xDA, 0x8B, 0xE5, 0xFF
vertex    -26,    -72,     39,      0,      0,  0xDA, 0x8B, 0x1B, 0xFF
vertex    -26,    -41,     85,      0,      0,  0xCC, 0xC2, 0x61, 0xFF
vertex    -26,    -41,    -84,      0,      0,  0xCC, 0xC2, 0x9F, 0xFF
vertex     40,    -66,     48,      0,      0,  0x1D, 0x91, 0x35, 0xFF
vertex     22,    -41,     87,      0,      0,  0x1F, 0xC9, 0x6D, 0xFF
vertex      9,      0,     94,      0,      0,  0x0E, 0x03, 0x7E, 0xFF
vertex     54,    -68,      0,      0,      0,  0x2D, 0x8A, 0x00, 0xFF

mario_seg4_vertex_04016598: # 0x04016598
vertex    -26,     49,     88,      0,      0,  0xC4, 0x29, 0x67, 0xFF
vertex      9,      0,     94,      0,      0,  0x0E, 0x03, 0x7E, 0xFF
vertex     36,     47,     77,      0,      0,  0x2F, 0x37, 0x68, 0xFF
vertex      9,      0,    -93,      0,      0,  0x0E, 0x03, 0x82, 0xFF
vertex    -26,     49,    -87,      0,      0,  0xC4, 0x29, 0x99, 0xFF
vertex     36,     47,    -76,      0,      0,  0x2E, 0x36, 0x98, 0xFF
vertex    -26,    -41,    -84,      0,      0,  0xCC, 0xC2, 0x9F, 0xFF
vertex     22,    -41,    -86,      0,      0,  0x1E, 0xCA, 0x92, 0xFF
vertex     40,    -66,    -47,      0,      0,  0x1D, 0x91, 0xCB, 0xFF
vertex    -26,    -72,    -38,      0,      0,  0xDA, 0x8B, 0xE5, 0xFF
vertex     54,    -68,      0,      0,      0,  0x2D, 0x8A, 0x00, 0xFF
vertex    -26,    -72,     39,      0,      0,  0xDA, 0x8B, 0x1B, 0xFF
vertex     40,    -66,     48,      0,      0,  0x1D, 0x91, 0x35, 0xFF

glabel mario_medium_poly_yellow_button_dl # 0x04016668 - 0x040166B8
gsSPVertex mario_seg4_vertex_04016148, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  4,  5,  2, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  6, 0x0
gsSP2Triangles  6, 10,  7, 0x0,  7, 10, 11, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_pants_overalls_shared_dl # 0x040166B8 - 0x04016800
gsSPVertex mario_seg4_vertex_04016398, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  3,  4,  1, 0x0,  2,  5,  0, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10, 11, 0x0,  8,  7, 11, 0x0
gsSP2Triangles 11, 10,  2, 0x0, 10, 12,  2, 0x0
gsSP1Triangle 13, 14, 15, 0x0
gsSPVertex mario_seg4_vertex_04016498, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  2,  4, 0x0,  6,  2,  5, 0x0
gsSP2Triangles  4,  3,  7, 0x0,  8,  9,  7, 0x0
gsSP2Triangles  5,  4,  7, 0x0,  9, 10,  7, 0x0
gsSP2Triangles 11,  8,  7, 0x0,  3, 11,  7, 0x0
gsSP2Triangles  7, 10,  5, 0x0, 10,  9, 12, 0x0
gsSP2Triangles 10, 13, 14, 0x0, 12, 13, 10, 0x0
gsSP2Triangles  5, 10, 14, 0x0,  9,  8, 15, 0x0
gsSPVertex mario_seg4_vertex_04016598, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  4,  3, 0x0,  6,  3,  7, 0x0
gsSP2Triangles  8,  9,  6, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9,  8, 10, 0x0, 11, 10, 12, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_tshirt_shared_dl # 0x04016800 - 0x040168A0
gsSPVertex mario_seg4_vertex_04016208, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  1,  0,  4, 0x0,  0,  5,  4, 0x0
gsSP2Triangles  6,  4,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  9, 10,  7, 0x0,  7, 10, 11, 0x0
gsSP2Triangles  7, 12,  8, 0x0, 11, 12,  7, 0x0
gsSP1Triangle 13, 14, 15, 0x0
gsSPVertex mario_seg4_vertex_04016308, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  5,  3,  2, 0x0,  6,  7,  8, 0x0
gsSPEndDisplayList

glabel mario_medium_poly_torso_dl # 0x040168A0 - 0x040168C8
gsSPDisplayList mario_medium_poly_pants_overalls_shared_dl
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_medium_poly_tshirt_shared_dl
gsSPEndDisplayList

glabel mario_medium_poly_torso # 0x040168C8 - 0x04016948
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_yellow_button
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_medium_poly_yellow_button_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_medium_poly_torso_dl
gsSPEndDisplayList

glabel mario_metal_medium_poly_torso # 0x04016948 - 0x04016968
gsSPDisplayList mario_medium_poly_yellow_button_dl
gsSPDisplayList mario_medium_poly_pants_overalls_shared_dl
gsSPDisplayList mario_medium_poly_tshirt_shared_dl
gsSPEndDisplayList

mario_low_poly_butt_dl_vertex: # 0x04016968
vertex    -37,    -37,      0,      0,      0,  0x82, 0xF5, 0x00, 0x00
vertex     -2,     52,     92,      0,      0,  0xB1, 0x3C, 0x4E, 0x00
vertex    -35,     55,      0,      0,      0,  0x97, 0x45, 0x00, 0x00
vertex     -7,    -86,     85,      0,      0,  0xBF, 0xC4, 0x5A, 0x00
vertex     49,     46,     96,      0,      0,  0x4B, 0x1D, 0x61, 0x00
vertex     -7,    -86,    -85,      0,      0,  0xCF, 0xAA, 0xB2, 0x00
vertex     -2,     52,    -92,      0,      0,  0xB0, 0x3B, 0xB2, 0x00
vertex     48,     44,    -98,      0,      0,  0x29, 0x22, 0x8E, 0x00
vertex     46,    -71,    -89,      0,      0,  0x73, 0xD9, 0xDD, 0x00
vertex     46,    -71,     89,      0,      0,  0x44, 0xA1, 0x2F, 0x00
vertex     49,     96,      0,      0,      0,  0x2B, 0x77, 0x00, 0x00

glabel mario_low_poly_butt_dl # 0x04016A18 - 0x04016AB8
gsSPVertex mario_low_poly_butt_dl_vertex, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  0,  2,  6, 0x0
gsSP2Triangles  6,  5,  0, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  7,  8,  5, 0x0,  3,  9,  4, 0x0
gsSP2Triangles  8,  7, 10, 0x0,  4,  9,  8, 0x0
gsSP2Triangles  5,  9,  3, 0x0,  3,  0,  5, 0x0
gsSP2Triangles  5,  8,  9, 0x0, 10,  7,  6, 0x0
gsSP2Triangles 10,  4,  8, 0x0,  2,  1, 10, 0x0
gsSP2Triangles  6,  2, 10, 0x0,  1,  4, 10, 0x0
gsSPEndDisplayList

glabel mario_low_poly_butt # 0x04016AB8 - 0x04016AE8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_low_poly_butt_dl
gsSPEndDisplayList

glabel mario_metal_low_poly_butt # 0x04016AE8 - 0x04016B60
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_low_poly_butt_dl
gsSPEndDisplayList

mario_low_poly_left_arm_shared_dl_vertex: # 0x04016B60
vertex     -6,     28,     10,      0,      0,  0x09, 0x65, 0xB5, 0x00
vertex     72,     21,      8,      0,      0,  0x44, 0x4D, 0x48, 0x00
vertex     71,    -11,    -34,      0,      0,  0x3F, 0x57, 0xBE, 0x00
vertex     -8,    -30,     31,      0,      0,  0x09, 0x26, 0x78, 0x00
vertex     71,    -30,     23,      0,      0,  0x5E, 0x15, 0x51, 0x00
vertex     -6,     28,     10,      0,      0,  0x07, 0x29, 0x77, 0x00
vertex     -8,     -7,    -41,      0,      0,  0x0B, 0x67, 0xB8, 0x00
vertex     -8,    -30,     31,      0,      0,  0xA4, 0xAD, 0xE5, 0x00
vertex     -6,     28,     10,      0,      0,  0x81, 0x02, 0x00, 0x00
vertex     -8,     -7,    -41,      0,      0,  0xA4, 0xAD, 0xE5, 0x00
vertex     71,    -11,    -34,      0,      0,  0xFD, 0x88, 0xD9, 0x00
vertex     71,    -30,     23,      0,      0,  0xFD, 0x88, 0xD9, 0x00

glabel mario_low_poly_left_arm_shared_dl # 0x04016C20 - 0x04016C70
gsSPVertex mario_low_poly_left_arm_shared_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  3,  1, 0x0,  6,  0,  2, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  2,  1,  4, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  7, 10, 11, 0x0
gsSPEndDisplayList

glabel mario_low_poly_left_arm # 0x04016C70 - 0x04016C90
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_low_poly_left_arm_shared_dl
gsSPEndDisplayList

mario_low_poly_left_forearm_shared_dl_vertex: # 0x04016C90
vertex     -5,     20,      6,      0,      0,  0x05, 0x62, 0xB0, 0x00
vertex     67,     16,      5,      0,      0,  0x43, 0x4B, 0x4C, 0x00
vertex     67,    -14,    -31,      0,      0,  0x3C, 0x55, 0xBA, 0x00
vertex     -5,    -30,     21,      0,      0,  0x05, 0x20, 0x7A, 0x00
vertex     67,    -30,     17,      0,      0,  0x5C, 0x14, 0x54, 0x00
vertex     -5,     20,      6,      0,      0,  0x04, 0x22, 0x7A, 0x00
vertex     -5,    -12,    -35,      0,      0,  0x07, 0x63, 0xB2, 0x00
vertex     -5,    -30,     21,      0,      0,  0xA5, 0xAD, 0xE5, 0x00
vertex     -5,     20,      6,      0,      0,  0x81, 0x01, 0x00, 0x00
vertex     -5,    -12,    -35,      0,      0,  0xA5, 0xAD, 0xE5, 0x00
vertex     67,    -30,     17,      0,      0,  0xFE, 0x88, 0xD9, 0x00
vertex     67,    -14,    -31,      0,      0,  0xFE, 0x88, 0xD9, 0x00

glabel mario_low_poly_left_forearm_shared_dl # 0x04016D50 - 0x04016DA0
gsSPVertex mario_low_poly_left_forearm_shared_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  3,  1, 0x0,  6,  0,  2, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  2,  1,  4, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 10,  9, 11, 0x0
gsSPEndDisplayList

mario_low_poly_left_hand_closed_shared_dl_vertex: # 0x04016DA0
vertex     -6,     34,    -25,      0,      0,  0xA0, 0x13, 0xB0, 0x00
vertex     -9,     39,     24,      0,      0,  0xB3, 0x43, 0x4A, 0x00
vertex     91,     80,    -34,      0,      0,  0x13, 0x7C, 0xEE, 0x00
vertex     90,     35,     33,      0,      0,  0x41, 0x14, 0x6B, 0x00
vertex     20,    -34,     21,      0,      0,  0xD4, 0x9A, 0x3C, 0x00
vertex    122,      4,    -45,      0,      0,  0x63, 0xBB, 0x25, 0x00
vertex    122,      4,    -45,      0,      0,  0xF2, 0x15, 0x84, 0x00
vertex     20,    -31,    -44,      0,      0,  0xCB, 0xAE, 0xB1, 0x00

glabel mario_low_poly_left_hand_closed_shared_dl # 0x04016E20 - 0x04016E80
gsSPVertex mario_low_poly_left_hand_closed_shared_dl_vertex, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  3, 0x0,  0,  6,  7, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  3,  1,  4, 0x0,  2,  3,  5, 0x0
gsSP2Triangles  0,  7,  4, 0x0,  4,  1,  0, 0x0
gsSPEndDisplayList

glabel mario_low_poly_left_hand_closed # 0x04016E80 - 0x04016EA0
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_low_poly_left_hand_closed_shared_dl
gsSPEndDisplayList

mario_low_poly_right_arm_shared_dl_vertex: # 0x04016EA0
vertex     65,     30,     23,      0,      0,  0x5E, 0xEB, 0x51, 0x00
vertex     66,    -21,      8,      0,      0,  0x45, 0xB3, 0x49, 0x00
vertex     65,     11,    -34,      0,      0,  0x40, 0xA9, 0xBF, 0x00
vertex    -10,      7,    -41,      0,      0,  0xA4, 0x52, 0xE5, 0x00
vertex     -9,    -28,     10,      0,      0,  0x81, 0xFE, 0x00, 0x00
vertex    -10,     30,     30,      0,      0,  0xA4, 0x52, 0xE5, 0x00
vertex     -9,    -28,     10,      0,      0,  0x09, 0x9A, 0xB6, 0x00
vertex    -10,      7,    -41,      0,      0,  0x0C, 0x99, 0xB8, 0x00
vertex    -10,     30,     30,      0,      0,  0x0A, 0xDB, 0x78, 0x00
vertex     -9,    -28,     10,      0,      0,  0x07, 0xD8, 0x78, 0x00
vertex     65,     30,     23,      0,      0,  0xFC, 0x78, 0xD9, 0x00
vertex     65,     11,    -34,      0,      0,  0xFC, 0x78, 0xD9, 0x00

glabel mario_low_poly_right_arm_shared_dl # 0x04016F60 - 0x04016FB0
gsSPVertex mario_low_poly_right_arm_shared_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  2,  6,  7, 0x0,  1,  8,  9, 0x0
gsSP2Triangles  1,  0,  8, 0x0,  2,  1,  6, 0x0
gsSP2Triangles  5, 10, 11, 0x0,  5, 11,  3, 0x0
gsSPEndDisplayList

glabel mario_low_poly_right_arm # 0x04016FB0 - 0x04016FD0
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_low_poly_right_arm_shared_dl
gsSPEndDisplayList

mario_low_poly_right_forearm_shared_dl_vertex: # 0x04016FD0
vertex    -13,     12,    -35,      0,      0,  0xA5, 0x53, 0xE5, 0x00
vertex    -13,    -20,      6,      0,      0,  0x81, 0xFF, 0x00, 0x00
vertex    -13,     30,     21,      0,      0,  0xA5, 0x53, 0xE5, 0x00
vertex     54,     14,    -31,      0,      0,  0x3D, 0xAA, 0xBA, 0x00
vertex    -13,    -20,      6,      0,      0,  0x05, 0x9E, 0xB1, 0x00
vertex    -13,     12,    -35,      0,      0,  0x07, 0x9C, 0xB3, 0x00
vertex     55,    -16,      5,      0,      0,  0x43, 0xB5, 0x4C, 0x00
vertex    -13,     30,     21,      0,      0,  0x05, 0xE0, 0x7A, 0x00
vertex    -13,    -20,      6,      0,      0,  0x04, 0xDE, 0x7A, 0x00
vertex     54,     30,     17,      0,      0,  0x5C, 0xED, 0x54, 0x00
vertex     54,     30,     17,      0,      0,  0xFE, 0x78, 0xD8, 0x00
vertex     54,     14,    -31,      0,      0,  0xFE, 0x78, 0xD8, 0x00

glabel mario_low_poly_right_forearm_shared_dl # 0x04017090 - 0x040170E0
gsSPVertex mario_low_poly_right_forearm_shared_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  2, 10, 11, 0x0
gsSP2Triangles  2, 11,  0, 0x0,  9,  6,  3, 0x0
gsSPEndDisplayList

mario_low_poly_right_hand_closed_dl_vertex: # 0x040170E0
vertex     85,    -38,    -32,      0,      0,  0x3D, 0xE3, 0x96, 0x00
vertex    -15,    -35,    -22,      0,      0,  0x99, 0xDC, 0xC1, 0x00
vertex     17,     37,    -22,      0,      0,  0xFE, 0x69, 0xB9, 0x00
vertex    116,    -10,     36,      0,      0,  0x66, 0x47, 0x16, 0x00
vertex     82,    -85,     44,      0,      0,  0x13, 0x8A, 0xD8, 0x00
vertex    -15,    -35,     43,      0,      0,  0x9D, 0xEC, 0x4C, 0x00
vertex     82,    -85,     44,      0,      0,  0x02, 0x15, 0x7D, 0x00
vertex     14,     30,     26,      0,      0,  0xCA, 0x50, 0x51, 0x00

glabel mario_low_poly_right_hand_closed_dl # 0x04017160 - 0x040171C0
gsSPVertex mario_low_poly_right_hand_closed_dl_vertex, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  0,  3, 0x0,  4,  5,  1, 0x0
gsSP2Triangles  6,  3,  7, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  3,  2,  7, 0x0
gsSP2Triangles  1,  5,  7, 0x0,  7,  2,  1, 0x0
gsSPEndDisplayList

glabel mario_low_poly_right_hand_closed # 0x040171C0 - 0x040171E0
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_low_poly_right_hand_closed_dl
gsSPEndDisplayList

glabel mario_metal_low_poly_right_hand_closed # 0x040171E0 - 0x04017210
gsSPDisplayList mario_low_poly_right_hand_closed_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsSPEndDisplayList

mario_low_poly_left_thigh_dl_vertex: # 0x04017210
vertex     10,     51,     45,      0,      0,  0x08, 0x73, 0x34, 0x00
vertex     17,    -44,     58,      0,      0,  0x0A, 0x11, 0x7D, 0x00
vertex     94,     48,     38,      0,      0,  0x38, 0x40, 0x5D, 0x00
vertex     11,     51,    -27,      0,      0,  0x0B, 0x5E, 0xAD, 0x00
vertex     95,     48,    -19,      0,      0,  0x4A, 0x4F, 0xBF, 0x00
vertex     18,    -45,    -38,      0,      0,  0x0C, 0x0F, 0x83, 0x00
vertex    101,    -28,    -28,      0,      0,  0x5B, 0xCA, 0xBC, 0x00
vertex    100,    -28,     48,      0,      0,  0x63, 0xBD, 0x29, 0x00
vertex     17,    -44,     58,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     10,     51,     45,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     18,    -45,    -38,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     11,     51,    -27,      0,      0,  0x82, 0xF7, 0xFF, 0x00
vertex     18,    -45,    -38,      0,      0,  0x18, 0x84, 0x01, 0x00
vertex     17,    -44,     58,      0,      0,  0x18, 0x84, 0x01, 0x00

glabel mario_low_poly_left_thigh_dl # 0x040172F0 - 0x04017360
gsSPVertex mario_low_poly_left_thigh_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  5,  3,  4, 0x0,  4,  6,  5, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  1,  7,  2, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSP2Triangles  6,  4,  7, 0x0,  4,  2,  7, 0x0
gsSP2Triangles 12,  7, 13, 0x0, 12,  6,  7, 0x0
gsSPEndDisplayList

glabel mario_low_poly_left_thigh # 0x04017360 - 0x04017390
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_low_poly_left_thigh_dl
gsSPEndDisplayList

glabel mario_metal_low_poly_left_thigh # 0x04017390 - 0x04017408
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_low_poly_left_thigh_dl
gsSPEndDisplayList

mario_low_poly_left_leg_shared_dl_vertex: # 0x04017408
vertex      7,     47,     38,      0,      0,  0xCF, 0x59, 0x4B, 0x00
vertex     70,    -39,     53,      0,      0,  0xF8, 0x10, 0x7D, 0x00
vertex     75,     52,     42,      0,      0,  0xF4, 0x5E, 0x53, 0x00
vertex     75,     52,    -23,      0,      0,  0xF5, 0x72, 0xCA, 0x00
vertex      7,     47,    -20,      0,      0,  0xAB, 0x34, 0xB2, 0x00
vertex     71,    -39,    -34,      0,      0,  0xFA, 0x0F, 0x83, 0x00
vertex      3,    -29,    -29,      0,      0,  0xBB, 0xA4, 0xCD, 0x00
vertex      2,    -29,     48,      0,      0,  0x92, 0xDB, 0x31, 0x00
vertex     71,    -39,    -34,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     75,     52,    -23,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     70,    -39,     53,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     75,     52,     42,      0,      0,  0x7E, 0xFA, 0x01, 0x00
vertex     71,    -39,    -34,      0,      0,  0xED, 0x83, 0x00, 0x00
vertex     70,    -39,     53,      0,      0,  0xED, 0x83, 0x00, 0x00

glabel mario_low_poly_left_leg_shared_dl # 0x040174E8 - 0x04017558
gsSPVertex mario_low_poly_left_leg_shared_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  5,  6,  4, 0x0
gsSP2Triangles  3,  4,  0, 0x0,  0,  7,  1, 0x0
gsSP2Triangles  7,  4,  6, 0x0,  7,  0,  4, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSP2Triangles  6, 12, 13, 0x0, 13,  7,  6, 0x0
gsSPEndDisplayList

mario_low_poly_left_foot_shared_dl_vertex: # 0x04017558
vertex    110,     11,     56,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    109,     10,    -33,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -50,     69,    -36,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex    -49,     70,     63,      0,      0,  0x2B, 0x77, 0xFF, 0x00
vertex     74,    -39,     51,      0,      0,  0x13, 0xB0, 0x60, 0x00
vertex    110,     11,     56,      0,      0,  0x5B, 0xBB, 0x36, 0x00
vertex    -49,     70,     63,      0,      0,  0x00, 0xF4, 0x7E, 0x00
vertex     73,    -40,    -25,      0,      0,  0x18, 0x96, 0xC0, 0x00
vertex    -56,     20,    -30,      0,      0,  0xA4, 0xC5, 0xC2, 0x00
vertex    -50,     69,    -36,      0,      0,  0xFE, 0xF0, 0x83, 0x00
vertex    -54,     20,     58,      0,      0,  0x99, 0xC2, 0x26, 0x00
vertex    109,     10,    -33,      0,      0,  0x44, 0xC2, 0xAA, 0x00
vertex    -50,     69,    -36,      0,      0,  0x82, 0x0E, 0x01, 0x00
vertex    -49,     70,     63,      0,      0,  0x82, 0x0E, 0x01, 0x00

glabel mario_low_poly_left_foot_shared_dl # 0x04017638 - 0x040176A8
gsSPVertex mario_low_poly_left_foot_shared_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  4,  6, 0x0,  7,  9, 11, 0x0
gsSP2Triangles 12, 10, 13, 0x0,  7, 10,  8, 0x0
gsSP2Triangles  7, 11,  5, 0x0,  5,  4,  7, 0x0
gsSP2Triangles  7,  4, 10, 0x0, 12,  8, 10, 0x0
gsSPEndDisplayList

glabel mario_low_poly_left_foot # 0x040176A8 - 0x040176C8
gsSPLight mario_diff_light_group4, 1
gsSPLight mario_amb_light_group4, 2
gsSPDisplayList mario_low_poly_left_foot_shared_dl
gsSPEndDisplayList

mario_low_poly_right_thigh_shared_dl_vertex: # 0x040176C8
vertex    102,    -25,    -48,      0,      0,  0x64, 0xBF, 0xD5, 0x00
vertex    103,    -27,     25,      0,      0,  0x5C, 0xC9, 0x42, 0x00
vertex     25,    -45,     35,      0,      0,  0x1B, 0x85, 0xFD, 0x00
vertex     24,    -42,    -56,      0,      0,  0x1B, 0x85, 0xFD, 0x00
vertex     95,     50,    -36,      0,      0,  0x37, 0x42, 0xA3, 0x00
vertex     96,     49,     18,      0,      0,  0x4A, 0x4E, 0x41, 0x00
vertex     25,    -45,     35,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     17,     51,     27,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     15,     53,    -42,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     24,    -42,    -56,      0,      0,  0x82, 0xF5, 0x02, 0x00
vertex     24,    -42,    -56,      0,      0,  0x09, 0x13, 0x83, 0x00
vertex     15,     53,    -42,      0,      0,  0x07, 0x74, 0xCE, 0x00
vertex     25,    -45,     35,      0,      0,  0x0D, 0x0C, 0x7D, 0x00
vertex     17,     51,     27,      0,      0,  0x0B, 0x5C, 0x55, 0x00

glabel mario_low_poly_right_thigh_shared_dl # 0x040177A8 - 0x04017818
gsSPVertex mario_low_poly_right_thigh_shared_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  0,  4,  5, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles  4,  0, 10, 0x0,  5,  4, 11, 0x0
gsSP2Triangles 12,  1,  5, 0x0,  5, 13, 12, 0x0
gsSP2Triangles  5, 11, 13, 0x0,  4, 10, 11, 0x0
gsSPEndDisplayList

glabel mario_low_poly_right_thigh # 0x04017818 - 0x04017838
gsSPLight mario_diff_light_group1, 1
gsSPLight mario_amb_light_group1, 2
gsSPDisplayList mario_low_poly_right_thigh_shared_dl
gsSPEndDisplayList

mario_low_poly_right_leg_shared_dl_vertex: # 0x04017838
vertex      2,    -29,     27,      0,      0,  0xBA, 0xA3, 0x31, 0x00
vertex      1,    -26,    -50,      0,      0,  0x91, 0xDD, 0xCF, 0x00
vertex     68,    -37,    -56,      0,      0,  0xEC, 0x83, 0xFD, 0x00
vertex     70,    -40,     30,      0,      0,  0xEC, 0x83, 0xFD, 0x00
vertex     68,    -37,    -56,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     74,     54,    -43,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     75,     52,     21,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex     70,    -40,     30,      0,      0,  0x7E, 0xF9, 0xFE, 0x00
vertex      6,     47,     19,      0,      0,  0xAD, 0x33, 0x50, 0x00
vertex      6,     49,    -38,      0,      0,  0xCF, 0x5B, 0xB7, 0x00
vertex     68,    -37,    -56,      0,      0,  0xF8, 0x13, 0x83, 0x00
vertex     75,     52,     21,      0,      0,  0xF7, 0x71, 0x38, 0x00
vertex     70,    -40,     30,      0,      0,  0xFB, 0x0C, 0x7E, 0x00
vertex     74,     54,    -43,      0,      0,  0xF4, 0x60, 0xAF, 0x00

glabel mario_low_poly_right_leg_shared_dl # 0x04017918 - 0x04017988
gsSPVertex mario_low_poly_right_leg_shared_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9,  1, 0x0,  0,  8,  1, 0x0
gsSP2Triangles 10,  1,  9, 0x0,  9,  8, 11, 0x0
gsSP2Triangles  8,  0, 12, 0x0, 12, 11,  8, 0x0
gsSP2Triangles 11, 13,  9, 0x0, 13, 10,  9, 0x0
gsSPEndDisplayList

mario_low_poly_right_foot_dl_vertex: # 0x04017988
vertex    -55,     19,    -59,      0,      0,  0x9A, 0xC0, 0xDA, 0x00
vertex    -57,     20,     28,      0,      0,  0xA4, 0xC5, 0x3E, 0x00
vertex    -52,     69,     34,      0,      0,  0x82, 0x0C, 0xFD, 0x00
vertex     73,    -38,    -50,      0,      0,  0x15, 0xAE, 0xA2, 0x00
vertex     71,    -37,     25,      0,      0,  0x19, 0x98, 0x42, 0x00
vertex    108,     12,    -55,      0,      0,  0x5C, 0xBC, 0xCC, 0x00
vertex    106,     13,     33,      0,      0,  0x44, 0xC5, 0x58, 0x00
vertex    -50,     68,    -65,      0,      0,  0x82, 0x0C, 0xFD, 0x00
vertex    -52,     69,     34,      0,      0,  0xFD, 0xF2, 0x7E, 0x00
vertex    -50,     68,    -65,      0,      0,  0x02, 0xF2, 0x82, 0x00
vertex    -52,     69,     34,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    108,     12,    -55,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    -50,     68,    -65,      0,      0,  0x29, 0x77, 0x00, 0x00
vertex    106,     13,     33,      0,      0,  0x29, 0x77, 0x00, 0x00

glabel mario_low_poly_right_foot_dl # 0x04017A68 - 0x04017AD8
gsSPVertex mario_low_poly_right_foot_dl_vertex, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  5,  6,  4, 0x0
gsSP2Triangles  1,  0,  4, 0x0,  7,  0,  2, 0x0
gsSP2Triangles  6,  8,  4, 0x0,  9,  3,  0, 0x0
gsSP2Triangles  8,  1,  4, 0x0,  9,  5,  3, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSPEndDisplayList

glabel mario_low_poly_right_foot # 0x04017AD8 - 0x04017B18
gsSPLight mario_diff_light_group4, 1
gsSPLight mario_amb_light_group4, 2
gsSPDisplayList mario_low_poly_right_foot_dl
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetAlphaCompare G_AC_NONE
gsSPEndDisplayList

glabel mario_metal_low_poly_right_foot # 0x04017B18 - 0x04017B58
gsSPDisplayList mario_low_poly_right_foot_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetAlphaCompare G_AC_NONE
gsSPEndDisplayList

mario_seg4_vertex_04017B58: # 0x04017B58
vertex    -28,     41,    -88,   -396,   1646,  0xB7, 0x31, 0xA5, 0xFF
vertex      0,     98,      0,   1968,    722,  0xF0, 0x7D, 0x00, 0xFF
vertex     35,     64,    -82,   -390,    132,  0x29, 0x4B, 0xA3, 0xFF
vertex     39,     90,      0,   1698,   -280,  0x4A, 0x67, 0x00, 0xFF
vertex    -28,     41,     89,   1610,   1512,  0xD1, 0x37, 0x67, 0xFF
vertex     35,     64,     83,   1070,    -68,  0x29, 0x4B, 0x5D, 0xFF
vertex      0,     98,      0,  -1064,    968,  0xF0, 0x7D, 0x00, 0xFF
vertex     39,     90,      0,  -1146,   -124,  0x4A, 0x67, 0x00, 0xFF

mario_seg4_vertex_04017BD8: # 0x04017BD8
vertex    -28,    -71,     81,      0,      0,  0x9A, 0xBD, 0x20, 0xFF
vertex    -28,     41,    -88,      0,      0,  0xB7, 0x31, 0xA5, 0xFF
vertex    -28,    -71,    -80,      0,      0,  0xB7, 0xB5, 0xBA, 0xFF
vertex     39,    -79,    -73,      0,      0,  0x27, 0xB3, 0xA4, 0xFF
vertex    -28,     41,     89,      0,      0,  0xD1, 0x37, 0x67, 0xFF
vertex    -28,     89,      0,      0,      0,  0x97, 0x46, 0x00, 0xFF
vertex     39,    -79,     74,      0,      0,  0x37, 0xBA, 0x59, 0xFF
vertex     35,     64,     83,      0,      0,  0x29, 0x4B, 0x5D, 0xFF
vertex      0,     98,      0,      0,      0,  0xF0, 0x7D, 0x00, 0xFF
vertex     35,     64,    -82,      0,      0,  0x29, 0x4B, 0xA3, 0xFF
vertex     89,    -45,    -42,      0,      0,  0x70, 0xD0, 0xDF, 0xFF
vertex     89,    -45,     43,      0,      0,  0x75, 0xE4, 0x28, 0xFF
vertex     74,     26,    -59,      0,      0,  0x61, 0x25, 0xB9, 0xFF
vertex     39,     90,      0,      0,      0,  0x4A, 0x67, 0x00, 0xFF
vertex     74,     26,     60,      0,      0,  0x61, 0x25, 0x47, 0xFF

mario_seg4_vertex_04017CC8: # 0x04017CC8
vertex     74,     26,     60,      0,      0,  0x61, 0x25, 0x47, 0xFF
vertex     87,     42,      0,      0,      0,  0x76, 0x2D, 0x00, 0xFF
vertex     39,     90,      0,      0,      0,  0x4A, 0x67, 0x00, 0xFF
vertex     39,    -79,    -73,      0,      0,  0x27, 0xB3, 0xA4, 0xFF
vertex     35,     64,    -82,      0,      0,  0x29, 0x4B, 0xA3, 0xFF
vertex     74,     26,    -59,      0,      0,  0x61, 0x25, 0xB9, 0xFF
vertex     89,    -45,    -42,      0,      0,  0x70, 0xD0, 0xDF, 0xFF
vertex     39,    -79,     74,      0,      0,  0x37, 0xBA, 0x59, 0xFF
vertex     89,    -45,     43,      0,      0,  0x75, 0xE4, 0x28, 0xFF
vertex     35,     64,     83,      0,      0,  0x29, 0x4B, 0x5D, 0xFF

glabel mario_low_poly_yellow_button_dl # 0x04017D68 - 0x04017D98
gsSPVertex mario_seg4_vertex_04017B58, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSPEndDisplayList

glabel mario_low_poly_pants_overalls_shared_dl # 0x04017D98 - 0x04017E20
gsSPVertex mario_seg4_vertex_04017BD8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  0,  4,  5, 0x0,  3,  6,  0, 0x0
gsSP2Triangles  4,  0,  6, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  7,  4,  6, 0x0,  5,  4,  8, 0x0
gsSP2Triangles  8,  1,  5, 0x0,  3,  1,  9, 0x0
gsSP2Triangles  3,  2,  1, 0x0,  6,  3, 10, 0x0
gsSP2Triangles 10, 11,  6, 0x0, 12,  9, 13, 0x0
gsSP1Triangle 13,  7, 14, 0x0
gsSPEndDisplayList

glabel mario_low_poly_tshirt_shared_dl # 0x04017E20 - 0x04017E78
gsSPVertex mario_seg4_vertex_04017CC8, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  3, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  6,  5,  1, 0x0,  7,  8,  0, 0x0
gsSP2Triangles  7,  0,  9, 0x0,  8,  6,  1, 0x0
gsSP1Triangle  1,  0,  8, 0x0
gsSPEndDisplayList

glabel mario_low_poly_torso_dl # 0x04017E78 - 0x04017EA0
gsSPDisplayList mario_low_poly_pants_overalls_shared_dl
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_low_poly_tshirt_shared_dl
gsSPEndDisplayList

glabel mario_low_poly_torso # 0x04017EA0 - 0x04017F20
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_yellow_button
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_yellow_button_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_torso_dl
gsSPEndDisplayList

glabel mario_metal_low_poly_torso # 0x04017F20 - 0x04017F40
gsSPDisplayList mario_low_poly_yellow_button_dl
gsSPDisplayList mario_low_poly_pants_overalls_shared_dl
gsSPDisplayList mario_low_poly_tshirt_shared_dl
gsSPEndDisplayList

mario_low_poly_mario_m_logo_dl_vertex: # 0x04017F40
vertex    272,     48,     53,    904,      0,  0x42, 0x51, 0x47, 0xFF
vertex    174,     79,     -9,    452,    816,  0x51, 0x61, 0xFA, 0xFF
vertex    146,     27,     92,   1238,    962,  0x03, 0x3A, 0x70, 0xFF
vertex    272,     48,    -52,     -2,      0,  0x62, 0x27, 0xBA, 0xFF
vertex    146,     27,    -91,   -334,    962,  0x03, 0x39, 0x8F, 0xFF

mario_low_poly_eyes_cap_on_dl_vertex: # 0x04017F90
vertex    146,     27,     92,   1316,    212,  0x03, 0x3A, 0x70, 0xFF
vertex    168,     79,      0,    458,     68,  0xD9, 0x78, 0x00, 0xFF
vertex     88,    101,     33,    762,    990,  0x38, 0x55, 0x4B, 0xFF
vertex     88,    101,    -32,    154,    990,  0x1E, 0x5D, 0xB1, 0xFF
vertex    146,     27,    -91,   -398,    212,  0x03, 0x39, 0x8F, 0xFF

mario_low_poly_mustache_cap_on_dl_vertex: # 0x04017FE0
vertex     88,    101,    -32,    398,    214,  0x1E, 0x5D, 0xB1, 0xFF
vertex    146,     27,    -91,   1408,   -550,  0x03, 0x39, 0x8F, 0xFF
vertex     34,     39,    -98,   1306,    732,  0xCD, 0x40, 0xA0, 0xFF
vertex     44,    113,      0,     10,    800,  0x9C, 0x4D, 0x00, 0xFF
vertex     -5,     58,      0,    300,   1456,  0x88, 0x28, 0x00, 0xFF
vertex     88,    101,     33,    294,    258,  0x38, 0x55, 0x4B, 0xFF
vertex     44,    113,      0,     34,    840,  0x9C, 0x4D, 0x00, 0xFF
vertex     34,     39,     99,   1314,    634,  0xCD, 0x40, 0x60, 0xFF
vertex    146,     27,     92,   1132,   -556,  0x03, 0x3A, 0x70, 0xFF
vertex     -5,     58,      0,    470,   1412,  0x88, 0x28, 0x00, 0xFF

mario_low_poly_face_cap_dl_vertex: # 0x04018080
vertex    272,     48,    -52,      0,      0,  0x62, 0x27, 0xBA, 0xFF
vertex    272,     48,     53,      0,      0,  0x42, 0x51, 0x47, 0xFF
vertex    149,    -87,    138,      0,      0,  0x43, 0xB6, 0x4D, 0xFF
vertex    146,     27,    -91,      0,      0,  0x03, 0x39, 0x8F, 0xFF
vertex    149,    -87,   -137,      0,      0,  0x33, 0xC2, 0x9F, 0xFF
vertex    146,     27,     92,      0,      0,  0x03, 0x3A, 0x70, 0xFF
vertex     58,   -114,     81,      0,      0,  0xBA, 0xAD, 0x40, 0xFF
vertex     98,   -165,      0,      0,      0,  0xFD, 0x82, 0x00, 0xFF
vertex     58,   -114,    -80,      0,      0,  0xBC, 0xB8, 0xB2, 0xFF
vertex    168,     79,      0,      0,      0,  0xD9, 0x78, 0x00, 0xFF
vertex    175,    154,      0,      0,      0,  0xE1, 0x6C, 0xC6, 0xFF
vertex    174,     79,     -9,      0,      0,  0x51, 0x61, 0xFA, 0xFF

mario_low_poly_face_part_cap_on_dl_vertex: # 0x04018140
vertex     94,    146,     33,      0,      0,  0xFF, 0x44, 0x6B, 0xFF
vertex     50,    153,      0,      0,      0,  0xAD, 0x5F, 0x00, 0xFF
vertex     44,    113,      0,      0,      0,  0x9C, 0x4D, 0x00, 0xFF
vertex     88,    101,     33,      0,      0,  0x38, 0x55, 0x4B, 0xFF
vertex     94,    146,    -32,      0,      0,  0x3B, 0x35, 0x9E, 0xFF
vertex     88,    101,    -32,      0,      0,  0x1E, 0x5D, 0xB1, 0xFF
vertex     34,     39,     99,      0,      0,  0xCD, 0x40, 0x60, 0xFF
vertex     -5,     58,      0,      0,      0,  0x88, 0x28, 0x00, 0xFF
vertex      7,    -85,     79,      0,      0,  0xAA, 0xDC, 0x54, 0xFF
vertex    146,     27,     92,      0,      0,  0x03, 0x3A, 0x70, 0xFF
vertex      7,    -85,    -78,      0,      0,  0xA9, 0xC7, 0xB9, 0xFF
vertex     34,     39,    -98,      0,      0,  0xCD, 0x40, 0xA0, 0xFF
vertex    146,     27,    -91,      0,      0,  0x03, 0x39, 0x8F, 0xFF

mario_low_poly_face_back_hair_cap_on_dl_vertex: # 0x04018210
vertex     58,   -114,     81,      0,      0,  0xBA, 0xAD, 0x40, 0xFF
vertex      7,    -85,     79,      0,      0,  0xAA, 0xDC, 0x54, 0xFF
vertex      7,    -85,    -78,      0,      0,  0xA9, 0xC7, 0xB9, 0xFF
vertex     58,   -114,    -80,      0,      0,  0xBC, 0xB8, 0xB2, 0xFF
vertex    146,     27,     92,      0,      0,  0x03, 0x3A, 0x70, 0xFF
vertex    146,     27,    -91,      0,      0,  0x03, 0x39, 0x8F, 0xFF

glabel mario_low_poly_mario_m_logo_dl # 0x04018270 - 0x04018298
gsSPVertex mario_low_poly_mario_m_logo_dl_vertex, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP1Triangle  3,  1,  0, 0x0
gsSPEndDisplayList

glabel mario_low_poly_eyes_cap_on_dl # 0x04018298 - 0x040182C0
gsSPVertex mario_low_poly_eyes_cap_on_dl_vertex, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  4, 0x0
gsSP1Triangle  3,  2,  1, 0x0
gsSPEndDisplayList

glabel mario_low_poly_mustache_cap_on_dl # 0x040182C0 - 0x04018300
gsSPVertex mario_low_poly_mustache_cap_on_dl_vertex, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  7,  8,  5, 0x0,  6,  9,  7, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_part_cap_on_dl # 0x04018300 - 0x04018370
gsSPVertex mario_low_poly_face_part_cap_on_dl_vertex, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  4,  1,  0, 0x0,  4,  0,  3, 0x0
gsSP2Triangles  5,  4,  3, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9,  6,  8, 0x0,  8,  7, 10, 0x0
gsSP2Triangles 10,  7, 11, 0x0, 10, 11, 12, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_cap_dl # 0x04018370 - 0x040183F0
gsSPVertex mario_low_poly_face_cap_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  4,  0,  2, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  6,  2,  5, 0x0,  6,  7,  2, 0x0
gsSP2Triangles  7,  4,  2, 0x0,  3,  4,  8, 0x0
gsSP2Triangles  4,  7,  8, 0x0,  9, 10,  3, 0x0
gsSP2Triangles 10, 11,  3, 0x0,  8,  7,  6, 0x0
gsSP2Triangles 10,  5, 11, 0x0, 10,  9,  5, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_back_hair_cap_on_dl # 0x040183F0 - 0x04018420
gsSPVertex mario_low_poly_face_back_hair_cap_on_dl_vertex, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  1,  0, 0x0,  3,  2,  5, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_cap_on_dl # 0x04018420 - 0x04018460
gsSPDisplayList mario_low_poly_face_part_cap_on_dl
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_low_poly_face_cap_dl
gsSPLight mario_diff_light_group6, 1
gsSPLight mario_amb_light_group6, 2
gsSPDisplayList mario_low_poly_face_back_hair_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_front # 0x04018460 - 0x04018530
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_front
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_half_closed # 0x04018530 - 0x04018600
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_half_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_closed # 0x04018600 - 0x040186D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_right # 0x040186D0 - 0x040187A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_right
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_left # 0x040187A0 - 0x04018870
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_left
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_up # 0x04018870 - 0x04018940
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_up
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_down # 0x04018940 - 0x04018A10
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_down
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_on_eyes_dead # 0x04018A10 - 0x04018AE0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_dead
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_on_dl
gsSPEndDisplayList

glabel mario_metal_low_poly_cap_on # 0x04018AE0 - 0x04018B18
gsSPDisplayList mario_low_poly_mario_m_logo_dl
gsSPDisplayList mario_low_poly_eyes_cap_on_dl
gsSPDisplayList mario_low_poly_mustache_cap_on_dl
gsSPDisplayList mario_low_poly_face_part_cap_on_dl
gsSPDisplayList mario_low_poly_face_cap_dl
gsSPDisplayList mario_low_poly_face_back_hair_cap_on_dl
gsSPEndDisplayList

mario_low_poly_mario_eyes_cap_off_dl_vertex: # 0x04018B18
vertex    146,     27,     92,   1316,    212,  0x16, 0x25, 0x77, 0xFF
vertex    168,     79,      0,    458,     68,  0x27, 0x78, 0x00, 0xFF
vertex     88,    101,     33,    762,    990,  0x38, 0x55, 0x4B, 0xFF
vertex     88,    101,    -32,    154,    990,  0x1E, 0x5D, 0xB1, 0xFF
vertex    146,     27,    -91,   -398,    212,  0x14, 0x26, 0x89, 0xFF

mario_low_poly_mustache_cap_off_dl_vertex: # 0x04018B68
vertex     34,     39,    -98,   1306,    732,  0xCD, 0x40, 0xA0, 0xFF
vertex     44,    113,      0,     10,    800,  0x9C, 0x4D, 0x00, 0xFF
vertex     88,    101,    -32,    398,    214,  0x1E, 0x5D, 0xB1, 0xFF
vertex     -5,     58,      0,    300,   1456,  0x88, 0x28, 0x00, 0xFF
vertex    146,     27,    -91,   1408,   -550,  0x14, 0x26, 0x89, 0xFF
vertex     88,    101,     33,    294,    258,  0x38, 0x55, 0x4B, 0xFF
vertex     44,    113,      0,     34,    840,  0x9C, 0x4D, 0x00, 0xFF
vertex     34,     39,     99,   1314,    634,  0xCD, 0x40, 0x60, 0xFF
vertex     -5,     58,      0,    470,   1412,  0x88, 0x28, 0x00, 0xFF
vertex    146,     27,     92,   1132,   -556,  0x16, 0x25, 0x77, 0xFF

mario_low_poly_face_part_cap_off_dl_vertex: # 0x04018C08
vertex     44,    113,      0,      0,      0,  0x9C, 0x4D, 0x00, 0xFF
vertex     94,    146,    -32,      0,      0,  0x3B, 0x35, 0x9E, 0xFF
vertex     88,    101,    -32,      0,      0,  0x1E, 0x5D, 0xB1, 0xFF
vertex     50,    153,      0,      0,      0,  0xAD, 0x5F, 0x00, 0xFF
vertex     88,    101,     33,      0,      0,  0x38, 0x55, 0x4B, 0xFF
vertex     94,    146,     33,      0,      0,  0xFF, 0x44, 0x6B, 0xFF
vertex    146,     27,     92,      0,      0,  0x16, 0x25, 0x77, 0xFF
vertex     34,     39,     99,      0,      0,  0xCD, 0x40, 0x60, 0xFF
vertex      7,    -85,     79,      0,      0,  0xAA, 0xDC, 0x54, 0xFF
vertex     -5,     58,      0,      0,      0,  0x88, 0x28, 0x00, 0xFF
vertex      7,    -85,    -78,      0,      0,  0xA9, 0xC7, 0xB9, 0xFF
vertex     34,     39,    -98,      0,      0,  0xCD, 0x40, 0xA0, 0xFF
vertex    146,     27,    -91,      0,      0,  0x14, 0x26, 0x89, 0xFF

mario_low_poly_face_hair_cap_off_dl_vertex: # 0x04018CD8
vertex     58,   -114,     81,      0,      0,  0xD3, 0x9B, 0x3D, 0xFF
vertex      7,    -85,     79,      0,      0,  0xAA, 0xDC, 0x54, 0xFF
vertex      7,    -85,    -78,      0,      0,  0xA9, 0xC7, 0xB9, 0xFF
vertex    146,     27,     92,      0,      0,  0x16, 0x25, 0x77, 0xFF
vertex    167,   -121,     77,      0,      0,  0x3C, 0xAD, 0x4A, 0xFF
vertex     58,   -114,    -80,      0,      0,  0xD8, 0xA3, 0xB5, 0xFF
vertex     90,   -136,      0,      0,      0,  0xF0, 0x83, 0x00, 0xFF
vertex    146,     27,    -91,      0,      0,  0x14, 0x26, 0x89, 0xFF
vertex    167,   -121,    -81,      0,      0,  0x3A, 0xAD, 0xB5, 0xFF
vertex    218,     48,    -52,      0,      0,  0x5F, 0x3B, 0xC6, 0xFF
vertex    168,     79,      0,      0,      0,  0x27, 0x78, 0x00, 0xFF
vertex    192,    -28,    -80,      0,      0,  0x55, 0xF7, 0xA3, 0xFF
vertex    223,    -38,     -1,      0,      0,  0x7B, 0xE2, 0x00, 0xFF
vertex    218,     48,     53,      0,      0,  0x60, 0x39, 0x3A, 0xFF
vertex    192,    -28,     78,      0,      0,  0x56, 0xF4, 0x5C, 0xFF

glabel mario_low_poly_mario_eyes_cap_off_dl # 0x04018DC8 - 0x04018DF0
gsSPVertex mario_low_poly_mario_eyes_cap_off_dl_vertex, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  4, 0x0
gsSP1Triangle  3,  2,  1, 0x0
gsSPEndDisplayList

glabel mario_low_poly_mustache_cap_off_dl # 0x04018DF0 - 0x04018E30
gsSPVertex mario_low_poly_mustache_cap_off_dl_vertex, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  2,  4,  0, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  6,  8,  7, 0x0,  7,  9,  5, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_part_cap_off_dl # 0x04018E30 - 0x04018EA0
gsSPVertex mario_low_poly_face_part_cap_off_dl_vertex, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  0, 0x0,  5,  3,  0, 0x0
gsSP2Triangles  1,  3,  5, 0x0,  2,  1,  4, 0x0
gsSP2Triangles  1,  5,  4, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  7,  9,  8, 0x0,  8,  9, 10, 0x0
gsSP2Triangles 10,  9, 11, 0x0, 10, 11, 12, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_hair_cap_off_dl # 0x04018EA0 - 0x04018F68
gsSPVertex mario_low_poly_face_hair_cap_off_dl_vertex, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  5,  6,  0, 0x0,  0,  6,  4, 0x0
gsSP2Triangles  5,  2,  7, 0x0,  7,  8,  5, 0x0
gsSP2Triangles  8,  6,  5, 0x0,  9,  7, 10, 0x0
gsSP2Triangles  7,  9, 11, 0x0,  7, 11,  8, 0x0
gsSP2Triangles  6,  8,  4, 0x0,  8, 11, 12, 0x0
gsSP2Triangles  4,  8, 12, 0x0, 11,  9, 12, 0x0
gsSP2Triangles 13, 14, 12, 0x0, 14,  4, 12, 0x0
gsSP2Triangles  4, 14,  3, 0x0, 13, 10,  3, 0x0
gsSP2Triangles 14, 13,  3, 0x0,  9, 10, 13, 0x0
gsSP1Triangle  9, 13, 12, 0x0
gsSPEndDisplayList

glabel mario_low_poly_face_cap_off_dl # 0x04018F68 - 0x04018F90
gsSPDisplayList mario_low_poly_face_part_cap_off_dl
gsSPLight mario_diff_light_group6, 1
gsSPLight mario_amb_light_group6, 2
gsSPDisplayList mario_low_poly_face_hair_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_front # 0x04018F90 - 0x04019040
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_front
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_half_closed # 0x04019040 - 0x040190F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_half_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_closed # 0x040190F0 - 0x040191A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_closed
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_right # 0x040191A0 - 0x04019250
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_right
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_left # 0x04019250 - 0x04019300
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_left
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_up # 0x04019300 - 0x040193B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_up
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_down # 0x040193B0 - 0x04019460
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_down
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_low_poly_cap_off_eyes_dead # 0x04019460 - 0x04019510
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_eyes_dead
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group5, 1
gsSPLight mario_amb_light_group5, 2
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_mustache
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_low_poly_face_cap_off_dl
gsSPEndDisplayList

glabel mario_metal_low_poly_cap_off # 0x04019510 - 0x04019538
gsSPDisplayList mario_low_poly_mario_eyes_cap_off_dl
gsSPDisplayList mario_low_poly_mustache_cap_off_dl
gsSPDisplayList mario_low_poly_face_part_cap_off_dl
gsSPDisplayList mario_low_poly_face_hair_cap_off_dl
gsSPEndDisplayList

mario_left_hand_open_shared_dl_vertex_group1: # 0x04019538
vertex    121,     73,    -21,      0,      0,  0x47, 0x60, 0x2B, 0x00
vertex     70,     89,    -20,      0,      0,  0xEC, 0x7C, 0xF6, 0x00
vertex     77,     41,     21,      0,      0,  0x1D, 0x2A, 0x74, 0x00
vertex    141,     34,     -7,      0,      0,  0x77, 0x0C, 0x29, 0x00
vertex     78,     59,    -34,      0,      0,  0xFE, 0x0B, 0x82, 0x00
vertex    119,     70,    -42,      0,      0,  0x3D, 0x44, 0xA9, 0x00
vertex    133,     28,    -40,      0,      0,  0x45, 0xC9, 0xA6, 0x00
vertex     83,    -17,     10,      0,      0,  0x4D, 0xBD, 0x4A, 0x00
vertex     26,    -32,      6,      0,      0,  0x34, 0xA6, 0x47, 0x00
vertex     45,    -34,     10,      0,      0,  0xFE, 0x9A, 0x4A, 0x00
vertex     26,     16,     28,      0,      0,  0xDA, 0x0C, 0x78, 0x00
vertex     41,    -37,    -36,      0,      0,  0xD8, 0x9B, 0xBF, 0x00
vertex     20,    -27,    -27,      0,      0,  0x09, 0xBF, 0x94, 0x00
vertex     25,     -1,    -44,      0,      0,  0xE4, 0xE0, 0x89, 0x00

mario_left_hand_open_shared_dl_vertex_group2: # 0x04019618
vertex     -3,     35,     -9,      0,      0,  0xCD, 0x72, 0x13, 0x00
vertex      6,     53,     -9,      0,      0,  0xAF, 0x61, 0x00, 0x00
vertex     11,     29,    -52,      0,      0,  0xBA, 0x2A, 0xA0, 0x00
vertex     26,     16,     28,      0,      0,  0xDA, 0x0C, 0x78, 0x00
vertex      1,    -33,    -23,      0,      0,  0x9C, 0xBB, 0xE0, 0x00
vertex      6,    -38,      7,      0,      0,  0xAE, 0xAB, 0x2B, 0x00
vertex     -6,     -3,     17,      0,      0,  0x90, 0xDA, 0x2D, 0x00
vertex      2,      3,     26,      0,      0,  0xF5, 0x17, 0x7C, 0x00
vertex     20,    -46,     12,      0,      0,  0x26, 0x9E, 0x45, 0x00
vertex     26,    -32,      6,      0,      0,  0x34, 0xA6, 0x47, 0x00
vertex    -17,     40,     -8,      0,      0,  0xBC, 0x68, 0x16, 0x00
vertex    -10,     14,    -43,      0,      0,  0xD3, 0x19, 0x8D, 0x00
vertex     20,    -27,    -27,      0,      0,  0x09, 0xBF, 0x94, 0x00
vertex     13,    -39,    -31,      0,      0,  0x18, 0x9A, 0xBA, 0x00
vertex    -20,     22,     -7,      0,      0,  0x83, 0x06, 0x14, 0x00
vertex     70,     89,    -20,      0,      0,  0xEC, 0x7C, 0xF6, 0x00

mario_left_hand_open_shared_dl_vertex_group3: # 0x04019718
vertex     45,    -34,     10,      0,      0,  0xFE, 0x9A, 0x4A, 0x00
vertex     83,    -17,     10,      0,      0,  0x4D, 0xBD, 0x4A, 0x00
vertex     26,     16,     28,      0,      0,  0xDA, 0x0C, 0x78, 0x00
vertex     89,    -47,    -37,      0,      0,  0x56, 0xAA, 0xDF, 0x00
vertex     76,    -18,    -48,      0,      0,  0x27, 0x0A, 0x88, 0x00
vertex     89,     -6,    -27,      0,      0,  0x5C, 0xF5, 0xAB, 0x00
vertex      6,     53,     -9,      0,      0,  0xAF, 0x61, 0x00, 0x00
vertex     26,     41,    -41,      0,      0,  0x05, 0x34, 0x8D, 0x00
vertex     11,     29,    -52,      0,      0,  0xBA, 0x2A, 0xA0, 0x00
vertex    141,     34,     -7,      0,      0,  0x77, 0x0C, 0x29, 0x00
vertex     77,     41,     21,      0,      0,  0x1D, 0x2A, 0x74, 0x00
vertex    133,     28,    -40,      0,      0,  0x45, 0xC9, 0xA6, 0x00
vertex     69,     10,    -36,      0,      0,  0x35, 0x1C, 0x91, 0x00
vertex     78,     59,    -34,      0,      0,  0xFE, 0x0B, 0x82, 0x00
vertex    121,     73,    -21,      0,      0,  0x47, 0x60, 0x2B, 0x00
vertex    119,     70,    -42,      0,      0,  0x3D, 0x44, 0xA9, 0x00

mario_left_hand_open_shared_dl_vertex_group4: # 0x04019818
vertex     25,     -1,    -44,      0,      0,  0xE4, 0xE0, 0x89, 0x00
vertex     11,     29,    -52,      0,      0,  0xBA, 0x2A, 0xA0, 0x00
vertex     26,     41,    -41,      0,      0,  0x05, 0x34, 0x8D, 0x00
vertex     78,     59,    -34,      0,      0,  0xFE, 0x0B, 0x82, 0x00
vertex     69,     10,    -36,      0,      0,  0x35, 0x1C, 0x91, 0x00
vertex     89,    -47,    -37,      0,      0,  0x56, 0xAA, 0xDF, 0x00
vertex     41,    -37,    -36,      0,      0,  0xD8, 0x9B, 0xBF, 0x00
vertex     76,    -18,    -48,      0,      0,  0x27, 0x0A, 0x88, 0x00
vertex     45,    -34,     10,      0,      0,  0xFE, 0x9A, 0x4A, 0x00
vertex     89,     -6,    -27,      0,      0,  0x5C, 0xF5, 0xAB, 0x00
vertex     83,    -17,     10,      0,      0,  0x4D, 0xBD, 0x4A, 0x00
vertex     70,     89,    -20,      0,      0,  0xEC, 0x7C, 0xF6, 0x00
vertex      6,     53,     -9,      0,      0,  0xAF, 0x61, 0x00, 0x00
vertex    133,     28,    -40,      0,      0,  0x45, 0xC9, 0xA6, 0x00
vertex     77,     41,     21,      0,      0,  0x1D, 0x2A, 0x74, 0x00
vertex     26,     16,     28,      0,      0,  0xDA, 0x0C, 0x78, 0x00

mario_left_hand_open_shared_dl_vertex_group5: # 0x04019918
vertex      6,    -38,      7,      0,      0,  0xAE, 0xAB, 0x2B, 0x00
vertex      1,    -33,    -23,      0,      0,  0x9C, 0xBB, 0xE0, 0x00
vertex     13,    -39,    -31,      0,      0,  0x18, 0x9A, 0xBA, 0x00
vertex    -15,      4,    -32,      0,      0,  0x89, 0xDD, 0xE7, 0x00
vertex    -10,     14,    -43,      0,      0,  0xD3, 0x19, 0x8D, 0x00
vertex    -20,     22,     -7,      0,      0,  0x83, 0x06, 0x14, 0x00
vertex     -6,     -3,     17,      0,      0,  0x90, 0xDA, 0x2D, 0x00
vertex      2,      3,     26,      0,      0,  0xF5, 0x17, 0x7C, 0x00
vertex     20,    -27,    -27,      0,      0,  0x09, 0xBF, 0x94, 0x00
vertex     26,    -32,      6,      0,      0,  0x34, 0xA6, 0x47, 0x00
vertex      1,     15,    -37,      0,      0,  0xD2, 0x09, 0x8B, 0x00
vertex     -3,     35,     -9,      0,      0,  0xCD, 0x72, 0x13, 0x00
vertex     11,      5,     17,      0,      0,  0xFF, 0x1B, 0x7C, 0x00
vertex     26,     16,     28,      0,      0,  0xDA, 0x0C, 0x78, 0x00
vertex     11,     29,    -52,      0,      0,  0xBA, 0x2A, 0xA0, 0x00
vertex     25,     -1,    -44,      0,      0,  0xE4, 0xE0, 0x89, 0x00

mario_left_hand_open_shared_dl_vertex_group6: # 0x04019A18
vertex     26,    -32,      6,      0,      0,  0x34, 0xA6, 0x47, 0x00
vertex     20,    -27,    -27,      0,      0,  0x09, 0xBF, 0x94, 0x00
vertex     41,    -37,    -36,      0,      0,  0xD8, 0x9B, 0xBF, 0x00
vertex     26,     16,     28,      0,      0,  0xDA, 0x0C, 0x78, 0x00
vertex     11,      5,     17,      0,      0,  0xFF, 0x1B, 0x7C, 0x00

glabel mario_left_hand_open_shared_dl # 0x04019A68 - 0x04019CA0
gsSPVertex mario_left_hand_open_shared_dl_vertex_group1, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  3,  7, 0x0
gsSP2Triangles  1,  0,  5, 0x0,  5,  4,  1, 0x0
gsSP2Triangles  5,  3,  6, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  8, 11,  9, 0x0, 12, 13, 11, 0x0
gsSPVertex mario_left_hand_open_shared_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  0, 10,  7, 0x0, 11, 10,  0, 0x0
gsSP2Triangles 12, 13, 11, 0x0,  9,  8, 13, 0x0
gsSP2Triangles  7,  5,  8, 0x0, 10, 14,  7, 0x0
gsSP2Triangles 11, 14, 10, 0x0, 13,  4, 11, 0x0
gsSP2Triangles  8,  5, 13, 0x0,  3, 15,  1, 0x0
gsSPVertex mario_left_hand_open_shared_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  5,  3, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  1,  9, 10, 0x0,  5, 11,  1, 0x0
gsSP2Triangles 12, 13,  5, 0x0, 14,  9, 15, 0x0
gsSP1Triangle  4,  7, 12, 0x0
gsSPVertex mario_left_hand_open_shared_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  7,  0,  2, 0x0
gsSP2Triangles  8,  6,  5, 0x0,  5,  9, 10, 0x0
gsSP2Triangles 11,  3,  2, 0x0,  2, 12, 11, 0x0
gsSP2Triangles  3, 13,  9, 0x0,  6,  0,  7, 0x0
gsSP2Triangles  7,  4,  9, 0x0, 10, 14, 15, 0x0
gsSP1Triangle 15, 14, 11, 0x0
gsSPVertex mario_left_hand_open_shared_dl_vertex_group5, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  7,  6,  0, 0x0,  2,  8,  9, 0x0
gsSP2Triangles  4, 10,  8, 0x0, 11, 10,  4, 0x0
gsSP2Triangles  7, 12, 11, 0x0,  9, 12,  7, 0x0
gsSP2Triangles  6,  3,  1, 0x0,  6,  5,  3, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 14, 10, 11, 0x0
gsSP2Triangles  8, 10, 15, 0x0, 10, 14, 15, 0x0
gsSPVertex mario_left_hand_open_shared_dl_vertex_group6, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSPEndDisplayList

glabel mario_left_hand_open # 0x04019CA0 - 0x04019CC0
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_left_hand_open_shared_dl
gsSPEndDisplayList

mario_right_hand_open_dl_vertex_group1: # 0x04019CC0
vertex     81,     37,    -28,      0,      0,  0x18, 0x20, 0x88, 0x00
vertex     76,     88,      9,      0,      0,  0xEF, 0x7D, 0x00, 0x00
vertex    125,     71,      9,      0,      0,  0x47, 0x5A, 0xCB, 0x00
vertex    143,     31,     -1,      0,      0,  0x75, 0x06, 0xD2, 0x00
vertex    136,     28,     31,      0,      0,  0x4A, 0xCF, 0x5A, 0x00
vertex    124,     69,     30,      0,      0,  0x44, 0x49, 0x4D, 0x00
vertex     84,     59,     25,      0,      0,  0x04, 0x15, 0x7C, 0x00
vertex     86,    -19,    -13,      0,      0,  0x49, 0xB6, 0xB8, 0x00
vertex     30,     13,    -30,      0,      0,  0xD3, 0x03, 0x8A, 0x00
vertex     48,    -35,     -9,      0,      0,  0xF7, 0x94, 0xBE, 0x00
vertex     30,    -32,     -4,      0,      0,  0x2F, 0x9F, 0xBE, 0x00
vertex     46,    -35,     37,      0,      0,  0xD8, 0xA2, 0x4A, 0x00
vertex     32,      2,     43,      0,      0,  0xE9, 0xEB, 0x7A, 0x00
vertex     26,    -24,     28,      0,      0,  0x0D, 0xC8, 0x70, 0x00

mario_right_hand_open_dl_vertex_group2: # 0x04019DA0
vertex     20,     33,     48,      0,      0,  0xBF, 0x32, 0x60, 0x00
vertex     13,     53,      5,      0,      0,  0xB0, 0x62, 0xFC, 0x00
vertex      3,     36,      6,      0,      0,  0xCE, 0x71, 0xE6, 0x00
vertex     30,     13,    -30,      0,      0,  0xD3, 0x03, 0x8A, 0x00
vertex      0,     -4,    -15,      0,      0,  0x8D, 0xDA, 0xDC, 0x00
vertex     11,    -38,     -3,      0,      0,  0xA9, 0xAA, 0xE0, 0x00
vertex      7,    -30,     26,      0,      0,  0x9B, 0xC0, 0x29, 0x00
vertex     30,    -32,     -4,      0,      0,  0x2F, 0x9F, 0xBE, 0x00
vertex     25,    -46,     -9,      0,      0,  0x21, 0x97, 0xC1, 0x00
vertex      7,      1,    -26,      0,      0,  0xEE, 0x0D, 0x84, 0x00
vertex     -9,     41,      5,      0,      0,  0xBC, 0x66, 0xE5, 0x00
vertex     -1,     18,     42,      0,      0,  0xD9, 0x23, 0x73, 0x00
vertex     19,    -36,     33,      0,      0,  0x1A, 0xA0, 0x4D, 0x00
vertex     26,    -24,     28,      0,      0,  0x0D, 0xC8, 0x70, 0x00
vertex    -12,     23,      6,      0,      0,  0x83, 0x07, 0xF1, 0x00
vertex     76,     88,      9,      0,      0,  0xEF, 0x7D, 0x00, 0x00

mario_right_hand_open_dl_vertex_group3: # 0x04019EA0
vertex     30,     13,    -30,      0,      0,  0xD3, 0x03, 0x8A, 0x00
vertex     86,    -19,    -13,      0,      0,  0x49, 0xB6, 0xB8, 0x00
vertex     48,    -35,     -9,      0,      0,  0xF7, 0x94, 0xBE, 0x00
vertex     93,    -45,     36,      0,      0,  0x57, 0xAC, 0x23, 0x00
vertex     93,     -5,     22,      0,      0,  0x61, 0xFA, 0x50, 0x00
vertex     81,    -15,     45,      0,      0,  0x2F, 0x13, 0x74, 0x00
vertex     20,     33,     48,      0,      0,  0xBF, 0x32, 0x60, 0x00
vertex     34,     43,     36,      0,      0,  0x0C, 0x3D, 0x6E, 0x00
vertex     13,     53,      5,      0,      0,  0xB0, 0x62, 0xFC, 0x00
vertex     81,     37,    -28,      0,      0,  0x18, 0x20, 0x88, 0x00
vertex    143,     31,     -1,      0,      0,  0x75, 0x06, 0xD2, 0x00
vertex    136,     28,     31,      0,      0,  0x4A, 0xCF, 0x5A, 0x00
vertex     84,     59,     25,      0,      0,  0x04, 0x15, 0x7C, 0x00
vertex     75,     11,     32,      0,      0,  0x3C, 0x23, 0x69, 0x00
vertex    124,     69,     30,      0,      0,  0x44, 0x49, 0x4D, 0x00
vertex    125,     71,      9,      0,      0,  0x47, 0x5A, 0xCB, 0x00

mario_right_hand_open_dl_vertex_group4: # 0x04019FA0
vertex     34,     43,     36,      0,      0,  0x0C, 0x3D, 0x6E, 0x00
vertex     20,     33,     48,      0,      0,  0xBF, 0x32, 0x60, 0x00
vertex     32,      2,     43,      0,      0,  0xE9, 0xEB, 0x7A, 0x00
vertex     75,     11,     32,      0,      0,  0x3C, 0x23, 0x69, 0x00
vertex     84,     59,     25,      0,      0,  0x04, 0x15, 0x7C, 0x00
vertex     81,    -15,     45,      0,      0,  0x2F, 0x13, 0x74, 0x00
vertex     46,    -35,     37,      0,      0,  0xD8, 0xA2, 0x4A, 0x00
vertex     93,    -45,     36,      0,      0,  0x57, 0xAC, 0x23, 0x00
vertex     48,    -35,     -9,      0,      0,  0xF7, 0x94, 0xBE, 0x00
vertex     86,    -19,    -13,      0,      0,  0x49, 0xB6, 0xB8, 0x00
vertex     93,     -5,     22,      0,      0,  0x61, 0xFA, 0x50, 0x00
vertex     76,     88,      9,      0,      0,  0xEF, 0x7D, 0x00, 0x00
vertex     13,     53,      5,      0,      0,  0xB0, 0x62, 0xFC, 0x00
vertex    136,     28,     31,      0,      0,  0x4A, 0xCF, 0x5A, 0x00
vertex     30,     13,    -30,      0,      0,  0xD3, 0x03, 0x8A, 0x00
vertex     81,     37,    -28,      0,      0,  0x18, 0x20, 0x88, 0x00

mario_right_hand_open_dl_vertex_group5: # 0x0401A0A0
vertex     19,    -36,     33,      0,      0,  0x1A, 0xA0, 0x4D, 0x00
vertex      7,    -30,     26,      0,      0,  0x9B, 0xC0, 0x29, 0x00
vertex     11,    -38,     -3,      0,      0,  0xA9, 0xAA, 0xE0, 0x00
vertex     -1,     18,     42,      0,      0,  0xD9, 0x23, 0x73, 0x00
vertex     -7,      7,     32,      0,      0,  0x8A, 0xE2, 0x20, 0x00
vertex    -12,     23,      6,      0,      0,  0x83, 0x07, 0xF1, 0x00
vertex      7,      1,    -26,      0,      0,  0xEE, 0x0D, 0x84, 0x00
vertex      0,     -4,    -15,      0,      0,  0x8D, 0xDA, 0xDC, 0x00
vertex     30,    -32,     -4,      0,      0,  0x2F, 0x9F, 0xBE, 0x00
vertex     26,    -24,     28,      0,      0,  0x0D, 0xC8, 0x70, 0x00
vertex      9,     18,     35,      0,      0,  0xD8, 0x13, 0x76, 0x00
vertex      3,     36,      6,      0,      0,  0xCE, 0x71, 0xE6, 0x00
vertex     16,      4,    -17,      0,      0,  0xF9, 0x11, 0x83, 0x00
vertex     30,     13,    -30,      0,      0,  0xD3, 0x03, 0x8A, 0x00
vertex     20,     33,     48,      0,      0,  0xBF, 0x32, 0x60, 0x00
vertex     32,      2,     43,      0,      0,  0xE9, 0xEB, 0x7A, 0x00

mario_right_hand_open_dl_vertex_group6: # 0x0401A1A0
vertex     46,    -35,     37,      0,      0,  0xD8, 0xA2, 0x4A, 0x00
vertex     26,    -24,     28,      0,      0,  0x0D, 0xC8, 0x70, 0x00
vertex     30,    -32,     -4,      0,      0,  0x2F, 0x9F, 0xBE, 0x00
vertex     16,      4,    -17,      0,      0,  0xF9, 0x11, 0x83, 0x00
vertex     30,     13,    -30,      0,      0,  0xD3, 0x03, 0x8A, 0x00

glabel mario_right_hand_open_dl # 0x0401A1F0 - 0x0401A428
gsSPVertex mario_right_hand_open_dl_vertex_group1, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  3,  4, 0x0
gsSP2Triangles  5,  2,  1, 0x0,  1,  6,  5, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  8,  9, 10, 0x0
gsSP2Triangles  9, 11, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex mario_right_hand_open_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  9, 10,  2, 0x0,  2, 10, 11, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 12,  8,  7, 0x0
gsSP2Triangles  8,  5,  9, 0x0,  9, 14, 10, 0x0
gsSP2Triangles 10, 14, 11, 0x0, 11,  6, 12, 0x0
gsSP2Triangles 12,  5,  8, 0x0,  1, 15,  3, 0x0
gsSPVertex mario_right_hand_open_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  4,  5, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9, 10,  1, 0x0,  1, 11,  4, 0x0
gsSP2Triangles  4, 12, 13, 0x0, 14, 10, 15, 0x0
gsSP1Triangle 13,  7,  5, 0x0
gsSPVertex mario_right_hand_open_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  7,  6,  8, 0x0,  9, 10,  7, 0x0
gsSP2Triangles  0,  4, 11, 0x0, 11, 12,  0, 0x0
gsSP2Triangles 10, 13,  4, 0x0,  5,  2,  6, 0x0
gsSP2Triangles 10,  3,  5, 0x0, 14, 15,  9, 0x0
gsSP1Triangle 11, 15, 14, 0x0
gsSPVertex mario_right_hand_open_dl_vertex_group5, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  5,  4,  3, 0x0,  6,  7,  5, 0x0
gsSP2Triangles  2,  7,  6, 0x0,  8,  9,  0, 0x0
gsSP2Triangles  9, 10,  3, 0x0,  3, 10, 11, 0x0
gsSP2Triangles 11, 12,  6, 0x0,  6, 12,  8, 0x0
gsSP2Triangles  1,  4,  7, 0x0,  4,  5,  7, 0x0
gsSP2Triangles 13, 12, 11, 0x0, 11, 10, 14, 0x0
gsSP2Triangles 15, 10,  9, 0x0, 15, 14, 10, 0x0
gsSPVertex mario_right_hand_open_dl_vertex_group6, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSPEndDisplayList

glabel mario_right_hand_open # 0x0401A428 - 0x0401A448
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_right_hand_open_dl
gsSPEndDisplayList

glabel mario_metal_right_hand_open # 0x0401A448 - 0x0401A478
gsSPDisplayList mario_right_hand_open_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsSPEndDisplayList

mario_right_hand_cap_m_logo_dl_vertex: # 0x0401A478
vertex    131,     47,     -1,   1104,    228,  0xD7, 0x60, 0xB8, 0xFF
vertex    107,    -19,    -33,    474,     32,  0xD1, 0x0E, 0x8C, 0xFF
vertex     78,     11,     40,    772,    818,  0xD0, 0x3E, 0x9D, 0xFF
vertex     70,    -52,     35,    196,    800,  0xC5, 0xDE, 0x96, 0xFF
vertex    114,    -92,    -11,   -148,    188,  0xC4, 0xB8, 0xAC, 0xFF

mario_right_hand_cap_hand_position_dl_vertex_group1: # 0x0401A4C8
vertex      1,     24,     35,      0,      0,  0xD4, 0x3C, 0x66, 0xFF
vertex     29,      7,     48,      0,      0,  0xC3, 0xFA, 0x6E, 0xFF
vertex     29,     62,     34,      0,      0,  0xCD, 0x4C, 0x57, 0xFF
vertex     11,     60,     -3,      0,      0,  0xAB, 0x59, 0xE6, 0xFF
vertex     56,     11,     65,      0,      0,  0xFC, 0x1B, 0x7B, 0xFF
vertex     54,     54,     44,      0,      0,  0x1F, 0x50, 0x5C, 0xFF
vertex     58,     81,      0,      0,      0,  0x13, 0x7A, 0xE8, 0xFF
vertex     -2,     41,      0,      0,      0,  0xEE, 0x71, 0xCA, 0xFF
vertex     35,      9,    -36,      0,      0,  0xE4, 0xF4, 0x85, 0xFF
vertex    -13,     26,     41,      0,      0,  0xEE, 0x3C, 0x6E, 0xFF
vertex     23,    -25,     35,      0,      0,  0x04, 0xC2, 0x6E, 0xFF
vertex     75,    -32,     65,      0,      0,  0x08, 0xAE, 0x60, 0xFF
vertex     16,      1,    -22,      0,      0,  0x04, 0x00, 0x82, 0xFF
vertex      4,     -3,    -32,      0,      0,  0x11, 0x06, 0x83, 0xFF
vertex    -19,     47,     -4,      0,      0,  0xAD, 0x54, 0xD3, 0xFF

mario_right_hand_cap_hand_position_dl_vertex_group2: # 0x0401A5B8
vertex    103,    -25,      1,      0,      0,  0x67, 0xC4, 0xD6, 0xFF
vertex     95,     -8,     52,      0,      0,  0x60, 0x06, 0x52, 0xFF
vertex     75,    -32,     65,      0,      0,  0x08, 0xAE, 0x60, 0xFF
vertex     31,    -39,      0,      0,      0,  0x42, 0xA3, 0xCA, 0xFF
vertex     23,    -25,     35,      0,      0,  0x04, 0xC2, 0x6E, 0xFF
vertex     13,    -37,     41,      0,      0,  0x12, 0xB1, 0x61, 0xFF
vertex     55,    -43,     -3,      0,      0,  0x00, 0x86, 0xE0, 0xFF
vertex    -13,     26,     41,      0,      0,  0xEE, 0x3C, 0x6E, 0xFF
vertex      4,     -3,    -32,      0,      0,  0x11, 0x06, 0x83, 0xFF
vertex     16,      1,    -22,      0,      0,  0x04, 0x00, 0x82, 0xFF
vertex     35,      9,    -36,      0,      0,  0xE4, 0xF4, 0x85, 0xFF
vertex     24,    -55,     -4,      0,      0,  0x04, 0x8B, 0xD1, 0xFF
vertex     56,     11,     65,      0,      0,  0xFC, 0x1B, 0x7B, 0xFF
vertex    -15,    -12,      7,      0,      0,  0x8C, 0xCF, 0xF8, 0xFF
vertex     85,     15,     52,      0,      0,  0x40, 0x30, 0x62, 0xFF
vertex     54,     54,     44,      0,      0,  0x1F, 0x50, 0x5C, 0xFF

mario_right_hand_cap_hand_position_dl_vertex_group3: # 0x0401A6B8
vertex     35,      9,    -36,      0,      0,  0xE4, 0xF4, 0x85, 0xFF
vertex     85,     30,    -32,      0,      0,  0x4F, 0x21, 0xA3, 0xFF
vertex    103,    -25,      1,      0,      0,  0x67, 0xC4, 0xD6, 0xFF
vertex     58,     81,      0,      0,      0,  0x13, 0x7A, 0xE8, 0xFF
vertex     24,    -55,     -4,      0,      0,  0x04, 0x8B, 0xD1, 0xFF
vertex    -15,    -12,      7,      0,      0,  0x8C, 0xCF, 0xF8, 0xFF
vertex      4,     -3,    -32,      0,      0,  0x11, 0x06, 0x83, 0xFF
vertex    -19,     47,     -4,      0,      0,  0xAD, 0x54, 0xD3, 0xFF
vertex    -13,     26,     41,      0,      0,  0xEE, 0x3C, 0x6E, 0xFF
vertex     13,    -37,     41,      0,      0,  0x12, 0xB1, 0x61, 0xFF
vertex     96,     39,     24,      0,      0,  0x6B, 0x39, 0x21, 0xFF
vertex     54,     54,     44,      0,      0,  0x1F, 0x50, 0x5C, 0xFF
vertex     95,     -8,     52,      0,      0,  0x60, 0x06, 0x52, 0xFF
vertex     85,     15,     52,      0,      0,  0x40, 0x30, 0x62, 0xFF

mario_right_hand_cap_top_dl_vertex_group1: # 0x0401A798
vertex     29,    -82,     43,      0,      0,  0x95, 0xBD, 0x00, 0xFF
vertex     70,    -52,     35,      0,      0,  0xC5, 0xDE, 0x96, 0xFF
vertex    106,   -124,     90,      0,      0,  0x9D, 0xB2, 0x09, 0xFF
vertex     65,    -53,     55,      0,      0,  0xB7, 0x01, 0x67, 0xFF
vertex    151,   -168,     67,      0,      0,  0xF4, 0x87, 0xDC, 0xFF
vertex    137,   -137,    134,      0,      0,  0x9F, 0xDF, 0x49, 0xFF
vertex    114,    -92,    -11,      0,      0,  0xC4, 0xB8, 0xAC, 0xFF
vertex    228,   -121,    117,      0,      0,  0x66, 0xCD, 0xCB, 0xFF
vertex    182,    -72,     -8,      0,      0,  0x4D, 0xD9, 0xA4, 0xFF
vertex    181,   -167,    138,      0,      0,  0x06, 0x88, 0x26, 0xFF
vertex    171,   -129,    178,      0,      0,  0xB3, 0xD1, 0x58, 0xFF
vertex    160,     65,    148,      0,      0,  0xB3, 0x47, 0x47, 0xFF
vertex    211,     81,    156,      0,      0,  0x22, 0x6C, 0x37, 0xFF
vertex    183,    100,     86,      0,      0,  0x11, 0x7C, 0xED, 0xFF
vertex    129,     65,    103,      0,      0,  0xA7, 0x50, 0x27, 0xFF

mario_right_hand_cap_top_dl_vertex_group2: # 0x0401A888
vertex     78,     11,     40,      0,      0,  0xD0, 0x3E, 0x9D, 0xFF
vertex    129,     65,    103,      0,      0,  0xA7, 0x50, 0x27, 0xFF
vertex    131,     47,     -1,      0,      0,  0xD7, 0x60, 0xB8, 0xFF
vertex     45,     49,     53,      0,      0,  0xA8, 0x5A, 0x0A, 0xFF
vertex     73,     11,     60,      0,      0,  0xBB, 0xFB, 0x6A, 0xFF
vertex    183,    100,     86,      0,      0,  0x11, 0x7C, 0xED, 0xFF
vertex    192,     42,    190,      0,      0,  0xB3, 0x23, 0x5D, 0xFF
vertex    211,     81,    156,      0,      0,  0x22, 0x6C, 0x37, 0xFF
vertex    160,     65,    148,      0,      0,  0xB3, 0x47, 0x47, 0xFF
vertex     18,    -13,     33,      0,      0,  0x84, 0x10, 0xED, 0xFF
vertex     70,    -52,     35,      0,      0,  0xC5, 0xDE, 0x96, 0xFF
vertex    192,     11,     -2,      0,      0,  0x4B, 0x29, 0xA3, 0xFF
vertex    107,    -19,    -33,      0,      0,  0xD1, 0x0E, 0x8C, 0xFF
vertex    228,   -121,    117,      0,      0,  0x66, 0xCD, 0xCB, 0xFF
vertex    246,     29,    128,      0,      0,  0x72, 0x20, 0xD4, 0xFF
vertex    285,     -6,    196,      0,      0,  0x79, 0x23, 0x0B, 0xFF

mario_right_hand_cap_top_dl_vertex_group3: # 0x0401A988
vertex     65,    -53,     55,      0,      0,  0xB7, 0x01, 0x67, 0xFF
vertex     18,    -13,     33,      0,      0,  0x84, 0x10, 0xED, 0xFF
vertex     29,    -82,     43,      0,      0,  0x95, 0xBD, 0x00, 0xFF
vertex     70,    -52,     35,      0,      0,  0xC5, 0xDE, 0x96, 0xFF
vertex     73,     11,     60,      0,      0,  0xBB, 0xFB, 0x6A, 0xFF
vertex    114,    -92,    -11,      0,      0,  0xC4, 0xB8, 0xAC, 0xFF
vertex    107,    -19,    -33,      0,      0,  0xD1, 0x0E, 0x8C, 0xFF
vertex    182,    -72,     -8,      0,      0,  0x4D, 0xD9, 0xA4, 0xFF
vertex    192,     11,     -2,      0,      0,  0x4B, 0x29, 0xA3, 0xFF
vertex    246,     29,    128,      0,      0,  0x72, 0x20, 0xD4, 0xFF
vertex    228,   -121,    117,      0,      0,  0x66, 0xCD, 0xCB, 0xFF
vertex    211,     81,    156,      0,      0,  0x22, 0x6C, 0x37, 0xFF
vertex    285,     -6,    196,      0,      0,  0x79, 0x23, 0x0B, 0xFF
vertex    273,   -105,    188,      0,      0,  0x5F, 0xBF, 0x34, 0xFF
vertex    181,   -167,    138,      0,      0,  0x06, 0x88, 0x26, 0xFF
vertex    228,      1,    228,      0,      0,  0x14, 0x22, 0x78, 0xFF

mario_right_hand_cap_top_dl_vertex_group4: # 0x0401AA88
vertex    181,   -167,    138,      0,      0,  0x06, 0x88, 0x26, 0xFF
vertex    273,   -105,    188,      0,      0,  0x5F, 0xBF, 0x34, 0xFF
vertex    216,   -104,    220,      0,      0,  0xE5, 0xCC, 0x70, 0xFF
vertex    228,      1,    228,      0,      0,  0x14, 0x22, 0x78, 0xFF
vertex    285,     -6,    196,      0,      0,  0x79, 0x23, 0x0B, 0xFF
vertex    211,     81,    156,      0,      0,  0x22, 0x6C, 0x37, 0xFF
vertex    192,     42,    190,      0,      0,  0xB3, 0x23, 0x5D, 0xFF
vertex    171,   -129,    178,      0,      0,  0xB3, 0xD1, 0x58, 0xFF

mario_right_hand_cap_bottom_dl_vertex: # 0x0401AB08
vertex     65,    -53,     55,      0,      0,  0xB7, 0x01, 0x67, 0xFF
vertex    106,   -124,     90,      0,      0,  0x9D, 0xB2, 0x09, 0xFF
vertex    137,   -137,    134,      0,      0,  0x9F, 0xDF, 0x49, 0xFF
vertex     73,     11,     60,      0,      0,  0xBB, 0xFB, 0x6A, 0xFF
vertex    129,     65,    103,      0,      0,  0xA7, 0x50, 0x27, 0xFF
vertex    160,     65,    148,      0,      0,  0xB3, 0x47, 0x47, 0xFF
vertex    192,     42,    190,      0,      0,  0xB3, 0x23, 0x5D, 0xFF
vertex    171,   -129,    178,      0,      0,  0xB3, 0xD1, 0x58, 0xFF
vertex    216,   -104,    220,      0,      0,  0xE5, 0xCC, 0x70, 0xFF
vertex    228,      1,    228,      0,      0,  0x14, 0x22, 0x78, 0xFF

glabel mario_right_hand_cap_m_logo_dl # 0x0401ABA8 - 0x0401ABD0
gsSPVertex mario_right_hand_cap_m_logo_dl_vertex, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP1Triangle  1,  4,  3, 0x0
gsSPEndDisplayList

glabel mario_right_hand_cap_top_dl # 0x0401ABD0 - 0x0401AD40
gsSPVertex mario_right_hand_cap_top_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  2,  4,  5, 0x0,  6,  2,  1, 0x0
gsSP2Triangles  2,  6,  4, 0x0,  7,  4,  8, 0x0
gsSP2Triangles  8,  4,  6, 0x0,  4,  9,  5, 0x0
gsSP2Triangles  4,  7,  9, 0x0,  5,  9, 10, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 13, 14, 11, 0x0
gsSPVertex mario_right_hand_cap_top_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  0,  3,  1, 0x0,  5,  2,  1, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  0,  9,  3, 0x0
gsSP2Triangles 10,  9,  0, 0x0, 11, 12,  2, 0x0
gsSP2Triangles  2,  5, 11, 0x0,  3,  9,  4, 0x0
gsSP2Triangles 13, 14, 15, 0x0, 11,  5, 14, 0x0
gsSP1Triangle  7, 14,  5, 0x0
gsSPVertex mario_right_hand_cap_top_dl_vertex_group3, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  7,  6,  8, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12,  9, 0x0
gsSP2Triangles 10, 13, 14, 0x0, 12, 13, 10, 0x0
gsSP1Triangle 13, 12, 15, 0x0
gsSPVertex mario_right_hand_cap_top_dl_vertex_group4, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  3,  4,  5, 0x0,  3,  5,  6, 0x0
gsSP1Triangle  7,  0,  2, 0x0
gsSPEndDisplayList

glabel mario_right_hand_cap_hand_position_dl # 0x0401AD40 - 0x0401AED0
gsSPVertex mario_right_hand_cap_hand_position_dl_vertex_group1, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  2,  5,  6, 0x0
gsSP2Triangles  6,  3,  2, 0x0,  5,  2,  4, 0x0
gsSP2Triangles  3,  7,  0, 0x0,  3,  6,  8, 0x0
gsSP2Triangles  3,  8,  7, 0x0,  9,  0,  7, 0x0
gsSP2Triangles 10,  0,  9, 0x0,  1,  0, 10, 0x0
gsSP2Triangles 11,  1, 10, 0x0, 11,  4,  1, 0x0
gsSP2Triangles  7, 12, 13, 0x0,  8, 12,  7, 0x0
gsSP2Triangles 13, 14,  7, 0x0,  7, 14,  9, 0x0
gsSPVertex mario_right_hand_cap_hand_position_dl_vertex_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  6,  2,  4, 0x0
gsSP2Triangles  7,  5,  4, 0x0,  8,  9,  3, 0x0
gsSP2Triangles  3,  9, 10, 0x0, 10,  6,  3, 0x0
gsSP2Triangles  5, 11,  3, 0x0,  3, 11,  8, 0x0
gsSP2Triangles 10,  0,  6, 0x0,  6,  0,  2, 0x0
gsSP2Triangles  2,  1, 12, 0x0,  5, 13, 11, 0x0
gsSP2Triangles  1, 14, 12, 0x0, 14, 15, 12, 0x0
gsSPVertex mario_right_hand_cap_hand_position_dl_vertex_group3, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  7,  5,  8, 0x0,  8,  5,  9, 0x0
gsSP2Triangles  3, 10,  1, 0x0, 11, 10,  3, 0x0
gsSP2Triangles  1, 10,  2, 0x0,  2, 10, 12, 0x0
gsSP2Triangles 12, 10, 13, 0x0, 10, 11, 13, 0x0
gsSPEndDisplayList

glabel mario_right_hand_cap_bottom_dl # 0x0401AED0 - 0x0401AF20
gsSPVertex mario_right_hand_cap_bottom_dl_vertex, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  3,  2, 0x0,  5,  4,  2, 0x0
gsSP2Triangles  6,  5,  2, 0x0,  6,  2,  7, 0x0
gsSP2Triangles  8,  9,  6, 0x0,  6,  7,  8, 0x0
gsSPEndDisplayList

glabel mario_right_hand_cap_dl # 0x0401AF20 - 0x0401AF60
gsSPDisplayList mario_right_hand_cap_top_dl
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_right_hand_cap_hand_position_dl
gsSPLight mario_diff_light_group6, 1
gsSPLight mario_amb_light_group6, 2
gsSPDisplayList mario_right_hand_cap_bottom_dl
gsSPEndDisplayList

mario_right_hand_cap_wings_half_1_dl_vertex: # 0x0401AF60
vertex    368,    146,      7,    990,      0,  0xBE, 0x65, 0xDA, 0xFF
vertex    166,     37,     68,      0,   2012,  0xBE, 0x65, 0xDA, 0xFF
vertex    212,     96,    143,    990,   2012,  0xBE, 0x65, 0xDA, 0xFF
vertex    368,    146,      7,    990,      0,  0xBE, 0x64, 0xD9, 0xFF
vertex    322,     87,    -67,      0,      0,  0xBE, 0x64, 0xD9, 0xFF
vertex    166,     37,     68,      0,   2012,  0xBE, 0x64, 0xD9, 0xFF
vertex    178,   -177,    128,    990,   2012,  0xA8, 0xB4, 0xCF, 0xFF
vertex    149,   -100,     60,      0,   2012,  0xA8, 0xB4, 0xCF, 0xFF
vertex    319,   -248,    -14,    990,      0,  0xA8, 0xB4, 0xCF, 0xFF
vertex    290,   -171,    -81,      0,      0,  0xA8, 0xB4, 0xCF, 0xFF

mario_right_hand_cap_wings_half_2_dl_vertex: # 0x0401B000
vertex    414,    206,     82,    990,      0,  0xBE, 0x64, 0xD9, 0xFF
vertex    212,     96,    143,      0,   2012,  0xBE, 0x64, 0xD9, 0xFF
vertex    258,    156,    218,    990,   2012,  0xBE, 0x64, 0xD9, 0xFF
vertex    368,    146,      7,      0,      0,  0xBE, 0x64, 0xD9, 0xFF
vertex    178,   -177,    128,      0,   2012,  0xA8, 0xB3, 0xCF, 0xFF
vertex    319,   -248,    -14,      0,      0,  0xA8, 0xB3, 0xCF, 0xFF
vertex    349,   -325,     53,    990,      0,  0xA8, 0xB3, 0xCF, 0xFF
vertex    207,   -253,    195,    990,   2012,  0xA8, 0xB3, 0xCF, 0xFF

glabel mario_right_hand_cap_wings_half_1_dl # 0x0401B080 - 0x0401B0B0
gsSPVertex mario_right_hand_cap_wings_half_1_dl_vertex, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  7,  9,  8, 0x0
gsSPEndDisplayList

glabel mario_right_hand_cap_wings_half_2_dl # 0x0401B0B0 - 0x0401B0E0
gsSPVertex mario_right_hand_cap_wings_half_2_dl_vertex, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  4,  6, 0x0
gsSPEndDisplayList

glabel mario_right_hand_cap_wings_intial_dl # 0x0401B0E0 - 0x0401B138
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPEndDisplayList

glabel mario_right_hand_cap_wings_end_dl # 0x0401B138 - 0x0401B158
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

glabel mario_right_hand_cap # 0x0401B158 - 0x0401B1D8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList mario_right_hand_cap_m_logo_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_right_hand_cap_dl
gsSPEndDisplayList

glabel mario_right_hand_cap_wings # 0x0401B1D8 - 0x0401B230
gsSPDisplayList mario_right_hand_cap_wings_intial_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_right_hand_cap_wings_half_1_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_right_hand_cap_wings_half_2_dl
gsSPDisplayList mario_right_hand_cap_wings_end_dl
gsSPEndDisplayList

glabel mario_metal_right_hand_cap_shared_dl # 0x0401B230 - 0x0401B278
gsSPDisplayList mario_right_hand_cap_m_logo_dl
gsSPDisplayList mario_right_hand_cap_top_dl
gsSPDisplayList mario_right_hand_cap_hand_position_dl
gsSPDisplayList mario_right_hand_cap_bottom_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsSPEndDisplayList

glabel mario_metal_right_hand_cap_shared_dl_wings # 0x0401B278 - 0x0401B2D0
gsSPDisplayList mario_right_hand_cap_wings_intial_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_right_hand_cap_wings_half_1_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_right_hand_cap_wings_half_2_dl
gsSPDisplayList mario_right_hand_cap_wings_end_dl
gsSPEndDisplayList

mario_right_hand_peace_shared_dl_vertex_group1: # 0x0401B2D0
vertex    -21,      9,     33,      0,      0,  0x8A, 0xE1, 0x1F, 0x00
vertex    -25,     24,      0,      0,      0,  0x84, 0xF8, 0xEA, 0x00
vertex     -8,    -12,    -20,      0,      0,  0x93, 0xCF, 0xD7, 0x00
vertex      0,    -35,     32,      0,      0,  0x9D, 0xBA, 0x22, 0xFF
vertex      6,    -49,      0,      0,      0,  0xA9, 0xA7, 0xEC, 0xFF
vertex     88,    -34,     39,      0,      0,  0x38, 0xA1, 0x3D, 0xFF
vertex     90,     -3,     52,      0,      0,  0x50, 0x07, 0x61, 0xFF
vertex     45,    -29,     52,      0,      0,  0xEB, 0xB9, 0x66, 0xFF
vertex     23,    -29,     36,      0,      0,  0x12, 0xEC, 0x7B, 0xFF
vertex     18,     30,     41,      0,      0,  0xC1, 0x2B, 0x64, 0xFF
vertex     46,     49,     45,      0,      0,  0xF8, 0x44, 0x6A, 0xFF
vertex      0,     21,     37,      0,      0,  0xFE, 0x44, 0x6A, 0xFF
vertex     56,    -47,     -5,      0,      0,  0x0C, 0x87, 0xDE, 0xFF
vertex     56,     80,      1,      0,      0,  0x1A, 0x6A, 0x40, 0xFF
vertex      8,     58,     -2,      0,      0,  0xBC, 0x55, 0x40, 0xFF
vertex     84,     48,     24,      0,      0,  0x32, 0x3D, 0x62, 0xFF

mario_right_hand_peace_shared_dl_vertex_group2: # 0x0401B3D0
vertex     33,      7,    -37,      0,      0,  0xDE, 0xF5, 0x87, 0xFF
vertex     56,    -47,     -5,      0,      0,  0x0C, 0x87, 0xDE, 0x00
vertex     32,    -43,      0,      0,      0,  0xDD, 0xBA, 0x9D, 0x00
vertex     45,    -29,     52,      0,      0,  0xEB, 0xB9, 0x66, 0xFF
vertex     32,    -43,      0,      0,      0,  0xEB, 0x89, 0x24, 0xFF
vertex     18,     30,     41,      0,      0,  0xC1, 0x2B, 0x64, 0xFF
vertex      8,     58,     -2,      0,      0,  0xBC, 0x55, 0x40, 0xFF
vertex     -4,     38,      0,      0,      0,  0xD3, 0x66, 0x3C, 0xFF
vertex      8,     58,     -2,      0,      0,  0xD0, 0x30, 0x96, 0xFF
vertex     -4,     38,      0,      0,      0,  0xB3, 0x18, 0x9F, 0xFF
vertex     24,    -59,     -3,      0,      0,  0xC4, 0xB9, 0xAB, 0xFF
vertex      6,    -49,      0,      0,      0,  0xA9, 0xA7, 0xEC, 0xFF
vertex     -8,    -12,    -20,      0,      0,  0x93, 0xCF, 0xD7, 0xFF
vertex      2,     -5,    -33,      0,      0,  0xAD, 0xDA, 0xA9, 0xFF

mario_right_hand_peace_shared_dl_vertex_group3: # 0x0401B4B0
vertex    -22,     43,     -3,      0,      0,  0x31, 0x4D, 0xA8, 0xFF
vertex     -4,     38,      0,      0,      0,  0x31, 0x4D, 0xA8, 0x00
vertex     14,     -1,    -22,      0,      0,  0x47, 0x20, 0x9D, 0x00
vertex      2,     -5,    -33,      0,      0,  0x47, 0x20, 0x9D, 0xFF
vertex    -22,     43,     -3,      0,      0,  0x86, 0x10, 0xE4, 0xFF
vertex    -25,     24,      0,      0,      0,  0x84, 0xF8, 0xEA, 0xFF
vertex    -21,      9,     33,      0,      0,  0x8A, 0xE1, 0x1F, 0xFF
vertex    -15,     23,     43,      0,      0,  0xD6, 0x31, 0x6C, 0xFF
vertex      0,    -35,     32,      0,      0,  0x9D, 0xBA, 0x22, 0xFF
vertex     15,    -39,     42,      0,      0,  0x0C, 0xBE, 0x6B, 0xFF
vertex      6,    -49,      0,      0,      0,  0xA9, 0xA7, 0xEC, 0xFF
vertex     24,    -59,     -3,      0,      0,  0xCE, 0x92, 0x24, 0xFF
vertex      8,     58,     -2,      0,      0,  0xD0, 0x30, 0x96, 0xFF
vertex     56,     80,      1,      0,      0,  0xFE, 0x41, 0x94, 0xFF
vertex     33,      7,    -37,      0,      0,  0xDE, 0xF5, 0x87, 0xFF

mario_right_hand_peace_shared_dl_vertex_group4: # 0x0401B5A0
vertex    101,    -29,     15,      0,      0,  0x53, 0xA3, 0x15, 0xFF
vertex     88,    -34,     39,      0,      0,  0x38, 0xA1, 0x3D, 0x00
vertex     56,    -47,     -5,      0,      0,  0x0C, 0x87, 0xDE, 0x00
vertex     56,     80,      1,      0,      0,  0xFE, 0x41, 0x94, 0xFF
vertex     84,     60,     -7,      0,      0,  0xFB, 0x44, 0x96, 0xFF
vertex     89,     18,    -34,      0,      0,  0x0A, 0x1B, 0x85, 0xFF
vertex    105,     17,      3,      0,      0,  0x0A, 0x7C, 0x14, 0xFF
vertex     98,     10,     29,      0,      0,  0x0A, 0x7A, 0x21, 0xFF
vertex    153,      7,     24,      0,      0,  0x0C, 0x7A, 0x1E, 0xFF
vertex     46,     49,     45,      0,      0,  0xF8, 0x44, 0x6A, 0xFF
vertex     84,     48,     24,      0,      0,  0x32, 0x3D, 0x62, 0xFF
vertex     56,     80,      1,      0,      0,  0x1A, 0x6A, 0x40, 0xFF
vertex     33,      7,    -37,      0,      0,  0xDE, 0xF5, 0x87, 0xFF
vertex     94,    -22,    -18,      0,      0,  0x07, 0xCD, 0x8D, 0xFF
vertex     14,     -1,    -22,      0,      0,  0xBE, 0xE5, 0x98, 0xFF
vertex     -4,     38,      0,      0,      0,  0xB3, 0x18, 0x9F, 0xFF

mario_right_hand_peace_shared_dl_vertex_group5: # 0x0401B6A0
vertex     -4,     38,      0,      0,      0,  0xD3, 0x66, 0x3C, 0xFF
vertex      0,     21,     37,      0,      0,  0xFE, 0x44, 0x6A, 0x00
vertex     18,     30,     41,      0,      0,  0xC1, 0x2B, 0x64, 0x00
vertex     45,    -29,     52,      0,      0,  0xEB, 0xB9, 0x66, 0xFF
vertex     23,    -29,     36,      0,      0,  0xE3, 0x8B, 0x25, 0xFF
vertex     32,    -43,      0,      0,      0,  0xEB, 0x89, 0x24, 0xFF
vertex     32,    -43,      0,      0,      0,  0xDD, 0xBA, 0x9D, 0xFF
vertex     14,     -1,    -22,      0,      0,  0xBE, 0xE5, 0x98, 0xFF
vertex     33,      7,    -37,      0,      0,  0xDE, 0xF5, 0x87, 0xFF
vertex    166,    -13,    -17,      0,      0,  0x7A, 0x08, 0x21, 0xFF
vertex    162,     14,    -11,      0,      0,  0x79, 0x01, 0x25, 0xFF
vertex    153,      7,     24,      0,      0,  0x7A, 0x08, 0x21, 0xFF
vertex    155,    -15,     21,      0,      0,  0x79, 0x06, 0x23, 0xFF
vertex     84,     60,     -7,      0,      0,  0xC2, 0x66, 0x28, 0xFF
vertex     84,     48,     24,      0,      0,  0xC2, 0x66, 0x28, 0xFF
vertex    126,     84,     -3,      0,      0,  0xC2, 0x66, 0x28, 0xFF

mario_right_hand_peace_shared_dl_vertex_group6: # 0x0401B7A0
vertex    146,     59,     -8,      0,      0,  0x5D, 0x4D, 0x26, 0xFF
vertex    126,     84,     -3,      0,      0,  0x5F, 0x47, 0x2A, 0x00
vertex    123,     72,     21,      0,      0,  0x5D, 0x4D, 0x26, 0x00
vertex    126,     84,     -3,      0,      0,  0xFD, 0x37, 0x8E, 0xFF
vertex     89,     18,    -34,      0,      0,  0x0A, 0x1B, 0x85, 0xFF
vertex     84,     60,     -7,      0,      0,  0xFB, 0x44, 0x96, 0xFF
vertex    146,     59,     -8,      0,      0,  0x15, 0x2A, 0x8B, 0xFF
vertex    162,     14,    -11,      0,      0,  0x0A, 0x7D, 0x0D, 0xFF
vertex     89,     18,    -34,      0,      0,  0x06, 0x7E, 0xFF, 0xFF
vertex    105,     17,      3,      0,      0,  0x0A, 0x7C, 0x14, 0xFF
vertex    162,     14,    -11,      0,      0,  0x26, 0x1E, 0x8B, 0xFF
vertex    166,    -13,    -17,      0,      0,  0x18, 0xF9, 0x84, 0xFF
vertex     56,     80,      1,      0,      0,  0x1A, 0x6A, 0x40, 0xFF
vertex     84,     48,     24,      0,      0,  0x32, 0x3D, 0x62, 0xFF
vertex     84,     60,     -7,      0,      0,  0x4D, 0x5D, 0x24, 0xFF

mario_right_hand_peace_shared_dl_vertex_group7: # 0x0401B890
vertex    139,     53,     25,      0,      0,  0x5B, 0xA8, 0x02, 0xFF
vertex    105,     17,      3,      0,      0,  0x59, 0xA6, 0xF7, 0x00
vertex    146,     59,     -8,      0,      0,  0x57, 0xA6, 0xF0, 0x00
vertex     33,      7,    -37,      0,      0,  0xDE, 0xF5, 0x87, 0xFF
vertex     89,     18,    -34,      0,      0,  0x0A, 0x1B, 0x85, 0xFF
vertex     94,    -22,    -18,      0,      0,  0x07, 0xCD, 0x8D, 0xFF
vertex     88,    -34,     39,      0,      0,  0x38, 0xA1, 0x3D, 0xFF
vertex    101,    -29,     15,      0,      0,  0x53, 0xA3, 0x15, 0xFF
vertex     90,     -3,     52,      0,      0,  0x50, 0x07, 0x61, 0xFF
vertex     94,    -22,    -18,      0,      0,  0x1C, 0x85, 0x00, 0xFF
vertex    155,    -15,     21,      0,      0,  0x19, 0x85, 0xF1, 0xFF
vertex    166,    -13,    -17,      0,      0,  0x10, 0x83, 0x00, 0xFF
vertex    101,    -29,     15,      0,      0,  0xFF, 0xE2, 0x7B, 0xFF
vertex    153,      7,     24,      0,      0,  0xFF, 0xE2, 0x7B, 0xFF
vertex     98,     10,     29,      0,      0,  0x07, 0xD6, 0x77, 0xFF

mario_right_hand_peace_shared_dl_vertex_group8: # 0x0401B980
vertex    139,     53,     25,      0,      0,  0xFC, 0x13, 0x7D, 0xFF
vertex    123,     72,     21,      0,      0,  0xFC, 0x15, 0x7D, 0x00
vertex     84,     48,     24,      0,      0,  0x32, 0x3D, 0x62, 0x00
vertex     98,     10,     29,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex    101,    -29,     15,      0,      0,  0xFF, 0xE2, 0x7B, 0xFF
vertex    155,    -15,     21,      0,      0,  0xF5, 0xEF, 0x7D, 0xFF
vertex    153,      7,     24,      0,      0,  0xFF, 0xE2, 0x7B, 0xFF
vertex     90,     -3,     52,      0,      0,  0x50, 0x07, 0x61, 0xFF
vertex    101,    -29,     15,      0,      0,  0x53, 0xA3, 0x15, 0xFF
vertex    146,     59,     -8,      0,      0,  0x57, 0xA6, 0xF0, 0xFF
vertex    105,     17,      3,      0,      0,  0x59, 0xA6, 0xF7, 0xFF
vertex     89,     18,    -34,      0,      0,  0x51, 0xA6, 0xDD, 0xFF
vertex    166,    -13,    -17,      0,      0,  0x18, 0xF9, 0x84, 0xFF
vertex     94,    -22,    -18,      0,      0,  0x07, 0xCD, 0x8D, 0xFF
vertex     89,     18,    -34,      0,      0,  0x0A, 0x1B, 0x85, 0xFF

mario_right_hand_peace_shared_dl_vertex_group9: # 0x0401BA70
vertex     84,     48,     24,      0,      0,  0xC2, 0x66, 0x28, 0xFF
vertex    123,     72,     21,      0,      0,  0xC3, 0x66, 0x29, 0x00
vertex    126,     84,     -3,      0,      0,  0xC2, 0x66, 0x28, 0x00
vertex    139,     53,     25,      0,      0,  0x5B, 0xA8, 0x02, 0xFF
vertex     98,     10,     29,      0,      0,  0x5B, 0xA8, 0x02, 0xFF
vertex    105,     17,      3,      0,      0,  0x59, 0xA6, 0xF7, 0xFF
vertex    105,     17,      3,      0,      0,  0x0A, 0x7C, 0x14, 0xFF
vertex    153,      7,     24,      0,      0,  0x0C, 0x7A, 0x1E, 0xFF
vertex    162,     14,    -11,      0,      0,  0x0A, 0x7D, 0x0D, 0xFF
vertex    123,     72,     21,      0,      0,  0x5D, 0x4D, 0x26, 0xFF
vertex    139,     53,     25,      0,      0,  0x5A, 0x52, 0x21, 0xFF
vertex    146,     59,     -8,      0,      0,  0x5D, 0x4D, 0x26, 0xFF
vertex     24,    -59,     -3,      0,      0,  0x68, 0xC7, 0x2C, 0xFF
vertex     32,    -43,      0,      0,      0,  0x68, 0xC7, 0x2C, 0xFF
vertex     23,    -29,     36,      0,      0,  0x12, 0xEC, 0x7B, 0xFF
vertex     15,    -39,     42,      0,      0,  0x0C, 0xBE, 0x6B, 0xFF

mario_right_hand_peace_shared_dl_vertex_group10: # 0x0401BB70
vertex      2,     -5,    -33,      0,      0,  0x47, 0x20, 0x9D, 0xFF
vertex     14,     -1,    -22,      0,      0,  0x47, 0x20, 0x9D, 0x00
vertex     32,    -43,      0,      0,      0,  0x52, 0xEE, 0xA2, 0x00
vertex     24,    -59,     -3,      0,      0,  0x52, 0xEE, 0xA2, 0xFF
vertex      2,     -5,    -33,      0,      0,  0xAD, 0xDA, 0xA9, 0xFF
vertex     -8,    -12,    -20,      0,      0,  0x93, 0xCF, 0xD7, 0xFF
vertex    -25,     24,      0,      0,      0,  0x84, 0xF8, 0xEA, 0xFF
vertex    -22,     43,     -3,      0,      0,  0x86, 0x10, 0xE4, 0xFF
vertex    -15,     23,     43,      0,      0,  0xD6, 0x31, 0x6C, 0xFF
vertex      0,     21,     37,      0,      0,  0xFE, 0x44, 0x6A, 0xFF
vertex     -4,     38,      0,      0,      0,  0xD3, 0x66, 0x3C, 0xFF
vertex    -22,     43,     -3,      0,      0,  0x1A, 0x72, 0x2F, 0xFF
vertex     15,    -39,     42,      0,      0,  0x0C, 0xBE, 0x6B, 0xFF
vertex     23,    -29,     36,      0,      0,  0x12, 0xEC, 0x7B, 0xFF

mario_right_hand_peace_shared_dl_vertex_group11: # 0x0401BC50
vertex    101,    -29,     15,      0,      0,  0x53, 0xA3, 0x15, 0xFF
vertex     56,    -47,     -5,      0,      0,  0x0C, 0x87, 0xDE, 0x00
vertex     94,    -22,    -18,      0,      0,  0x1C, 0x85, 0x00, 0x00

glabel mario_right_hand_peace_shared_dl # 0x0401BC80 - 0x0401BF30
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  7,  9, 0x0,  7,  6, 10, 0x0
gsSP2Triangles  7, 10,  9, 0x0, 11,  8,  9, 0x0
gsSP2Triangles  7, 12,  5, 0x0, 10, 13, 14, 0x0
gsSP2Triangles  6, 15, 10, 0x0, 10, 14,  9, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group2, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  8,  0,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  7,  6,  8, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  9,  8, 10, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group4, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  2, 12, 13, 0x0,  3,  5, 12, 0x0
gsSP1Triangle 12, 14, 15, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group5, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group6, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  4, 10, 11, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group7, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  7, 0x0
gsSP2Triangles 10,  9, 11, 0x0, 12, 13, 14, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  3,  2,  7, 0x0
gsSP2Triangles  8,  3,  7, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group9, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group10, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13,  9, 0x0, 12,  9,  8, 0x0
gsSPVertex mario_right_hand_peace_shared_dl_vertex_group11, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel mario_right_hand_peace # 0x0401BF30 - 0x0401BF50
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_right_hand_peace_shared_dl
gsSPEndDisplayList

mario_cap_unused_m_logo_dl_vertex: # 0x0401BF50
vertex     33,     35,    118,    728,    758,  0x30, 0x26, 0x6E, 0xFF
vertex     96,     22,     45,   1240,    876,  0x48, 0xA4, 0x31, 0xFF
vertex     71,    101,    113,   1028,    148,  0x55, 0x16, 0x5B, 0xFF
vertex      0,    110,    143,    460,     68,  0x00, 0x34, 0x73, 0xFF
vertex    -31,     35,    118,    206,    762,  0xD0, 0x26, 0x6F, 0xFF
vertex    -70,    101,    113,   -106,    158,  0xAB, 0x16, 0x5B, 0xFF
vertex    -95,     22,     46,   -302,    890,  0xA8, 0xB9, 0x38, 0xFF

mario_cap_unused_base_top_dl_vertex_group1: # 0x0401BFC0
vertex    -66,      2,    139,      0,      0,  0xB0, 0xBB, 0x45, 0xFF
vertex      0,      0,    163,      0,      0,  0x00, 0xBA, 0x69, 0xFF
vertex    -31,     35,    118,      0,      0,  0xD0, 0x26, 0x6F, 0xFF
vertex    -32,     17,    109,      0,      0,  0x00, 0x83, 0xF0, 0xFF
vertex     33,     17,    109,      0,      0,  0xFB, 0x84, 0xEA, 0xFF
vertex    -95,     22,     46,      0,      0,  0xA8, 0xB9, 0x38, 0xFF
vertex   -101,     10,     -7,      0,      0,  0xD8, 0x89, 0x11, 0xFF
vertex    -70,    101,    113,      0,      0,  0xAB, 0x16, 0x5B, 0xFF
vertex   -135,     70,     23,      0,      0,  0x84, 0x15, 0x10, 0xFF
vertex   -125,     38,    -45,      0,      0,  0x8D, 0xEC, 0xD1, 0xFF
vertex    -86,      1,    -60,      0,      0,  0xCE, 0x8C, 0xF6, 0xFF
vertex    -41,    144,     64,      0,      0,  0xDC, 0x79, 0x00, 0xFF
vertex    -76,     84,    -60,      0,      0,  0xD5, 0x6E, 0xD3, 0xFF
vertex    136,     70,     22,      0,      0,  0x7B, 0x16, 0x10, 0xFF
vertex     71,    101,    113,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex     96,     22,     45,      0,      0,  0x48, 0xA4, 0x31, 0xFF

mario_cap_unused_base_top_dl_vertex_group2: # 0x0401C0C0
vertex     42,    144,     64,      0,      0,  0x2B, 0x76, 0x0D, 0xFF
vertex    136,     70,     22,      0,      0,  0x7B, 0x16, 0x10, 0xFF
vertex     76,     84,    -60,      0,      0,  0x2A, 0x6C, 0xCF, 0xFF
vertex    103,     10,     -6,      0,      0,  0x42, 0x96, 0x12, 0xFF
vertex    126,     38,    -46,      0,      0,  0x73, 0xEC, 0xD0, 0xFF
vertex     71,    101,    113,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex     96,     22,     45,      0,      0,  0x48, 0xA4, 0x31, 0xFF
vertex     67,      2,    139,      0,      0,  0x50, 0xBA, 0x44, 0xFF
vertex     33,     17,    109,      0,      0,  0xFB, 0x84, 0xEA, 0xFF
vertex     33,     35,    118,      0,      0,  0x30, 0x26, 0x6E, 0xFF
vertex     86,      1,    -60,      0,      0,  0x20, 0x86, 0xFE, 0xFF
vertex      0,      0,    163,      0,      0,  0x00, 0xBA, 0x69, 0xFF
vertex    -31,     35,    118,      0,      0,  0xD0, 0x26, 0x6F, 0xFF
vertex     53,      0,   -118,      0,      0,  0x2C, 0xB5, 0xA5, 0xFF
vertex     49,     62,   -139,      0,      0,  0x32, 0x49, 0xA6, 0xFF

mario_cap_unused_base_top_dl_vertex_group3: # 0x0401C1B0
vertex    -76,     84,    -60,      0,      0,  0xD5, 0x6E, 0xD3, 0xFF
vertex    -41,    144,     64,      0,      0,  0xDC, 0x79, 0x00, 0xFF
vertex     76,     84,    -60,      0,      0,  0x2A, 0x6C, 0xCF, 0xFF
vertex      0,    110,    143,      0,      0,  0x00, 0x34, 0x73, 0xFF
vertex     42,    144,     64,      0,      0,  0x2B, 0x76, 0x0D, 0xFF
vertex    -70,    101,    113,      0,      0,  0xAB, 0x16, 0x5B, 0xFF
vertex     71,    101,    113,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex     49,     62,   -139,      0,      0,  0x32, 0x49, 0xA6, 0xFF
vertex    126,     38,    -46,      0,      0,  0x73, 0xEC, 0xD0, 0xFF
vertex    -52,      0,   -118,      0,      0,  0xD2, 0x9D, 0xC1, 0xFF
vertex    -49,     62,   -138,      0,      0,  0xCE, 0x1A, 0x8F, 0xFF
vertex     53,      0,   -118,      0,      0,  0x2C, 0xB5, 0xA5, 0xFF
vertex   -125,     38,    -45,      0,      0,  0x8D, 0xEC, 0xD1, 0xFF
vertex     86,      1,    -60,      0,      0,  0x20, 0x86, 0xFE, 0xFF
vertex    -86,      1,    -60,      0,      0,  0xCE, 0x8C, 0xF6, 0xFF

mario_cap_unused_base_bottom_dl_vertex: # 0x0401C2A0
vertex     86,      1,    -60,      0,      0,  0x20, 0x86, 0xFE, 0xFF
vertex    -86,      1,    -60,      0,      0,  0xCE, 0x8C, 0xF6, 0xFF
vertex    -52,      0,   -118,      0,      0,  0xD2, 0x9D, 0xC1, 0xFF
vertex     33,     17,    109,      0,      0,  0xFB, 0x84, 0xEA, 0xFF
vertex    -32,     17,    109,      0,      0,  0x00, 0x83, 0xF0, 0xFF
vertex   -101,     10,     -7,      0,      0,  0xD8, 0x89, 0x11, 0xFF
vertex     96,     22,     45,      0,      0,  0x48, 0xA4, 0x31, 0xFF
vertex    103,     10,     -6,      0,      0,  0x42, 0x96, 0x12, 0xFF
vertex     53,      0,   -118,      0,      0,  0x2C, 0xB5, 0xA5, 0xFF

glabel mario_cap_unused_m_logo_dl # 0x0401C330 - 0x0401C368
gsSPVertex mario_cap_unused_m_logo_dl_vertex, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  2,  3,  0, 0x0
gsSP1Triangle  5,  6,  4, 0x0
gsSPEndDisplayList

glabel mario_cap_unused_base_top_dl # 0x0401C368 - 0x0401C4C8
gsSPVertex mario_cap_unused_base_top_dl_vertex_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  3,  1,  0, 0x0,  3,  5,  6, 0x0
gsSP2Triangles  3,  0,  5, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  6,  9, 10, 0x0,  8,  9,  6, 0x0
gsSP2Triangles 11,  8,  7, 0x0,  8, 12,  9, 0x0
gsSP2Triangles 12,  8, 11, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_cap_unused_base_top_dl_vertex_group2, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  5,  1,  0, 0x0
gsSP2Triangles  1,  6,  3, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9,  7,  6, 0x0, 10,  4,  3, 0x0
gsSP2Triangles  9, 11,  7, 0x0,  7, 11,  8, 0x0
gsSP2Triangles 12, 11,  9, 0x0, 13, 14,  4, 0x0
gsSPVertex mario_cap_unused_base_top_dl_vertex_group3, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  3,  1, 0x0,  1,  4,  2, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  0,  2,  7, 0x0
gsSP2Triangles  8,  7,  2, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 10,  9, 0x0,  7, 10,  0, 0x0
gsSP2Triangles 10,  7, 11, 0x0,  0, 10, 12, 0x0
gsSP2Triangles 11,  8, 13, 0x0, 14, 12,  9, 0x0
gsSPEndDisplayList

glabel mario_cap_unused_base_bottom_dl # 0x0401C4C8 - 0x0401C510
gsSPVertex mario_cap_unused_base_bottom_dl_vertex, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  6,  5, 0x0
gsSP2Triangles  0,  7,  5, 0x0,  0,  5,  1, 0x0
gsSP1Triangle  2,  8,  0, 0x0
gsSPEndDisplayList

glabel mario_cap_unused_base_dl # 0x0401C510 - 0x0401C538
gsSPDisplayList mario_cap_unused_base_top_dl
gsSPLight mario_diff_light_group6, 1
gsSPLight mario_amb_light_group6, 2
gsSPDisplayList mario_cap_unused_base_bottom_dl
gsSPEndDisplayList

mario_wings_half_1_unused_dl_vertex: # 0x0401C538
vertex    199,    247,    -55,    990,      0,  0x59, 0xED, 0x58, 0xFF
vertex    131,    274,     20,      0,      0,  0x59, 0xED, 0x58, 0xFF
vertex     69,     71,     38,      0,   2012,  0x59, 0xED, 0x58, 0xFF
vertex    199,    247,    -55,    990,      0,  0x58, 0xEE, 0x58, 0xFF
vertex     69,     71,     38,      0,   2012,  0x58, 0xEE, 0x58, 0xFF
vertex    138,     44,    -37,    990,   2012,  0x58, 0xEE, 0x58, 0xFF
vertex   -137,     44,    -37,    990,   2012,  0xA8, 0xEE, 0x58, 0xFF
vertex    -68,     71,     38,      0,   2012,  0xA8, 0xEE, 0x58, 0xFF
vertex   -198,    247,    -55,    990,      0,  0xA8, 0xEE, 0x58, 0xFF
vertex    -68,     71,     38,      0,   2012,  0xA7, 0xED, 0x58, 0xFF
vertex   -130,    274,     20,      0,      0,  0xA7, 0xED, 0x58, 0xFF
vertex   -198,    247,    -55,    990,      0,  0xA7, 0xED, 0x58, 0xFF

mario_wings_half_2_unused_dl_vertex: # 0x0401C5F8
vertex    268,    219,   -132,    990,      0,  0x59, 0xED, 0x57, 0xFF
vertex    199,    247,    -55,      0,      0,  0x59, 0xED, 0x57, 0xFF
vertex    138,     44,    -37,      0,   2012,  0x59, 0xED, 0x57, 0xFF
vertex    207,     16,   -114,    990,   2012,  0x59, 0xED, 0x57, 0xFF
vertex   -206,     16,   -114,    990,   2012,  0xA7, 0xED, 0x57, 0xFF
vertex   -137,     44,    -37,      0,   2012,  0xA7, 0xED, 0x57, 0xFF
vertex   -267,    219,   -132,    990,      0,  0xA7, 0xED, 0x57, 0xFF
vertex   -198,    247,    -55,      0,      0,  0xA7, 0xED, 0x57, 0xFF

glabel mario_wings_half_1_unused_dl # 0x0401C678 - 0x0401C6A8
gsSPVertex mario_wings_half_1_unused_dl_vertex, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel mario_wings_half_2_unused_dl # 0x0401C6A8 - 0x0401C6D8
gsSPVertex mario_wings_half_2_unused_dl_vertex, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSPEndDisplayList

glabel mario_cap_wings_unused_intial_dl # 0x0401C6D8 - 0x0401C730
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPEndDisplayList

glabel mario_cap_wings_unused_end_dl # 0x0401C730 - 0x0401C758
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

glabel mario_cap_unused_dl # 0x0401C758 - 0x0401C7E8 # Unreferenced, possibly a early duplicate of the cap object used in segment 03
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_m_logo
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_diff_light_group2, 1
gsSPLight mario_amb_light_group2, 2
gsSPDisplayList mario_cap_unused_m_logo_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList mario_cap_unused_base_dl
gsSPEndDisplayList

glabel mario_metal_cap_unused_dl # 0x0401C7E8 - 0x0401C890 # Unreferenced, possibly an early duplicate of the cap object used in segment 03
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsSPDisplayList mario_cap_unused_m_logo_dl
gsSPDisplayList mario_cap_unused_base_top_dl
gsSPDisplayList mario_cap_unused_base_bottom_dl
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsSPEndDisplayList

glabel mario_cap_wings_unused # 0x0401C890 - 0x0401C8E8 # Unreferenced, unused like the duplicated cap, same case
gsSPDisplayList mario_cap_wings_unused_intial_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_1_unused_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_2_unused_dl
gsSPDisplayList mario_cap_wings_unused_end_dl
gsSPEndDisplayList

glabel mario_metal_cap_wings_unused # 0x0401C8E8 - 0x0401C940 # Unreferenced, unused like the duplicated cap, same case
gsSPDisplayList mario_cap_wings_unused_intial_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_1_unused_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_2_unused_dl
gsSPDisplayList mario_cap_wings_unused_end_dl
gsSPEndDisplayList

mario_wings_half_1_dl_vertex: # 0x0401C940
vertex   -105,    212,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -105,      0,      0,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex      0,      0,      0,    990,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    212,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF

mario_wings_half_2_dl_vertex: # 0x0401C980
vertex      0,      0,      0,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    106,    212,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    212,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    106,      0,      0,    990,   2012,  0x00, 0x00, 0x7F, 0xFF

glabel mario_wings_half_1_dl # 0x0401C9C0 - 0x0401C9E0
gsSPVertex mario_wings_half_1_dl_vertex, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel mario_wings_half_2_dl # 0x0401C9E0 - 0x0401CA00
gsSPVertex mario_wings_half_2_dl_vertex, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel mario_cap_wings # 0x0401CA00 - 0x0401CAB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_1_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_2_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

glabel mario_cap_wings_transparent # 0x0401CAB8 - 0x0401CB70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_1_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_2_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

glabel mario_metal_cap_wings # 0x0401CB70 - 0x0401CC28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPLight mario_diff_light_group3, 1
gsSPLight mario_amb_light_group3, 2
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_1_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_2_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

glabel mario_metal_cap_wings_transparent # 0x0401CC28 - 0x0401CD20
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsSPTexture 3968, 1984, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_1
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_1_dl
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal_wings_half_2
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_wings_half_2_dl
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN | G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_texture_metal
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPEndDisplayList
