#include <ultra64.h>

#include "sm64.h"
#include "game.h"
#include "main.h"
#include "engine/math_util.h"
#include "memory.h"
#include "area.h"
#include "save_file.h"
#include "audio/external.h"
#include "seq_ids.h"
#include "level_update.h"
#include "sound_init.h"
#include "print.h"
#include "display.h"

#define PRESS_START_DEMO_TIMER 800

static char gLevelSelect_StageNamesText[64][16] = { "",
                                                    "",
                                                    "",
                                                    "TERESA OBAKE",
                                                    "YYAMA1 % YSLD1",
                                                    "SELECT ROOM",
                                                    "HORROR DUNGEON",
                                                    "SABAKU % PYRMD",
                                                    "BATTLE FIELD",
                                                    "YUKIYAMA2",
                                                    "POOL KAI",
                                                    "WTDG % TINBOTU",
                                                    "BIG WORLD",
                                                    "CLOCK TOWER",
                                                    "RAINBOW CRUISE",
                                                    "MAIN MAP",
                                                    "EXT1 YOKO SCRL",
                                                    "EXT7 HORI MINI",
                                                    "EXT2 TIKA LAVA",
                                                    "EXT9 SUISOU",
                                                    "EXT3 HEAVEN",
                                                    "FIREB1 % INVLC",
                                                    "WATER LAND",
                                                    "MOUNTAIN",
                                                    "ENDING",
                                                    "URANIWA",
                                                    "EXT4 MINI SLID",
                                                    "IN THE FALL",
                                                    "EXT6 MARIO FLY",
                                                    "KUPPA1",
                                                    "EXT8 BLUE SKY",
                                                    "",
                                                    "KUPPA2",
                                                    "KUPPA3",
                                                    "",
                                                    "DONKEY % SLID2",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "",
                                                    "" };

static u16 gDemoCountdown = 0;
#ifndef VERSION_JP
static s16 D_U_801A7C34 = 1;
static s16 gameOverNotPlayed = 1;
#endif

// run the demo timer on the PRESS START screen.
// this function will return a non-0 timer once
// the demo starts, signaling to the subsystem that
// the demo needs to be ran.

// don't shift this function from being the first function in the segment.
// the level scripts assume this function is the first, so it cant be moved.
int run_press_start_demo_timer(s32 timer) {
    gCurrDemoInput = NULL;

    if (timer == 0) {
        if (!gPlayer1Controller->buttonDown && !gPlayer1Controller->stickMag) {
            if ((++gDemoCountdown) == PRESS_START_DEMO_TIMER) {
                // start the demo. 800 frames has passed while
                // player is idle on PRESS START screen.

                // start the mario demo animation for the demo list.
                func_80278AD4(&gDemo, gDemoInputListID);

                // if the next demo sequence ID is the count limit, reset it back to
                // the first sequence.
                // FIXME: Why the fuck doesn't this match?
                // if((++gDemoInputListID) == gDemo.animDmaTable[0].unk0)
                if ((++gDemoInputListID) == gDemo.animDmaTable->unk0)
                    gDemoInputListID = 0;

                gCurrDemoInput = ((struct DemoInput *) gDemo.targetAnim)
                                 + 1; // add 1 (+4) to the pointer to skip the demoID.
                timer = (s8)((struct DemoInput *) gDemo.targetAnim)
                            ->timer; // TODO: see if making timer s8 matches
                gCurrSaveFileNum = 1;
                gCurrActNum = 1;
            }
        } else // activity was detected, so reset the demo countdown.
            gDemoCountdown = 0;
    }
    return timer;
}

// input loop for the level select menu. updates the selected stage
// count if an input was received. signals the stage to be started
// or the level select to be exited if start or the quit combo is
// pressed.

