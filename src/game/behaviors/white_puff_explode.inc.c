// white_puff_explode.c.inc

void bhv_white_puff_exploding_loop(void) {
    f32 sp24;
    if (o->oTimer == 0) {
        obj_compute_vel_xz();
        o->OBJECT_FIELD_F32(0x1B) = o->header.gfx.scale[0];
        switch (o->oBehParams2ndByte) {
            case 2:
                o->oOpacity = 254;
                o->OBJECT_FIELD_S32(0x1C) = -21;
                o->OBJECT_FIELD_S32(0x1D) = 0;
                break;
            case 3:
                o->oOpacity = 254;
                o->OBJECT_FIELD_S32(0x1C) = -13;
                o->OBJECT_FIELD_S32(0x1D) = 1;
                break;
        }
    }
    obj_move_using_vel_and_gravity();
    obj_apply_drag_xz(o->oDragStrength);
    if (o->oVelY > 100.0f)
        o->oVelY = 100.0f;
    if (o->oTimer > 20)
        mark_object_for_deletion(o);
    if (o->oOpacity) {
        o->oOpacity += o->OBJECT_FIELD_S32(0x1C);
        if (o->oOpacity < 2)
            mark_object_for_deletion(o);
        if (o->OBJECT_FIELD_S32(0x1D))
            sp24 = o->OBJECT_FIELD_F32(0x1B) * ((254 - o->oOpacity) / 254.0);
        else
            sp24 = o->OBJECT_FIELD_F32(0x1B) * (o->oOpacity / 254.0);
        obj_scale(sp24);
    }
}
