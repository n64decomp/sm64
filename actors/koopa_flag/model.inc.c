// Koopa Flag

// 0x06000000
static const Ambient koopa_flag_seg6_light_06000000 = {
    {{0x00, 0x1b, 0x00}, 0, {0x00, 0x1b, 0x00}, 0}
};

// 0x06000008
static const Light koopa_flag_seg6_light_06000008 = {
    {{0x00, 0x6e, 0x00}, 0, {0x00, 0x6e, 0x00}, 0, {0x28, 0x28, 0x28}, 0}
};

// 0x06000018
static const Ambient koopa_flag_seg6_light_06000018 = {
    {{0x3f, 0x39, 0x15}, 0, {0x3f, 0x39, 0x15}, 0}
};

// 0x06000020
static const Light koopa_flag_seg6_light_06000020 = {
    {{0xff, 0xe6, 0x57}, 0, {0xff, 0xe6, 0x57}, 0, {0x28, 0x28, 0x28}, 0}
};

// 0x06000030
static const Ambient koopa_flag_seg6_light_06000030 = {
    {{0x2b, 0x15, 0x01}, 0, {0x2b, 0x15, 0x01}, 0}
};

// 0x06000038
static const Light koopa_flag_seg6_light_06000038 = {
    {{0xac, 0x54, 0x05}, 0, {0xac, 0x54, 0x05}, 0, {0x28, 0x28, 0x28}, 0}
};

// 0x06000048
ALIGNED8 static const u8 koopa_flag_seg6_texture_06000048[] = {
#include "actors/koopa_flag/koopa_flag_banner.rgba16.inc.c"
};

// 0x06000848
static const Ambient koopa_flag_seg6_light_06000848 = {
    {{0x37, 0x27, 0x07}, 0, {0x37, 0x27, 0x07}, 0}
};

// 0x06000850
static const Light koopa_flag_seg6_light_06000850 = {
    {{0xdf, 0x9f, 0x1f}, 0, {0xdf, 0x9f, 0x1f}, 0, {0x28, 0x28, 0x28}, 0}
};

// 0x06000860
static const Ambient koopa_flag_seg6_light_06000860 = {
    {{0x14, 0x0a, 0x00}, 0, {0x14, 0x0a, 0x00}, 0}
};

// 0x06000868
static const Light koopa_flag_seg6_light_06000868 = {
    {{0x50, 0x28, 0x00}, 0, {0x50, 0x28, 0x00}, 0, {0x28, 0x28, 0x28}, 0}
};

// 0x06000878
static const Vtx koopa_flag_seg6_vertex_06000878[] = {
    {{{  2800,    -18,     57}, 0, {     0,      0}, {0x5f, 0xe7, 0x4f, 0xff}}},
    {{{  2800,    -59,      0}, 0, {     0,      0}, {0x2d, 0x8a, 0x00, 0xff}}},
    {{{  2800,    -18,    -56}, 0, {     0,      0}, {0x4d, 0xe1, 0xa1, 0xff}}},
    {{{  2800,     49,    -34}, 0, {     0,      0}, {0x4d, 0x51, 0xc5, 0xff}}},
    {{{  2800,     49,     35}, 0, {     0,      0}, {0x2d, 0x60, 0x45, 0xff}}},
};

// 0x060008C8
static const Vtx koopa_flag_seg6_vertex_060008C8[] = {
    {{{  2800,    -18,     57}, 0, {     0,      0}, {0x5f, 0xe7, 0x4f, 0xff}}},
    {{{  2800,     49,     35}, 0, {     0,      0}, {0x2d, 0x60, 0x45, 0xff}}},
    {{{     0,     19,     57}, 0, {     0,      0}, {0x00, 0x27, 0x78, 0xff}}},
    {{{     0,    -48,     35}, 0, {     0,      0}, {0x00, 0x9a, 0x4a, 0xff}}},
    {{{     0,     60,      0}, 0, {     0,      0}, {0x00, 0x7e, 0x00, 0xff}}},
    {{{  2800,    -59,      0}, 0, {     0,      0}, {0x2d, 0x8a, 0x00, 0xff}}},
    {{{     0,    -48,    -34}, 0, {     0,      0}, {0x00, 0x9a, 0xb6, 0xff}}},
    {{{  2800,    -18,    -56}, 0, {     0,      0}, {0x4d, 0xe1, 0xa1, 0xff}}},
    {{{     0,     19,    -56}, 0, {     0,      0}, {0x00, 0x27, 0x88, 0xff}}},
    {{{  2800,     49,    -34}, 0, {     0,      0}, {0x4d, 0x51, 0xc5, 0xff}}},
};

