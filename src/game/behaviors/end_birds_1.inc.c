// end_birds_1.inc.c

void bhv_end_birds_1_loop(void) {
    Vec3f sp34;
    UNUSED f32 sp30 = RandomFloat();

    switch (gCurrentObject->oAction) {
        case 0:
            obj_scale(0.7f);
            gCurrentObject->oIntroLakituUnk110 = -554.f;
            gCurrentObject->oIntroLakituUnk10C = 3044.f;
            gCurrentObject->oIntroLakituUnk108 = -1314.f;
            gCurrentObject->oAction += 1;
            break;
        case 1:
            vec3f_set(sp34, gCurrentObject->oIntroLakituUnk110, gCurrentObject->oIntroLakituUnk10C,
                      gCurrentObject->oIntroLakituUnk108);

            if (gCurrentObject->oTimer < 100)
                obj_rotate_towards_point(gCurrentObject, sp34, 0, 0, 0x20, 0x20);
            if ((gCurrentObject->oEndBirdUnk104 == 0.f) && (gCurrentObject->oTimer == 0))
                PlaySound2(SOUND_GENERAL_BIRDS_FLY_AWAY);
            if (gCutsceneTimer == 0)
                mark_object_for_deletion(gCurrentObject);
            break;
    }

    func_802A2A38();
}
