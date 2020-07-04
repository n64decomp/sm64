// manta_ray.c.inc

static Trajectory sMantaRayTraj[] = { 
    TRAJECTORY_POS(0, /*pos*/ -4500, -1380,   -40), 
    TRAJECTORY_POS(1, /*pos*/ -4120, -2240,   740), 
    TRAJECTORY_POS(2, /*pos*/ -3280, -3080,  1040), 
    TRAJECTORY_POS(3, /*pos*/ -2240, -3320,   720), 
    TRAJECTORY_POS(4, /*pos*/ -1840, -3140,  -280), 
    TRAJECTORY_POS(5, /*pos*/ -2320, -2480, -1100), 
    TRAJECTORY_POS(6, /*pos*/ -3220, -1600, -1360), 
    TRAJECTORY_POS(7, /*pos*/ -4180, -1020, -1040), 
    TRAJECTORY_END(),
};

static struct ObjectHitbox sMantaRayHitbox = {
    /* interactType:      */ INTERACT_DAMAGE,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 0,
    /* health:            */ 3,
    /* numLootCoins:      */ 0,
    /* radius:            */ 210,
    /* height:            */ 60,
    /* hurtboxRadius:     */ 200,
    /* hurtboxHeight:     */ 50,
};

void bhv_manta_ray_init(void) {
    struct Object *sp1C;
    sp1C = spawn_object(o, MODEL_NONE, bhvMantaRayRingManager);
    o->parentObj = sp1C;
    obj_set_hitbox(o, &sMantaRayHitbox);
    cur_obj_scale(2.5f);
}

void manta_ray_move(void) {
    s16 sp1E;
    s32 sp18;

    sp1E = o->header.gfx.unk38.animFrame;
    gCurrentObject->oPathedStartWaypoint = (struct Waypoint *) sMantaRayTraj;
    sp18 = cur_obj_follow_path(sp18);
    o->oMantaUnkF8 = o->oPathedTargetYaw;
    o->oMantaUnkF4 = o->oPathedTargetPitch;
    o->oForwardVel = 10.0f;
    o->oMoveAngleYaw = approach_s16_symmetric(o->oMoveAngleYaw, o->oMantaUnkF8, 0x80);
    o->oMoveAnglePitch = approach_s16_symmetric(o->oMoveAnglePitch, o->oMantaUnkF4, 0x80);
    if ((s16) o->oMantaUnkF8 != (s16) o->oMoveAngleYaw) {
        o->oMoveAngleRoll -= 91;
        if (o->oMoveAngleRoll < -5461.3332)
            o->oMoveAngleRoll = -0x4000 / 3;
    } else {
        o->oMoveAngleRoll += 91;
        if (o->oMoveAngleRoll > 5461.3332)
            o->oMoveAngleRoll = 0x4000 / 3;
    }

    cur_obj_set_pos_via_transform();
    if (sp1E == 0)
        cur_obj_play_sound_2(SOUND_GENERAL_MOVING_WATER);
}

void manta_ray_act_spawn_ring(void) {
    struct Object *sp1C = o->parentObj;
    struct Object *sp18;

    if (o->oTimer == 300)
        o->oTimer = 0;

    if (o->oTimer == 0 || o->oTimer == 50 || o->oTimer == 150 || o->oTimer == 200 || o->oTimer == 250) {
        sp18 = spawn_object(o, MODEL_WATER_RING, bhvMantaRayWaterRing);
        sp18->oFaceAngleYaw = o->oMoveAngleYaw;
        sp18->oFaceAnglePitch = o->oMoveAnglePitch + 0x4000;
        sp18->oPosX = o->oPosX + 200.0f * sins(o->oMoveAngleYaw + 0x8000);
        sp18->oPosY = o->oPosY + 10.0f + 200.0f * sins(o->oMoveAnglePitch);
        sp18->oPosZ = o->oPosZ + 200.0f * coss(o->oMoveAngleYaw + 0x8000);
        sp18->oWaterRingIndex = sp1C->oWaterRingMgrNextRingIndex;

        sp1C->oWaterRingMgrNextRingIndex++;
        if (sp1C->oWaterRingMgrNextRingIndex > 0x2710)
            sp1C->oWaterRingMgrNextRingIndex = 0;
    }
}

void bhv_manta_ray_loop(void) {
    switch (o->oAction) {
        case 0:
            manta_ray_move();
            manta_ray_act_spawn_ring();
            if (o->oMantaUnk1AC == 5) {
                spawn_mist_particles();
                spawn_default_star(-3180.0f, -3600.0f, 120.0f);
                o->oAction = 1;
            }
            break;

        case 1:
            manta_ray_move();
            break;
    }

    if (o->oInteractStatus & INT_STATUS_INTERACTED)
        o->oInteractStatus = 0;
}
