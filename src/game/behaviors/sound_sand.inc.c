// sound_sand.inc.c

void bhv_sand_sound_loop(void) {
    if (gCamera->mode == CAMERA_MODE_BEHIND_MARIO)
        return;

    PlaySound(SOUND_ENV_MOVINGSAND);
}
