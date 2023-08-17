// rotating_platform.inc.c

#include "levels/wf/header.h"
#include "levels/wdw/header.h"

struct RotatingPlatformData {
    s16 unused;
    s16 scale;
    const Collision *collisionData;
    s16 collisionDistance;
};

struct RotatingPlatformData sRotatingPlatformData[] = {
    /* ROTATING_PLATFORM_BP_WF  */ { 0, 100, wf_seg7_collision_rotating_platform, 2000 },
    /* ROTATING_PLATFORM_BP_WDW */ { 0, 150, wdw_seg7_collision_070186B4,         1000 },
};

void bhv_wf_rotating_wooden_platform_loop(void) {
    if (o->oAction == WF_ROTATING_WOODEN_PLATFORM_ACT_IDLE) {
        o->oAngleVelYaw = 0;
        if (o->oTimer > 60) {
            o->oAction++;
        }
    } else { // WF_ROTATING_WOODEN_PLATFORM_ACT_ROTATING
        o->oAngleVelYaw = 0x100;
        if (o->oTimer > 126) {
            o->oAction = WF_ROTATING_WOODEN_PLATFORM_ACT_IDLE;
        }
        cur_obj_play_sound_1(SOUND_ENV_ELEVATOR2);
    }
    cur_obj_rotate_face_angle_using_vel();
}

void bhv_rotating_platform_loop(void) {
    s8 bhvParams1stByte = o->oBhvParams >> 24;
    if (o->oTimer == 0) {
        obj_set_collision_data(o, sRotatingPlatformData[o->oBhvParams2ndByte].collisionData);
        o->oCollisionDistance = sRotatingPlatformData[o->oBhvParams2ndByte].collisionDistance;
        cur_obj_scale(sRotatingPlatformData[o->oBhvParams2ndByte].scale * 0.01f);
    }
    o->oAngleVelYaw = bhvParams1stByte << 4;
    o->oFaceAngleYaw += o->oAngleVelYaw;
}
