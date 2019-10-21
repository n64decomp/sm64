// snufit.inc.c

struct ObjectHitbox sSnufitHitbox = {
    /* interactType:      */ INTERACT_HIT_FROM_BELOW,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ 2,
    /* radius:            */ 100,
    /* height:            */ 60,
    /* hurtboxRadius:     */ 70,
    /* hurtboxHeight:     */ 50,
};

struct ObjectHitbox sSnufitBulletHitbox = {
    /* interactType:      */ INTERACT_SNUFIT_BULLET,
    /* downOffset:        */ 50,
    /* damageOrCoinValue: */ 1,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 100,
    /* height:            */ 50,
    /* hurtboxRadius:     */ 100,
    /* hurtboxHeight:     */ 50,
};

Gfx *Geo18_8030D93C(s32 arg0, struct GraphNode *node, UNUSED void *arg2) {
    struct Object *sp4;
    struct GraphNodeTranslationRotation *sp0;

    if (arg0 == 1) {
        sp4 = (struct Object *) gCurGraphNodeObject;
        sp0 = (struct GraphNodeTranslationRotation *) node->next;

        sp0->translation[0] = sp4->oSnufitUnk1AC;
        sp0->translation[1] = sp4->oSnufitUnk1AE;
        sp0->translation[2] = sp4->oSnufitUnk1B0;
    }

    return NULL;
}

Gfx *Geo18_8030D9AC(s32 arg0, struct GraphNode *node, UNUSED void *arg2) {
    struct Object *sp4;
    struct GraphNodeScale *sp0;

    if (arg0 == 1) {
        sp4 = (struct Object *) gCurGraphNodeObject;
        sp0 = (struct GraphNodeScale *) node->next;

        sp0->scale = sp4->oSnufitUnk1B2 / 1000.0f;
    }

    return NULL;
}

void snufit_act_0(void) {
    s32 sp1C;

    sp1C = (s32)(o->oDistanceToMario / 10.0f);
    if (o->oTimer > sp1C && o->oDistanceToMario < 800.0f) {
        o->oSnufitUnk104 = approach_s16_symmetric(o->oSnufitUnk104, 0, 1500);
        o->oSnufitUnk108 = approach_s16_symmetric(o->oSnufitUnk108, 600, 15);

        if ((s16) o->oSnufitUnk104 == 0 && o->oSnufitUnk108 == 600) {
            o->oAction = 1;
            o->oSnufitUnk10C = 0;
        }
    } else {
        o->oSnufitUnk100 += 400;
    }
}

void snufit_act_1(void) {
    o->oSnufitUnk104 = approach_s16_symmetric(o->oSnufitUnk104, -0x8000, 3000);
    o->oSnufitUnk108 = approach_s16_symmetric(o->oSnufitUnk108, 0xA7, 20);

    if ((u16) o->oSnufitUnk104 == 0x8000 && o->oSnufitUnk108 == 0xA7) {
        o->oAction = 0;
    } else if (o->oSnufitUnk10C < 3 && o->oTimer >= 3) {
        o->oSnufitUnk10C += 1;
        PlaySound2(SOUND_OBJ_SNUFIT_SHOOT);
        spawn_object_relative(0, 0, -20, 40, o, MODEL_BOWLING_BALL, bhvSnufitBalls);
        o->oSnufitUnkF4 = -30;
        o->oTimer = 0;
    }
}

void bhv_snufit_loop(void) {
    if (!(o->activeFlags & 0x0008)) {
        o->oDeathSound = SOUND_OBJ_SNUFIT_SKEETER_DEATH;
        if (o->oDistanceToMario < 800.0f) {
            obj_turn_pitch_toward_mario(120.0f, 2000);

            if ((s16) o->oMoveAnglePitch > 0x2000) {
                o->oMoveAnglePitch = 0x2000;
            } else if ((s16) o->oMoveAnglePitch < -0x2000) {
                o->oMoveAnglePitch = -0x2000;
            }

            obj_rotate_yaw_toward(o->oAngleToMario, 2000);
        } else {
            obj_move_pitch_approach(0, 0x200);
            o->oMoveAngleYaw += 200;
        }

        o->oFaceAnglePitch = o->oMoveAnglePitch;

        switch (o->oAction) {
            case 0:
                snufit_act_0();
                break;
            case 1:
                snufit_act_1();
                break;
        }

        o->oPosX = o->oHomeX + 100.0f * coss(o->oSnufitUnk100);
        o->oPosY = o->oHomeY + 8.0f * coss(4000 * gGlobalTimer);
        o->oPosZ = o->oHomeZ + 100.0f * sins(o->oSnufitUnk100);

        o->oSnufitUnk1AE = -0x20;
        o->oSnufitUnk1B0 = o->oSnufitUnkF4 + 180;
        o->oSnufitUnk1B2 = (s16)(o->oSnufitUnk108 + 666 + o->oSnufitUnk108 * coss(o->oSnufitUnk104));

        if (o->oSnufitUnk1B2 > 1000) {
            o->oSnufitUnkF8 = (o->oSnufitUnk1B2 - 1000) / 1000.0f + 1.0f;
            o->oSnufitUnk1B2 = 1000;
        } else {
            o->oSnufitUnkF8 = 1.0f;
        }

        obj_scale(o->oSnufitUnkF8);
        obj_check_attacks(&sSnufitHitbox, o->oAction);
    }
}

void bhv_snufit_balls_loop(void) {
    if ((o->activeFlags & 0x0008) || (o->oTimer != 0 && o->oDistanceToMario > 1500.0f)) {
        mark_object_for_deletion(o);
    }

    if (o->oGravity == 0.0f) {
        obj_update_floor_and_walls();

        obj_compute_vel_from_move_pitch(40.0f);
        if (obj_check_attacks(&sSnufitBulletHitbox, 1)) {
            o->oMoveAngleYaw += 0x8000;
            o->oForwardVel *= 0.05f;
            o->oVelY = 30.0f;
            o->oGravity = -4.0f;

            obj_become_intangible();
        } else if (o->oAction == 1 || (o->oMoveFlags & 0x00000203)) {
            o->oDeathSound = -1;
            obj_die_if_health_non_positive();
        }

        obj_move_standard(78);
    } else {
        obj_move_using_fvel_and_gravity();
    }
}
