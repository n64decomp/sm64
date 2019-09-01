#include <ultra64.h>

#include "sm64.h"
#include "seq_ids.h"
#include "level_update.h"
#include "main.h"
#include "engine/math_util.h"
#include "area.h"
#include "profiler.h"
#include "audio/external.h"
#include "print.h"
#include "save_file.h"
#include "sound_init.h"
#include "engine/graph_node.h"
#include "paintings.h"

#define MUSIC_NONE 0xFFFF

static Vec3f unused80339DC0;
static OSMesgQueue sSoundMesgQueue;
static OSMesg sSoundMesgBuf[1];
static struct VblankHandler sSoundVblankHandler;

static u8 D_8032C6C0 = 0;
static u8 D_8032C6C4 = 0;
static u16 sCurrentMusic = MUSIC_NONE;
static u16 sCurrentShellMusic = MUSIC_NONE;
static u16 sCurrentCapMusic = MUSIC_NONE;
static u8 sPlayingInfiniteStairs = FALSE;
static u8 unused8032C6D8[16] = { 0 };
static s16 sSoundMenuModeToSoundMode[] = { SOUND_MODE_STEREO, SOUND_MODE_MONO, SOUND_MODE_HEADSET };
// Only the 20th array element is used.
static u32 menuSoundsExtra[] = { SOUND_UNKNOWN_UNK1400,
                                 SOUND_UNKNOWN_UNK1401,
                                 SOUND_UNKNOWN_UNK1402,
                                 SOUND_UNKNOWN_UNK1403,
                                 SOUND_UNKNOWN_UNK1404,
                                 SOUND_UNKNOWN_UNK1405,
                                 SOUND_UNKNOWN_UNK1406,
                                 SOUND_UNKNOWN_UNK1410,
                                 SOUND_UNKNOWN_UNK1412,
                                 SOUND_UNKNOWN_UNK1411,
                                 SOUND_UNKNOWN_UNK1414,
                                 SOUND_UNKNOWN_UNK1420,
                                 NO_SOUND,
                                 SOUND_ENVIRONMENT_BOATROCKING1,
                                 SOUND_ENVIRONMENT_ELEVATOR3,
                                 SOUND_ENVIRONMENT_UNKNOWN2,
                                 SOUND_ENVIRONMENT_WATERFALL1,
                                 SOUND_ENVIRONMENT_WATERFALL2,
                                 SOUND_ENVIRONMENT_ELEVATOR1,
                                 SOUND_ENVIRONMENT_DRONING1,
                                 SOUND_ENVIRONMENT_DRONING2,
                                 SOUND_ENVIRONMENT_ELEVATOR2,
                                 SOUND_ENVIRONMENT_WIND1,
                                 SOUND_ENVIRONMENT_WATER,
                                 SOUND_CH6_BOWSERSPITFIRE,
                                 SOUND_MOVING_UNKNOWN19,
                                 SOUND_CH6_LAKITUFLY,
                                 SOUND_CH6_AMPBUZZ,
                                 SOUND_CH6_CASTLEOUTDOORSAMBIENT,
                                 SOUND_CH9_UNK52,
                                 SOUND_CH8_UNK50,
                                 SOUND_OBJECT_BIRDS2,
                                 SOUND_ENVIRONMENT_ELEVATOR2,
                                 SOUND_CH6_BLOWWINDORFIRE_LOWPRIO,
                                 SOUND_CH6_BLOWWINDORFIRE,
                                 SOUND_ENVIRONMENT_ELEVATOR4 };
static s8 paintingEjectSoundPlayed = FALSE;

static void play_menu_sounds_extra(int a, void *b);

void func_80248C10(void) {
    D_8032C6C0 = 0;
}

void func_80248C28(s32 a) // Soften volume
{
    switch (a) {
        case 1:
            set_sound_disabled(TRUE);
            break;
        case 2:
            func_8031FFB4(0, 60, 40); // soften music
            break;
    }
    D_8032C6C0 |= a;
}

void func_80248CB8(s32 a) // harden volume
{
    switch (a) {
        case 1:
            set_sound_disabled(FALSE);
            break;
        case 2:
            func_80320040(0, 60); // unsoften?
            break;
    }
    D_8032C6C0 &= ~a;
}

void func_80248D48(void) {
    if (D_8032C6C4 == 0) {
        D_8032C6C4 = 1;
        sound_banks_disable(2, 0x037A);
    }
}

void func_80248D90(void) {
    if (D_8032C6C4 == 1) {
        D_8032C6C4 = 0;
        sound_banks_enable(2, 0x037A);
    }
}

/**
 * Sets the sound mode
 */
void set_sound_mode(u16 soundMode) {
    if (soundMode < 3) {
        audio_set_sound_mode(sSoundMenuModeToSoundMode[soundMode]);
    }
}

/**
 * Wrapper method by menu used to set the sound via flags.
 */
