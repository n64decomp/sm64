// coffin.inc.c

struct Struct80331C00 {
    s16 unk00;
    s16 unk02;
};

struct Struct80331C00 D_80331C00[] = {
    { 0x019C, 0xFF6A }, { 0x02FA, 0xFF6A }, { 0x0458, 0xFF6A },
    { 0x019C, 0x0096 }, { 0x02FA, 0x0096 }, { 0x0458, 0x0096 },
};

void bhv_coffin_manager_loop(void) {
    struct Object *val0C;
    s32 val08;
    s16 val06;

    if (o->oAction == 0) {
        if (!(o->activeFlags & 0x0008)) {
            for (val08 = 0; val08 < 6; val08++) {
                val06 = D_80331C00[val08].unk02;

                val0C = spawn_object_relative(val08 & 0x00000001, D_80331C00[val08].unk00, 0, val06, o,
                                              MODEL_BBH_WOODEN_TOMB, bhvCoffin);
                if (val0C != NULL) {
                    if (val06 > 0) {
                        val0C->oFaceAngleYaw = 0x8000;
                    }
                }
            }

            o->oAction += 1;
        }
    } else if (o->activeFlags & 0x0008) {
        o->oAction = 0;
    }
}

void coffin_act_0(void) {
    f32 val14;
    f32 val10;
    f32 val0C;
    f32 val08;
    f32 val04;
    f32 val00;

    if (o->oBehParams2ndByte != 0) {
        if (o->oFaceAnglePitch != 0) {
            o->oAngleVelPitch = approach_s16_symmetric(o->oAngleVelPitch, -2000, 200);

            if (obj_face_pitch_approach(0, -o->oAngleVelPitch)) {
                PlaySound2(SOUND_GENERAL_ELEVATOR_MOVE_2);
                obj_perform_position_op(0);
                o->oMoveAngleYaw = o->oFaceAngleYaw - 0x4000;

                obj_set_dist_from_home(200.0f);
                func_802ADA94();
                obj_perform_position_op(2);
            }

            o->oTimer = 0;
        } else {
            val14 = coss(o->oFaceAngleYaw);
            val10 = sins(o->oFaceAngleYaw);

            val0C = gMarioObject->oPosX - o->oPosX;
            val08 = gMarioObject->oPosZ - o->oPosZ;

            val04 = val0C * val14 + val08 * val10;
            val00 = val08 * val14 - val0C * val10;

            if (o->oTimer > 60
                && (o->oDistanceToMario > 100.0f || gMarioState->action == ACT_SQUISHED)) {
                if (gMarioObject->oPosY - o->oPosY < 200.0f && absf(val04) < 140.0f) {
                    if (val00 < 150.0f && val00 > -450.0f) {
                        PlaySound2(SOUND_GENERAL_BUTTON_PRESS_2_LOWPRIO);
                        o->oAction = 1;
                    }
                }
            }

            o->oAngleVelPitch = 0;
        }
    }
}

void coffin_act_1(void) {
    if (o->oFaceAnglePitch != 0x4000) {
        o->oAngleVelPitch = approach_s16_symmetric(o->oAngleVelPitch, 1000, 200);
        obj_face_pitch_approach(0x4000, o->oAngleVelPitch);
    } else {
        if (o->oTimer > 60) {
            o->oAction = 0;
            o->oFaceAngleRoll = 0;
        } else if (o->oTimer > 30) {
            if (gGlobalTimer % 4 == 0) {
                PlaySound2(SOUND_GENERAL_ELEVATOR_MOVE_2);
            }
            o->oFaceAngleRoll = 400 * (gGlobalTimer % 2) - 200;
        }

        o->oAngleVelPitch = 0;
    }
}

void bhv_coffin_loop(void) {
    if (o->parentObj->oAction == 0) {
        mark_object_for_deletion(o);
    } else {
        o->header.gfx.scale[1] = 1.1f;

        switch (o->oAction) {
            case 0:
                coffin_act_0();
                break;
            case 1:
                coffin_act_1();
                break;
        }

        load_object_collision_model();
    }
}
