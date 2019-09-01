// boo.c.inc

struct ObjectHitbox sBooGivingStarHitbox = {
    /* interactType: */ 0,
    /* downOffset: */ 0,
    /* damageOrCoinValue: */ 3,
    /* health: */ 3,
    /* numLootCoins: */ 0,
    /* radius: */ 140,
    /* height: */ 80,
    /* hurtboxRadius: */ 40,
    /* hurtboxHeight: */ 60,
};

// Relative positions
s16 sCourtyardBooTripletPositions[][3] = { { 0, 50, 0 }, { 210, 110, 210 }, { -210, 70, -210 } };

void boo_stop(void) {
    o->oForwardVel = 0.0f;
    o->oVelY = 0.0f;
    o->oGravity = 0.0f;
}

void bhv_boo_init(void) {
    o->oBooUnk110 = o->oMoveAngleYaw;
}

s32 boo_should_be_stopped(void) {
    if (obj_has_behavior(bhvMerryGoRoundBigBoo) || obj_has_behavior(bhvMerryGoRoundBoo)) {
        if (gMarioOnMerryGoRound == FALSE) {
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        if (o->activeFlags & ACTIVE_FLAG_IN_DIFFERENT_ROOM) {
            return TRUE;
        }

        if (o->oRoom == 10) {
            if (gTimeStopState & TIME_STOP_MARIO_OPENED_DOOR) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

s32 boo_should_be_active(void) {
    f32 activationRadius;

    if (obj_has_behavior(bhvBalconyBigBoo)) {
        activationRadius = 5000.0f;
    } else {
        activationRadius = 1500.0f;
    }

    if (obj_has_behavior(bhvMerryGoRoundBigBoo) || obj_has_behavior(bhvMerryGoRoundBoo)) {
        if (gMarioOnMerryGoRound == TRUE) {
            return TRUE;
        } else {
            return FALSE;
        }
    } else if (o->oRoom == -1) {
        if (o->oDistanceToMario < activationRadius) {
            return TRUE;
        }
    } else if (!boo_should_be_stopped()) {
        if (o->oDistanceToMario < activationRadius
            && (o->oRoom == gMarioCurrentRoom || gMarioCurrentRoom == 0)) {
            return TRUE;
        }
    }

    return FALSE;
}

void bhv_courtyard_boo_triplet_init(void) {
    s32 i;
    struct Object *boo;

    if (gHudDisplay.stars < 12) {
        mark_object_for_deletion(o);
    } else {
        for (i = 0; i < 3; i++) {
            boo = spawn_object_relative(
                0x01, sCourtyardBooTripletPositions[i][0], sCourtyardBooTripletPositions[i][1],
                sCourtyardBooTripletPositions[i][2], o, MODEL_BOO, bhvGhostHuntBoo);

            boo->oMoveAngleYaw = RandomU16();
        }
    }
}

void boo_approach_target_opacity_and_update_scale(void) {
    f32 scale;

    if (o->oBooTargetOpacity != o->oOpacity) {
        if (o->oBooTargetOpacity > o->oOpacity) {
            o->oOpacity += 20;

            if (o->oBooTargetOpacity < o->oOpacity) {
                o->oOpacity = o->oBooTargetOpacity;
            }
        } else {
            o->oOpacity -= 20;

            if (o->oBooTargetOpacity > o->oOpacity) {
                o->oOpacity = o->oBooTargetOpacity;
            }
        }
    }

    // doubles
    scale = (o->oOpacity / 255.0f * 0.4 + 0.6) * o->oBooBaseScale;
    scale_object(o, scale); // why no obj_scale? was obj_scale written later?
}

void boo_oscillate(s32 ignoreOpacity) {
    o->oFaceAnglePitch = sins(o->oBooOscillationTimer) * 0x400;

    if (o->oOpacity == 0xFF || ignoreOpacity == TRUE) {
        // more doubles
        o->header.gfx.scale[0] = sins(o->oBooOscillationTimer) * 0.08 + o->oBooBaseScale;
        o->header.gfx.scale[1] = -sins(o->oBooOscillationTimer) * 0.08 + o->oBooBaseScale;
        o->header.gfx.scale[2] = o->header.gfx.scale[0];
        o->oGravity = sins(o->oBooOscillationTimer) * o->oBooBaseScale;
        o->oBooOscillationTimer += 0x400;
    }
}

// vanish/appear when mario's facing to/away
s32 func_802C3008(void) {
    s16 relativeAngleToMario = abs_angle_diff(o->oAngleToMario, o->oMoveAngleYaw);
    s16 relativeMarioFaceAngle = abs_angle_diff(o->oMoveAngleYaw, gMarioObject->oFaceAngleYaw);
    // magic?
    s16 relativeAngleToMarioThreshhold = 0x1568;
    s16 relativeMarioFaceAngleThreshhold = 0x6b58;
    s32 doneAppearing = FALSE;

    o->oVelY = 0.0f;

    if (relativeAngleToMario > relativeAngleToMarioThreshhold
        || relativeMarioFaceAngle < relativeMarioFaceAngleThreshhold) {
        if (o->oOpacity == 40) {
            o->oBooTargetOpacity = 255;
            PlaySound2(SOUND_BOO_LAUGH_LONG);
        }

        if (o->oOpacity > 180) {
            doneAppearing = TRUE;
        }
    } else if (o->oOpacity == 255) {
        o->oBooTargetOpacity = 40;
    }

    return doneAppearing;
}

void func_802C313C(s32 a0) {
    obj_become_intangible();

    o->oFlags &= ~OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW;
    o->oBooUnk104 = (f32) o->oMoveAngleYaw;

    if (a0 != FALSE) {
        o->oBooMoveYawAfterHit = gMarioObject->oMoveAngleYaw;
    } else if (coss((s16) o->oMoveAngleYaw - (s16) o->oAngleToMario) < 0.0f) {
        o->oBooMoveYawAfterHit = o->oMoveAngleYaw;
    } else {
        o->oBooMoveYawAfterHit = (s16)(o->oMoveAngleYaw + 0x8000);
    }
}

// move after boo is hit?
void func_802C3238(s32 roll, f32 fVel) {
    s32 sp4 = o->oTimer * 0x800 + 0x800;
    o->oForwardVel = fVel;
    o->oVelY = coss(sp4);
    o->oMoveAngleYaw = o->oBooMoveYawAfterHit;

    if (roll != FALSE) {
        o->oFaceAngleYaw += D_8032F0CC[o->oTimer];
        o->oFaceAngleRoll += D_8032F0CC[o->oTimer];
    }
}

void func_802C3304(void) {
    s32 sp4 = o->oTimer * 0x2000 + 0xFFFC2000;
    o->oFaceAngleYaw += coss(sp4) * 0x400;
}

void func_802C3384(void) {
    o->oMoveAngleYaw = o->oBooUnk104;
    o->oFlags |= OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW;
    o->oInteractStatus = 0;
}

// called iff boo/big boo/cage boo is in action 2, which only occurs if it was non-attack-ly interacted
// with/bounced on?
s32 func_802C33D0(f32 a0) {
    boo_stop();

    if (o->oTimer == 0) {
        func_802C313C(FALSE);
    }

    if (o->oTimer < 32) {
        func_802C3238(FALSE, D_8032F0CC[o->oTimer] / 5000.0f * a0);
    } else {
        obj_become_tangible();
        func_802C3384();
        o->oAction = 1;
        return 1;
    }

    return 0;
}

// called iff big boo nonlethally hit
s32 func_802C34B4(f32 a0) {
    boo_stop();
    if (o->oTimer == 0)
        func_802C313C(TRUE);
    if (o->oTimer < 32)
        func_802C3238(TRUE, D_8032F0CC[o->oTimer] / 5000.0f * a0);
    else if (o->oTimer < 48)
        func_802C3304();
    else {
        obj_become_tangible();
        func_802C3384();
        o->oAction = 1;
        return 1;
    }
    return 0;
}

// func_802C35C0 is called every frame once mario lethally hits the boo until the boo is deleted
// boo_die? boo_dying? returns whether boo has completed death animation
// sets oBooDeathStatus
s32 func_802C35C0(void) {
    struct Object *parentBigBoo;

    if (o->oTimer == 0) {
        o->oForwardVel = 40.0f;
        o->oMoveAngleYaw = gMarioObject->oMoveAngleYaw;
        o->oBooDeathStatus = BOO_DEATH_STATUS_DYING;
        o->oFlags &= ~8;
    } else {
        if (o->oTimer == 5) {
            o->oBooTargetOpacity = 0;
        }

        if (o->oTimer > 30 || o->oMoveFlags & 0x200) {
            func_802A3004();
            o->oBooDeathStatus = BOO_DEATH_STATUS_DEAD;
#ifndef VERSION_JP
            if (o->oBooParentBigBoo != NULL) {
                parentBigBoo = o->oBooParentBigBoo;
                if (!obj_has_behavior(bhvBoo)) {
                    parentBigBoo->oBigBooNumMinionBoosKilled++;
                }
            }
#else
            if (o->oBooParentBigBoo != NULL) {
                parentBigBoo = o->oBooParentBigBoo;
                parentBigBoo->oBigBooNumMinionBoosKilled++;
            }
#endif
            return TRUE;
        }
    }

    o->oVelY = 5.0f;
    o->oFaceAngleRoll += 0x800;
    o->oFaceAngleYaw += 0x800;

    return FALSE;
}

s32 obj_has_attack_type(u32 attackType) {
    if ((o->oInteractStatus & INT_STATUS_ATTACK_MASK) == attackType) {
        return TRUE;
    } else {
        return FALSE;
    }
}

s32 func_802C3778(void) {
    s32 sp1C = 0;
    if (o->oInteractStatus & INT_STATUS_INTERACTED) {
        if ((o->oInteractStatus & INT_STATUS_WAS_ATTACKED)
            && obj_has_attack_type(ATTACK_FROM_ABOVE) == FALSE) {
            obj_become_intangible();
            o->oInteractStatus = 0;
            PlaySound2(SOUND_BOO_LAUGH_SHORT);
            sp1C = 1;
        } else {
            PlaySound2(SOUND_OBJECT_BOOBOUNCETOP);
            o->oInteractStatus = 0;
            sp1C = -1;
        }
    }
    return sp1C;
}

// boo idle/chasing movement?
void func_802C3830(f32 a0, s16 a1, f32 a2) {
    f32 sp1C;
    s16 sp1A;
    if (func_802C3008()) {
        o->oInteractType = 0x8000;
        if (obj_lateral_dist_from_mario_to_home() > 1500.0f)
            sp1A = obj_angle_to_home();
        else
            sp1A = o->oAngleToMario;
        obj_rotate_yaw_toward(sp1A, a1);
        o->oVelY = 0.0f;
        if (mario_is_in_air_action() == 0) {
            sp1C = o->oPosY - gMarioObject->oPosY;
            if (a0 < sp1C && sp1C < 500.0f)
                o->oVelY = func_802A0BF4(o->oPosY, gMarioObject->oPosY + 50.0f, 10.f, 2.0f);
        }
        func_8029F684(10.0f - o->oBooUnk10C, a2);
        if (o->oForwardVel != 0.0f)
            boo_oscillate(FALSE);
    } else {
        o->oInteractType = 0;
        o->oForwardVel = 0.0f;
        o->oVelY = 0.0f;
        o->oGravity = 0.0f;
    }
}

void ActionBoo0(void) {
    o->activeFlags |= 0x40;
    if (o->oBehParams2ndByte == 2)
        o->oRoom = 10;
    obj_set_pos_to_home();
    o->oMoveAngleYaw = o->oBooUnk110;
    boo_stop();
    o->oBooParentBigBoo = obj_nearest_object_with_behavior(bhvGhostHuntBigBoo);
    o->oBooBaseScale = 1.0f;
    o->oBooTargetOpacity = 0xFF;
    if (boo_should_be_active()) {
        // Condition is met if the object is bhvBalconyBigBoo or bhvMerryGoRoundBoo
        if (o->oBehParams2ndByte == 2) {
            o->oBooParentBigBoo = NULL;
            o->oAction = 5;
        } else
            o->oAction = 1;
    }
}

void ActionBoo5(void) {
    if (o->oTimer < 30) {
        o->oVelY = 0.0f;
        o->oForwardVel = 13.0f;
        boo_oscillate(FALSE);
        o->oWallHitboxRadius = 0.0f;
    } else {
        o->oAction = 1;
        o->oWallHitboxRadius = 30.0f;
    }
}

void ActionBoo1(void) {
    s32 sp1C;
    if (o->oTimer == 0) {
        o->oBooUnk10C = -RandomFloat() * 5.0f;
        o->oUnk1B0_S16 = (s32)(RandomFloat() * 128.0f);
    }
    func_802C3830(-100.0f, o->oUnk1B0_S16 + 0x180, 0.5f);
    sp1C = func_802C3778();
    if (boo_should_be_stopped())
        o->oAction = 0;
    if (sp1C == -1)
        o->oAction = 2;
    if (sp1C == 1)
        o->oAction = 3;
    if (sp1C == 1)
        create_sound_spawner(SOUND_OBJECT_DYINGENEMY1);
}

void ActionBoo2(void) {
    if (func_802C33D0(20.0f))
        o->oAction = 1;
}

void ActionBoo3(void) {
    if (func_802C35C0()) {
        if (o->oBehParams2ndByte != 0)
            mark_object_for_deletion(o);
        else {
            o->oAction = 4;
            obj_disable();
        }
    }
}

// Called when a Go on a Ghost Hunt boo dies
void ActionBoo4(void) {
    s32 dialogID;

    // If there are no remaining "minion" boos, show the dialog of the Big Boo
    if (obj_nearest_object_with_behavior(bhvGhostHuntBoo) == NULL)
        dialogID = 108;
    else
        dialogID = 107;

    if (obj_update_dialog_unk1(2, 2, dialogID, 0)) {
        create_sound_spawner(SOUND_OBJECT_DYINGENEMY1);
        mark_object_for_deletion(o);
        if (dialogID == 108) // If the Big Boo should spawn, play the jingle
            play_puzzle_jingle();
    }
}

void (*sBooActions[])(void) = {
    ActionBoo0, ActionBoo1, ActionBoo2, ActionBoo3, ActionBoo4, ActionBoo5
};

void bhv_boo_loop(void) {
    // PARTIAL_UPDATE
    obj_update_floor_and_walls();
    obj_call_action_function(sBooActions);
    obj_move_standard(78);
    boo_approach_target_opacity_and_update_scale();
    if (object_has_behavior(o->parentObj, bhvMerryGoRoundBooManager)) {
        if (o->activeFlags == 0)
            o->parentObj->oMerryGoRoundBooManagerNumMinionBoosKilled++;
    }
    o->oInteractStatus = 0;
}

void ActionBooGivingStar0(void) {
    if (obj_has_behavior(bhvBalconyBigBoo)) {
        func_802C49E0();
        // number of killed boos set > 5 so that boo always loads
        // redundant? this is also done in behavior_data.s
        o->oBigBooNumMinionBoosKilled = 10;
    }
    o->oBooParentBigBoo = NULL;
#ifndef VERSION_JP
    if (boo_should_be_active() && gDebugInfo[5][0] + 5 <= o->oBigBooNumMinionBoosKilled)
#else
    if (boo_should_be_active() && o->oBigBooNumMinionBoosKilled >= 5)
#endif
    {
        o->oAction = 1;
        obj_set_pos_to_home();
        o->oMoveAngleYaw = o->oBooUnk110;
        obj_unhide();
        o->oBooTargetOpacity = 0xFF;
        o->oBooBaseScale = 3.0f;
        o->oHealth = 3;
        obj_scale(3.0f);
        obj_become_tangible();
    } else {
        obj_hide();
        obj_become_intangible();
        boo_stop();
    }
}

void ActionBooGivingStar1(void) {
    s32 sp24;
    s16 sp22;
    f32 sp1C;
    if (o->oHealth == 3) {
        sp22 = 0x180;
        sp1C = 0.5f;
    } else if (o->oHealth == 2) {
        sp22 = 0x240;
        sp1C = 0.6f;
    } else {
        sp22 = 0x300;
        sp1C = 0.8f;
    }
    func_802C3830(-100.0f, sp22, sp1C);
    sp24 = func_802C3778();
    if (obj_has_behavior(bhvMerryGoRoundBigBoo)) {
        if (gMarioOnMerryGoRound == FALSE)
            o->oAction = 0;
    } else if (boo_should_be_stopped())
        o->oAction = 0;
    if (sp24 == -1)
        o->oAction = 2;
    if (sp24 == 1)
        o->oAction = 3;
    if (sp24 == 1)
        create_sound_spawner(SOUND_OBJECT_THWOMP);
}

void ActionBooGivingStar2(void) {
    if (func_802C33D0(20.0f))
        o->oAction = 1;
}

void func_802C41AC(void) {
    create_star(980.0f, 1100.0f, 250.0f);
}

void func_802C41E4(void) {
    create_star(700.0f, 3200.0f, 1900.0f);
}

void func_802C4220(void) {
    struct Object *merryGoRound;

    create_star(-1600.0f, -2100.0f, 205.0f);

    merryGoRound = obj_nearest_object_with_behavior(bhvMerryGoRound);

    if (merryGoRound != NULL)
        merryGoRound->oMerryGoRoundStopped = TRUE;
}

void ActionBooGivingStar3(void) {
    if (o->oTimer == 0)
        o->oHealth--;
    if (o->oHealth == 0) {
        if (func_802C35C0()) {
            obj_disable();
            o->oAction = 4;
            set_object_angle(o, 0, 0, 0);
            if (o->oBehParams2ndByte == 0)
                func_802C41AC();
            else if (o->oBehParams2ndByte == 1)
                func_802C4220();
            else
                func_802C41E4();
        }
    } else {
        if (o->oTimer == 0) {
            func_802A3004();
            // double
            o->oBooBaseScale -= 0.5;
        }
        if (func_802C34B4(40.0f))
            o->oAction = 1;
    }
}

void ActionBooGivingStar4(void) {
#ifndef VERSION_JP
    boo_stop();
#endif
    if (o->oBehParams2ndByte == 0) {
        set_object_pos(o, 973, 0, 626);
        if (o->oTimer > 60 && o->oDistanceToMario < 600.0f) {
            set_object_pos(o, 973, 0, 717);
            spawn_object_relative(0, 0, 0, 0, o, MODEL_BBH_STAIRCASE_STEP, bhvBooBossSpawnedBridge);
            spawn_object_relative(1, 0, 0, -200, o, MODEL_BBH_STAIRCASE_STEP, bhvBooBossSpawnedBridge);
            spawn_object_relative(2, 0, 0, 200, o, MODEL_BBH_STAIRCASE_STEP, bhvBooBossSpawnedBridge);
            mark_object_for_deletion(o);
        }
    } else
        mark_object_for_deletion(o);
}

void (*sBooGivingStarActions[])(void) = { ActionBooGivingStar0, ActionBooGivingStar1,
                                          ActionBooGivingStar2, ActionBooGivingStar3,
                                          ActionBooGivingStar4 };

void bhv_big_boo_loop(void) {
    // PARTIAL_UPDATE
    set_object_hitbox(o, &sBooGivingStarHitbox);
    o->oGraphYOffset = o->oBooBaseScale * 60.0f;
    obj_update_floor_and_walls();
    obj_call_action_function(sBooGivingStarActions);
    obj_move_standard(78);
    boo_approach_target_opacity_and_update_scale();
    o->oInteractStatus = 0;
}

void ActionBooWithCage0(void) {
    o->oBooParentBigBoo = NULL;
    o->oBooTargetOpacity = 0xFF;
    o->oBooBaseScale = 2.0f;
    obj_scale(2.0f);
    obj_become_tangible();
    if (boo_should_be_active())
        o->oAction = 1;
}

void ActionBooWithCage1(void) {
    s32 sp1C;

    func_802C3830(100.0f, 512, 0.5f);
    sp1C = func_802C3778();
    if (boo_should_be_stopped())
        o->oAction = 0;
    if (sp1C == -1)
        o->oAction = 2;
    if (sp1C == 1)
        o->oAction = 3;
}

void ActionBooWithCage2(void) {
    if (func_802C33D0(20.0f))
        o->oAction = 1;
}

void ActionBooWithCage3(void) {
    if (func_802C35C0())
        mark_object_for_deletion(o);
}

void bhv_boo_with_cage_init(void) {
    struct Object *cage;
    if (gHudDisplay.stars < 12)
        mark_object_for_deletion(o);
    else {
        cage = spawn_object(o, MODEL_HAUNTED_CAGE, bhvBooCage);
        cage->oBehParams = o->oBehParams;
    }
}

void (*sBooWithCageActions[])(void) = { ActionBooWithCage0, ActionBooWithCage1, ActionBooWithCage2,
                                        ActionBooWithCage3 };

void bhv_boo_with_cage_loop(void) {
    // PARTIAL_UPDATE
    obj_update_floor_and_walls();
    obj_call_action_function(sBooWithCageActions);
    obj_move_standard(78);
    boo_approach_target_opacity_and_update_scale();
    o->oInteractStatus = 0;
}

void bhv_merry_go_round_boo_manager_loop(void) {
    struct Object *sp24;
    switch (o->oAction) {
        case 0:
            if (o->oDistanceToMario < 1000.0f) {
                if (o->oMerryGoRoundBooManagerNumMinionBoosKilled < 5) {
                    if (o->oUnknownUnkFC_S32 != 5) {
                        if (o->oUnknownUnkFC_S32 - o->oMerryGoRoundBooManagerNumMinionBoosKilled < 2) {
                            spawn_object(o, MODEL_BOO, bhvMerryGoRoundBoo);
                            o->oUnknownUnkFC_S32++;
                        }
                    }
                    o->oAction++;
                }
                if (o->oMerryGoRoundBooManagerNumMinionBoosKilled > 4) {
                    sp24 = spawn_object(o, MODEL_BOO, bhvMerryGoRoundBigBoo);
                    copy_object_behavior_params(sp24, o);
                    o->oAction = 2;
#ifndef VERSION_JP
                    play_puzzle_jingle();
#else
                    play_sound(SOUND_CH8_RIGHTANSWER, gDefaultSoundArgs);
#endif
                }
            }
            break;
        case 1:
            if (o->oTimer > 60)
                o->oAction = 0;
            break;
        case 2:
            break;
    }
}

void func_802C49E0(void) {
    gSecondCameraFocus = o;
}

void bhv_animated_texture_loop(void) {
    func_802A3470();
}

void bhv_boo_in_castle_loop(void) {
    s16 sp1E;
    o->oBooBaseScale = 2.0f;
    if (o->oAction == 0) {
        obj_hide();
        if (gHudDisplay.stars < 12)
            mark_object_for_deletion(o);
        if (gMarioCurrentRoom == 1)
            o->oAction++;
    } else if (o->oAction == 1) {
        obj_unhide();
        o->oOpacity = 180;
        if (o->oTimer == 0)
            obj_scale(o->oBooBaseScale);
        if (o->oDistanceToMario < 1000.0f) {
            o->oAction++;
            PlaySound2(SOUND_BOO_LAUGH_LONG);
        }
        o->oForwardVel = 0.0f;
        sp1E = o->oAngleToMario;
    } else {
        obj_obj_forward_vel_approach_upward(32.0f, 1.0f);
        o->oHomeX = -1000.0f;
        o->oHomeZ = -9000.0f;
        sp1E = obj_angle_to_home();
        if (o->oPosZ < -5000.0f) {
            if (o->oOpacity > 0)
                o->oOpacity -= 20;
            else
                o->oOpacity = 0;
        }
        if (o->activeFlags & 8)
            o->oAction = 1;
    }
    o->oVelY = 0.0f;
    sp1E = obj_angle_to_home();
    obj_rotate_yaw_toward(sp1E, 0x5A8);
    boo_oscillate(TRUE);
    obj_move_using_fvel_and_gravity();
}

void bhv_boo_boss_spawned_bridge_loop(void) {
    f32 sp24;
    switch (o->oBehParams2ndByte) {
        case 1:
            sp24 = 0.0f;
            break;
        case 0:
            sp24 = -206.0f;
            break;
        case 2:
            sp24 = -413.0f;
            break;
    }
    switch (o->oAction) {
        case 0:
            o->oPosY = o->oHomeY - 620.0f;
            o->oAction++;
        case 1:
            o->oPosY += 8.0f;
            PlaySound(SOUND_ENVIRONMENT_ELEVATOR2);
            if (o->oPosY > sp24) {
                o->oPosY = sp24;
                o->oAction++;
            }
            break;
        case 2:
            if (o->oTimer == 0)
                PlaySound2(SOUND_GENERAL_UNKNOWN4_LOWPRIO);
            if (func_802A362C(o->oTimer))
                o->oAction++;
            break;
        case 3:
            if (o->oTimer == 0 && o->oBehParams2ndByte == 1)
                play_puzzle_jingle();
            break;
    }
}
