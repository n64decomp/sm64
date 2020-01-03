// tox_box.c.inc

s8 D_8032F8F0[] = { 4, 1, 4, 1, 6, 1, 6, 1, 5, 1, 5, 1, 6, 1, 6, 1, 5, 1, 2, 4, 1, 4, 1, 4, 1, 2,
                    5, 1, 5, 1, 7, 1, 7, 1, 4, 1, 4, 1, 7, 1, 7, 1, 5, 1, 5, 1, 5, 1, 2, 4, 1, -1 };
s8 D_8032F924[] = { 4, 1, 4, 1, 7, 1, 7, 1, 7, 1, 2, 6, 1, 6, 1, 6, 1, 5,
                    1, 5, 1, 6, 1, 5, 1, 5, 1, 2, 4, 1, 4, 1, 7, 1, -1 };
s8 D_8032F948[] = { 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 2, 5, 1, 5, 1, 5, 1, 5,
                    1, 5, 1, 7, 1, 2, 6, 1, 6, 1, 5, 1, 2, 4, 1, 7, 1, -1 };
s8 *D_8032F96C[] = { D_8032F8F0, D_8032F924, D_8032F948 };

void func_802BCF78(void) {
    if (o->oDistanceToMario < 3000.0f)
        ShakeScreen(SHAKE_POS_SMALL);
}

void func_802BCFC4(f32 a0, f32 a1, s16 a2, s16 a3) // 0x18 0x1c 0x22 0x26
{
    o->oPosY = 99.41124 * sins((f32)(o->oTimer + 1) / 8 * 0x8000) + o->oHomeY + 3.0f;
    o->oForwardVel = a0;
    o->oUnkC0 = a1;
    o->oFaceAnglePitch += a2;
    if ((s16) o->oFaceAnglePitch < 0)
        a3 = -a3;
    o->oFaceAngleRoll += a3;
    func_802A2A38();
    if (o->oTimer == 7) {
        o->oAction = func_802A32E0();
#ifndef VERSION_JP
        PlaySound2(SOUND_GENERAL_UNK46);
#else
        PlaySound2(SOUND_GENERAL_UNK46_LOWPRIO);
#endif
    }
}

void ActionToxBox4(void) {
    func_802BCFC4(64.0f, 0.0f, 0x800, 0);
}
void ActionToxBox5(void) {
    func_802BCFC4(-64.0f, 0.0f, -0x800, 0);
}
void ActionToxBox6(void) {
    func_802BCFC4(0.0f, -64.0f, 0, 0x800);
}
void ActionToxBox7(void) {
    func_802BCFC4(0.0f, 64.0f, 0, -0x800);
}

void ActionToxBox1(void) {
    o->oForwardVel = 0.0f;
    if (o->oTimer == 0)
        func_802BCF78();
    o->oPosY = o->oHomeY + 3.0f;
    if (o->oTimer == 20)
        o->oAction = func_802A32E0();
}

void ActionToxBox2(void) {
    if (o->oTimer == 20)
        o->oAction = func_802A32E0();
}

void ActionToxBox3(void) {
    if (o->oTimer == 20)
        o->oAction = func_802A32E0();
}

void ActionToxBox0(void) {
    s8 *sp1C = D_8032F96C[o->oBehParams2ndByte];
    o->oAction = func_802A32A4(sp1C);
}

void (*sToxBoxActions[])(void) = { ActionToxBox0, ActionToxBox1, ActionToxBox2, ActionToxBox3,
                                   ActionToxBox4, ActionToxBox5, ActionToxBox6, ActionToxBox7 };

void bhv_tox_box_loop(void) {
    obj_call_action_function(sToxBoxActions);
    load_object_collision_model();
}
