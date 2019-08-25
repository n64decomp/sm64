// red_coin.c.inc

static struct ObjectHitbox sRedCoinHitbox = {
    /* interactType:      */ INTERACT_COIN,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 100,
    /* height:            */ 64,
    /* hurtboxRadius:     */ 0,
    /* hurtboxHeight:     */ 0,
};

void bhv_red_coin_init(void) {
    struct Surface *sp24;
    UNUSED f32 sp20 = find_floor(o->oPosX, o->oPosY, o->oPosZ, &sp24);
    struct Object *sp1C;

    sp1C = obj_nearest_object_with_behavior(bhvHiddenRedCoinStar);
    if (sp1C != NULL)
        o->parentObj = sp1C;
    else {
        sp1C = obj_nearest_object_with_behavior(bhvBowserCourseRedCoinStar);
        if (sp1C != NULL)
            o->parentObj = sp1C;
        else
            o->parentObj = NULL;
    }

    set_object_hitbox(o, &sRedCoinHitbox);
}

void bhv_red_coin_loop(void) {
    if (o->oInteractStatus & INT_STATUS_INTERACTED) {
        if (o->parentObj != NULL) {
            o->parentObj->oHiddenRedCoinStarCoinsCollected++;
#ifdef VERSION_JP
            create_sound_spawner(SOUND_GENERAL_REDCOIN);
#endif
            if (o->parentObj->oHiddenRedCoinStarCoinsCollected != 8) {
                SpawnOrangeNumber(o->parentObj->oHiddenRedCoinStarCoinsCollected, 0, 0, 0);
            }

#ifndef VERSION_JP
            play_sound(SOUND_MENU_COLLECTREDCOIN
                           + (((u8) o->parentObj->oHiddenRedCoinStarCoinsCollected - 1) << 16),
                       gDefaultSoundArgs);
#endif
        }

        CoinCollected();
        o->oInteractStatus = 0;
    }
}
