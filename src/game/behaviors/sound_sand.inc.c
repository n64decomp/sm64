// sound_sand.inc.c

void bhv_sand_sound_loop(void) {
    if (gCurrLevelCamera->currPreset == CAMERA_PRESET_BEHIND_MARIO)
        return;

    PlaySound(SOUND_ENVIRONMENT_MOVINGSAND);
}
