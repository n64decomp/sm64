#include <ultra64.h>

#define INCLUDED_FROM_CAMERA_C

#include "sm64.h"
#include "camera.h"
#include "seq_ids.h"
#include "dialog_ids.h"
#include "audio/external.h"
#include "mario_misc.h"
#include "game.h"
#include "hud.h"
#include "engine/math_util.h"
#include "area.h"
#include "engine/surface_collision.h"
#include "engine/behavior_script.h"
#include "level_update.h"
#include "ingame_menu.h"
#include "mario_actions_cutscene.h"
#include "save_file.h"
#include "room.h"
#include "object_helpers.h"
#include "object_helpers2.h"
#include "print.h"
#include "spawn_sound.h"
#include "behavior_actions.h"
#include "behavior_data.h"
#include "object_list_processor.h"
#include "paintings.h"
#include "prevent_bss_reordering.h"
#include "engine/graph_node.h"
#include "level_table.h"

#define CBUTTON_MASK (U_CBUTTONS | D_CBUTTONS | L_CBUTTONS | R_CBUTTONS)

// BSS
struct CameraPlayerStatus gPlayerStatusForCamera[2];
Vec3f sCameraPosition;
Vec3f sCameraFocus;
Vec3f D_8033B218;
s16 sCreditsCameraPitch;
s16 sCreditsCameraYaw;
u8 gFramesPaused;
struct Struct8033B230 D_8033B230;
struct TransitionCamera sCameraTransition;
struct PlayerGeometry sGeometryForMario;
s16 unused_8033B2AC;
s16 sCameraYawVelocity;
s16 sCameraYawAfterDoorCutscene;
s16 unused_spline_pitch;
s16 unused_spline_yaw;
struct Struct8033B2B8 sSplineParameters[4];
s16 sSplineParameterMax;
f32 sPositionAlongSpline;
f32 sSplinePositionLimit;
s16 sCameraCutscenePitchOffset;
s16 sCameraCutsceneYawOffset;
s16 sCameraCutsceneRollOffset;
u32 unused_8033B30C;
u32 unused_8033B310;
s16 gCameraModeFlags;
s16 unused_8033B316;
s16 sCameraSideCFlags;
s16 unused_8033B31A;
s16 gCameraFlags1;
u16 gCButtonsPressed;
s16 D_8033B320;
struct CameraState gCameraStatus;
s16 unused_8033B3E8;
s16 sYawFocToMario;
s16 D_8033B3EC;
s16 D_8033B3EE;
s16 D_8033B3F0;
f32 D_8033B3F4;
s16 sCSideButtonYaw;
s16 D_8033B3FA;
f32 D_8033B3FC;
s16 sFirstPersonCameraPitch;
s16 sFirstPersonCameraYaw;
s16 D_8033B404;
s16 sPlatformLevelPresetBaseYaw;
s16 gPlatformLevelYawOffset;
f32 D_8033B40C;
f32 D_8033B410;
struct Struct8033B418 D_8033B418;
Vec3f sFixedPresetBasePositionOffset;
u32 D_8033B46C;
struct ParallelTrackingTable *D_8033B470;
struct Struct8033B4B8 D_8033B478;
struct Struct8033B4B8 D_8033B498;
struct Struct8033B4B8 D_8033B4B8;
s16 gCameraMovementFlags;
s16 gCameraFlags2;
struct CutsceneSplinePoint D_8033B4E0[32];
struct CutsceneSplinePoint D_8033B5E0[32];

/**
 * The current segment of the CutsceneSplinePoint[] being used.
 */
s16 sCutsceneSplineSegment;

/**
 * The progress (from 0 to 1) through the current spline segment.
 * When it becomes >= 1, 1.0 is subtracted from it and sCutsceneSplineSegment is increased.
 */
f32 sCutsceneSplineSegmentProgress;
s16 D_8033B6E8;
s16 D_8033B6EA;
s16 gCutsceneTimer;
struct Struct8033B6F0 D_8033B6F0[10];
s32 gCutsceneActive;
u32 sCutscenePhase;
struct LevelCamera *gCurrLevelCamera;

// first iteration of data
u32 unused_8032CFC0 = 0; // unused
struct Object *gCutsceneFocus = NULL;
u32 unused_8032CFC8 = 0;
u32 unused_8032CFCC = 0;
struct Object *gSecondCameraFocus = NULL;
s16 D_8032CFD4 = 1024;
s32 gCurrLevelArea = 0;
u32 gPrevLevel = 0;
f32 D_8032CFE0 = 1000.0f; // unused
f32 D_8032CFE4 = 800.0f;  // unused
u32 D_8032CFE8 = 0;       // unused
f32 gCameraZoomDist = 800.0f;
u8 sTempCutsceneNumber = 0;
u8 gCutsceneNumber = 0;
u8 sCutsceneTransitionTimer = 0;
u8 D_8032CFFC = 0;
struct CameraPlayerStatus *sMarioStatusForCamera = &gPlayerStatusForCamera[0];
struct CameraPlayerStatus *sLuigiStatusForCamera = &gPlayerStatusForCamera[1];
u32 D_8032D008 = 0; // unused
Vec3f sFixedPresetBasePosition = { 646.0f, 143.0f, -1513.0f };
Vec3f D_8032D00C_2 = { 646.0f, 143.0f, -1513.0f }; // unused
Vec3f D_8032D00C_3 = { 646.0f, 143.0f, -1513.0f }; // unused
Vec3f D_8032D00C_4 = { 646.0f, 143.0f, -1513.0f }; // unused
Vec3f D_8032D00C_5 = { 646.0f, 143.0f, -1513.0f }; // unused

s32 return_open_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_reverse_tower_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_behind_mario_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_mario_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 unused_return_mode_5_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_first_person_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_mario_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 nop_return_water_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_slide_or_0f_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_cannon_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_boss_fight_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_parallel_tracking_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_fixed_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_platform_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_slide_or_0f_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_mario_yaw(struct LevelCamera *, Vec3f, Vec3f);
s32 return_spiral_stairs_camera_yaw(struct LevelCamera *, Vec3f, Vec3f);

s32 (*TableCameraTransitions[])(struct LevelCamera *, Vec3f,
                                Vec3f) = { NULL,
                                           return_open_camera_yaw,
                                           return_reverse_tower_camera_yaw,
                                           return_behind_mario_camera_yaw,
                                           return_mario_yaw,
                                           unused_return_mode_5_camera_yaw,
                                           return_first_person_camera_yaw,
                                           return_mario_yaw,
                                           nop_return_water_camera_yaw,
                                           return_slide_or_0f_camera_yaw,
                                           return_cannon_camera_yaw,
                                           return_boss_fight_camera_yaw,
                                           return_parallel_tracking_camera_yaw,
                                           return_fixed_camera_yaw,
                                           return_platform_camera_yaw,
                                           return_slide_or_0f_camera_yaw,
                                           return_mario_yaw,
                                           return_spiral_stairs_camera_yaw };

extern f32 unused_8033B3CC;
extern f32 unused_8033B3D4;
extern s16 unused_8033B3A2;
extern f32 unused_80336074;
extern s16 unused_8033B3A4;
extern s16 unused_8033B3A6;

extern u32 gPrevLevel;

extern f32 unused_8033B3D8;
extern f32 unused_8033B3D0;

extern f32 unused_803365D0;
extern f32 unused_803365D4;
extern f32 unused_803365D8;
extern f32 unused_803365DC;

void set_camera_shake(s16 shake) {
    switch (shake) {
        case SHAKE_ATTACK:
            gCameraStatus.unkA4 = 0;
            gCameraStatus.unkAC = 0;
            break;

        case SHAKE_FALL_DAMAGE:
            set_camera_pitch_shake(0x60, 0x3, 0x8000);
            set_camera_roll_shake(0x60, 0x3, 0x8000);
            break;

        case SHAKE_GROUND_POUND:
            set_camera_pitch_shake(0x60, 0xC, 0x8000);
            break;

        case SHAKE_SMALL_DAMAGE:
            if (sMarioStatusForCamera->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                set_camera_yaw_shake(0x200, 0x10, 0x1000);
                set_camera_roll_shake(0x400, 0x20, 0x1000);
                func_80299C98(0x100, 0x30, -0x8000);
            } else {
                set_camera_yaw_shake(0x80, 0x8, 0x4000);
                set_camera_roll_shake(0x80, 0x8, 0x4000);
                func_80299C98(0x100, 0x30, -0x8000);
            }

            gCameraStatus.unkA4 = 0;
            gCameraStatus.unkAC = 0;
            break;

        case SHAKE_MED_DAMAGE:
            if (sMarioStatusForCamera->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                set_camera_yaw_shake(0x400, 0x20, 0x1000);
                set_camera_roll_shake(0x600, 0x30, 0x1000);
                func_80299C98(0x180, 0x40, -0x8000);
            } else {
                set_camera_yaw_shake(0x100, 0x10, 0x4000);
                set_camera_roll_shake(0x100, 0x10, 0x4000);
                func_80299C98(0x180, 0x40, -0x8000);
            }

            gCameraStatus.unkA4 = 0;
            gCameraStatus.unkAC = 0;
            break;

        case SHAKE_LARGE_DAMAGE:
            if (sMarioStatusForCamera->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                set_camera_yaw_shake(0x600, 0x30, 0x1000);
                set_camera_roll_shake(0x800, 0x40, 0x1000);
                func_80299C98(0x200, 0x50, -0x8000);
            } else {
                set_camera_yaw_shake(0x180, 0x20, 0x4000);
                set_camera_roll_shake(0x200, 0x20, 0x4000);
                func_80299C98(0x200, 0x50, -0x8000);
            }

            gCameraStatus.unkA4 = 0;
            gCameraStatus.unkAC = 0;
            break;

        case SHAKE_HIT_FROM_BELOW:
            gCameraStatus.unkA4 = 0.07;
            gCameraStatus.unkAC = 0.07;
            break;

        case SHAKE_SHOCK:
            set_camera_pitch_shake(RandomFloat() * 64.f, 0x8, 0x8000);
            set_camera_yaw_shake(RandomFloat() * 64.f, 0x8, 0x8000);
            break;
    }
}

void set_camera_shake_2(s16 shake) {
    switch (shake) {
        case SHAKE_2_UNKNOWN_1:
            set_camera_pitch_shake(0x60, 0x8, 0x4000);
            break;

        case SHAKE_2_UNKNOWN_2:
            set_camera_pitch_shake(0xC0, 0x8, 0x4000);
            break;

        case SHAKE_2_UNKNOWN_3:
            set_camera_pitch_shake(0x100, 0x8, 0x3000);
            break;

        case SHAKE_2_UNKNOWN_6:
            set_camera_roll_shake(0x80, 0x10, 0x3000);
            break;

        case SHAKE_2_UNKNOWN_7:
            set_camera_pitch_shake(0x20, 0x8, 0x8000);
            break;

        case SHAKE_2_UNKNOWN_8:
            set_camera_pitch_shake(0x40, 0x8, 0x8000);
            break;

        case SHAKE_2_JRB_SHIP_DRAIN:
            set_camera_pitch_shake(0x20, 0x8, 0x8000);
            set_camera_roll_shake(0x400, 0x10, 0x100);
            break;

        case SHAKE_2_FALLING_BITS_PLAT:
            set_camera_pitch_shake(64, 0x2, 0x8000);
            break;

        case SHAKE_2_UNKNOWN_5:
            set_camera_yaw_shake(-0x200, 0x80, 0x200);
            break;
    }
}

void func_8027F440(s16 a, f32 b, f32 c, f32 d) {
    switch (a) {
        case 4:
            func_8028AA80(0x28, 0x8, 0x4000, 2000.f, b, c, d);
            break;

        case 1:
            func_8028AA80(0x80, 0x8, 0x4000, 4000.f, b, c, d);
            func_8029A514(1, b, c, d);
            break;

        case 2:
            func_8028AA80(0xC0, 0x8, 0x4000, 6000.f, b, c, d);
            func_8029A514(3, b, c, d);
            break;

        case 3:
            func_8028AA80(0x100, 0x8, 0x3000, 8000.f, b, c, d);
            func_8029A514(4, b, c, d);
            break;
    }
}

void unused_set_camera_shake(s16 a) {
    switch (a) {
        case 1:
            set_camera_pitch_shake(0x60, 0x8, 0x4000);
            break;

        case 2:
            set_camera_pitch_shake(0xC0, 0x8, 0x4000);
            break;

        case 3:
            set_camera_pitch_shake(0x100, 0x8, 0x3000);
            break;
    }
}

void return_height_above_floor(f32 *a, f32 b, f32 c, f32 *d, f32 e, f32 f) {
    f32 floorHeight = sGeometryForMario.currFloorHeight;
    f32 waterHeight;
    UNUSED s32 filler;

    if (!(sMarioStatusForCamera->action & ACT_FLAG_METAL_WATER)) {
        if (floorHeight < (waterHeight = find_water_level(sMarioStatusForCamera->pos[0],
                                                          sMarioStatusForCamera->pos[2]))) {
            floorHeight = waterHeight;
        }
    }

    if (sMarioStatusForCamera->action & ACT_FLAG_ON_POLE) {
        if (sGeometryForMario.currFloorHeight >= gMarioStates[0].usedObj->oPosY
            && sMarioStatusForCamera->pos[1]
                   < 0.7f * gMarioStates[0].usedObj->hitboxHeight + gMarioStates[0].usedObj->oPosY) {
            c = 1200;
        }
    }

    *a = (floorHeight - sMarioStatusForCamera->pos[1]) * b;

    if (*a > c) {
        *a = c;
    }

    if (*a < -c) {
        *a = -c;
    }

    *d = (floorHeight - sMarioStatusForCamera->pos[1]) * e;

    if (*d > f) {
        *d = f;
    }

    if (*d < -f) {
        *d = -f;
    }
}

void set_cam_focus_and_pos_rel_mario(Vec3f a, Vec3f b, f32 c, f32 d, f32 e, s16 f, s16 g) {
    Vec3f sp24;

    sp24[0] = sMarioStatusForCamera->pos[0];
    sp24[1] = sMarioStatusForCamera->pos[1] + c;
    sp24[2] = sMarioStatusForCamera->pos[2];

    vec3f_set_dist_and_angle(sp24, b, e, f + D_8033B3F0, g);

    a[0] = sMarioStatusForCamera->pos[0];
    a[1] = sMarioStatusForCamera->pos[1] + d;
    a[2] = sMarioStatusForCamera->pos[2];
}

static void unused_8027F950(Vec3f a, Vec3f b, f32 c, f32 d, f32 e, s16 f, s16 g) {
    Vec3f sp34;
    f32 sp30;
    f32 sp2C;
    s16 sp2A;
    s16 sp28;
    s16 sp26;
    s16 sp24;

    vec3f_copy(sp34, sMarioStatusForCamera->pos);
    sp34[1] += c;

    vec3f_set_dist_and_angle(sp34, b, e, f + D_8033B3F0, g);
    vec3f_get_dist_and_angle(b, sMarioStatusForCamera->pos, &sp30, &sp2A, &sp28);
    vec3f_get_dist_and_angle(b, a, &sp2C, &sp26, &sp24);
    vec3f_set_dist_and_angle(b, a, sp2C, sp26, sp24);

    a[1] = sMarioStatusForCamera->pos[1] + d;
}

void set_camera_height(struct LevelCamera *c, f32 goalHeight) {
    struct Surface *surface;
    f32 marioFloorHeight;
    f32 marioCeilHeight;
    f32 camFloorHeight;
    UNUSED u8 filler[8];
    UNUSED s16 action = sMarioStatusForCamera->action;
    f32 sp28 = 125.f;
    f32 camCeilHeight =
        find_ceil(c->pos[0], gCameraStatus.camFocAndPosCurrAndGoal[3][1] - 50.f, c->pos[2], &surface);

    if (sMarioStatusForCamera->action & ACT_FLAG_HANGING) {
        marioCeilHeight = sGeometryForMario.currCeilHeight;
        marioFloorHeight = sGeometryForMario.currFloorHeight;

        if (marioFloorHeight < marioCeilHeight - 400.f) {
            marioFloorHeight = marioCeilHeight - 400.f;
        }

        goalHeight = marioFloorHeight + (marioCeilHeight - marioFloorHeight) * 0.4f;

        if (sMarioStatusForCamera->pos[1] - 400 > goalHeight) {
            goalHeight = sMarioStatusForCamera->pos[1] - 400;
        }

        approach_camera_height(c, goalHeight, 5.f);
    } else {
        camFloorHeight = find_floor(c->pos[0], c->pos[1] + 100.f, c->pos[2], &surface) + sp28;
        marioFloorHeight = sp28 + sGeometryForMario.currFloorHeight;

        if (camFloorHeight < marioFloorHeight) {
            camFloorHeight = marioFloorHeight;
        }
        if (goalHeight < camFloorHeight) {
            goalHeight = camFloorHeight;
            c->pos[1] = goalHeight;
        }
        if (sMarioStatusForCamera->action == ACT_BUTT_STUCK_IN_GROUND
            || sMarioStatusForCamera->action == ACT_HEAD_STUCK_IN_GROUND
            || sMarioStatusForCamera->action == ACT_FEET_STUCK_IN_GROUND) {
            if (ABS(c->pos[1] - goalHeight) > 1000.f) {
                c->pos[1] = goalHeight;
            }
        }
        approach_camera_height(c, goalHeight, 20.f);
        if (camCeilHeight != 20000.f) {
            camCeilHeight -= sp28;
            if ((c->pos[1] > camCeilHeight && sGeometryForMario.currFloorHeight + sp28 < camCeilHeight)
                || (sGeometryForMario.currCeilHeight != 20000.f
                    && sGeometryForMario.currCeilHeight > camCeilHeight && c->pos[1] > camCeilHeight)) {
                c->pos[1] = camCeilHeight;
            }
        }
    }
}

s16 return_pitch_parallel_floor(s16 yaw) {
    struct Surface *floor;
    f32 floorHeight;
    s16 pitch = 0x05B0;
    f32 xPos = sMarioStatusForCamera->pos[0] + sins(yaw) * 40.f;
    f32 zPos = sMarioStatusForCamera->pos[2] + coss(yaw) * 40.f;

    floorHeight =
        find_floor(xPos, sMarioStatusForCamera->pos[1], zPos, &floor) - sMarioStatusForCamera->pos[1];

    if (floor != NULL) {
        if (floor->type != SURFACE_WALL_MISC && floorHeight > 0) {
            if (floor->normal.z == 0.f && floorHeight < 100.f) {
                pitch = 0x05B0;
            } else {
                pitch += atan2s(40.f, floorHeight);
            }
        }
    }
    return pitch;
}

void func_8027FF44(struct LevelCamera *c) {
    f32 camDistToMario;
    s16 camPitchToMario;
    s16 camYawToMario;
    Vec3f sp24 = { 0, 0, 0 };

    vec3f_get_dist_and_angle(c->pos, sMarioStatusForCamera->pos, &camDistToMario, &camPitchToMario,
                             &camYawToMario);

    sp24[2] = sins(0xC00) * camDistToMario;

    rotate_in_xz(sp24, sp24, sMarioStatusForCamera->faceAngle[1]);
    camYawToMario = -camYawToMario;
    rotate_in_xz(sp24, sp24, camYawToMario);
    sp24[2] = 0.f;

    if (sMarioStatusForCamera->action == ACT_LONG_JUMP
        || (sMarioStatusForCamera->action != ACT_TOP_OF_POLE
            && (sMarioStatusForCamera->action & ACT_FLAG_ON_POLE))) {
        sp24[0] = -sp24[0];
    }
    if (gCameraFlags2 & CAM_FLAG_2_SLEEPING) {
        approach_f32_exponential_bool(&D_8033B40C, 0.f, 0.025f);
    } else {
        approach_f32_exponential_bool(&D_8033B40C, sp24[0], 0.025f);
    }
    sp24[0] = D_8033B40C;
    camYawToMario = -camYawToMario;
    rotate_in_xz(sp24, sp24, camYawToMario);
    vec3f_add(c->focus, sp24);
}

s16 find_in_bounds_yaw_wdw_bob_thi(Vec3f pos, Vec3f origin, s16 yaw) {
    switch (gCurrLevelArea) {
        case AREA_WDW_MAIN:
            yaw = clamp_positions_and_find_yaw_angle(pos, origin, 4508.f, -3739.f, 4508.f, -3739.f);
            break;
        case AREA_BOB:
            yaw = clamp_positions_and_find_yaw_angle(pos, origin, 8000.f, -8000.f, 7050.f, -8000.f);
            break;
        case AREA_THI_HUGE:
            yaw = clamp_positions_and_find_yaw_angle(pos, origin, 8192.f, -8192.f, 8192.f, -8192.f);
            break;
        case AREA_THI_TINY:
            yaw = clamp_positions_and_find_yaw_angle(pos, origin, 2458.f, -2458.f, 2458.f, -2458.f);
            break;
    }
    return yaw;
}

s32 return_open_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    f32 xDistFocToMario = sMarioStatusForCamera->pos[0] - c->xFocus;
    f32 zDistFocToMario = sMarioStatusForCamera->pos[2] - c->zFocus;
    s16 yaw = atan2s(zDistFocToMario, xDistFocToMario) + sFirstPersonCameraYaw;
    s16 pitch = return_pitch_parallel_floor(yaw);
    UNUSED f32 unused1;
    f32 posHeightAboveFloor;
    f32 focusHeightAboveFloor;
    UNUSED f32 unused2;
    UNUSED f32 unused3;
    f32 yOffset = 125.f;
    f32 sp28 = 1000.f;

    sYawFocToMario = yaw - sFirstPersonCameraYaw;
    return_height_above_floor(&posHeightAboveFloor, 1.f, 200.f, &focusHeightAboveFloor, 0.9f, 200.f);
    set_cam_focus_and_pos_rel_mario(focus, pos, posHeightAboveFloor + yOffset,
                                    focusHeightAboveFloor + yOffset, D_8033B3EE + sp28, pitch, yaw);
    yaw = find_in_bounds_yaw_wdw_bob_thi(pos, focus, yaw);

    return yaw;
}

s32 return_platform_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    UNUSED f32 xDistFocToMario = sMarioStatusForCamera->pos[0] - c->xFocus;
    UNUSED f32 zDistFocToMario = sMarioStatusForCamera->pos[2] - c->zFocus;
    s16 yaw = sPlatformLevelPresetBaseYaw + gPlatformLevelYawOffset;
    s16 pitch = return_pitch_parallel_floor(yaw);
    f32 posHeightAboveFloor;
    f32 focusHeightAboveFloor;
    UNUSED f32 unused1;
    UNUSED f32 unused2;
    UNUSED f32 unused3;
    f32 yOffset = 125.f;
    f32 sp28 = 1000.f;

    sYawFocToMario = yaw;
    return_height_above_floor(&posHeightAboveFloor, 1.f, 200.f, &focusHeightAboveFloor, 0.9f, 200.f);
    set_cam_focus_and_pos_rel_mario(focus, pos, posHeightAboveFloor + yOffset,
                                    focusHeightAboveFloor + yOffset, D_8033B3EE + sp28, pitch, yaw);
    func_8027FF44(c);
    if (gCurrLevelArea == AREA_DDD_SUB) {
        yaw = clamp_positions_and_find_yaw_angle(pos, focus, 6839.f, 995.f, 5994.f, -3945.f);
    }

    return yaw;
}

void func_80280550(struct LevelCamera *c) {
    s16 sp46 = 10922;
    s16 sp44 = -10922;
    s16 sp42 = 4096;
    s16 sp40;
    s32 sp3C;
    UNUSED s16 sp3A = 0;
    UNUSED s32 sp34 = 0;
    f32 xDistFocToMario = sMarioStatusForCamera->pos[0] - c->xFocus;
    f32 zDistFocToMario = sMarioStatusForCamera->pos[2] - c->zFocus;
    UNUSED s32 filler;
    s16 sp26 =
        calculate_yaw(sMarioStatusForCamera->pos, c->pos) - atan2s(zDistFocToMario, xDistFocToMario);

    if (sp26 > sp46) {
        sp26 = sp46;
    }
    if (sp26 < sp44) {
        sp26 = sp44;
    }

    if (!(gCameraMovementFlags
          & (CAM_MOVE_RETURN_TO_MIDDLE | CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ROTATE_LEFT))) {
        if (sGeometryForMario.currFloorType == SURFACE_CAMERA_MIDDLE
            && sGeometryForMario.prevFloorType != SURFACE_CAMERA_MIDDLE) {
            gCameraMovementFlags |= (CAM_MOVE_RETURN_TO_MIDDLE | CAM_MOVE_UNKNOWN_5);
        }
        if (sGeometryForMario.currFloorType == SURFACE_CAMERA_ROTATE_RIGHT
            && sGeometryForMario.prevFloorType != SURFACE_CAMERA_ROTATE_RIGHT) {
            gCameraMovementFlags |= (CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_UNKNOWN_5);
        }
        if (sGeometryForMario.currFloorType == SURFACE_CAMERA_ROTATE_LEFT
            && sGeometryForMario.prevFloorType != SURFACE_CAMERA_ROTATE_LEFT) {
            gCameraMovementFlags |= (CAM_MOVE_ROTATE_LEFT | CAM_MOVE_UNKNOWN_5);
        }
    }

    if (gCameraMovementFlags & CAM_MOVE_UNKNOWN_5) {
        sp42 = 512;
    }

    if (c->currPreset == CAMERA_PRESET_REVERSE_TOWER) {
        xDistFocToMario = -xDistFocToMario;
        zDistFocToMario = -zDistFocToMario;
    }

    sp3C = func_8028F2F0(c, c->pos, &sp40, 1024);
    if (sp3C == 3) {
        if (sp40 - atan2s(zDistFocToMario, xDistFocToMario) + 0x4000 < 0) {
            sp40 += 32768;
        }
        sp40 -= atan2s(zDistFocToMario, xDistFocToMario);
        if (sp40 >= 0x4AAB) {
            sp40 = 19114;
        }
        if (sp40 <= -0x4AAB) {
            sp40 = -19114;
        }
    }

    if (gCameraMovementFlags & CAM_MOVE_RETURN_TO_MIDDLE) {
        if (camera_approach_s16_symmetric_bool(&sFirstPersonCameraYaw, 0, sp42) == 0) {
            gCameraMovementFlags &= ~CAM_MOVE_RETURN_TO_MIDDLE;
        }
    } else {
        if ((gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT) && sp3C == 3
            && sp40 + 16 < sFirstPersonCameraYaw) {
            sFirstPersonCameraYaw = sp40;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_UNKNOWN_5);
        }
        if ((gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT) && sp3C == 3
            && sp40 - 16 > sFirstPersonCameraYaw) {
            sFirstPersonCameraYaw = sp40;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_LEFT | CAM_MOVE_UNKNOWN_5);
        }
        if (!(sCameraSideCFlags & 4) && (gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT)
            && camera_approach_s16_symmetric_bool(&sFirstPersonCameraYaw, sp46, sp42) == 0) {
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_UNKNOWN_5);
        }
        if (!(sCameraSideCFlags & 8) && (gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT)
            && camera_approach_s16_symmetric_bool(&sFirstPersonCameraYaw, sp44, sp42) == 0) {
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_LEFT | CAM_MOVE_UNKNOWN_5);
        }
        if ((sCameraSideCFlags & 4) && (gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT)
            && camera_approach_s16_symmetric_bool(&sFirstPersonCameraYaw, 19114, sp42) == 0) {
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_UNKNOWN_5);
            sCameraSideCFlags &= ~4;
        }
        if ((sCameraSideCFlags & 8) && (gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT)
            && camera_approach_s16_symmetric_bool(&sFirstPersonCameraYaw, -19114, sp42) == 0) {
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_LEFT | CAM_MOVE_UNKNOWN_5);
            sCameraSideCFlags &= ~8;
        }
    }
    if (!(gCameraMovementFlags
          & (CAM_MOVE_RETURN_TO_MIDDLE | CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ROTATE_LEFT))) {
        if (sp3C == 3) {
            approach_s16_exponential_bool(&sFirstPersonCameraYaw, sp40, 10);
        } else {
            if (c->currPreset == CAMERA_PRESET_OPEN_CAMERA) {
                sp42 = gMarioStates[0].forwardVel / 32.f * 128.f;
                camera_approach_s16_symmetric_bool(&sFirstPersonCameraYaw, sp26, sp42);
            }
            if (c->currPreset == CAMERA_PRESET_REVERSE_TOWER) {
                sFirstPersonCameraYaw = func_8028AF24(c, atan2s(zDistFocToMario, xDistFocToMario));
            }
        }
    }

    if (sFirstPersonCameraYaw >= 0x5555) {
        sFirstPersonCameraYaw = 21844;
    }
    if (sFirstPersonCameraYaw < -0x5554) {
        sFirstPersonCameraYaw = -21844;
    }
}

void func_80280BD8(f32 a, s16 b) {
    if (D_8033B3EE < 0) {
        if ((D_8033B3EE += 30) > 0) {
            D_8033B3EE = 0;
        }
    } else if (a < D_8033B3EE) {
        if ((D_8033B3EE -= 30) < a) {
            D_8033B3EE = a;
        }
    } else if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
        if ((D_8033B3EE += 30) > a) {
            D_8033B3EE = a;
        }
    } else {
        if ((D_8033B3EE -= 30) < 0) {
            D_8033B3EE = 0;
        }
    }

    if (gCurrLevelArea == AREA_SSL_PYRAMID
        && gCurrLevelCamera->currPreset == CAMERA_PRESET_REVERSE_TOWER) {
        b /= 2;
    }

    if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
        if ((D_8033B3F0 += b / 13) > b) {
            D_8033B3F0 = b;
        }
    } else {
        if ((D_8033B3F0 -= b / 13) < 0) {
            D_8033B3F0 = 0;
        }
    }
}

void func_80280E0C(struct LevelCamera *c) {
    func_8028B3DC(c, 0.f);
}

void func_80280E3C(UNUSED struct LevelCamera *c) {
    f32 sp4 = 1000.f;

    sFirstPersonCameraYaw = D_8033B418.unk8.unk1E - sYawFocToMario;
    D_8033B3EE = D_8033B418.unk8.unk18 - sp4;
    gCameraMovementFlags &= ~CAM_MOVE_INTO_C_UP;
}

void update_open_camera(struct LevelCamera *c) {
    Vec3f pos;
    UNUSED u8 unused1[8];
    s16 sp22 = sYawFocToMario;
    UNUSED u8 unused2[4];

    if (gCameraMovementFlags & CAM_MOVE_INTO_C_UP) {
        func_80280E3C(c);
    }

    func_80280E0C(c);
    func_80280550(c);

    if (c->currPreset == CAMERA_PRESET_OPEN_CAMERA) {
        func_80280BD8(400.f, 0x0900);
    }
    c->storedYaw = return_open_camera_yaw(c, c->focus, pos);
    c->pos[0] = pos[0];
    c->pos[2] = pos[2];
    D_8033B3EC = sYawFocToMario - sp22;
    if (sMarioStatusForCamera->action == ACT_RIDING_HOOT) {
        pos[1] += 500.f;
    }
    set_camera_height(c, pos[1]);
    func_8027FF44(c);
}

void update_platform_level_camera(struct LevelCamera *c) {
    Vec3f pos;
    UNUSED u8 unused[8];
    s16 sp1A = sYawFocToMario;

    func_8028B3DC(c, 0.f);

    if (gPlayer1Controller->buttonPressed & R_CBUTTONS) {
        gPlatformLevelYawOffset += 0x2000;
        play_sound_cbutton_side();
    }
    if (gPlayer1Controller->buttonPressed & L_CBUTTONS) {
        gPlatformLevelYawOffset -= 0x2000;
        play_sound_cbutton_side();
    }

    func_80280BD8(400.f, 2304);
    c->storedYaw = return_platform_camera_yaw(c, c->focus, pos);
    c->pos[0] = pos[0];
    c->pos[2] = pos[2];
    D_8033B3EC = sYawFocToMario - sp1A;
    set_camera_height(c, pos[1]);
}

s32 return_reverse_tower_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    f32 xDistFocToMario = sMarioStatusForCamera->pos[0] - c->xFocus;
    f32 zDistFocToMario = sMarioStatusForCamera->pos[2] - c->zFocus;
    s16 yaw = atan2s(zDistFocToMario, xDistFocToMario) + sFirstPersonCameraYaw + 0x8000;
    s16 pitch = return_pitch_parallel_floor(yaw);
    f32 sp38 = 1000.f;
    f32 yOffset = 125.f;
    f32 posHeightAboveFloor;
    f32 focusHeightAboveFloor;

    sYawFocToMario = yaw - sFirstPersonCameraYaw - 0x8000;
    return_height_above_floor(&posHeightAboveFloor, 1.f, 200.f, &focusHeightAboveFloor, 0.9f, 200.f);
    set_cam_focus_and_pos_rel_mario(focus, pos, posHeightAboveFloor + yOffset,
                                    focusHeightAboveFloor + yOffset, D_8033B3EE + sp38, pitch, yaw);

    return yaw;
}

void update_reverse_tower_camera(struct LevelCamera *c) {
    Vec3f pos;
    s16 sp1A = sYawFocToMario;

    if (gCameraMovementFlags & CAM_MOVE_INTO_C_UP) {
        func_80280E3C(c);
    }
    func_80280E0C(c);
    func_80280550(c);
    func_80280BD8(400.f, 0x0900);
    c->storedYaw = return_reverse_tower_camera_yaw(c, c->focus, pos);
    c->pos[0] = pos[0];
    c->pos[2] = pos[2];
    D_8033B3EC = sYawFocToMario - sp1A;
    if (sMarioStatusForCamera->action == ACT_RIDING_HOOT) {
        pos[1] += 500.f;
    }
    set_camera_height(c, pos[1]);
    func_8027FF44(c);
}

s32 return_parallel_tracking_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    Vec3f spE8[2];
    Vec3f spDC;
    Vec3f spD0;
    Vec3f spC4;
    Vec3f spB8;
    s16 spB6;
    s16 spB4;
    UNUSED u8 filler[4];
    f32 spAC;
    f32 spA8;
    f32 spA4;
    UNUSED u8 filler2[8];
    f32 sp98;
    UNUSED u8 filler3[8];
    UNUSED f32 sp8C = 0.5f;
    f32 sp88 = 0.5f;
    f32 sp84;
    Vec3f sp78;
    UNUSED u8 filler4[12];
    UNUSED Vec3f sp60;
    Vec3s sp58;
    Vec3f sp4C;
    Vec3f sp40;
    Vec3f sp34;
    f32 sp30;
    f32 sp2C;
    s16 sp2A;
    s16 sp28;
    s16 sp26;
    s16 sp24;

    sp60[0] = 0.f;
    sp60[1] = 0.f;
    sp60[2] = 0.f;
    vec3f_copy(sp4C, pos);
    vec3f_copy(spE8[0], D_8033B470[D_8033B46C].unk4);
    vec3f_copy(spE8[1], D_8033B470[D_8033B46C + 1].unk4);
    spAC = D_8033B470[D_8033B46C].unk10;
    spA8 = D_8033B470[D_8033B46C].unk14;
    return_height_above_floor(&sp84, 1.f, 200.f, &sp84, 0.9f, 200.f);
    sp78[0] = sMarioStatusForCamera->pos[0];
    sp78[1] = sMarioStatusForCamera->pos[1] + 150.f + sp84;
    sp78[2] = sMarioStatusForCamera->pos[2];
    spDC[0] = spE8[0][0] + (spE8[1][0] - spE8[0][0]) * sp88;
    spDC[1] = spE8[0][1] + (spE8[1][1] - spE8[0][1]) * sp88;
    spDC[2] = spE8[0][2] + (spE8[1][2] - spE8[0][2]) * sp88;
    vec3f_get_dist_and_angle(spE8[0], spE8[1], &sp98, &spB6, &spB4);
    spD0[0] = sp78[0] - spDC[0];
    spD0[1] = sp78[1] - spDC[1];
    spD0[2] = sp78[2] - spDC[2];
    spB4 = -spB4;
    rotate_in_xz(spD0, spD0, spB4);
    spB4 = -spB4;
    spB6 = -spB6;
    rotate_in_yz(spD0, spD0, spB6);
    spB6 = -spB6;
    vec3f_copy(spB8, spD0);
    spB8[0] = -spB8[0] * 0.f;
    spB8[1] = spB8[1] * 0.f;
    spC4[0] = pos[0] - spDC[0];
    spC4[1] = pos[1] - spDC[1];
    spC4[2] = pos[2] - spDC[2];
    spB4 = -spB4;
    rotate_in_xz(spC4, spC4, spB4);
    spB4 = -spB4;
    spB6 = -spB6;
    rotate_in_yz(spC4, spC4, spB6);
    spB6 = -spB6;

    if (spD0[2] > spC4[2]) {
        if (spD0[2] - spC4[2] > spAC) {
            spC4[2] = spD0[2] - spAC;
        }
    } else {
        if (spD0[2] - spC4[2] < -spAC) {
            spC4[2] = spD0[2] + spAC;
        }
    }

    spD0[0] = -spD0[0] * spA8;
    spD0[1] = spD0[1] * spA8;
    spD0[2] = spC4[2];
    spB8[0] *= 0.3f;
    spB8[1] *= 0.3f;
    sp58[0] = spB6;
    sp58[1] = spB4;
    spD0[2] = sp98 / 2.f - spD0[2];
    sp58[1] = spB4 + 32768;
    sp58[2] = 0;
    set_pos_from_face_angle_and_vec3f(pos, spE8[0], spD0, sp58);
    vec3f_get_dist_and_angle(spE8[0], c->pos, &spA4, &spB6, &spB4);
    spB8[2] = sp98 / 2.f - spB8[2];
    set_pos_from_face_angle_and_vec3f(c->focus, spE8[0], spB8, sp58);

    if (gCameraFlags2 & CAM_FLAG_2_UNKNOWN_3) {
        gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_3;
        D_8033B478.pos[0] = sp4C[0] - c->pos[0];
        D_8033B478.pos[1] = sp4C[1] - c->pos[1];
        D_8033B478.pos[2] = sp4C[2] - c->pos[2];
    }
    approach_f32_exponential_bool(&D_8033B478.pos[0], 0.f, 0.025f);
    approach_f32_exponential_bool(&D_8033B478.pos[1], 0.f, 0.025f);
    approach_f32_exponential_bool(&D_8033B478.pos[2], 0.f, 0.025f);
    vec3f_add(c->pos, D_8033B478.pos);

    if (D_8033B470[D_8033B46C + 1].unk0 != 0) {
        calculate_angles(D_8033B470[D_8033B46C + 1].unk4, D_8033B470[D_8033B46C + 2].unk4, &sp28,
                         &sp24);
        vec3f_set_dist_and_angle(D_8033B470[D_8033B46C + 1].unk4, sp34, 400.f, sp28, sp24);
        sp2C = calc_abs_dist(sp78, sp34);
        calculate_angles(D_8033B470[D_8033B46C + 1].unk4, D_8033B470[D_8033B46C].unk4, &sp2A, &sp26);
        vec3f_set_dist_and_angle(D_8033B470[D_8033B46C + 1].unk4, sp40, 400.f, sp2A, sp26);
        sp30 = calc_abs_dist(sp78, sp40);
        if (sp2C < sp30) {
            D_8033B46C++;
            gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_3;
        }
    }

    if (D_8033B46C != 0) {
        calculate_angles(D_8033B470[D_8033B46C].unk4, D_8033B470[D_8033B46C + 1].unk4, &sp28, &sp24);
        vec3f_set_dist_and_angle(D_8033B470[D_8033B46C].unk4, sp34, 700.f, sp28, sp24);
        sp2C = calc_abs_dist(sp78, sp34);
        calculate_angles(D_8033B470[D_8033B46C].unk4, D_8033B470[D_8033B46C - 1].unk4, &sp2A, &sp26);
        vec3f_set_dist_and_angle(D_8033B470[D_8033B46C].unk4, sp40, 700.f, sp2A, sp26);
        sp30 = calc_abs_dist(sp78, sp40);
        if (sp2C > sp30) {
            D_8033B46C--;
            gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_3;
        }
    }

    vec3f_copy(focus, sp78);
    vec3f_get_dist_and_angle(focus, pos, &spA4, &spB6, &spB4);

    return spB4;
}

s32 return_fixed_camera_yaw(struct LevelCamera *c, Vec3f focus, UNUSED Vec3f pos) {
    f32 heightAboveFloor;
    f32 goalHeight;
    f32 ceilHeight;
    f32 heightOffset;
    f32 distCamToFocus;
    UNUSED u8 filler2[8];
    f32 scaleToMario = 0.5f;
    s16 pitch;
    s16 yaw;
    Vec3s faceAngle;
    struct Surface *ceiling;
    Vec3f basePos;
    UNUSED u8 filler[16];

    play_camera_buzz_if_c_sideways();

    switch (gCurrLevelArea) {
        case AREA_RR:
            scaleToMario = 0.f;
            heightOffset = 0.f;
            break;

        case AREA_CASTLE_LOBBY:
            scaleToMario = 0.3f;
            heightOffset = 0.f;
            break;

        case AREA_BBH:
            scaleToMario = 0.f;
            heightOffset = 0.f;
            break;
    }

    handle_c_button_movement(c);
    play_camera_buzz_if_cdown();

    return_height_above_floor(&heightAboveFloor, 1.f, 200.f, &heightAboveFloor, 0.9f, 200.f);
    vec3f_copy(focus, sMarioStatusForCamera->pos);
    focus[1] += heightAboveFloor + 125.f;
    vec3f_get_dist_and_angle(focus, c->pos, &distCamToFocus, &faceAngle[0], &faceAngle[1]);
    faceAngle[2] = 0;

    vec3f_copy(basePos, sFixedPresetBasePosition);
    vec3f_add(basePos, sFixedPresetBasePositionOffset);

    if (sGeometryForMario.currFloorType != SURFACE_DEATH_PLANE
        && sGeometryForMario.currFloorHeight != -11000.f) {
        goalHeight = sGeometryForMario.currFloorHeight + basePos[1] + heightOffset;
    } else {
        goalHeight = gCameraStatus.camFocAndPosCurrAndGoal[3][1];
    }

    if (300 > distCamToFocus) {
        goalHeight += 300 - distCamToFocus;
    }

    ceilHeight = find_ceil(c->pos[0], goalHeight - 100.f, c->pos[2], &ceiling);
    if (ceilHeight != 20000.f) {
        if (goalHeight > (ceilHeight -= 125.f)) {
            goalHeight = ceilHeight;
        }
    }

    if (gCameraFlags2 & CAM_FLAG_2_SMOOTH_MOVEMENT) {
        camera_approach_f32_symmetric_bool(&c->pos[1], goalHeight, 15.f);
    } else {
        if (goalHeight < sMarioStatusForCamera->pos[1] - 500.f) {
            goalHeight = sMarioStatusForCamera->pos[1] - 500.f;
        }
        c->pos[1] = goalHeight;
    }

    c->pos[0] = basePos[0] + (sMarioStatusForCamera->pos[0] - basePos[0]) * scaleToMario;
    c->pos[2] = basePos[2] + (sMarioStatusForCamera->pos[2] - basePos[2]) * scaleToMario;

    if (scaleToMario != 0.f) {
        vec3f_get_dist_and_angle(c->focus, c->pos, &distCamToFocus, &pitch, &yaw);
        if (distCamToFocus > 1000.f) {
            distCamToFocus = 1000.f;
            vec3f_set_dist_and_angle(c->focus, c->pos, distCamToFocus, pitch, yaw);
        }
    }

    return faceAngle[1];
}

s32 return_boss_fight_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    struct Object *o;
    UNUSED u8 filler2[12];
    f32 focusDistance;
    UNUSED u8 filler3[4];
    f32 nx;
    f32 ny;
    f32 nz;
    f32 oo;
    UNUSED u8 filler4[4];
    UNUSED s16 sp62;
    s16 yaw;
    s16 heldState;
    struct Surface *floor;
    UNUSED u8 filler[20];
    Vec3f secondFocus;
    Vec3f sp2C = { 0.f, -150.f, -125.f };

    handle_c_button_movement(c);

    if (sMarioStatusForCamera->unk1C[1] == 7) {
        set_camera_shake_2(SHAKE_2_UNKNOWN_3);
        sMarioStatusForCamera->unk1C[1] = 0;
    }
    if (sMarioStatusForCamera->unk1C[1] == 8) {
        set_camera_shake_2(SHAKE_2_UNKNOWN_2);
        sMarioStatusForCamera->unk1C[1] = 0;
    }

    yaw = sFirstPersonCameraYaw + 0x2000;
    if ((o = gSecondCameraFocus) != NULL) {
        object_pos_to_vec3f(secondFocus, o);
        heldState = o->oHeldState;
    } else {
        secondFocus[0] = c->xFocus;
        secondFocus[1] = sMarioStatusForCamera->pos[1];
        secondFocus[2] = c->zFocus;
        heldState = 0;
    }

    focusDistance = calc_abs_dist(sMarioStatusForCamera->pos, secondFocus) * 1.6f;
    if (focusDistance < 800.f) {
        focusDistance = 800.f;
    }
    if (focusDistance > 5000.f) {
        focusDistance = 5000.f;
    }

    if (heldState == 1) {
        set_pos_from_face_angle_and_vec3f(secondFocus, sMarioStatusForCamera->pos, sp2C,
                                          sMarioStatusForCamera->faceAngle);
    }

    focus[0] = (sMarioStatusForCamera->pos[0] + secondFocus[0]) / 2.f;
    focus[1] = (sMarioStatusForCamera->pos[1] + secondFocus[1]) / 2.f + 125.f;
    focus[2] = (sMarioStatusForCamera->pos[2] + secondFocus[2]) / 2.f;

    vec3f_set_dist_and_angle(focus, pos, focusDistance, 0x1000, yaw);
    pos[1] = find_floor(c->xFocus, 20000.f, c->zFocus, &floor);
    if (floor != NULL) {
        nx = floor->normal.x;
        ny = floor->normal.y;
        nz = floor->normal.z;
        oo = floor->originOffset;
        pos[1] = 300.f - (nx * pos[0] + nz * pos[2] + oo) / ny;
        switch (gCurrLevelArea) {
            case AREA_BOB:
                pos[1] += 125.f;
                // fall through
            case AREA_WF:
                pos[1] += 125.f;
        }
    }

    if (gCurrLevelNum == LEVEL_BBH) {
        pos[1] = 2047.f;
    }

    if (sCSideButtonYaw < 0) {
        sFirstPersonCameraYaw += 0x200;
        if ((sCSideButtonYaw += 0x100) > 0) {
            sCSideButtonYaw = 0;
        }
    }
    if (sCSideButtonYaw > 0) {
        sFirstPersonCameraYaw -= 0x200;
        if ((sCSideButtonYaw -= 0x100) < 0) {
            sCSideButtonYaw = 0;
        }
    }

    focus[1] = (sMarioStatusForCamera->pos[1] + secondFocus[1]) / 2.f + 100.f;
    if (heldState == 1) {
        focus[1] += 300.f
                    * sins((gMarioStates[0].angleVel[1] > 0.f) ? gMarioStates[0].angleVel[1]
                                                               : -gMarioStates[0].angleVel[1]);
    }

    if (focusDistance < 400.f) {
        focusDistance = 400.f;
    }
    func_80280BD8(focusDistance, 6144);
    vec3f_set_dist_and_angle(pos, pos, D_8033B3EE, D_8033B3F0 + 0x1000, yaw);

    return yaw;
}

// 2nd iteration of data
s16 unused_8032D0A8[] = { 14, 1, 2, 4 };
s16 unused_8032D0B0[] = { 16, 9, 17, 0 };
u8 D_8032D0B8[] = { 0xA5, 0x8F, 0xA6, 0xA7, 0xAF, 0, 0,    0,    0,    1,    0,    0,    0xC5, 0x3D,
                    0x20, 0,    0x44, 0x64, 0,    0, 0xC5, 6,    0x40, 0,    0x44, 0x16, 0,    0,
                    0x3E, 0x99, 0x99, 0x9A, 0,    0, 0,    0,    0xC5, 0x92, 0x20, 0,    0x44, 0x65,
                    0x40, 0,    0xC5, 0x6D, 0xA0, 0, 0x44, 0x16, 0,    0,    0x3E, 0x99, 0x99, 0x9A };

/**
 * Table that dictates camera movement in bookend room.
 * Due to only the X being varied in the, this only moves along the X axis linearly.
 * Third entry is seemingly unused.
 */
struct ParallelTrackingTable BBHRoom6ParallelTrackingTable[3] = {
    { 1, { -929.0f, 1619.0f, -1490.0f }, 50.0f, 0.0f },
    { 0, { -2118.0f, 1619.0f, -1490.0f }, 50.0f, 0.0f },
    { 0, { 0.0f, 0.0f, 0.0f }, 0.0f, 0.0f },
};

s32 unused_return_mode_5_camera_yaw(UNUSED struct LevelCamera *c, UNUSED Vec3f focus,
                                    UNUSED Vec3f pos) {
}

void unused_80282678(UNUSED s32 unused) {
}

void update_boss_fight_camera(struct LevelCamera *c) {
    c->storedYaw = return_boss_fight_camera_yaw(c, c->focus, c->pos);
}

void update_parallel_tracking_camera(struct LevelCamera *c) {
    s16 dummy;

    func_8028B3DC(c, 0.f);
    set_fov_function(2);
    c->storedYaw = return_parallel_tracking_camera_yaw(c, c->focus, c->pos);
    camera_approach_s16_symmetric_bool(&dummy, 0, 0x0400);
}

void update_fixed_camera(struct LevelCamera *c) {
    UNUSED u8 unused[8];

    if (gCurrLevelNum == LEVEL_BBH) {
        set_fov_function(7);
    } else {
        set_fov_function(4);
    }
    c->storedYaw = return_fixed_camera_yaw(c, c->focus, c->pos);
    c->trueYaw = c->storedYaw;
    func_8027FF44(c);
    vec3f_set(sFixedPresetBasePositionOffset, 0.f, 0.f, 0.f);
}

s32 return_behind_mario_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    UNUSED u8 unused2[12];
    f32 sp48;
    UNUSED u8 unused3[4];
    s16 sp42;
    s16 sp40;
    s16 yaw;
    s16 sp3C = -sMarioStatusForCamera->faceAngle[0];
    s16 sp3A = sMarioStatusForCamera->faceAngle[1] + 32768;
    s16 sp38 = 0;
    s16 sp36;
    s16 sp34 = 32;
    UNUSED u8 unused[12];
    f32 sp24 = 800.f;
    f32 sp20 = 125.f;

    if (gCameraModeFlags & CAM_MODE_MARIO_ACTIVE) {
        sp24 = 350.f;
        sp20 = 120.f;
    }
    if (!(sMarioStatusForCamera->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER))) {
        sp34 = 128;
    }
    vec3f_copy(focus, sMarioStatusForCamera->pos);
    c->focus[1] += sp20;
    sp48 = calc_abs_dist(focus, pos);
    sp40 = calculate_verticle_angle(focus, pos);
    vec3f_get_dist_and_angle(focus, pos, &sp48, &sp40, &yaw);
    if (sp48 > sp24) {
        sp48 = sp24;
    }
    if ((sp42 = sp40) < 0) {
        sp42 = -sp42;
    }
    sp36 = 32 - sp42 / 0x200;
    if (sp36 < 1) {
        sp36 = 1;
    }
    if (sp36 > 32) {
        sp36 = 32;
    }

    if (sCSideButtonYaw != 0) {
        camera_approach_s16_symmetric_bool(&sCSideButtonYaw, 0, 1);
        sp36 = 8;
    }
    if (D_8033B3FA != 0) {
        sp3C = 0;
        camera_approach_s16_symmetric_bool(&D_8033B3FA, 0, 1);
        sp34 = 2048;
    }

    if (D_8033B3FA == 28) {
        if (sCSideButtonYaw < 5 || sCSideButtonYaw > 28) {
            play_sound_cbutton_up();
        }
    }
    if (sCSideButtonYaw == 28) {
        if (D_8033B3FA < 5 || D_8033B3FA > 28) {
            play_sound_cbutton_up();
        }
    }

    if (gCButtonsPressed & 2) {
        if (gPlayer1Controller->buttonPressed & L_CBUTTONS) {
            play_sound_cbutton_side();
        }
        if (sp48 < sp24) {
            camera_approach_f32_symmetric_bool(&sp48, sp24, 5.f);
        }
        sp38 = -16376;
        sCSideButtonYaw = 30;
        sp36 = 2;
    }
    if (gCButtonsPressed & 1) {
        if (gPlayer1Controller->buttonPressed & R_CBUTTONS) {
            play_sound_cbutton_side();
        }
        if (sp48 < sp24) {
            camera_approach_f32_symmetric_bool(&sp48, sp24, 5.f);
        }
        sp38 = 16376;
        sCSideButtonYaw = 30;
        sp36 = 2;
    }
    if (gCButtonsPressed & 4) {
        if (gPlayer1Controller->buttonPressed & (U_CBUTTONS | D_CBUTTONS)) {
            play_sound_cbutton_side();
        }
        if (sp48 < sp24) {
            camera_approach_f32_symmetric_bool(&sp48, sp24, 5.f);
        }
        sp3C = -12288;
        D_8033B3FA = 30;
        sp34 = 2048;
    }
    if (gCButtonsPressed & 8) {
        if (gPlayer1Controller->buttonPressed & (U_CBUTTONS | D_CBUTTONS)) {
            play_sound_cbutton_side();
        }
        if (sp48 < sp24) {
            camera_approach_f32_symmetric_bool(&sp48, sp24, 5.f);
        }
        sp3C = 12288;
        D_8033B3FA = 30;
        sp34 = 2048;
    }

    approach_s16_exponential_bool(&yaw, sp3A + sp38, sp36);
    camera_approach_s16_symmetric_bool(&sp40, sp3C, sp34);
    if (sp48 < 300.f) {
        sp48 = 300.f;
    }
    vec3f_set_dist_and_angle(focus, pos, sp48, sp40, yaw);
    if (gCurrLevelArea == AREA_WDW_MAIN) {
        yaw = clamp_positions_and_find_yaw_angle(pos, focus, 4508.f, -3739.f, 4508.f, -3739.f);
    }
    if (gCurrLevelArea == AREA_THI_HUGE) {
        yaw = clamp_positions_and_find_yaw_angle(pos, focus, 8192.f, -8192.f, 8192.f, -8192.f);
    }
    if (gCurrLevelArea == AREA_THI_TINY) {
        yaw = clamp_positions_and_find_yaw_angle(pos, focus, 2458.f, -2458.f, 2458.f, -2458.f);
    }

    return yaw;
}

s32 return_behind_mario_water_camera_yaw(struct LevelCamera *c) {
    struct MarioState *marioState = &gMarioStates[0];
    struct Surface *floor;
    Vec3f newPos;
    Vec3f oldPos;
    f32 waterHeight;
    f32 floorHeight;
    f32 distCamToFocus;
    s16 camPitch;
    s16 camYaw;
    s16 yaw;

    vec3f_copy(oldPos, c->pos);
    gCameraMovementFlags &= ~CAM_MOVE_INTO_C_UP;
    vec3f_copy(newPos, c->pos);
    yaw = return_behind_mario_camera_yaw(c, c->focus, newPos);
    c->pos[0] = newPos[0];
    c->pos[2] = newPos[2];
    if (c->currPreset == CAMERA_PRESET_WATER_SURFACE) {
        floorHeight = find_floor(c->pos[0], c->pos[1], c->pos[2], &floor);
        newPos[1] = marioState->waterLevel + 120;
        if (newPos[1] < (floorHeight += 120.f)) {
            newPos[1] = floorHeight;
        }
    }
    approach_camera_height(c, newPos[1], 50.f);
    waterHeight = find_water_level(c->pos[0], c->pos[2]) + 100.f;
    if (c->pos[1] <= waterHeight) {
        gCameraMovementFlags |= CAM_MOVE_SUBMERGED;
    } else {
        gCameraMovementFlags &= ~CAM_MOVE_SUBMERGED;
    }
    resolve_geometry_collisions(c->pos, oldPos);
    vec3f_get_dist_and_angle(c->focus, c->pos, &distCamToFocus, &camPitch, &camYaw);
    if (distCamToFocus > 800.f) {
        distCamToFocus = 800.f;
        vec3f_set_dist_and_angle(c->focus, c->pos, distCamToFocus, camPitch, camYaw);
    }
    func_8027FF44(c);

    return yaw;
}

s16 return_slide_camera_yaw(struct LevelCamera *c) {
    struct Surface *floor;
    f32 floorHeight;
    Vec3f pos;
    f32 distCamToFocus;
    f32 distToFocusOffset;
    f32 pitchScale;
    s16 camPitch;
    s16 camYaw;
    UNUSED struct MarioState *marioState = &gMarioStates[0];
    s16 goalPitch = 0x1555;
    s16 goalYaw = sMarioStatusForCamera->faceAngle[1] + 0x8000;

    if (gCameraFlags2 & CAM_FLAG_2_CCM_SLIDE_SHORTCUT) {
        D_8033B3EE = approach_f32(D_8033B3EE, -600.f, 20.f, 20.f);
    } else {
        D_8033B3EE = approach_f32(D_8033B3EE, 0.f, 20.f, 20.f);
    }

    play_camera_buzz_if_cbutton();
    vec3f_copy(c->focus, sMarioStatusForCamera->pos);
    c->focus[1] += 50.f;
    vec3f_get_dist_and_angle(c->focus, c->pos, &distCamToFocus, &camPitch, &camYaw);
    distToFocusOffset = 800.f;
    if (sMarioStatusForCamera->action == ACT_RIDING_HOOT) {
        distToFocusOffset = 1000.f;
        goalPitch = 0x2800;
        camera_approach_s16_symmetric_bool(&camYaw, goalYaw, 0x0100);
    } else {
        camera_approach_s16_symmetric_bool(&camYaw, goalYaw, 0x80);
    }
    camera_approach_s16_symmetric_bool(&camPitch, goalPitch, 0x0100);
    if (sMarioStatusForCamera->action != ACT_RIDING_HOOT
        && sGeometryForMario.currFloorType == SURFACE_DEATH_PLANE) {
        vec3f_set_dist_and_angle(c->focus, pos, distToFocusOffset + D_8033B3EE, camPitch, camYaw);
        c->pos[0] = pos[0];
        c->pos[2] = pos[2];
        camera_approach_f32_symmetric_bool(&c->pos[1], c->focus[1], 30.f);
        vec3f_get_dist_and_angle(c->pos, c->focus, &distCamToFocus, &camPitch, &camYaw);
        pitchScale = (distCamToFocus - distToFocusOffset + D_8033B3EE) / 10000.f;
        if (pitchScale > 1.f) {
            pitchScale = 1.f;
        }
        camPitch += 4096.f * pitchScale;
        vec3f_set_dist_and_angle(c->pos, c->focus, distCamToFocus, camPitch, camYaw);
    } else {
        vec3f_set_dist_and_angle(c->focus, c->pos, distToFocusOffset + D_8033B3EE, camPitch, camYaw);
        gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_1;
        floorHeight = find_floor(c->pos[0], c->pos[1] + 200.f, c->pos[2], &floor) + 125.f;
        if (c->pos[1] < floorHeight) {
            c->pos[1] = floorHeight;
        }
        vec3f_get_dist_and_angle(c->focus, c->pos, &distCamToFocus, &camPitch, &camYaw);
        if (distCamToFocus > distToFocusOffset + D_8033B3EE) {
            distCamToFocus = distToFocusOffset + D_8033B3EE;
            vec3f_set_dist_and_angle(c->focus, c->pos, distCamToFocus, camPitch, camYaw);
        }
    }

    camYaw = calculate_yaw(c->focus, c->pos);
    return camYaw;
}

void update_behind_mario_camera(struct LevelCamera *c) {
    c->storedYaw = return_behind_mario_water_camera_yaw(c);
}

s32 nop_return_water_camera_yaw(UNUSED struct LevelCamera *c, UNUSED Vec3f focus, UNUSED Vec3f pos) {
}

void update_water_surface_camera(struct LevelCamera *c) {
    c->storedYaw = return_behind_mario_water_camera_yaw(c);
}

s32 return_mario_yaw(UNUSED struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    s16 yaw = sMarioStatusForCamera->faceAngle[1] + sFirstPersonCameraYaw + 0x8000;
    set_cam_focus_and_pos_rel_mario(focus, pos, 125.f, 125.f, gCameraZoomDist, 0x05B0, yaw);

    return sMarioStatusForCamera->faceAngle[1];
}
extern f32 unused_80336070;

s16 return_close_or_free_roam_cam_yaw(struct LevelCamera *c) {
    Vec3f spBC;
    Vec3f spB0;
    UNUSED u8 unused1[12];
    struct Surface *marioFloor;
    struct Surface *sp9C;
    struct Surface *sp98;
    struct Surface *ceil;
    f32 sp90;
    f32 sp8C;
    f32 sp88;
    UNUSED u8 unused2[4];
    f32 distFocusToCam;
    f32 zoomDist;
    f32 sp78;
    f32 sp74;
    s16 sp72;
    s16 sp70;
    s16 yaw;
    s16 sp6C = sMarioStatusForCamera->faceAngle[1] + 32768;
    f32 sp68;
    f32 sp64;
    f32 sp60;
    s16 sp5E;
    s16 sp5C;
    f32 sp58;
    UNUSED u8 unused4[4];
    s16 sp52;
    s16 sp50 = 0;
    f32 sp4C;
    s32 sp48 = 0;
    s32 sp44 = 0;
    f32 ceilHeight = find_ceil(gCameraStatus.camFocAndPosCurrAndGoal[3][0],
                               gCameraStatus.camFocAndPosCurrAndGoal[3][1],
                               gCameraStatus.camFocAndPosCurrAndGoal[3][2], &ceil);
    s16 sp3E;

    handle_c_button_movement(c);
    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &distFocusToCam, &sp70, &yaw);

    if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
        if (test_or_set_mario_cam_active(0) == CAM_ANGLE_LAKITU_MARIO) {
            zoomDist = gCameraZoomDist + 1050;
        } else {
            zoomDist = gCameraZoomDist + 400;
        }
    } else {
        zoomDist = gCameraZoomDist;
    }

    if ((sMarioStatusForCamera->action & ACT_FLAG_HANGING)
        || sMarioStatusForCamera->action == ACT_RIDING_HOOT) {
        zoomDist *= 0.8f;
        set_spline_values(3);
    }

    if (D_8033B3F4 == 0.f) {
        if (distFocusToCam > zoomDist) {
            if ((distFocusToCam -= 50.f) < zoomDist) {
                distFocusToCam = zoomDist;
            }
        }
    } else {
        if ((D_8033B3F4 -= 30.f) < 0.f) {
            D_8033B3F4 = 0.f;
        }
        if (distFocusToCam > zoomDist) {
            if ((distFocusToCam -= 30.f) < zoomDist) {
                distFocusToCam = zoomDist;
            }
        }
        if (distFocusToCam < zoomDist) {
            if ((distFocusToCam += 30.f) > zoomDist) {
                distFocusToCam = zoomDist;
            }
        }
    }
    if (sCSideButtonYaw == 0) {
        if (c->currPreset == CAMERA_PRESET_FREE_ROAM) {
            sp52 = 192;
        } else {
            sp52 = 256;
        }
        if ((gPlayer1Controller->stickX != 0.f || gPlayer1Controller->stickY != 0.f) != 0) {
            sp52 = 32;
        }
    } else {
        if (sCSideButtonYaw < 0) {
            yaw += 0x200;
        }
        if (sCSideButtonYaw > 0) {
            yaw -= 0x200;
        }
        camera_approach_s16_symmetric_bool(&sCSideButtonYaw, 0, 256);
        sp52 = 0;
    }
    D_8032CFD4 = 1024;
    sp58 = calc_hor_dist(sMarioStatusForCamera->pos, c->pos);

    if (gCameraFlags2 & CAM_FLAG_2_BEHIND_MARIO_POST_DOOR) {
        if (sp58 >= 250) {
            gCameraFlags2 &= ~CAM_FLAG_2_BEHIND_MARIO_POST_DOOR;
        }
        if (ABS((sMarioStatusForCamera->faceAngle[1] - yaw) / 2) < 0x1800) {
            gCameraFlags2 &= ~CAM_FLAG_2_BEHIND_MARIO_POST_DOOR;
            yaw = sCameraYawAfterDoorCutscene + 32768;
            distFocusToCam = 800.f;
            gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_1;
        }
    } else if (sp58 < 250) {
        c->pos[0] += (250 - sp58) * sins(yaw);
        c->pos[2] += (250 - sp58) * coss(yaw);
        if (sCSideButtonYaw == 0) {
            sp52 = 4096;
            D_8032CFD4 = 0;
            vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &distFocusToCam, &sp70, &yaw);
        }
        sp44 |= 1;
    }

    if (-16 < gPlayer1Controller->stickY) {
        c->trueYaw = yaw;
    }

    return_height_above_floor(&sp68, 1, 200, &sp64, 0.9f, 200);
    vec3f_copy(spB0, c->pos);
    sp48 = func_8028F2F0(c, spB0, &sp72, 1536);
    if (sp48 == 3) {
        unused_8033B2AC = sp72;
        sCameraYawVelocity = yaw;
        gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_9;
        vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, spB0, &sp58, &sp5E, &sp5C);
        approach_s16_exponential_bool(&yaw, sp72, 10);
        vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, spB0, sp58, sp5E, sp5C);
        sCameraYawVelocity = (sCameraYawVelocity - yaw) / 256;
    } else {
        if (gMarioStates[0].forwardVel == 0.f) {
            if (gCameraFlags2 & CAM_FLAG_2_UNKNOWN_9) {
                if ((sp6C - yaw) / 256 >= 0) {
                    sp3E = -1;
                } else {
                    sp3E = 1;
                }
                if ((sCameraYawVelocity > 0 && sp3E > 0) || (sCameraYawVelocity < 0 && sp3E < 0)) {
                    sp50 = sp52;
                }
            } else {
                sp50 = sp52;
            }
        } else {
            if (sp52 == 4096) {
                sp50 = sp52;
            }
            gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_9;
        }
        if (sp48 != 0) {
            sp50 += sp50;
        }
        if ((sp44 & 1) && sp48 != 0) {
            sp50 = 0;
        }
        if (sp50 != 0 && get_dialog_id() == -1) {
            camera_approach_s16_symmetric_bool(&yaw, sp6C, sp50);
        }
    }
    if (sp48 == 0 && !(gCameraFlags2 & CAM_FLAG_2_UNKNOWN_9)) {
        approach_f32_exponential_bool(&distFocusToCam, zoomDist - 100.f, 0.05f);
    }
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, spB0, distFocusToCam, sp70, yaw);
    spB0[1] += sp68 + 125.f;
    if (find_and_return_count_wall_collisions(spB0, 10.f, 80.f) != 0) {
        gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_9;
    }
    c->focus[0] = sMarioStatusForCamera->pos[0];
    c->focus[1] = sMarioStatusForCamera->pos[1] + 125.f + sp64;
    c->focus[2] = sMarioStatusForCamera->pos[2];
    sp88 = 125.f + sGeometryForMario.currFloorHeight;
    marioFloor = sGeometryForMario.currFloor;
    sp90 = find_floor(spB0[0], spB0[1] + 50.f, spB0[2], &sp9C) + 125.f;
    for (sp4C = 0.1f; sp4C < 1.f; sp4C += 0.2f) {
        scale_along_line(spBC, spB0, sMarioStatusForCamera->pos, sp4C);
        sp8C = find_floor(spBC[0], spBC[1], spBC[2], &sp98) + 125.f;
        if (sp98 != NULL && sp8C > sp88) {
            sp88 = sp8C;
            marioFloor = sp98;
        }
    }
    if (gCameraModeFlags & CAM_MODE_MARIO_ACTIVE) {
        sp88 -= 35.f;
        sp90 -= 35.f;
        c->focus[1] -= 25.f;
    }
    sp78 = find_water_level(spB0[0], spB0[2]);
    if (sp78 != -11000.f) {
        sp78 += 125.f;
        sp60 = sp78 - sp88;
        if (!(gCameraMovementFlags & CAM_MOVE_UNKNOWN_6)) {
            if (sp60 > 800.f && (sMarioStatusForCamera->action & ACT_FLAG_METAL_WATER)) {
                gCameraMovementFlags |= CAM_MOVE_UNKNOWN_6;
            }
        } else {
            if (sp60 < 400.f || !(sMarioStatusForCamera->action & ACT_FLAG_METAL_WATER)) {
                gCameraMovementFlags &= ~CAM_MOVE_UNKNOWN_6;
            }
        }
        if (!(gCameraMovementFlags & CAM_MOVE_UNKNOWN_6) && sp90 < sp78) {
            sp90 = sp78;
        }
    } else {
        gCameraMovementFlags &= ~CAM_MOVE_UNKNOWN_6;
    }

    spB0[1] = sp90;
    vec3f_copy(spBC, spB0);
    spBC[1] -= 125.f;
    if (marioFloor != NULL && sp90 <= sp88) {
        sp48 = func_8028A0D4(c->focus, spBC, marioFloor, 0, -1);
        if (sp48 != 1 && ceilHeight > sp88) {
            sp90 = sp88;
        }
    }
    sp68 = 0.f;
    if (c->currPreset == CAMERA_PRESET_FREE_ROAM) {
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            sp68 = 375.f;
            if (gCurrLevelArea == AREA_SSL_PYRAMID) {
                sp68 /= 2;
            }
        } else {
            sp68 = 100.f;
        }
    }
    if ((gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) && (gCameraModeFlags & CAM_MODE_MARIO_ACTIVE)) {
        sp68 = 610.f;
        if (gCurrLevelArea == AREA_SSL_PYRAMID || gCurrLevelNum == LEVEL_CASTLE) {
            sp68 /= 2;
        }
    }
    sp74 = find_poison_gas_level(spB0[0], spB0[2]);
    if (sp74 != -11000.f) {
        if ((sp74 += 130.f) > c->pos[1]) {
            c->pos[1] = sp74;
        }
    }
    if ((sMarioStatusForCamera->action & ACT_FLAG_HANGING)
        || sMarioStatusForCamera->action == ACT_RIDING_HOOT) {
        sp90 = sMarioStatusForCamera->pos[1] + 400.f;
        if (c->currPreset == CAMERA_PRESET_FREE_ROAM) {
            sp90 -= 100.f;
        }
        ceilHeight = 20000.f;
        vec3f_copy(c->focus, sMarioStatusForCamera->pos);
    }
    if (sMarioStatusForCamera->action & ACT_FLAG_ON_POLE) {
        sp90 = gMarioStates[0].usedObj->oPosY + 125.f;
        if (sMarioStatusForCamera->pos[1] - 100.f > sp90) {
            sp90 = sMarioStatusForCamera->pos[1] - 100.f;
        }
        ceilHeight = 20000.f;
        vec3f_copy(c->focus, sMarioStatusForCamera->pos);
    }
    if (sp90 != -11000.f) {
        sp90 += sp68;
        approach_camera_height(c, sp90, 20.f);
    }
    c->pos[0] = spB0[0];
    c->pos[2] = spB0[2];
    spB0[0] = gCameraStatus.camFocAndPosCurrAndGoal[3][0];
    spB0[1] = c->pos[1];
    spB0[2] = gCameraStatus.camFocAndPosCurrAndGoal[3][2];
    vec3f_get_dist_and_angle(spB0, c->pos, &distFocusToCam, &sp5E, &sp5C);
    if (distFocusToCam > 50.f) {
        distFocusToCam = 50.f;
        vec3f_set_dist_and_angle(spB0, c->pos, distFocusToCam, sp5E, sp5C);
    }
    if (sGeometryForMario.currFloorType != SURFACE_DEATH_PLANE) {
        vec3f_get_dist_and_angle(c->focus, c->pos, &distFocusToCam, &sp5E, &sp5C);
        if (distFocusToCam > zoomDist) {
            distFocusToCam = zoomDist;
            vec3f_set_dist_and_angle(c->focus, c->pos, distFocusToCam, sp5E, sp5C);
        }
    }
    if (ceilHeight != 20000.f) {
        if (c->pos[1] > (ceilHeight -= 150.f)
            && (sp48 = func_8028A0D4(c->pos, sMarioStatusForCamera->pos, ceil, 0, -1)) == 1) {
            c->pos[1] = ceilHeight;
        }
    }
    if (gCurrLevelArea == AREA_WDW_TOWN) {
        yaw = clamp_positions_and_find_yaw_angle(c->pos, c->focus, 2254.f, -3789.f, 3790.f, -2253.f);
    }
    return yaw;
}

void update_close_or_free_roam_camera(struct LevelCamera *c) {
    set_fov_function(2);
    c->storedYaw = return_close_or_free_roam_cam_yaw(c);
    func_8027FF44(c);
}

void camera_lakitu_zoom_distance(struct LevelCamera *c) {
    gCameraZoomDist = 800.f;
    update_close_or_free_roam_camera(c);
}

void camera_mario_zoom_distance(struct LevelCamera *c) {
    gCameraZoomDist = 350.f;
    update_close_or_free_roam_camera(c);
}

s32 return_spiral_stairs_camera_yaw(struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    UNUSED s16 unused1;
    s16 sp5C;
    s16 sp5A;
    s16 sp58;
    s16 sp56;
    s16 sp54;
    UNUSED s32 unused2;
    Vec3f sp44;
    Vec3f sp38;
    struct Surface *floor;
    f32 sp30;
    f32 sp2C;
    f32 sp28;
    f32 sp24;

    handle_c_button_movement(c);
    vec3f_set(sFixedPresetBasePosition, -1280.f, 614.f, 1740.f);
    return_height_above_floor(&sp2C, 1.f, 200.f, &sp2C, 0.9f, 200.f);
    focus[0] = sMarioStatusForCamera->pos[0];
    sp24 = sMarioStatusForCamera->pos[1] + 125.f + sp2C;
    focus[2] = sMarioStatusForCamera->pos[2];
    vec3f_copy(sp44, pos);
    vec3f_get_dist_and_angle(sFixedPresetBasePosition, focus, &sp30, &sp5A, &sp58);
    vec3f_get_dist_and_angle(sFixedPresetBasePosition, sp44, &sp30, &sp56, &sp54);
    D_8033B404 = sp54 - sp58;
    if (D_8033B404 < -0x4000) {
        D_8033B404 = -0x4000;
    }
    if (D_8033B404 > 0x4000) {
        D_8033B404 = 0x4000;
    }
    sp58 += D_8033B404;
    sp54 = sp58;
    camera_approach_s16_symmetric_bool(&sp54, sp58, 4096);
    vec3f_set_dist_and_angle(sFixedPresetBasePosition, sp44, 300.f, 0, sp54);
    sp38[0] = focus[0] + (sp44[0] - focus[0]) * 0.7f;
    sp38[1] = focus[1] + (sp44[1] - focus[1]) * 0.7f + 300.f;
    sp38[2] = focus[2] + (sp44[2] - focus[2]) * 0.7f;
    sp28 = find_floor(sp38[0], sp38[1] + 50.f, sp38[2], &floor);

    if (sp28 != -11000.f) {
        if (sp28 < sGeometryForMario.currFloorHeight) {
            sp28 = sGeometryForMario.currFloorHeight;
        }
        pos[1] = approach_f32(pos[1], (sp28 += 125.f), 30.f, 30.f);
    }

    camera_approach_f32_symmetric_bool(&focus[1], sp24, 30.f);
    pos[0] = sp44[0];
    pos[2] = sp44[2];
    sp5C = calculate_yaw(focus, pos);

    return sp5C;
}

void update_spiral_stairs_camera(struct LevelCamera *c) {
    c->storedYaw = return_spiral_stairs_camera_yaw(c, c->focus, c->pos);
}

s32 return_slide_or_0f_camera_yaw(UNUSED struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    s16 sp2E = sMarioStatusForCamera->faceAngle[1] + sFirstPersonCameraYaw + 32768;

    set_cam_focus_and_pos_rel_mario(focus, pos, 125.f, 125.f, 800.f, 5461, sp2E);
    return sMarioStatusForCamera->faceAngle[1];
}

static void unused_update_mode_0f_camera(struct LevelCamera *c) {
    if (gPlayer1Controller->buttonPressed & U_CBUTTONS) {
        gCameraMovementFlags |= CAM_MOVE_C_UP_MODE;
    }
    c->storedYaw = return_slide_camera_yaw(c);
}

void update_slide_camera(struct LevelCamera *c) {
    if (sGeometryForMario.currFloorType == SURFACE_CLOSE_CAMERA
        || sGeometryForMario.currFloorType == SURFACE_NO_CAM_COL_SLIPPERY) {
        camera_lakitu_zoom_distance(c);
    } else {
        if (gPlayer1Controller->buttonPressed & U_CBUTTONS) {
            gCameraMovementFlags |= CAM_MOVE_C_UP_MODE;
        }
        c->storedYaw = return_slide_camera_yaw(c);
    }
}

void func_80284CBC(struct LevelCamera *c) {
    vec3f_copy(D_8033B498.pos, c->pos);
    vec3f_sub(D_8033B498.pos, sMarioStatusForCamera->pos);
    vec3f_set(D_8033B498.focus, 0.f, c->focus[1] - sMarioStatusForCamera->pos[1], 0.f);
}

s32 func_80284D44(struct LevelCamera *c) {
    if (!(gCameraMovementFlags & CAM_MOVE_C_UP_MODE)) {
        gCameraMovementFlags |= CAM_MOVE_C_UP_MODE;
        func_80284CBC(c);
        gCameraFlags1 &= ~CAM_FLAG_1_UNKNOWN_0;
        return 1;
    }
    return 0;
}

s32 exit_c_up_mode(struct LevelCamera *c) {
    struct Surface *surface;
    Vec3f sp68;
    Vec3f sp5C;
    s32 sp58 = 0;
    s32 i;
    f32 sp50;
    f32 sp4C;
    f32 sp48;
    f32 sp44;
    s16 sp42;
    s16 sp40;
    s16 sp3E = 0;
    Vec3f sp30;
    Vec3f sp24;

    if ((gCameraMovementFlags & CAM_MOVE_C_UP_MODE) && !(gCameraMovementFlags & CAM_MOVE_UNKNOWN_10)) {
        vec3f_copy(sp30, D_8033B498.pos);
        vec3f_add(sp30, sMarioStatusForCamera->pos);
        vec3f_copy(sp24, D_8033B498.focus);
        vec3f_add(sp24, sMarioStatusForCamera->pos);
        vec3f_copy(sp68, c->focus);
        sp68[0] = sMarioStatusForCamera->pos[0];
        sp68[2] = sMarioStatusForCamera->pos[2];
        vec3f_get_dist_and_angle(sp68, c->pos, &sp48, &sp42, &sp40);
        vec3f_copy(sp5C, c->pos);
        sp48 = 80.f;
        if (D_8033B418.unk2 == CAMERA_PRESET_SPIRAL_STAIRS || D_8033B418.unk2 == CAMERA_PRESET_CLOSE
            || D_8033B418.unk2 == CAMERA_PRESET_FREE_ROAM) {
            sp58 = 1;
            for (i = 0; i < 16 && sp58 == 1; i++) {
                vec3f_set_dist_and_angle(sp68, sp5C, sp48, 0, sp40 + sp3E);
                if (f32_find_wall_collision(&sp5C[0], &sp5C[1], &sp5C[2], 20.f, 50.f) == 0) {
                    for (sp44 = sp48; sp44 < gCameraZoomDist; sp44 += 20.f) {
                        vec3f_set_dist_and_angle(sp68, sp5C, sp44, 0, sp40 + sp3E);
                        sp50 = find_ceil(sp5C[0], sp5C[1] - 150.f, sp5C[2], &surface) + -10.f;
                        if (surface != NULL && sp50 < sp5C[1]) {
                            break;
                        }
                        sp4C = find_floor(sp5C[0], sp5C[1] + 150.f, sp5C[2], &surface) + 10.f;
                        if (surface != NULL && sp4C > sp5C[1]) {
                            break;
                        }
                        if (f32_find_wall_collision(&sp5C[0], &sp5C[1], &sp5C[2], 20.f, 50.f) == 1) {
                            break;
                        }
                    }
                    if (sp44 >= gCameraZoomDist) {
                        sp58 = 0;
                    }
                }
                if (sp58 == 1) {
                    sp3E = -sp3E;
                    if (sp3E < 0) {
                        sp3E -= 0x1000;
                    } else {
                        sp3E += 0x1000;
                    }
                }
            }
            if (sp58 == 0) {
                vec3f_set_dist_and_angle(sp68, D_8033B498.pos, gCameraZoomDist, 0, sp40 + sp3E);
                vec3f_copy(D_8033B498.focus, sp68);
                vec3f_sub(D_8033B498.pos, sMarioStatusForCamera->pos);
                vec3f_sub(D_8033B498.focus, sMarioStatusForCamera->pos);
            }
            gCameraMovementFlags |= CAM_MOVE_UNKNOWN_10;
            init_transitional_movement(c, 15);
        } else {
            gCameraMovementFlags &= ~(CAM_MOVE_UNKNOWN_10 | CAM_MOVE_C_UP_MODE);
            vec3f_set_dist_and_angle(sp68, c->pos, sp48, sp42, sp40 + sp3E);
        }
        play_sound_cbutton_down();
    }
    return 0;
}

s32 return_first_person_camera_yaw(UNUSED struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    s16 pitch = sFirstPersonCameraPitch;
    s16 yaw = sMarioStatusForCamera->faceAngle[1] + sFirstPersonCameraYaw + 32768;

    set_cam_focus_and_pos_rel_mario(focus, pos, 125.f, 125.f, 250.f, pitch, yaw);
    return sMarioStatusForCamera->faceAngle[1];
}

void operate_c_up_looking(UNUSED struct LevelCamera *c) {
    UNUSED s16 pitch = sFirstPersonCameraPitch;
    UNUSED s16 yaw = sFirstPersonCameraYaw;

    sFirstPersonCameraPitch += (s16)(gPlayer1Controller->stickY * 10.f);
    sFirstPersonCameraYaw -= (s16)(gPlayer1Controller->stickX * 10.f);

    if (sFirstPersonCameraPitch > 14563) {
        sFirstPersonCameraPitch = 14563;
    }
    if (sFirstPersonCameraPitch < -8192) {
        sFirstPersonCameraPitch = -8192;
    }
    if (sFirstPersonCameraYaw > 21845) {
        sFirstPersonCameraYaw = 21845;
    }
    if (sFirstPersonCameraYaw < -21845) {
        sFirstPersonCameraYaw = -21845;
    }

    // Set mario's head angles maybe?
    sMarioStatusForCamera->unk16[0] = sFirstPersonCameraPitch * 3 / 4;
    sMarioStatusForCamera->unk16[1] = sFirstPersonCameraYaw * 3 / 4;
}

void func_8028547C(struct LevelCamera *c) {
    struct Struct8033B418_sub *sp2C = &D_8033B418.unk8;
    struct Struct8033B418_sub *sp28 = &D_8033B418.unk28;
    f32 sp24 = sp28->unk18 - sp2C->unk18;
    s16 sp22 = sp28->unk1C - sp2C->unk1C;
    s16 sp20 = sp28->unk1E - sp2C->unk1E;

    sp24 = sp2C->unk18 + sp24 * D_8033B418.unk6 / D_8033B418.unk4;
    sp22 = sp2C->unk1C + sp22 * D_8033B418.unk6 / D_8033B418.unk4;
    sp20 = sp2C->unk1E + sp20 * D_8033B418.unk6 / D_8033B418.unk4;
    c->focus[0] = sp2C->unk0[0] + (sp28->unk0[0] - sp2C->unk0[0]) * D_8033B418.unk6 / D_8033B418.unk4;
    c->focus[1] = sp2C->unk0[1] + (sp28->unk0[1] - sp2C->unk0[1]) * D_8033B418.unk6 / D_8033B418.unk4;
    c->focus[2] = sp2C->unk0[2] + (sp28->unk0[2] - sp2C->unk0[2]) * D_8033B418.unk6 / D_8033B418.unk4;
    vec3f_add(c->focus, sMarioStatusForCamera->pos);
    vec3f_set_dist_and_angle(c->focus, c->pos, sp24, sp22, sp20);
    sMarioStatusForCamera->unk16[0] = 0;
    sMarioStatusForCamera->unk16[1] = 0;
    if (++D_8033B418.unk6 == D_8033B418.unk4) {
        gCameraMovementFlags &= ~CAM_MOVE_INTO_C_UP;
    }
}

s32 update_c_up_camera(struct LevelCamera *c) {
    UNUSED u8 unused[16];

    if (!(gCameraFlags1 & CAM_FLAG_1_UNKNOWN_0)) {
        play_sound_cbutton_up();
        gCameraFlags1 |= CAM_FLAG_1_UNKNOWN_0;
    }
    if (gCameraMovementFlags & CAM_MOVE_INTO_C_UP) {
        gCameraMovementFlags |= CAM_MOVE_C_UP_MODE;
        func_8028547C(c);
        return 1;
    }
    if (!(gCameraMovementFlags & CAM_MOVE_UNKNOWN_10)) {
        operate_c_up_looking(c);
        return_first_person_camera_yaw(c, c->focus, c->pos);
    } else {
        if (gCameraFlags2 & CAM_FLAG_2_UNKNOWN_11) {
            vec3f_copy(c->pos, D_8033B498.pos);
            vec3f_add(c->pos, sMarioStatusForCamera->pos);
            vec3f_copy(c->focus, D_8033B498.focus);
            vec3f_add(c->focus, sMarioStatusForCamera->pos);
            camera_approach_s16_symmetric_bool(&sMarioStatusForCamera->unk16[0], 0, 1024);
            camera_approach_s16_symmetric_bool(&sMarioStatusForCamera->unk16[1], 0, 1024);
        } else {
            gCameraMovementFlags &= ~(CAM_MOVE_UNKNOWN_10 | CAM_MOVE_C_UP_MODE);
        }
    }
    D_8033B40C = 0.f;
    if (gPlayer1Controller->buttonPressed
        & (A_BUTTON | B_BUTTON | D_CBUTTONS | L_CBUTTONS | R_CBUTTONS)) {
        exit_c_up_mode(c);
    }
    return 0;
}

s32 return_cannon_camera_yaw(UNUSED struct LevelCamera *c, Vec3f focus, Vec3f pos) {
    set_cam_focus_and_pos_rel_mario(pos, focus, 125.f + D_8033B410, 125.f, 800.f,
                                    sMarioStatusForCamera->faceAngle[0],
                                    sMarioStatusForCamera->faceAngle[1]);
    return sMarioStatusForCamera->faceAngle[1];
}

void update_cannon_camera(struct LevelCamera *c) {
    UNUSED u8 unused[24];

    D_8033B3F0 = 0;
    gCameraMovementFlags &= ~CAM_MOVE_INTO_C_UP;
    c->storedYaw = return_cannon_camera_yaw(c, c->focus, c->pos);
    if (gPlayer1Controller->buttonPressed & A_BUTTON) {
        func_80285BD8(c, 3, 1);
        D_8033B40C = 0;
        D_8033B410 = 0;
        gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_1;
    } else {
        D_8033B410 = approach_f32(D_8033B410, 0.f, 100.f, 100.f);
    }
}

void init_transitional_movement(UNUSED struct LevelCamera *c, s16 timerLength) {
    if (!(gCameraFlags2 & CAM_FLAG_2_FRAME_AFTER_CAM_INIT)) {
        gCameraFlags2 |= (CAM_FLAG_2_UNKNOWN_10 | CAM_FLAG_2_UNKNOWN_11);
        sCameraTransition.timer = timerLength;
    }
}

/**
 * If the camera preset is not the new preset, set it to be so and initialize.
 * If the new preset is -1, keep the old and only do the initialization.
 */
void set_camera_preset(struct LevelCamera *c, s16 newPreset, s16 transitionTimer) {
    if (c->currPreset != newPreset) {
        D_8033B418.unk0 = (newPreset != -1) ? newPreset : D_8033B418.unk2;
        D_8033B418.unk2 = c->currPreset;
        c->currPreset = D_8033B418.unk0;
        gCameraMovementFlags &= 0xFF02;
        if (!(gCameraFlags2 & CAM_FLAG_2_FRAME_AFTER_CAM_INIT)) {
            init_transitional_movement(c, transitionTimer);
            sFirstPersonCameraPitch = 0;
            sFirstPersonCameraYaw = 0;
            D_8033B3EE = 0;
            D_8033B3F0 = 0;
            D_8033B3EC = 0;
            D_8033B40C = 0.f;
            D_8033B410 = 0.f;
        }
    }
}

void func_80285BD8(struct LevelCamera *a, s16 b, s16 c) {
    struct Struct8033B418_sub *sp24 = &D_8033B418.unk8;
    struct Struct8033B418_sub *sp20 = &D_8033B418.unk28;

    if (b == 8 && gCurrLevelArea == AREA_TTM_OUTSIDE) {
    } else {
        gCameraMovementFlags &= 0xFF02;
        gCameraMovementFlags |= CAM_MOVE_INTO_C_UP;
        if (b == 0) {
            b = 4;
        }
        sFirstPersonCameraPitch = 0;
        sFirstPersonCameraYaw = 0;
        D_8033B3EE = 0;
        D_8033B3F0 = 0;
        D_8033B3EC = 0;
        D_8033B418.unk0 = (b != -1) ? b : D_8033B418.unk2;
        D_8033B418.unk2 = a->currPreset;
        D_8033B418.unk4 = c;
        D_8033B418.unk6 = 1;
        a->currPreset = D_8033B418.unk0;
        gCameraStatus.modeActive = a->currPreset;
        vec3f_copy(sp20->unk0, a->focus);
        vec3f_sub(sp20->unk0, sMarioStatusForCamera->pos);
        vec3f_copy(sp20->unkC, a->pos);
        vec3f_sub(sp20->unkC, sMarioStatusForCamera->pos);
        sYawFocToMario = TableCameraTransitions[D_8033B418.unk0](a, sp20->unk0, sp20->unkC);
        vec3f_sub(sp20->unk0, sMarioStatusForCamera->pos);
        vec3f_sub(sp20->unkC, sMarioStatusForCamera->pos);
        vec3f_copy(sp24->unk0, gCameraStatus.camFocAndPosCurrAndGoal[0]);
        vec3f_sub(sp24->unk0, sMarioStatusForCamera->pos);
        vec3f_copy(sp24->unkC, gCameraStatus.camFocAndPosCurrAndGoal[1]);
        vec3f_sub(sp24->unkC, sMarioStatusForCamera->pos);
        vec3f_get_dist_and_angle(sp24->unk0, sp24->unkC, &sp24->unk18, &sp24->unk1C, &sp24->unk1E);
        vec3f_get_dist_and_angle(sp20->unk0, sp20->unkC, &sp20->unk18, &sp20->unk1C, &sp20->unk1E);
    }
}

void func_80285E70(struct LevelCamera *c) {
    struct Surface *floor = NULL;
    Vec3f sp50;
    Vec3f sp44;
    UNUSED u8 unused1[12];
    f32 sp34;
    s16 sp32;
    UNUSED u8 unused2[8];

    if (gCameraMovementFlags & CAM_MOVE_PAUSE_SCREEN) {
    } else {
        if (c->cutscene) {
        }
        if (1) {
            sp32 = func_8028C824(sp50, sp44, c->pos, c->focus, sCameraPosition, sCameraFocus,
                                 c->storedYaw);
            set_or_approach_s16_symmetric(&c->trueYaw, sp32, D_8032CFD4);
            gCameraFlags2 &= ~CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
        } else {
            //! dead code
            vec3f_copy(sp50, c->pos);
            vec3f_copy(sp44, c->focus);
        }
        vec3f_copy(sCameraPosition, sp50);
        vec3f_copy(sCameraFocus, sp44);
        gCameraStatus.trueYaw = c->trueYaw;
        gCameraStatus.storedYaw = c->storedYaw;
        vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[3], c->pos);
        vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[2], c->focus);
        set_or_approach_vec3f_exponential(gCameraStatus.camFocAndPosCurrAndGoal[1], sp50,
                                          gCameraStatus.unkAC, gCameraStatus.unkB0,
                                          gCameraStatus.unkAC);
        set_or_approach_vec3f_exponential(gCameraStatus.camFocAndPosCurrAndGoal[0], sp44,
                                          gCameraStatus.unkA4, gCameraStatus.unkA8,
                                          gCameraStatus.unkA4);
        set_or_approach_f32_exponential(&gCameraStatus.unkA4, 0.8f, 0.05f);
        set_or_approach_f32_exponential(&gCameraStatus.unkA8, 0.3f, 0.05f);
        set_or_approach_f32_exponential(&gCameraStatus.unkAC, 0.3f, 0.05f);
        set_or_approach_f32_exponential(&gCameraStatus.unkB0, 0.3f, 0.05f);
        if (gCameraFlags2 & CAM_FLAG_2_UNKNOWN_1) {
            gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_1;
        } else {
            gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
        }
        vec3f_copy(gCameraStatus.pos, gCameraStatus.camFocAndPosCurrAndGoal[1]);
        vec3f_copy(gCameraStatus.focus, gCameraStatus.camFocAndPosCurrAndGoal[0]);
        if (c->cutscene) {
            vec3f_add(gCameraStatus.focus, D_8033B218);
            vec3f_set(D_8033B218, 0, 0, 0);
        }

        vec3f_get_dist_and_angle(gCameraStatus.pos, gCameraStatus.focus, &gCameraStatus.focusDistance,
                                 &gCameraStatus.pitch, &gCameraStatus.yaw);

        gCameraStatus.roll = 0;

        shake_camera_pitch(gCameraStatus.pos, gCameraStatus.focus);
        shake_camera_yaw(gCameraStatus.pos, gCameraStatus.focus);
        shake_camera_roll(&gCameraStatus.roll);

        set_face_angle_from_spline(gCameraStatus.pos, gCameraStatus.focus);

        if (sMarioStatusForCamera->action == ACT_DIVE && gCameraStatus.lastFrameAction != ACT_DIVE) {
            set_camera_shake(SHAKE_HIT_FROM_BELOW);
        }

        gCameraStatus.roll += sCameraCutsceneRollOffset;
        gCameraStatus.roll += gCameraStatus.cameraKeyCutsceneRollOffset;

        if (c->currPreset != CAMERA_PRESET_C_UP_LOOK && c->cutscene == 0) {
            gCheckingSurfaceCollisionsForCamera = 1;
            sp34 = find_floor(gCameraStatus.pos[0], gCameraStatus.pos[1] + 20.0f, gCameraStatus.pos[2],
                              &floor);
            if (sp34 != -11000.f) {
                if (gCameraStatus.pos[1] < (sp34 += 100.0f)) {
                    gCameraStatus.pos[1] = sp34;
                } else {
                    gCheckingSurfaceCollisionsForCamera = 0;
                }
            }
        }
        vec3f_copy(sCameraTransition.marioPos, sMarioStatusForCamera->pos);
    }
    clamp_pitch(gCameraStatus.pos, gCameraStatus.focus, 15872, -15872);
    gCameraStatus.modeActive = c->currPreset;
    gCameraStatus.modeDefault = c->defPreset;
}

void update_camera(struct LevelCamera *c) {
    UNUSED u8 unused[24];

    gCurrLevelCamera = c;
    update_camera_status(c);
    if (c->cutscene == 0) {
        if (select_or_activate_mario_cam(0) == CAM_ANGLE_LAKITU_MARIO) {
            if (gPlayer1Controller->buttonPressed & R_TRIG) {
                if (test_or_set_mario_cam_active(0) == CAM_ANGLE_LAKITU_FIXED) {
                    test_or_set_mario_cam_active(1);
                } else {
                    test_or_set_mario_cam_active(2);
                }
            }
        }
        func_8028B36C();
    }
    gCameraFlags2 &= ~CAM_FLAG_2_FRAME_AFTER_CAM_INIT;
    if (gCameraMovementFlags & CAM_MOVE_INIT_CAMERA) {
        init_camera(c);
        gCameraMovementFlags &= ~CAM_MOVE_INIT_CAMERA;
        gCameraFlags2 |= CAM_FLAG_2_FRAME_AFTER_CAM_INIT;
    }

    sGeometryForMario.prevFloorHeight = sGeometryForMario.currFloorHeight;
    sGeometryForMario.prevCeilHeight = sGeometryForMario.currCeilHeight;
    sGeometryForMario.prevFloor = sGeometryForMario.currFloor;
    sGeometryForMario.prevCeil = sGeometryForMario.currCeil;
    sGeometryForMario.prevFloorType = sGeometryForMario.currFloorType;
    sGeometryForMario.prevCeilType = sGeometryForMario.currCeilType;

    find_mario_relative_geometry(&sGeometryForMario);
    gCheckingSurfaceCollisionsForCamera = 1;
    vec3f_copy(c->pos, gCameraStatus.camFocAndPosCurrAndGoal[3]);
    vec3f_copy(c->focus, gCameraStatus.camFocAndPosCurrAndGoal[2]);

    c->trueYaw = gCameraStatus.trueYaw;
    c->storedYaw = gCameraStatus.storedYaw;
    c->currPreset = gCameraStatus.modeActive;
    c->defPreset = gCameraStatus.modeDefault;

    level_specific_camera_update(c);
    dummy_802877EC(c);
    gCButtonsPressed = find_c_buttons_pressed(gCButtonsPressed, gPlayer1Controller->buttonPressed,
                                              gPlayer1Controller->buttonDown);
    if (c->cutscene != 0) {
        D_8032CFD4 = 0;
        handle_cutscenes(c);
        sCutsceneTransitionTimer = 0;
    } else {
        if (gCutsceneNumber != 0 && sCutsceneTransitionTimer < 8) {
            sCutsceneTransitionTimer++;
            if (sCutsceneTransitionTimer >= 8) {
                gCutsceneNumber = 0;
                sCutsceneTransitionTimer = 0;
            }
        }
    }
    if (c->cutscene == 0) {
        D_8032CFD4 = 0x400;

        if (gCameraModeFlags & CAM_MODE_MARIO_ACTIVE) {
            switch (c->currPreset) {
                case CAMERA_PRESET_BEHIND_MARIO:
                    update_behind_mario_camera(c);
                    break;

                case CAMERA_PRESET_C_UP_LOOK:
                    update_c_up_camera(c);
                    break;

                case CAMERA_PRESET_WATER_SURFACE:
                    update_water_surface_camera(c);
                    break;

                case CAMERA_PRESET_INSIDE_CANNON:
                    update_cannon_camera(c);
                    break;

                default:
                    camera_mario_zoom_distance(c);
            }
        } else {
            switch (c->currPreset) {
                case CAMERA_PRESET_BEHIND_MARIO:
                    update_behind_mario_camera(c);
                    break;

                case CAMERA_PRESET_C_UP_LOOK:
                    update_c_up_camera(c);
                    break;

                case CAMERA_PRESET_WATER_SURFACE:
                    update_water_surface_camera(c);
                    break;

                case CAMERA_PRESET_INSIDE_CANNON:
                    update_cannon_camera(c);
                    break;

                case CAMERA_PRESET_PLATFORM_LEVEL:
                    update_platform_level_camera(c);
                    break;

                case CAMERA_PRESET_OPEN_CAMERA:
                    update_open_camera(c);
                    break;

                case CAMERA_PRESET_REVERSE_TOWER:
                    update_reverse_tower_camera(c);
                    break;

                case CAMERA_PRESET_CLOSE:
                    camera_lakitu_zoom_distance(c);
                    break;

                case CAMERA_PRESET_FREE_ROAM:
                    camera_lakitu_zoom_distance(c);
                    break;
                case CAMERA_PRESET_BOSS_FIGHT:
                    update_boss_fight_camera(c);
                    break;

                case CAMERA_PRESET_PARALLEL_TRACKING:
                    update_parallel_tracking_camera(c);
                    break;

                case CAMERA_PRESET_SLIDE_HOOT:
                    update_slide_camera(c);
                    break;

                case CAMERA_PRESET_FIXED_REF_POINT:
                    update_fixed_camera(c);
                    break;

                case CAMERA_PRESET_SPIRAL_STAIRS:
                    update_spiral_stairs_camera(c);
                    break;
            }
        }
    }
    set_camera_cutscene_table(c, return_cutscene_table(c));
    dummy_802877D8(c);
    gCheckingSurfaceCollisionsForCamera = 0;
    if (gCurrLevelNum != LEVEL_CASTLE) {
        if ((c->cutscene == 0 && (gPlayer1Controller->buttonDown & R_TRIG)
             && select_or_activate_mario_cam(0) == CAM_ANGLE_LAKITU_FIXED)
            || (gCameraMovementFlags & CAM_MOVE_UNKNOWN_7)
            || (sMarioStatusForCamera->action) == ACT_GETTING_BLOWN) {
            if (c->cutscene == 0 && (gPlayer1Controller->buttonPressed & R_TRIG)
                && select_or_activate_mario_cam(0) == CAM_ANGLE_LAKITU_FIXED) {
                gCameraFlags1 |= CAM_FLAG_1_UNKNOWN_5;
                play_sound_rbutton_changed();
            }
            gCameraStatus.unkAC = 0.f;
            gCameraStatus.unkB0 = 0.f;
            c->storedYaw = calculate_yaw(gCameraStatus.focus, gCameraStatus.pos);
            c->trueYaw = c->storedYaw;
            gCameraMovementFlags &= ~CAM_MOVE_UNKNOWN_7;
        } else {
            if (gCameraFlags1 & CAM_FLAG_1_UNKNOWN_5) {
                play_sound_rbutton_changed();
                gCameraFlags1 &= ~CAM_FLAG_1_UNKNOWN_5;
            }
        }
    } else {
        if ((gPlayer1Controller->buttonPressed & R_TRIG) && select_or_activate_mario_cam(0) == CAM_ANGLE_LAKITU_FIXED) {
            play_sound_button_change_blocked();
        }
    }
    func_80285E70(c);
    gCameraStatus.lastFrameAction = sMarioStatusForCamera->action;
}

void reset_camera(struct LevelCamera *c) {
    UNUSED s32 sp34 = 0;
    UNUSED u8 unused[16];
    UNUSED struct Struct8033B418_sub *sp20 = &D_8033B418.unk8;
    UNUSED struct Struct8033B418_sub *sp1C = &D_8033B418.unk28;

    gCurrLevelCamera = c;
    gCameraMovementFlags = 0;
    sCameraSideCFlags = 0;
    gCameraFlags2 = 0;
    gCutsceneTimer = 0;
    D_8033B6EA = 0;
    sCutscenePhase = 0;
    gCutsceneActive = FALSE;
    gCutsceneFocus = NULL;
    unused_8032CFC8 = 0;
    unused_8032CFCC = 0;
    gSecondCameraFocus = NULL;
    gCButtonsPressed = 0;
    vec3f_copy(sCameraTransition.marioPos, sMarioStatusForCamera->pos);
    sCameraTransition.timer = 0;
    unused_8032CFCC = -1;
    unused_8032CFC8 = -1;
    gCameraMovementFlags = 0;
    gCameraMovementFlags |= CAM_MOVE_INIT_CAMERA;
    unused_8033B316 = 0;
    gCameraFlags2 = 0;
    unused_8033B31A = 0;
    gCameraFlags1 = 0;
    sFirstPersonCameraPitch = 0;
    sFirstPersonCameraYaw = 0;
    D_8033B404 = 0;
    D_8033B3EE = 0;
    D_8033B3F0 = 0;
    sYawFocToMario = 0;
    D_8033B3EC = 0.f;
    D_8033B40C = 0.f;
    D_8033B410 = 0.f;
    D_8033B3F4 = 0.f;
    D_8033B3FC = 0.f;
    D_8033B3FA = 0;
    sCSideButtonYaw = 0;
    sPlatformLevelPresetBaseYaw = 0;
    gPlatformLevelYawOffset = 0;
    c->unk64 = 0;
    sMarioStatusForCamera->unk16[0] = 0;
    sMarioStatusForCamera->unk16[1] = 0;
    sLuigiStatusForCamera->unk16[0] = 0;
    sLuigiStatusForCamera->unk16[1] = 0;
    sMarioStatusForCamera->unk1C[1] = 0;
    sMarioStatusForCamera->usedObj = NULL;
    gCameraStatus.shakeMagnitude[0] = 0;
    gCameraStatus.shakeMagnitude[1] = 0;
    gCameraStatus.shakeMagnitude[2] = 0;
    gCameraStatus.unk6C[0] = 0;
    gCameraStatus.unk6C[1] = 0;
    gCameraStatus.unk6C[2] = 0;
    gCameraStatus.unk60[0] = 0.f;
    gCameraStatus.unk60[1] = 0.f;
    gCameraStatus.unk60[2] = 0.f;
    gCameraStatus.lastFrameAction = 0;
    set_fov_function(2);
    D_8033B230.fieldOfView = 45.f;
    D_8033B230.unk8 = 0.f;
    D_8033B230.unkC = 0;
    D_8033B230.unk10 = 0.f;
    D_8033B230.unk14 = 0;
    sTempCutsceneNumber = 0;
    gCutsceneNumber = 0;
    unused_8033B30C = 0;
    unused_8033B310 = 0;
}

void init_camera(struct LevelCamera *c) {
    struct Surface *floor = 0;
    Vec3f relativePosition;
    s32 i;

    sCreditsCameraPitch = 0;
    sCreditsCameraYaw = 0;
    gPrevLevel = gCurrLevelArea / 16;
    gCurrLevelArea = gCurrLevelNum * 16 + gCurrentArea->index;
    gCameraModeFlags &= CAM_MODE_MARIO_SELECTED;
    gFramesPaused = 0;
    gCameraStatus.modeActive = c->currPreset;
    gCameraStatus.modeDefault = c->defPreset;
    gCameraStatus.unkAC = 0.3f;
    gCameraStatus.unkB0 = 0.3f;
    gCameraStatus.unkA4 = 0.8f;
    gCameraStatus.unkA4 = 0.3f; // @bug set unkA4 back-to-back
    gCameraStatus.roll = 0;
    gCameraStatus.cameraKeyCutsceneRollOffset = 0;
    gCameraStatus.unkBC = 0;
    gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    vec3f_set(sFixedPresetBasePositionOffset, 0.f, 0.f, 0.f);
    vec3f_set(D_8033B218, 0.f, 0.f, 0.f);
    find_mario_relative_geometry(&sGeometryForMario);
    sGeometryForMario.prevFloorHeight = sGeometryForMario.currFloorHeight;
    sGeometryForMario.prevCeilHeight = sGeometryForMario.currCeilHeight;
    sGeometryForMario.prevFloor = sGeometryForMario.currFloor;
    sGeometryForMario.prevCeil = sGeometryForMario.currCeil;
    sGeometryForMario.prevFloorType = sGeometryForMario.currFloorType;
    sGeometryForMario.prevCeilType = sGeometryForMario.currCeilType;
    for (i = 0; i < 32; i++) {
        D_8033B4E0[i].index = -1;
        D_8033B5E0[i].index = -1;
    }
    sCutsceneSplineSegment = 0;
    sCutsceneSplineSegmentProgress = 0.f;
    D_8033B6E8 = 0;
    sSplinePositionLimit = 0.f;
    sPositionAlongSpline = 0.f;
    sSplineParameterMax = 0;
    for (i = 0; i < 4; i++) {
        sSplineParameters[i].unk0 = -1;
    }
    sCameraCutscenePitchOffset = 0;
    sCameraCutsceneYawOffset = 0;
    sCameraCutsceneRollOffset = 0;
    c->cutscene = 0;
    relativePosition[0] = 0.f;
    relativePosition[1] = 125.f;
    relativePosition[2] = 400.f;
    switch (gCurrLevelNum) {
        case LEVEL_BOWSER_1:
#ifndef VERSION_JP
            if (gCurrDemoInput == NULL) {
                set_camera_cutscene_table(c, CUTSCENE_ENTER_BOWSER_ARENA);
            } else if (gSecondCameraFocus != NULL) {
                gSecondCameraFocus->oBowserUnk88 = 2;
            }
#else
            set_camera_cutscene_table(c, CUTSCENE_ENTER_BOWSER_ARENA);
#endif
            break;
        case LEVEL_BOWSER_2:
            set_camera_cutscene_table(c, CUTSCENE_ENTER_BOWSER_ARENA);
            break;
        case LEVEL_BOWSER_3:
            set_camera_cutscene_table(c, CUTSCENE_ENTER_BOWSER_ARENA);
            break;
        case LEVEL_CASTLE_GROUNDS:
            if (is_within_100_units_of_mario(-1328.f, 260.f, 4664.f) != 1) {
                relativePosition[0] = -400.f;
                relativePosition[2] = -800.f;
            }
            if (is_within_100_units_of_mario(-6901.f, 2376.f, -6509.f) == 1) {
                set_camera_cutscene_table(c, CUTSCENE_EXIT_WATERFALL);
            }
            if (is_within_100_units_of_mario(5408.f, 4500.f, 3637.f) == 1) {
                set_camera_cutscene_table(c, CUTSCENE_EXIT_FALL_WMOTR);
            }
            gCameraStatus.modeActive = 16;
            break;
        case LEVEL_SA:
            relativePosition[2] = 200.f;
            break;
        case LEVEL_CASTLE_COURTYARD:
            relativePosition[2] = -300.f;
            break;
        case LEVEL_LLL:
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
            break;
        case LEVEL_CASTLE:
            relativePosition[2] = 150.f;
            break;
        case LEVEL_RR:
            vec3f_set(sFixedPresetBasePosition, -2985.f, 478.f, -5568.f);
            break;
    }
    if (c->currPreset == CAMERA_PRESET_PLATFORM_LEVEL) {
        gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
    }
    switch (gCurrLevelArea) {
        case AREA_SSL_EYEROK:
            vec3f_set(relativePosition, 0.f, 500.f, -100.f);
            break;
        case AREA_CCM_SLIDE:
            relativePosition[2] = -300.f;
            break;
        case AREA_THI_WIGGLER:
            relativePosition[2] = -300.f;
            break;
        case AREA_SL_IGLOO:
            relativePosition[2] = -300.f;
            break;
        case AREA_SL_OUTSIDE:
            if (is_within_100_units_of_mario(257.f, 2150.f, 1399.f) == 1) {
                relativePosition[2] = -300.f;
            }
            break;
        case AREA_CCM_OUTSIDE:
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
            break;
        case AREA_TTM_OUTSIDE:
            gCameraStatus.modeActive = CAMERA_PRESET_OPEN_CAMERA;
            break;
    }
    set_pos_from_face_angle_and_vec3f(c->pos, sMarioStatusForCamera->pos, relativePosition,
                                      sMarioStatusForCamera->faceAngle);
    if (c->currPreset != CAMERA_PRESET_BEHIND_MARIO) {
        c->pos[1] = find_floor(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 100.f,
                               sMarioStatusForCamera->pos[2], &floor)
                    + 125.f;
    }
    vec3f_copy(c->focus, sMarioStatusForCamera->pos);
    vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[1], c->pos);
    vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[0], c->focus);
    vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[3], c->pos);
    vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[2], c->focus);
    vec3f_copy(gCameraStatus.pos, c->pos);
    vec3f_copy(gCameraStatus.focus, c->focus);
    if (c->currPreset == CAMERA_PRESET_FIXED_REF_POINT) {
        set_fixed_cam_axis_sa_lobby(c->currPreset);
    }
    func_80284CBC(c);
    gCameraStatus.trueYaw = calculate_yaw(c->focus, c->pos);
    gCameraStatus.storedYaw = gCameraStatus.trueYaw;
    c->trueYaw = gCameraStatus.trueYaw;
    c->storedYaw = gCameraStatus.trueYaw;
}

extern u8 zoomOutAreaMasks[20];

void func_80287404(struct GraphNodeCamera *a) {
    UNUSED u8 unused1[8];
    f32 sp34;
    s16 sp32;
    s16 sp30;
    UNUSED u8 unused2[4];
    s32 sp28 = gCurrLevelArea / 32;
    s32 sp24 = 1 << (((gCurrLevelArea & 0x10) / 4) + (((gCurrLevelArea & 0xF) - 1) & 3));

    if (sp28 >= ARRAY_COUNT(zoomOutAreaMasks) - 1) {
        sp28 = 0;
        sp24 = 0;
    }
    if (gCameraMovementFlags & CAM_MOVE_PAUSE_SCREEN) {
        if (gFramesPaused >= 2) {
            if (zoomOutAreaMasks[sp28] & sp24) {
                a->to[0] = gCurrLevelCamera->xFocus;
                a->to[1] = (sMarioStatusForCamera->pos[1] + gCurrLevelCamera->unk68) / 2.f;
                a->to[2] = gCurrLevelCamera->zFocus;
                vec3f_get_dist_and_angle(a->to, sMarioStatusForCamera->pos, &sp34, &sp32, &sp30);
                vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, a->from, 6000.f, 4096, sp30);
                if (gCurrLevelNum != LEVEL_THI) {
                    find_in_bounds_yaw_wdw_bob_thi(a->from, a->to, 0);
                }
            }
        } else {
            gFramesPaused++;
        }
    } else {
        gFramesPaused = 0;
    }
}

void select_mario_cam_mode(void) {
    gCameraModeFlags = CAM_MODE_MARIO_SELECTED;
}

void func_802875F8(struct GraphNodeCamera *a, struct AllocOnlyPool *b) {
    s16 preset = a->config.preset;
    struct LevelCamera *c = alloc_only_pool_alloc(b, sizeof(struct LevelCamera));

    a->config.levelCamera = c;
    c->currPreset = preset;
    c->defPreset = preset;
    c->cutscene = 0;
    c->unk64 = 0;
    c->xFocus = a->to[0];
    c->unk68 = a->to[1];
    c->zFocus = a->to[2];
    c->trueYaw = 0;
    vec3f_copy(c->pos, a->from);
    vec3f_copy(c->focus, a->to);
}

void func_802876D0(struct GraphNodeCamera *a) {
    UNUSED u8 unused[8];
    UNUSED struct LevelCamera *c = a->config.levelCamera;

    a->rollScreen = gCameraStatus.roll;
    vec3f_copy(a->from, gCameraStatus.pos);
    vec3f_copy(a->to, gCameraStatus.focus);
    func_80287404(a);
}

Gfx *geo_camera_preset_and_pos(s32 a, struct GraphNode *b, struct AllocOnlyPool *c) {
    struct GraphNodeCamera *sp2C = (struct GraphNodeCamera *) b;
    UNUSED struct AllocOnlyPool *sp28 = c;

    switch (a) {
        case GEO_CONTEXT_CREATE:
            func_802875F8(sp2C, c);
            break;
        case GEO_CONTEXT_RENDER:
            func_802876D0(sp2C);
            break;
    }
    return NULL;
}

void dummy_802877D8(UNUSED struct LevelCamera *c) {
}

void dummy_802877EC(UNUSED struct LevelCamera *c) {
}

void vec3f_sub(Vec3f dst, Vec3f src) {
    dst[0] -= src[0];
    dst[1] -= src[1];
    dst[2] -= src[2];
}

void object_pos_to_vec3f(Vec3f dst, struct Object *o) {
    dst[0] = o->oPosX;
    dst[1] = o->oPosY;
    dst[2] = o->oPosZ;
}

void vec3f_to_object_pos(struct Object *o, Vec3f src) {
    o->oPosX = src[0];
    o->oPosY = src[1];
    o->oPosZ = src[2];
}

void unused_object_angle_to_vec3s(Vec3s dst, struct Object *o) {
    dst[0] = o->oMoveAnglePitch;
    dst[1] = o->oMoveAngleYaw;
    dst[2] = o->oMoveAngleRoll;
}

extern f32 unused_80336160;

/**
 * Produces values using a cubic b-spline curve. Basically Q is the used output,
 * u is a value between 0 and 1 that represents the position along the spline,
 * and a0-a3 are parameters that define the spline.
 *
 * The spline is described at www2.cs.uregina.ca/~anima/408/Notes/Interpolation/UniformBSpline.htm
 */
void evaluate_cubic_spline(f32 u, Vec3f Q, Vec3f a0, Vec3f a1, Vec3f a2, Vec3f a3) {
    f32 B[4];
    f32 x;
    f32 y;
    f32 z;
    UNUSED u8 unused[16];

    if (u > 1.f) {
        u = 1.f;
    }

    B[0] = (1.f - u) * (1.f - u) * (1.f - u) / 6.f;
    B[1] = u * u * u / 2.f - u * u + 0.6666667f;
    B[2] = -u * u * u / 2.f + u * u / 2.f + u / 2.f + 0.16666667f;
    B[3] = u * u * u / 6.f;

    Q[0] = B[0] * a0[0] + B[1] * a1[0] + B[2] * a2[0] + B[3] * a3[0];
    Q[1] = B[0] * a0[1] + B[1] * a1[1] + B[2] * a2[1] + B[3] * a3[1];
    Q[2] = B[0] * a0[2] + B[1] * a1[2] + B[2] * a2[2] + B[3] * a3[2];

    // Unused code
    B[0] = -0.5f * u * u + u - 0.33333333f;
    B[1] = 1.5f * u * u - 2.f * u - 0.5f;
    B[2] = -1.5f * u * u + u + 1.f;
    B[3] = 0.5f * u * u - 0.16666667f;

    x = B[0] * a0[0] + B[1] * a1[0] + B[2] * a2[0] + B[3] * a3[0];
    y = B[0] * a0[1] + B[1] * a1[1] + B[2] * a2[1] + B[3] * a3[1];
    z = B[0] * a0[2] + B[1] * a1[2] + B[2] * a2[2] + B[3] * a3[2];

    unused_spline_pitch = atan2s(sqrtf(x * x + z * z), y);
    unused_spline_yaw = atan2s(z, x);
}

/**
 * Computes the point that is `progress` percent of the way through segment `splineSegment` of `spline`,
 * and stores the result in `p`. `progress` and `splineSegment` are updated if `progress` becomes >= 1.0.
 *
 * When neither of next two points' speeds == 0, the number of frames is between 1 and 255. Otherwise
 * it's infinite.
 *
 * To calculate the number of frames it will take to progress through a spline segment:
 * If the next two speeds are the same and nonzero, it's 1.0 / firstSpeed.
 *
 * s1 and s2 are short hand for first/secondSpeed. The progress at any frame n is defined by a recurrency relation:
 *      p(n+1) = (s2 - s1 + 1) * p(n) + s1
 * Which can be written as
 *      p(n) = (s2 * ((s2 - s1 + 1)^(n) - 1)) / (s2 - s1)
 *
 * Solving for the number of frames:
 *      n = log(((s2 - s1) / s1) + 1) / log(s2 - s1 + 1)
 *
 * @return 1 if the point has reached the end of the spline, when `progress` reaches 1.0 or greater, and
 * the 4th CutsceneSplinePoint in the current segment away from spline[splineSegment] has an index of -1.
 */
s32 move_point_along_spline(Vec3f p, struct CutsceneSplinePoint spline[], s16 *splineSegment, f32 *progress) {
    s32 finished = 0;
    Vec3f controlPoints[4];
    s32 i = 0;
    f32 u = *progress;
    f32 progressChange;
    f32 firstSpeed = 0;
    f32 secondSpeed = 0;
    s32 segment = *splineSegment;

    if (*splineSegment < 0) {
        segment = 0;
        u = 0;
    }
    if (spline[segment].index == -1 || spline[segment + 1].index == -1 || spline[segment + 2].index == -1) {
        return 1;
    }

    for (i = 0; i < 4; i++) {
        controlPoints[i][0] = spline[segment + i].point[0];
        controlPoints[i][1] = spline[segment + i].point[1];
        controlPoints[i][2] = spline[segment + i].point[2];
    }
    evaluate_cubic_spline(u, p, controlPoints[0], controlPoints[1], controlPoints[2], controlPoints[3]);

    if (spline[*splineSegment + 1].speed != 0) {
        firstSpeed = 1.0f / spline[*splineSegment + 1].speed;
    }
    if (spline[*splineSegment + 2].speed != 0) {
        secondSpeed = 1.0f / spline[*splineSegment + 2].speed;
    }
    progressChange = (secondSpeed - firstSpeed) * *progress + firstSpeed;

#ifdef VERSION_EU
    if (gCurrLevelCamera->cutscene == CUTSCENE_INTRO_PEACH) {
        progressChange += progressChange * 0.19f;
    }
    if (gCurrLevelCamera->cutscene == CUTSCENE_CREDITS) {
        progressChange += progressChange * 0.15f;
    }
    if (gCurrLevelCamera->cutscene == CUTSCENE_PEACH_END) {
        progressChange += progressChange * 0.1f;
    }
#endif

    if (1 <= (*progress += progressChange)) {
        (*splineSegment)++;
        if (spline[*splineSegment + 3].index == -1) {
            *splineSegment = 0;
            finished = 1;
        }
        *progress -= 1;
    }
    return finished;
}

s32 select_or_activate_mario_cam(s32 angle) {
    s32 sp1C = 2;

    if (angle == CAM_ANGLE_LAKITU_MARIO) {
        if (!(gCameraModeFlags & CAM_MODE_MARIO_SELECTED)) {
            gCameraModeFlags |= CAM_MODE_MARIO_SELECTED;
        }
        gCameraFlags1 |= CAM_FLAG_1_UNUSED_3;
    }
    if (angle == CAM_ANGLE_LAKITU_FIXED && (gCameraModeFlags & CAM_MODE_MARIO_SELECTED)) {
        test_or_set_mario_cam_active(2);
        gCameraModeFlags &= ~CAM_MODE_MARIO_SELECTED;
        gCameraFlags1 |= CAM_FLAG_1_UNUSED_4;
    }
    if (gCameraModeFlags & CAM_MODE_MARIO_SELECTED) {
        sp1C = 1;
    }
    return sp1C;
}

s32 test_or_set_mario_cam_active(s32 a) {
    s32 sp4 = 2;

    if (a == 1 && !(gCameraModeFlags & CAM_MODE_MARIO_ACTIVE)) {
        gCameraModeFlags |= CAM_MODE_MARIO_ACTIVE;
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            gCameraModeFlags |= CAM_MODE_LAKITU_WAS_ZOOMED_OUT;
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
        }
        gCameraFlags1 |= CAM_FLAG_1_UNKNOWN_1;
    }
    if (a == 2 && (gCameraModeFlags & CAM_MODE_MARIO_ACTIVE)) {
        gCameraModeFlags &= ~CAM_MODE_MARIO_ACTIVE;
        if (gCameraModeFlags & CAM_MODE_LAKITU_WAS_ZOOMED_OUT) {
            gCameraModeFlags &= ~CAM_MODE_LAKITU_WAS_ZOOMED_OUT;
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
        } else {
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
        }
        gCameraFlags1 |= CAM_FLAG_1_UNKNOWN_2;
    }
    if (gCameraModeFlags & CAM_MODE_MARIO_ACTIVE) {
        sp4 = 1;
    }
    return sp4;
}

void set_spline_values(u8 a) {
    switch (a) {
        case 1:
            sSplineParameterMax = 1536;
            sSplinePositionLimit = 0.04f;
            break;
        case 6:
            sSplineParameterMax = 768;
            sSplinePositionLimit = 0.06f;
            break;
        case 4:
            sSplineParameterMax = 4096;
            sSplinePositionLimit = 0.1f;
            break;
        case 2:
            sSplineParameterMax = 1536;
            sSplinePositionLimit = 0.07f;
            break;
        case 3:
            sSplineParameterMax = 1536;
            sSplinePositionLimit = 0.07f;
            break;
        case 5:
            sSplineParameterMax = 1024;
            sSplinePositionLimit = 0.07f;
            break;
        default:
            sSplineParameterMax = 0;
            sSplinePositionLimit = 0.f;
    }
}

extern s16 unused_8033B2C0[][8];

void set_face_angle_from_spline(Vec3f pos, Vec3f focus) {
    s32 i;
    Vec3f faceAngleOffsetGoal;
    Vec3f splineParameters[4];
    f32 dist;
    s16 pitch;
    s16 yaw;
    UNUSED u8 unused[8];

    if (sSplineParameterMax == 0) {
        vec3f_set(faceAngleOffsetGoal, 0.f, 0.f, 0.f);
    } else {
        for (i = 0; i < 4; i++) {
            splineParameters[i][0] = sSplineParameters[i].myUnion.unk8[0];
            splineParameters[i][1] = sSplineParameters[i].myUnion.unk8[1];
            splineParameters[i][2] = sSplineParameters[i].myUnion.unk8[2];
        }
        evaluate_cubic_spline(sPositionAlongSpline, faceAngleOffsetGoal, splineParameters[0],
                              splineParameters[1], splineParameters[2], splineParameters[3]);
        if (1.f <= (sPositionAlongSpline += sSplinePositionLimit)) {
            for (i = 0; i < 3; i++) {
                vec3s_copy(sSplineParameters[i].myUnion.unk8, sSplineParameters[i + 1].myUnion.unk8);
            }
            random_vec3s(sSplineParameters[3].myUnion.unk8, sSplineParameterMax, sSplineParameterMax,
                         sSplineParameterMax / 2);
            sPositionAlongSpline -= 1.f;

            // Code dead, this is set to be 0 before it is used.
            sSplinePositionLimit = RandomFloat() * 0.5f;
            if (sSplinePositionLimit < 0.02f) {
                sSplinePositionLimit = 0.02f;
            }
        }
    }

    approach_s16_exponential_bool(&sCameraCutscenePitchOffset, faceAngleOffsetGoal[0], 0x08);
    approach_s16_exponential_bool(&sCameraCutsceneYawOffset, faceAngleOffsetGoal[1], 0x08);
    approach_s16_exponential_bool(&sCameraCutsceneRollOffset, faceAngleOffsetGoal[2], 0x08);

    if (sCameraCutscenePitchOffset | sCameraCutsceneYawOffset) {
        vec3f_get_dist_and_angle(pos, focus, &dist, &pitch, &yaw);
        pitch += sCameraCutscenePitchOffset;
        yaw += sCameraCutsceneYawOffset;
        vec3f_set_dist_and_angle(pos, focus, dist, pitch, yaw);
    }

    sSplineParameterMax = 0;
    sSplinePositionLimit = 0.f;
}

s32 find_c_buttons_pressed(u16 a, u16 buttonsPressed, u16 buttonsDown) {
    buttonsPressed &= CBUTTON_MASK;
    buttonsDown &= CBUTTON_MASK;

    if (buttonsPressed & L_CBUTTONS) {
        a |= 2;
        a &= ~1;
    }
    if (!(buttonsDown & L_CBUTTONS)) {
        a &= ~2;
    }

    if (buttonsPressed & R_CBUTTONS) {
        a |= 1;
        a &= ~2;
    }
    if (!(buttonsDown & R_CBUTTONS)) {
        a &= ~1;
    }

    if (buttonsPressed & U_CBUTTONS) {
        a |= 8;
        a &= ~4;
    }
    if (!(buttonsDown & U_CBUTTONS)) {
        a &= ~8;
    }

    if (buttonsPressed & D_CBUTTONS) {
        a |= 4;
        a &= ~8;
    }
    if (!(buttonsDown & D_CBUTTONS)) {
        a &= ~4;
    }

    return a;
}

s32 update_camera_status(struct LevelCamera *c) {
    s16 status = CAM_STATUS_NONE;

    if (c->cutscene != 0
        || ((gPlayer1Controller->buttonDown & R_TRIG) && select_or_activate_mario_cam(0) == CAM_ANGLE_LAKITU_FIXED)) {
        status |= CAM_STATUS_FIXED;
    } else if (test_or_set_mario_cam_active(0) == CAM_ANGLE_LAKITU_MARIO) {
        status |= CAM_STATUS_MARIO;
    } else {
        status |= CAM_STATUS_LAKITU;
    }
    if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
        status |= CAM_STATUS_C_DOWN;
    }
    if (gCameraMovementFlags & CAM_MOVE_C_UP_MODE) {
        status |= CAM_STATUS_C_UP;
    }
    set_hud_camera_status(status);
    return status;
}

s32 find_and_return_count_wall_collisions(Vec3f pos, f32 offsetY, f32 radius) {
    struct WallCollisionData collisionData;
    struct Surface *wall = NULL;
    f32 normX;
    f32 normY;
    f32 normZ;
    f32 originOffset;
    f32 offset;
    f32 offsetAbsolute;
    Vec3f newPos[4];
    s32 i;
    s32 numCollisions = 0;

    collisionData.x = pos[0];
    collisionData.y = pos[1];
    collisionData.z = pos[2];
    collisionData.radius = radius;
    collisionData.offsetY = offsetY;
    numCollisions = find_wall_collisions(&collisionData);
    if (numCollisions != 0) {
        for (i = 0; i < collisionData.numWalls; i++) {
            wall = collisionData.walls[collisionData.numWalls - 1];
            vec3f_copy(newPos[i], pos);
            normX = wall->normal.x;
            normY = wall->normal.y;
            normZ = wall->normal.z;
            originOffset = wall->originOffset;
            offset = normX * newPos[i][0] + normY * newPos[i][1] + normZ * newPos[i][2] + originOffset;
            offsetAbsolute = ABS2(offset);
            if (offsetAbsolute < radius) {
                newPos[i][0] += normX * (radius - offset);
                newPos[i][2] += normZ * (radius - offset);
                vec3f_copy(pos, newPos[i]);
            }
        }
    }
    return numCollisions;
}

/**
 * Compare a vector to a position, return TRUE if they match.
 */
s32 vec3f_compare(Vec3f pos, f32 posX, f32 posY, f32 posZ) {
    s32 equal = FALSE;

    if (pos[0] == posX && pos[1] == posY && pos[2] == posZ) {
        equal = TRUE;
    }
    return equal;
}

s32 clamp_pitch(Vec3f a, Vec3f b, s16 maxPitch, s16 minPitch) {
    s32 pitchChanged = 0;
    s16 pitch;
    s16 yaw;
    f32 dist;

    vec3f_get_dist_and_angle(a, b, &dist, &pitch, &yaw);
    if (pitch > maxPitch) {
        pitch = maxPitch;
        pitchChanged++;
    }
    if (pitch < minPitch) {
        pitch = minPitch;
        pitchChanged++;
    }
    vec3f_set_dist_and_angle(a, b, dist, pitch, yaw);
    return pitchChanged;
}

s32 is_within_100_units_of_mario(f32 posX, f32 posY, f32 posZ) {
    s32 isCloseToMario = 0;
    Vec3f pos;

    vec3f_set(pos, posX, posY, posZ);
    if (calc_abs_dist(sMarioStatusForCamera->pos, pos) < 100.f) {
        isCloseToMario = 1;
    }
    return isCloseToMario;
}

s32 set_or_approach_f32_exponential(f32 *dst, f32 goal, f32 scale) {
    if (gCameraFlags2 & CAM_FLAG_2_SMOOTH_MOVEMENT) {
        approach_f32_exponential_bool(dst, goal, scale);
    } else {
        *dst = goal;
    }
    if (*dst == goal) {
        return FALSE;
    } else {
        return TRUE;
    }
}

/**
 * Approaches an f32 value by taking the difference between the target and current value
 * and adding a fraction of that to the current value.
 * Edits the current value directly, returns TRUE if the target has been reached, FALSE otherwise.
 */
s32 approach_f32_exponential_bool(f32 *current, f32 target, f32 multiplier) {
    if (multiplier > 1.f) {
        multiplier = 1.f;
    }
    *current = *current + (target - *current) * multiplier;
    if (*current == target) {
        return FALSE;
    } else {
        return TRUE;
    }
}

/**
 * Nearly the same as the above function, returns new value instead.
 */
f32 approach_f32_exponential(f32 current, f32 target, f32 multiplier) {
    current = current + (target - current) * multiplier;
    return current;
}

/**
 * Approaches an s16 value in the same fashion as approach_f32_exponential_bool, returns TRUE if target
 * is reached. Note: Since this function takes integers as parameters, the last argument is the
 * reciprocal of what it would be in the previous two functions.
 */
s32 approach_s16_exponential_bool(s16 *current, s16 target, s16 divisor) {
    s16 temp = *current;

    if (divisor == 0) {
        *current = target;
    } else {
        temp -= target;
        temp -= temp / divisor;
        temp += target;
        *current = temp;
    }
    if (*current == target) {
        return FALSE;
    } else {
        return TRUE;
    }
}

/**
 * Approaches an s16 value in the same fashion as approach_f32_exponential, returns the new value.
 * Note: last parameter is the reciprocal of what it would be in the f32 functions
 */
s32 approach_s16_exponential(s16 current, s16 target, s16 divisor) {
    s16 temp = current;

    if (divisor == 0) {
        current = target;
    } else {
        temp -= target;
        temp -= temp / divisor;
        temp += target;
        current = temp;
    }
    return current;
}

/**
 * Applies the approach_f32_exponential_bool function to each of the X, Y, & Z components of the given
 * vector.
 */
void approach_vec3f_exponential(Vec3f current, Vec3f target, f32 x_multiplier, f32 y_multiplier,
                                f32 z_multiplier) {
    approach_f32_exponential_bool(&current[0], target[0], x_multiplier);
    approach_f32_exponential_bool(&current[1], target[1], y_multiplier);
    approach_f32_exponential_bool(&current[2], target[2], z_multiplier);
}

void set_or_approach_vec3f_exponential(Vec3f dst, Vec3f goal, f32 xScale, f32 yScale, f32 zScale) {
    set_or_approach_f32_exponential(&dst[0], goal[0], xScale);
    set_or_approach_f32_exponential(&dst[1], goal[1], yScale);
    set_or_approach_f32_exponential(&dst[2], goal[2], zScale);
}

/**
 * Applies the approach_s32_exponential function to each of the X, Y, & Z components of the given
 * vector.
 */
void approach_vec3s_exponential(Vec3s current, Vec3s target, s16 x_multiplier, s16 y_multiplier,
                                s16 z_multiplier) {
    approach_s16_exponential_bool(&current[0], target[0], x_multiplier);
    approach_s16_exponential_bool(&current[1], target[1], y_multiplier);
    approach_s16_exponential_bool(&current[2], target[2], z_multiplier);
}

s32 camera_approach_s16_symmetric_bool(s16 *value, s16 target, s16 increment) {
    s16 dist = target - *value;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist >= 0) {
            *value = target - dist;
        } else {
            *value = target;
        }
    } else {
        dist += increment;
        if (dist <= 0) {
            *value = target - dist;
        } else {
            *value = target;
        }
    }
    if (*value == target) {
        return FALSE;
    } else {
        return TRUE;
    }
}

s32 camera_approach_s16_symmetric(s16 value, s16 target, s16 increment) {
    s16 dist = target - value;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist >= 0) {
            value = target - dist;
        } else {
            value = target;
        }
    } else {
        dist += increment;
        if (dist <= 0) {
            value = target - dist;
        } else {
            value = target;
        }
    }
    return value;
}

s32 set_or_approach_s16_symmetric(s16 *value, s16 target, s16 increment) {
    if (gCameraFlags2 & CAM_FLAG_2_SMOOTH_MOVEMENT) {
        camera_approach_s16_symmetric_bool(value, target, increment);
    } else {
        *value = target;
    }
    if (*value == target) {
        return FALSE;
    } else {
        return TRUE;
    }
}

/**
 * Approaches a value by a given increment, returns FALSE if the target is reached.
 * Appears to be a strange way of implementing approach_f32_symmetric from object_helpers.c.
 * It could possibly be an older version of the function
 */
s32 camera_approach_f32_symmetric_bool(f32 *current, f32 target, f32 increment) {
    f32 dist = target - *current;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist > 0) {
            *current = target - dist;
        } else {
            *current = target;
        }
    } else {
        dist += increment;
        if (dist < 0) {
            *current = target - dist;
        } else {
            *current = target;
        }
    }
    if (*current == target) {
        return FALSE;
    } else {
        return TRUE;
    }
}

/**
 * Nearly the same as the above function, this one returns the new value in place of a bool.
 */
f32 camera_approach_f32_symmetric(f32 current, f32 target, f32 increment) {
    f32 dist = target - current;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist > 0) {
            current = target - dist;
        } else {
            current = target;
        }
    } else {
        dist += increment;
        if (dist < 0) {
            current = target - dist;
        } else {
            current = target;
        }
    }
    return current;
}

/**
 * Generate a vector with all three values about zero. The
 * three ranges determine how wide the range about zero.
 */
void random_vec3s(Vec3s dst, s16 xRange, s16 yRange, s16 zRange) {
    f32 randomFloat;
    UNUSED u8 unused[4];
    f32 tempXRange;
    f32 tempYRange;
    f32 tempZRange;

    randomFloat = RandomFloat();
    tempXRange = xRange;
    dst[0] = randomFloat * tempXRange - tempXRange / 2;

    randomFloat = RandomFloat();
    tempYRange = yRange;
    dst[1] = randomFloat * tempYRange - tempYRange / 2;

    randomFloat = RandomFloat();
    tempZRange = zRange;
    dst[2] = randomFloat * tempZRange - tempZRange / 2;
}

s16 func_80289738(s16 a, f32 b, f32 c, f32 d, f32 e) {
    Vec3f sp3C;
    f32 sp38;
    s16 sp36;
    s16 sp34;
    s16 sp32;
    s16 sp30;
    s16 sp2E = 0;
    f32 sp28 = gCameraStatus.camFocAndPosCurrAndGoal[3][0] - c;
    f32 sp24 = gCameraStatus.camFocAndPosCurrAndGoal[3][1] - d;
    f32 sp20 = gCameraStatus.camFocAndPosCurrAndGoal[3][2] - e;

    sp38 = sqrtf(sp28 * sp28 + sp24 * sp24 + sp20 * sp20);
    if (b > sp38) {
        sp3C[0] = c;
        sp3C[1] = d;
        sp3C[2] = e;
        vec3f_get_dist_and_angle(gCameraStatus.camFocAndPosCurrAndGoal[3], sp3C, &sp38, &sp36, &sp34);
        if (sp38 < b) {
            calculate_angles(gCameraStatus.camFocAndPosCurrAndGoal[3],
                             gCameraStatus.camFocAndPosCurrAndGoal[2], &sp32, &sp30);
            sp36 -= sp32;
            sp34 -= sp30;
            sp38 -= 2000.f;
            if (sp38 < 0.f) {
                sp38 = 0.f;
            }
            b -= 2000.f;
            if (b < 2000.f) {
                b = 2000.f;
            }
            sp2E = a * (1.f - sp38 / b);
            if (sp36 < -0x1800 || sp36 > 0x400 || sp34 < -0x1800 || sp34 > 0x1800) {
                sp2E /= 2;
            }
        }
    }
    return sp2E;
}

s32 clamp_positions_and_find_yaw_angle(Vec3f pos, Vec3f origin, f32 xMax, f32 xMin, f32 zMax,
                                       f32 zMin) {
    s16 yaw = gCurrLevelCamera->storedYaw;

    if (pos[0] >= xMax) {
        pos[0] = xMax;
    }
    if (pos[0] <= xMin) {
        pos[0] = xMin;
    }
    if (pos[2] >= zMax) {
        pos[2] = zMax;
    }
    if (pos[2] <= zMin) {
        pos[2] = zMin;
    }
    yaw = calculate_yaw(origin, pos);
    return yaw;
}

s32 func_80289A98(s16 a, s16 b) {
    s16 sp2E;
    UNUSED u8 unused[34];
    UNUSED s32 sp8 = 0;
    UNUSED s32 sp4 = 0;

    sp2E = b - a + 0x4000;
    if (sp2E < 0) {
        a = b;
    } else {
        a = b + 0x8000;
    }
    return a;
}

s32 is_pos_less_than_bounds(struct Surface *surf, f32 xMax, f32 yMax, f32 zMax) {
    Vec3s posX;
    Vec3s posY;
    Vec3s posZ;
    s16 testX = 0;
    s16 testY = 0;
    s16 testZ = 0;
    f32 dx;
    f32 dy;
    f32 dz;
    UNUSED u8 unused[4];
    s32 i;
    s32 j;
    s32 isWithinBounds = FALSE;

    posX[0] = surf->vertex1[0];
    posX[1] = surf->vertex2[0];
    posX[2] = surf->vertex3[0];
    posY[0] = surf->vertex1[1];
    posY[1] = surf->vertex2[1];
    posY[2] = surf->vertex3[1];
    posZ[0] = surf->vertex1[2];
    posZ[1] = surf->vertex2[2];
    posZ[2] = surf->vertex3[2];
    for (i = 0; i < 3; i++) {
        j = i + 1;
        if (j >= 3) {
            j = 0;
        }
        dx = ABS(posX[i] - posX[j]);
        if (dx > testX) {
            testX = dx;
        }
        dy = ABS(posY[i] - posY[j]);
        if (dy > testY) {
            testY = dy;
        }
        dz = ABS(posZ[i] - posZ[j]);
        if (dz > testZ) {
            testZ = dz;
        }
    }
    if (yMax != -1.f) {
        if (testY < yMax) {
            isWithinBounds = TRUE;
        }
    }
    if (xMax != -1.f && zMax != -1.f) {
        if (testX < xMax && testZ < zMax) {
            isWithinBounds = TRUE;
        }
    }
    return isWithinBounds;
}

s32 is_behind_surface(Vec3f pos, struct Surface *surf) {
    s32 behindSurface = 0;
    f32 normX = (surf->vertex2[1] - surf->vertex1[1]) * (surf->vertex3[2] - surf->vertex2[2])
                - (surf->vertex3[1] - surf->vertex2[1]) * (surf->vertex2[2] - surf->vertex1[2]);
    f32 normY = (surf->vertex2[2] - surf->vertex1[2]) * (surf->vertex3[0] - surf->vertex2[0])
                - (surf->vertex3[2] - surf->vertex2[2]) * (surf->vertex2[0] - surf->vertex1[0]);
    f32 normZ = (surf->vertex2[0] - surf->vertex1[0]) * (surf->vertex3[1] - surf->vertex2[1])
                - (surf->vertex3[0] - surf->vertex2[0]) * (surf->vertex2[1] - surf->vertex1[1]);
    f32 posX = surf->vertex1[0] - pos[0];
    f32 posY = surf->vertex1[1] - pos[1];
    f32 posZ = surf->vertex1[2] - pos[2];

    if (posX * normX + posY * normY + posZ * normZ < 0) {
        behindSurface = 1;
    }
    return behindSurface;
}

s32 func_8028A0D4(Vec3f a, Vec3f b, struct Surface *surf, s16 d, s16 surfType) {
    s32 behindSurface = TRUE;
    s32 sp50 = 0;
    s32 sp4C = 0;
    UNUSED u8 unused[20];
    f32 sp34;
    s16 sp32;
    s16 sp30;
    Vec3f sp24;

    if (surf != NULL) {
        if (surfType == -1 || surf->type != surfType) {
            if (d == 0) {
                behindSurface = is_behind_surface(b, surf);
            } else {
                vec3f_get_dist_and_angle(a, b, &sp34, &sp32, &sp30);
                vec3f_set_dist_and_angle(a, sp24, sp34, sp32, sp30 + d);
                sp50 = is_behind_surface(sp24, surf);
                vec3f_set_dist_and_angle(a, sp24, sp34, sp32, sp30 - d);
                sp4C = is_behind_surface(sp24, surf);
                behindSurface = sp50 * sp4C;
            }
        }
    }
    return behindSurface;
}

s32 is_mario_behind_surface(UNUSED struct LevelCamera *c, struct Surface *surf) {
    s32 behindSurface = is_behind_surface(sMarioStatusForCamera->pos, surf);

    return behindSurface;
}

/**
 * Calculates the distance between two points and sets a vector to a point
 * scaled along a line between them. Typically, somewhere in the middle.
 */
void scale_along_line(Vec3f dest, Vec3f b, Vec3f c, f32 scale) {
    Vec3f tempVec;

    tempVec[0] = (c[0] - b[0]) * scale + b[0];
    tempVec[1] = (c[1] - b[1]) * scale + b[1];
    tempVec[2] = (c[2] - b[2]) * scale + b[2];
    vec3f_copy(dest, tempVec);
}
/**
 * Effectively created a rectangular prism defined by a vector starting at the center
 * and extending to the corners. If the position is in this box, the function returns true.
 */
s32 check_if_vector_fits_in_bounds(Vec3f pos, Vec3f center, Vec3f bounds, s16 angle) {
    s32 inBound = FALSE;
    Vec3f vec;

    vec[0] = center[0] - pos[0];
    vec[1] = center[1] - pos[1];
    vec[2] = center[2] - pos[2];

    rotate_in_xz(vec, vec, angle);

    if (-bounds[0] < vec[0] && vec[0] < bounds[0] && -bounds[1] < vec[1] && vec[1] < bounds[1]
        && -bounds[2] < vec[2] && vec[2] < bounds[2]) {
        inBound = TRUE;
    }
    return inBound;
}

s16 calculate_verticle_angle(Vec3f startPos, Vec3f endPos) {
    f32 dx = endPos[0] - startPos[0];
    f32 dy = endPos[1] - startPos[1];
    f32 dz = endPos[2] - startPos[2];
    s16 pitch = atan2s(sqrtf(dx * dx + dz * dz), dy);

    return pitch;
}

s16 calculate_yaw(Vec3f startPos, Vec3f endPos) {
    f32 dx = endPos[0] - startPos[0];
    UNUSED f32 dy = endPos[1] - startPos[1];
    f32 dz = endPos[2] - startPos[2];
    s16 yaw = atan2s(dz, dx);

    return yaw;
}

void calculate_angles(Vec3f a, Vec3f b, s16 *pitch, s16 *yaw) {
    f32 dx = b[0] - a[0];
    f32 dy = b[1] - a[1];
    f32 dz = b[2] - a[2];

    *pitch = atan2s(sqrtf(dx * dx + dz * dz), dy);
    *yaw = atan2s(dz, dx);
}

/**
 * Finds the distance between two vectors.
 */
f32 calc_abs_dist(Vec3f a, Vec3f b) {
    f32 distX = b[0] - a[0];
    f32 distY = b[1] - a[1];
    f32 distZ = b[2] - a[2];
    f32 distAbs = sqrtf(distX * distX + distY * distY + distZ * distZ);

    return distAbs;
}

/**
 * Finds the horizontal distance between two vectors.
 */
f32 calc_hor_dist(Vec3f a, Vec3f b) {
    f32 distX = b[0] - a[0];
    f32 distZ = b[2] - a[2];
    f32 distHor = sqrtf(distX * distX + distZ * distZ);

    return distHor;
}

/**
 * Rotates a vector in the horizontal plane and copies it to a new vector.
 */
void rotate_in_xz(Vec3f dest, Vec3f src, s16 angle) {
    Vec3f tempVec;

    vec3f_copy(tempVec, src);
    dest[0] = tempVec[2] * sins(angle) + tempVec[0] * coss(angle);
    dest[1] = tempVec[1];
    dest[2] = tempVec[2] * coss(angle) - tempVec[0] * sins(angle);
}

/**
 * Rotates a vector in the YZ plane and copies it to a new vector.
 */
void rotate_in_yz(Vec3f dest, Vec3f src, s16 angle) {
    Vec3f tempVec;

    vec3f_copy(tempVec, src);
    dest[2] = -(tempVec[2] * coss(angle) - tempVec[1] * sins(angle));
    dest[1] = tempVec[2] * sins(angle) + tempVec[1] * coss(angle);
    dest[0] = tempVec[0];
}

void set_camera_pitch_shake(s16 a, s16 b, s16 c) {
    if (gCameraStatus.shakeMagnitude[0] < a) {
        gCameraStatus.shakeMagnitude[0] = a;
        gCameraStatus.shakePitchMagIncrement = b;
        gCameraStatus.shakePitchIncrement = c;
    }
}

void set_camera_yaw_shake(s16 a, s16 b, s16 c) {
    if (ABS(a) > ABS(gCameraStatus.shakeMagnitude[1])) {
        gCameraStatus.shakeMagnitude[1] = a;
        gCameraStatus.shakeYawMagIncrement = b;
        gCameraStatus.shakeYawIncrement = c;
    }
}

void set_camera_roll_shake(s16 a, s16 b, s16 c) {
    if (gCameraStatus.shakeMagnitude[2] < a) {
        gCameraStatus.shakeMagnitude[2] = a;
        gCameraStatus.shakeRollMagIncrement = b;
        gCameraStatus.shakeRollIncrement = c;
    }
}

void func_8028AA80(s16 a, s16 b, s16 c, f32 d, f32 e, f32 f, f32 g) {
    Vec3f sp2C;
    f32 sp28;
    s16 sp26;
    s16 sp24;

    sp2C[0] = e;
    sp2C[1] = f;
    sp2C[2] = g;
    vec3f_get_dist_and_angle(gCameraStatus.camFocAndPosCurrAndGoal[3], sp2C, &sp28, &sp26, &sp24);
    a = func_80289738(a, d, e, f, g);
    if (a != 0) {
        set_camera_pitch_shake(a, b, c);
    }
}

void Unknown8028AB34(s16 a, s16 b, s16 c, f32 d, f32 e, f32 f, f32 g) {
    Vec3f sp2C;
    f32 sp28;
    s16 sp26;
    s16 sp24;

    sp2C[0] = e;
    sp2C[1] = f;
    sp2C[2] = g;
    vec3f_get_dist_and_angle(gCameraStatus.camFocAndPosCurrAndGoal[3], sp2C, &sp28, &sp26, &sp24);
    a = func_80289738(a, d, e, f, g);
    if (a != 0) {
        set_camera_yaw_shake(a, b, c);
    }
}

void increment_shake_offset(s16 *a, s16 b) {
    if (b == -0x8000) {
        *a = (*a & 0x8000) + 0xC000;
    } else {
        *a += b;
    }
}

void shake_camera_pitch(Vec3f pos, Vec3f focus) {
    f32 dist;
    s16 pitch;
    s16 yaw;

    if (gCameraStatus.shakeMagnitude[0] | gCameraStatus.shakeMagnitude[1]) {
        vec3f_get_dist_and_angle(pos, focus, &dist, &pitch, &yaw);
        pitch += gCameraStatus.shakeMagnitude[0] * sins(gCameraStatus.shakePitchOffset);
        vec3f_set_dist_and_angle(pos, focus, dist, pitch, yaw);
        increment_shake_offset(&gCameraStatus.shakePitchOffset, gCameraStatus.shakePitchIncrement);
        if (camera_approach_s16_symmetric_bool(&gCameraStatus.shakeMagnitude[0], 0,
                                               gCameraStatus.shakePitchMagIncrement)
            == 0) {
            gCameraStatus.shakePitchOffset = 0;
        }
    }
}

void shake_camera_yaw(Vec3f pos, Vec3f focus) {
    f32 dist;
    s16 pitch;
    s16 yaw;

    if (gCameraStatus.shakeMagnitude[1] != 0) {
        vec3f_get_dist_and_angle(pos, focus, &dist, &pitch, &yaw);
        yaw += gCameraStatus.shakeMagnitude[1] * sins(gCameraStatus.shakeYawOffset);
        vec3f_set_dist_and_angle(pos, focus, dist, pitch, yaw);
        increment_shake_offset(&gCameraStatus.shakeYawOffset, gCameraStatus.shakeYawIncrement);
        if (camera_approach_s16_symmetric_bool(&gCameraStatus.shakeMagnitude[1], 0,
                                               gCameraStatus.shakeYawMagIncrement)
            == 0) {
            gCameraStatus.shakeYawOffset = 0;
        }
    }
}

void shake_camera_roll(s16 *roll) {
    UNUSED u8 unused[8];

    if (gCameraStatus.shakeMagnitude[2] != 0) {
        increment_shake_offset(&gCameraStatus.shakeRollOffset, gCameraStatus.shakeRollIncrement);
        *roll += gCameraStatus.shakeMagnitude[2] * sins(gCameraStatus.shakeRollOffset);
        if (camera_approach_s16_symmetric_bool(&gCameraStatus.shakeMagnitude[2], 0,
                                               gCameraStatus.shakeRollMagIncrement)
            == 0) {
            gCameraStatus.shakeRollOffset = 0;
        }
    }
}

s32 func_8028AF24(struct LevelCamera *c, s16 b) {
    s16 yawGoal = 0x2AAA;
    s16 yaw = sFirstPersonCameraYaw;
    f32 horDistFocusToMario;
    Vec3f focus;
    s16 sp2A;

    switch (gCurrLevelArea) {
        case AREA_TTC:
            focus[0] = c->xFocus;
            focus[1] = sMarioStatusForCamera->pos[1];
            focus[2] = c->zFocus;
            horDistFocusToMario = calc_abs_dist(focus, sMarioStatusForCamera->pos);
            if (800.f > horDistFocusToMario) {
                yawGoal = 0x3800;
            }
            break;
        case AREA_SSL_PYRAMID:
            yawGoal = (b & 0xC000) - b + 0x2000;
            if (yawGoal < 0) {
                yawGoal = -yawGoal;
            }
            yawGoal = yawGoal / 32 * 48;
            break;
        case AREA_LLL_OUTSIDE:
            yawGoal = 0;
            break;
    }
    sp2A = gMarioStates[0].forwardVel / 32.f * 128.f;
    if (D_8033B3EC < 0) {
        camera_approach_s16_symmetric_bool(&yaw, -yawGoal, sp2A);
    }
    if (D_8033B3EC > 0) {
        camera_approach_s16_symmetric_bool(&yaw, yawGoal, sp2A);
    }
    if (yaw < -0x2AAA) {
        camera_approach_s16_symmetric_bool(&yaw, -yawGoal, 0x200);
    }
    if (yaw > 0x2AAA) {
        camera_approach_s16_symmetric_bool(&yaw, yawGoal, 0x200);
    }
    return yaw;
}

void func_8028B13C(void) {
    play_music(0, SEQUENCE_ARGS(4, SEQ_EVENT_PEACH_MESSAGE), 0);
}

void func_8028B16C(void) {
    play_music(0, SEQUENCE_ARGS(15, SEQ_EVENT_CUTSCENE_INTRO), 0);
}

void play_camera_buzz_if_cdown(void) {
    if (gPlayer1Controller->buttonPressed & D_CBUTTONS) {
        play_sound_button_change_blocked();
    }
}

void play_camera_buzz_if_cbutton(void) {
    if (gPlayer1Controller->buttonPressed & CBUTTON_MASK) {
        play_sound_button_change_blocked();
    }
}

void play_camera_buzz_if_c_sideways(void) {
    if ((gPlayer1Controller->buttonPressed & L_CBUTTONS)
        || (gPlayer1Controller->buttonPressed & R_CBUTTONS)) {
        play_sound_button_change_blocked();
    }
}

void play_sound_cbutton_up(void) {
    play_sound(SOUND_MENU_CAMERA_ZOOM_IN, gDefaultSoundArgs);
}

void play_sound_cbutton_down(void) {
    play_sound(SOUND_MENU_CAMERA_ZOOM_OUT, gDefaultSoundArgs);
}

void play_sound_cbutton_side(void) {
    play_sound(SOUND_MENU_CAMERA_TURN, gDefaultSoundArgs);
}

void play_sound_button_change_blocked(void) {
    play_sound(SOUND_MENU_CAMERA_BUZZ, gDefaultSoundArgs);
}

void play_sound_rbutton_changed(void) {
    play_sound(SOUND_MENU_CLICK_CHANGE_VIEW, gDefaultSoundArgs);
}

void func_8028B36C(void) {
    if (gCameraFlags1 & CAM_FLAG_1_UNKNOWN_1) {
        play_sound_rbutton_changed();
    }
    if (gCameraFlags1 & CAM_FLAG_1_UNKNOWN_2) {
        play_sound_rbutton_changed();
    }
    gCameraFlags1 &= ~(CAM_FLAG_1_UNKNOWN_1 | CAM_FLAG_1_UNKNOWN_2);
}

s32 func_8028B3DC(struct LevelCamera *c, UNUSED f32 b) {
    s16 dummy;

    if ((gCameraMovementFlags & CAM_MOVE_UNKNOWN_5)
        || !(gCameraMovementFlags
             & (CAM_MOVE_RETURN_TO_MIDDLE | CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ROTATE_LEFT))) {
        if (gPlayer1Controller->buttonPressed & (L_CBUTTONS | R_CBUTTONS)) {
            gCameraMovementFlags &= ~CAM_MOVE_UNKNOWN_5;
        }

        if (gPlayer1Controller->buttonPressed & R_CBUTTONS) {
            if (sFirstPersonCameraYaw > -0x800) {
                if (!(gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT)) {
                    gCameraMovementFlags |= CAM_MOVE_ROTATE_RIGHT;
                }

                if (c->currPreset == CAMERA_PRESET_OPEN_CAMERA) {
                    if (sFirstPersonCameraYaw > 0x22AA) {
                        sCameraSideCFlags |= 4;
                    }

                    if (sFirstPersonCameraYaw == 0x4AAA) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                } else {
                    if (sFirstPersonCameraYaw == 0x2AAA) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                }
            } else {
                gCameraMovementFlags |= CAM_MOVE_RETURN_TO_MIDDLE;
                play_sound_cbutton_up();
            }
        }
        if (gPlayer1Controller->buttonPressed & L_CBUTTONS) {
            if (sFirstPersonCameraYaw < 0x800) {
                if (!(gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT)) {
                    gCameraMovementFlags |= CAM_MOVE_ROTATE_LEFT;
                }

                if (c->currPreset == CAMERA_PRESET_OPEN_CAMERA) {
                    if (sFirstPersonCameraYaw < -0x22AA) {
                        sCameraSideCFlags |= 8;
                    }

                    if (sFirstPersonCameraYaw == -19114) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                } else {
                    if (sFirstPersonCameraYaw == -10922) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                }
            } else {
                gCameraMovementFlags |= CAM_MOVE_RETURN_TO_MIDDLE;
                play_sound_cbutton_up();
            }
        }
    }
    if (gPlayer1Controller->buttonPressed & U_CBUTTONS) {
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
            play_sound_cbutton_up();
        } else {
            func_80284D44(c);
        }
    }
    if (gPlayer1Controller->buttonPressed & D_CBUTTONS) {
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            gCameraMovementFlags |= CAM_MOVE_UNK1000;
#ifndef VERSION_JP
            play_camera_buzz_if_cdown();
#endif
        } else {
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
            play_sound_cbutton_down();
        }
    }

    //! returning uninitialized variable
    return dummy;
}

s32 stop_mario(s32 a) {
    s32 sp1C = 0;
    UNUSED struct LevelCamera *c = gCurrLevelCamera;

    if (a == 1) {
        func_8028F834(CUTSCENE_READ_MESSAGE);
    }
    if (a == 2) {
    }
    return sp1C;
}

void handle_c_button_movement(struct LevelCamera *a) {
    s16 sp1E;

    if (gPlayer1Controller->buttonPressed & U_CBUTTONS) {
        if (a->currPreset != CAMERA_PRESET_FIXED_REF_POINT
            && (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT)) {
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
            play_sound_cbutton_up();
        } else {
            func_80284D44(a);
            if (D_8033B3FC > gCameraZoomDist) {
                D_8033B3F4 = -gCameraZoomDist;
            } else {
                D_8033B3F4 = gCameraZoomDist;
            }
        }
    }
    if (a->currPreset != CAMERA_PRESET_FIXED_REF_POINT) {
        if (gPlayer1Controller->buttonPressed & D_CBUTTONS) {
            if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
                gCameraMovementFlags |= CAM_MOVE_UNK1000;
                D_8033B3F4 = gCameraZoomDist + 400.f;
#ifndef VERSION_JP
                play_camera_buzz_if_cdown();
#endif
            } else {
                gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
                D_8033B3F4 = gCameraZoomDist + 400.f;
                play_sound_cbutton_down();
            }
        }
        sp1E = 4096;
        if (gPlayer1Controller->buttonPressed & R_CBUTTONS) {
            if (gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT) {
                gCameraMovementFlags &= ~CAM_MOVE_ROTATE_LEFT;
            } else {
                gCameraMovementFlags |= CAM_MOVE_ROTATE_RIGHT;
                if (sCSideButtonYaw == 0) {
                    play_sound_cbutton_side();
                }
                sCSideButtonYaw = -sp1E;
            }
        }
        if (gPlayer1Controller->buttonPressed & L_CBUTTONS) {
            if (gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT) {
                gCameraMovementFlags &= ~CAM_MOVE_ROTATE_RIGHT;
            } else {
                gCameraMovementFlags |= CAM_MOVE_ROTATE_LEFT;
                if (sCSideButtonYaw == 0) {
                    play_sound_cbutton_side();
                }
                sCSideButtonYaw = sp1E;
            }
        }
    }
}

void func_8028BA38(UNUSED struct LevelCamera *a) {
    s32 i;

    for (i = 0; i < 10; i++) {
        D_8033B6F0[i].unk0 = 0;
        vec3f_set(D_8033B6F0[i].unk4, 0.f, 0.f, 0.f);
        vec3f_set(D_8033B6F0[i].unk10, 0.f, 0.f, 0.f);
        vec3s_set(D_8033B6F0[i].unk1C, 0, 0, 0);
        D_8033B6F0[i].unk22 = 0;
    }
}

/**
 * If camera's cutscene table is not already set to a value,
 * set it to that value.
 */
void set_camera_cutscene_table(struct LevelCamera *camera, u8 cutsceneTable) {
    if (camera->cutscene != cutsceneTable) {
        camera->cutscene = cutsceneTable;
        func_8028BA38(camera);
    }
}

extern u8 D_8032E8A4[27][4];

s32 determine_star_fadeout_cutscene_table(UNUSED struct LevelCamera *c) {
    u8 sp7 = 0;
    u8 sp6 = 0;
    u8 starIndex = (gLastCompletedStarNum - 1) / 2;
    u8 courseIndex = gCurrCourseNum;

    if (starIndex > 3) {
        starIndex = 0;
    }
    if (courseIndex > COURSE_MAX) {
        courseIndex = COURSE_NONE;
    }
    sp6 = D_8032E8A4[courseIndex][starIndex];
    if (gLastCompletedStarNum & 1) {
        sp6 &= 0xF;
    } else {
        sp6 = sp6 >> 4;
    }
    sp7 = D_8032D0B8[sp6];
    return sp7;
}

u8 return_table_door_push_or_pull(u8 pullResult, u8 pushResult) {
    s16 result;

    if (sMarioStatusForCamera->action == ACT_PULLING_DOOR) {
        result = pullResult;
    }
    if (sMarioStatusForCamera->action == ACT_PUSHING_DOOR) {
        result = pushResult;
    }
    return result;
}

u8 return_cutscene_table(struct LevelCamera *c) {
    UNUSED u8 unused1[4];
    u8 cutscene = c->cutscene;
    UNUSED u8 unused2[12];

    if (cutscene == 0) {
        cutscene = sTempCutsceneNumber;
        sTempCutsceneNumber = 0;
        if (sMarioStatusForCamera->unk1C[1] == 6) {
            switch (gCurrLevelArea) {
                case AREA_CASTLE_LOBBY:
                    if (c->currPreset == CAMERA_PRESET_SPIRAL_STAIRS
                        || c->currPreset == CAMERA_PRESET_CLOSE || c->unk64 == 2) {
                        cutscene = return_table_door_push_or_pull(CUTSCENE_DOOR_A, CUTSCENE_DOOR_B);
                    } else {
                        cutscene = return_table_door_push_or_pull(CUTSCENE_DOOR_0, CUTSCENE_DOOR_1);
                    }
                    break;
                case AREA_BBH:
                    if (c->unk64 == 1) {
                        cutscene = return_table_door_push_or_pull(CUTSCENE_DOOR_0, CUTSCENE_DOOR_1);
                    } else {
                        cutscene = return_table_door_push_or_pull(CUTSCENE_DOOR_A, CUTSCENE_DOOR_B);
                    }
                    break;
                default:
                    cutscene = return_table_door_push_or_pull(CUTSCENE_DOOR_0, CUTSCENE_DOOR_1);
                    break;
            }
        }
        if (sMarioStatusForCamera->unk1C[1] == 5) {
            cutscene = CUTSCENE_DOOR_WARP;
        }
        if (sMarioStatusForCamera->unk1C[1] == 1) {
            cutscene = CUTSCENE_ENTER_CANNON;
        }
        if (SURFACE_IS_PAINTING_WARP(sGeometryForMario.currFloorType)) {
            cutscene = CUTSCENE_ENTER_PAINTING;
        }
        switch (sMarioStatusForCamera->action) {
            case ACT_DEATH_EXIT:
                cutscene = CUTSCENE_DEATH_EXIT;
                break;
            case ACT_EXIT_AIRBORNE:
                cutscene = CUTSCENE_EXIT_PAINTING_SUCC;
                break;
            case ACT_SPECIAL_EXIT_AIRBORNE:
                if (gPrevLevel == LEVEL_BOWSER_1 || gPrevLevel == LEVEL_BOWSER_2
                    || gPrevLevel == LEVEL_BOWSER_3) {
                    cutscene = CUTSCENE_EXIT_BOWSER_SUCC;
                } else {
                    cutscene = CUTSCENE_EXIT_BBH_SUCC;
                }
                break;
            case ACT_SPECIAL_DEATH_EXIT:
                if (gPrevLevel == LEVEL_BOWSER_1 || gPrevLevel == LEVEL_BOWSER_2
                    || gPrevLevel == LEVEL_BOWSER_3) {
                    cutscene = CUTSCENE_1C_TODO;
                } else {
                    cutscene = CUTSCENE_NONPAINTING_DEATH;
                }
                break;
            case ACT_ENTERING_STAR_DOOR:
                if (c->unk64 == 0) {
                    cutscene = CUTSCENE_SLIDING_DOORS_OPEN;
                } else {
                    cutscene = CUTSCENE_DOOR_A;
                }
                break;
            case ACT_UNLOCKING_KEY_DOOR:
                cutscene = CUTSCENE_UNLOCK_KEY_DOOR;
                break;
            case ACT_WATER_DEATH:
                cutscene = CUTSCENE_WATER_DEATH;
                break;
            case ACT_DEATH_ON_BACK:
                cutscene = CUTSCENE_DEATH_ON_BACK;
                break;
            case ACT_DEATH_ON_STOMACH:
                cutscene = CUTSCENE_DEATH_2;
                break;
            case ACT_STANDING_DEATH:
                cutscene = CUTSCENE_STANDING_DEATH;
                break;
            case ACT_SUFFOCATION:
                cutscene = CUTSCENE_SUFFOCATION_DEATH;
                break;
            case ACT_QUICKSAND_DEATH:
                cutscene = CUTSCENE_QUICKSAND_DEATH;
                break;
            case ACT_ELECTROCUTION:
                cutscene = CUTSCENE_STANDING_DEATH;
                break;
            case ACT_STAR_DANCE_EXIT:
                cutscene = determine_star_fadeout_cutscene_table(c);
                break;
            case ACT_STAR_DANCE_WATER:
                cutscene = determine_star_fadeout_cutscene_table(c);
                break;
            case ACT_STAR_DANCE_NO_EXIT:
                cutscene = CUTSCENE_STAR_DANCE_1_2;
                break;
        }
        switch (sMarioStatusForCamera->unk1C[1]) {
            case 9:
                cutscene = CUTSCENE_INTRO_PEACH;
                break;
            case 10:
                cutscene = CUTSCENE_GRAND_STAR;
                break;
            case 11:
                cutscene = CUTSCENE_PEACH_END;
                break;
            case 12:
                cutscene = CUTSCENE_END_WAVING;
                break;
            case 13:
                cutscene = CUTSCENE_CREDITS;
                break;
        }
    }
    c->unk64 = 0;
    return cutscene;
}

void instant_warp_camera_update(f32 displacementX, f32 displacementY, f32 displacementZ) {
    Vec3f displacement;
    struct MarioState *marioStates = &gMarioStates[0];
    struct Struct8033B418_sub *sp1C = &D_8033B418.unk8;
    struct Struct8033B418_sub *sp28 = &D_8033B418.unk28;

    gCurrLevelArea = gCurrLevelNum * 16 + gCurrentArea->index;
    displacement[0] = displacementX;
    displacement[1] = displacementY;
    displacement[2] = displacementZ;
    vec3f_add(gCameraStatus.camFocAndPosCurrAndGoal[1], displacement);
    vec3f_add(gCameraStatus.camFocAndPosCurrAndGoal[0], displacement);
    vec3f_add(gCameraStatus.camFocAndPosCurrAndGoal[3], displacement);
    vec3f_add(gCameraStatus.camFocAndPosCurrAndGoal[2], displacement);
    marioStates->waterLevel += displacementY;
    vec3f_add(sp1C->unk0, displacement);
    vec3f_add(sp1C->unkC, displacement);
    vec3f_add(sp28->unk0, displacement);
    vec3f_add(sp28->unkC, displacement);
}

void approach_camera_height(struct LevelCamera *c, f32 goal, f32 inc) {
    if (gCameraFlags2 & CAM_FLAG_2_SMOOTH_MOVEMENT) {
        if (c->pos[1] < goal) {
            if ((c->pos[1] += inc) > goal) {
                c->pos[1] = goal;
            }
        } else {
            if ((c->pos[1] -= inc) < goal) {
                c->pos[1] = goal;
            }
        }
    } else {
        c->pos[1] = goal;
    }
}

void Unknown8028C3AC(UNUSED s32 a, UNUSED s32 b, UNUSED s32 c, UNUSED s32 d) {
}

void set_focus_position(struct LevelCamera *c, f32 b, f32 heightOffset, f32 d, s16 yawOffset) {
    s16 yaw;
    UNUSED u16 unused;
    f32 heightAboveFloor;

    return_height_above_floor(&heightAboveFloor, 1.f, 200.f, &heightAboveFloor, 0.9f, 200.f);
    yaw = sMarioStatusForCamera->faceAngle[1] + yawOffset;
    c->focus[2] = sMarioStatusForCamera->pos[2] + d * coss(yaw) - b * sins(yaw);
    c->focus[0] = sMarioStatusForCamera->pos[0] + d * sins(yaw) + b * coss(yaw);
    c->focus[1] = sMarioStatusForCamera->pos[1] + heightOffset + heightAboveFloor;
}

static void unused_set_camera_position(struct LevelCamera *c, f32 b, f32 heightOffset, f32 d,
                                       s16 yawOffset) {
    u16 yaw = sMarioStatusForCamera->faceAngle[1] + yawOffset;

    c->pos[0] = sMarioStatusForCamera->pos[0] + d * sins(yaw) + b * coss(yaw);
    c->pos[1] = sMarioStatusForCamera->pos[1] + heightOffset;
    c->pos[2] = sMarioStatusForCamera->pos[2] + d * coss(yaw) - b * sins(yaw);
}

void set_pos_from_face_angle_and_vec3f(Vec3f dst, Vec3f base, Vec3f posRelative, Vec3s faceAngle) {
    Vec3f unusedCopy;
    Vec3f yzRotatedPos;

    vec3f_copy(unusedCopy, base);

    yzRotatedPos[2] = -(posRelative[2] * coss(faceAngle[0]) - posRelative[1] * sins(faceAngle[0]));
    yzRotatedPos[1] = posRelative[2] * sins(faceAngle[0]) + posRelative[1] * coss(faceAngle[0]);
    yzRotatedPos[0] = posRelative[0];

    dst[0] = base[0] + yzRotatedPos[2] * sins(faceAngle[1]) + yzRotatedPos[0] * coss(faceAngle[1]);
    dst[1] = base[1] + yzRotatedPos[1];
    dst[2] = base[2] + yzRotatedPos[2] * coss(faceAngle[1]) - yzRotatedPos[0] * sins(faceAngle[1]);
}

void set_pos_from_face_angle_and_rel_coords(Vec3f dst, Vec3f base, Vec3s faceAngle, f32 xRelative,
                                            f32 yRelative, f32 zRelative) {
    Vec3f posRelative;

    vec3f_set(posRelative, xRelative, yRelative, zRelative);
    set_pos_from_face_angle_and_vec3f(dst, base, posRelative, faceAngle);
}

void determine_pushing_or_pulling_door(s16 *a) {
    if (sMarioStatusForCamera->action == ACT_PULLING_DOOR) {
        *a = 0;
    } else {
        *a = -0x8000;
    }
}

s16 func_8028C824(Vec3f a, Vec3f b, Vec3f c, Vec3f d, Vec3f e, Vec3f f, s16 yaw) {
    s16 yawVelocity;
    s16 pitchVelocity;
    f32 distVelocity;
    f32 goalDist;
    UNUSED u8 unused1[4];
    s16 goalPitch;
    s16 goalYaw;
    UNUSED u8 unused2[4];
    f32 f32Timer = sCameraTransition.timer;
    s16 s16Timer = sCameraTransition.timer;
    UNUSED s16 sp78 = 0;
    Vec3f sp6C;
    Vec3f sp60;
    Vec3f sp54;
    Vec3f sp48;
    s32 i;
    f32 floorHeight;
    struct Surface *floor;

    vec3f_copy(a, c);
    vec3f_copy(b, d);
    if (gCameraFlags2 & CAM_FLAG_2_UNKNOWN_10) {
        for (i = 0; i < 3; i++) {
            sp54[i] = e[i] + sMarioStatusForCamera->pos[i] - sCameraTransition.marioPos[i];
            sp48[i] = f[i] + sMarioStatusForCamera->pos[i] - sCameraTransition.marioPos[i];
        }

        vec3f_get_dist_and_angle(d, sp48, &sCameraTransition.dist2, &sCameraTransition.pitch2,
                                 &sCameraTransition.yaw2);
        vec3f_get_dist_and_angle(d, sp54, &sCameraTransition.dist1, &sCameraTransition.pitch1,
                                 &sCameraTransition.yaw1);
        gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_10;
    }
    if (sCameraTransition.timer > 0) {
        sp78 = 1;

        vec3f_get_dist_and_angle(d, c, &goalDist, &goalPitch, &goalYaw);
        distVelocity = ABS(goalDist - sCameraTransition.dist1) / f32Timer;
        pitchVelocity = ABS(goalPitch - sCameraTransition.pitch1) / s16Timer;
        yawVelocity = ABS(goalYaw - sCameraTransition.yaw1) / s16Timer;
        camera_approach_f32_symmetric_bool(&sCameraTransition.dist1, goalDist, distVelocity);
        camera_approach_s16_symmetric_bool(&sCameraTransition.yaw1, goalYaw, yawVelocity);
        camera_approach_s16_symmetric_bool(&sCameraTransition.pitch1, goalPitch, pitchVelocity);
        vec3f_set_dist_and_angle(d, sp6C, sCameraTransition.dist1, sCameraTransition.pitch1,
                                 sCameraTransition.yaw1);

        vec3f_get_dist_and_angle(c, d, &goalDist, &goalPitch, &goalYaw);
        pitchVelocity = sCameraTransition.pitch2 / (s16) sCameraTransition.timer;
        yawVelocity = sCameraTransition.yaw2 / (s16) sCameraTransition.timer;
        distVelocity = sCameraTransition.dist2 / sCameraTransition.timer;
        camera_approach_s16_symmetric_bool(&sCameraTransition.pitch2, goalPitch, pitchVelocity);
        camera_approach_s16_symmetric_bool(&sCameraTransition.yaw2, goalYaw, yawVelocity);
        camera_approach_f32_symmetric_bool(&sCameraTransition.dist2, 0, distVelocity);
        vec3f_set_dist_and_angle(d, sp60, sCameraTransition.dist2, sCameraTransition.pitch2,
                                 sCameraTransition.yaw2);

        vec3f_copy(b, sp60);
        vec3f_copy(a, sp6C);

        if (gCurrLevelCamera->cutscene != 0 || !(gCameraMovementFlags & CAM_MOVE_C_UP_MODE)) {
            floorHeight = find_floor(a[0], a[1], a[2], &floor);
            if (floorHeight != -11000.f) {
                if ((floorHeight += 125.f) > a[1]) {
                    a[1] = floorHeight;
                }
            }
            f32_find_wall_collision(&a[0], &a[1], &a[2], 0.f, 100.f);
        }
        sCameraTransition.timer--;
        yaw = calculate_yaw(b, a);
    } else {
        sCameraTransition.dist1 = 0.f;
        sCameraTransition.pitch1 = 0;
        sCameraTransition.yaw1 = 0;
        gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_11;
    }
    vec3f_copy(sCameraTransition.marioPos, sMarioStatusForCamera->pos);
    return yaw;
}

static void Unknown8028CE1C(void) {
    gCameraFlags2 &= ~(CAM_FLAG_2_UNKNOWN_10 | CAM_FLAG_2_UNKNOWN_11);
    sCameraTransition.timer = 0;
}

s32 set_camera_preset_fixed_ref_point(struct LevelCamera *c, s16 x, s16 y, s16 z) {
    s32 camPosSet = FALSE;
    f32 posX = x;
    f32 posY = y;
    f32 posZ = z;

    if (sFixedPresetBasePosition[0] != posX || sFixedPresetBasePosition[1] != posY
        || sFixedPresetBasePosition[2] != posZ) {
        camPosSet = TRUE;
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    }
    vec3f_set(sFixedPresetBasePosition, posX, posY, posZ);
    if (c->currPreset != CAMERA_PRESET_FIXED_REF_POINT) {
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        c->currPreset = CAMERA_PRESET_FIXED_REF_POINT;
        vec3f_set(c->pos, sFixedPresetBasePosition[0], sMarioStatusForCamera->pos[1],
                  sFixedPresetBasePosition[2]);
    }
    return camPosSet;
}

void set_camera_preset_platform_level(struct LevelCamera *c) {
    if (c->currPreset != CAMERA_PRESET_PLATFORM_LEVEL) {
        c->currPreset = CAMERA_PRESET_PLATFORM_LEVEL;
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        sPlatformLevelPresetBaseYaw = 0;
        gPlatformLevelYawOffset = 0;
    }
}

/**
 * If the camera preset is not already the boss fight camera (camera with two foci)
 * set it to be so.
 */
void set_camera_preset_boss_fight(struct LevelCamera *c) {
    if (c->currPreset != CAMERA_PRESET_BOSS_FIGHT) {
        set_camera_preset(c, CAMERA_PRESET_BOSS_FIGHT, 15);
        sFirstPersonCameraYaw = c->storedYaw - 0x2000;
    }
}

void set_camera_preset_close_cam(u8 *preset) {
    if (*preset != CAMERA_PRESET_CLOSE) {
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        *preset = CAMERA_PRESET_CLOSE;
    }
}

void set_camera_preset_open_camera(struct LevelCamera *c, s16 b) {
    Vec3f focus;
    s16 yaw;

    focus[0] = c->xFocus;
    focus[1] = sMarioStatusForCamera->pos[1];
    focus[2] = c->zFocus;
    if (c->currPreset != CAMERA_PRESET_OPEN_CAMERA) {
        yaw =
            calculate_yaw(focus, sMarioStatusForCamera->pos) - calculate_yaw(c->focus, c->pos) + 0x4000;
        if (yaw > 0) {
            set_camera_preset(c, CAMERA_PRESET_OPEN_CAMERA, b);
        } else {
            c->currPreset = CAMERA_PRESET_OPEN_CAMERA;
            gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        }
        sFirstPersonCameraYaw = 0;
    }
}

void parallel_tracking_init(struct LevelCamera *a, struct ParallelTrackingTable *b) {
    if (a->currPreset != CAMERA_PRESET_PARALLEL_TRACKING) {
        D_8033B470 = b;
        D_8033B46C = 0;
        D_8033B478.pos[0] = 0.f;
        D_8033B478.pos[1] = 0.f;
        D_8033B478.pos[2] = 0.f;
        a->pos[0] = (D_8033B470[0].unk4[0] + D_8033B470[1].unk4[0]) / 2.f;
        a->pos[1] = (D_8033B470[0].unk4[1] + D_8033B470[1].unk4[1]) / 2.f;
        a->pos[2] = (D_8033B470[0].unk4[2] + D_8033B470[1].unk4[2]) / 2.f;
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        a->currPreset = CAMERA_PRESET_PARALLEL_TRACKING;
    }
}

void set_fixed_cam_axis_sa_lobby(UNUSED s16 preset) {
    switch (gCurrLevelArea) {
        case AREA_SA:
            vec3f_set(sFixedPresetBasePosition, 646.f, 143.f, -1513.f);
            break;

        case AREA_CASTLE_LOBBY:
            vec3f_set(sFixedPresetBasePosition, -577.f, 143.f, 1443.f);
            break;
    }
}

void func_8028D32C(u8 *preset) {
    if ((sMarioStatusForCamera->action & ACT_FLAG_METAL_WATER) || *preset == CAMERA_PRESET_BEHIND_MARIO
        || *preset == CAMERA_PRESET_WATER_SURFACE) {
        gCameraFlags2 |= CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    }

    if (gCurrLevelNum == LEVEL_DDD || gCurrLevelNum == LEVEL_WDW || gCurrLevelNum == LEVEL_COTMC) {
        gCameraFlags2 &= ~CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    }

    if ((*preset == CAMERA_PRESET_BEHIND_MARIO
         && !(sMarioStatusForCamera->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)))
        || *preset == CAMERA_PRESET_INSIDE_CANNON) {
        gCameraFlags2 |= CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    }
}

CmdRet CameraRR00(struct LevelCamera *c) {
    set_camera_preset_platform_level(c);
    sPlatformLevelPresetBaseYaw = 0x4000;
}

CmdRet CameraRR04(struct LevelCamera *c) {
    set_camera_preset_platform_level(c);
    if (c->pos[1] < 6343.f) {
        c->pos[1] = 7543.f;
        gCameraStatus.camFocAndPosCurrAndGoal[3][1] = c->pos[1];
        gCameraStatus.camFocAndPosCurrAndGoal[1][1] = c->pos[1];
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    }
}

CmdRet CameraRR02(struct LevelCamera *c) {
    if (c->currPreset != CAMERA_PRESET_FIXED_REF_POINT) {
        set_camera_preset_fixed_ref_point(c, -2974, 478, -3975);
    }
}

CmdRet CameraRR0305(struct LevelCamera *c) {
    if (c->currPreset != CAMERA_PRESET_FIXED_REF_POINT) {
        set_camera_preset_fixed_ref_point(c, -2953, 798, -3943);
    }
    if (c->pos[1] > 6043.f) {
        c->pos[1] = 6043.f;
    }
}

CmdRet CameraRR01(struct LevelCamera *c) {
    if (c->currPreset != CAMERA_PRESET_FIXED_REF_POINT) {
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        c->currPreset = CAMERA_PRESET_FIXED_REF_POINT;
    }
}

CmdRet CameraCotMC00(UNUSED struct LevelCamera *c) {
    gCameraMovementFlags |= CAM_MOVE_UNKNOWN_7;
}

CmdRet CameraSL00(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    set_camera_preset(c, CAMERA_PRESET_PLATFORM_LEVEL, 60);
    sPlatformLevelPresetBaseYaw = 0x1D27;
}

CmdRet camera_change_set_free_roam_mode(struct LevelCamera *c) {
    set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 60);
}

void move_camera_through_floor_while_descending(struct LevelCamera *c, f32 height) {
    UNUSED f32 pad;

    if ((sGeometryForMario.currFloorHeight < height - 100.f)
        && (sGeometryForMario.prevFloorHeight > sGeometryForMario.currFloorHeight)) {
        c->pos[1] = height - 400.f;
        gCameraStatus.camFocAndPosCurrAndGoal[1][1] = height - 400.f;
        gCameraStatus.camFocAndPosCurrAndGoal[3][1] = height - 400.f;
    }
}

CmdRet camera_change_hmc_maze_entrance(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    if (c->pos[1] > -102.f) {
        vec3f_get_dist_and_angle(c->focus, gCameraStatus.camFocAndPosCurrAndGoal[3], &sp20, &sp26,
                                 &sp24);
        vec3f_set_dist_and_angle(c->focus, gCameraStatus.camFocAndPosCurrAndGoal[3], 300.f, sp26, sp24);
        gCameraStatus.camFocAndPosCurrAndGoal[3][1] = -800.f;
#ifndef VERSION_JP
        c->pos[1] = gCameraStatus.camFocAndPosCurrAndGoal[3][1];
        gCameraStatus.camFocAndPosCurrAndGoal[1][1] = gCameraStatus.camFocAndPosCurrAndGoal[3][1];
#endif
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    }
}

CmdRet CameraHMC02(struct LevelCamera *c) {
    move_camera_through_floor_while_descending(c, 1536.f);
}

CmdRet CameraHMC03(struct LevelCamera *c) {
    move_camera_through_floor_while_descending(c, 2355.f);
}

CmdRet CameraHMC04(struct LevelCamera *c) {
    move_camera_through_floor_while_descending(c, 1843.f);
}

CmdRet CameraHMC05(struct LevelCamera *c) {
    move_camera_through_floor_while_descending(c, 1843.f);
}

CmdRet CameraSSL00(UNUSED struct LevelCamera *c) {
    func_8028F834(CUTSCENE_ENTER_PYRAMID_TOP);
}

CmdRet CameraSSL0102(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    set_camera_preset(c, CAMERA_PRESET_CLOSE, 90);
}

CmdRet CameraSSL03(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    set_camera_preset(c, CAMERA_PRESET_REVERSE_TOWER, 90);
}

CmdRet CameraTHI00(UNUSED struct LevelCamera *c) {
    if (sFirstPersonCameraYaw < 0x2AAA) {
        sFirstPersonCameraYaw = 0x2AAA;
    }
}

CmdRet CameraTHI01(UNUSED struct LevelCamera *c) {
    if (sFirstPersonCameraYaw > 0x3AAA) {
        sFirstPersonCameraYaw = 0x3AAA;
    }
}

CmdRet CameraRR07(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    set_camera_preset(c, CAMERA_PRESET_OPEN_CAMERA, 90);
}

CmdRet CameraRR08(struct LevelCamera *c) {
    set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 90);
}

CmdRet camera_change_hmc_cotmc_pool_entry(struct LevelCamera *c) {
    if ((sMarioStatusForCamera->action != ACT_SPECIAL_DEATH_EXIT)
        && (sMarioStatusForCamera->action != ACT_SPECIAL_EXIT_AIRBORNE)) {
        set_camera_cutscene_table(c, CUTSCENE_ENTER_POOL);
    }
}

CmdRet CameraInside20(UNUSED struct LevelCamera *c) {
    vec3f_set(sFixedPresetBasePositionOffset, -813.f - sFixedPresetBasePosition[0],
              378.f - sFixedPresetBasePosition[1], 1103.f - sFixedPresetBasePosition[2]);
}

CmdRet CameraInside1E(struct LevelCamera *c) {
    struct Surface *floor;
    f32 floorHeight = find_floor(c->pos[0], c->pos[1], c->pos[2], &floor);

    if ((sGeometryForMario.currFloorHeight > 1229.f) && (floorHeight < 1229.f)
        && (sCSideButtonYaw == 0)) {
        vec3f_set(c->pos, -227.f, 1425.f, 1533.f);
    }
}

CmdRet CameraInside1F(struct LevelCamera *c) {
    struct Surface *floor;
    f32 floorHeight = find_floor(c->pos[0], c->pos[1], c->pos[2], &floor);

    if ((floorHeight > -110.f) && (sCSideButtonYaw == 0)) {
        vec3f_set(c->pos, -980.f, 249.f, -1398.f);
    }
}

CmdRet CameraInside01(struct LevelCamera *c) {
    if (c->currPreset != CAMERA_PRESET_FIXED_REF_POINT) {
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
        set_fixed_cam_axis_sa_lobby(c->currPreset);
        c->currPreset = CAMERA_PRESET_FIXED_REF_POINT;
    }
}

CmdRet CameraInside1213(struct LevelCamera *c) {
    set_camera_preset(c, CAMERA_PRESET_SPIRAL_STAIRS, 20);
}

static CmdRet CameraUnused(struct LevelCamera *c) {
    if (c->currPreset == CAMERA_PRESET_SPIRAL_STAIRS) {
        set_camera_preset(c, CAMERA_PRESET_CLOSE, 30);
    } else {
        set_camera_preset_close_cam(&c->currPreset);
    }
}

CmdRet CameraInside00(struct LevelCamera *c) {
    set_camera_preset_close_cam(&c->currPreset);
}

CmdRet CameraInside0E(struct LevelCamera *c) {
    CameraInside00(c);
    c->unk64 = 2;
}

CmdRet CameraInside0F(struct LevelCamera *c) {
    CameraInside01(c);
}

CmdRet bbh_room_6_camera(struct LevelCamera *c) {
    parallel_tracking_init(c, BBHRoom6ParallelTrackingTable);
}

CmdRet CameraBBH24(struct LevelCamera *c) {
    set_camera_preset_close_cam(&c->currPreset);
}

CmdRet CameraBBH2E2F(struct LevelCamera *c) {
    Vec3f relativePosition;
    set_camera_preset_close_cam(&c->currPreset);
    vec3f_set(relativePosition, 0.f, 0.f, 300.f);
    set_pos_from_face_angle_and_vec3f(gCameraStatus.camFocAndPosCurrAndGoal[3],
                                      sMarioStatusForCamera->pos, relativePosition,
                                      sMarioStatusForCamera->faceAngle);
    gCameraStatus.camFocAndPosCurrAndGoal[3][1] = -2300.f;
    vec3f_copy(c->pos, gCameraStatus.camFocAndPosCurrAndGoal[3]);
    gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
}

CmdRet bbh_room_1_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 956, 440, 1994);
}

CmdRet CameraBBH01(struct LevelCamera *c) {
    c->unk64 = 1;
    bbh_room_1_camera(c);
}

CmdRet bbh_room_2_lower_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 2591, 400, 1284);
}

CmdRet bbh_room_4_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 3529, 340, -1384);
}

CmdRet bbh_room_8_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, -500, 740, -1306);
}

/**
 * In BBH's room 5's library (the first floor room with the vanish cap/boo painting)
 * set the camera preset to fixed and position to (-2172, 200, 675)
 */
CmdRet bbh_room_5_library_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, -2172, 200, 675);
}

/**
 * In BBH's room 5 (the first floor room with the vanish cap/boo painting)
 * set the camera preset to to the hidden room's position
 * if coming from the library.
 */
CmdRet bbh_room_5_library_to_hidden_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, -2172, 200, 675) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_5_hidden_to_library_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, -1542, 320, -307) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_5_hidden_camera(struct LevelCamera *c) {
    c->unk64 = 1;
    set_camera_preset_fixed_ref_point(c, -1542, 320, -307);
}

CmdRet bbh_room_3_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, -1893, 320, 2327);
}

CmdRet bbh_room_7_mr_i_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 1371, 360, -1302);
}

CmdRet bbh_room_7_mr_i_to_coffins_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, 1371, 360, -1302) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_7_coffins_to_mr_i_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, 2115, 260, -772) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet CameraBBH3033(struct LevelCamera *c) {
    c->unk64 = 1;
    set_camera_preset_close_cam(&c->currPreset);
}

CmdRet CameraBBH34(struct LevelCamera *c) {
    set_camera_preset_close_cam(&c->currPreset);
}

CmdRet CameraBBH38(struct LevelCamera *c) {
    if (c->currPreset == CAMERA_PRESET_FIXED_REF_POINT) {
        set_camera_preset_close_cam(&c->currPreset);
        c->pos[1] = -405.f;
        gCameraStatus.camFocAndPosCurrAndGoal[3][1] = -405.f;
    }
}

CmdRet bbh_room_12_upper_camera(struct LevelCamera *c) {
    c->unk64 = 1;
    set_camera_preset_fixed_ref_point(c, -2932, 296, 4429);
}

CmdRet CameraBBH00(struct LevelCamera *c) {
    set_camera_preset_close_cam(&c->currPreset);
}

CmdRet bbh_room_2_library_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 3493, 440, 617);
}

CmdRet bbh_room_2_library_to_trapdoor_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, 3493, 440, 617) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_2_trapdoor_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 3502, 440, 1217);
}

CmdRet bbh_room_2_trapdoor_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, 3502, 440, 1217) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_9_attic_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, -670, 460, 372);
}

CmdRet bbh_room_9_attic_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, -670, 460, 372) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_9_mr_i_transition(struct LevelCamera *c) {
    if (set_camera_preset_fixed_ref_point(c, 131, 380, -263) == 1) {
        init_transitional_movement(c, 20);
    }
}

CmdRet bbh_room_13_balcony_camera(struct LevelCamera *c) {
    set_camera_preset_fixed_ref_point(c, 210, 420, 3109);
}

CmdRet bbh_room_0_camera(struct LevelCamera *c) {
    c->unk64 = 1;
    set_camera_preset_fixed_ref_point(c, -204, 807, 204);
}

CmdRet camera_change_activate_ccm_slide_flag(UNUSED struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_CCM_SLIDE_SHORTCUT;
}

CmdRet camera_change_deactivate_ccm_slide_flag(UNUSED struct LevelCamera *c) {
    gCameraFlags2 &= ~CAM_FLAG_2_CCM_SLIDE_SHORTCUT;
}

u32 surface_type_presets(struct LevelCamera *c) {
    u32 presetChanged = 0;

    switch (sGeometryForMario.currFloorType) {
        case SURFACE_CLOSE_CAMERA:
            set_camera_preset(c, CAMERA_PRESET_CLOSE, 90);
            presetChanged += 1;
            break;

        case SURFACE_CAMERA_FREE_ROAM:
            set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 90);
            presetChanged += 1;
            break;

        case SURFACE_NO_CAM_COL_SLIPPERY:
            set_camera_preset(c, CAMERA_PRESET_CLOSE, 90);
            presetChanged += 1;
            break;
    }
    return presetChanged;
}

u32 set_preset_via_surface_or_input(struct LevelCamera *c, u8 preset) {
    u32 sp1C = 0;
    sp1C = surface_type_presets(c);

    if ((sp1C == 0) && (preset != 0)) {
        set_camera_preset(c, preset, 90);
    }

    return sp1C;
}

void surface_type_presets_thi(struct LevelCamera *c) {
    switch (sGeometryForMario.currFloorType) {
        case SURFACE_CLOSE_CAMERA:
            if (c->currPreset != CAMERA_PRESET_CLOSE) {
                set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 90);
            }
            break;

        case SURFACE_CAMERA_FREE_ROAM:
            if (c->currPreset != CAMERA_PRESET_CLOSE) {
                set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 90);
            }
            break;

        case SURFACE_NO_CAM_COL_SLIPPERY:
            if (c->currPreset != CAMERA_PRESET_CLOSE) {
                set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 90);
            }
            break;

        case SURFACE_CAMERA_PLATFORM:
            set_camera_preset(c, CAMERA_PRESET_PLATFORM_LEVEL, 90);
            break;

        default:
            set_camera_preset(c, CAMERA_PRESET_OPEN_CAMERA, 90);
    }
}

#define TABLE_EMPTY                                                                                    \
    { 0, NULL, 0, 0, 0, 0, 0, 0, 0 }

/**
 * The SL Table operates camera behavior in front of the snowman who blows air.
 * The first sets a special preset, while the latter (which encompasses the former)
 * sets it back.
 *
 * This behavior is exploitable, since the ranges assume that Mario must pass through the latter on
 * exit. Using hyperspeed, the earlier area can be directly exited from, keeping the changes it applies.
 */
struct TableCamera TableCameraSL[3] = { { 1, CameraSL00, 1119, 3584, 1125, 1177, 358, 358, -7463 },
                                        { 1, camera_change_set_free_roam_mode, 1119, 3584, 1125, 4096,
                                          4096, 4096, -7463 },
                                        TABLE_EMPTY };

/**
 * The THI table is specifically for the tunnel near the start of the Huge Island.
 * The first aligns with the tunnel, the latter helps the camera from getting stuck on the
 * starting side. Both sides achieve their effect by editing the camera yaw.
 */
struct TableCamera TableCameraTHI[3] = { { 1, CameraTHI00, -4609, -2969, 6448, 100, 300, 300, 0 },
                                         { 1, CameraTHI01, -4809, -2969, 6448, 100, 300, 300, 0 },
                                         TABLE_EMPTY };

struct TableCamera TableCameraHMC[7] = {
    { 1, camera_change_hmc_maze_entrance, 1996, 102, 0, 205, 100, 205, 0 },
    { 1, camera_change_hmc_cotmc_pool_entry, 3350, -4689, 4800, 600, 50, 600, 0 },
    { 1, CameraHMC02, -3278, 1236, 1379, 358, 200, 358, 0 },
    { 1, CameraHMC03, -2816, 2055, -2560, 358, 200, 358, 0 },
    { 1, CameraHMC04, -3532, 1543, -7040, 358, 200, 358, 0 },
    { 1, CameraHMC05, -972, 1543, -7347, 358, 200, 358, 0 },
    TABLE_EMPTY
};

struct TableCamera TableCameraSSL[5] = { { 1, CameraSSL00, -2048, 1080, -1024, 150, 150, 150, 0 },
                                         { 2, CameraSSL0102, 0, -104, -104, 1248, 1536, 2950, 0 },
                                         { 2, CameraSSL0102, 0, 2500, 256, 515, 5000, 515, 0 },
                                         { 3, CameraSSL03, 0, -1534, -2040, 1000, 800, 1000, 0 },
                                         TABLE_EMPTY };

struct TableCamera TableCameraRR[10] = { { 1, CameraRR00, -4197, 3819, -3087, 1769, 1490, 342, 0 },
                                         { 1, CameraRR01, -4197, 3819, -3771, 769, 490, 342, 0 },
                                         { 1, CameraRR02, -5603, 4834, -5209, 300, 600, 591, 0 },
                                         { 1, CameraRR0305, -2609, 3730, -5463, 300, 650, 577, 0 },
                                         { 1, CameraRR04, -4196, 7343, -5155, 4500, 1000, 4500, 0 },
                                         { 1, CameraRR0305, -4196, 6043, -5155, 500, 300, 500, 0 },
                                         TABLE_EMPTY,
                                         { 1, CameraRR07, 2468, 2720, -4608, 3263, 1696, 3072, 0 },
                                         { -1, CameraRR08, 0, 0, 0, 0, 0, 0, 0 },
                                         TABLE_EMPTY };

struct TableCamera TableCameraCotMC[2] = { { 1, CameraCotMC00, 0, 1500, 3500, 550, 10000, 1500, 0 },
                                           TABLE_EMPTY };

struct TableCamera TableCameraCCM[3] = {
    { 2, camera_change_activate_ccm_slide_flag, -4846, 2061, 27, 1229, 1342, 396, 0 },
    { 2, camera_change_deactivate_ccm_slide_flag, -6412, -3917, -6246, 307, 185, 132, 0 },
    TABLE_EMPTY
};

struct TableCamera TableCameraInside[35] = {
    { 1, CameraInside00, -1100, 657, -1346, 300, 150, 300, 0 },
    { 1, CameraInside01, -1099, 657, -803, 300, 150, 300, 0 },
    { 1, CameraInside00, -2304, -264, -4072, 140, 150, 140, 0 },
    { 1, CameraInside00, -2304, 145, -1344, 140, 150, 140, 0 },
    { 1, CameraInside01, -2304, 145, -802, 140, 150, 140, 0 },
    { 1, CameraInside00, 2816, 1200, -256, 100, 100, 100, 0 },
    { 1, CameraInside00, 256, -161, -4226, 140, 150, 140, 0 },
    { 1, CameraInside00, 256, 145, -1344, 140, 150, 140, 0 },
    { 1, CameraInside01, 256, 145, -802, 140, 150, 140, 0 },
    { 1, CameraInside00, -1023, 44, -4870, 140, 150, 140, 0 },
    { 1, CameraInside00, -459, 145, -1020, 140, 150, 140, 24576 },
    { 1, CameraInside01, -85, 145, -627, 140, 150, 140, 0 },
    { 1, CameraInside00, -1589, 145, -1020, 140, 150, 140, -24576 },
    { 1, CameraInside01, -1963, 145, -627, 140, 150, 140, 0 },
    { 1, CameraInside0E, -2838, 657, -1659, 200, 150, 150, 8192 },
    { 1, CameraInside0F, -2319, 512, -1266, 300, 150, 300, 8192 },
    { 1, CameraInside00, 844, 759, -1657, 40, 150, 40, -8192 },
    { 1, CameraInside01, 442, 759, -1292, 140, 150, 140, -8192 },
    { 2, CameraInside1213, -1000, 657, 1740, 200, 300, 200, 0 },
    { 2, CameraInside1213, -996, 1348, 1814, 200, 300, 200, 0 },
    { 2, CameraInside00, -946, 657, 2721, 50, 150, 50, 0 },
    { 2, CameraInside00, -996, 1348, 907, 50, 150, 50, 0 },
    { 2, CameraInside00, -997, 1348, 1450, 140, 150, 140, 0 },
    { 1, CameraInside00, -4942, 452, -461, 140, 150, 140, 16384 },
    { 1, CameraInside00, -3393, 350, -793, 140, 150, 140, 16384 },
    { 1, CameraInside01, -2851, 350, -792, 140, 150, 140, 16384 },
    { 1, CameraInside01, 803, 350, -228, 140, 150, 140, -16384 },
    { 1, CameraInside01, 803, 350, -228, 140, 150, 140, -16384 },
    { 1, CameraInside00, 1345, 350, -229, 140, 150, 140, 16384 },
    { 1, CameraInside00, -946, -929, 622, 300, 150, 300, 0 },
    { 2, CameraInside1E, -205, 1456, 2508, 210, 928, 718, 0 },
    { 1, CameraInside1F, -1027, -587, -718, 318, 486, 577, 0 },
    { 1, CameraInside20, -1023, 376, 1830, 300, 400, 300, 0 },
    { 3, camera_change_hmc_cotmc_pool_entry, 2485, -1689, -2659, 600, 50, 600, 0 },
    TABLE_EMPTY
};

struct TableCamera TableCameraBBH[61] = {
    { 1, CameraBBH00, 742, 0, 2369, 200, 200, 200, 0 },
    { 1, CameraBBH01, 741, 0, 1827, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 222, 0, 1458, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 222, 0, 639, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 435, 0, 222, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 1613, 0, 222, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 1827, 0, 1459, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, -495, 819, 1407, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, -495, 819, 640, 250, 200, 200, 0 },
    { 1, bbh_room_1_camera, 179, 819, 222, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 1613, 819, 222, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 1827, 819, 486, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 1827, 819, 1818, 200, 200, 200, 0 },
    { 1, bbh_room_2_lower_camera, 2369, 0, 1459, 200, 200, 200, 0 },
    { 1, bbh_room_2_lower_camera, 3354, 0, 1347, 200, 200, 200, 0 },
    { 1, bbh_room_2_lower_camera, 2867, 514, 1843, 512, 102, 409, 0 },
    { 1, bbh_room_4_camera, 3354, 0, 804, 200, 200, 200, 0 },
    { 1, bbh_room_4_camera, 1613, 0, -320, 200, 200, 200, 0 },
    { 1, bbh_room_8_camera, 435, 0, -320, 200, 200, 200, 0 },
    { 1, bbh_room_5_library_camera, -2021, 0, 803, 200, 200, 200, 0 },
    { 1, bbh_room_5_library_camera, -320, 0, 640, 200, 200, 200, 0 },
    { 1, bbh_room_5_library_to_hidden_transition, -1536, 358, -254, 716, 363, 102, 0 },
    { 1, bbh_room_5_hidden_to_library_transition, -1536, 358, -459, 716, 363, 102, 0 },
    { 1, bbh_room_5_hidden_camera, -1560, 0, -1314, 200, 200, 200, 0 },
    { 1, bbh_room_3_camera, -320, 0, 1459, 200, 200, 200, 0 },
    { 1, bbh_room_3_camera, -2021, 0, 1345, 200, 200, 200, 0 },
    { 1, bbh_room_2_library_camera, 2369, 819, 486, 200, 200, 200, 0 },
    { 1, bbh_room_2_library_camera, 2369, 1741, 486, 200, 200, 200, 0 },
    { 1, bbh_room_2_library_to_trapdoor_transition, 2867, 1228, 1174, 716, 414, 102, 0 },
    { 1, bbh_room_2_trapdoor_transition, 2867, 1228, 1378, 716, 414, 102, 0 },
    { 1, bbh_room_2_trapdoor_camera, 2369, 819, 1818, 200, 200, 200, 0 },
    { 1, bbh_room_9_attic_camera, 1829, 1741, 486, 200, 200, 200, 0 },
    { 1, bbh_room_9_attic_camera, 741, 1741, 1587, 200, 200, 200, 0 },
    { 1, bbh_room_9_attic_transition, 102, 2048, -191, 100, 310, 307, 0 },
    { 1, bbh_room_9_mr_i_transition, 409, 2048, -191, 100, 310, 307, 0 },
    { 1, bbh_room_13_balcony_camera, 742, 1922, 2164, 200, 200, 200, 0 },
    { 1, CameraBBH24, 587, 1322, 2677, 1000, 400, 600, 0 },
    { 1, bbh_room_3_camera, -1037, 819, 1408, 200, 200, 200, 0 },
    { 1, bbh_room_3_camera, -1970, 1024, 1345, 200, 200, 200, 0 },
    { 1, bbh_room_8_camera, 179, 819, -320, 200, 200, 200, 0 },
    { 1, bbh_room_7_mr_i_camera, 1613, 819, -320, 200, 200, 200, 0 },
    { 1, bbh_room_7_mr_i_to_coffins_transition, 2099, 1228, -819, 102, 414, 716, 0 },
    { 1, bbh_room_7_coffins_to_mr_i_transition, 2304, 1228, -819, 102, 414, 716, 0 },
    { 1, bbh_room_6_camera, -1037, 819, 640, 200, 200, 200, 0 },
    { 1, bbh_room_6_camera, -1970, 1024, 803, 200, 200, 200, 0 },
    { 1, bbh_room_1_camera, 1827, 819, 1818, 200, 200, 200, 0 },
    { 1, CameraBBH2E2F, 2355, -1112, -193, 1228, 500, 1343, 0 },
    { 1, CameraBBH2E2F, 2355, -1727, 1410, 1228, 500, 705, 0 },
    { 1, CameraBBH3033, 0, -2457, 1827, 250, 200, 250, 0 },
    { 1, CameraBBH3033, 0, -2457, 2369, 250, 200, 250, 0 },
    { 1, CameraBBH3033, 0, -2457, 4929, 250, 200, 250, 0 },
    { 1, CameraBBH3033, 0, -2457, 4387, 250, 200, 250, 0 },
    { 1, CameraBBH34, 1887, -2457, 204, 250, 200, 250, 0 },
    { 1, bbh_room_0_camera, 1272, -2457, 204, 250, 200, 250, 0 },
    { 1, bbh_room_0_camera, -1681, -2457, 204, 250, 200, 250, 0 },
    { 1, CameraBBH34, -2296, -2457, 204, 250, 200, 250, 0 },
    { 1, CameraBBH38, -2939, -605, 5367, 800, 100, 800, 0 },
    { 1, bbh_room_12_upper_camera, -2939, -205, 5367, 300, 100, 300, 0 },
    { 1, bbh_room_12_upper_camera, -2332, -204, 4714, 250, 200, 250, 24576 },
    { 1, CameraBBH34, -1939, -204, 4340, 250, 200, 250, 24576 },
    TABLE_EMPTY
};

#define _ NULL

#define STUB_LEVEL(_0, _1, _2, _3, _4, _5, _6, _7, cameratable) cameratable,
#define DEFINE_LEVEL(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, cameratable) cameratable,

/*
 * This table has an extra 2 levels after the last unknown_38 stub level. What I think
 * the programmer was thinking was that the table is null terminated and so used the 
 * level count as a coorespondance to the ID of the final level, but the enum represents 
 * an ID *after* the last stub lebel, not before or during it.
 */
struct TableCamera *TableLevelCinematicCamera[LEVEL_COUNT + 1] = {
    NULL,
    #include "levels/level_defines.h"
};
#undef _
#undef STUB_LEVEL
#undef DEFINE_LEVEL

struct CutsceneSplinePoint sIntroStartToPipePosition[23] = {
    { 0, 0, { 2122, 8762, 9114 } },  { 0, 0, { 2122, 8762, 9114 } },  { 1, 0, { 2122, 7916, 9114 } },
    { 1, 0, { 2122, 7916, 9114 } },  { 2, 0, { 957, 5166, 8613 } },   { 3, 0, { 589, 4338, 7727 } },
    { 4, 0, { 690, 3366, 6267 } },   { 5, 0, { -1600, 2151, 4955 } }, { 6, 0, { -1557, 232, 1283 } },
    { 7, 0, { -6962, -295, 2729 } }, { 8, 0, { -6979, 131, 3246 } },  { 9, 0, { -6360, -283, 4044 } },
    { 0, 0, { -5695, -334, 5264 } }, { 1, 0, { -5568, -319, 7933 } }, { 2, 0, { -3848, -200, 6278 } },
    { 3, 0, { -965, -263, 6092 } },  { 4, 0, { 1607, 2465, 6329 } },  { 5, 0, { 2824, 180, 3548 } },
    { 6, 0, { 1236, 136, 945 } },    { 0, 0, { 448, 136, 564 } },     { 0, 0, { 448, 136, 564 } },
    { 0, 0, { 448, 136, 564 } },     { -1, 0, { 448, 136, 564 } }
};

struct CutsceneSplinePoint sIntroStartToPipeFocus[23] = {
    { 0, 50, { 1753, 29800, 8999 } }, { 0, 50, { 1753, 29800, 8999 } },
    { 1, 50, { 1753, 8580, 8999 } },  { 1, 100, { 1753, 8580, 8999 } },
    { 2, 50, { 520, 5400, 8674 } },   { 3, 50, { 122, 4437, 7875 } },
    { 4, 50, { 316, 3333, 6538 } },   { 5, 36, { -1526, 2189, 5448 } },
    { 6, 50, { -1517, 452, 1731 } },  { 7, 50, { -6659, -181, 3109 } },
    { 8, 17, { -6649, 183, 3618 } },  { 9, 20, { -6009, -214, 4395 } },
    { 0, 50, { -5258, -175, 5449 } }, { 1, 36, { -5158, -266, 7651 } },
    { 2, 26, { -3351, -192, 6222 } }, { 3, 25, { -483, -137, 6060 } },
    { 4, 100, { 1833, 2211, 5962 } }, { 5, 26, { 3022, 207, 3090 } },
    { 6, 20, { 1250, 197, 449 } },    { 7, 50, { 248, 191, 227 } },
    { 7, 0, { 48, 191, 227 } },       { 7, 0, { 48, 191, 227 } },
    { -1, 0, { 48, 191, 227 } }
};

/**
 * Describes the spline the camera follows, starting when the camera jumps to Lakitu and ending after
 * mario jumps out of the pipe when the first dialog opens.  This table specifically updates the
 * camera's position.
 */
struct CutsceneSplinePoint sIntroPipeToDialogPosition[14] = {
    { 0, 0, { -785, 625, 4527 } },  { 1, 0, { -785, 625, 4527 } },  { 2, 0, { -1286, 644, 4376 } },
    { 3, 0, { -1286, 623, 4387 } }, { 4, 0, { -1286, 388, 3963 } }, { 5, 0, { -1286, 358, 4093 } },
    { 6, 0, { -1386, 354, 4159 } }, { 7, 0, { -1477, 306, 4223 } }, { 8, 0, { -1540, 299, 4378 } },
    { 9, 0, { -1473, 316, 4574 } }, { 0, 0, { -1328, 485, 5017 } }, { 0, 0, { -1328, 485, 5017 } },
    { 0, 0, { -1328, 485, 5017 } }, { -1, 0, { -1328, 485, 5017 } }
};

/**
 * Describes the spline that the camera's focus follows, during the same part of the intro as the above.
 */
struct CutsceneSplinePoint sIntroPipeToDialogFocus[14] = {
    { 0, 20, { -1248, 450, 4596 } }, { 1, 59, { -1258, 485, 4606 } }, { 2, 59, { -1379, 344, 4769 } },
    { 3, 20, { -1335, 366, 4815 } }, { 4, 23, { -1315, 370, 4450 } }, { 5, 40, { -1322, 333, 4591 } },
    { 6, 25, { -1185, 329, 4616 } }, { 7, 21, { -1059, 380, 4487 } }, { 8, 14, { -1086, 421, 4206 } },
    { 9, 21, { -1321, 346, 4098 } }, { 0, 0, { -1328, 385, 4354 } },  { 0, 0, { -1328, 385, 4354 } },
    { 0, 0, { -1328, 385, 4354 } },  { -1, 0, { -1328, 385, 4354 } }
};

struct CutsceneSplinePoint D_8032E040[10] = {
    { 0, 0, { -86, 876, 640 } },   { 1, 0, { -86, 876, 610 } },   { 2, 0, { -66, 945, 393 } },
    { 3, 0, { -80, 976, 272 } },   { 4, 0, { -66, 1306, -36 } },  { 5, 0, { -70, 1869, -149 } },
    { 6, 0, { -10, 2093, -146 } }, { 7, 0, { -10, 2530, -248 } }, { 8, 0, { -10, 2530, -263 } },
    { 9, 0, { -10, 2530, -273 } }
};

struct CutsceneSplinePoint D_8032E090[11] = {
    { 0, 50, { -33, 889, -7 } },    { 1, 35, { -33, 889, -7 } },    { 2, 31, { -17, 1070, -193 } },
    { 3, 25, { -65, 1182, -272 } }, { 4, 20, { -64, 1559, -542 } }, { 5, 25, { -68, 2029, -677 } },
    { 6, 25, { -9, 2204, -673 } },  { 7, 25, { -8, 2529, -772 } },  { 8, 0, { -8, 2529, -772 } },
    { 9, 0, { -8, 2529, -772 } },   { -1, 0, { -8, 2529, -772 } }
};

struct CutsceneSplinePoint D_8032E0E8[20] = {
    { 0, 50, { 1, 120, -1150 } },    { 1, 50, { 1, 120, -1150 } },    { 2, 40, { 118, 121, -1199 } },
    { 3, 40, { 147, 74, -1306 } },   { 4, 40, { 162, 95, -1416 } },   { 5, 40, { 25, 111, -1555 } },
    { 6, 40, { -188, 154, -1439 } }, { 7, 40, { -203, 181, -1242 } }, { 8, 40, { 7, 191, -1057 } },
    { 9, 40, { 262, 273, -1326 } },  { 0, 40, { -4, 272, -1627 } },   { 1, 35, { -331, 206, -1287 } },
    { 2, 30, { -65, 219, -877 } },   { 3, 25, { 6, 216, -569 } },     { 4, 25, { -8, 157, 40 } },
    { 5, 25, { -4, 106, 200 } },     { 6, 25, { -6, 72, 574 } },      { 7, 0, { -6, 72, 574 } },
    { 8, 0, { -6, 72, 574 } },       { -1, 0, { -6, 72, 574 } }
};

struct CutsceneSplinePoint D_8032E188[9] = {
    { 0, 0, { -130, 1111, -1815 } }, { 1, 0, { -131, 1052, -1820 } }, { 2, 0, { -271, 1008, -1651 } },
    { 3, 0, { -439, 1043, -1398 } }, { 4, 0, { -433, 1040, -1120 } }, { 5, 0, { -417, 1040, -1076 } },
    { 6, 0, { -417, 1040, -1076 } }, { 7, 0, { -417, 1040, -1076 } }, { -1, 0, { -417, 1040, -1076 } }
};

struct CutsceneSplinePoint D_8032E1D0[9] = {
    { 0, 50, { -37, 1020, -1332 } }, { 1, 20, { -36, 1012, -1330 } }, { 2, 20, { -24, 1006, -1215 } },
    { 3, 20, { 28, 1002, -1224 } },  { 4, 24, { 45, 1013, -1262 } },  { 5, 35, { 34, 1000, -1287 } },
    { 6, 0, { 34, 1000, -1287 } },   { 7, 0, { 34, 1000, -1287 } },   { -1, 0, { 34, 1000, -1287 } }
};

struct CutsceneSplinePoint D_8032E218[8] = {
    { 0, 50, { 200, 1066, -1414 } }, { 0, 50, { 200, 1066, -1414 } }, { 0, 30, { 198, 1078, -1412 } },
    { 0, 33, { 15, 1231, -1474 } },  { 0, 39, { -94, 1381, -1368 } }, { 0, 0, { -92, 1374, -1379 } },
    { 0, 0, { -92, 1374, -1379 } },  { -1, 0, { -92, 1374, -1379 } }
};

struct CutsceneSplinePoint D_8032E258[7] = {
    { 0, 50, { 484, 1368, -888 } }, { 0, 72, { 479, 1372, -892 } }, { 0, 50, { 351, 1817, -918 } },
    { 0, 50, { 351, 1922, -598 } }, { 0, 0, { 636, 2027, -415 } },  { 0, 0, { 636, 2027, -415 } },
    { -1, 0, { 636, 2027, -415 } }
};

s16 level_specific_camera_update(struct LevelCamera *c) {
    s16 currLevelNum = gCurrLevelNum;
    s16 currPreset;
    s8 area = gCurrentArea->index;
    u32 i;
    Vec3f sp50, sp44;
    u32 sp40 = 0;
    UNUSED struct TableCamera sp28;
    u8 preset = c->currPreset;

    if (c->currPreset == CAMERA_PRESET_C_UP_LOOK) {
        c->currPreset = (u8) D_8033B418.unk2;
    }
    func_8028D32C(&c->currPreset);
    if (currLevelNum > 40) {
        currLevelNum = 40;
    }

    if (TableLevelCinematicCamera[currLevelNum] != 0) {
        i = 0;

        while ((TableLevelCinematicCamera[currLevelNum])[i].unk4 != 0) {
            if ((TableLevelCinematicCamera[currLevelNum])[i].area == area) {
                vec3f_set(sp50, (TableLevelCinematicCamera[currLevelNum])[i].unk8,
                          (TableLevelCinematicCamera[currLevelNum])[i].unkA,
                          (TableLevelCinematicCamera[currLevelNum])[i].unkC);
                vec3f_set(sp44, (TableLevelCinematicCamera[currLevelNum])[i].unkE,
                          (TableLevelCinematicCamera[currLevelNum])[i].unk10,
                          (TableLevelCinematicCamera[currLevelNum])[i].unk12);

                if (check_if_vector_fits_in_bounds(sMarioStatusForCamera->pos, sp50, sp44,
                                                   (TableLevelCinematicCamera[currLevelNum])[i].unk14)
                    == 1) {
                    if ((gCameraFlags2 & CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES) == 0) {
                        ((TableLevelCinematicCamera[currLevelNum])[i].unk4)(c);
                        sp40 = 1;
                    }
                }
            }

            if ((TableLevelCinematicCamera[currLevelNum])[i].area == -1) {
                if (sp40 == 0) {
                    if ((gCameraFlags2 & CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES) == 0) {
                        ((TableLevelCinematicCamera[currLevelNum])[i].unk4)(c);
                    }
                }
            }

            i += 1;
        }
    }

    if ((gCameraFlags2 & CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES) == 0) {
        switch (gCurrLevelArea) {
            case AREA_WF:
                if (sMarioStatusForCamera->action == ACT_RIDING_HOOT) {
                    set_camera_preset(c, CAMERA_PRESET_SLIDE_HOOT, 60);

                } else {
                    switch (sGeometryForMario.currFloorType) {
                        case SURFACE_CAMERA_PLATFORM:
                            set_camera_preset(c, CAMERA_PRESET_PLATFORM_LEVEL, 90);
                            sPlatformLevelPresetBaseYaw = 0x4000;
                            break;

                        case SURFACE_BOSS_FIGHT_CAMERA:
                            if (gCurrActNum == 1) {
                                set_camera_preset_boss_fight(c);
                            } else {
                                set_camera_preset_open_camera(c, 60);
                            }
                            break;
                        default:
                            set_camera_preset_open_camera(c, 60);
                    }
                }
                break;

            case AREA_BBH:
                if (vec3f_compare(sFixedPresetBasePosition, 210.f, 420.f, 3109.f)
                    == 1) // if camera is fixed at bbh_room_13_balcony_camera (but as floats)
                {
                    if (sMarioStatusForCamera->pos[1] < 1800.f) {
                        set_camera_preset(c, CAMERA_PRESET_CLOSE, 30);
                    }
                }
                break;

            case AREA_SSL_PYRAMID:
                set_preset_via_surface_or_input(c, 2);
                break;

            case AREA_SSL_OUTSIDE:
                set_preset_via_surface_or_input(c, 1);
                break;

            case AREA_THI_HUGE:
                break;

            case AREA_THI_TINY:
                surface_type_presets_thi(c);
                break;

            case AREA_TTC:
                set_preset_via_surface_or_input(c, 2);
                break;

            case AREA_BOB:
                if (set_preset_via_surface_or_input(c, 0) == 0) {
                    if (sGeometryForMario.currFloorType == SURFACE_BOSS_FIGHT_CAMERA) {
                        set_camera_preset_boss_fight(c);
                    } else {
                        if (c->currPreset == CAMERA_PRESET_CLOSE) {
                            set_camera_preset(c, CAMERA_PRESET_OPEN_CAMERA, 60);
                        } else {
                            set_camera_preset_open_camera(c, 60);
                        }
                    }
                }
                break;

            case AREA_WDW_MAIN:
                if (sGeometryForMario.currFloorType == SURFACE_INSTANT_WARP_1B) {
                    if (0) {
                    }
                    c->defPreset = CAMERA_PRESET_OPEN_CAMERA;
                    if (0) {
                    }
                }
                break;

            case AREA_WDW_TOWN:
                if (sGeometryForMario.currFloorType == SURFACE_INSTANT_WARP_1C) {
                    if (0) {
                    }
                    c->defPreset = CAMERA_PRESET_CLOSE;
                    if (0) {
                    }
                }
                break;

            case AREA_DDD_WHIRLPOOL:
                gCameraStatus.modeDefault = CAMERA_PRESET_REVERSE_TOWER;
                break;

            case AREA_DDD_SUB:
                if ((c->currPreset != CAMERA_PRESET_BEHIND_MARIO)
                    && (c->currPreset != CAMERA_PRESET_WATER_SURFACE)) {
                    if (((sMarioStatusForCamera->action & ACT_FLAG_ON_POLE) != 0)
                        || (sGeometryForMario.currFloorHeight > 800.f)) {
                        set_camera_preset(c, CAMERA_PRESET_PLATFORM_LEVEL, 60);

                    } else {
                        if (sMarioStatusForCamera->pos[1] < 800.f) {
                            set_camera_preset(c, CAMERA_PRESET_FREE_ROAM, 60);
                        }
                    }
                }
                gCameraStatus.modeDefault = CAMERA_PRESET_FREE_ROAM;
                break;
        }
    }

    gCameraFlags2 &= ~CAM_FLAG_2_BLOCK_LEVEL_SPECIFIC_UPDATES;
    if (preset == CAMERA_PRESET_C_UP_LOOK) {
        D_8033B418.unk2 = c->currPreset;
        c->currPreset = preset;
    }
    currPreset = c->currPreset;
    return currPreset;
}

void resolve_geometry_collisions(Vec3f pos, UNUSED Vec3f b) {
    f32 ceilY, floorY;
    struct Surface *surf;

    f32_find_wall_collision(&pos[0], &pos[1], &pos[2], 0.f, 100.f);
    floorY = find_floor(pos[0], pos[1] + 50.f, pos[2], &surf);
    ceilY = find_ceil(pos[0], pos[1] - 50.f, pos[2], &surf);

    if ((-11000.f != floorY) && (20000.f == ceilY)) {
        if (pos[1] < (floorY += 125.f)) {
            pos[1] = floorY;
        }
    }

    if ((-11000.f == floorY) && (20000.f != ceilY)) {
        if (pos[1] > (ceilY -= 125.f)) {
            pos[1] = ceilY;
        }
    }

    if ((-11000.f != floorY) && (20000.f != ceilY)) {
        floorY += 125.f;
        ceilY -= 125.f;

        if ((pos[1] <= floorY) && (pos[1] < ceilY)) {
            pos[1] = floorY;
        }
        if ((pos[1] > floorY) && (pos[1] >= ceilY)) {
            pos[1] = ceilY;
        }
        if ((pos[1] <= floorY) && (pos[1] >= ceilY)) {
            pos[1] = (floorY + ceilY) * 0.5f;
        }
    }
}

s32 func_8028F2F0(struct LevelCamera *a, Vec3f pos, s16 *c, s16 d) {
    UNUSED f32 sp84;
    struct WallCollisionData wallData;
    struct Surface *wall;
    UNUSED Vec3f sp4C;
    f32 distToMario, sp44;
    UNUSED f32 sp40;
    f32 wallThickness, sp38;
    s16 sp36, horWallNorm;
    UNUSED s16 sp32;
    s16 pitchToMario, yawToMario;
    UNUSED s16 sp2C;
    s32 sp28 = 0;
    s32 i = 0;
    UNUSED s32 sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, pos, &distToMario, &pitchToMario, &yawToMario);
    gCameraFlags2 &= ~CAM_FLAG_2_COLLIDING_WITH_WALL;
    wallData.offsetY = 100.0f;
    sp44 = 0.0f;
    wallThickness = 150.0f;
    sp38 = 100.0f;

    for (i = 0; i < 8; i++) {
        wallData.x = sMarioStatusForCamera->pos[0] + ((pos[0] - sMarioStatusForCamera->pos[0]) * sp44);
        wallData.y = sMarioStatusForCamera->pos[1] + ((pos[1] - sMarioStatusForCamera->pos[1]) * sp44);
        wallData.z = sMarioStatusForCamera->pos[2] + ((pos[2] - sMarioStatusForCamera->pos[2]) * sp44);
        wallData.radius = wallThickness;
        camera_approach_f32_symmetric_bool(&wallThickness, 250.f, 30.f);

        if (find_wall_collisions(&wallData) != 0) {
            wall = wallData.walls[wallData.numWalls - 1];
            if (i >= 5) {
                gCameraFlags2 |= CAM_FLAG_2_COLLIDING_WITH_WALL;
                if (sp28 <= 0) {
                    sp28 = 1;
                    wall = wallData.walls[wallData.numWalls - 1];
                    sp36 = atan2s(wall->normal.z, wall->normal.x) + 0x4000;
                    *c = func_80289A98(yawToMario, sp36) + 0x8000;
                }
            }

            wallData.x =
                sMarioStatusForCamera->pos[0] + ((pos[0] - sMarioStatusForCamera->pos[0]) * sp44);
            wallData.y =
                sMarioStatusForCamera->pos[1] + ((pos[1] - sMarioStatusForCamera->pos[1]) * sp44);
            wallData.z =
                sMarioStatusForCamera->pos[2] + ((pos[2] - sMarioStatusForCamera->pos[2]) * sp44);
            wallData.radius = sp38;
            camera_approach_f32_symmetric_bool(&sp38, 200.f, 20.f);

            if (find_wall_collisions(&wallData) != 0) {
                wall = wallData.walls[wallData.numWalls - 1];
                horWallNorm = atan2s(wall->normal.z, wall->normal.x);
                sp36 = horWallNorm + 0x4000;
                if ((func_8028A0D4(sMarioStatusForCamera->pos, pos, wall, d, SURFACE_WALL_MISC) == 0)
                    && (is_mario_behind_surface(a, wall) == 1)
                    && (is_pos_less_than_bounds(wall, -1.f, 150.f, -1.f) == 0)) {
                    *c = func_80289A98(yawToMario, sp36) + 0x8000;
                    camera_approach_s16_symmetric_bool(c, horWallNorm, d);
                    sp28 = 3;
                    i = 8;
                }
            }
        }
        sp44 += 0.125f;
    }
    return sp28;
}

void find_mario_relative_geometry(struct PlayerGeometry *a) {
    struct Surface *surf;
    s16 tempCheckingSurfaceCollisionsForCamera = gCheckingSurfaceCollisionsForCamera;
    gCheckingSurfaceCollisionsForCamera = 1;

    if (find_floor(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 10.f,
                   sMarioStatusForCamera->pos[2], &surf)
        != -11000.f) {
        a->currFloorType = surf->type;
    } else {
        a->currFloorType = 0;
    }

    if (find_ceil(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] - 10.f,
                  sMarioStatusForCamera->pos[2], &surf)
        != 20000.f) {
        a->currCeilType = surf->type;
    } else {
        a->currCeilType = 0;
    }

    gCheckingSurfaceCollisionsForCamera = 0;
    a->currFloorHeight = find_floor(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 10.f,
                                    sMarioStatusForCamera->pos[2], &a->currFloor);
    a->currCeilHeight = find_ceil(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] - 10.f,
                                  sMarioStatusForCamera->pos[2], &a->currCeil);
    a->waterHeight = find_water_level(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[2]);
    gCheckingSurfaceCollisionsForCamera = tempCheckingSurfaceCollisionsForCamera;
}

void func_8028F800(u8 cutsceneTable, struct Object *o) {
    sTempCutsceneNumber = cutsceneTable;
    gCutsceneNumber = 0;
    gCutsceneFocus = o;
    gCutsceneActive = FALSE;
}

u8 func_8028F834(u8 a) {
    sTempCutsceneNumber = a;
    D_8032CFFC = 0;
    return 0;
}

s32 unused_8028F860(u8 a) {
    if ((gCurrLevelCamera->cutscene == 0) && (sTempCutsceneNumber == 0)) {
        sTempCutsceneNumber = a;
    }

    if ((gCurrLevelCamera->cutscene == a) && (D_8032CFFC != 0)) {
        return (s16) D_8032CFFC;
    } else {
        return 0;
    }
}

s16 cutscene_object_with_dialog(u8 cutsceneTable, struct Object *o, s16 dialogID) {
    s16 sp1E = 0;

    if ((gCurrLevelCamera->cutscene == 0) && (sTempCutsceneNumber == 0)) {
        if (gCutsceneNumber != cutsceneTable) {
            func_8028F800(cutsceneTable, o);
            if (dialogID != -1) {
                D_8033B320 = dialogID;
            } else {
                D_8033B320 = DIALOG_001;
            }
        } else {
            sp1E = D_8032CFFC;
        }

        gCutsceneNumber = 0;
    }
    return sp1E;
}

s16 cutscene_object_without_dialog(u8 cutsceneTable, struct Object *o) {
    s16 sp1E = cutscene_object_with_dialog(cutsceneTable, o, -1);
    return sp1E;
}

s16 cutscene_object(u8 cutsceneTable, struct Object *o) {
    s16 sp1E = 0;

    if ((gCurrLevelCamera->cutscene == 0) && (sTempCutsceneNumber == 0)) {
        if (gCutsceneNumber != cutsceneTable) {
            func_8028F800(cutsceneTable, o);
            sp1E = 1;
        } else {
            sp1E = -1;
        }
    }
    return sp1E;
}

void set_cam_yaw_from_focus_and_pos(struct LevelCamera *c) {
    c->storedYaw = calculate_yaw(c->focus, c->pos);
    c->trueYaw = c->storedYaw;
}

void func_8028FABC(void) {
    sCutsceneSplineSegment = 0;
    sCutsceneSplineSegmentProgress = 0;
}

void func_8028FAE0(struct LevelCamera *c) {
    gCutsceneTimer = 0x8000;
    c->cutscene = 0;
    vec3f_copy(c->focus, D_8033B4B8.focus);
    vec3f_copy(c->pos, D_8033B4B8.pos);
}

void cap_switch_save(s16 dummy) {
    UNUSED s16 sp1E = dummy;
    save_file_do_save(gCurrSaveFileNum - 1);
}

void func_8028FB80(struct CutsceneSplinePoint *a, s8 b, u8 c, Vec3s d) {
    a->index = b;
    a->speed = c;
    vec3s_copy(a->point, d);
}

void func_8028FBD8(struct CutsceneSplinePoint a[], struct CutsceneSplinePoint b[]) {
    s32 j = 0;
    s32 i = 0;
    UNUSED s32 pad[2];

    func_8028FB80(&a[i], b[j].index, b[j].speed, b[j].point);
    i += 1;

    do {
        do {
            func_8028FB80(&a[i], b[j].index, b[j].speed, b[j].point);
            i += 1;
            j += 1;
        } while ((b[j].index != -1) && (b[j].index != -1)); //! same comparison performed twice
    } while (j > 16);

    func_8028FB80(&a[i], 0, b[j].speed, b[j].point);
    func_8028FB80(&a[i + 1], 0, 0, b[j].point);
    func_8028FB80(&a[i + 2], 0, 0, b[j].point);
    func_8028FB80(&a[i + 3], -1, 0, b[j].point);
}

s16 func_8028FD94(s32 a) {
    s16 timer = gCutsceneTimer;
    if (set_mario_npc_dialog(a) == 2) {
        timer = 0x7FFF;
    }
    return timer;
}

static void unused_8028FDE8(UNUSED struct LevelCamera *a) {
    gCutsceneTimer = func_8028FD94(3);
}

static CmdRet Cutscene26Todo0(UNUSED struct LevelCamera *a) {
    gCutsceneTimer = func_8028FD94(1);
}

static void unused_8028FE50(UNUSED struct LevelCamera *a) {
    gCutsceneTimer = func_8028FD94(2);
}

// Lower the volume and start the peach letter background music
CmdRet CutsceneIntroPeach0_2(UNUSED struct LevelCamera *a) {
#ifdef VERSION_US
    func_8031FFB4(0, 60, 40);
#endif
    func_8028B13C();
}

CmdRet CutsceneIntroPeach2_1(UNUSED struct LevelCamera *a) {
#ifndef VERSION_JP
    sequence_player_unlower(0, 60);
#endif
    func_8028B16C();
}

#ifdef VERSION_EU
CmdRet CutsceneIntroPeach_unkEU(UNUSED struct LevelCamera *a) {
    func_8031FFB4(0, 60, 40);
}
#endif

void func_8028FEDC(UNUSED struct LevelCamera *a) {
    D_8033B40C = 0;
}

void move_credits_camera(struct LevelCamera *c, s16 minPitch, s16 maxPitch, s16 minYaw, s16 maxYaw) {
    f32 distCamToFocus;
    s16 pitch, yaw, pitchCap;

    approach_s16_exponential_bool(&sCreditsCameraYaw, -(s16)(gPlayer2Controller->stickX * 250.f), 4);
    approach_s16_exponential_bool(&sCreditsCameraPitch, -(s16)(gPlayer2Controller->stickY * 265.f), 4);
    vec3f_get_dist_and_angle(c->pos, c->focus, &distCamToFocus, &pitch, &yaw);

    pitchCap = 0x3800 - pitch;
    if (pitchCap < 0) {
        pitchCap = 0;
    }
    if (maxPitch > pitchCap) {
        maxPitch = pitchCap;
    }

    pitchCap = -0x3800 - pitch;
    if (pitchCap > 0) {
        pitchCap = 0;
    }
    if (minPitch < pitchCap) {
        minPitch = pitchCap;
    }

    if (sCreditsCameraPitch > maxPitch) {
        sCreditsCameraPitch = maxPitch;
    }
    if (sCreditsCameraPitch < minPitch) {
        sCreditsCameraPitch = minPitch;
    }

    if (sCreditsCameraYaw > maxYaw) {
        sCreditsCameraYaw = maxYaw;
    }
    if (sCreditsCameraYaw < minYaw) {
        sCreditsCameraYaw = minYaw;
    }

    pitch += sCreditsCameraPitch;
    yaw += sCreditsCameraYaw;
    vec3f_set_dist_and_angle(c->pos, D_8033B218, distCamToFocus, pitch, yaw);
    vec3f_sub(D_8033B218, c->focus);
}

void func_80290144(struct LevelCamera *c) {
    vec3f_copy(D_8033B4B8.pos, c->pos);
    vec3f_copy(D_8033B4B8.focus, c->focus);
    D_8033B4B8.unk18 = D_8033B40C;
    D_8033B4B8.unk1C = D_8033B410;
}

void func_802901B4(struct LevelCamera *c) {
    vec3f_copy(c->pos, D_8033B4B8.pos);
    vec3f_copy(c->focus, D_8033B4B8.focus);
    D_8033B40C = D_8033B4B8.unk18;
    D_8033B410 = D_8033B4B8.unk1C;
}

void func_80290224(struct LevelCamera *c) {
    func_8028FEDC(c);
    vec3f_copy(D_8033B4B8.pos, c->pos);
    D_8033B4B8.focus[0] = sMarioStatusForCamera->pos[0];
    D_8033B4B8.focus[1] = c->focus[1];
    D_8033B4B8.focus[2] = sMarioStatusForCamera->pos[2];
}

void func_802902A8(struct LevelCamera *c) {
    vec3f_copy(c->pos, D_8033B4B8.pos);
    vec3f_copy(c->focus, D_8033B4B8.focus);
}

static void unused_vec3s_to_vec3f(Vec3f dst, Vec3s src) {
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
}

static void unused_vec3f_to_vec3s(Vec3s dst, Vec3f src) {
    // note: unlike vec3f_to_vec3s(), this function doesn't round the numbers and instead simply
    // truncates them
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
}

void rotate_camera(struct LevelCamera *c, s16 incPitch, s16 incYaw) {
    UNUSED Vec3f sp2C;
    f32 distCamToFocus;
    s16 pitch, yaw;
    UNUSED f32 sp20;

    vec3f_get_dist_and_angle(c->pos, c->focus, &distCamToFocus, &pitch, &yaw);
    pitch += incPitch;
    yaw += incYaw;
    vec3f_set_dist_and_angle(c->pos, c->focus, distCamToFocus, pitch, yaw);
}

CmdRet CutsceneEnterSomething8029041C(UNUSED struct LevelCamera *c) {
    set_camera_shake_2(SHAKE_2_UNKNOWN_1);
    func_8029A494(1);
}

static void unused_80290450(UNUSED struct LevelCamera *c) {
    set_camera_shake_2(SHAKE_2_UNKNOWN_2);
}

void rotate_and_move_vec3f(Vec3f dst, Vec3f src, f32 incDist, s16 incPitch, s16 incYaw) {
    f32 dist;
    s16 pitch, yaw;

    vec3f_get_dist_and_angle(src, dst, &dist, &pitch, &yaw);
    pitch += incPitch;
    yaw += incYaw;
    dist += incDist;
    vec3f_set_dist_and_angle(src, dst, dist, pitch, yaw);
}

void func_80290514(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_BEHIND_MARIO_POST_DOOR;
    sCameraYawAfterDoorCutscene = calculate_yaw(c->focus, c->pos);
}

void func_80290564(UNUSED struct LevelCamera *c) {
    func_8031FFB4(0, 60, 40);
}

void func_80290598(UNUSED struct LevelCamera *c) {
    sequence_player_unlower(0, 60);
}

void unused_802905C8(UNUSED struct LevelCamera *c) {
}

CmdRet Cutscene0FTodo0(UNUSED struct LevelCamera *c) {
}

CmdRet Cutscene0FTodo1(UNUSED struct LevelCamera *c) {
}

CmdRet CutscenePeachEnd0_1(struct LevelCamera *c) {
    vec3f_set(c->focus, -26.f, 0.f, -137.f);
    vec3f_set(c->pos, 165.f, 4725.f, 324.f);
}

CmdRet CutscenePeachEnd0_2(struct LevelCamera *c) {
    Vec3f sp24;
    vec3f_set(sp24, 0.f, 80.f, 0.f);

    sp24[2] = ABS(sMarioStatusForCamera->pos[1] - c->pos[1]) * -0.1f;
    if (sp24[2] > -100.f) {
        sp24[2] = -100.f;
    }

    set_pos_from_face_angle_and_vec3f(c->focus, sMarioStatusForCamera->pos, sp24,
                                      sMarioStatusForCamera->faceAngle);
}

CmdRet CutscenePeachEnd0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEnd0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEnd0_2, c, 0, -1);
    move_credits_camera(c, -0x2000, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd2(struct LevelCamera *c) {
    vec3f_set(c->focus, 85.f, 826.f, 250.f);
    vec3f_set(c->pos, -51.f, 988.f, -202.f);
    move_credits_camera(c, -0x2000, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEndCommon367A(UNUSED struct LevelCamera *c) {
    D_8033B6F0[9].unk4[0] = 0.f;
    func_8028FABC();
}

CmdRet CutscenePeachEnd3_1(struct LevelCamera *c) {
    move_point_along_spline(c->pos, D_8032E040, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_point_along_spline(c->focus, D_8032E090, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
}

CmdRet CutscenePeachEnd3(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEndCommon367A, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEnd3_1, c, 0, -1);
    move_credits_camera(c, -0x2000, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd1(struct LevelCamera *c) {
    vec3f_set(c->focus, D_8032E090[0].point[0], D_8032E090[0].point[1] + 80.f, D_8032E090[0].point[2]);
    vec3f_set(c->pos, D_8032E040[0].point[0], D_8032E040[0].point[1], D_8032E040[0].point[2] + 150.f);
    move_credits_camera(c, -0x800, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd4_1(struct LevelCamera *c) {
    vec3f_set(c->pos, 179.f, 2463.f, -1216.f);
    c->pos[1] = gCutsceneFocus->oPosY + 35.f;
    vec3f_set(c->focus, gCutsceneFocus->oPosX, gCutsceneFocus->oPosY + 125.f, gCutsceneFocus->oPosZ);
}

CmdRet CutscenePeachEnd4(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEnd4_1, c, 0, 0);
    approach_f32_exponential_bool(&c->pos[1], gCutsceneFocus->oPosY + 35.f, 0.02f);
    approach_f32_exponential_bool(&c->focus[1], gCutsceneFocus->oPosY + 125.f, 0.15f);
    move_credits_camera(c, -0x2000, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd5_1(UNUSED struct LevelCamera *c) {
    func_8028FABC();
    D_8033B6F0[2].unk4[1] = 150.f;
}

CmdRet CutscenePeachEnd5_2(struct LevelCamera *c) {
    move_point_along_spline(c->pos, D_8032E0E8, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    c->pos[1] += gCutsceneFocus->oPosY + D_8033B6F0[3].unk4[1];
}

CmdRet CutscenePeachEnd5_3(UNUSED struct LevelCamera *c) {
    camera_approach_f32_symmetric_bool(&(D_8033B6F0[2].unk4[1]), 90.f, 0.5f);
}

CmdRet CutscenePeachEnd5_4(struct LevelCamera *c) {
    Vec3f sp1C;

    move_point_along_spline(sp1C, D_8032E0E8, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    c->pos[0] = sp1C[0];
    c->pos[2] = sp1C[2];
    approach_f32_exponential_bool(&c->pos[1], (sp1C[1] += gCutsceneFocus->oPosY), 0.07f);
}

CmdRet CutscenePeachEnd5(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEnd5_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEnd5_2, c, 0, 299);
    call_cutscene_func_in_time_range(CutscenePeachEnd5_4, c, 300, -1);
    call_cutscene_func_in_time_range(CutscenePeachEnd5_3, c, 300, -1);
    vec3f_set(c->focus, gCutsceneFocus->oPosX, D_8033B6F0[2].unk4[1] + gCutsceneFocus->oPosY,
              gCutsceneFocus->oPosZ);
    move_credits_camera(c, -0x2000, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd6(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEndCommon367A, c, 0, 0);
    move_point_along_spline(c->pos, D_8032E188, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_point_along_spline(c->focus, D_8032E1D0, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_credits_camera(c, -0x2000, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd7_1(UNUSED struct LevelCamera *c) {
    move_point_along_spline(c->focus, D_8032E218, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
}

CmdRet CutscenePeachEnd7(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEndCommon367A, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEnd7_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEnd7_1, c, 250, -1);
    set_cutscene_phase_at_frame(7, 300);
    set_cutscene_phase_at_frame(9, 340);
    vec3f_set(c->pos, -163.f, 978.f, -1082.f);
    move_credits_camera(c, -0x800, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd8(struct LevelCamera *c) {
    vec3f_set(c->focus, 11.f, 983.f, -1273.f);
    vec3f_set(c->pos, -473.f, 970.f, -1152.f);
    move_credits_camera(c, -0x800, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEnd9_1(struct LevelCamera *c) {
    set_fov_function(13);
    vec3f_set(c->focus, 350.f, 1034.f, -1216.f);
    vec3f_set(c->pos, -149.f, 1021.f, -1216.f);
}

CmdRet CutscenePeachEnd9_2(struct LevelCamera *c) {
    Vec3f sp2C, sp20;

    set_fov_function(2);
    vec3f_set(sp20, 233.f, 1068.f, -1298.f);
    vec3f_set(sp2C, -250.f, 966.f, -1111.f);
    //! another double typo
    approach_vec3f_exponential(c->pos, sp2C, 0.2, 0.1f, 0.2f);
    approach_vec3f_exponential(c->focus, sp20, 0.2, 0.1f, 0.2f);
}

CmdRet CutscenePeachEnd9(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEnd9_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEnd9_2, c, 155, -1);
    move_credits_camera(c, -0x800, 0x2000, -0x2000, 0x2000);
}

CmdRet CutscenePeachEndA_1(struct LevelCamera *c) {
    move_point_along_spline(c->focus, D_8032E258, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    vec3f_set(c->pos, 699.f, 1680.f, -703.f);
}

CmdRet CutscenePeachEndA_2(UNUSED struct LevelCamera *c) {
    D_8033B230.fieldOfView = 37.f;
}

CmdRet CutscenePeachEndA(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutscenePeachEndCommon367A, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEndA_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePeachEndA_2, c, 0, 499);
    call_cutscene_func_in_time_range(CutscenePeachEndA_1, c, 500, -1);
    set_cutscene_phase_at_frame(8, 600);
    set_cutscene_phase_at_frame(8, 608);
    set_cutscene_phase_at_frame(8, 624);
    set_cutscene_phase_at_frame(8, 710);
}

CmdRet CutscenePeachEndB(struct LevelCamera *c) {
    set_fov_function(1);
    c->cutscene = 0;
    gCutsceneTimer = -0x8000;
}

CmdRet CutsceneGrandStar0_1(UNUSED struct LevelCamera *c) {
    vec3f_set(D_8033B6F0[0].unk4, 0.f, 150.f, -600.f);
    set_pos_from_face_angle_and_vec3f(D_8033B6F0[1].unk4, sMarioStatusForCamera->pos,
                                      D_8033B6F0[0].unk4, sMarioStatusForCamera->faceAngle);
    D_8033B6F0[1].unk4[1] = 457.f;
}

CmdRet CutsceneGrandStar0_2(struct LevelCamera *c) {
    f32 sp2C;
    s16 sp2A, sp28;
    f32 sp24;
    s16 sp22, sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, D_8033B6F0[1].unk4, &sp2C, &sp2A, &sp28);
    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp24, &sp22, &sp20);
    approach_f32_exponential_bool(&sp24, sp2C, 0.1f);
    approach_s16_exponential_bool(&sp22, sp2A, 32);
    approach_s16_exponential_bool(&sp20, sp28 + 0x1200, 20);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp24, sp22, sp20);
}

CmdRet CutsceneGrandStar0_4(UNUSED struct LevelCamera *c) {
    vec3s_set(D_8033B6F0[0].unk1C, 0, sMarioStatusForCamera->faceAngle[1], 0);
    vec3f_set(D_8033B6F0[2].unk4, 0.f, 0.f, 0.f);
}

CmdRet CutsceneGrandStar0_5(UNUSED struct LevelCamera *c) {
    camera_approach_f32_symmetric_bool(&D_8033B6F0[2].unk4[2], -40.f, 2.0f);
    D_8033B6F0[2].unk4[0] = 5.0f;
}

CmdRet CutsceneGrandStar0_6(struct LevelCamera *c) {
    camera_approach_f32_symmetric_bool(&D_8033B6F0[2].unk4[2], 0.f, 2.f);
    D_8033B6F0[2].unk4[0] = 0.f;
    approach_f32_exponential_bool(&c->pos[0], sMarioStatusForCamera->pos[0], 0.01f);
    approach_f32_exponential_bool(&c->pos[2], sMarioStatusForCamera->pos[2], 0.01f);
}

CmdRet CutsceneGrandStar0_7(struct LevelCamera *c) {
    set_pos_from_face_angle_and_vec3f(c->pos, c->pos, D_8033B6F0[2].unk4, D_8033B6F0[0].unk1C);
}

CmdRet CutsceneGrandStar0_3(struct LevelCamera *c) {
    Vec3f sp24;

    vec3f_set(sp24, sMarioStatusForCamera->pos[0],
              (sMarioStatusForCamera->pos[1] - 307.f) * 0.5f + 407.f, sMarioStatusForCamera->pos[2]);
    approach_vec3f_exponential(c->focus, sp24, 0.5f, 0.8f, 0.5f);
}

CmdRet CutsceneGrandStar0(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    call_cutscene_func_in_time_range(CutsceneGrandStar0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneGrandStar0_2, c, 0, 109);
    call_cutscene_func_in_time_range(CutsceneGrandStar0_3, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneGrandStar0_4, c, 110, 110);
    call_cutscene_func_in_time_range(CutsceneGrandStar0_5, c, 110, 159);
    call_cutscene_func_in_time_range(CutsceneGrandStar0_6, c, 160, -1);
    call_cutscene_func_in_time_range(CutsceneGrandStar0_7, c, 110, -1);
}

CmdRet CutsceneGrandStar1_1(struct LevelCamera *c) {
    vec3f_set(D_8033B6F0[7].unk4, 0.5f, 0.5f, 0.5f);
    vec3f_set(D_8033B6F0[6].unk4, 0.01f, 0.01f, 0.01f);
    vec3f_set(D_8033B6F0[4].unk4, 0.f, 0.f, 0.f);
    vec3f_set(D_8033B6F0[5].unk4, 0.f, c->focus[1] - sMarioStatusForCamera->pos[1], 0.f);
    D_8033B6F0[8].unk4[2] = 0.f;
    D_8033B6F0[8].unk4[0] = 0.f;
}

CmdRet CutsceneGrandStar1_2(UNUSED struct LevelCamera *c) {
    Vec3f sp24;

    vec3f_set(sp24, -600.f, 0.f, -400.f);
    approach_vec3f_exponential(D_8033B6F0[4].unk4, sp24, 0.05f, 0.05f, 0.05f);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[5].unk4[1], 0.f, 2.f);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[5].unk4[2], -200.f, 6.f);
}

CmdRet CutsceneGrandStar1_3(UNUSED struct LevelCamera *c) {
    camera_approach_f32_symmetric_bool(&D_8033B6F0[8].unk4[0], 15.f, 0.1f);

    camera_approach_f32_symmetric_bool(&D_8033B6F0[4].unk4[0], -2000.f, D_8033B6F0[8].unk4[0]);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[4].unk4[1], 1200.f, D_8033B6F0[8].unk4[0] / 10.f);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[4].unk4[2], 1000.f, D_8033B6F0[8].unk4[0] / 10.f);

    camera_approach_f32_symmetric_bool(&D_8033B6F0[5].unk4[0], 0.f, D_8033B6F0[8].unk4[0]);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[5].unk4[1], 1200.f, D_8033B6F0[8].unk4[0] / 2.f);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[5].unk4[2], 1000.f, D_8033B6F0[8].unk4[0] / 1.5f);
}

CmdRet CutsceneGrandStar1_4(struct LevelCamera *c) {
    Vec3f sp34, sp28;
    f32 sp24;
    s16 sp22, sp20;

    camera_approach_f32_symmetric_bool(&D_8033B6F0[8].unk4[2], 90.f, 2.5f);
    set_pos_from_face_angle_and_vec3f(sp34, sMarioStatusForCamera->pos, D_8033B6F0[4].unk4,
                                      sMarioStatusForCamera->faceAngle);
    set_pos_from_face_angle_and_vec3f(sp28, sMarioStatusForCamera->pos, D_8033B6F0[5].unk4,
                                      sMarioStatusForCamera->faceAngle);

    vec3f_get_dist_and_angle(sp34, c->pos, &sp24, &sp22, &sp20);
    camera_approach_f32_symmetric_bool(&sp24, 0, D_8033B6F0[8].unk4[2]);
    vec3f_set_dist_and_angle(sp34, c->pos, sp24, sp22, sp20);

    approach_vec3f_exponential(c->pos, sp34, 0.01f, 0.01f, 0.01f);
    approach_vec3f_exponential(c->focus, sp28, 0.5f, 0.8f, 0.5f);
}

CmdRet CutsceneGrandStar1(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    call_cutscene_func_in_time_range(CutsceneGrandStar1_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneGrandStar1_2, c, 0, 140);
    call_cutscene_func_in_time_range(CutsceneGrandStar1_3, c, 141, -1);
    call_cutscene_func_in_time_range(CutsceneGrandStar1_4, c, 0, -1);
}

void func_80291BBC(struct LevelCamera *a, f32 b, f32 c) {
    Vec3f sp2C, sp20;

    sp20[0] = 0.f;
    sp20[2] = b;
    sp20[1] = 100.f;

    set_pos_from_face_angle_and_vec3f(sp2C, sMarioStatusForCamera->pos, sp20,
                                      sMarioStatusForCamera->faceAngle);
    approach_vec3f_exponential(a->focus, sp2C, c, c, c);
}

CmdRet CutsceneDanceCommon(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp20, &sp26, &sp24);
    approach_f32_exponential_bool(&sp20, 600.f, 0.3f);
    approach_s16_exponential_bool(&sp26, 0x1000, 0x10);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp20, sp26, sp24);
}

CmdRet CutsceneStarDance1_4(struct LevelCamera *c) {
    rotate_and_move_vec3f(c->pos, sMarioStatusForCamera->pos, 0, 0, 0x200);
}

CmdRet CutsceneStarDance1_5(struct LevelCamera *c) {
    rotate_and_move_vec3f(c->pos, sMarioStatusForCamera->pos, -15.f, 0, 0);
}

CmdRet CutsceneStarDance1_6(struct LevelCamera *c) {
    rotate_and_move_vec3f(c->pos, sMarioStatusForCamera->pos, 20.f, 0, 0);
}

void dummy_80291DC0(UNUSED struct LevelCamera *c) {
}

CmdRet CutsceneStarDance1_1(struct LevelCamera *c) {
    func_80291BBC(c, -100.f, 0.2f);
}

CmdRet CutsceneStarDance1_3(struct LevelCamera *c) {
    func_80291BBC(c, -200.f, 0.03f);
}

CmdRet CutsceneStarDance1_2(UNUSED struct LevelCamera *c) {
    func_80299C98(0x200, 40, -0x8000);
}

CmdRet CutsceneStarDance1(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    D_8032CFD4 = 0;
    set_fov_function(2);
    call_cutscene_func_in_time_range(CutsceneStarDance1_1, c, 0, 20);
    call_cutscene_func_in_time_range(CutsceneDanceCommon, c, 0, 39);
    call_cutscene_func_in_time_range(CutsceneStarDance1_2, c, 40, 40);
    if (c->cutscene != CUTSCENE_STAR_DANCE_1_2) {
        call_cutscene_func_in_time_range(CutsceneStarDance1_3, c, 75, 102);
        call_cutscene_func_in_time_range(CutsceneStarDance1_4, c, 50, -1);
        call_cutscene_func_in_time_range(CutsceneStarDance1_5, c, 50, 80);
        call_cutscene_func_in_time_range(CutsceneStarDance1_6, c, 70, 90);
    } else {
        if ((sMarioStatusForCamera->action != ACT_STAR_DANCE_NO_EXIT)
            && (sMarioStatusForCamera->action != ACT_STAR_DANCE_WATER)
            && (sMarioStatusForCamera->action != ACT_STAR_DANCE_EXIT)) {
            gCutsceneTimer = 0x8000;
            c->cutscene = 0;
            init_transitional_movement(c, 20);
            gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
        }
    }
}

CmdRet func_80291FE8(struct LevelCamera *a, s16 b, s16 c) {
    s16 pitch, yaw;
    f32 distCamToMario;
    s16 sp26;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, a->pos, &distCamToMario, &pitch, &yaw);
    sp26 = yaw - b;

    if ((sp26 & 0x8000) != 0) {
        sp26 = -sp26;
    }
    if (sp26 > c) {
        yaw = b;
        a->storedYaw = yaw;
        a->trueYaw = yaw;
    }
}

CmdRet CutsceneStarDance3_1(struct LevelCamera *c) {
    UNUSED s32 pad[2];

    if ((gLastCompletedStarNum == 4) && (gCurrCourseNum == COURSE_JRB)) {
        func_80291FE8(c, 0, 0x4000);
    }
    if ((gLastCompletedStarNum == 1) && (gCurrCourseNum == COURSE_DDD)) {
        func_80291FE8(c, -0x8000, 0x5000);
    }
    if ((gLastCompletedStarNum == 5) && (gCurrCourseNum == COURSE_WDW)) {
        func_80291FE8(c, -0x8000, 0x800);
    }

    vec3f_copy(D_8033B6F0[9].unk4, c->focus);
    D_8033B6F0[8].unk1C[0] = 0x2000;
}

CmdRet CutsceneStarDance3_2(struct LevelCamera *c) {
    Vec3f sp24;

    vec3f_set(sp24, sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 125.f,
              sMarioStatusForCamera->pos[2]);
    approach_vec3f_exponential(D_8033B6F0[9].unk4, sp24, 0.2f, 0.2f, 0.2f);
    vec3f_copy(c->focus, D_8033B6F0[9].unk4);
}

CmdRet CutsceneStarDance3_3(struct LevelCamera *c) {
    s16 sp2E, sp2C;
    f32 sp28;
    s16 sp26 = 0x1800;

    if (((gLastCompletedStarNum == 6) && (gCurrCourseNum == COURSE_SL))
        || ((gLastCompletedStarNum == 4) && (gCurrCourseNum == COURSE_TTC))) {
        sp26 = 0x800;
    }

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp28, &sp2E, &sp2C);
    approach_f32_exponential_bool(&sp28, 800.f, 0.05f);
    approach_s16_exponential_bool(&sp2E, sp26, 16);
    approach_s16_exponential_bool(&sp2C, c->trueYaw, 8);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp28, sp2E, sp2C);
}

CmdRet CutsceneStarDance3_4(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp20, &sp26, &sp24);
    approach_f32_exponential_bool(&sp20, 240.f, 0.4f);
    approach_s16_exponential_bool(&sp24, c->trueYaw, 8);
    approach_s16_exponential_bool(&sp26, 0x1000, 5);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp20, sp26, sp24);
}

CmdRet CutsceneStarDance3_5(UNUSED struct LevelCamera *c) {
    set_fov_function(9);
}

CmdRet CutsceneStarDance3_6(UNUSED struct LevelCamera *c) {
    func_80299C98(0x300, 48, -0x8000);
}

CmdRet CutsceneStarDance3(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;

    if (sMarioStatusForCamera->action == ACT_STAR_DANCE_WATER) {
        call_cutscene_func_in_time_range(CutsceneStarDance3_1, c, 0, 0);
        call_cutscene_func_in_time_range(CutsceneStarDance3_2, c, 0, -1);
        call_cutscene_func_in_time_range(CutsceneStarDance3_3, c, 0, 62);
        call_cutscene_func_in_time_range(CutsceneStarDance3_4, c, 63, -1);
        call_cutscene_func_in_time_range(CutsceneStarDance3_5, c, 63, 63);
        call_cutscene_func_in_time_range(CutsceneStarDance3_6, c, 70, 70);
    } else {
        call_cutscene_func_in_time_range(CutsceneStarDance3_1, c, 0, 0);
        call_cutscene_func_in_time_range(CutsceneStarDance3_2, c, 0, -1);
        call_cutscene_func_in_time_range(CutsceneStarDance3_3, c, 0, 32);
        call_cutscene_func_in_time_range(CutsceneStarDance3_4, c, 33, -1);
        call_cutscene_func_in_time_range(CutsceneStarDance3_5, c, 33, 33);
        call_cutscene_func_in_time_range(CutsceneStarDance3_6, c, 40, 40);
    }
    set_spline_values(1);
}

CmdRet CutsceneStarDance2_1(struct LevelCamera *c) {
    Vec3f sp1C;

    vec3f_copy(D_8033B6F0[9].unk4, c->focus);
    D_8033B6F0[8].unk4[2] = 65.f;

    if (c->currPreset == CAMERA_PRESET_OPEN_CAMERA) {
        vec3f_set(sp1C, c->xFocus, c->unk68, c->zFocus);
        c->trueYaw = calculate_yaw(sp1C, c->pos);
        c->storedYaw = c->trueYaw;
    }

    if ((gLastCompletedStarNum == 6) && (gCurrCourseNum == COURSE_CCM)) {
        func_80291FE8(c, 0x5600, 0x800);
    }
    if ((gLastCompletedStarNum == 2) && (gCurrCourseNum == COURSE_TTM)) {
        func_80291FE8(c, 0, 0x800);
    }
    if ((gLastCompletedStarNum == 1) && (gCurrCourseNum == COURSE_SL)) {
        func_80291FE8(c, 0x2000, 0x800);
    }
    if ((gLastCompletedStarNum == 3) && (gCurrCourseNum == COURSE_RR)) {
        func_80291FE8(c, 0, 0x800);
    }
}

CmdRet CutsceneStarDance2_3(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp20, &sp26, &sp24);
    approach_f32_exponential_bool(&sp20, 600.f, 0.3f);
    approach_s16_exponential_bool(&sp26, 0x1000, 16);
    approach_s16_exponential_bool(&sp24, c->trueYaw, 8);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp20, sp26, sp24);
}

CmdRet CutsceneStarDance2_2(struct LevelCamera *c) {
    Vec3f sp24;

    vec3f_set(sp24, sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 125.f,
              sMarioStatusForCamera->pos[2]);
    approach_vec3f_exponential(D_8033B6F0[9].unk4, sp24, 0.2f, 0.2f, 0.2f);
    vec3f_copy(c->focus, D_8033B6F0[9].unk4);
}

void func_80292884(struct LevelCamera *c) {
    vec3f_copy(c->focus, D_8033B6F0[9].unk4);
    D_8033B6F0[9].unk1C[0] -= 29;
    D_8033B6F0[9].unk1C[1] += 29;
    rotate_camera(c, D_8033B6F0[9].unk1C[0], D_8033B6F0[9].unk1C[1]);
}

CmdRet CutsceneStarDance2_4(struct LevelCamera *c) {
    func_80292884(c);
    rotate_and_move_vec3f(c->pos, sMarioStatusForCamera->pos, D_8033B6F0[8].unk4[2], 0, 0);
}

CmdRet CutsceneStarDance2_5(struct LevelCamera *c) {
    rotate_and_move_vec3f(c->pos, sMarioStatusForCamera->pos, 0, 0, 0x80);
}

CmdRet CutsceneStarDance2_6(UNUSED struct LevelCamera *c) {
    func_80299C98(0x400, 48, -0x8000);
}

CmdRet CutsceneStarDance2(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    call_cutscene_func_in_time_range(CutsceneStarDance2_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneStarDance2_2, c, 0, 30);
    call_cutscene_func_in_time_range(CutsceneStarDance2_3, c, 0, 30);
    call_cutscene_func_in_time_range(CutsceneStarDance2_4, c, 55, 124);
    call_cutscene_func_in_time_range(CutsceneStarDance2_5, c, 55, 124);
    call_cutscene_func_in_time_range(CutsceneStarDance2_6, c, 40, 40);
    set_fov_function(2);
    set_spline_values(5);
}

CmdRet CutsceneKeyDance0_6(struct LevelCamera *c) {
    set_pos_from_face_angle_and_vec3f(c->pos, sMarioStatusForCamera->pos, D_8033B6F0[8].unk4,
                                      sMarioStatusForCamera->faceAngle);
    set_pos_from_face_angle_and_vec3f(c->focus, sMarioStatusForCamera->pos, D_8033B6F0[7].unk4,
                                      sMarioStatusForCamera->faceAngle);
}

CmdRet CutsceneKeyDance0_2(UNUSED struct LevelCamera *c) {
    vec3f_set(D_8033B6F0[8].unk4, 38.f, 171.f, -248.f);
    vec3f_set(D_8033B6F0[7].unk4, -57.f, 51.f, 187.f);
}

CmdRet CutsceneKeyDance0_3(UNUSED struct LevelCamera *c) {
    vec3f_set(D_8033B6F0[8].unk4, -178.f, 62.f, -132.f);
    vec3f_set(D_8033B6F0[7].unk4, 299.f, 91.f, 58.f);
}

CmdRet CutsceneKeyDance0_4(UNUSED struct LevelCamera *c) {
    gCameraStatus.cameraKeyCutsceneRollOffset = 0x2800;
    vec3f_set(D_8033B6F0[8].unk4, 89.f, 373.f, -304.f);
    vec3f_set(D_8033B6F0[7].unk4, 0.f, 127.f, 0.f);
}

CmdRet CutsceneKeyDance0_5(UNUSED struct LevelCamera *c) {
    gCameraStatus.cameraKeyCutsceneRollOffset = 0;
    vec3f_set(D_8033B6F0[8].unk4, 135.f, 158.f, -673.f);
    vec3f_set(D_8033B6F0[7].unk4, -20.f, 135.f, -198.f);
}

CmdRet CutsceneKeyDance0_7(UNUSED struct LevelCamera *c) {
    func_80299C98(0x180, 48, -0x8000);
}

CmdRet CutsceneKeyDance0_8(UNUSED struct LevelCamera *c) {
    set_spline_values(1);
}

CmdRet CutsceneKeyDance0_1(struct LevelCamera *c) {
    func_80291BBC(c, 0, 0.2f);
}

CmdRet CutsceneKeyDance0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneDanceCommon, c, 0, 10);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_1, c, 0, 10);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_2, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_3, c, 20, 20);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_4, c, 35, 35);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_5, c, 52, 52);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_6, c, 11, -1);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_7, c, 54, 54);
    call_cutscene_func_in_time_range(CutsceneKeyDance0_8, c, 52, -1);
}

CmdRet CutsceneEnterBowserPlatform0_4(UNUSED struct LevelCamera *c) {
    func_8029A494(2);
}

CmdRet CutsceneEnterBowserPlatform0_3(UNUSED struct LevelCamera *c) {
    gSecondCameraFocus->oBowserUnk88 = 1;
}

CmdRet CutsceneEnterBowserPlatform0_5(struct LevelCamera *c) {
    vec3f_set_dist_and_angle(D_8033B6F0[2].unk4, c->pos, D_8033B6F0[3].unk4[2], D_8033B6F0[3].unk1C[0],
                             D_8033B6F0[3].unk1C[1]);
    vec3f_set(D_8033B6F0[2].unk4, gSecondCameraFocus->oPosX, gSecondCameraFocus->oPosY,
              gSecondCameraFocus->oPosZ);
}

CmdRet CutsceneEnterBowserPlatform0_8(UNUSED struct LevelCamera *c) {
    f32 sp1C = 150.0f;

    sp1C = sins(D_8033B6F0[4].unk1C[1]) * 120.0f + 120.0f;
    D_8033B6F0[4].unk1C[1] -= 0x200;
    approach_f32_exponential_bool(&D_8033B6F0[0].unk4[1], sp1C, 0.5f);
}

CmdRet CutsceneEnterBowserPlatform0_9(struct LevelCamera *c) {
    set_pos_from_face_angle_and_vec3f(c->focus, D_8033B6F0[2].unk4, D_8033B6F0[0].unk4,
                                      D_8033B6F0[2].unk1C);
}

CmdRet CutsceneEnterBowserPlatform0_7(UNUSED struct LevelCamera *c) {
    approach_s16_exponential_bool(&D_8033B6F0[3].unk1C[0], 1736, 30);
    approach_f32_exponential_bool(&D_8033B6F0[0].unk4[2], -200.f, 0.02f);
    approach_f32_exponential_bool(&D_8033B6F0[3].unk4[2], 550.f, 0.02f);
}

CmdRet CutsceneEnterBowserPlatform0_6(UNUSED struct LevelCamera *c) {
    approach_f32_exponential_bool(&D_8033B6F0[0].unk4[2], 0.f, 0.05f);
}

CmdRet CutsceneEnterBowserPlatform0_1(UNUSED struct LevelCamera *c) {
    func_8028FD94(1);
}

void func_802930C8(UNUSED struct LevelCamera *c) {
    func_8028FD94(0);
}

CmdRet CutsceneEnterBowserPlatform0_2(struct LevelCamera *c) {
    D_8033B6F0[3].unk4[2] = 430.f;
    D_8033B6F0[3].unk1C[1] = gSecondCameraFocus->oMoveAngleYaw - 0x2000;
    D_8033B6F0[3].unk1C[0] = 3472;

    vec3f_set(D_8033B6F0[0].unk4, 0.f, 120.f, -800.f);
    vec3s_set(D_8033B6F0[2].unk1C, gSecondCameraFocus->oMoveAnglePitch,
              gSecondCameraFocus->oMoveAngleYaw, gSecondCameraFocus->oMoveAngleRoll);

    CutsceneEnterBowserPlatform0_5(c);
    CutsceneEnterBowserPlatform0_9(c);
}

CmdRet bowser_fight_intro_dialog(UNUSED struct LevelCamera *c) {
    s16 dialog;

    switch (gCurrLevelNum) {
        case LEVEL_BOWSER_1:
            dialog = DIALOG_067;
            break;
        case LEVEL_BOWSER_2:
            dialog = DIALOG_092;
            break;
        default:
            dialog = DIALOG_093;
    }

    create_dialog_box(dialog);
}

CmdRet CutsceneEnterBowserPlatform1(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(bowser_fight_intro_dialog, c, 0, 0);

    if (get_dialog_id() == -1) {
        gCutsceneTimer = 0x7FFF;
    }
}

CmdRet CutsceneEnterBowserPlatform2(struct LevelCamera *c) {
    func_802930C8(c);
    c->cutscene = 0;
    init_transitional_movement(c, 20);
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
    sFirstPersonCameraYaw = sMarioStatusForCamera->faceAngle[1] + 0x4000;
    gSecondCameraFocus->oBowserUnk88 = 2;
}

CmdRet CutsceneEnterBowserPlatform0(struct LevelCamera *c) {
    set_cutscene_phase_at_frame(2, 0);

    if (gSecondCameraFocus != NULL) {
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_1, c, 0, -1);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_2, c, 0, 5);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_3, c, 40, 40);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_4, c, 145, 145);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_5, c, 40, -1);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_6, c, 40, 99);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_7, c, 100, -1);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_8, c, 40, 140);
        call_cutscene_func_in_time_range(CutsceneEnterBowserPlatform0_9, c, 40, -1);
        call_cutscene_func_in_time_range(CutsceneEnterSomething8029041C, c, 60, 60);
        call_cutscene_func_in_time_range(CutsceneEnterSomething8029041C, c, 82, 82);
        call_cutscene_func_in_time_range(CutsceneEnterSomething8029041C, c, 109, 109);
        call_cutscene_func_in_time_range(CutsceneEnterSomething8029041C, c, 127, 127);
    }
}

CmdRet CutsceneStarSpawn0_1(struct LevelCamera *c) {
    func_80290224(c);
}

CmdRet CutsceneStarSpawn0_2(struct LevelCamera *c) {
    UNUSED f32 sp34;
    Vec3f pos;
    UNUSED f32 sp24;

    if (gCutsceneFocus != NULL) {
        object_pos_to_vec3f(pos, gCutsceneFocus);
        pos[1] += gCutsceneFocus->hitboxHeight;
        approach_vec3f_exponential(c->focus, pos, 0.1f, 0.1f, 0.1f);
    }
}

CmdRet CutsceneStarSpawn1_1(struct LevelCamera *c) {
    Vec3f sp2C, sp20;

    return_boss_fight_camera_yaw(c, sp20, sp2C);
    approach_vec3f_exponential(c->focus, sp20, 0.2f, 0.2f, 0.2f);
    approach_vec3f_exponential(c->pos, sp2C, 0.2f, 0.2f, 0.2f);
}

CmdRet CutsceneStarSpawn1_2(struct LevelCamera *c) {
    func_802902A8(c);
    init_transitional_movement(c, 15);
}

CmdRet CutsceneStarSpawn0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneStarSpawn0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneStarSpawn0_2, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;

    if (gCutsceneActive) {
        gCutsceneTimer = 0x7FFF;
    }
}

CmdRet CutsceneStarSpawn1(struct LevelCamera *c) {
    if ((c->currPreset == CAMERA_PRESET_BOSS_FIGHT) && (test_or_set_mario_cam_active(0) == 2)) {
        call_cutscene_func_in_time_range(CutsceneStarSpawn1_1, c, 0, -1);
    } else {
        call_cutscene_func_in_time_range(CutsceneStarSpawn1_2, c, 0, 0);
    }

    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
}

CmdRet CutsceneStarSpawn2(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCutsceneTimer = -0x8000;
    c->cutscene = 0;
}

CmdRet CutsceneExitWaterfall0_1(struct LevelCamera *c) {
    vec3f_set(c->pos, -3899.f, 39.f, -5671.f);
}

CmdRet Cutscene80293794(struct LevelCamera *c) {
    vec3f_copy(c->focus, sMarioStatusForCamera->pos);
    c->focus[1] = c->pos[1] + (sMarioStatusForCamera->pos[1] + 125.f - c->pos[1]) * 0.5f;
    approach_vec3f_exponential(c->focus, sMarioStatusForCamera->pos, 0.05f, 0.4f, 0.05f);
}

CmdRet CutsceneExitWaterfall0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneExitWaterfall0_1, c, 0, 0);
    call_cutscene_func_in_time_range(Cutscene80293794, c, 0, -1);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneFallCommon1(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCutsceneTimer = -0x8000;
    c->cutscene = 0;
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneFallToCastleGrounds0_1(struct LevelCamera *c) {
    vec3f_set(c->pos, 5830.f, 32.f, 3985.f);
}

CmdRet CutsceneFallToCastleGrounds0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneFallToCastleGrounds0_1, c, 0, 0);
    call_cutscene_func_in_time_range(Cutscene80293794, c, 0, -1);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneSpecialStarSpawn0_1(struct LevelCamera *c) {
    object_pos_to_vec3f(D_8033B6F0[1].unk4, gCutsceneFocus);
    func_80290224(c);
    D_8033B6F0[2].unk4[2] = D_8033B230.fieldOfView;
}

CmdRet CutsceneSpecialStarSpawn0_3(struct LevelCamera *c) {
    approach_f32_exponential_bool(&c->focus[0], gCutsceneFocus->oPosX, 0.15f);
    approach_f32_exponential_bool(&c->focus[2], gCutsceneFocus->oPosZ, 0.15f);
}

CmdRet CutsceneSpecialStarSpawn0_4(struct LevelCamera *c) {
    approach_f32_exponential_bool(&c->focus[1], gCutsceneFocus->oPosY, 0.1f);
}

CmdRet CutsceneSpecialStarSpawn0_5(struct LevelCamera *c) {
    c->focus[1] = D_8033B6F0[1].unk4[1] + (gCutsceneFocus->oPosY - D_8033B6F0[1].unk4[1]) * 0.8f;
}

CmdRet CutsceneSpecialStarSpawn0_2(struct LevelCamera *c) {
    f32 sp3C;
    s16 sp3A, sp38, sp36;
    struct Object *o = gCutsceneFocus;

    vec3f_set(D_8033B6F0[1].unk4, o->oHomeX, o->oHomeY, o->oHomeZ);
    vec3f_get_dist_and_angle(D_8033B6F0[1].unk4, c->pos, &sp3C, &sp3A, &sp38);
    sp36 = calculate_yaw(D_8033B6F0[1].unk4, c->pos);
    sp38 = calculate_yaw(D_8033B6F0[1].unk4, sMarioStatusForCamera->pos);

    if (ABS(sp38 - sp36 + 0x4000) < ABS(sp38 - sp36 - 0x4000)) {
        sp38 += 0x4000;
    } else {
        sp38 -= 0x4000;
    }

    vec3f_set_dist_and_angle(D_8033B6F0[1].unk4, c->pos, 400.f, 0x1000, sp38);
    gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
}

CmdRet CutsceneSpecialStarSpawn0_6(UNUSED struct LevelCamera *c) {
    D_8033B230.fieldOfView = 60.f;
}

CmdRet CutsceneSpecialStarSpawn0(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    call_cutscene_func_in_time_range(CutsceneSpecialStarSpawn0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneSpecialStarSpawn0_2, c, 30, 30);
    call_cutscene_func_in_time_range(CutsceneSpecialStarSpawn0_3, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneSpecialStarSpawn0_4, c, 0, 29);
    call_cutscene_func_in_time_range(CutsceneSpecialStarSpawn0_5, c, 30, -1);
    call_cutscene_func_in_time_range(CutsceneSpecialStarSpawn0_6, c, 30, -1);

    if (gCutsceneActive) {
        gCutsceneTimer = 0x7FFF;
    }
}

CmdRet CutsceneSpecialStarSpawn1(struct LevelCamera *c) {
    func_802902A8(c);
    gCutsceneTimer = -0x8000;
    c->cutscene = 0;
    D_8033B230.fieldOfView = D_8033B6F0[2].unk4[2];
}

void func_80293DE8(struct LevelCamera *a, f32 b, s16 c, s16 d, s16 e) {
    UNUSED f32 sp44;
    f32 sp40;
    s16 sp3E, sp3C;
    f32 sp38;
    s16 sp36, sp34;
    f32 sp30;
    s16 sp2E, sp2C;
    UNUSED f32 sp28, sp24;

    vec3f_get_dist_and_angle(D_8033B6F0[3].unk4, a->pos, &sp40, &sp3E, &sp3C);

    if ((sp40 > 8000.f) && (a->cutscene == CUTSCENE_PREPARE_CANNON)) {
        sp40 = b * 4.f;
        sp3E = c;
        vec3f_copy(D_8033B6F0[0].unk4, D_8033B6F0[3].unk4);
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;

        if (gCurrLevelNum == LEVEL_TTM) {
            sp3C = atan2s(D_8033B6F0[3].unk4[2] - a->zFocus, D_8033B6F0[3].unk4[0] - a->xFocus);
        }
    } else {
        if (a->cutscene == CUTSCENE_PREPARE_CANNON) {
            vec3f_get_dist_and_angle(a->pos, D_8033B6F0[0].unk4, &sp30, &sp2E, &sp2C);
            vec3f_get_dist_and_angle(a->pos, D_8033B6F0[3].unk4, &sp38, &sp36, &sp34);
            approach_f32_exponential_bool(&sp30, sp38, 0.1f);
            approach_s16_exponential_bool(&sp2E, sp36, 15);
            approach_s16_exponential_bool(&sp2C, sp34, 15);
            vec3f_set_dist_and_angle(a->pos, D_8033B6F0[0].unk4, sp30, sp2E, sp2C);
        } else {
            approach_vec3f_exponential(D_8033B6F0[0].unk4, D_8033B6F0[3].unk4, 0.1f, 0.1f, 0.1f);
        }
    }

    approach_f32_exponential_bool(&sp40, b, 0.05f);
    approach_s16_exponential_bool(&sp3E, c, 0x20);
    vec3f_set_dist_and_angle(D_8033B6F0[3].unk4, a->pos, sp40, sp3E, sp3C);
    vec3f_copy(a->focus, D_8033B6F0[0].unk4);
    rotate_camera(a, d, e);
    vec3f_get_dist_and_angle(a->pos, a->focus, &sp40, &sp3E, &sp3C);

    if (sp3E < -0x3000) {
        sp3E = -0x3000;
    }
    if (sp3E > 0x3000) {
        sp3E = 0x3000;
    }

    vec3f_set_dist_and_angle(a->pos, a->focus, sp40, sp3E, sp3C);
}

CmdRet CutscenePrepareCannon0_1(struct LevelCamera *c) {
    func_80290144(c);
    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
    D_8033B6F0[2].unk4[0] = 30.f;
    object_pos_to_vec3f(D_8033B6F0[3].unk4, gCutsceneFocus);
    vec3s_set(D_8033B6F0[5].unk1C, 0, 0, 0);
}

CmdRet CutscenePrepareCannon0_2(struct LevelCamera *c) {
    func_80293DE8(c, 300.f, 0x2000, 0, D_8033B6F0[5].unk1C[1]);
    camera_approach_s16_symmetric_bool(&D_8033B6F0[5].unk1C[1], 0x400, 17);
    set_spline_values(1);
}

void func_802941CC(f32 *a, f32 b) {
    f32 sp24 = ABS(b - *a) / D_8033B6F0[2].unk4[0];
    camera_approach_f32_symmetric_bool(a, b, sp24);
}

CmdRet CutscenePrepareCannon0_3(struct LevelCamera *c) {
    f32 sp1C = calc_abs_dist(c->pos, D_8033B4B8.pos);

    if (sp1C < 8000.f) {
        func_802941CC(&c->pos[0], D_8033B4B8.pos[0]);
        func_802941CC(&c->pos[1], D_8033B4B8.pos[1]);
        func_802941CC(&c->pos[2], D_8033B4B8.pos[2]);
        func_802941CC(&c->focus[0], D_8033B4B8.focus[0]);
        func_802941CC(&c->focus[1], D_8033B4B8.focus[1]);
        func_802941CC(&c->focus[2], D_8033B4B8.focus[2]);
    } else {
        vec3f_copy(c->focus, D_8033B4B8.focus);
        vec3f_copy(c->pos, D_8033B4B8.pos);
        gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    }
    if (D_8033B6F0[2].unk4[0] > 1.f) {
        D_8033B6F0[2].unk4[0] -= 1.f;
    }
}

CmdRet CutscenePrepareCannon0(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    call_cutscene_func_in_time_range(CutscenePrepareCannon0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutscenePrepareCannon0_2, c, 0, 140);
    call_cutscene_func_in_time_range(CutscenePrepareCannon0_3, c, 141, -1);
}

CmdRet CutscenePrepareCannon1(struct LevelCamera *c) {
    gCutsceneTimer = -0x8000;
    c->cutscene = 0;
    func_802901B4(c);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
}

void func_802944A8(struct LevelCamera *c) {
    f32 sp24;
    s16 sp22, sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp24, &sp22, &sp20);
    approach_s16_exponential_bool(&sp20, (sMarioStatusForCamera->faceAngle[1] - 0x3000), 8);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp24, sp22, sp20);
}

void func_80294538(struct LevelCamera *c) {
    func_80293DE8(c, 400.f, 0x1000, 0x300, 0);
}

CmdRet CutsceneDeath1_1(struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
    vec3f_copy(D_8033B6F0[3].unk4, sMarioStatusForCamera->pos);
    D_8033B6F0[3].unk4[1] += 70.f;
}

CmdRet CutsceneDeath1_2(struct LevelCamera *c) {
    func_80294538(c);
    set_spline_values(4);
}

CmdRet CutsceneDeath1(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneDeath1_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneDeath1_2, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
}

CmdRet CutsceneDeath2_1(struct LevelCamera *c) {
    Vec3f sp1C = { 0, 40.f, -60.f };

    set_pos_from_face_angle_and_vec3f(D_8033B6F0[3].unk4, sMarioStatusForCamera->pos, sp1C,
                                      sMarioStatusForCamera->faceAngle);
    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
}

CmdRet CutsceneDeath2_2(struct LevelCamera *c) {
    func_80293DE8(c, 400.f, 0x1800, 0, -0x400);
}

static void unused_80294748(struct LevelCamera *c) {
    func_802944A8(c);
}

CmdRet CutsceneDeath2(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneDeath2_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneDeath2_2, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    set_spline_values(1);
}

CmdRet CutsceneBBHDeath0_1(struct LevelCamera *c) {
    Vec3f sp1C = { 0, 40.f, 60.f };

    set_pos_from_face_angle_and_vec3f(D_8033B6F0[3].unk4, sMarioStatusForCamera->pos, sp1C,
                                      sMarioStatusForCamera->faceAngle);
    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
}

CmdRet CutsceneBBHDeath0_2(struct LevelCamera *c) {
    func_80293DE8(c, 400.f, 0x1800, 0, 0x400);
}

CmdRet CutsceneBBHDeath0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneBBHDeath0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneBBHDeath0_2, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    set_spline_values(1);
}

CmdRet CutsceneQuicksandDeath0_1(struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
}

CmdRet CutsceneQuicksandDeath0_2(struct LevelCamera *c) {
    func_80293DE8(c, 400.f, 0x2800, 0x200, 0);

    if (c->cutscene == CUTSCENE_WATER_DEATH) {
        func_802944A8(c);
    }
}

CmdRet CutsceneQuicksandDeath0(struct LevelCamera *c) {
    D_8033B6F0[3].unk4[0] = sMarioStatusForCamera->pos[0];
    D_8033B6F0[3].unk4[1] = sMarioStatusForCamera->pos[1] + 20.f;
    D_8033B6F0[3].unk4[2] = sMarioStatusForCamera->pos[2];

    call_cutscene_func_in_time_range(CutsceneQuicksandDeath0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneQuicksandDeath0_2, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    set_spline_values(4);
}

CmdRet Cutscene1ATodo0_3(UNUSED struct LevelCamera *c) {
    Vec3f sp2C;
    Vec3f sp20 = { 0, 20.f, 120.f };

    set_pos_from_face_angle_and_vec3f(sp2C, sMarioStatusForCamera->pos, sp20,
                                      sMarioStatusForCamera->faceAngle);
    approach_vec3f_exponential(D_8033B6F0[3].unk4, sp2C, 0.1f, 0.1f, 0.1f);
}

CmdRet Cutscene1ATodo0_2(struct LevelCamera *c) {
    UNUSED f32 sp34;
    f32 sp30;
    UNUSED f32 sp2C;

    func_80293DE8(c, 400.f, 0x2800, 0x200, 0);
    sp30 = find_poison_gas_level(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[2]);

    if (sp30 != -11000.f) {
        if ((sp30 += 130.f) > c->pos[1]) {
            c->pos[1] = sp30;
        }
    }
}

CmdRet Cutscene1ATodo0_1(struct LevelCamera *c) {
    f32 sp24;
    s16 sp22, sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp24, &sp22, &sp20);
    sp20 += 0x100;
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp24, sp22, sp20);
}

CmdRet Cutscene1ATodo0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneDeath2_1, c, 0, 0);
    call_cutscene_func_in_time_range(Cutscene1ATodo0_1, c, 0, -1);
    call_cutscene_func_in_time_range(Cutscene1ATodo0_2, c, 0, -1);
    call_cutscene_func_in_time_range(Cutscene1ATodo0_3, c, 50, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    set_spline_values(4);
}

CmdRet CutsceneEnterPool0_1(struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[3].unk4, sMarioStatusForCamera->pos);

    if (gCurrLevelNum == LEVEL_CASTLE) { // entering HMC
        vec3f_set(D_8033B6F0[3].unk4, 2485.f, -1589.f, -2659.f);
    }
    if (gCurrLevelNum == LEVEL_HMC) { // entering CotMC
        vec3f_set(D_8033B6F0[3].unk4, 3350.f, -4589.f, 4800.f);
    }

    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
}

CmdRet CutsceneEnterPool0_2(struct LevelCamera *c) {
    UNUSED u32 pad[2];

    func_80293DE8(c, 1200.f, 0x2000, 0x200, 0);
}

CmdRet CutsceneEnterPool0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneEnterPool0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneEnterPool0_2, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
}

CmdRet Cutscene26Todo1_1(struct LevelCamera *c) {
    func_8028FEDC(c);
    func_80290144(c);

    vec3f_copy(D_8033B6F0[1].unk4, c->focus);
    vec3f_set(D_8033B6F0[3].unk4, c->xFocus, 1280.f, c->zFocus);
}

CmdRet Cutscene26Todo1_5(UNUSED struct LevelCamera *c) {
    set_fov_function(10);
}

CmdRet Cutscene26Todo1_2(struct LevelCamera *c) {
    approach_vec3f_exponential(c->focus, D_8033B6F0[3].unk4, 0.02f, 0.02f, 0.02f);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
}

CmdRet Cutscene26Todo1_3(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    set_fov_function(2);
    D_8033B230.fieldOfView = 45.f;

    vec3f_copy(D_8033B6F0[4].unk4, c->pos);
    vec3f_copy(D_8033B6F0[5].unk4, c->focus);
    vec3f_copy(c->focus, D_8033B6F0[3].unk4);

    vec3f_get_dist_and_angle(D_8033B6F0[3].unk4, sMarioStatusForCamera[0].pos, &sp20, &sp26, &sp24);
    vec3f_set_dist_and_angle(D_8033B6F0[3].unk4, c->pos, 2000.f, 0, sp24);
    c->pos[1] += 500.f;
}

CmdRet Cutscene26Todo1_4(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    vec3f_get_dist_and_angle(D_8033B6F0[3].unk4, c->pos, &sp20, &sp26, &sp24);
    approach_f32_exponential_bool(&sp20, 2000.f, 0.1f);
    vec3f_set_dist_and_angle(D_8033B6F0[3].unk4, c->pos, sp20, sp26, sp24);

    c->focus[1] += 4.f;
    c->pos[1] -= 5.f;
    D_8033B230.fieldOfView = 45.f;
    set_spline_values(1);
}

CmdRet Cutscene26Todo1_7(UNUSED struct LevelCamera *c) {
    set_camera_shake_2(8);
}

CmdRet Cutscene26Todo1_6(struct LevelCamera *c) {
    UNUSED u32 pad[2];

    vec3f_copy(c->pos, D_8033B6F0[4].unk4);
    vec3f_copy(c->focus, D_8033B6F0[5].unk4);
    set_camera_shake_2(SHAKE_2_UNKNOWN_3);
}

CmdRet Cutscene26Todo1(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(Cutscene26Todo1_1, c, 0, 0);
    call_cutscene_func_in_time_range(Cutscene26Todo1_2, c, 0, 30);
    call_cutscene_func_in_time_range(Cutscene26Todo1_3, c, 31, 31);
    call_cutscene_func_in_time_range(Cutscene26Todo1_4, c, 31, 139);
    call_cutscene_func_in_time_range(Cutscene26Todo1_5, c, 23, 23);
    call_cutscene_func_in_time_range(Cutscene26Todo1_6, c, 140, 140);
    call_cutscene_func_in_time_range(Cutscene26Todo1_7, c, 31, 139);
}

CmdRet Cutscene26Todo2(struct LevelCamera *c) {
    func_802930C8(c);
    func_8028FAE0(c);
    init_transitional_movement(c, 30);
}

CmdRet CutsceneEnterPyramidTop0_1(struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[0].unk4, c->focus);
    vec3f_set(D_8033B6F0[3].unk4, c->xFocus, 1280.f, c->zFocus);
}

CmdRet CutsceneEnterPyramidTop0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneEnterPyramidTop0_1, c, 0, 0);
    func_80293DE8(c, 200.f, 0x3000, 0, 0);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    set_spline_values(1);

    if (sMarioStatusForCamera->pos[1] > 1250.f) {
        CutsceneFallCommon1(c);
    }
}

static void unused_8029538C(struct LevelCamera *c) {
    f32 sp24;

    sp24 = calc_abs_dist(D_8033B6F0[3].unk4, sMarioStatusForCamera->pos);
    sp24 = calc_abs_dist(D_8033B6F0[9].unk4, sMarioStatusForCamera->pos) + 200.f;
    func_80293DE8(c, sp24, 0x1000, 0x300, 0);
}

CmdRet CutsceneDialog0_1(struct LevelCamera *c) {
    UNUSED f32 sp1C;
    UNUSED s16 sp1A;
    s16 sp18;

    func_80290564(c);
    set_time_stop_flags(TIME_STOP_ENABLED | TIME_STOP_UNKNOWN_2);

#ifndef VERSION_JP
    if (c->currPreset == CAMERA_PRESET_BOSS_FIGHT) {
        vec3f_copy(D_8033B4B8.focus, c->focus);
        vec3f_copy(D_8033B4B8.pos, c->pos);
    } else {
#endif
        func_80290224(c);
#ifndef VERSION_JP
    }
#endif

    D_8033B6F0[8].unk1C[0] = 0;
    vec3f_copy(D_8033B6F0[8].unk4, sMarioStatusForCamera->pos);
    D_8033B6F0[8].unk4[1] += 125.f;
    object_pos_to_vec3f(D_8033B6F0[9].unk4, gCutsceneFocus);
    D_8033B6F0[9].unk4[1] += gCutsceneFocus->hitboxHeight + 200.f;
    D_8033B6F0[9].unk1C[1] = calculate_yaw(D_8033B6F0[8].unk4, D_8033B6F0[9].unk4);

    sp18 = calculate_yaw(sMarioStatusForCamera->pos, gCameraStatus.camFocAndPosCurrAndGoal[1]);
    if ((sp18 - D_8033B6F0[9].unk1C[1]) & 0x8000) {
        D_8033B6F0[9].unk1C[1] -= 0x6000;
    } else {
        D_8033B6F0[9].unk1C[1] += 0x6000;
    }
}

CmdRet CutsceneDialog0_2(struct LevelCamera *c) {
    f32 sp4C;
    s16 sp4A, sp48;
    Vec3f sp3C, sp30;

    scale_along_line(sp3C, D_8033B6F0[9].unk4, sMarioStatusForCamera->pos, 0.7f);
    vec3f_get_dist_and_angle(c->pos, sp3C, &sp4C, &sp4A, &sp48);
    sp4A = calculate_verticle_angle(c->pos, D_8033B6F0[9].unk4);
    vec3f_set_dist_and_angle(c->pos, sp30, sp4C, sp4A, sp48);
    sp3C[1] = sp3C[1] + (D_8033B6F0[9].unk4[1] - sp3C[1]) * 0.1f;
    approach_vec3f_exponential(c->focus, sp3C, 0.2f, 0.2f, 0.2f);
    vec3f_copy(sp30, c->pos);
    sp30[1] = D_8033B6F0[8].unk4[1];
    vec3f_get_dist_and_angle(D_8033B6F0[8].unk4, sp30, &sp4C, &sp4A, &sp48);
    approach_s16_exponential_bool(&sp48, D_8033B6F0[9].unk1C[1], 0x10);
    approach_f32_exponential_bool(&sp4C, 180.f, 0.05f);
    vec3f_set_dist_and_angle(D_8033B6F0[8].unk4, sp30, sp4C, sp4A, sp48);
    sp30[1] = D_8033B6F0[8].unk4[1]
              + sins(calculate_verticle_angle(D_8033B6F0[9].unk4, D_8033B6F0[8].unk4)) * 100.f;
    approach_f32_exponential_bool(&c->pos[1], sp30[1], 0.05f);
    c->pos[0] = sp30[0];
    c->pos[2] = sp30[2];
}

CmdRet CutsceneDialog0_3(struct LevelCamera *c) {
    if (c->cutscene == CUTSCENE_DIALOG_2) {
        create_dialog_box_with_response(D_8033B320);
    } else {
        create_dialog_box(D_8033B320);
    }

    D_8033B6F0[8].unk1C[0] = 3;
}

CmdRet CutsceneDialog0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneDialog0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneDialog0_2, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneDialog0_3, c, 10, 10);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;

    if (gDialogResponse != 0) {
        D_8032CFFC = gDialogResponse;
    }

    if ((get_dialog_id() == -1) && (D_8033B6F0[8].unk1C[0] != 0)) {
        if (c->cutscene != CUTSCENE_DIALOG_2) {
            D_8032CFFC = 3;
        }

        gCutsceneTimer = 0x7FFF;
        func_802902A8(c);
        init_transitional_movement(c, 15);
        gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
        func_80290598(c);
    }
}

CmdRet CutsceneDialog1(UNUSED struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
}

CmdRet CutsceneDialog2(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
    c->cutscene = 0;
    clear_time_stop_flags(TIME_STOP_ENABLED | TIME_STOP_UNKNOWN_2);
}

CmdRet CutsceneReadMessage0_1(struct LevelCamera *c) {
    func_80290564(c);
    init_transitional_movement(c, 30);
    func_8028FEDC(c);
    func_80290224(c);

    D_8033B6F0[1].unk1C[0] = sFirstPersonCameraPitch;
    D_8033B6F0[1].unk1C[1] = sFirstPersonCameraYaw;
    sFirstPersonCameraPitch = -2096;
    sFirstPersonCameraYaw = 0;
    D_8033B6F0[0].unk1C[0] = 0;
}

static void unused_80295A28(struct LevelCamera *c) {
    Vec3s sp20;

    vec3s_set(sp20, 0, sMarioStatusForCamera->faceAngle[1], 0);
    set_pos_from_face_angle_and_rel_coords(c->pos, sMarioStatusForCamera->pos, sp20, 0, 100.f, 190.f);
    set_pos_from_face_angle_and_rel_coords(c->focus, sMarioStatusForCamera->pos, sp20, 0, 70.f, -20.f);
}

CmdRet CutsceneReadMessage0(struct LevelCamera *c) {
    UNUSED u32 pad[2];

    call_cutscene_func_in_time_range(CutsceneReadMessage0_1, c, 0, 0);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;

    switch (D_8033B6F0[0].unk1C[0]) {
        case 0:
            if (get_dialog_id() != -1) {
                D_8033B6F0[0].unk1C[0] += 1;
                set_time_stop_flags(TIME_STOP_ENABLED | TIME_STOP_UNKNOWN_2);
            }
            break;
        case 1:
            operate_c_up_looking(c);
            return_first_person_camera_yaw(c, c->focus, c->pos);

            if (get_dialog_id() == -1) {
                gCutsceneTimer = 0x7FFF;
                func_802902A8(c);
                init_transitional_movement(c, 15);
                gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
                clear_time_stop_flags(TIME_STOP_ENABLED | TIME_STOP_UNKNOWN_2);
                sFirstPersonCameraPitch = D_8033B6F0[1].unk1C[0];
                sFirstPersonCameraYaw = D_8033B6F0[1].unk1C[1];
                func_80290598(c);
            }
    }
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
}

CmdRet CutsceneReadMessage1(UNUSED struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
}

CmdRet CutsceneReadMessage2(struct LevelCamera *c) {
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
    c->cutscene = 0;
}

CmdRet CutsceneExitSuccess1(UNUSED struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[7].unk4, sMarioStatusForCamera->pos);
    vec3s_copy(D_8033B6F0[7].unk1C, sMarioStatusForCamera->faceAngle);
    vec3f_set(D_8033B6F0[6].unk4, 6.f, 363.f, 543.f);
    vec3f_set(D_8033B6F0[5].unk4, 137.f, 226.f, 995.f);
}

CmdRet CutsceneExitSuccess2(struct LevelCamera *c) {
    UNUSED u32 sp34;
    struct Surface *floor;
    UNUSED Vec3f sp24;

    switch (gPrevLevel) {
        case LEVEL_HMC:
            vec3f_set(c->pos, 3465.f, -1008.f, -2961.f);
            break;

        case LEVEL_COTMC:
            vec3f_set(c->pos, 3465.f, -1008.f, -2961.f);
            break;

        case LEVEL_RR:
            vec3f_set(c->pos, -3741.f, 3151.f, 6065.f);
            break;

        case LEVEL_WMOTR:
            vec3f_set(c->pos, 1972.f, 3230.f, 5891.f);
            break;

        default:
            set_pos_from_face_angle_and_vec3f(c->pos, D_8033B6F0[7].unk4, D_8033B6F0[5].unk4,
                                              D_8033B6F0[7].unk1C);
            c->pos[1] = find_floor(c->pos[0], c->pos[1] + 1000.f, c->pos[2], &floor) + 125.f;
            break;
    }
}

CmdRet CutsceneExitSuccess4(struct LevelCamera *c) {
    set_pos_from_face_angle_and_vec3f(c->focus, D_8033B6F0[7].unk4, D_8033B6F0[6].unk4,
                                      D_8033B6F0[7].unk1C);

    if ((gPrevLevel == LEVEL_COTMC) || (gPrevLevel == LEVEL_HMC) || (gPrevLevel == LEVEL_RR)
        || (gPrevLevel == LEVEL_WMOTR)) {
        c->focus[0] = c->pos[0] + (sMarioStatusForCamera->pos[0] - c->pos[0]) * 0.7f;
        c->focus[1] = c->pos[1] + (sMarioStatusForCamera->pos[1] - c->pos[1]) * 0.4f;
        c->focus[2] = c->pos[2] + (sMarioStatusForCamera->pos[2] - c->pos[2]) * 0.7f;
    } else {
        c->focus[1] = c->pos[1] + (sMarioStatusForCamera->pos[1] - c->pos[1]) * 0.2f;
    }
}

CmdRet CutsceneExitSuccess3(UNUSED struct LevelCamera *c) {
    approach_f32_exponential_bool(&D_8033B6F0[6].unk4[0], -24.f, 0.05f);
}

CmdRet CutsceneExitBowserSuccess0_1(struct LevelCamera *c) {
    if (c->cutscene == CUTSCENE_EXIT_BOWSER_SUCC) {
        set_camera_pitch_shake(0x800, 0x40, 0x800);
    }
}

CmdRet CutsceneExitSuccess5(UNUSED struct LevelCamera *c) {
    set_camera_shake_2(SHAKE_2_UNKNOWN_1);
}

CmdRet CutsceneExitBowserSuccess0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneExitSuccess1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneExitSuccess2, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess3, c, 18, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess4, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneExitBowserSuccess0_1, c, 125, 125);
    call_cutscene_func_in_time_range(CutsceneExitSuccess5, c, 41, 41);
}

CmdRet CutsceneExitNonPainting1(struct LevelCamera *c) {
    c->cutscene = 0;

    if (c->defPreset == CAMERA_PRESET_CLOSE) {
        c->currPreset = CAMERA_PRESET_CLOSE;
    } else {
        c->currPreset = CAMERA_PRESET_FREE_ROAM;
    }

    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    init_transitional_movement(c, 60);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneBBHExitSuccess0_1(UNUSED struct LevelCamera *c) {
    vec3f_set(D_8033B6F0[5].unk4, 137.f, 246.f, 1115.f);
}

CmdRet CutsceneBBHExitSuccess0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneExitSuccess1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneBBHExitSuccess0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneExitSuccess2, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess3, c, 18, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess4, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess5, c, 41, 41);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneNonPaintingDeath0_1(UNUSED struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[7].unk4, sMarioStatusForCamera->pos);
    vec3s_copy(D_8033B6F0[7].unk1C, sMarioStatusForCamera->faceAngle);
    vec3f_set(D_8033B6F0[6].unk4, -42.f, 350.f, 727.f);
    vec3f_set(D_8033B6F0[5].unk4, 107.f, 226.f, 1187.f);
}

CmdRet Cutscene1CTodo_0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneNonPaintingDeath0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneExitSuccess2, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess4, c, 0, -1);
}

CmdRet CutsceneNonPaintingDeath0_2(UNUSED struct LevelCamera *c) {
    switch (gPrevLevel) {
        case LEVEL_HMC:
            vec3f_set(D_8033B6F0[5].unk4, 187.f, 369.f, -197.f);
            break;
        case LEVEL_COTMC:
            vec3f_set(D_8033B6F0[5].unk4, 187.f, 369.f, -197.f);
            break;
        default:
            vec3f_set(D_8033B6F0[5].unk4, 107.f, 246.f, 1307.f);
            break;
    }
}

CmdRet CutsceneNonPaintingDeath0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneNonPaintingDeath0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneNonPaintingDeath0_2, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneExitSuccess2, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneExitSuccess4, c, 0, -1);
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
}

CmdRet CutsceneCapSwitchPress0_1(struct LevelCamera *c) {
    UNUSED s16 sp26;
    s16 sp24;
    UNUSED u32 sp1C[2];

    func_80290224(c);
    sp24 = calculate_yaw(sMarioStatusForCamera->pos, c->pos);
    D_8033B6F0[3].unk1C[1] = 0x1200;
    D_8033B6F0[1].unk1C[1] =
        (sp24 - (sMarioStatusForCamera->faceAngle[1] + D_8033B6F0[3].unk1C[1])) & 0xFF00;
}

CmdRet CutsceneCapSwitchPress0_4(struct LevelCamera *c) {
    f32 sp2C;
    s16 sp2A, sp28;
    UNUSED s16 sp26 = sMarioStatusForCamera->faceAngle[1] + 0x1000;
    UNUSED s16 sp24;
    UNUSED s32 sp20 = D_8033B6F0[1].unk1C[1];

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp2C, &sp2A, &sp28);

    if (D_8033B6F0[3].unk1C[1] != 0x1000) {
        D_8033B6F0[3].unk1C[1] += 0x100;
    }
    if (D_8033B6F0[1].unk1C[1] != 0) {
        D_8033B6F0[1].unk1C[1] += 0x100;
    }

    sp28 = sMarioStatusForCamera->faceAngle[1] + D_8033B6F0[3].unk1C[1] + D_8033B6F0[1].unk1C[1];
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp2C, sp2A, sp28);
}

CmdRet CutsceneCapSwitchPress0_5(struct LevelCamera *c) {
    rotate_and_move_vec3f(c->pos, sMarioStatusForCamera->pos, 0, -0x20, 0);
}

CmdRet CutsceneCapSwitchPress0_2(struct LevelCamera *c) {
    s16 sp26, sp24;
    f32 sp20;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp20, &sp26, &sp24);
    approach_f32_exponential_bool(&sp20, 195.f, 0.2f);
    approach_s16_exponential_bool(&sp26, 0, 0x10);
    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, sp20, sp26, sp24);

    approach_f32_exponential_bool(&c->focus[0], sMarioStatusForCamera->pos[0], 0.1f);
    approach_f32_exponential_bool(&c->focus[1], sMarioStatusForCamera->pos[1] + 110.f, 0.1f);
    approach_f32_exponential_bool(&c->focus[2], sMarioStatusForCamera->pos[2], 0.1f);
}

CmdRet CutsceneCapSwitchPress0_3(struct LevelCamera *c) {
    vec3f_copy(c->focus, sMarioStatusForCamera->pos);
    c->focus[1] += 110.f;
    camera_approach_s16_symmetric_bool(&D_8033B6F0[0].unk1C[1], 0x800, 0x20);
    rotate_camera(c, D_8033B6F0[0].unk1C[0], D_8033B6F0[0].unk1C[1]);
}

CmdRet CutsceneCapSwitchPress0_6(UNUSED struct LevelCamera *c) {
    create_dialog_box_with_response(gCutsceneFocus->oBehParams2ndByte + DIALOG_010);
}

static void unused_802968E8(struct LevelCamera *c) {
    func_802902A8(c);
    init_transitional_movement(c, 30);
}

CmdRet CutsceneCapSwitchPress0(struct LevelCamera *c) {
    f32 sp24;
    s16 sp22, sp20;

    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;

    call_cutscene_func_in_time_range(CutsceneCapSwitchPress0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneCapSwitchPress0_2, c, 0, 30);
    call_cutscene_func_in_time_range(CutsceneCapSwitchPress0_3, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneCapSwitchPress0_4, c, 30, -1);
    call_cutscene_func_in_time_range(CutsceneCapSwitchPress0_5, c, 10, 70);
    call_cutscene_func_in_time_range(CutsceneCapSwitchPress0_6, c, 10, 10);
    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &sp24, &sp22, &sp20);

    if (gDialogResponse != 0) {
        D_8033B6F0[4].unk1C[0] = gDialogResponse;
    }

    if ((get_dialog_id() == -1) && (D_8033B6F0[4].unk1C[0] != 0)) {
        D_8032CFFC = D_8033B6F0[4].unk1C[0];
        if (D_8033B6F0[4].unk1C[0] == 1) {
            cap_switch_save(gCutsceneFocus->oBehParams2ndByte);
        }
        func_8028FAE0(c);
        init_transitional_movement(c, 30);
    }
}

CmdRet CutsceneUnlockKeyDoor0_1(struct LevelCamera *c) {
    Vec3f sp24, sp18;

    vec3f_copy(D_8033B6F0[0].unk4, c->pos);
    vec3f_copy(D_8033B6F0[1].unk4, c->focus);
    vec3f_set(sp24, -206.f, 108.f, 234.f);
    vec3f_set(sp18, 48.f, 104.f, -193.f);
    set_pos_from_face_angle_and_vec3f(D_8033B6F0[2].unk4, sMarioStatusForCamera->pos, sp24,
                                      sMarioStatusForCamera->faceAngle);
    set_pos_from_face_angle_and_vec3f(D_8033B6F0[3].unk4, sMarioStatusForCamera->pos, sp18,
                                      sMarioStatusForCamera->faceAngle);
}

CmdRet CutsceneUnlockKeyDoor0_2(struct LevelCamera *c) {
    approach_vec3f_exponential(c->pos, D_8033B6F0[2].unk4, 0.1f, 0.1f, 0.1f);
    approach_vec3f_exponential(c->focus, D_8033B6F0[3].unk4, 0.1f, 0.1f, 0.1f);
}

CmdRet CutsceneUnlockKeyDoor0_5(UNUSED struct LevelCamera *c) {
    approach_f32_exponential_bool(&D_8033B6F0[3].unk4[1], sMarioStatusForCamera->pos[1] + 140.f, 0.07f);
}

CmdRet CutsceneUnlockKeyDoor0_6(UNUSED struct LevelCamera *c) {
}

CmdRet CutsceneUnlockKeyDoor0_3(struct LevelCamera *c) {
    approach_vec3f_exponential(c->pos, D_8033B6F0[0].unk4, 0.1f, 0.1f, 0.1f);
    approach_vec3f_exponential(c->focus, D_8033B6F0[1].unk4, 0.1f, 0.1f, 0.1f);
}

CmdRet CutsceneUnlockKeyDoor0_4(UNUSED struct LevelCamera *c) {
    func_8029A494(1);
}

CmdRet CutsceneUnlockKeyDoor0(UNUSED struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneUnlockKeyDoor0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneUnlockKeyDoor0_2, c, 0, 123);
    call_cutscene_func_in_time_range(CutsceneUnlockKeyDoor0_3, c, 124, -1);
    call_cutscene_func_in_time_range(CutsceneUnlockKeyDoor0_4, c, 79, 79);
    call_cutscene_func_in_time_range(CutsceneUnlockKeyDoor0_5, c, 70, 110);
    call_cutscene_func_in_time_range(CutsceneUnlockKeyDoor0_6, c, 112, 112);
}

/**
 * Move the camera along `positionSpline` and point its focus at the corresponding point along
 * `focusSpline`. sCutsceneSplineSegmentProgress is updated after pos and focus are calculated.
 */
s32 intro_peach_move_camera_start_to_pipe(struct LevelCamera *c, struct CutsceneSplinePoint positionSpline[],
                  struct CutsceneSplinePoint focusSpline[]) {
    Vec3f offset;
    s32 posReturn = 0;
    s32 focusReturn = 0;

    /**
     * The position spline's speed parameters are all 0, so sCutsceneSplineSegmentProgress doesn't get
     * updated. Otherwise position would move two frames ahead, and c->focus would always be one frame
     * further along the spline than c->pos.
     */
    posReturn = move_point_along_spline(c->pos, positionSpline, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    focusReturn = move_point_along_spline(c->focus, focusSpline, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);

    // The two splines used by this function are reflected in the horizontal plane for some reason,
    // so they are rotated every frame. Why do this, Nintendo?
    rotate_in_xz(c->focus, c->focus, -0x8000);
    rotate_in_xz(c->pos, c->pos, -0x8000);

    vec3f_set(offset, -1328.f, 260.f, 4664.f);
    vec3f_add(c->focus, offset);
    vec3f_add(c->pos, offset);

    posReturn += focusReturn; // Unused
    return focusReturn;
}

CmdRet peach_letter_text(UNUSED struct LevelCamera *c) {
    create_dialog_box(DIALOG_020);
}

#ifndef VERSION_JP
CmdRet play_sound_peach_reading_letter(UNUSED struct LevelCamera *c) {
    play_sound(SOUND_PEACH_DEAR_MARIO, gDefaultSoundArgs);
}
#endif

CmdRet CutsceneIntroPeachCommon(struct LevelCamera *c) {
    if (intro_peach_move_camera_start_to_pipe(c, sIntroStartToPipePosition, sIntroStartToPipeFocus) != 0) {
        gCameraMovementFlags &= ~CAM_MOVE_C_UP_MODE;
        gCutsceneTimer = 0x7FFF;
    }
}

CmdRet CutsceneIntroPeach4(struct LevelCamera *c) {
    if (get_dialog_id() == -1) {
        vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[3], c->pos);
        vec3f_copy(gCameraStatus.camFocAndPosCurrAndGoal[2], c->focus);
        gCameraFlags2 |= (CAM_FLAG_2_SMOOTH_MOVEMENT | CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE);
        gCutsceneTimer = 0x8000;
        c->cutscene = 0;
    }
}

CmdRet CutsceneIntroPeach3_2(struct LevelCamera *c) {
    move_point_along_spline(c->pos, sIntroPipeToDialogPosition, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_point_along_spline(c->focus, sIntroPipeToDialogFocus, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
}

CmdRet CutsceneIntroPeach2_2(UNUSED struct LevelCamera *c) {
    sMarioStatusForCamera->unk1C[1] = 0;
}

CmdRet CutsceneIntroPeach0_1(UNUSED struct LevelCamera *c) {
    D_8033B230.fieldOfView = 8.f;
    set_fov_function(12);
}

CmdRet CutsceneIntroPeach3_1(UNUSED struct LevelCamera *c) {
    sCutsceneSplineSegment = 0;
    sCutsceneSplineSegmentProgress = 0.1f;
    set_spline_values(4);
}

CmdRet CutsceneIntroPeach3_3(UNUSED struct LevelCamera *c) {
    set_spline_values(0);
}

CmdRet intro_pipe_exit_text(UNUSED struct LevelCamera *c) {
    create_dialog_box(DIALOG_033);
}

#ifndef VERSION_JP
CmdRet play_sound_intro_turn_on_hud(UNUSED struct LevelCamera *c) {
    play_sound_rbutton_changed();
}
#endif

CmdRet CutsceneIntroPeach2(struct LevelCamera *c) {
#ifndef VERSION_JP
    call_cutscene_func_in_time_range(play_sound_intro_turn_on_hud, c, 818, 818);
#endif
    set_cutscene_phase_at_frame(6, 1);
    call_cutscene_func_in_time_range(CutsceneIntroPeach2_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneIntroPeachCommon, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneIntroPeach2_2, c, 717, 717);
    clamp_pitch(c->pos, c->focus, 0x3B00, -0x3B00);
    D_8033B6F0[1].unk4[1] = 400.f;
}

CmdRet CutsceneIntroPeach3(struct LevelCamera *c) {
    UNUSED u32 pad[2];

    sMarioStatusForCamera->unk1C[1] = 0;
    call_cutscene_func_in_time_range(CutsceneIntroPeach3_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneIntroPeach3_2, c, 0, -1);
    call_cutscene_func_in_time_range(CutsceneIntroPeach3_3, c, 70, 70);
    call_cutscene_func_in_time_range(intro_pipe_exit_text, c, 250, 250);
    approach_f32_exponential_bool(
        &D_8033B6F0[1].unk4[1],
        80.f + sGeometryForMario.currFloorHeight
            + (sMarioStatusForCamera->pos[1] - sGeometryForMario.currFloorHeight) * 1.1f,
        0.4f);

    // Make the camera look up as mario jumps out of the pipe
    if (c->focus[1] < D_8033B6F0[1].unk4[1]) {
        c->focus[1] = D_8033B6F0[1].unk4[1];
    }

    gCameraFlags2 |= CAM_FLAG_2_UNUSED_CUTSCENE_ACTIVE;
}

CmdRet CutsceneIntroPeach1(UNUSED struct LevelCamera *c) {
    set_fov_function(2);
}

CmdRet CutsceneIntroPeach0(struct LevelCamera *c) {
    set_cutscene_phase_at_frame(5, 0);
    call_cutscene_func_in_time_range(CutsceneIntroPeach0_1, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneIntroPeach0_2, c, 65, 65);
#ifdef VERSION_EU
    call_cutscene_func_in_time_range(CutsceneIntroPeach_unkEU, c, 68, 68);
#endif
    call_cutscene_func_in_time_range(CutsceneIntroPeachCommon, c, 0, 0);
    call_cutscene_func_in_time_range(peach_letter_text, c, 65, 65);
#ifndef VERSION_JP
    call_cutscene_func_in_time_range(play_sound_peach_reading_letter, c, 83, 83);
#endif

    if ((gCutsceneTimer > 120) && (get_dialog_id() == -1)) {
        gCutsceneTimer = 0x7FFF;
    }

    clamp_pitch(c->pos, c->focus, 0x3B00, -0x3B00);
}

CmdRet CutsceneEndWaving0_1(UNUSED struct LevelCamera *c) {
    func_8028FABC();
}

// 3rd part of data
struct CutsceneSplinePoint gIntroLakituStartToPipeFocus[35] = {
    { 0, 32, { 58, -250, 346 } },    { 1, 50, { -159, -382, 224 } }, { 2, 37, { 0, -277, 237 } },
    { 3, 15, { 1, -44, 245 } },      { 4, 35, { 0, -89, 228 } },     { 5, 15, { 28, 3, 259 } },
    { 6, 25, { -38, -201, 371 } },   { 7, 20, { -642, 118, 652 } },  { 8, 25, { 103, -90, 861 } },
    { 9, 25, { 294, 145, 579 } },    { 10, 30, { 220, -42, 500 } },  { 11, 20, { 10, -134, 200 } },
    { 12, 20, { -143, -145, 351 } }, { 13, 14, { -256, -65, 528 } }, { 14, 20, { -251, -52, 459 } },
    { 15, 25, { -382, 520, 395 } },  { 16, 25, { -341, 240, 653 } }, { 17, 5, { -262, 700, 143 } },
    { 18, 15, { -760, 32, 27 } },    { 19, 20, { -756, -6, -26 } },  { 20, 20, { -613, 5, 424 } },
    { 21, 20, { -22, -100, 312 } },  { 22, 25, { 212, 80, 61 } },    { 23, 20, { 230, -28, 230 } },
    { 24, 35, { -83, -51, 303 } },   { 25, 17, { 126, 90, 640 } },   { 26, 9, { 158, 95, 763 } },
    { 27, 8, { 113, -25, 1033 } },   { 28, 20, { 57, -53, 1291 } },  { 29, 15, { 73, -34, 1350 } },
    { 30, 7, { 0, 96, 1400 } },      { 31, 8, { -59, 269, 1450 } },  { 32, 15, { 57, 1705, 1500 } },
    { 0, 15, { -227, 511, 1550 } },  { -1, 15, { -227, 511, 1600 } }
};

struct CutsceneSplinePoint gIntroLakituStartToPipeOffsetFromCamera[35] = {
    { 0, 0, { -46, 87, -15 } },   { 1, 0, { -38, 91, -11 } },  { 2, 0, { -31, 93, -13 } },
    { 3, 0, { -50, 84, -16 } },   { 4, 0, { -52, 83, -17 } },  { 5, 0, { -10, 99, 3 } },
    { 6, 0, { -54, 83, -10 } },   { 7, 0, { -31, 85, -40 } },  { 8, 0, { -34, 91, 19 } },
    { 9, 0, { -9, 95, 28 } },     { 10, 0, { 17, 72, 66 } },   { 11, 0, { 88, -7, 45 } },
    { 12, 0, { 96, -6, -26 } },   { 13, 0, { 56, -1, -82 } },  { 14, 0, { 40, 65, -63 } },
    { 15, 0, { -26, -3, -96 } },  { 16, 0, { 92, 82, 19 } },   { 17, 0, { 92, 32, 19 } },
    { 18, 0, { 92, 32, 19 } },    { 19, 0, { 92, 102, 19 } },  { 20, 0, { -69, 59, -70 } },
    { 21, 0, { -77, 109, -61 } }, { 22, 0, { -87, 59, -46 } }, { 23, 0, { -99, -3, 11 } },
    { 24, 0, { -99, -11, 5 } },   { 25, 0, { -97, -6, 19 } },  { 26, 0, { -97, 22, -7 } },
    { 27, 0, { -98, -11, -13 } }, { 28, 0, { -97, -11, 19 } }, { 29, 0, { -91, -11, 38 } },
    { 30, 0, { -76, -11, 63 } },  { 31, 0, { -13, 33, 93 } },  { 32, 0, { 51, -11, 84 } },
    { 33, 0, { 51, -11, 84 } },   { -1, 0, { 51, -11, 84 } }
};

struct CutsceneSplinePoint D_8032E4E4[9] = {
    { 0, 0, { -5, 975, -917 } },    { 0, 0, { -5, 975, -917 } },    { 0, 0, { -5, 975, -917 } },
    { 0, 0, { -76, 1067, 742 } },   { 0, 0, { -105, 1576, 3240 } }, { 0, 0, { -177, 1709, 5586 } },
    { 0, 0, { -177, 1709, 5586 } }, { 0, 0, { -177, 1709, 5586 } }, { 0, 0, { -177, 1709, 5586 } }
};

struct CutsceneSplinePoint D_8032E52C[9] = {
    { 0, 50, { 18, 1013, -1415 } }, { 0, 100, { 17, 1037, -1412 } }, { 0, 100, { 16, 1061, -1408 } },
    { 0, 100, { -54, 1053, 243 } }, { 0, 100, { -84, 1575, 2740 } }, { 0, 50, { -156, 1718, 5086 } },
    { 0, 0, { -156, 1718, 5086 } }, { 0, 0, { -156, 1718, 5086 } },  { 0, 0, { -156, 1718, 5086 } }
};

CmdRet CutsceneEndWaving0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneEndWaving0_1, c, 0, 0);
    move_point_along_spline(c->pos, D_8032E4E4, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_point_along_spline(c->focus, D_8032E52C, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    set_cutscene_phase_at_frame(6, 120);
}

CmdRet CutsceneCredits0_1(UNUSED struct LevelCamera *c) {
    func_8028FABC();
}

extern struct CutsceneSplinePoint sBobCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sBobCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sWfCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sWfCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sJrbCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sJrbCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sCcmSlideCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sCcmSlideCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sBbhCreditsCameraPositions[4];
extern struct CutsceneSplinePoint sBbhCreditsCameraFocus[4];
extern struct CutsceneSplinePoint sHmcCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sHmcCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sThiWigglerCreditsCameraPositions[3];
extern struct CutsceneSplinePoint sThiWigglerCreditsCameraFocus[3];
extern struct CutsceneSplinePoint sVolcanoCreditsCameraPositions[6];
extern struct CutsceneSplinePoint sVolcanoCreditsCameraFocus[6];
extern struct CutsceneSplinePoint sSslCreditsCameraPositions[6];
extern struct CutsceneSplinePoint sSslCreditsCameraFocus[6];
extern struct CutsceneSplinePoint sDddCreditsCameraPositions[7];
extern struct CutsceneSplinePoint sDddCreditsCameraFocus[7];
extern struct CutsceneSplinePoint sSlCreditsCameraPositions[4];
extern struct CutsceneSplinePoint sSlCreditsCameraFocus[4];
extern struct CutsceneSplinePoint sWdwCreditsCameraPositions[4];
extern struct CutsceneSplinePoint sWdwCreditsCameraFocus[4];
extern struct CutsceneSplinePoint sTtmCreditsCameraPositions[6];
extern struct CutsceneSplinePoint sTtmCreditsCameraFocus[6];
extern struct CutsceneSplinePoint sThiHugeCreditsCameraPositions[7];
extern struct CutsceneSplinePoint sThiHugeCreditsCameraFocus[7];
extern struct CutsceneSplinePoint sTtcCreditsCameraPositions[4];
extern struct CutsceneSplinePoint sTtcCreditsCameraFocus[4];
extern struct CutsceneSplinePoint sRrCreditsCameraPositions[4];
extern struct CutsceneSplinePoint sRrCreditsCameraFocus[4];
extern struct CutsceneSplinePoint sSaCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sSaCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sCotmcCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sCotmcCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sDddSubCreditsCameraPositions[5];
extern struct CutsceneSplinePoint sDddSubCreditsCameraFocus[5];
extern struct CutsceneSplinePoint sCcmOutsideCreditsCameraPositions[4];
extern struct CutsceneSplinePoint sCcmOutsideCreditsCameraFocus[4];

CmdRet CutsceneCredits0(struct LevelCamera *c) {
    struct CutsceneSplinePoint *focus, *pos;

    call_cutscene_func_in_time_range(CutsceneCredits0_1, c, 0, 0);

#define SET_CREDITS_PRESET(casenum, arg1, arg2)                                                        \
    case casenum:                                                                                      \
        pos = arg1;                                                                                    \
        focus = arg2;                                                                                  \
        break;

    switch (gCurrLevelArea) {
        SET_CREDITS_PRESET(AREA_BOB, sBobCreditsCameraPositions, sBobCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_WF, sWfCreditsCameraPositions, sWfCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_JRB_MAIN, sJrbCreditsCameraPositions, sJrbCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_CCM_SLIDE, sCcmSlideCreditsCameraPositions,
                           sCcmSlideCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_BBH, sBbhCreditsCameraPositions, sBbhCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_HMC, sHmcCreditsCameraPositions, sHmcCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_THI_WIGGLER, sThiWigglerCreditsCameraPositions,
                           sThiWigglerCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_LLL_VOLCANO, sVolcanoCreditsCameraPositions,
                           sVolcanoCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_SSL_OUTSIDE, sSslCreditsCameraPositions, sSslCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_DDD_WHIRLPOOL, sDddCreditsCameraPositions, sDddCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_SL_OUTSIDE, sSlCreditsCameraPositions, sSlCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_WDW_MAIN, sWdwCreditsCameraPositions, sWdwCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_TTM_OUTSIDE, sTtmCreditsCameraPositions, sTtmCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_THI_HUGE, sThiHugeCreditsCameraPositions, sThiHugeCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_TTC, sTtcCreditsCameraPositions, sTtcCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_RR, sRrCreditsCameraPositions, sRrCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_SA, sSaCreditsCameraPositions, sSaCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_COTMC, sCotmcCreditsCameraPositions, sCotmcCreditsCameraFocus);
        SET_CREDITS_PRESET(AREA_DDD_SUB, sDddSubCreditsCameraPositions, sDddSubCreditsCameraFocus);
        case AREA_CCM_OUTSIDE:
            if (save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1) & 0x10) {
                pos = sCcmOutsideCreditsCameraPositions;
                focus = sCcmOutsideCreditsCameraFocus;
            } else {
                pos = sCcmOutsideCreditsCameraPositions;
                focus = sCcmOutsideCreditsCameraFocus;
            }
            break;
        default:
            pos = sCcmOutsideCreditsCameraPositions;
            focus = sCcmOutsideCreditsCameraFocus;
    }

#undef SET_CREDITS_PRESET

    func_8028FBD8(D_8033B4E0, pos);
    func_8028FBD8(D_8033B5E0, focus);
    move_point_along_spline(c->pos, D_8033B4E0, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_point_along_spline(c->focus, D_8033B5E0, &sCutsceneSplineSegment, &sCutsceneSplineSegmentProgress);
    move_credits_camera(c, -0x2000, 0x2000, -0x4000, 0x4000);
}

CmdRet CutsceneSlidingDoorsOpen0_1(struct LevelCamera *c) {
    f32 dist;
    s16 pitch, yaw;

    vec3f_get_dist_and_angle(sMarioStatusForCamera->pos, c->pos, &dist, &pitch, &yaw);

    if (dist < 500.f) {
        dist = 500.f;
        yaw = sMarioStatusForCamera->faceAngle[1] + 0x8800;
        pitch = 0x800;
    }

    vec3f_set_dist_and_angle(sMarioStatusForCamera->pos, c->pos, dist, pitch, yaw);
}

CmdRet CutsceneSlidingDoorsOpen0_2(UNUSED struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[1].unk4, sMarioStatusForCamera->pos);
    vec3s_copy(D_8033B6F0[0].unk1C, sMarioStatusForCamera->faceAngle);
    vec3f_set(D_8033B6F0[0].unk4, 80.f, 325.f, 200.f);
}

CmdRet CutsceneSlidingDoorsOpen0_3(UNUSED struct LevelCamera *c) {
    camera_approach_f32_symmetric_bool(&D_8033B6F0[0].unk4[1], 75.f, 10.f);
}

CmdRet CutsceneSlidingDoorsOpen0_4(UNUSED struct LevelCamera *c) {
    camera_approach_f32_symmetric_bool(&D_8033B6F0[0].unk4[1], 125.f, 10.f);
}

CmdRet CutsceneSlidingDoorsOpen0_5(struct LevelCamera *c) {
    Vec3f sp34;
    UNUSED u32 pad[4];

    vec3f_copy(sp34, c->pos);
    D_8033B6F0[1].unk4[0] = sMarioStatusForCamera->pos[0];
    D_8033B6F0[1].unk4[2] = sMarioStatusForCamera->pos[2];
    approach_f32_exponential_bool(&D_8033B6F0[0].unk4[0], 0, 0.1f);
    camera_approach_f32_symmetric_bool(&D_8033B6F0[0].unk4[2], 125.f, 50.f);
    approach_vec3s_exponential(D_8033B6F0[0].unk1C, sMarioStatusForCamera->faceAngle, 16, 16, 16);
    set_pos_from_face_angle_and_vec3f(sp34, D_8033B6F0[1].unk4, D_8033B6F0[0].unk4,
                                      D_8033B6F0[0].unk1C);
    approach_vec3f_exponential(c->pos, sp34, 0.15f, 0.05f, 0.15f);
    set_focus_position(c, 0, 125.f, 0, 0);
}

CmdRet CutsceneSlidingDoorsOpen0(struct LevelCamera *c) {
    UNUSED u32 pad[2];

    func_8028FEDC(c);
    call_cutscene_func_in_time_range(CutsceneSlidingDoorsOpen0_1, c, 0, 8);
    call_cutscene_func_in_time_range(CutsceneSlidingDoorsOpen0_2, c, 8, 8);
    call_cutscene_func_in_time_range(CutsceneSlidingDoorsOpen0_3, c, 8, 28);
    call_cutscene_func_in_time_range(CutsceneSlidingDoorsOpen0_4, c, 29, -1);
    call_cutscene_func_in_time_range(CutsceneSlidingDoorsOpen0_5, c, 8, -1);
}

CmdRet CutsceneDoubleDoorsOpen1(struct LevelCamera *c) {
    func_80290514(c);
    c->cutscene = 0;
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
}

CmdRet CutsceneEnterPainting0_1(UNUSED struct LevelCamera *c) {
}

CmdRet CutsceneEnterPainting0(struct LevelCamera *c) {
    struct Surface *floor, *highFloor;
    Vec3f sp44, sp38, sp2C;
    Vec3s sp24;
    f32 floorHeight;

    call_cutscene_func_in_time_range(CutsceneEnterPainting0_1, c, 0, 0);
    set_fov_function(6);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;

    if (ripplingPainting != NULL) {
        sp24[0] = 0;
        sp24[1] = (ripplingPainting->vYRotation / 360.f) * 65536.f; // convert degrees to IAU
        sp24[2] = 0;

        sp2C[0] = ripplingPainting->vSize / 2.0f;
        sp2C[1] = sp2C[0];
        sp2C[2] = 0;

        sp44[0] = ripplingPainting->vXPos;
        sp44[1] = ripplingPainting->vYPos;
        sp44[2] = ripplingPainting->vZPos;

        set_pos_from_face_angle_and_vec3f(sp38, sp44, sp2C, sp24);
        approach_vec3f_exponential(c->focus, sp38, 0.1f, 0.1f, 0.1f);
        sp2C[2] = -(((ripplingPainting->vSize * 1000.f) / 2.0f) / 307.f);
        set_pos_from_face_angle_and_vec3f(sp38, sp44, sp2C, sp24);
        floorHeight = find_floor(sp38[0], sp38[1] + 500.f, sp38[2], &highFloor) + 125.f;

        if (sp38[1] < floorHeight) {
            sp38[1] = floorHeight;
        }

        if (c->cutscene == CUTSCENE_ENTER_PAINTING) {
            approach_vec3f_exponential(c->pos, sp38, 0.2f, 0.1f, 0.2f);
        } else {
            approach_vec3f_exponential(c->pos, sp38, 0.9f, 0.9f, 0.9f);
        }

        find_floor(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 50.f,
                   sMarioStatusForCamera->pos[2], &floor);

        if ((floor->type < SURFACE_PAINTING_WOBBLE_A6) || (floor->type > SURFACE_PAINTING_WARP_F9)) {
            c->cutscene = 0;
            gCutsceneTimer = 0x8000;
            gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
        }
    }
    c->currPreset = CAMERA_PRESET_CLOSE;
}

CmdRet CutsceneExitPainting80298094(struct LevelCamera *c) {
    struct Surface *floor;
    f32 floorHeight;

    vec3f_set(D_8033B6F0[2].unk4, 258.f, -352.f, 1189.f);
    vec3f_set(D_8033B6F0[1].unk4, 65.f, -155.f, 444.f);

    if (gPrevLevel == LEVEL_TTM) {
        D_8033B6F0[1].unk4[1] = 0.f;
        D_8033B6F0[1].unk4[2] = 0.f;
    }
    vec3f_copy(D_8033B6F0[0].unk4, sMarioStatusForCamera->pos);
    D_8033B6F0[0].unk1C[0] = 0;
    D_8033B6F0[0].unk1C[1] = sMarioStatusForCamera->faceAngle[1];
    D_8033B6F0[0].unk1C[2] = 0;
    set_pos_from_face_angle_and_vec3f(c->focus, D_8033B6F0[0].unk4, D_8033B6F0[1].unk4,
                                      D_8033B6F0[0].unk1C);
    set_pos_from_face_angle_and_vec3f(c->pos, D_8033B6F0[0].unk4, D_8033B6F0[2].unk4,
                                      D_8033B6F0[0].unk1C);
    floorHeight = find_floor(c->pos[0], c->pos[1] + 10.f, c->pos[2], &floor);

    if (floorHeight != -11000.f) {
        if (c->pos[1] < (floorHeight += 60.f)) {
            c->pos[1] = floorHeight;
        }
    }
}

CmdRet CutsceneExitPainting80298230(struct LevelCamera *c) {
    Vec3f sp1C;

    approach_f32_exponential_bool(&D_8033B6F0[2].unk4[0], 178.f, 0.05f);
    approach_f32_exponential_bool(&D_8033B6F0[2].unk4[2], 889.f, 0.05f);
    set_pos_from_face_angle_and_vec3f(sp1C, D_8033B6F0[0].unk4, D_8033B6F0[2].unk4,
                                      D_8033B6F0[0].unk1C);
    c->pos[0] = sp1C[0];
    c->pos[2] = sp1C[2];
}

CmdRet CutsceneExitPainting802982CC(struct LevelCamera *c) {
    struct Surface *floor;
    Vec3f floorHeight;

    vec3f_copy(floorHeight, sMarioStatusForCamera->pos);
    floorHeight[1] = find_floor(sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 10.f,
                                sMarioStatusForCamera->pos[2], &floor);

    if (floor != NULL) {
        floorHeight[1] =
            floorHeight[1] + (sMarioStatusForCamera->pos[1] - floorHeight[1]) * 0.7f + 125.f;
        approach_vec3f_exponential(c->focus, floorHeight, 0.2f, 0.2f, 0.2f);

        if (floorHeight[1] < c->pos[1]) {
            approach_f32_exponential_bool(&c->pos[1], floorHeight[1], 0.05f);
        }
    }
}

CmdRet CutsceneExitPainting0(struct LevelCamera *c) {
    call_cutscene_func_in_time_range(CutsceneExitPainting80298094, c, 0, 0);
    call_cutscene_func_in_time_range(CutsceneExitPainting80298230, c, 5, -1);
    call_cutscene_func_in_time_range(CutsceneExitPainting802982CC, c, 5, -1);

    if (gPrevLevel == LEVEL_TTM) {
        vec3f_set(c->pos, -296.f, 1261.f, 3521.f);
    }

    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet Cutscene11Todo_0(struct LevelCamera *c) {
    UNUSED Vec3f sp3C;
    UNUSED Vec3s sp34;
    Vec3f sp28;
    Vec3s sp20;

    vec3f_set(sp28, 200.f, 300.f, 200.f);
    vec3s_set(sp20, 0, sMarioStatusForCamera->faceAngle[1], 0);
    set_pos_from_face_angle_and_vec3f(c->pos, sMarioStatusForCamera->pos, sp28, sp20);
    set_focus_position(c, 0.f, 125.f, 0.f, 0);
}

CmdRet Cutscene11Todo_1(struct LevelCamera *c) {
    Vec3f sp24;

    vec3f_set(sp24, sMarioStatusForCamera->pos[0], sMarioStatusForCamera->pos[1] + 125.f,
              sMarioStatusForCamera->pos[2]);
    set_focus_position(c, 0.f, 125.f, 0.f, 0);
    approach_vec3f_exponential(c->focus, sp24, 0.02f, 0.001f, 0.02f);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneExitPainting1(struct LevelCamera *c) {
    c->currPreset = CAMERA_PRESET_CLOSE;
    c->cutscene = 0;
    gCutsceneTimer = 0x8000;
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_1;
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneEnterCannon2(struct LevelCamera *c) {
    gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCameraFlags2 |= CAM_FLAG_2_UNKNOWN_1;
    c->currPreset = CAMERA_PRESET_INSIDE_CANNON;
    c->cutscene = 0;
    D_8033B410 = 800.f;
}

CmdRet CutsceneEnterCannon1(struct LevelCamera *c) {
    struct Object *o;
    UNUSED u32 pad[2];
    f32 floorHeight;
    struct Surface *floor;
    Vec3f pitch;
    Vec3s yaw;

    call_cutscene_func_in_time_range(CutsceneEnterSomething8029041C, c, 70, 70);
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    camera_approach_s16_symmetric_bool(&D_8033B6F0[1].unk1C[0], 0, 0x80);
    camera_approach_s16_symmetric_bool(&D_8033B6F0[2].unk1C[0], 0, 0x80);
    vec3f_set_dist_and_angle(D_8033B6F0[0].unk4, c->pos, D_8033B6F0[1].unk4[2], D_8033B6F0[1].unk1C[0],
                             D_8033B6F0[1].unk1C[1]);
    D_8033B6F0[1].unk4[2] = approach_f32(D_8033B6F0[1].unk4[2], 400.f, 5.f, 5.f);
    D_8033B6F0[1].unk1C[1] += 0x40;
    D_8033B6F0[3].unk4[1] += 2.f;
    c->pos[1] += D_8033B6F0[3].unk4[1];

    if ((o = sMarioStatusForCamera->usedObj) != NULL) {
        D_8033B6F0[0].unk4[1] = o->oPosY;
        yaw[0] = o->oMoveAnglePitch;
        yaw[1] = o->oMoveAngleYaw;
        yaw[2] = o->oMoveAngleRoll;
        c->focus[0] = o->oPosX;
        c->focus[1] = o->oPosY;
        c->focus[2] = o->oPosZ;
        pitch[0] = 0.f;
        pitch[1] = 100.f;
        pitch[2] = 0.f;
        set_pos_from_face_angle_and_vec3f(c->focus, c->focus, pitch, yaw);
    }

    floorHeight = find_floor(c->pos[0], c->pos[1] + 500.f, c->pos[2], &floor) + 100.f;

    if (c->pos[1] < floorHeight) {
        c->pos[1] = floorHeight;
    }
}

CmdRet CutsceneEnterCannon0(struct LevelCamera *c) {
    UNUSED u32 pad[2];
    struct Object *o;

    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    sMarioStatusForCamera->unk1C[1] = 0;

    if ((o = sMarioStatusForCamera->usedObj) != NULL) {
        D_8033B6F0[0].unk4[0] = o->oPosX;
        D_8033B6F0[0].unk4[1] = o->oPosY;
        D_8033B6F0[0].unk4[2] = o->oPosZ;
        D_8033B6F0[0].unk1C[0] = o->oMoveAnglePitch;
        D_8033B6F0[0].unk1C[1] = o->oMoveAngleYaw;
        D_8033B6F0[0].unk1C[2] = o->oMoveAngleRoll;
    }

    vec3f_get_dist_and_angle(D_8033B6F0[0].unk4, c->pos, &D_8033B6F0[1].unk4[2],
                             &D_8033B6F0[1].unk1C[0], &D_8033B6F0[1].unk1C[1]);
    D_8033B6F0[3].unk4[1] = 0.f;
    D_8033B6F0[4].unk4[1] = 0.f;
}

CmdRet CutsceneDoor0(struct LevelCamera *c) {
    vec3f_copy(D_8033B6F0[0].unk4, c->pos);
    vec3f_copy(D_8033B6F0[1].unk4, c->focus);
}

CmdRet CutsceneDoor1(struct LevelCamera *c) {
    vec3f_copy(c->pos, D_8033B6F0[0].unk4);
    vec3f_copy(c->focus, D_8033B6F0[1].unk4);
}

CmdRet CutsceneDoorWarp1(struct LevelCamera *c) {
    if ((sMarioStatusForCamera->action != ACT_PULLING_DOOR)
        & (sMarioStatusForCamera->action != ACT_PUSHING_DOOR)) //! bitwise AND instead of boolean
    {
        gCutsceneTimer = 0x8000;
        c->cutscene = 0;
    }
}

CmdRet CutsceneDoor2(struct LevelCamera *c) {
    Vec3f sp24;
    s16 sp22;

    func_8028FEDC(c);
    determine_pushing_or_pulling_door(&sp22);
    set_focus_position(c, 0.f, 125.f, 0.f, 0);
    vec3s_set(D_8033B6F0[0].unk1C, 0, sMarioStatusForCamera->faceAngle[1] + sp22, 0);
    vec3f_set(sp24, 0.f, 125.f, 250.f);

    if (sp22 == 0) { //! useless code
        sp24[0] = 0.f;
    } else {
        sp24[0] = 0.f;
    }

    set_pos_from_face_angle_and_vec3f(c->pos, sMarioStatusForCamera->pos, sp24, D_8033B6F0[0].unk1C);
}

CmdRet CutsceneDoor3(struct LevelCamera *c) {
    s16 pitch, yaw;
    f32 dist;

    set_focus_position(c, 0.f, 125.f, 0.f, 0);
    vec3f_get_dist_and_angle(c->focus, c->pos, &dist, &pitch, &yaw);
    camera_approach_f32_symmetric_bool(&dist, 150.f, 7.f);
    vec3f_set_dist_and_angle(c->focus, c->pos, dist, pitch, yaw);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneDoor4(struct LevelCamera *c) {
    if (c->defPreset == CAMERA_PRESET_FREE_ROAM) {
        c->currPreset = CAMERA_PRESET_FREE_ROAM;
    } else {
        c->currPreset = CAMERA_PRESET_CLOSE;
    }

    c->cutscene = 0;
    gCutsceneTimer = 0x8000;
    gCameraFlags2 |= CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCameraFlags2 &= ~CAM_FLAG_2_UNKNOWN_1;
    func_80290514(c);
    set_cam_yaw_from_focus_and_pos(c);
}

CmdRet CutsceneDoorAB_2(struct LevelCamera *c) {
    UNUSED u32 pad[2];

    func_8028FEDC(c);
    level_specific_camera_update(c);

    if (c->currPreset == CAMERA_PRESET_FIXED_REF_POINT) {
        c->storedYaw = return_fixed_camera_yaw(c, c->focus, c->pos);
    }
    if (c->currPreset == CAMERA_PRESET_PARALLEL_TRACKING) {
        c->storedYaw = return_parallel_tracking_camera_yaw(c, c->focus, c->pos);
    }

    c->trueYaw = c->storedYaw;

    if ((sMarioStatusForCamera->action != ACT_ENTERING_STAR_DOOR)
        && (sMarioStatusForCamera->action != ACT_PULLING_DOOR)
        && (sMarioStatusForCamera->action != ACT_PUSHING_DOOR)) {
        gCutsceneTimer = 0x8000;
        c->cutscene = 0;
    }
}

// Cutscene Tables
struct CutsceneTableEntry TableCutscenePeachEnd[12] = {
    { CutscenePeachEnd0, 170 }, { CutscenePeachEnd1, 70 },    { CutscenePeachEnd2, 75 },
    { CutscenePeachEnd3, 386 }, { CutscenePeachEnd4, 139 },   { CutscenePeachEnd5, 590 },
    { CutscenePeachEnd6, 95 },  { CutscenePeachEnd7, 425 },   { CutscenePeachEnd8, 236 },
    { CutscenePeachEnd9, 245 }, { CutscenePeachEndA, 32767 }, { CutscenePeachEndB, 0 }
};

struct CutsceneTableEntry TableCutsceneGrandStar[2] = { { CutsceneGrandStar0, 360 },
                                                        { CutsceneGrandStar1, 32767 } };

struct CutsceneTableEntry TableCutscene0FTodo[2] = { { Cutscene0FTodo0, 1 },
                                                     { Cutscene0FTodo1, 32767 } };

struct CutsceneTableEntry TableCutsceneDoorWarp[2] = { { CutsceneDoor0, 1 },
                                                       { CutsceneDoorWarp1, 32767 } };

struct CutsceneTableEntry TableCutsceneEndWaving[1] = { { CutsceneEndWaving0, 32767 } };

struct CutsceneTableEntry TableCutsceneCredits[1] = { { CutsceneCredits0, 32767 } };

struct CutsceneTableEntry TableCutsceneDoor00[5] = { { CutsceneDoor0, 1 },
                                                     { CutsceneDoor1, 30 },
                                                     { CutsceneDoor2, 1 },
                                                     { CutsceneDoor3, 50 },
                                                     { CutsceneDoor4, 0 } };

struct CutsceneTableEntry TableCutsceneDoor01[5] = { { CutsceneDoor0, 1 },
                                                     { CutsceneDoor1, 20 },
                                                     { CutsceneDoor2, 1 },
                                                     { CutsceneDoor3, 50 },
                                                     { CutsceneDoor4, 0 } };

struct CutsceneTableEntry TableCutsceneDoor0A[3] = { { CutsceneDoor0, 1 },
                                                     { CutsceneDoor1, 30 },
                                                     { CutsceneDoorAB_2, 32767 } };

struct CutsceneTableEntry TableCutsceneDoor0B[3] = { { CutsceneDoor0, 1 },
                                                     { CutsceneDoor1, 20 },
                                                     { CutsceneDoorAB_2, 32767 } };

struct CutsceneTableEntry TableCutsceneEnterCannon[3] = { { CutsceneEnterCannon0, 1 },
                                                          { CutsceneEnterCannon1, 121 },
                                                          { CutsceneEnterCannon2, 0 } };

struct CutsceneTableEntry TableCutsceneStarSpawn[3] = { { CutsceneStarSpawn0, 32767 },
                                                        { CutsceneStarSpawn1, 15 },
                                                        { CutsceneStarSpawn2, 0 } };

struct CutsceneTableEntry TableCutsceneSpecialStarSpawn[2] = { { CutsceneSpecialStarSpawn0, 32767 },
                                                               { CutsceneSpecialStarSpawn1, 0 } };

struct CutsceneTableEntry TableCutsceneEnterPainting[1] = { { CutsceneEnterPainting0, 32767 } };

struct CutsceneTableEntry TableCutsceneDeathExit[2] = { { CutsceneExitPainting0, 118 },
                                                        { CutsceneExitPainting1, 0 } };

struct CutsceneTableEntry TableCutsceneExitPaintingSuccess[2] = { { CutsceneExitPainting0, 180 },
                                                                  { CutsceneExitPainting1, 0 } };

struct CutsceneTableEntry TableCutscene11Todo[3] = { { Cutscene11Todo_0, 1 },
                                                     { Cutscene11Todo_1, 60 },
                                                     { CutsceneExitPainting1, 0 } };

struct CutsceneTableEntry TableCutsceneIntroPeach[5] = { { CutsceneIntroPeach0, 32767 },
                                                         { CutsceneIntroPeach1, 35 },
                                                         { CutsceneIntroPeach2, 820 },
                                                         { CutsceneIntroPeach3, 270 },
                                                         { CutsceneIntroPeach4, 32767 } };

struct CutsceneTableEntry TableCutscenePrepareCannon[2] = { { CutscenePrepareCannon0, 170 },
                                                            { CutscenePrepareCannon1, 0 } };

struct CutsceneTableEntry TableCutsceneExitWaterfall[2] = { { CutsceneExitWaterfall0, 52 },
                                                            { CutsceneFallCommon1, 0 } };

struct CutsceneTableEntry TableCutsceneFallToCastleGrounds[2] = { { CutsceneFallToCastleGrounds0, 73 },
                                                                  { CutsceneFallCommon1, 0 } };

struct CutsceneTableEntry TableCutsceneEnterPyramidTop[2] = { { CutsceneEnterPyramidTop0, 90 },
                                                              { CutsceneFallCommon1, 0 } };

struct CutsceneTableEntry TableCutscene26Todo[3] = { { Cutscene26Todo0, 32767 },
                                                     { Cutscene26Todo1, 150 },
                                                     { Cutscene26Todo2, 0 } };

struct CutsceneTableEntry TableCutsceneStandingDeath[1] = { { CutsceneDeath1, 32767 } };

struct CutsceneTableEntry TableCutsceneEnterPool[2] = { { CutsceneEnterPool0, 100 },
                                                        { CutsceneFallCommon1, 0 } };

struct CutsceneTableEntry TableCutsceneDeath2[1] = { { CutsceneDeath2, 32767 } };

struct CutsceneTableEntry TableCutsceneDeathOnBack[1] = { { CutsceneBBHDeath0, 32767 } };

struct CutsceneTableEntry TableCutsceneQuicksandDeath[2] = { { CutsceneQuicksandDeath0, 32767 },
                                                             { CutsceneQuicksandDeath0, 32767 } };

struct CutsceneTableEntry TableCutsceneSuffocationDeath[1] = { { Cutscene1ATodo0, 32767 } };

struct CutsceneTableEntry TableCutsceneEnterBowserPlatform[3] = { { CutsceneEnterBowserPlatform0, 180 },
                                                                  { CutsceneEnterBowserPlatform1,
                                                                    32767 },
                                                                  { CutsceneEnterBowserPlatform2, 0 } };

struct CutsceneTableEntry TableCutsceneStarDance1[1] = { { CutsceneStarDance1, 32767 } };

struct CutsceneTableEntry TableCutsceneStarDance2[1] = { { CutsceneStarDance2, 32767 } };

struct CutsceneTableEntry TableCutsceneStarDance3[1] = { { CutsceneStarDance3, 32767 } };

struct CutsceneTableEntry TableCutsceneKeyDance[1] = { { CutsceneKeyDance0, 32767 } };

struct CutsceneTableEntry TableCutsceneCapSwitchPress[1] = { { CutsceneCapSwitchPress0, 32767 } };

struct CutsceneTableEntry TableCutsceneSlidingDoorsOpen[2] = { { CutsceneSlidingDoorsOpen0, 50 },
                                                               { CutsceneDoubleDoorsOpen1, 0 } };

struct CutsceneTableEntry TableCutsceneUnlockKeyDoor[2] = { { CutsceneUnlockKeyDoor0, 200 },
                                                            { CutsceneDoubleDoorsOpen1, 0 } };

struct CutsceneTableEntry TableCutsceneExitBowserSuccess[2] = { { CutsceneExitBowserSuccess0, 190 },
                                                                { CutsceneExitNonPainting1, 0 } };

struct CutsceneTableEntry TableCutscene1CTodo[2] = { { Cutscene1CTodo_0, 120 },
                                                     { CutsceneExitNonPainting1, 0 } };

struct CutsceneTableEntry TableCutsceneBBHExitSuccess[2] = { { CutsceneBBHExitSuccess0, 163 },
                                                             { CutsceneExitNonPainting1, 0 } };

struct CutsceneTableEntry TableCutsceneNonPaintingDeath[2] = { { CutsceneNonPaintingDeath0, 120 },
                                                               { CutsceneExitNonPainting1, 0 } };

struct CutsceneTableEntry TableCutsceneDialog[3] = { { CutsceneDialog0, 32767 },
                                                     { CutsceneDialog1, 12 },
                                                     { CutsceneDialog2, 0 } };

struct CutsceneTableEntry TableCutsceneReadMessage[3] = { { CutsceneReadMessage0, 32767 },
                                                          { CutsceneReadMessage1, 15 },
                                                          { CutsceneReadMessage2, 0 } };

#define DEFINE_COURSE(_0, i1, i2, i3, i4) { i1, i2, i3, i4 },
#define DEFINE_COURSES_END()
#define DEFINE_BONUS_COURSE(_0, i1, i2, i3, i4) { i1, i2, i3, i4 },

u8 D_8032E8A4[27][4] = {
    { 0x44, 0x44, 0x44, 0x04 }, // (0) Course Hub (Castle Grounds)
    #include "levels/course_defines.h"
    { 0x44, 0x44, 0x44, 0x04 } // an extra course, hmm...
};
#undef DEFINE_COURSE
#undef DEFINE_COURSES_END
#undef DEFINE_BONUS_COURSE

/**
 * These masks set whether or not the camera zooms out when game is paused.
 *
 * Each entry is used by two levels. Even levels use the low 4 bits, odd levels use the high 4 bits
 * Because areas are 1-indexed, a mask of 0x1 will make area 1 (not area 0) zoom out.
 *
 * In zoom_out_if_paused_and_outside(), the current area is converted to a shift.
 * Then the value of (1 << shift) is &'d with the level's mask,
 * and if the result is non-zero, the camera will zoom out.
 */
u8 zoomOutAreaMasks[20] = {
    ZOOMOUT_AREA_MASK(0,0,0,0, 0,0,0,0), // Unused         | Unused
    ZOOMOUT_AREA_MASK(0,0,0,0, 0,0,0,0), // Unused         | Unused
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,0,0,0), // BBH            | CCM
    ZOOMOUT_AREA_MASK(0,0,0,0, 0,0,0,0), // CASTLE_INSIDE  | HMC
    ZOOMOUT_AREA_MASK(1,0,0,0, 1,0,0,0), // SSL            | BOB
    ZOOMOUT_AREA_MASK(1,0,0,0, 1,0,0,0), // SL             | WDW
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,1,0,0), // JRB            | THI
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,0,0,0), // TTC            | RR
    ZOOMOUT_AREA_MASK(1,0,0,0, 1,0,0,0), // CASTLE_GROUNDS | BITDW
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,0,0,0), // VCUTM          | BITFS
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,0,0,0), // SA             | BITS
    ZOOMOUT_AREA_MASK(1,0,0,0, 0,0,0,0), // LLL            | DDD
    ZOOMOUT_AREA_MASK(1,0,0,0, 0,0,0,0), // WF             | ENDING
    ZOOMOUT_AREA_MASK(0,0,0,0, 0,0,0,0), // COURTYARD      | PSS
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,0,0,0), // COTMC          | TOTWC
    ZOOMOUT_AREA_MASK(1,0,0,0, 1,0,0,0), // BOWSER_1       | WMOTR
    ZOOMOUT_AREA_MASK(0,0,0,0, 1,0,0,0), // Unused         | BOWSER_2
    ZOOMOUT_AREA_MASK(1,0,0,0, 0,0,0,0), // BOWSER_3       | Unused
    ZOOMOUT_AREA_MASK(1,0,0,0, 0,0,0,0), // TTM            | Unused
    ZOOMOUT_AREA_MASK(0,0,0,0, 0,0,0,0), // Unused         | Unused
};

struct CutsceneSplinePoint sBobCreditsCameraPositions[5] = { { 1, 0, { 5984, 3255, 4975 } },
                                                              { 2, 0, { 4423, 3315, 1888 } },
                                                              { 3, 0, { 776, 2740, -1825 } },
                                                              { 4, 0, { -146, 3894, -3167 } },
                                                              { -1, 0, { 741, 4387, -5474 } } };

struct CutsceneSplinePoint sBobCreditsCameraFocus[5] = { { 0, 30, { 5817, 3306, 4507 } },
                                                          { 0, 40, { 4025, 3378, 1593 } },
                                                          { 0, 50, { 1088, 2652, -2205 } },
                                                          { 0, 60, { 205, 3959, -3517 } },
                                                          { -1, 60, { 1231, 4400, -5649 } } };

struct CutsceneSplinePoint sWfCreditsCameraPositions[5] = { { 0, 0, { -301, 1399, 2643 } },
                                                             { 0, 0, { -182, 2374, 4572 } },
                                                             { 0, 0, { 4696, 3864, 413 } },
                                                             { 0, 0, { 1738, 4891, -1516 } },
                                                             { -1, 0, { 1783, 4891, -1516 } } };

struct CutsceneSplinePoint sWfCreditsCameraFocus[5] = { { 1, 30, { -249, 1484, 2153 } },
                                                         { 2, 40, { -200, 2470, 4082 } },
                                                         { 3, 40, { 4200, 3916, 370 } },
                                                         { 4, 40, { 1523, 4976, -1072 } },
                                                         { -1, 40, { 1523, 4976, -1072 } } };

struct CutsceneSplinePoint sJrbCreditsCameraPositions[5] = { { 0, 0, { 5538, -4272, 2376 } },
                                                              { 0, 0, { 5997, -3303, 2261 } },
                                                              { 0, 0, { 6345, -3255, 2179 } },
                                                              { 0, 0, { 6345, -3255, 2179 } },
                                                              { -1, 0, { 6694, -3203, 2116 } } };

struct CutsceneSplinePoint sJrbCreditsCameraFocus[5] = { { 0, 50, { 5261, -4683, 2443 } },
                                                          { 0, 50, { 5726, -3675, 2456 } },
                                                          { 0, 50, { 6268, -2817, 2409 } },
                                                          { 0, 50, { 6596, -2866, 2369 } },
                                                          { -1, 50, { 7186, -3153, 2041 } } };

struct CutsceneSplinePoint sCcmSlideCreditsCameraPositions[5] = { { 0, 0, { -6324, 6745, -5626 } },
                                                                   { 1, 0, { -6324, 6745, -5626 } },
                                                                   { 2, 0, { -6108, 6762, -5770 } },
                                                                   { 3, 0, { -5771, 6787, -5962 } },
                                                                   { -1, 0, { -5672, 6790, -5979 } } };

struct CutsceneSplinePoint sCcmSlideCreditsCameraFocus[5] = { { 0, 50, { -5911, 6758, -5908 } },
                                                               { 1, 50, { -5911, 6758, -5908 } },
                                                               { 2, 50, { -5652, 6814, -5968 } },
                                                               { 3, 50, { -5277, 6801, -6043 } },
                                                               { -1, 50, { -5179, 6804, -6060 } } };

struct CutsceneSplinePoint sBbhCreditsCameraPositions[4] = { { 1, 0, { 1088, 341, 2447 } },
                                                              { 2, 0, { 1338, 610, 2808 } },
                                                              { 3, 0, { 2267, 1612, 2966 } },
                                                              { -1, 0, { 2296, 1913, 2990 } } };

struct CutsceneSplinePoint sBbhCreditsCameraFocus[4] = { { 1, 50, { 1160, 263, 1958 } },
                                                          { 2, 50, { 1034, 472, 2436 } },
                                                          { 3, 50, { 1915, 1833, 2688 } },
                                                          { -1, 50, { 2134, 2316, 2742 } } };

struct CutsceneSplinePoint sHmcCreditsCameraPositions[5] = { { 1, 0, { -5952, 1807, -5882 } },
                                                              { 2, 0, { -5623, 1749, -4863 } },
                                                              { 3, 0, { -5472, 1955, -2520 } },
                                                              { 4, 0, { -5544, 1187, -1085 } },
                                                              { -1, 0, { -5547, 391, -721 } } };

struct CutsceneSplinePoint sHmcCreditsCameraFocus[5] = { { 1, 210, { -5952, 1884, -6376 } },
                                                          { 2, 58, { -5891, 1711, -5283 } },
                                                          { 3, 30, { -5595, 1699, -2108 } },
                                                          { 4, 31, { -5546, 794, -777 } },
                                                          { -1, 31, { -5548, -85, -572 } } };

struct CutsceneSplinePoint sThiWigglerCreditsCameraPositions[3] = { { 1, 0, { -1411, 2474, -1276 } },
                                                                     { 2, 0, { -1606, 2479, -434 } },
                                                                     { -1, 0, { -1170, 2122, 1337 } } };

struct CutsceneSplinePoint sThiWigglerCreditsCameraFocus[3] = { { 1, 50, { -1053, 2512, -928 } },
                                                                 { 2, 50, { -1234, 2377, -114 } },
                                                                 { -1, 50, { -758, 2147, 1054 } } };

struct CutsceneSplinePoint sVolcanoCreditsCameraPositions[6] = {
    { 0, 0, { -1445, 1094, 1617 } }, { 0, 0, { -1509, 649, 871 } },  { 0, 0, { -1133, 420, -248 } },
    { 0, 0, { -778, 359, -1052 } },  { 0, 0, { -565, 260, -1730 } }, { -1, 0, { 1274, 473, -275 } }
};

struct CutsceneSplinePoint sVolcanoCreditsCameraFocus[6] = {
    { 0, 50, { -1500, 757, 1251 } }, { 0, 50, { -1401, 439, 431 } },  { 0, 50, { -749, 270, -532 } },
    { 0, 50, { -396, 270, -1363 } }, { 0, 50, { -321, 143, -2151 } }, { -1, 50, { 1002, 460, -694 } }
};

struct CutsceneSplinePoint sSslCreditsCameraPositions[6] = {
    { 0, 0, { -4262, 4658, -5015 } }, { 0, 0, { -3274, 2963, -4661 } }, { 0, 0, { -2568, 812, -6528 } },
    { 0, 0, { -414, 660, -7232 } },   { 0, 0, { 1466, 660, -6898 } },   { -1, 0, { 2724, 660, -6298 } }
};

struct CutsceneSplinePoint sSslCreditsCameraFocus[6] = {
    { 0, 50, { -4083, 4277, -4745 } }, { 0, 50, { -2975, 2574, -4759 } },
    { 0, 50, { -2343, 736, -6088 } },  { 0, 50, { -535, 572, -6755 } },
    { 0, 50, { 1311, 597, -6427 } },   { -1, 50, { 2448, 612, -5884 } }
};

struct CutsceneSplinePoint sDddCreditsCameraPositions[7] = {
    { 0, 0, { -874, -4933, 366 } },   { 0, 0, { -1463, -4782, 963 } }, { 0, 0, { -1893, -4684, 1303 } },
    { 0, 0, { -2818, -4503, 1583 } }, { 0, 0, { -4095, -2924, 730 } }, { 0, 0, { -4737, -1594, -63 } },
    { -1, 0, { -4681, -1084, -623 } }
};

struct CutsceneSplinePoint sDddCreditsCameraFocus[7] = {
    { 0, 50, { -1276, -4683, 622 } },  { 0, 50, { -1858, -4407, 1097 } },
    { 0, 50, { -2324, -4332, 1318 } }, { 0, 50, { -3138, -4048, 1434 } },
    { 0, 50, { -4353, -2444, 533 } },  { 0, 50, { -4807, -1169, -436 } },
    { -1, 50, { -4665, -664, -1007 } }
};

struct CutsceneSplinePoint sSlCreditsCameraPositions[4] = { { 0, 0, { 939, 6654, 6196 } },
                                                             { 0, 0, { 1873, 5160, 3714 } },
                                                             { 0, 0, { 3120, 3564, 1314 } },
                                                             { -1, 0, { 2881, 4231, 573 } } };

struct CutsceneSplinePoint sSlCreditsCameraFocus[4] = { { 0, 50, { 875, 6411, 5763 } },
                                                         { 0, 50, { 1659, 4951, 3313 } },
                                                         { 0, 50, { 2630, 3565, 1215 } },
                                                         { -1, 50, { 2417, 4056, 639 } } };

struct CutsceneSplinePoint sWdwCreditsCameraPositions[4] = { { 0, 0, { 3927, 2573, 3685 } },
                                                              { 0, 0, { 2389, 2054, 1210 } },
                                                              { 0, 0, { 2309, 2069, 22 } },
                                                              { -1, 0, { 2122, 2271, -979 } } };

struct CutsceneSplinePoint sWdwCreditsCameraFocus[4] = { { 0, 50, { 3637, 2460, 3294 } },
                                                          { 0, 50, { 1984, 2067, 918 } },
                                                          { 0, 50, { 1941, 2255, -261 } },
                                                          { -1, 50, { 1779, 2587, -1158 } } };

struct CutsceneSplinePoint sTtmCreditsCameraPositions[6] = {
    { 0, 0, { 386, 2535, 644 } },    { 0, 0, { 1105, 2576, 918 } },   { 0, 0, { 3565, 2261, 2098 } },
    { 0, 0, { 6715, -2791, 4554 } }, { 0, 0, { 3917, -3130, 3656 } }, { -1, 0, { 3917, -3130, 3656 } }
};

struct CutsceneSplinePoint sTtmCreditsCameraFocus[6] = {
    { 1, 50, { 751, 2434, 318 } },    { 2, 50, { 768, 2382, 603 } },
    { 3, 60, { 3115, 2086, 1969 } },  { 4, 30, { 6370, -3108, 4727 } },
    { 5, 50, { 4172, -3385, 4001 } }, { -1, 50, { 4172, -3385, 4001 } }
};

struct CutsceneSplinePoint sThiHugeCreditsCameraPositions[7] = {
    { 0, 0, { 6990, -1000, -4858 } }, { 0, 0, { 7886, -1055, 2878 } }, { 0, 0, { 1952, -1481, 10920 } },
    { 0, 0, { -1684, -219, 2819 } },  { 0, 0, { -2427, -131, 2755 } }, { 0, 0, { -3246, 416, 3286 } },
    { -1, 0, { -3246, 416, 3286 } }
};

struct CutsceneSplinePoint sThiHugeCreditsCameraFocus[7] = {
    { 1, 70, { 7022, -965, -5356 } },  { 2, 40, { 7799, -915, 2405 } },
    { 3, 60, { 1878, -1137, 10568 } }, { 4, 50, { -1931, -308, 2394 } },
    { 5, 50, { -2066, -386, 2521 } },  { 6, 50, { -2875, 182, 3045 } },
    { -1, 50, { -2875, 182, 3045 } }
};

struct CutsceneSplinePoint sTtcCreditsCameraPositions[4] = { { 1, 0, { -1724, 277, -994 } },
                                                              { 2, 0, { -1720, 456, -995 } },
                                                              { 3, 0, { -1655, 810, -1014 } },
                                                              { -1, 0, { -1753, 883, -1009 } } };

struct CutsceneSplinePoint sTtcCreditsCameraFocus[4] = { { 1, 50, { -1554, 742, -1063 } },
                                                          { 2, 50, { -1245, 571, -1102 } },
                                                          { 3, 50, { -1220, 603, -1151 } },
                                                          { -1, 50, { -1412, 520, -1053 } } };

struct CutsceneSplinePoint sRrCreditsCameraPositions[4] = { { 0, 0, { -1818, 4036, 97 } },
                                                             { 0, 0, { -575, 3460, -505 } },
                                                             { 0, 0, { 1191, 3611, -1134 } },
                                                             { -1, 0, { 2701, 3777, -3686 } } };

struct CutsceneSplinePoint sRrCreditsCameraFocus[4] = { { 0, 50, { -1376, 3885, -81 } },
                                                         { 0, 50, { -146, 3343, -734 } },
                                                         { 0, 50, { 1570, 3446, -1415 } },
                                                         { -1, 50, { 2794, 3627, -3218 } } };

struct CutsceneSplinePoint sSaCreditsCameraPositions[5] = { { 0, 0, { -295, -396, -585 } },
                                                             { 1, 0, { -295, -396, -585 } },
                                                             { 2, 0, { -292, -856, -573 } },
                                                             { 3, 0, { -312, -856, -541 } },
                                                             { -1, 0, { 175, -856, -654 } } };

struct CutsceneSplinePoint sSaCreditsCameraFocus[5] = { { 0, 50, { -175, -594, -142 } },
                                                         { 1, 50, { -175, -594, -142 } },
                                                         { 2, 50, { -195, -956, -92 } },
                                                         { 3, 50, { -572, -956, -150 } },
                                                         { -1, 50, { -307, -956, -537 } } };

struct CutsceneSplinePoint sCotmcCreditsCameraPositions[5] = { { 0, 0, { -296, 495, 1607 } },
                                                                { 0, 0, { -430, 541, 654 } },
                                                                { 0, 0, { -466, 601, -359 } },
                                                                { 0, 0, { -217, 433, -1549 } },
                                                                { -1, 0, { -95, 366, -2922 } } };

struct CutsceneSplinePoint sCotmcCreditsCameraFocus[5] = { { 0, 50, { -176, 483, 2092 } },
                                                            { 0, 50, { -122, 392, 1019 } },
                                                            { 0, 50, { -268, 450, -792 } },
                                                            { 0, 50, { -172, 399, -2046 } },
                                                            { -1, 50, { -51, 355, -3420 } } };

struct CutsceneSplinePoint sDddSubCreditsCameraPositions[5] = { { 0, 0, { 4656, 2171, 5028 } },
                                                                 { 0, 0, { 4548, 1182, 4596 } },
                                                                 { 0, 0, { 5007, 813, 3257 } },
                                                                 { 0, 0, { 5681, 648, 1060 } },
                                                                 { -1, 0, { 4644, 774, 113 } } };

struct CutsceneSplinePoint sDddSubCreditsCameraFocus[5] = { { 0, 50, { 4512, 2183, 4549 } },
                                                             { 0, 50, { 4327, 838, 4308 } },
                                                             { 0, 50, { 4774, 749, 2819 } },
                                                             { 0, 50, { 5279, 660, 763 } },
                                                             { -1, 50, { 4194, 885, -75 } } };

struct CutsceneSplinePoint sCcmOutsideCreditsCameraPositions[4] = {
    { 1, 0, { 1427, -1387, 5409 } },
    { 2, 0, { -1646, -1536, 4526 } },
    { 3, 0, { -3852, -1448, 3913 } },
    { -1, 0, { -5199, -1366, 1886 } }
};

struct CutsceneSplinePoint sCcmOutsideCreditsCameraFocus[4] = { { 1, 50, { 958, -1481, 5262 } },
                                                                 { 2, 50, { -2123, -1600, 4391 } },
                                                                 { 3, 50, { -3957, -1401, 3426 } },
                                                                 { -1, 50, { -4730, -1215, 1795 } } };

void handle_cutscenes(struct LevelCamera *c) {
    UNUSED u32 pad[3];
    UNUSED s16 sp22;
    s16 sp20;
    u8 cutscene;

    sp22 = sYawFocToMario;
    cutscene = c->cutscene;
    gCameraFlags2 &= ~CAM_FLAG_2_SMOOTH_MOVEMENT;
    gCameraMovementFlags &= ~CAM_MOVE_INTO_C_UP;

#define CUTSCENE_TABLE_JUMP(casenum, table)                                                            \
    case casenum:                                                                                      \
        sp20 = table[D_8033B6EA].unk4;                                                                 \
        (table[D_8033B6EA].unk0)(c);                                                                   \
        break;

    switch (c->cutscene) {
        CUTSCENE_TABLE_JUMP(CUTSCENE_STAR_SPAWN, TableCutsceneStarSpawn)
        CUTSCENE_TABLE_JUMP(CUTSCENE_SPECIAL_STAR_SPAWN, TableCutsceneSpecialStarSpawn)
        CUTSCENE_TABLE_JUMP(CUTSCENE_PEACH_END, TableCutscenePeachEnd)
        CUTSCENE_TABLE_JUMP(CUTSCENE_GRAND_STAR, TableCutsceneGrandStar)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DOOR_WARP, TableCutsceneDoorWarp)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DOOR_0, TableCutsceneDoor00)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DOOR_1, TableCutsceneDoor01)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DOOR_A, TableCutsceneDoor0A)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DOOR_B, TableCutsceneDoor0B)
        CUTSCENE_TABLE_JUMP(CUTSCENE_ENTER_CANNON, TableCutsceneEnterCannon)
        CUTSCENE_TABLE_JUMP(CUTSCENE_ENTER_PAINTING, TableCutsceneEnterPainting)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DEATH_EXIT, TableCutsceneDeathExit)
        CUTSCENE_TABLE_JUMP(CUTSCENE_EXIT_PAINTING_SUCC, TableCutsceneExitPaintingSuccess)
        CUTSCENE_TABLE_JUMP(CUTSCENE_11_TODO, TableCutscene11Todo)
        CUTSCENE_TABLE_JUMP(CUTSCENE_INTRO_PEACH, TableCutsceneIntroPeach)
        CUTSCENE_TABLE_JUMP(CUTSCENE_ENTER_BOWSER_ARENA, TableCutsceneEnterBowserPlatform)
        CUTSCENE_TABLE_JUMP(CUTSCENE_STAR_DANCE_1_1, TableCutsceneStarDance1)
        CUTSCENE_TABLE_JUMP(CUTSCENE_STAR_DANCE_1_2, TableCutsceneStarDance1)
        CUTSCENE_TABLE_JUMP(CUTSCENE_STAR_DANCE_2, TableCutsceneStarDance2)
        CUTSCENE_TABLE_JUMP(CUTSCENE_STAR_DANCE_3, TableCutsceneStarDance3)
        CUTSCENE_TABLE_JUMP(CUTSCENE_KEY_DANCE, TableCutsceneKeyDance)
        CUTSCENE_TABLE_JUMP(CUTSCENE_0F_TODO, TableCutscene0FTodo)
        CUTSCENE_TABLE_JUMP(CUTSCENE_END_WAVING, TableCutsceneEndWaving)
        CUTSCENE_TABLE_JUMP(CUTSCENE_CREDITS, TableCutsceneCredits)
        CUTSCENE_TABLE_JUMP(CUTSCENE_CAP_SWITCH_PRESS, TableCutsceneCapSwitchPress)
        CUTSCENE_TABLE_JUMP(CUTSCENE_SLIDING_DOORS_OPEN, TableCutsceneSlidingDoorsOpen)
        CUTSCENE_TABLE_JUMP(CUTSCENE_PREPARE_CANNON, TableCutscenePrepareCannon)
        CUTSCENE_TABLE_JUMP(CUTSCENE_UNLOCK_KEY_DOOR, TableCutsceneUnlockKeyDoor)
        CUTSCENE_TABLE_JUMP(CUTSCENE_STANDING_DEATH, TableCutsceneStandingDeath)
        CUTSCENE_TABLE_JUMP(CUTSCENE_ENTER_POOL, TableCutsceneEnterPool)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DEATH_2, TableCutsceneDeath2)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DEATH_ON_BACK, TableCutsceneDeathOnBack)
        CUTSCENE_TABLE_JUMP(CUTSCENE_QUICKSAND_DEATH, TableCutsceneQuicksandDeath)
        CUTSCENE_TABLE_JUMP(CUTSCENE_SUFFOCATION_DEATH, TableCutsceneSuffocationDeath)
        CUTSCENE_TABLE_JUMP(CUTSCENE_EXIT_BOWSER_SUCC, TableCutsceneExitBowserSuccess)
        CUTSCENE_TABLE_JUMP(CUTSCENE_1C_TODO, TableCutscene1CTodo)
        CUTSCENE_TABLE_JUMP(CUTSCENE_EXIT_BBH_SUCC, TableCutsceneBBHExitSuccess)
        CUTSCENE_TABLE_JUMP(CUTSCENE_EXIT_WATERFALL, TableCutsceneExitWaterfall)
        CUTSCENE_TABLE_JUMP(CUTSCENE_EXIT_FALL_WMOTR, TableCutsceneFallToCastleGrounds)
        CUTSCENE_TABLE_JUMP(CUTSCENE_NONPAINTING_DEATH, TableCutsceneNonPaintingDeath)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DIALOG_1, TableCutsceneDialog)
        CUTSCENE_TABLE_JUMP(CUTSCENE_READ_MESSAGE, TableCutsceneReadMessage)
        CUTSCENE_TABLE_JUMP(CUTSCENE_DIALOG_2, TableCutsceneDialog)
        CUTSCENE_TABLE_JUMP(CUTSCENE_ENTER_PYRAMID_TOP, TableCutsceneEnterPyramidTop)
        CUTSCENE_TABLE_JUMP(CUTSCENE_26_TODO, TableCutscene26Todo)
    }

#undef CUTSCENE_TABLE_JUMP

    if ((sp20 != 0) && ((gCutsceneTimer & 0x8000) == 0)) {
        if (gCutsceneTimer < 0x3FFF) {
            gCutsceneTimer += 1;
        }
        if (gCutsceneTimer == sp20) {
            D_8033B6EA += 1;
            gCutsceneTimer = 0;
        }
    } else {
        sMarioStatusForCamera->unk1C[1] = 0;
        D_8033B6EA = 0;
        gCutsceneTimer = 0;
    }

    D_8033B3EC = 0;

    if ((c->cutscene == 0) && (cutscene != 0)) {
        gCutsceneNumber = cutscene;
    }
}

s32 call_cutscene_func_in_time_range(CameraCommandProc func, struct LevelCamera *c, s16 start,
                                     s16 end) {
    if (start <= gCutsceneTimer) {
        if ((end == -1) || (end >= gCutsceneTimer)) {
            func(c);
        }
    }
    return 0;
}

s32 set_cutscene_phase_at_frame(s32 phase, s16 frame) {
    if (frame == gCutsceneTimer) {
        sCutscenePhase = phase;
    }
    return 0;
}

void func_80299C98(s16 a, s16 b, s16 c) {
    if (a > D_8033B230.unk10) {
        D_8033B230.unk10 = a;
        D_8033B230.unk18 = b;
        D_8033B230.unk16 = c;
    }
}

void func_80299D00(s16 a, s16 b, s16 c, f32 d, f32 e, f32 f, f32 g) {
    a = func_80289738(a, d, e, f, g);

    if (a != 0) {
        if (a > D_8033B230.unk10) // literally use the function above you silly nintendo, smh
        {
            D_8033B230.unk10 = a;
            D_8033B230.unk18 = b;
            D_8033B230.unk16 = c;
        }
    }
}

void func_80299DB4(struct GraphNodePerspective *a) {
    if (D_8033B230.unk10 != 0.f) {
        D_8033B230.unk8 = coss(D_8033B230.unk14) * D_8033B230.unk10 / 256;
        D_8033B230.unk14 += D_8033B230.unk16;
        camera_approach_f32_symmetric_bool(&D_8033B230.unk10, 0.f, D_8033B230.unk18);
        a->fov += D_8033B230.unk8;
    } else {
        D_8033B230.unk14 = 0;
    }
}

static void unused_deactivate_sleeping_camera(UNUSED struct MarioState *m) {
    gCameraFlags2 &= ~CAM_FLAG_2_SLEEPING;
}

void set_fov_30(UNUSED struct MarioState *m) {
    D_8033B230.fieldOfView = 30.f;
}

void approach_fov_20(UNUSED struct MarioState *m) {
    camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 20.f, 0.3f);
}

void set_fov_45(UNUSED struct MarioState *m) {
    D_8033B230.fieldOfView = 45.f;
}

void set_fov_29(UNUSED struct MarioState *m) {
    D_8033B230.fieldOfView = 29.f;
}

void zoom_fov_30(UNUSED struct MarioState *m) {
    // Pretty sure approach_f32_exponential_bool would do a much nicer job here, but you do you,
    // Nintendo.
    camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 30.f,
                                       (30.f - D_8033B230.fieldOfView) / 60.f);
}

void zoom_fov_for_sleep(struct MarioState *m) {
    gCameraFlags2 &= ~CAM_FLAG_2_SLEEPING;

    if ((m->action == ACT_SLEEPING) || (m->action == ACT_START_SLEEPING)) {
        camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 30.f,
                                           (30.f - D_8033B230.fieldOfView) / 30.f);
        gCameraFlags2 |= CAM_FLAG_2_SLEEPING;
    } else {
        camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 45.f,
                                           (45.f - D_8033B230.fieldOfView) / 30.f);
        D_8033B230.unkC = 0;
    }
    if (m->area->camera->cutscene == CUTSCENE_0F_TODO) {
        D_8033B230.fieldOfView = 45.f;
    }
}

static void unused_8029A100(UNUSED struct MarioState *m) {
    camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 30.f, 1.f);
}

void approach_fov_30(UNUSED struct MarioState *m) {
    camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 30.f, 1.f);
}

void approach_fov_60(UNUSED struct MarioState *m) {
    camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 60.f, 1.f);
}

void approach_fov_45(struct MarioState *m) {
    f32 targetFoV = D_8033B230.fieldOfView;

    if ((m->area->camera->currPreset == CAMERA_PRESET_FIXED_REF_POINT)
        && (m->area->camera->cutscene == 0)) {
        targetFoV = 45.f;
    } else {
        targetFoV = 45.f;
    }

    D_8033B230.fieldOfView = approach_f32(D_8033B230.fieldOfView, targetFoV, 2.f, 2.f);
}

void approach_fov_80(UNUSED struct MarioState *m) {
    camera_approach_f32_symmetric_bool(&D_8033B230.fieldOfView, 80.f, 3.5f);
}

void func_8029A288(struct MarioState *m) {
    f32 targetFoV = D_8033B230.fieldOfView;

    if ((m->area->camera->currPreset == CAMERA_PRESET_FIXED_REF_POINT)
        && (m->area->camera->cutscene == 0)) {
        targetFoV = 60.f;
    } else {
        targetFoV = 45.f;
    }

    D_8033B230.fieldOfView = approach_f32(D_8033B230.fieldOfView, targetFoV, 2.f, 2.f);
}

Gfx *geo_camera_fov(s32 a, struct GraphNode *b, UNUSED struct AllocOnlyPool *c) {
    struct GraphNodePerspective *sp24 = (struct GraphNodePerspective *) b;
    struct MarioState *marioState = &gMarioStates[0];
    u8 sp1F = D_8033B230.unk0;

    if (a == 1) {
        switch (sp1F) {
            case 1:
                set_fov_45(marioState);
                break;
            case 13:
                set_fov_29(marioState);
                break;
            case 12:
                zoom_fov_30(marioState);
                break;
            case 2:
                zoom_fov_for_sleep(marioState);
                break;
            case 7:
                func_8029A288(marioState);
                break;
            case 4:
                approach_fov_45(marioState);
                break;
            case 5:
                set_fov_30(marioState);
                break;
            case 6:
                approach_fov_20(marioState);
                break;
            case 9:
                approach_fov_80(marioState);
                break;
            case 10:
                approach_fov_30(marioState);
                break;
            case 11:
                approach_fov_60(marioState);
                break;
        }
    }

    sp24->fov = D_8033B230.fieldOfView;
    func_80299DB4(sp24);
    return NULL;
}

void set_fov_function(u8 a) {
    D_8033B230.unk0 = a;
}

void func_8029A494(u8 a) {
    switch (a) {
        case 1:
            func_80299C98(0x100, 0x30, -0x8000);
            break;
        case 2:
            func_80299C98(0x400, 0x20, 0x4000);
            break;
    }
}

void func_8029A514(u8 a, f32 b, f32 c, f32 d) {
    switch (a) {
        case 1:
            func_80299D00(0x100, 0x30, -0x8000, 3000.f, b, c, d);
            break;
        case 3:
            func_80299D00(0x200, 0x30, -0x8000, 4000.f, b, c, d);
            break;
        case 4:
            func_80299D00(0x300, 0x30, -0x8000, 6000.f, b, c, d);
            break;
        case 2:
            func_80299D00(0x800, 0x20, 0x4000, 3000.f, b, c, d);
            break;
    }
}

static void unused_8029A664(struct Object *o, f32 b, f32 c, f32 d) {
    f32 sp1C = RandomFloat();

    o->oPosX += (sp1C * b - b / 2.f);
    o->oPosY += (sp1C * c - c / 2.f);
    o->oPosZ += (sp1C * d - d / 2.f);
}

static void unused_8029A724(struct Object *o, f32 b, f32 c) {
    f32 sp1C = RandomFloat();

    o->oMoveAnglePitch += (s16)(sp1C * b - b / 2.f);
    o->oMoveAngleYaw += (s16)(sp1C * c - c / 2.f);
}

void func_8029A7DC(struct Object *o, Vec3f b, s16 c, s16 d, s16 e, s16 f) {
    f32 sp34;
    s16 sp32, sp30;
    Vec3f sp24;

    object_pos_to_vec3f(sp24, o);
    vec3f_get_dist_and_angle(sp24, b, &sp34, &sp32, &sp30);
    o->oMoveAnglePitch = approach_s16_exponential(o->oMoveAnglePitch, c - sp32, e);
    o->oMoveAngleYaw = approach_s16_exponential(o->oMoveAngleYaw, sp30 + d, f);
}

#include "behaviors/intro_peach.inc.c"
#include "behaviors/intro_lakitu.inc.c"
#include "behaviors/end_birds_1.inc.c"
#include "behaviors/end_birds_2.inc.c"
#include "behaviors/intro_scene.inc.c"
