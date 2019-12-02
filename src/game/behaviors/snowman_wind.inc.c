// snowman_wind.c.inc

void bhv_snowman_wind_blowing_loop(void) {
    UNUSED s32 sp34;
    s16 sp32;
    Vec3f pos;
    sp34 = 0;
    if (o->oTimer == 0)
        o->oSnowmanWindBlowingUnkF4 = o->oMoveAngleYaw;
    if (o->oSubAction == 0) {
        o->oDistanceToMario = 0;
        func_802B8F7C(pos, &o->oPosX);
        set_object_pos(o, 1100, 3328, 1164);
        if (func_802A3FF8(1000.0f, 30.0f, 0x7FFF))
            o->oSubAction++;
        func_802B8F7C(&o->oPosX, pos);
    } else if (o->oSubAction == 1) {
        if (obj_update_dialog(2, 2, DIALOG_153, 0))
            o->oSubAction++;
    } else if (o->oDistanceToMario < 1500.0f && absf(gMarioObject->oPosY - o->oHomeY) < 500.0f) {
        if ((sp32 = o->oAngleToMario - o->oSnowmanWindBlowingUnkF4) > 0) {
            if (sp32 < 0x1500)
                o->oMoveAngleYaw = o->oAngleToMario;
            else
                o->oMoveAngleYaw = o->oSnowmanWindBlowingUnkF4 + 0x1500;
        } else {
            if (sp32 >= -0x14ff)
                o->oMoveAngleYaw = o->oAngleToMario;
            else
                o->oMoveAngleYaw = o->oSnowmanWindBlowingUnkF4 - 0x1500;
        }
        func_802C76E0(12, 3.0f, 0, 0, 0);
        PlaySound(SOUND_AIR_BLOW_WIND);
    }
}
