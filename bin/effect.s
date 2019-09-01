.section .rodata
.include "macros.inc"
.include "PR/gbi.inc"

.word 0
.word 0 # Hmm...

# Flower (Unused)

effect_0B000008: # 0x0B000008
.incbin "textures/effect/flower.00008.rgba16"

effect_0B000808: # 0x0B000808
.incbin "textures/effect/flower.00808.rgba16"

effect_0B001008: # 0x0B001008
.incbin "textures/effect/flower.01008.rgba16"

effect_0B001808: # 0x0B001808
.incbin "textures/effect/flower.01808.rgba16"

glabel flower_bubbles_textures_ptr_0B002008 # 0x0B002008
.word effect_0B000008
.word effect_0B000808
.word effect_0B001008
.word effect_0B001808
.word effect_0B001008
.word effect_0B000808

# Lava Bubble

effect_0B002020: # 0x0B002020
.incbin "textures/effect/lava_bubble.02020.rgba16"

effect_0B002820: # 0x0B002820
.incbin "textures/effect/lava_bubble.02820.rgba16"

effect_0B003020: # 0x0B003020
.incbin "textures/effect/lava_bubble.03020.rgba16"

effect_0B003820: # 0x0B003820
.incbin "textures/effect/lava_bubble.03820.rgba16"

effect_0B004020: # 0x0B004020
.incbin "textures/effect/lava_bubble.04020.rgba16"

effect_0B004820: # 0x0B004820
.incbin "textures/effect/lava_bubble.04820.rgba16"

effect_0B005020: # 0x0B005020
.incbin "textures/effect/lava_bubble.05020.rgba16"

effect_0B005820: # 0x0B005820
.incbin "textures/effect/lava_bubble.05820.rgba16"

glabel lava_bubble_ptr_0B006020 # 0x0B006020
.word effect_0B002020
.word effect_0B002820
.word effect_0B003020
.word effect_0B003020
.word effect_0B003020
.word effect_0B003820
.word effect_0B004020
.word effect_0B004820
.word effect_0B005020
.word effect_0B005820

# Bubble

effect_0B006048: # 0x0B006048
.incbin "textures/effect/bubble.06048.rgba16"

glabel bubble_ptr_0B006848 # 0x0B006848
.word effect_0B006048

# Tiny Bubble

effect_0B00684C: # 0x0B00684C
.incbin "textures/effect/tiny_bubble.0684C.rgba16"

.word 0 # align?
glabel tiny_bubble_dl_0B006A50 # 0x0B006A50 - 0x0B006AB0
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK | G_SHADING_SMOOTH
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2
# It could also be one of these: 
# G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_RA_ZB_OPA_SURF2;
# G_RM_AA_ZB_TEX_EDGE, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_RA_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_AA_TEX_EDGE2;
# G_RM_AA_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_AA_TEX_EDGE, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_TEX_EDGE, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2

gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, effect_0B00684C
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPEndDisplayList

glabel tiny_bubble_dl_0B006AB0 # 0x0B006AB0 - 0x0B006AD8
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2 
# It could also be one of these: 
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

effect_0B006AD8: # 0x0B006AD8
.incbin "textures/effect/tiny_bubble.06AD8.rgba16"

glabel tiny_bubble_dl_0B006CD8 # 0x0B006CD8 - 0x0B006D38
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, effect_0B006AD8
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2
# It could also be one of these: 
# G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_RA_ZB_OPA_SURF2;
# G_RM_AA_ZB_TEX_EDGE, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_RA_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_AA_TEX_EDGE2;
# G_RM_AA_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_AA_TEX_EDGE, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_TEX_EDGE, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2

gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPEndDisplayList

glabel tiny_bubble_dl_0B006D38 # 0x0B006D38 - 0x0B006D68
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2
# It could also be one of these: 
# G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_RA_ZB_OPA_SURF2;
# G_RM_AA_ZB_TEX_EDGE, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_RA_OPA_SURF2; G_RM_AA_ZB_TEX_EDGE, G_RM_AA_TEX_EDGE2;
# G_RM_AA_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_TEX_EDGE2; G_RM_AA_TEX_EDGE, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_TEX_EDGE, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2

gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel tiny_bubble_dl_0B006D68 # 0x0B006D68 - 0x0B006D98
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList
