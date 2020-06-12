#ifndef GD_DRAW_OBJECTS_H
#define GD_DRAW_OBJECTS_H

#include <PR/ultratypes.h>

#include "gd_types.h"
#include "macros.h"

// data
extern struct ObjCamera *gViewUpdateCamera;

// bss
// this is unused, but it needs to be declared before gGdLightGroup
extern u8 gUnref_801B9B30[0x88];
extern struct ObjGroup *gGdLightGroup;  // ObjGroup* of ObjLights

// functions
void draw_light(struct ObjLight *light);
void draw_material(struct ObjMaterial *mtl);
struct GdColour *gd_get_colour(s32 idx);
void draw_face(struct ObjFace *face);
void draw_label(struct ObjLabel *label);
void draw_net(struct ObjNet *self);
void draw_gadget(struct ObjGadget *gdgt);
void draw_camera(struct ObjCamera *cam);
void func_80179B9C(struct GdVec3f *pos, struct ObjCamera *cam, struct ObjView *view);
void nop_obj_draw(UNUSED struct GdObj *nop);
void draw_particle(struct GdObj *obj);
void draw_bone(struct GdObj *obj);
void draw_joint(struct GdObj *obj);
void draw_group(struct ObjGroup *grp);
void draw_plane(struct GdObj *obj);
void apply_obj_draw_fn(struct GdObj *obj);
void create_gddl_for_shapes(struct ObjGroup *grp);
void map_face_materials(struct ObjGroup *faces, struct ObjGroup *mtls);
void map_vertices(struct ObjGroup *facegrp, struct ObjGroup *vtxgrp);
void update_view(struct ObjView *view);

#endif // GD_DRAW_OBJECTS_H
