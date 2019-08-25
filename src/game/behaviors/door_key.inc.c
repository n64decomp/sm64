// door_key.c.inc

Gfx *Geo18_802BA2B0(s32 run, struct GraphNode *node, UNUSED f32 mtx[4][4]) {
    struct Object *sp4;
    if (run == TRUE) {
        sp4 = (struct Object *) D_8032CFA0;
        ((struct GraphNodeScaleOptionalDisplayList *) node->next)->scale = sp4->oUnknownUnkF4_F32;
    }
    return 0;
}

void bhv_door_key_1_loop(void) {
    s32 sp1C;
    sp1C = o->header.gfx.unk38.animFrame;
    set_obj_animation_and_sound_state(0);
    if (sp1C < 38)
        o->oDoorKey1UnkF4 = 0.0f;
    else if (sp1C < 49)
        o->oDoorKey1UnkF4 = 0.2f;
    else if (sp1C < 58)
        o->oDoorKey1UnkF4 = (sp1C - 53) * 0.11875f + 0.2; // 0.11875?
    else if (sp1C < 59)
        o->oDoorKey1UnkF4 = 1.1f;
    else if (sp1C < 60)
        o->oDoorKey1UnkF4 = 1.05f;
    else
        o->oDoorKey1UnkF4 = 1.0f;
    if (o->oTimer > 150)
        mark_object_for_deletion(o);
}

void bhv_door_key_2_loop(void) {
    s32 sp1C = o->header.gfx.unk38.animFrame;
    set_obj_animation_and_sound_state(1);
    if (sp1C < 38)
        o->oDoorKey2UnkF4 = 0.2f;
    else if (sp1C < 52)
        o->oDoorKey2UnkF4 = (sp1C - 42) * 0.042857f + 0.2; // TODO 3/70?
    else if (sp1C < 94)
        o->oDoorKey2UnkF4 = 0.8f;
    else if (sp1C < 0x65)
        o->oDoorKey2UnkF4 = (101 - sp1C) * 0.085714f + 0.2; // TODO 6/70?
    else
        o->oDoorKey2UnkF4 = 0.2f;
    if (o->oTimer > 138)
        mark_object_for_deletion(o);
}
