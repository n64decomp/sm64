// thwomp.c.inc

void ActionGrindelThwomp4(void) {
    if (o->oTimer == 0)
        o->OBJECT_FIELD_S32(0x1B) = RandomFloat() * 10.0f + 20.0f;
    if (o->oTimer > o->OBJECT_FIELD_S32(0x1B))
        o->oAction = 0;
}

void ActionGrindelThwomp2(void) {
    o->oVelY += -4.0f;
    o->oPosY += o->oVelY;
    if (o->oPosY < o->oHomeY) {
        o->oPosY = o->oHomeY;
        o->oVelY = 0;
        o->oAction = 3;
    }
}

void ActionGrindelThwomp3(void) {
    if (o->oTimer == 0)
        if (o->oDistanceToMario < 1500.0f) {
            ShakeScreen(1);
            PlaySound2(SOUND_OBJECT_THWOMP);
        }
    if (o->oTimer > 9)
        o->oAction = 4;
}

void ActionGrindelThwomp1(void) {
    if (o->oTimer == 0)
        o->OBJECT_FIELD_S32(0x1B) = RandomFloat() * 30.0f + 10.0f;
    if (o->oTimer > o->OBJECT_FIELD_S32(0x1B))
        o->oAction = 2;
}

void ActionGrindelThwomp0(void) {
    if (o->oBehParams2ndByte + 40 < o->oTimer) {
        o->oAction = 1;
        o->oPosY += 5.0f;
    } else
        o->oPosY += 10.0f;
}

void (*sGrindelThwompActions[])(void) = { ActionGrindelThwomp0, ActionGrindelThwomp1,
                                          ActionGrindelThwomp2, ActionGrindelThwomp3,
                                          ActionGrindelThwomp4 };

void bhv_grindel_thwomp_loop(void) {
    obj_call_action_function(sGrindelThwompActions);
}
