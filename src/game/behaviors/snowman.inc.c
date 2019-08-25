// snowman.c.inc

static struct ObjectHitbox sRollingSphereHitbox = {
    /* interactType:      */ INTERACT_DAMAGE,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 3,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 210,
    /* height:            */ 350,
    /* hurtboxRadius:     */ 0,
    /* hurtboxHeight:     */ 0,
};

void bhv_snowmans_bottom_init(void) {
    struct Object *sp34;

    o->oHomeX = o->oPosX;
    o->oHomeY = o->oPosY;
    o->oHomeZ = o->oPosZ;

    o->oGravity = 10.0f;
    o->oFriction = 0.999f;
    o->oBuoyancy = 2.0f;

    o->oVelY = 0;
    o->oForwardVel = 0;
    o->oSnowmansBottomUnkF4 = 0.4f;

    sp34 = obj_nearest_object_with_behavior(bhvSnowmansHead);
    if (sp34 != NULL) {
        o->parentObj = sp34;
    }
    spawn_object_abs_with_rot(o, 0, MODEL_NONE, bhvSnowmansBodyCheckpoint, -402, 461, -2898, 0, 0, 0);
}

void func_802EFB2C(void) {
    set_object_hitbox(o, &sRollingSphereHitbox);

    if ((o->oInteractStatus & INT_STATUS_INTERACTED) != 0) {
        o->oInteractStatus = 0;
    }
}

void func_802EFB84(f32 f12) {
    o->oFaceAnglePitch += (s16)(o->oForwardVel * (100.0f / f12));
    o->oUnknownUnkF4_F32 += o->oForwardVel * 1e-4;

    if (o->oUnknownUnkF4_F32 > 1.0)
        o->oUnknownUnkF4_F32 = 1.0f;
}

void func_802EFC44(void) {
    UNUSED s16 sp26;
    s32 sp20;
    UNUSED s16 sp1E;

    o->oSnowmansBottomUnkFC = segmented_to_virtual(&ccm_seg7_trajectory_snowman);
    sp26 = func_802E4204();
    sp20 = obj_follow_path(sp20);
    o->oSnowmansBottomUnkF8 = o->oSnowmansBottomUnk10C;
    o->oMoveAngleYaw = approach_s16_symmetric(o->oMoveAngleYaw, o->oSnowmansBottomUnkF8, 0x400);

    if (o->oForwardVel > 70.0)
        o->oForwardVel = 70.0f;

    if (sp20 == -1) {
        sp1E = (u16) o->oAngleToMario - (u16) o->oMoveAngleYaw;
        if (func_802E46C0(o->oMoveAngleYaw, o->oAngleToMario, 0x2000) == 1 && o->oUnk1AC_S32 == 1) {
            o->oSnowmansBottomUnkF8 = o->oAngleToMario;
        } else {
            o->oSnowmansBottomUnkF8 = o->oMoveAngleYaw;
        }
        o->oAction = 2;
    }
}

void func_802EFDA0(void) {
    UNUSED s16 sp26;

    sp26 = func_802E4204();
    if (o->oForwardVel > 70.0)
        o->oForwardVel = 70.0f;

    o->oMoveAngleYaw = approach_s16_symmetric(o->oMoveAngleYaw, o->oSnowmansBottomUnkF8, 0x400);
    if (IsPointCloseToObject(o, -4230.0f, -1344.0f, 1813.0f, 300)) {
        func_802AA618(0, 0, 70.0f);
        o->oMoveAngleYaw = atan2s(1813.0f - o->oPosZ, -4230.0f - o->oPosX);
        o->oVelY = 80.0f;
        o->oForwardVel = 15.0f;
        o->oAction = 3;

        o->parentObj->oAction = 2;
        o->parentObj->oVelY = 100.0f;
        PlaySound2(SOUND_OBJECT_WATERBOMBBOUNCING2);
    }

    if (o->oTimer == 200) {
        create_respawner(MODEL_CCM_SNOWMAN_BASE, bhvSnowmansBottom, 3000);
        o->activeFlags = 0;
    }
}

