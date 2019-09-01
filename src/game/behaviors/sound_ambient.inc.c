// sound_ambient.inc.c

void bhv_ambient_sounds_init(void) {
    if (gCurrLevelCamera->currPreset == CAMERA_PRESET_BEHIND_MARIO)
        return;

    play_sound(SOUND_CH6_CASTLEOUTDOORSAMBIENT, gDefaultSoundArgs);
}