void play_menu_sounds(s16 soundMenuFlags) {
    if (soundMenuFlags & SOUND_MENU_FLAG_HANDAPPEAR) {
        play_sound(SOUND_MENU_HANDAPPEAR, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_HANDISAPPEAR) {
        play_sound(SOUND_MENU_HANDDISAPPEAR, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_UNKNOWN1) {
        play_sound(SOUND_MENU_UNKNOWN1, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_PINCHMARIOFACE) {
        play_sound(SOUND_MENU_PINCHMARIOFACE, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_PINCHMARIOFACE2) {
        play_sound(SOUND_MENU_PINCHMARIOFACE, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_LETGOMARIOFACE) {
        play_sound(SOUND_MENU_LETGOMARIOFACE, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_CAMERAZOOMIN) {
        play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
    } else if (soundMenuFlags & SOUND_MENU_FLAG_CAMERAZOOMOUT) {
        play_sound(SOUND_MENU_CAMERAZOOMOUT, gDefaultSoundArgs);
    }

    if (soundMenuFlags & 0x100) {
        play_menu_sounds_extra(20, NULL);
    }
}

/**
 * Plays the painting eject sound effect if it has not already been played
 */
void play_painting_eject_sound(void) {
    if (ripplingPainting != NULL
        && ripplingPainting->rippleStatus == 2) // ripple when Mario enters painting
    {
        if (paintingEjectSoundPlayed == FALSE) {
            play_sound(SOUND_GENERAL_PAINTING_EJECT,
                       gMarioStates[0].marioObj->header.gfx.cameraToObject);
        }
        paintingEjectSoundPlayed = TRUE;
    } else {
        paintingEjectSoundPlayed = FALSE;
    }
}

void play_infinite_stairs_music(void) {
    u8 shouldPlay = FALSE;

    /* Infinite stairs? */
    if (gCurrLevelNum == LEVEL_CASTLE && gCurrAreaIndex == 2 && gMarioState->numStars < 70) {
        if (gMarioState->floor != NULL && gMarioState->floor->room == 6) {
            if (gMarioState->pos[2] < 2540.0f) {
                shouldPlay = TRUE;
            }
        }
    }

    if (sPlayingInfiniteStairs ^ shouldPlay) {
        sPlayingInfiniteStairs = shouldPlay;
        if (shouldPlay) {
            play_secondary_music(SEQ_EVENT_ENDLESS_STAIRS, 0, 255, 1000);
        } else {
            func_80321080(500);
        }
    }
}

void set_background_music(u16 a, u16 seqArgs, s16 fadeTimer) {
    if (gResetTimer == 0 && seqArgs != sCurrentMusic) {
        if (gCurrCreditsEntry != 0) {
            sound_reset(7);
        } else {
            sound_reset(a);
        }

        if (!(gShouldNotPlayCastleMusic && seqArgs == SEQ_LEVEL_INSIDE_CASTLE)) {
            play_music(0, seqArgs, fadeTimer);
            sCurrentMusic = seqArgs;
        }
    }
}

void func_802491FC(s16 fadeOutTime) {
    func_803210D4(fadeOutTime);
    sCurrentMusic = MUSIC_NONE;
    sCurrentShellMusic = MUSIC_NONE;
    sCurrentCapMusic = MUSIC_NONE;
}

void func_8024924C(s16 fadeTimer) {
    func_8031F7CC(0, fadeTimer);
    sCurrentMusic = MUSIC_NONE;
    sCurrentShellMusic = MUSIC_NONE;
    sCurrentCapMusic = MUSIC_NONE;
}

void play_cutscene_music(u16 seqArgs) {
    play_music(0, seqArgs, 0);
    sCurrentMusic = seqArgs;
}

void play_shell_music(void) {
    play_music(0, SEQUENCE_ARGS(4, SEQ_EVENT_POWERUP | SEQ_VARIATION), 0);
    sCurrentShellMusic = SEQUENCE_ARGS(4, SEQ_EVENT_POWERUP | SEQ_VARIATION);
}

void stop_shell_music(void) {
    if (sCurrentShellMusic != MUSIC_NONE) {
        stop_background_music(sCurrentShellMusic);
        sCurrentShellMusic = MUSIC_NONE;
    }
}

void play_cap_music(u16 seqArgs) {
    play_music(0, seqArgs, 0);
    if (sCurrentCapMusic != MUSIC_NONE && sCurrentCapMusic != seqArgs) {
        stop_background_music(sCurrentCapMusic);
    }
    sCurrentCapMusic = seqArgs;
}

void fadeout_cap_music(void) {
    if (sCurrentCapMusic != MUSIC_NONE) {
        fadeout_background_music(sCurrentCapMusic, 600);
    }
}

void stop_cap_music(void) {
    if (sCurrentCapMusic != MUSIC_NONE) {
        stop_background_music(sCurrentCapMusic);
        sCurrentCapMusic = MUSIC_NONE;
    }
}

void play_menu_sounds_extra(s32 a, void *b) {
    play_sound(menuSoundsExtra[a], b);
}

void audio_game_loop_tick(void) {
    audio_signal_game_loop_tick();
}

/**
 * Sound processing thread. Runs at 60 FPS.
 */
void thread4_sound(UNUSED void *arg) {
    audio_init();
    sound_init();

    // Zero-out unused vector
    vec3f_copy(unused80339DC0, gVec3fZero);

    osCreateMesgQueue(&sSoundMesgQueue, sSoundMesgBuf, ARRAY_COUNT(sSoundMesgBuf));
    set_vblank_handler(1, &sSoundVblankHandler, &sSoundMesgQueue, (OSMesg) 512);

    while (TRUE) {
        OSMesg msg;

        osRecvMesg(&sSoundMesgQueue, &msg, OS_MESG_BLOCK);
        if (gResetTimer < 25) {
            struct SPTask *spTask;

            profiler_log_thread4_time();
            spTask = create_next_audio_frame_task();
            if (spTask != NULL) {
                dispatch_audio_sptask(spTask);
            }

            profiler_log_thread4_time();
        }
    }
}