void func_802EFF58(void) {
    UNUSED s16 sp1E;

    sp1E = func_802E4204();
    if ((sp1E & 0x09) == 0x09) {
        o->oAction = 4;
        obj_become_intangible();
    }

    if ((sp1E & 0x01) != 0) {
        func_802AA618(0, 0, 70.0f);
        o->oPosX = -4230.0f;
        o->oPosZ = 1813.0f;
        o->oForwardVel = 0.0f;
    }
}

void bhv_snowmans_bottom_loop(void) {
    s16 sp1E;

    switch (o->oAction) {
        case 0:
            if (is_point_within_radius_of_mario(o->oPosX, o->oPosY, o->oPosZ, 400) == 1
                && set_mario_npc_dialog(1) == 2) {
                sp1E = func_8028F8E0(162, o, 110);
                if (sp1E) {
                    o->oForwardVel = 10.0f;
                    o->oAction = 1;
                    set_mario_npc_dialog(0);
                }
            }
            break;

        case 1:
            func_802EFC44();
            func_802EFB84(o->oSnowmansBottomUnkF4);
            PlaySound(SOUND_ENVIRONMENT_UNKNOWN2);
            break;

        case 2:
            func_802EFDA0();
            func_802EFB84(o->oSnowmansBottomUnkF4);
            PlaySound(SOUND_ENVIRONMENT_UNKNOWN2);
            break;

        case 3:
            func_802EFF58();
            break;

        case 4:
            obj_push_mario_away_from_cylinder(210.0f, 550);
            break;
    }

    func_802EFB2C();
    SetObjectVisibility(o, 8000);
    obj_scale(o->oSnowmansBottomUnkF4);
    o->oGraphYOffset = o->oSnowmansBottomUnkF4 * 180.0f;
}

void bhv_snowmans_head_init(void) {
    u8 sp37;
    s8 sp36;

    sp37 = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);
    sp36 = (o->oBehParams >> 24) & 0xFF;

    obj_scale(0.7f);

    o->oGravity = 5.0f;
    o->oFriction = 0.999f;
    o->oBuoyancy = 2.0f;

    if ((sp37 & (1 << sp36)) && gCurrActNum != sp36 + 1) {
        spawn_object_abs_with_rot(o, 0, MODEL_CCM_SNOWMAN_BASE, bhvBigSnowmanWhole, -4230, -1344, 1813,
                                  0, 0, 0);
        o->oPosX = -4230.0f;
        o->oPosY = -994.0f;
        o->oPosZ = 1813.0f;
        o->oAction = 1;
    }
}

void bhv_snowmans_head_loop(void) {
    UNUSED s16 sp1E;
    s16 sp1C;

    switch (o->oAction) {
        case 0:
            if (func_802E4A38(&o->oSnowmansHeadUnkF4, 109, 400.0f, 1))
                o->oAction = 1;
            break;

        case 1:
            break;

        case 2:
            sp1C = func_802E4204();
            if (sp1C & 0x08)
                o->oAction = 3;
            break;

        case 3:
            func_802E4204();
            if (o->oPosY < -994.0f) {
                o->oPosY = -994.0f;
                o->oAction = 4;
                PlaySound2(SOUND_OBJECT_EXPLODE);
                play_puzzle_jingle();
            }
            break;

        case 4:
            if (func_802E4A38(&o->oSnowmansHeadUnkF4, 111, 700.0f, 2)) {
                func_802A3004();
                CreateStar(-4700.0f, -1024.0f, 1890.0f);
                o->oAction = 1;
            }
            break;
    }

    obj_push_mario_away_from_cylinder(180.0f, 150.0f);
}

void bhv_snowmans_body_checkpoint_loop(void) {
    if (is_point_within_radius_of_mario(o->oPosX, o->oPosY, o->oPosZ, 800)) {
        o->parentObj->oUnk1AC_S32++;
        o->activeFlags = 0;
    }

    if (o->parentObj->activeFlags == 0)
        o->activeFlags = 0;
}
