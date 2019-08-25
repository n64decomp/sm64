// little_cage.c.inc

void bhv_little_cage_2_loop(void) {
    switch (o->oAction) {
        case 0:
            if (o->oTimer == 0)
                if (func_802A377C(1)
                    & save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1))
                    obj_set_model(MODEL_TRANSPARENT_STAR);
            copy_object_pos(o, o->parentObj);
            copy_object_behavior_params(o, o->parentObj);
            if (o->parentObj->oAction == 3)
                o->oAction++;
            break;
        case 1:
            mark_object_for_deletion(o);
            func_802A3004();
            spawn_triangle_break_particles(20, 138, 0.7, 3);
            CreateStar(2500.0f, -1200.0f, 1300.0f);
            break;
    }
    o->oFaceAngleYaw += 0x400;
}

void ActionLittleCage0(void) {
    if (o->oUnknownUnk88 != 0)
        o->oAction = 1;
    load_object_collision_model();
}

void ActionLittleCage1(void) {
    if (o->oUnknownUnk88 != 1)
        o->oAction = 2;
    o->oMoveAngleYaw += 0x800;
    load_object_collision_model();
}

void ActionLittleCage2(void) {
    obj_update_floor_and_walls();
    obj_move_standard(78);
    if (o->oMoveFlags & (8 | 1))
        o->oAction = 3;
}

void ActionLittleCage3(void) {
    obj_hide();
}

void (*sLittleCageActions[])(void) = { ActionLittleCage0, ActionLittleCage1, ActionLittleCage2,
                                       ActionLittleCage3 };

void bhv_little_cage_loop(void) {
    obj_call_action_function(sLittleCageActions);
}
