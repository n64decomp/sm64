#include <ultra64.h>

#include "sm64.h"
#include "obj_behaviors.h"
#include "rendering_graph_node.h"
#include "memory.h"
#include "engine/behavior_script.h"
#include "engine/surface_collision.h"
#include "engine/math_util.h"
#include "display.h"
#include "object_helpers.h"
#include "behavior_data.h"
#include "mario.h"
#include "game.h"
#include "camera.h"
#include "mario_actions_cutscene.h"
#include "object_list_processor.h"
#include "save_file.h"
#include "area.h"
#include "mario_misc.h"
#include "level_update.h"
#include "audio/external.h"
#include "behavior_actions.h"
#include "spawn_object.h"
#include "spawn_sound.h"
#include "room.h"
#include "envfx_bubbles.h"
#include "ingame_menu.h"
#include "interaction.h"

#define o gCurrentObject

#define OBJ_COL_FLAG_GROUNDED (1 << 0)
#define OBJ_COL_FLAG_HIT_WALL (1 << 1)
#define OBJ_COL_FLAG_UNDERWATER (1 << 2)
#define OBJ_COL_FLAG_NO_Y_VEL (1 << 3)
#define OBJ_COL_FLAGS_LANDED (OBJ_COL_FLAG_GROUNDED | OBJ_COL_FLAG_NO_Y_VEL)

struct Surface *D_803600E0;

/* DATA */
s8 D_80331500 = 1;
s16 D_80331504 = 0;
s8 D_80331508 = 0;
s8 D_8033150C = 0;
s8 D_80331510 = 0;

s32 count_objects_with_behavior(void *);

extern void *ccm_seg7_trajectory_snowman;
extern void *inside_castle_seg7_trajectory_mips;

void func_802E2F40(void) {
    D_80331508 = 0;
}

struct Struct802E2F58 *func_802E2F58(s32 arg0, struct Object *arg1, UNUSED s32 arg2) {
    struct Struct802E2F58 *sp34;
    Gfx *sp30;
    struct Object *sp2c;
    struct Object *sp28;
    UNUSED struct Object *sp24;
    UNUSED s32 sp20;

    sp34 = NULL;

    if (arg0 == 1) {
        sp2c = (struct Object *) gCurGraphNodeObject;
        sp28 = arg1;
        sp24 = arg1;
        if (gCurGraphNodeHeldObject != NULL) {
            sp2c = (struct Object *) gCurGraphNodeHeldObject->objNode;
        }

        sp34 = (struct Struct802E2F58 *) alloc_display_list(0x18);
        sp30 = (Gfx *) sp34;
        sp28->header.gfx.node.flags =
            (sp28->header.gfx.node.flags & 0xFF) | 0x500; // sets bits 8, 10 and zeros upper byte

        gDPSetEnvColor(sp30++, 0xFF, 0xFF, 0xFF, sp2c->oOpacity);

        gSPEndDisplayList(sp30);
    }

    return sp34;
}

f32 absf_2(f32 f) {
    if (f < 0) {
        f *= -1.0f;
    }
    return f;
}

// f12 = objVelX
// f14 = objVelZ
// sp8 = nX
// spc = nY
// sp10 = nZ
// sp14 = objYawX

void TurnObjAwayFromSurface(f32 objVelX, f32 objVelZ, f32 nX, UNUSED f32 nY, f32 nZ, f32 *objYawX,
                            f32 *objYawZ) {
    *objYawX = (nZ * nZ - nX * nX) * objVelX / (nX * nX + nZ * nZ)
               - 2 * objVelZ * (nX * nZ) / (nX * nX + nZ * nZ);

    *objYawZ = (nX * nX - nZ * nZ) * objVelZ / (nX * nX + nZ * nZ)
               - 2 * objVelX * (nX * nZ) / (nX * nX + nZ * nZ);
}

// sp78 = objVelX
// sp7c = objVelZ
// sp70, f12 = objNewX
// sp74, f14 = objY
// sp80 = objNewZ
// sp38 = objVelXCopy
// sp34 = objVelZCopy