// 0x06000968 - 0x06000A08
const Gfx koopa_flag_seg6_dl_06000968[] = {
    gsSPLight(&koopa_flag_seg6_light_06000850, 1),
    gsSPLight(&koopa_flag_seg6_light_06000848, 2),
    gsSPVertex(koopa_flag_seg6_vertex_06000878, 5, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  0, 0x0),
    gsSP1Triangle( 3,  0,  2, 0x0),
    gsSPLight(&koopa_flag_seg6_light_06000868, 1),
    gsSPLight(&koopa_flag_seg6_light_06000860, 2),
    gsSPVertex(koopa_flag_seg6_vertex_060008C8, 10, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  2,  3,  0, 0x0),
    gsSP2Triangles( 4,  2,  1, 0x0,  5,  0,  3, 0x0),
    gsSP2Triangles( 3,  6,  5, 0x0,  7,  5,  6, 0x0),
    gsSP2Triangles( 6,  8,  7, 0x0,  9,  7,  8, 0x0),
    gsSP2Triangles( 8,  4,  9, 0x0,  1,  9,  4, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000A08 - 0x06000A38
const Gfx koopa_flag_seg6_dl_06000A08[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPDisplayList(koopa_flag_seg6_dl_06000968),
    gsSPEndDisplayList(),
};

// 0x06000A38
static const Vtx koopa_flag_seg6_vertex_06000A38[] = {
    {{{     0,      0,      0}, 0, {  -226,    510}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   460,      0,    540}, 0, {   224,   1318}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   460,      0,   -539}, 0, {   224,   -302}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x06000A68
static const Vtx koopa_flag_seg6_vertex_06000A68[] = {
    {{{     0,      0,    720}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{   460,      0,    540}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{     0,      0,      0}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{   460,      0,   -539}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{     0,      0,   -719}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
};

// 0x06000AB8 - 0x06000AE8
const Gfx koopa_flag_seg6_dl_06000AB8[] = {
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, koopa_flag_seg6_texture_06000048),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(koopa_flag_seg6_vertex_06000A38, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000AE8 - 0x06000B08
const Gfx koopa_flag_seg6_dl_06000AE8[] = {
    gsSPVertex(koopa_flag_seg6_vertex_06000A68, 5, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  2, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000B08 - 0x06000B80
const Gfx koopa_flag_seg6_dl_06000B08[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGB, G_CC_DECALRGB),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(koopa_flag_seg6_dl_06000AB8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPDisplayList(koopa_flag_seg6_dl_06000AE8),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
};

// 0x06000B80
static const Vtx koopa_flag_seg6_vertex_06000B80[] = {
    {{{     0,      0,    540}, 0, {   224,   1318}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   460,      0,    360}, 0, {   676,   1048}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   460,      0,   -359}, 0, {   676,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,   -539}, 0, {   224,   -302}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x06000BC0 - 0x06000BF8
const Gfx koopa_flag_seg6_dl_06000BC0[] = {
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, koopa_flag_seg6_texture_06000048),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(koopa_flag_seg6_vertex_06000B80, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000BF8 - 0x06000C68
const Gfx koopa_flag_seg6_dl_06000BF8[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGB, G_CC_DECALRGB),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(koopa_flag_seg6_dl_06000BC0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
};

// 0x06000C68
static const Vtx koopa_flag_seg6_vertex_06000C68[] = {
    {{{   344,      0,    224}, 0, {  1014,    846}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   344,      0,   -223}, 0, {  1014,    172}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,    360}, 0, {   676,   1048}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,   -359}, 0, {   676,      0}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x06000CA8 - 0x06000CE0
const Gfx koopa_flag_seg6_dl_06000CA8[] = {
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, koopa_flag_seg6_texture_06000048),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(koopa_flag_seg6_vertex_06000C68, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000CE0 - 0x06000D50
const Gfx koopa_flag_seg6_dl_06000CE0[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGB, G_CC_DECALRGB),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(koopa_flag_seg6_dl_06000CA8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
};

// 0x06000D50
static const Vtx koopa_flag_seg6_vertex_06000D50[] = {
    {{{     0,      0,    224}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{   288,      0,    112}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{   288,      0,   -111}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{     0,      0,   -223}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
};

// 0x06000D90 - 0x06000DB0
const Gfx koopa_flag_seg6_dl_06000D90[] = {
    gsSPVertex(koopa_flag_seg6_vertex_06000D50, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000DB0 - 0x06000DF0
const Gfx koopa_flag_seg6_dl_06000DB0[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPDisplayList(koopa_flag_seg6_dl_06000D90),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
};

// 0x06000DF0
static const Vtx koopa_flag_seg6_vertex_06000DF0[] = {
    {{{     0,      0,    112}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{   288,      0,      0}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
    {{{     0,      0,   -111}, 0, {     0,      0}, {0xfd, 0xa8, 0x02, 0xff}}},
};

// 0x06000E20 - 0x06000E38
const Gfx koopa_flag_seg6_dl_06000E20[] = {
    gsSPVertex(koopa_flag_seg6_vertex_06000DF0, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPEndDisplayList(),
};

// 0x06000E38 - 0x06000E78
const Gfx koopa_flag_seg6_dl_06000E38[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPDisplayList(koopa_flag_seg6_dl_06000E20),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
};
