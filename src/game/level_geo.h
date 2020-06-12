#ifndef LEVEL_GEO_H
#define LEVEL_GEO_H

#include <PR/ultratypes.h>
#include <PR/gbi.h>

struct Struct802761D0
{
    u16 unk0;
    s16 unk2;
    u8 filler4[0x18-0x4];
};

Gfx *geo_envfx_main(s32 callContext, struct GraphNode *node, Mat4 mtxf);
Gfx *geo_skybox_main(s32 callContext, struct GraphNode *node, UNUSED Mat4 *mtx);

#endif // LEVEL_GEO_H