s16 level_select_input_loop(void) {
    s32 stageChanged = FALSE;

    // perform the ID updates per each button press.
    if (gPlayer1Controller->buttonPressed & A_BUTTON)
        ++gCurrLevelNum, stageChanged = TRUE;
    if (gPlayer1Controller->buttonPressed & B_BUTTON)
        --gCurrLevelNum, stageChanged = TRUE;
    if (gPlayer1Controller->buttonPressed & U_JPAD)
        --gCurrLevelNum, stageChanged = TRUE;
    if (gPlayer1Controller->buttonPressed & D_JPAD)
        ++gCurrLevelNum, stageChanged = TRUE;
    if (gPlayer1Controller->buttonPressed & L_JPAD)
        gCurrLevelNum -= 10, stageChanged = TRUE;
    if (gPlayer1Controller->buttonPressed & R_JPAD)
        gCurrLevelNum += 10, stageChanged = TRUE;

    // if the stage was changed, play the sound for changing a stage.
    if (stageChanged)
        play_sound(SOUND_GENERAL_EXITPAINTING4, gDefaultSoundArgs);

    // TODO: enum counts for the stage lists
    if (gCurrLevelNum > LEVEL_MAX)
        gCurrLevelNum = LEVEL_MIN; // exceeded max. set to min.

    if (gCurrLevelNum < LEVEL_MIN)
        gCurrLevelNum = LEVEL_MAX; // exceeded min. set to max.

    gCurrSaveFileNum = 4; // file 4 is used for level select tests
    gCurrActNum = 6;
    print_text_centered(160, 80, "SELECT STAGE");
    print_text_centered(160, 30, "PRESS START BUTTON");
    print_text_fmt_int(40, 60, "%2d", gCurrLevelNum);
    print_text(80, 60, gLevelSelect_StageNamesText[gCurrLevelNum - 1]); // print stage name

#define QUIT_LEVEL_SELECT_COMBO (Z_TRIG | START_BUTTON | L_CBUTTONS | R_CBUTTONS)

    // start being pressed signals the stage to be started. that is, unless...
    if (gPlayer1Controller->buttonPressed & START_BUTTON) {
        // ... the level select quit combo is being pressed, which uses START. If this
        // is the case, quit the menu instead.
        if (gPlayer1Controller->buttonDown == QUIT_LEVEL_SELECT_COMBO) {
            gDebugLevelSelect = 0;
            return -1;
        }
        play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
        return gCurrLevelNum;
    }
    return 0;
}

int func_8016F3CC(void) {
    s32 sp1C = 0;

#ifndef VERSION_JP
    if (D_U_801A7C34 == 1) {
        if (gGlobalTimer < 0x81) {
            play_sound(SOUND_MARIO_HELLO, gDefaultSoundArgs);
        } else {
            play_sound(SOUND_MARIO_PRESSSTARTTOPLAY, gDefaultSoundArgs);
        }
        D_U_801A7C34 = 0;
    }
#endif
    print_intro_text();

    if (gPlayer1Controller->buttonPressed & START_BUTTON) {
#ifdef VERSION_JP
        play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
        sp1C = 100 + gDebugLevelSelect;
#else
        play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
        sp1C = 100 + gDebugLevelSelect;
        D_U_801A7C34 = 1;
#endif
    }
    return run_press_start_demo_timer(sp1C);
}

int func_8016F444(void) {
    s32 sp1C = 0;

#ifndef VERSION_JP
    if (gameOverNotPlayed == 1) {
        play_sound(SOUND_MARIO_GAMEOVER, gDefaultSoundArgs);
        gameOverNotPlayed = 0;
    }
#endif

    print_intro_text();

    if (gPlayer1Controller->buttonPressed & START_BUTTON) {
        play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
        sp1C = 100 + gDebugLevelSelect;
#ifndef VERSION_JP
        gameOverNotPlayed = 1;
#endif
    }
    return run_press_start_demo_timer(sp1C);
}

int func_8016F4BC(void) {
    set_background_music(0, SEQ_SOUND_PLAYER, 0);
    play_sound(SOUND_MENU_COINITSAMEMARIO, gDefaultSoundArgs);
    return 1;
}

s32 LevelProc_8016F508(s16 arg1, UNUSED s32 arg2) {
    s32 retVar;

    switch (arg1) {
        case 0:
            retVar = func_8016F4BC();
            break;
        case 1:
            retVar = func_8016F3CC();
            break;
        case 2:
            retVar = func_8016F444();
            break;
        case 3:
            retVar = level_select_input_loop();
            break; // useless break needed to match
    }
    return retVar;
}
