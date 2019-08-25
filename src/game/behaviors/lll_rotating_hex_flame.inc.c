// lll_rotating_hex_flame.c.inc

void bhv_lll_rotating_hex_flame_loop(void) {
    f32 sp24 = o->oLllRotatingHexFlameUnkF4;
    f32 sp20 = o->oLllRotatingHexFlameUnkF8;
    f32 sp1C = o->oLllRotatingHexFlameUnkFC;
    obj_set_pos_relative(o->parentObj, sp24, sp20, sp1C);
    o->oPosY = o->parentObj->oPosY + 100.0f;
    if (o->parentObj->oAction == 3)
        mark_object_for_deletion(o);
}

void func_802BB9F0(s16 a0) {
    struct Object *sp2C;
    UNUSED s32 unused;
    s32 i;
    s32 sp20;
    f32 sp1C = sins(a0) * 200.0f;
    f32 sp18 = coss(a0) * 200.0f;
    sp20 = (o->oBehParams2ndByte == 0) ? 4 : 3;
    for (i = 0; i < sp20; i++) {
        sp2C = spawn_object(o, MODEL_RED_FLAME, bhvLllRotatingHexFlame);
        sp2C->oLllRotatingHexFlameUnkF4 += sp1C;
        sp2C->oLllRotatingHexFlameUnkF8 = o->oPosY - 200.0f;
        sp2C->oLllRotatingHexFlameUnkFC += sp18;
        scale_object_xyz(sp2C, 6.0f, 6.0f, 6.0f);
        sp1C += sins(a0) * 150.0f;
        sp18 += coss(a0) * 150.0f;
    }
}

void ActionRotatingCwFireBars0(void) {
    if (o->oDistanceToMario < 3000.0f)
        o->oAction = 1;
}

void ActionRotatingCwFireBars1(void) {
    func_802BB9F0(0);
    func_802BB9F0(-0x8000);
    o->oAngleVelYaw = 0;
    o->oMoveAngleYaw = 0;
    o->oAction = 2;
}

void ActionRotatingCwFireBars2(void) {
    o->oAngleVelYaw = -0x100;
    o->oMoveAngleYaw += o->oAngleVelYaw;
    if (o->oDistanceToMario > 3200.0f)
        o->oAction = 3;
}

void ActionRotatingCwFireBars3(void) {
    o->oAction = 0;
}

void (*sRotatingCwFireBarsActions[])(void) = { ActionRotatingCwFireBars0, ActionRotatingCwFireBars1,
                                               ActionRotatingCwFireBars2, ActionRotatingCwFireBars3 };

void bhv_lll_rotating_block_fire_bars_loop(void) {
    obj_call_action_function(sRotatingCwFireBarsActions);
    if (o->oBehParams2ndByte == 0)
        load_object_collision_model();
}
