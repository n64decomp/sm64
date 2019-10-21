// intro_peach.inc.c

void func_8029A87C(struct Object *o, f32 b, f32 c) {
    Vec3f sp2C;
    s16 sp2A, sp28;
    f32 sp24, sp20;

    vec3f_get_dist_and_angle(gCameraStatus.pos, gCameraStatus.focus, &sp24, &sp2A, &sp28);
    vec3f_set_dist_and_angle(gCameraStatus.pos, sp2C, o->oIntroPeachUnk110, o->oIntroPeachUnk10C + sp2A,
                             o->oIntroPeachUnk108 + sp28);
    vec3f_to_object_pos(o, sp2C);
    sp20 = o->oOpacity;
    camera_approach_f32_symmetric_bool(&sp20, b, c);
    o->oOpacity = sp20;
}

void bhv_intro_peach_loop(void) {
    switch (gCurrentObject->oAction) {
        case 0:
            gCurrentObject->oAction += 1;
            gCurrentObject->oFaceAnglePitch = 0x400;
            gCurrentObject->oFaceAngleYaw = 0x7500;
            gCurrentObject->oFaceAngleRoll = -0x3700;
            gCurrentObject->oIntroPeachUnk110 = 186.f;
            gCurrentObject->oIntroPeachUnk10C = -9984.f;
            gCurrentObject->oIntroPeachUnk108 = -768.f;
            gCurrentObject->oOpacity = 255;
            gCurrentObject->header.gfx.unk38.animFrame = 100;
            break;
        case 1:
            func_8029A87C(gCurrentObject, 0.f, 0.f);

            if (gCurrentObject->oTimer > 20)
                gCurrentObject->oAction += 1;
            break;
        case 2:
            func_8029A87C(gCurrentObject, 255.f, 3.f);

            if ((gCurrentObject->oTimer > 100) && (get_dialog_id() == -1))
                gCurrentObject->oAction += 1;
            break;
        case 3:
            func_8029A87C(gCurrentObject, 0.f, 8.f);

            if (gCurrentObject->oTimer > 60)
                mark_object_for_deletion(gCurrentObject);
            break;
    }
}
