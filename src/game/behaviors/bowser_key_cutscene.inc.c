// bowser_key_cutscene.inc.c

Gfx *Geo18_802BA2B0(s32 run, struct GraphNode *node, UNUSED f32 mtx[4][4]) {
    struct Object *sp4;
    if (run == TRUE) {
        sp4 = (struct Object *) gCurGraphNodeObject;
        ((struct GraphNodeScale *) node->next)->scale = sp4->oUnknownUnkF4_F32;
    }
    return 0;
}

void bhv_bowser_key_unlock_door_loop(void) {
    s32 animTimer;
    animTimer = o->header.gfx.unk38.animFrame;
    set_obj_animation_and_sound_state(0);
    if (animTimer < 38)
        o->oBowserKeyUnlockDoorScale = 0.0f;
    else if (animTimer < 49)
        o->oBowserKeyUnlockDoorScale = 0.2f;
    else if (animTimer < 58)
        o->oBowserKeyUnlockDoorScale = (animTimer - 53) * 0.11875f + 0.2; // 0.11875?
    else if (animTimer < 59)
        o->oBowserKeyUnlockDoorScale = 1.1f;
    else if (animTimer < 60)
        o->oBowserKeyUnlockDoorScale = 1.05f;
    else
        o->oBowserKeyUnlockDoorScale = 1.0f;
    if (o->oTimer > 150)
        mark_object_for_deletion(o);
}

void bhv_bowser_key_course_exit_loop(void) {
    s32 animTimer = o->header.gfx.unk38.animFrame;
    set_obj_animation_and_sound_state(1);
    if (animTimer < 38)
        o->oBowserKeyCourseExitScale = 0.2f;
    else if (animTimer < 52)
        o->oBowserKeyCourseExitScale = (animTimer - 42) * 0.042857f + 0.2; // TODO 3/70?
    else if (animTimer < 94)
        o->oBowserKeyCourseExitScale = 0.8f;
    else if (animTimer < 101)
        o->oBowserKeyCourseExitScale = (101 - animTimer) * 0.085714f + 0.2; // TODO 6/70?
    else
        o->oBowserKeyCourseExitScale = 0.2f;
    if (o->oTimer > 138)
        mark_object_for_deletion(o);
}
