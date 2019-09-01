// sound_birds.inc.c

void bhv_birds_sound_loop(void) {
    if (gCurrLevelCamera->currPreset == CAMERA_PRESET_BEHIND_MARIO)
        return;

    switch (o->oBehParams2ndByte) {
        case 0:
            PlaySound(SOUND_CH9_UNK52);
            break;

        case 1:
            PlaySound(SOUND_CH8_UNK50);
            break;

        case 2:
            PlaySound(SOUND_OBJECT_BIRDS2);
            break;
    }
}