s32 ObjFindWall(f32 objNewX, f32 objY, f32 objNewZ, f32 objVelX, f32 objVelZ) {
    struct WallCollisionData hitbox;
    f32 wall_nX, wall_nY, wall_nZ, objVelXCopy, objVelZCopy, objYawX, objYawZ;

    hitbox.x = objNewX;
    hitbox.y = objY;
    hitbox.z = objNewZ;
    hitbox.offsetY = o->hitboxHeight / 2.0f;
    hitbox.radius = o->hitboxRadius;

    if (find_wall_collisions(&hitbox) != 0) {
        o->oPosX = hitbox.x;
        o->oPosY = hitbox.y;
        o->oPosZ = hitbox.z;
        wall_nX = hitbox.walls[0]->normal.x;
        wall_nY = hitbox.walls[0]->normal.y;
        wall_nZ = hitbox.walls[0]->normal.z;
        objVelXCopy = objVelX;
        objVelZCopy = objVelZ;
        TurnObjAwayFromSurface(objVelXCopy, objVelZCopy, wall_nX, wall_nY, wall_nZ, &objYawX, &objYawZ);
        o->oMoveAngleYaw = atan2s(objYawZ, objYawX);
        return 0;
    }

    return 1;
}

// sp48 = objFloor
// sp4c = floorY
// sp50 = objVelX
// sp54 = objVelZ
// sp38 = objVelXCopy
// sp34 = objVelZCopy

s32 TurnObjAwayFromAwkwardFloor(struct Surface *objFloor, f32 floorY, f32 objVelX, f32 objVelZ) {
    f32 floor_nX, floor_nY, floor_nZ, objVelXCopy, objVelZCopy, objYawX, objYawZ;

    if (objFloor == NULL) {
        //! TRUNC overflow exception after 36 minutes
        o->oMoveAngleYaw += 32767.999200000002; /* ¯\_(ツ)_/¯ */
        return 0;
    }

    floor_nX = objFloor->normal.x;
    floor_nY = objFloor->normal.y;
    floor_nZ = objFloor->normal.z;

    if (floor_nY < 0.5 && floorY > o->oPosY) {
        objVelXCopy = objVelX;
        objVelZCopy = objVelZ;
        TurnObjAwayFromSurface(objVelXCopy, objVelZCopy, floor_nX, floor_nY, floor_nZ, &objYawX,
                               &objYawZ);
        o->oMoveAngleYaw = atan2s(objYawZ, objYawX);
        return 0;
    }

    return 1;
}

// sp38 = obj
// sp3c = normalX
// sp40 = normalY
// sp44 = normalZ

void ObjOrientGraph(struct Object *obj, f32 normalX, f32 normalY, f32 normalZ) {
    Vec3f sp2c, sp20;

    f32(*throwMatrix)[4][4]; // TODO: use Mtx type

    if (D_80331500 == 0) {
        return;
    }
    if ((obj->header.gfx.node.flags & 0x4) != 0) {
        return; // bit 2
    }
    throwMatrix = (f32(*)[4][4]) alloc_display_list(0x40);
    if (throwMatrix == NULL) {
        return;
    }

    sp2c[0] = obj->oPosX;
    sp2c[1] = obj->oPosY + obj->oGraphYOffset;
    sp2c[2] = obj->oPosZ;

    sp20[0] = normalX;
    sp20[1] = normalY;
    sp20[2] = normalZ;

    mtxf_align_terrain_normal(*throwMatrix, sp20, sp2c, obj->oFaceAngleYaw);
    obj->header.gfx.throwMatrix = (void *) throwMatrix;
}

// sp4 = floor_nY

void CalcObjFriction(f32 *objFriction, f32 floor_nY) {
    if (floor_nY < 0.2 && o->oFriction < 0.9999) {
        *objFriction = 0;
    } else {
        *objFriction = o->oFriction;
    }
}

// sp28 = objFloor
// sp2c = objFloorY
// sp30 = objVelX
// sp34 = objVelZ
// sp24 = floor_nX
// sp20 = floor_nY
// sp1c = floor_nZ

