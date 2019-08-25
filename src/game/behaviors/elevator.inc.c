// elevator.c.inc

void func_802AD01C(void) {
    PlaySound2(SOUND_GENERAL_QUIETPOUND1);
    ShakeScreen(1);
}

void ActionElevator0(void) {
    o->oVelY = 0;
    if (o->OBJECT_FIELD_S32(0x1E) == 2) {
        if (gMarioObject->platform == o) {
            if (o->oPosY > o->OBJECT_FIELD_F32(0x1D))
                o->oAction = 2;
            else
                o->oAction = 1;
        }
    } else if (gMarioObject->oPosY > o->OBJECT_FIELD_F32(0x1D) || o->OBJECT_FIELD_S32(0x1E) == 1) {
        o->oPosY = o->OBJECT_FIELD_F32(0x1C);
        if (gMarioObject->platform == o)
            o->oAction = 2;
    } else {
        o->oPosY = o->OBJECT_FIELD_F32(0x1B);
        if (gMarioObject->platform == o)
            o->oAction = 1;
    }
}

void ActionElevator1(void) {
    PlaySound(SOUND_ENVIRONMENT_ELEVATOR1);
    if (o->oTimer == 0 && obj_is_mario_on_platform())
        func_802AD01C();
    approach_f32_signed(&o->oVelY, 10.0f, 2.0f);
    o->oPosY += o->oVelY;
    if (o->oPosY > o->OBJECT_FIELD_F32(0x1C)) {
        o->oPosY = o->OBJECT_FIELD_F32(0x1C);
        if (o->OBJECT_FIELD_S32(0x1E) == 2 || o->OBJECT_FIELD_S32(0x1E) == 1)
            o->oAction = 3;
        else if (gMarioObject->oPosY < o->OBJECT_FIELD_F32(0x1D))
            o->oAction = 2;
        else
            o->oAction = 3;
    }
}

void ActionElevator2() // Pretty similar code to action 1
{
    PlaySound(SOUND_ENVIRONMENT_ELEVATOR1);
    if (o->oTimer == 0 && obj_is_mario_on_platform())
        func_802AD01C();
    approach_f32_signed(&o->oVelY, -10.0f, -2.0f);
    o->oPosY += o->oVelY;
    if (o->oPosY < o->OBJECT_FIELD_F32(0x1B)) {
        o->oPosY = o->OBJECT_FIELD_F32(0x1B);
        if (o->OBJECT_FIELD_S32(0x1E) == 1)
            o->oAction = 4;
        else if (o->OBJECT_FIELD_S32(0x1E) == 2)
            o->oAction = 3;
        else if (gMarioObject->oPosY > o->OBJECT_FIELD_F32(0x1D))
            o->oAction = 1;
        else
            o->oAction = 3;
    }
}

void ActionElevator4() {
    o->oVelY = 0;
    if (o->oTimer == 0) {
        ShakeScreen(1);
        PlaySound2(SOUND_GENERAL_METALPOUND);
    }
    if (!mario_is_in_air_action() && !obj_is_mario_on_platform())
        o->oAction = 1;
}

void ActionElevator3() // nearly identical to action 2
{
    o->oVelY = 0;
    if (o->oTimer == 0) {
        ShakeScreen(1);
        PlaySound2(SOUND_GENERAL_METALPOUND);
    }
    if (!mario_is_in_air_action() && !obj_is_mario_on_platform())
        o->oAction = 0;
}

void bhv_elevator_init(void) {
    s32 sp1C = D_8032F38C[o->oBehParams2ndByte * 3 + 2];
    if (sp1C == 0) {
        o->OBJECT_FIELD_F32(0x1B) = D_8032F38C[o->oBehParams2ndByte * 3];
        o->OBJECT_FIELD_F32(0x1C) = o->oHomeY;
        o->OBJECT_FIELD_F32(0x1D) = (o->OBJECT_FIELD_F32(0x1B) + o->OBJECT_FIELD_F32(0x1C)) / 2.0f;
        o->OBJECT_FIELD_S32(0x1E) = obj_has_behavior(bhvRrElevatorPlatform);
    } else {
        o->OBJECT_FIELD_F32(0x1B) = D_8032F38C[o->oBehParams2ndByte * 3];
        o->OBJECT_FIELD_F32(0x1C) = D_8032F38C[o->oBehParams2ndByte * 3 + 1];
        o->OBJECT_FIELD_F32(0x1D) = (o->OBJECT_FIELD_F32(0x1B) + o->OBJECT_FIELD_F32(0x1C)) / 2.0f;
        o->OBJECT_FIELD_S32(0x1E) = 2;
    }
}

void (*sElevatorActions[])(void) = { ActionElevator0, ActionElevator1, ActionElevator2, ActionElevator3,
                                     ActionElevator4 };

struct SpawnParticlesInfo D_8032F3CC = { 3, 20, MODEL_MIST, 20, 10, 5, 0, 0, 0, 30, 30.0f, 1.5f };

struct SpawnParticlesInfo D_8032F3E0 = { 0, 5, MODEL_SAND_DUST, 0, 0, 20, 20, 0, 252, 30, 5.0f, 2.0f };

s16 D_8032F3F4[] = { 2, -8, 1, 4 };

struct SpawnParticlesInfo D_8032F3FC = { 0,    5,   MODEL_WHITE_PARTICLE_DL, 0, 0, 20, 20, 0, 252, 30,
                                         2.0f, 2.0f };

void bhv_elevator_loop(void) {
    obj_call_action_function(sElevatorActions);
}
