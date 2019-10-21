// exclamation_box.c.inc

struct ObjectHitbox sExclamationBoxHitbox = {
    /* interactType: */ INTERACT_BREAKABLE,
    /* downOffset: */ 5,
    /* damageOrCoinValue: */ 0,
    /* health: */ 1,
    /* numLootCoins: */ 0,
    /* radius: */ 40,
    /* height: */ 30,
    /* hurtboxRadius: */ 40,
    /* hurtboxHeight: */ 30,
};

struct Struct802C0DF0 sExclamationBoxContents[] = { { 0, 0, 0, MODEL_MARIOS_WING_CAP, bhvWingCap },
                                                    { 1, 0, 0, MODEL_MARIOS_METAL_CAP, bhvMetalCap },
                                                    { 2, 0, 0, MODEL_MARIOS_CAP, bhvVanishCap },
                                                    { 3, 0, 0, MODEL_KOOPA_SHELL, bhvKoopaShell },
                                                    { 4, 0, 0, MODEL_YELLOW_COIN,
                                                      bhvSingleCoinGetsSpawned },
                                                    { 5, 0, 0, MODEL_NONE, bhvThreeCoinsSpawn },
                                                    { 6, 0, 0, MODEL_NONE, bhvTenCoinsSpawn },
                                                    { 7, 0, 0, MODEL_1UP, bhv1upWalking },
                                                    { 8, 0, 0, MODEL_STAR, bhvSpawnedStar },
                                                    { 9, 0, 0, MODEL_1UP, bhv1upRunningAway },
                                                    { 10, 0, 1, MODEL_STAR, bhvSpawnedStar },
                                                    { 11, 0, 2, MODEL_STAR, bhvSpawnedStar },
                                                    { 12, 0, 3, MODEL_STAR, bhvSpawnedStar },
                                                    { 13, 0, 4, MODEL_STAR, bhvSpawnedStar },
                                                    { 14, 0, 5, MODEL_STAR, bhvSpawnedStar },
                                                    { 99, 0, 0, 0, NULL } };

void bhv_rotatin_exclamation_box_loop(void) {
    if (o->parentObj->oAction != 1)
        mark_object_for_deletion(o);
}

void ActionExclamationBox0(void) {
    if (o->oBehParams2ndByte < 3) {
        o->oAnimState = o->oBehParams2ndByte;
        if ((save_file_get_flags() & D_8032F0C0[o->oBehParams2ndByte])
            || ((o->oBehParams >> 24) & 0xFF) != 0)
            o->oAction = 2;
        else
            o->oAction = 1;
    } else {
        o->oAnimState = 3;
        o->oAction = 2;
    }
}

void ActionExclamationBox1(void) {
    obj_become_intangible();
    if (o->oTimer == 0) {
        spawn_object(o, MODEL_EXCLAMATION_POINT, bhvRotatingExclamationMark);
        obj_set_model(MODEL_EXCLAMATION_BOX_OUTLINE);
    }
    if ((save_file_get_flags() & D_8032F0C0[o->oBehParams2ndByte])
        || ((o->oBehParams >> 24) & 0xFF) != 0) {
        o->oAction = 2;
        obj_set_model(MODEL_EXCLAMATION_BOX);
    }
}

void ActionExclamationBox2(void) {
    set_object_hitbox(o, &sExclamationBoxHitbox);
    if (o->oTimer == 0) {
        obj_unhide();
        obj_become_tangible();
        o->oInteractStatus = 0;
        o->oPosY = o->oHomeY;
        o->oGraphYOffset = 0.0f;
    }
    if (obj_was_attacked_or_ground_pounded()) {
        obj_become_intangible();
        o->oExclamationBoxUnkFC = 0x4000;
        o->oVelY = 30.0f;
        o->oGravity = -8.0f;
        o->oFloorHeight = o->oPosY;
        o->oAction = 3;
    }
    load_object_collision_model();
}

void ActionExclamationBox3(void) {
    UNUSED s32 unused;
    obj_move_using_fvel_and_gravity();
    if (o->oVelY < 0.0f) {
        o->oVelY = 0.0f;
        o->oGravity = 0.0f;
    }
    o->oExclamationBoxUnkF8 = (sins(o->oExclamationBoxUnkFC) + 1.0) * 0.3 + 0.0;
    o->oExclamationBoxUnkF4 = (-sins(o->oExclamationBoxUnkFC) + 1.0) * 0.5 + 1.0;
    o->oGraphYOffset = (-sins(o->oExclamationBoxUnkFC) + 1.0) * 26.0;
    o->oExclamationBoxUnkFC += 0x1000;
    o->header.gfx.scale[0] = o->oExclamationBoxUnkF4 * 2.0f;
    o->header.gfx.scale[1] = o->oExclamationBoxUnkF8 * 2.0f;
    o->header.gfx.scale[2] = o->oExclamationBoxUnkF4 * 2.0f;
    if (o->oTimer == 7)
        o->oAction = 4;
}

void func_802C0DF0(struct Struct802C0DF0 *a0, u8 a1) {
    struct Object *sp1C = NULL;

    while (a0->unk0 != 99) {
        if (a1 == a0->unk0) {
            sp1C = spawn_object(o, a0->model, a0->behavior);
            sp1C->oVelY = 20.0f;
            sp1C->oForwardVel = 3.0f;
            sp1C->oMoveAngleYaw = gMarioObject->oMoveAngleYaw;
            o->oBehParams |= a0->unk2 << 24;
            if (a0->model == 122)
                o->oFlags |= 0x4000;
            break;
        }
        a0++;
    }
}

void ActionExclamationBox4(void) {
    func_802C0DF0(sExclamationBoxContents, o->oBehParams2ndByte);
    func_802AA618(0, 0, 46.0f);
    spawn_triangle_break_particles(20, 139, 0.3f, o->oAnimState);
    create_sound_spawner(SOUND_GENERAL_BREAK_BOX);
    if (o->oBehParams2ndByte < 3) {
        o->oAction = 5;
        obj_hide();
    } else
        mark_object_for_deletion(o);
}

void ActionExclamationBox5(void) {
    if (o->oTimer > 300)
        o->oAction = 2;
}

void (*sExclamationBoxActions[])(void) = { ActionExclamationBox0, ActionExclamationBox1,
                                           ActionExclamationBox2, ActionExclamationBox3,
                                           ActionExclamationBox4, ActionExclamationBox5 };

void bhv_exclamation_box_loop(void) {
    obj_scale(2.0f);
    obj_call_action_function(sExclamationBoxActions);
}