void CalcNewObjVelAndPosY(struct Surface *objFloor, f32 objFloorY, f32 objVelX, f32 objVelZ) {
    f32 floor_nX = objFloor->normal.x;
    f32 floor_nY = objFloor->normal.y;
    f32 floor_nZ = objFloor->normal.z;
    f32 objFriction;

    o->oVelY -= o->oGravity;
    if (o->oVelY > 75.0) {
        o->oVelY = 75.0;
    }
    if (o->oVelY < -75.0) {
        o->oVelY = -75.0;
    }

    o->oPosY += o->oVelY;
    if (o->oPosY < objFloorY) {
        o->oPosY = objFloorY;
        if (o->oVelY < -17.5) {
            o->oVelY = -(o->oVelY / 2.0f);
        } else {
            o->oVelY = 0;
        }
    }

    //! potential TRUNC crash
    if ((s32) o->oPosY >= (s32) objFloorY && (s32) o->oPosY < (s32) objFloorY + 37) {
        ObjOrientGraph(o, floor_nX, floor_nY, floor_nZ);
        objVelX += floor_nX * (floor_nX * floor_nX + floor_nZ * floor_nZ)
                   / (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * o->oGravity
                   * 2;
        objVelZ += floor_nZ * (floor_nX * floor_nX + floor_nZ * floor_nZ)
                   / (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * o->oGravity
                   * 2;
        if (objVelX < 0.000001 && objVelX > -0.000001) {
            objVelX = 0;
        }
        if (objVelZ < 0.000001 && objVelZ > -0.000001) {
            objVelZ = 0;
        }

        if (objVelX != 0 || objVelZ != 0) {
            o->oMoveAngleYaw = atan2s(objVelZ, objVelX);
        }

        CalcObjFriction(&objFriction, floor_nY);
        o->oForwardVel = sqrtf(objVelX * objVelX + objVelZ * objVelZ) * objFriction;
    }
}

// sp28 = objFloor
// sp2c = floorY
// sp30 = objVelX
// sp34 = objVelZ
// sp38 = waterY
// sp24 = floor_nX
// sp20 = floor_nY
// sp1c = floor_nZ
// sp18 = netYAccel

void CalcNewObjVelAndPosYUnderwater(struct Surface *objFloor, f32 floorY, f32 objVelX, f32 objVelZ,
                                    f32 waterY) {
    f32 floor_nX = objFloor->normal.x;
    f32 floor_nY = objFloor->normal.y;
    f32 floor_nZ = objFloor->normal.z;

    f32 netYAccel = (1.0f - o->oBuoyancy) * (-1.0f * o->oGravity);
    o->oVelY -= netYAccel;
    if (o->oVelY > 75.0) {
        o->oVelY = 75.0;
    }
    if (o->oVelY < -75.0) {
        o->oVelY = -75.0;
    }

    o->oPosY += o->oVelY;
    if (o->oPosY < floorY) {
        o->oPosY = floorY;
        if (o->oVelY < -17.5) {
            o->oVelY = -(o->oVelY / 2);
        } else {
            o->oVelY = 0;
        }
    }

    if (o->oForwardVel > 12.5 && (waterY + 30.0f) > o->oPosY && waterY - 30.0f < o->oPosY) {
        o->oVelY = -o->oVelY;
    }

    if ((s32) o->oPosY >= (s32) floorY && (s32) o->oPosY < (s32) floorY + 37) {
        ObjOrientGraph(o, floor_nX, floor_nY, floor_nZ);
        objVelX += floor_nX * (floor_nX * floor_nX + floor_nZ * floor_nZ)
                   / (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * netYAccel * 2;
        objVelZ += floor_nZ * (floor_nX * floor_nX + floor_nZ * floor_nZ)
                   / (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * netYAccel * 2;
    }

    if (objVelX < 0.000001 && objVelX > -0.000001) {
        objVelX = 0;
    }
    if (objVelZ < 0.000001 && objVelZ > -0.000001) {
        objVelZ = 0;
    }

    if (o->oVelY < 0.000001 && o->oVelY > -0.000001) {
        o->oVelY = 0;
    }

    if (objVelX != 0 || objVelZ != 0) {
        o->oMoveAngleYaw = atan2s(objVelZ, objVelX);
    }
    o->oForwardVel = sqrtf(objVelX * objVelX + objVelZ * objVelZ) * 0.8;
    o->oVelY *= 0.8;
}

// sp4 = xVel
// sp0 = zVel

void ObjUpdatePosVelXZ(void) {
    f32 xVel = o->oForwardVel * sins(o->oMoveAngleYaw);
    f32 zVel = o->oForwardVel * coss(o->oMoveAngleYaw);

    o->oPosX += xVel;
    o->oPosZ += zVel;
}

// sp20 = waterY
// sp24 = objY
// sp1c = globalTimer

void ObjSplash(s32 waterY, s32 objY) {
    u32 globalTimer = gGlobalTimer;
    if ((f32)(waterY + 30) > o->oPosY && o->oPosY > (f32)(waterY - 30)) {
        spawn_object(o, MODEL_WATER_WAVES_SURF, bhvObjectWaterWave);
        if (o->oVelY < -20.0f) {
            PlaySound2(SOUND_OBJECT_DIVINGINTOWATER);
        }
    }
    if ((objY + 50) < waterY && (globalTimer & 0x1F) == 0) {
        spawn_object(o, MODEL_WHITE_PARTICLE_SMALL, bhvObjectBubble); /* 0x1F is bits 4-0 */
    }
}

// sp3c = objX
// sp38 = objY
// sp34 = objZ
// sp28 = objVelX
// sp24 = objVelZ
// sp30 = floorY
// sp2c = waterY
// sp22 = collisionFlags

s32 ObjectStep(void) {
    f32 objX = o->oPosX;
    f32 objY = o->oPosY;
    f32 objZ = o->oPosZ;
    f32 floorY;
    f32 waterY = -10000.0;
    f32 objVelX = o->oForwardVel * sins(o->oMoveAngleYaw);
    f32 objVelZ = o->oForwardVel * coss(o->oMoveAngleYaw);
    s16 collisionFlags = 0;

    if (ObjFindWall(objX + objVelX, objY, objZ + objVelZ, objVelX, objVelZ) == 0) {
        collisionFlags += OBJ_COL_FLAG_HIT_WALL;
    }
    floorY = find_floor(objX + objVelX, objY, objZ + objVelZ, &D_803600E0);
    if (TurnObjAwayFromAwkwardFloor(D_803600E0, floorY, objVelX, objVelZ) == 1) {
        waterY = find_water_level(objX + objVelX, objZ + objVelZ);
        if (waterY > objY) {
            CalcNewObjVelAndPosYUnderwater(D_803600E0, floorY, objVelX, objVelZ, waterY);
            collisionFlags += OBJ_COL_FLAG_UNDERWATER;
        } else {
            CalcNewObjVelAndPosY(D_803600E0, floorY, objVelX, objVelZ);
        }
    } else {
        collisionFlags +=
            ((collisionFlags & OBJ_COL_FLAG_HIT_WALL) ^ OBJ_COL_FLAG_HIT_WALL); /* bit 1 = 1 */
    }
    ObjUpdatePosVelXZ();
    if ((s32) o->oPosY == (s32) floorY) {
        collisionFlags += OBJ_COL_FLAG_GROUNDED;
    }
    if ((s32) o->oVelY == 0) {
        collisionFlags += OBJ_COL_FLAG_NO_Y_VEL;
    }

    ObjSplash((s32) waterY, (s32) o->oPosY);
    return collisionFlags;
}

// sp1e = collisionFlags

s32 func_802E4204(void) {
#ifdef VERSION_EU
    s32 collisionFlags = 0;
#else
    s16 collisionFlags = 0;
#endif
    D_80331500 = 0;
    collisionFlags = ObjectStep();
    D_80331500 = 1;

    return collisionFlags;
}

/**
    Uses an object's forward velocity and yaw to move its X, Y, and Z positions.
    This does accept an object as an argument, though it is always called with `o`.
    If it wasn't called with `o`, it would modify `o`'s X and Z velocities based on
    `obj`'s forward velocity and yaw instead of `o`'s, and wouldn't update `o`'s
    position.
*/
void obj_move_xyz_using_fvel_and_yaw(struct Object *obj) {
    o->oVelX = obj->oForwardVel * sins(obj->oMoveAngleYaw);
    o->oVelZ = obj->oForwardVel * coss(obj->oMoveAngleYaw);

    obj->oPosX += o->oVelX;
    obj->oPosY += obj->oVelY;
    obj->oPosZ += o->oVelZ;
}

// sp18 = arg2

s32 is_point_within_radius_of_mario(f32 x, f32 y, f32 z, s32 dist) {
    f32 mGfxX = gMarioObject->header.gfx.pos[0];
    f32 mGfxY = gMarioObject->header.gfx.pos[1];
    f32 mGfxZ = gMarioObject->header.gfx.pos[2];

    if ((x - mGfxX) * (x - mGfxX) + (y - mGfxY) * (y - mGfxY) + (z - mGfxZ) * (z - mGfxZ)
        < (f32)(dist * dist)) {
        return 1;
    }

    return 0;
}

// sp14 = x
// sp18 = y
// sp1c = z
// spc = objX
// sp8 = objY
// sp4 = objZ

s32 IsPointCloseToObject(struct Object *obj, f32 x, f32 y, f32 z, s32 dist) {
    f32 objX = obj->oPosX;
    f32 objY = obj->oPosY;
    f32 objZ = obj->oPosZ;

    if ((x - objX) * (x - objX) + (y - objY) * (y - objY) + (z - objZ) * (z - objZ)
        < (f32)(dist * dist)) {
        return 1;
    }

    return 0;
}

// sp28 = obj
// sp2c = arg1
// sp24 = objX
// sp20 = objY
// sp1c = objZ

void SetObjectVisibility(struct Object *obj, s32 arg1) {
    f32 objX = obj->oPosX;
    f32 objY = obj->oPosY;
    f32 objZ = obj->oPosZ;

    if (is_point_within_radius_of_mario(objX, objY, objZ, arg1) == 1) {
        obj->header.gfx.node.flags &= ~0x10; /* bit 4 = 0 */
    } else {
        obj->header.gfx.node.flags |= 0x10; /* bit 4 = 1 */
    }
}

// sp28 = obj
// sp2c = homeX
// sp30 = y
// sp34 = homeZ

s32 ObjLeaveIfMarioIsNearHome(struct Object *obj, f32 homeX, f32 y, f32 homeZ, s32 dist) {
    f32 homeDistX = homeX - obj->oPosX;
    f32 homeDistZ = homeZ - obj->oPosZ;
    s16 angleAwayFromHome = atan2s(homeDistZ, homeDistX);

    if (is_point_within_radius_of_mario(homeX, y, homeZ, dist) == 1) {
        return 1;
    } else {
        obj->oMoveAngleYaw = approach_s16_symmetric(obj->oMoveAngleYaw, angleAwayFromHome, 320);
    }

    return 0;
}

// sp28 = obj
// sp2c = homeX
// sp30 = homeY
// sp34 = homeZ

void ObjDisplaceHome(struct Object *obj, f32 homeX, UNUSED f32 homeY, f32 homeZ, s32 baseDisp) {
    s16 angleToNewHome;
    f32 homeDistX, homeDistZ;

    if ((s32)(RandomFloat() * 50.0f) == 0) {
        obj->oHomeX = (f32)(baseDisp * 2) * RandomFloat() - (f32) baseDisp + homeX;
        obj->oHomeZ = (f32)(baseDisp * 2) * RandomFloat() - (f32) baseDisp + homeZ;
    }

    homeDistX = obj->oHomeX - obj->oPosX;
    homeDistZ = obj->oHomeZ - obj->oPosZ;
    angleToNewHome = atan2s(homeDistZ, homeDistX);
    obj->oMoveAngleYaw = approach_s16_symmetric(obj->oMoveAngleYaw, angleToNewHome, 320);
}

s32 func_802E46C0(u32 arg0, u32 arg1, s16 arg2) {
    s16 sp6 = (u16) arg1 - (u16) arg0;

    if (((f32) sins(-arg2) < (f32) sins(sp6)) && ((f32) sins(sp6) < (f32) sins(arg2))
        && (coss(sp6) > 0)) {
        return 1;
    }

    return 0;
}

// sp60= arg0
// sp64 = x
// sp68 = y
// sp6c = z
// sp38 = hitbox

s32 func_802E478C(Vec3f dist, f32 x, f32 y, f32 z, f32 arg4) {
    struct WallCollisionData hitbox;
    UNUSED u8 filler[0x20];

    hitbox.x = x;
    hitbox.y = y;
    hitbox.z = z;
    hitbox.offsetY = 10.0f;
    hitbox.radius = arg4;
    if (find_wall_collisions(&hitbox) != 0) {
        dist[0] = hitbox.x - x;
        dist[1] = hitbox.y - y;
        dist[2] = hitbox.z - z;
        return 1;
    } else {
        return 0;
    }
}

// sp20 = obj
// sp24 = nCoins

void ObjSpawnYellowCoins(struct Object *obj, s8 nCoins) {
    struct Object *coin;
    s8 count;

    for (count = 0; count < nCoins; count++) {
        coin = spawn_object(obj, MODEL_YELLOW_COIN, bhvMovingYellowCoin);
        coin->oForwardVel = RandomFloat() * 20;
        coin->oVelY = RandomFloat() * 40 + 20;
        coin->oMoveAngleYaw = RandomU16();
    }
}

s32 ObjFlickerAndDisappear(struct Object *obj, s16 arg1) {
    if (obj->oTimer < arg1) {
        return 0;
    }
    if (obj->oTimer < arg1 + 40) {
        if (obj->oTimer % 2 != 0) {
            obj->header.gfx.node.flags |= 0x10; /* bit 4 = 1 */
        } else {
            obj->header.gfx.node.flags &= ~0x10; /* bit 4 = 0 */
        }
    } else {
        obj->activeFlags = 0;
        return 1;
    }

    return 0;
}

s8 func_802E49A4(s16 arg0) {
    s16 sp6;

    if (gMarioCurrentRoom == 0) {
        if (arg0 == D_80331504) {
            return 1;
        } else {
            return 0;
        }
    } else {
        if (arg0 == gMarioCurrentRoom) {
            sp6 = 1;
        } else {
            sp6 = 0;
        }

        D_80331504 = gMarioCurrentRoom;
    }

    return sp6;
}

// sp20 = arg0
// sp24 = arg1
// sp28 = arg2
// sp2c = arg3

s16 func_802E4A38(s32 *arg0, s16 arg1, f32 arg2, s32 arg3) {
    s16 sp1e;

    if ((is_point_within_radius_of_mario(o->oPosX, o->oPosY, o->oPosZ, (s32) arg2) == 1
         && func_802E46C0(o->oFaceAngleYaw, gMarioObject->header.gfx.angle[1] + 0x8000, 0x1000) == 1
         && func_802E46C0(o->oMoveAngleYaw, o->oAngleToMario, 0x1000) == 1)
        || (*arg0 == 1)) {
        *arg0 = 1;
        if (set_mario_npc_dialog(arg3) == 2) {
            sp1e = func_8028F8E0(162, o, arg1);
            if (sp1e != 0) {
                set_mario_npc_dialog(0);
                *arg0 = 0;
                return sp1e;
            }
            return 0;
        }
    }

    return 0;
}

void ObjCheckFloorDeath(s16 collisionFlags, struct Surface *floor) {
    if (floor == NULL) {
        return;
    }

    if ((collisionFlags & 0x1) == 1) /* bit 0 */
    {
        switch (floor->type) {
            case SURFACE_BURNING:
                o->oAction = OBJ_ACT_LAVA_DEATH;
                break;
            case SURFACE_DEATH_PLANE:
                o->oAction = OBJ_ACT_DEATH_PLANE_DEATH;
                break;
            default:
                break;
        }
    }
}

// sp10 = arg0

s32 ObjLavaDeath(void) {
    struct Object *deathSmoke;

    if (o->oTimer >= 31) {
        o->activeFlags = 0;
        return 1;
    } else {
        o->oPosY -= 10.0f;
    }

    if ((o->oTimer % 8) == 0) {
        PlaySound2(SOUND_OBJECT_BULLYEXPLODE_2);
        deathSmoke = spawn_object(o, MODEL_SMOKE, bhvBobombBullyDeathSmoke);
        deathSmoke->oPosX += RandomFloat() * 20.0f;
        deathSmoke->oPosY += RandomFloat() * 20.0f;
        deathSmoke->oPosZ += RandomFloat() * 20.0f;
        deathSmoke->oForwardVel = RandomFloat() * 10.0f;
    }

    return 0;
}

// sp30 = arg0
// sp34 = arg1
// sp38 = arg2
// sp3c = arg3

void SpawnOrangeNumber(s8 arg0, s16 arg1, s16 arg2, s16 arg3) {
    struct Object *orangeNumber;

    if (arg0 >= 10) {
        return;
    }

    orangeNumber = spawn_object_relative(arg0, arg1, arg2, arg3, o, MODEL_NUMBER, bhvOrangeNumber);
    orangeNumber->oPosY += 25.0f;
}

s32 Unknown802E4DF4(s16 *arg0) {
    if (*(arg0 + D_8033150C) == 0) {
        D_8033150C = 0;
        return 1;
    }

    if ((*(arg0 + D_8033150C) & gPlayer3Controller->buttonPressed) != 0) {
        D_8033150C++;
        D_80331510 = 0;
    } else if (D_80331510 == 10 || gPlayer3Controller->buttonPressed != 0) {
        D_8033150C = 0;
        D_80331510 = 0;
        return 0;
    }
    D_80331510++;

    return 0;
}

#include "behaviors/moving_coin.inc.c"
#include "behaviors/seaweed.inc.c"
#include "behaviors/bobomb.inc.c"
#include "behaviors/cannon_door.inc.c"
#include "behaviors/whirlpool.inc.c"
#include "behaviors/amp.inc.c"
#include "behaviors/butterfly.inc.c"
#include "behaviors/hoot.inc.c"
#include "behaviors/beta_holdable_object.inc.c"
#include "behaviors/bubble.inc.c"
#include "behaviors/water_wave.inc.c"
#include "behaviors/explosion.inc.c"
#include "behaviors/corkbox.inc.c"
#include "behaviors/bully.inc.c"
#include "behaviors/water_ring.inc.c"
#include "behaviors/bowser_bomb.inc.c"
#include "behaviors/celebration_star.inc.c"
#include "behaviors/drawbridge.inc.c"
#include "behaviors/bomp.inc.c"
#include "behaviors/sliding_platform.inc.c"
#include "behaviors/moneybag.inc.c"
#include "behaviors/bowling_ball.inc.c"
#include "behaviors/cruiser.inc.c"
#include "behaviors/spindel.inc.c"
#include "behaviors/pyramid_wall.inc.c"
#include "behaviors/pyramid_elevator.inc.c"
#include "behaviors/pyramid_top.inc.c"
#include "behaviors/sound_waterfall.inc.c"
#include "behaviors/sound_volcano.inc.c"
#include "behaviors/castle_flag.inc.c"
#include "behaviors/sound_birds.inc.c"
#include "behaviors/sound_ambient.inc.c"
#include "behaviors/sound_sand.inc.c"
#include "behaviors/castle_cannon_grate.inc.c"
#include "behaviors/snowman.inc.c"
#include "behaviors/boulder.inc.c"
#include "behaviors/cap.inc.c"
#include "behaviors/spawn_star.inc.c"
#include "behaviors/red_coin.inc.c"
#include "behaviors/hidden_star.inc.c"
#include "behaviors/rolling_log.inc.c"
#include "behaviors/mushroom_1up.inc.c"
#include "behaviors/controllable_platform.inc.c"
#include "behaviors/breakable_box_small.inc.c"
#include "behaviors/snow_mound.inc.c"
#include "behaviors/floating_platform.inc.c"
#include "behaviors/arrow_lift.inc.c"
#include "behaviors/orange_number.inc.c"
#include "behaviors/manta_ray.inc.c"
#include "behaviors/falling_pillar.inc.c"
#include "behaviors/floating_box.inc.c"
#include "behaviors/decorative_pendulum.inc.c"
#include "behaviors/treasure_chest.inc.c"
#include "behaviors/mips.inc.c"
#include "behaviors/yoshi.inc.c"
