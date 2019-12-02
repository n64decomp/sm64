// hidden_star.c.inc

void bhv_hidden_star_init(void) {
    s16 sp36;
    struct Object *sp30;

    sp36 = count_objects_with_behavior(bhvHiddenStarTrigger);
    if (sp36 == 0) {
        sp30 =
            spawn_object_abs_with_rot(o, 0, MODEL_STAR, bhvStar, o->oPosX, o->oPosY, o->oPosZ, 0, 0, 0);
        sp30->oBehParams = o->oBehParams;
        o->activeFlags = 0;
    }

    o->oHiddenStarTriggerCounter = 5 - sp36;
}

void bhv_hidden_star_loop(void) {
    switch (o->oAction) {
        case 0:
            if (o->oHiddenStarTriggerCounter == 5)
                o->oAction = 1;
            break;

        case 1:
            if (o->oTimer > 2) {
                func_802F1B84(o->oPosX, o->oPosY, o->oPosZ);
                func_802A3004();
                o->activeFlags = 0;
            }
            break;
    }
}

/* TODO: this is likely not a checkpoint but a Secret */
void bhv_hidden_star_trigger_loop(void) {
    struct Object *hiddenStar;
    if (are_objects_collided(o, gMarioObject) == 1) {
        hiddenStar = obj_nearest_object_with_behavior(bhvHiddenStar);
        if (hiddenStar != NULL) {
            hiddenStar->oHiddenStarTriggerCounter++;
            if (hiddenStar->oHiddenStarTriggerCounter != 5) {
                spawn_orange_number(hiddenStar->oHiddenStarTriggerCounter, 0, 0, 0);
            }

#ifdef VERSION_JP
            play_sound(SOUND_MENU_STAR_SOUND, gDefaultSoundArgs);
#else
            play_sound(SOUND_MENU_COLLECT_SECRET
                           + (((u8) hiddenStar->oHiddenStarTriggerCounter - 1) << 16),
                       gDefaultSoundArgs);
#endif
        }

        o->activeFlags = 0;
    }
}

void bhv_bowser_course_red_coin_star_loop(void) {
    gRedCoinsCollected = o->oHiddenStarTriggerCounter;
    switch (o->oAction) {
        case 0:
            if (o->oHiddenStarTriggerCounter == 8)
                o->oAction = 1;
            break;

        case 1:
            if (o->oTimer > 2) {
                func_802F1BD4(o->oPosX, o->oPosY, o->oPosZ);
                func_802A3004();
                o->activeFlags = 0;
            }
            break;
    }
}
