// white_puff.c.inc

void bhv_white_puff_1_loop(void) {
    f32 sp1C = 0.1f;
    f32 sp18 = 0.5f;
    if (o->oTimer == 0) {
        translate_object_xz_random(o, 40.0f);
        o->oPosY += 30.0f;
    }
    obj_scale(o->oTimer * sp18 + sp1C);
    o->oOpacity = 50;
    obj_move_using_fvel_and_gravity();
    if (o->oTimer > 4)
        mark_object_for_deletion(o);
}

void bhv_white_puff_2_loop(void) {
    if (o->oTimer == 0)
        translate_object_xz_random(o, 40.0f);
}
