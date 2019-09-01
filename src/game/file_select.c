#include <ultra64.h>

#include "sm64.h"
#include "audio/external.h"
#include "behavior_data.h"
#include "engine/behavior_script.h"
#include "game.h"
#include "ingame_menu.h"
#include "object_helpers.h"
#include "engine/math_util.h"
#include "area.h"
#include "save_file.h"
#include "spawn_object.h"
#include "file_select.h"
#include "object_list_processor.h"

#include "text_strings.h"

#ifndef VERSION_JP
static s16 sSoundTextX; // The current sound mode is automatically centered on US due to the large
                        // length difference between options.
#endif
static struct Object *sMainMenuButtons[32];
static u8 sYesNoColor[2];
static s8 sSelectedButtonID = MENU_BUTTON_NONE; // The button that was most recently clicked.
static s8 sCurrentMenuLevel =
    MENU_LAYER_MAIN; // Whether we are on the main menu or one of the submenus.
static u8 sTextBaseAlpha =
    0; // Used for text opacifying. If it is below 250, it is constantly incremented.
static f32 sCursorPos[] = { 0, 0 };  // 2D position of the cursor on the screen.
static s16 sCursorClickingTimer = 0; // Determines which graphic to use for the cursor.
static s16 sClickPos[] = {
    -10000, -10000
}; // Equal to sCursorPos if clicked this frame, {-10000, -10000} otherwise.
static s8 sSelectedFile =
    -1; // Used for determining which file has been selected during copying and erasing.
static s8 sFadeOutText = 0;      // Whether to fade out text or not.
static s8 sStatusMessageId = 0;  // The message currently being displayed at the top of the menu.
static u8 sTextTransparency = 0; // Used for text fading. The alpha value of text is calculated as
                                 // sTextBaseAlpha - sTextTransparency.
static s16 sMainMenuTimer = 0; // Used to prevent buttons from being clickable as soon as a menu loads.
static s8 sSoundMode = 0;
static s8 D_801A7C04 = 0;
static s8 sAllFilesExist = 0;
static s8 D_801A7C0C = 0;
static s8 sScoreFileCoinScoreMode = 0; // Which coin score mode to use when scoring files. 0 for local
                                       // coin highscore, 1 for highscore across all files.

static unsigned char textReturn[] = { TEXT_RETURN };
static unsigned char textViewScore[] = { TEXT_CHECK_SCORE };
static unsigned char textCopyFileButton[] = { TEXT_COPY_FILE_BUTTON };
static unsigned char textEraseFileButton[] = { TEXT_ERASE_FILE_BUTTON };
static unsigned char textSoundModes[][8] = { { TEXT_STEREO }, { TEXT_MONO }, { TEXT_HEADSET } };
static unsigned char textMarioA[] = { TEXT_FILE_MARIO_A };
static unsigned char textMarioB[] = { TEXT_FILE_MARIO_B };
static unsigned char textMarioC[] = { TEXT_FILE_MARIO_C };
static unsigned char textMarioD[] = { TEXT_FILE_MARIO_D };
static unsigned char textNew[] = { TEXT_NEW };
static unsigned char starIcon[] = { 0x35, 0xff };
static unsigned char xIcon[] = { 0x32, 0xff };
static unsigned char textSelectFile[] = { TEXT_SELECT_FILE };
static unsigned char textScore[] = { TEXT_SCORE };
static unsigned char textCopy[] = { TEXT_COPY };
static unsigned char textErase[] = { TEXT_ERASE };
static unsigned char textCheckFile[] = { TEXT_CHECK_FILE };
static unsigned char textNoSavedDataExists[] = { TEXT_NO_SAVED_DATA_EXISTS };
static unsigned char textCopyFile[] = { TEXT_COPY_FILE };
static unsigned char textCopyItToWhere[] = { TEXT_COPY_IT_TO_WHERE };
static unsigned char textNoSavedDataExists2[] = { TEXT_NO_SAVED_DATA_EXISTS };
static unsigned char textCopyFinished[] = { TEXT_COPYING_COMPLETED };
static unsigned char textSavedDataExists[] = { TEXT_SAVED_DATA_EXISTS };
static unsigned char textNoFileToCopyFrom[] = { TEXT_NO_FILE_TO_COPY_FROM };
static unsigned char textYes[] = { TEXT_YES };
static unsigned char textNo[] = { TEXT_NO };

void beh_yellow_background_menu_init(void) {
    gCurrentObject->oFaceAngleYaw = 0x8000;
    gCurrentObject->oMenuButtonScale = 9.0f;
}

void beh_yellow_background_menu_loop(void) {
    obj_scale(9.0f);
}

// Test if a button was clicked
static s32 button_clicked_test(s16 x, s16 y,
                               f32 depth) // depth = 200.0 for main menu, 22.0 for submenus.
{
    f32 a = 52.4213;
    f32 newX = ((f32) x * 160.0) / (a * depth);
    f32 newY = ((f32) y * 120.0) / (a * 3.0f / 4.0f * depth);
    s16 maxX = newX + 25.0f;
    s16 minX = newX - 25.0f;
    s16 maxY = newY + 21.0f;
    s16 minY = newY - 21.0f;

    if (sClickPos[0] < maxX && minX < sClickPos[0] && sClickPos[1] < maxY && minY < sClickPos[1]) {
        return TRUE;
    }

    return FALSE;
}

// Grow from main menu, used by playing files and submenus
static void bhvMenuButton_growing_from_main_menu(struct Object *button) {
    if (button->oMenuButtonTimer < 16) {
        button->oFaceAngleYaw += 0x800;
    }
    if (button->oMenuButtonTimer < 8) {
        button->oFaceAnglePitch += 0x800;
    }
    if (button->oMenuButtonTimer >= 8 && button->oMenuButtonTimer < 16) {
        button->oFaceAnglePitch -= 0x800;
    }
    button->oParentRelativePosX -= button->oMenuButtonOrigPosX / 16.0;
    button->oParentRelativePosY -= button->oMenuButtonOrigPosY / 16.0;
    if (button->oPosZ < button->oMenuButtonOrigPosZ + 17800.0) {
        button->oParentRelativePosZ += 1112.5;
    }
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 16) {
        button->oParentRelativePosX = 0.0f;
        button->oParentRelativePosY = 0.0f;
        button->oMenuButtonState = MENU_BUTTON_STATE_FULLSCREEN;
        button->oMenuButtonTimer = 0;
    }
}
// Shrink to main menu, used by playing files and submenus
static void bhvMenuButton_shrinking_to_main_menu(struct Object *button) {
    if (button->oMenuButtonTimer < 16) {
        button->oFaceAngleYaw -= 0x800;
    }
    if (button->oMenuButtonTimer < 8) {
        button->oFaceAnglePitch -= 0x800;
    }
    if (button->oMenuButtonTimer >= 8 && button->oMenuButtonTimer < 16) {
        button->oFaceAnglePitch += 0x800;
    }
    button->oParentRelativePosX += button->oMenuButtonOrigPosX / 16.0;
    button->oParentRelativePosY += button->oMenuButtonOrigPosY / 16.0;
    if (button->oPosZ > button->oMenuButtonOrigPosZ) {
        button->oParentRelativePosZ -= 1112.5;
    }
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 16) {
        button->oParentRelativePosX = button->oMenuButtonOrigPosX;
        button->oParentRelativePosY = button->oMenuButtonOrigPosY;
        button->oMenuButtonState = MENU_BUTTON_STATE_DEFAULT;
        button->oMenuButtonTimer = 0;
    }
}
// Grow from submenu, used by scoring files
static void bhvMenuButton_growing_from_submenu(struct Object *button) {
    if (button->oMenuButtonTimer < 16) {
        button->oFaceAngleYaw += 0x800;
    }
    if (button->oMenuButtonTimer < 8) {
        button->oFaceAnglePitch += 0x800;
    }
    if (button->oMenuButtonTimer >= 8 && button->oMenuButtonTimer < 16) {
        button->oFaceAnglePitch -= 0x800;
    }
    button->oParentRelativePosX -= button->oMenuButtonOrigPosX / 16.0;
    button->oParentRelativePosY -= button->oMenuButtonOrigPosY / 16.0;
    button->oParentRelativePosZ -= 116.25;
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 16) {
        button->oParentRelativePosX = 0.0f;
        button->oParentRelativePosY = 0.0f;
        button->oMenuButtonState = MENU_BUTTON_STATE_FULLSCREEN;
        button->oMenuButtonTimer = 0;
    }
}
// Shrink to submenu, used by scoring files
static void bhvMenuButton_shrinking_to_submenu(struct Object *button) {
    if (button->oMenuButtonTimer < 16) {
        button->oFaceAngleYaw -= 0x800;
    }
    if (button->oMenuButtonTimer < 8) {
        button->oFaceAnglePitch -= 0x800;
    }
    if (button->oMenuButtonTimer >= 8 && button->oMenuButtonTimer < 16) {
        button->oFaceAnglePitch += 0x800;
    }
    button->oParentRelativePosX += button->oMenuButtonOrigPosX / 16.0;
    button->oParentRelativePosY += button->oMenuButtonOrigPosY / 16.0;
    if (button->oPosZ > button->oMenuButtonOrigPosZ) {
        button->oParentRelativePosZ += 116.25;
    }
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 16) {
        button->oParentRelativePosX = button->oMenuButtonOrigPosX;
        button->oParentRelativePosY = button->oMenuButtonOrigPosY;
        button->oMenuButtonState = MENU_BUTTON_STATE_DEFAULT;
        button->oMenuButtonTimer = 0;
    }
}
// A small increase and decrease in size
// Used by failed copy/erase/score operations and sound mode select.
static void bhvMenuButton_zoom_in_out(struct Object *button) {
    if (sCurrentMenuLevel == MENU_LAYER_MAIN) {
        if (button->oMenuButtonTimer < 4) {
            button->oParentRelativePosZ -= 20.0f;
        }
        if (button->oMenuButtonTimer >= 4) {
            button->oParentRelativePosZ += 20.0f;
        }
    } else {
        if (button->oMenuButtonTimer < 4) {
            button->oParentRelativePosZ += 20.0f;
        }
        if (button->oMenuButtonTimer >= 4) {
            button->oParentRelativePosZ -= 20.0f;
        }
    }
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 8) {
        button->oMenuButtonState = MENU_BUTTON_STATE_DEFAULT;
        button->oMenuButtonTimer = 0;
    }
}
// A small temporary increase in size
// Used while selecting a target copy file or yes/no erase prompt answer
static void bhvMenuButton_zoom_in(struct Object *button) {
    button->oMenuButtonScale += 0.0022;
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 10) {
        button->oMenuButtonState = MENU_BUTTON_STATE_DEFAULT;
        button->oMenuButtonTimer = 0;
    }
}
// A small temporary decrease in size
// Used after selecting a target copy file or yes/no erase prompt answer to undo the zoom in.
static void bhvMenuButton_zoom_out(struct Object *button) {
    button->oMenuButtonScale -= 0.0022;
    button->oMenuButtonTimer++;
    if (button->oMenuButtonTimer == 10) {
        button->oMenuButtonState = MENU_BUTTON_STATE_DEFAULT;
        button->oMenuButtonTimer = 0;
    }
}

void bhvMenuButton_init(void) {
    gCurrentObject->oMenuButtonOrigPosX = gCurrentObject->oParentRelativePosX;
    gCurrentObject->oMenuButtonOrigPosY = gCurrentObject->oParentRelativePosY;
}

void bhvMenuButton_loop(void) {
    switch (gCurrentObject->oMenuButtonState) {
        case MENU_BUTTON_STATE_DEFAULT: // Button state
            gCurrentObject->oMenuButtonOrigPosZ = gCurrentObject->oPosZ;
            break;
        case MENU_BUTTON_STATE_GROWING: // Switching from button to menu state
            if (sCurrentMenuLevel == MENU_LAYER_MAIN) {
                bhvMenuButton_growing_from_main_menu(gCurrentObject);
            }
            if (sCurrentMenuLevel == MENU_LAYER_SUBMENU) {
                bhvMenuButton_growing_from_submenu(gCurrentObject); // Only used for score files
            }
            sTextBaseAlpha = 0;
            sCursorClickingTimer = 4;
            break;
        case MENU_BUTTON_STATE_FULLSCREEN: // Menu state
            break;
        case MENU_BUTTON_STATE_SHRINKING: // Switching from menu to button state
            if (sCurrentMenuLevel == MENU_LAYER_MAIN) {
                bhvMenuButton_shrinking_to_main_menu(gCurrentObject);
            }
            if (sCurrentMenuLevel == MENU_LAYER_SUBMENU) {
                bhvMenuButton_shrinking_to_submenu(gCurrentObject); // Only used for score files
            }
            sTextBaseAlpha = 0;
            sCursorClickingTimer = 4;
            break;
        case MENU_BUTTON_STATE_ZOOM_IN_OUT:
            bhvMenuButton_zoom_in_out(gCurrentObject);
            sCursorClickingTimer = 4;
            break;
        case MENU_BUTTON_STATE_ZOOM_IN:
            bhvMenuButton_zoom_in(gCurrentObject);
            sCursorClickingTimer = 4;
            break;
        case MENU_BUTTON_STATE_ZOOM_OUT:
            bhvMenuButton_zoom_out(gCurrentObject);
            sCursorClickingTimer = 4;
            break;
    }
    obj_scale(gCurrentObject->oMenuButtonScale);
}

static void score_menu_file_exiting(struct Object *scoreFileButton, s8 scoreButtonId) {
    // Begin exit
    if (scoreFileButton->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN
        && sCursorClickingTimer == 2) {
        play_sound(SOUND_MENU_CAMERAZOOMOUT, gDefaultSoundArgs);
        scoreFileButton->oMenuButtonState = MENU_BUTTON_STATE_SHRINKING;
    }
    // End exit
    if (scoreFileButton->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT) {
        sSelectedButtonID = scoreButtonId;
        if (sCurrentMenuLevel == MENU_LAYER_SUBMENU) {
            sCurrentMenuLevel = MENU_LAYER_MAIN;
        }
    }
}

static void score_menu_create_buttons(struct Object *scoreButton) {
    // File A
    if (save_file_exists(0) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_A] =
            spawn_object_rel_with_rot(scoreButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      711, 311, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_A] =
            spawn_object_rel_with_rot(scoreButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, 711,
                                      311, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_SCORE_FILE_A]->oMenuButtonScale = 0.11111111f;
    // File B
    if (save_file_exists(1) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_B] =
            spawn_object_rel_with_rot(scoreButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      -166, 311, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_B] =
            spawn_object_rel_with_rot(scoreButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton,
                                      -166, 311, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_SCORE_FILE_B]->oMenuButtonScale = 0.11111111f;
    // File C
    if (save_file_exists(2) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_C] = spawn_object_rel_with_rot(
            scoreButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton, 711, 0, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_C] = spawn_object_rel_with_rot(
            scoreButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, 711, 0, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_SCORE_FILE_C]->oMenuButtonScale = 0.11111111f;
    // File D
    if (save_file_exists(3) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_D] =
            spawn_object_rel_with_rot(scoreButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      -166, 0, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_SCORE_FILE_D] = spawn_object_rel_with_rot(
            scoreButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, -166, 0, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_SCORE_FILE_D]->oMenuButtonScale = 0.11111111f;
    // Return to main menu button
    sMainMenuButtons[MENU_BUTTON_SCORE_RETURN] = spawn_object_rel_with_rot(
        scoreButton, MODEL_MAIN_MENU_YELLOW_FILE_BUTTON, bhvMenuButton, 711, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_SCORE_RETURN]->oMenuButtonScale = 0.11111111f;
    // Switch to copy menu button
    sMainMenuButtons[MENU_BUTTON_SCORE_COPY_FILE] = spawn_object_rel_with_rot(
        scoreButton, MODEL_MAIN_MENU_BLUE_COPY_BUTTON, bhvMenuButton, 0, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_SCORE_COPY_FILE]->oMenuButtonScale = 0.11111111f;
    // Switch to erase menu button
    sMainMenuButtons[MENU_BUTTON_SCORE_ERASE_FILE] = spawn_object_rel_with_rot(
        scoreButton, MODEL_MAIN_MENU_RED_ERASE_BUTTON, bhvMenuButton, -711, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_SCORE_ERASE_FILE]->oMenuButtonScale = 0.11111111f;
}

static void score_menu_check_clicked_buttons(struct Object *scoreButton) {
    if (scoreButton->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        s32 buttonId;

        for (buttonId = 7; buttonId < 14; buttonId++) {
            s16 buttonX = sMainMenuButtons[buttonId]->oPosX;
            s16 buttonY = sMainMenuButtons[buttonId]->oPosY;

            if (button_clicked_test(buttonX, buttonY, 22.0f) == TRUE && sMainMenuTimer >= 31) {
                // If menu button clicked
                if (buttonId == MENU_BUTTON_SCORE_RETURN || buttonId == MENU_BUTTON_SCORE_COPY_FILE
                    || buttonId == MENU_BUTTON_SCORE_ERASE_FILE) {
                    play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                    sMainMenuButtons[buttonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
                    sSelectedButtonID = buttonId;
                }
                // If file button clicked
                else {
                    if (sMainMenuTimer >= 31) {
                        // Save file exists
                        if (save_file_exists(buttonId - 7) == TRUE) {
                            play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
                            sMainMenuButtons[buttonId]->oMenuButtonState = MENU_BUTTON_STATE_GROWING;
                            sSelectedButtonID = buttonId;
                        }
                        // Save file empty
                        else {
                            play_sound(SOUND_MENU_CAMERABUZZ, gDefaultSoundArgs);
                            sMainMenuButtons[buttonId]->oMenuButtonState =
                                MENU_BUTTON_STATE_ZOOM_IN_OUT;
                            if (sMainMenuTimer >= 31) {
                                sFadeOutText = 1;
                                sMainMenuTimer = 0;
                            }
                        }
                    }
                }
                sCurrentMenuLevel = MENU_LAYER_SUBMENU;
                break;
            }
        }
    }
}

static void copy_menu_create_buttons(struct Object *copyButton) {
    // File A
    if (save_file_exists(0) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_A] =
            spawn_object_rel_with_rot(copyButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton, 711,
                                      311, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_A] = spawn_object_rel_with_rot(
            copyButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, 711, 311, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_COPY_FILE_A]->oMenuButtonScale = 0.11111111f;
    // File B
    if (save_file_exists(1) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_B] =
            spawn_object_rel_with_rot(copyButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      -166, 311, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_B] =
            spawn_object_rel_with_rot(copyButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, -166,
                                      311, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_COPY_FILE_B]->oMenuButtonScale = 0.11111111f;
    // File C
    if (save_file_exists(2) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_C] = spawn_object_rel_with_rot(
            copyButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton, 711, 0, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_C] = spawn_object_rel_with_rot(
            copyButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, 711, 0, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_COPY_FILE_C]->oMenuButtonScale = 0.11111111f;
    // File D
    if (save_file_exists(3) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_D] = spawn_object_rel_with_rot(
            copyButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton, -166, 0, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_COPY_FILE_D] = spawn_object_rel_with_rot(
            copyButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, -166, 0, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_COPY_FILE_D]->oMenuButtonScale = 0.11111111f;
    // Return to main menu button
    sMainMenuButtons[MENU_BUTTON_COPY_RETURN] = spawn_object_rel_with_rot(
        copyButton, MODEL_MAIN_MENU_YELLOW_FILE_BUTTON, bhvMenuButton, 711, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_COPY_RETURN]->oMenuButtonScale = 0.11111111f;
    // Switch to scire menu button
    sMainMenuButtons[MENU_BUTTON_COPY_CHECK_SCORE] = spawn_object_rel_with_rot(
        copyButton, MODEL_MAIN_MENU_GREEN_SCORE_BUTTON, bhvMenuButton, 0, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_COPY_CHECK_SCORE]->oMenuButtonScale = 0.11111111f;
    // Switch to erase menu button
    sMainMenuButtons[MENU_BUTTON_COPY_ERASE_FILE] = spawn_object_rel_with_rot(
        copyButton, MODEL_MAIN_MENU_RED_ERASE_BUTTON, bhvMenuButton, -711, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_COPY_ERASE_FILE]->oMenuButtonScale = 0.11111111f;
}

static void CopyMenuCopyFile(struct Object *copyButton, s32 copyFileButtonId) {
    switch (copyButton->oMenuButtonActionPhase) {
        case 0:
            if (sAllFilesExist == TRUE) {
                return;
            }
            if (save_file_exists(copyFileButtonId - 14) == TRUE) {
                play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                sMainMenuButtons[copyFileButtonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN;
                sSelectedFile = copyFileButtonId - 14;
                copyButton->oMenuButtonActionPhase = 1;
                sFadeOutText = 1;
                sMainMenuTimer = 0;
            } else {
                play_sound(SOUND_MENU_CAMERABUZZ, gDefaultSoundArgs);
                sMainMenuButtons[copyFileButtonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
                if (sMainMenuTimer >= 21) {
                    sFadeOutText = 1;
                    sMainMenuTimer = 0;
                }
            }
            break;
        case 1:
            sMainMenuButtons[copyFileButtonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
            if (save_file_exists(copyFileButtonId - 14) == FALSE) {
                play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
                copyButton->oMenuButtonActionPhase = 2;
                sFadeOutText = 1;
                sMainMenuTimer = 0;
                save_file_copy(sSelectedFile, copyFileButtonId - 14);
                sMainMenuButtons[copyFileButtonId]->header.gfx.sharedChild =
                    gLoadedGraphNodes[MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE];
                sMainMenuButtons[copyFileButtonId - 14]->header.gfx.sharedChild =
                    gLoadedGraphNodes[MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE];
            } else {
                if (MENU_BUTTON_COPY_FILE_A + sSelectedFile == copyFileButtonId) {
                    play_sound(SOUND_MENU_CAMERABUZZ, gDefaultSoundArgs);
                    sMainMenuButtons[MENU_BUTTON_COPY_FILE_A + sSelectedFile]->oMenuButtonState =
                        MENU_BUTTON_STATE_ZOOM_OUT;
                    copyButton->oMenuButtonActionPhase = 0;
                    sFadeOutText = 1;
                    return;
                }
                if (sMainMenuTimer >= 21) {
                    sFadeOutText = 1;
                    sMainMenuTimer = 0;
                }
            }
            break;
    }
}

static void copy_menu_check_clicked_buttons(struct Object *copyButton) {
    if (copyButton->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        s32 buttonId;

        for (buttonId = 14; buttonId < 21; buttonId++) {
            s16 buttonX = sMainMenuButtons[buttonId]->oPosX;
            s16 buttonY = sMainMenuButtons[buttonId]->oPosY;

            if (button_clicked_test(buttonX, buttonY, 22.0f) == TRUE) {
                // If menu button clicked
                if (buttonId == MENU_BUTTON_COPY_RETURN || buttonId == MENU_BUTTON_COPY_CHECK_SCORE
                    || buttonId == MENU_BUTTON_COPY_ERASE_FILE) {
                    if (copyButton->oMenuButtonActionPhase == 0) {
                        play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                        sMainMenuButtons[buttonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
                        sSelectedButtonID = buttonId;
                    }
                }
                // If file button clicked
                else {
                    if (sMainMenuButtons[buttonId]->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT
                        && sMainMenuTimer >= 31) {
                        CopyMenuCopyFile(copyButton, buttonId);
                    }
                }
                sCurrentMenuLevel = MENU_LAYER_SUBMENU;
                break;
            }
        }
        if (copyButton->oMenuButtonActionPhase == 2 && sMainMenuTimer >= 31) {
            copyButton->oMenuButtonActionPhase = 0;
            sMainMenuButtons[MENU_BUTTON_COPY_FILE_A + sSelectedFile]->oMenuButtonState =
                MENU_BUTTON_STATE_ZOOM_OUT;
        }
    }
}

static void erase_menu_create_buttons(struct Object *eraseButton) {
    // File A
    if (save_file_exists(0) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A] =
            spawn_object_rel_with_rot(eraseButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      711, 311, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A] =
            spawn_object_rel_with_rot(eraseButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, 711,
                                      311, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A]->oMenuButtonScale = 0.11111111f;
    // File B
    if (save_file_exists(1) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_B] =
            spawn_object_rel_with_rot(eraseButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      -166, 311, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_B] =
            spawn_object_rel_with_rot(eraseButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton,
                                      -166, 311, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_ERASE_FILE_B]->oMenuButtonScale = 0.11111111f;
    // File C
    if (save_file_exists(2) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_C] = spawn_object_rel_with_rot(
            eraseButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton, 711, 0, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_C] = spawn_object_rel_with_rot(
            eraseButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, 711, 0, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_ERASE_FILE_C]->oMenuButtonScale = 0.11111111f;
    // File D
    if (save_file_exists(3) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_D] =
            spawn_object_rel_with_rot(eraseButton, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON, bhvMenuButton,
                                      -166, 0, -100, 0, -0x8000, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_ERASE_FILE_D] = spawn_object_rel_with_rot(
            eraseButton, MODEL_MAIN_MENU_MARIO_NEW_BUTTON, bhvMenuButton, -166, 0, -100, 0, -0x8000, 0);
    }
    sMainMenuButtons[MENU_BUTTON_ERASE_FILE_D]->oMenuButtonScale = 0.11111111f;
    // Return to main menu button
    sMainMenuButtons[MENU_BUTTON_ERASE_RETURN] = spawn_object_rel_with_rot(
        eraseButton, MODEL_MAIN_MENU_YELLOW_FILE_BUTTON, bhvMenuButton, 711, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_ERASE_RETURN]->oMenuButtonScale = 0.11111111f;
    // Switch to score menu button
    sMainMenuButtons[MENU_BUTTON_ERASE_CHECK_SCORE] = spawn_object_rel_with_rot(
        eraseButton, MODEL_MAIN_MENU_GREEN_SCORE_BUTTON, bhvMenuButton, 0, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_ERASE_CHECK_SCORE]->oMenuButtonScale = 0.11111111f;
    // Switch to copy menu button
    sMainMenuButtons[MENU_BUTTON_ERASE_COPY_FILE] = spawn_object_rel_with_rot(
        eraseButton, MODEL_MAIN_MENU_BLUE_COPY_BUTTON, bhvMenuButton, -711, -388, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_ERASE_COPY_FILE]->oMenuButtonScale = 0.11111111f;
}

static void erase_menu_erase_file(struct Object *eraseButton, s32 eraseFileButtonId) {
    switch (eraseButton->oMenuButtonActionPhase) {
        case 0:
            if (save_file_exists(eraseFileButtonId - MENU_BUTTON_ERASE_FILE_A) == TRUE) {
                play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                sMainMenuButtons[eraseFileButtonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN;
                sSelectedFile = eraseFileButtonId - MENU_BUTTON_ERASE_FILE_A;
                eraseButton->oMenuButtonActionPhase = 1;
                sFadeOutText = 1;
                sMainMenuTimer = 0;
            } else {
                play_sound(SOUND_MENU_CAMERABUZZ, gDefaultSoundArgs);
                sMainMenuButtons[eraseFileButtonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
                if (sMainMenuTimer >= 21) {
                    sFadeOutText = 1;
                    sMainMenuTimer = 0;
                }
            }
            break;
        case 1:
            if (MENU_BUTTON_ERASE_FILE_A + sSelectedFile == eraseFileButtonId) {
                play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A + sSelectedFile]->oMenuButtonState =
                    MENU_BUTTON_STATE_ZOOM_OUT;
                eraseButton->oMenuButtonActionPhase = 0;
                sFadeOutText = 1;
            }
            break;
    }
}

static void erase_menu_check_clicked_buttons(struct Object *eraseButton) {
    if (eraseButton->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        s32 buttonId;

        for (buttonId = 21; buttonId < 28; buttonId++) {
            s16 buttonX = sMainMenuButtons[buttonId]->oPosX;
            s16 buttonY = sMainMenuButtons[buttonId]->oPosY;

            if (button_clicked_test(buttonX, buttonY, 22.0f) == TRUE) {
                // If menu button clicked
                if (buttonId == MENU_BUTTON_ERASE_RETURN || buttonId == MENU_BUTTON_ERASE_CHECK_SCORE
                    || buttonId == MENU_BUTTON_ERASE_COPY_FILE) {
                    if (eraseButton->oMenuButtonActionPhase == 0) {
                        play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                        sMainMenuButtons[buttonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
                        sSelectedButtonID = buttonId;
                    }
                }
                // If file button clicked
                else {
                    if (sMainMenuTimer >= 31) {
                        erase_menu_erase_file(eraseButton, buttonId);
                    }
                }
                sCurrentMenuLevel = MENU_LAYER_SUBMENU;
                break;
            }
        }
        if (eraseButton->oMenuButtonActionPhase == 2 && sMainMenuTimer >= 31) {
            eraseButton->oMenuButtonActionPhase = 0;
            sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A + sSelectedFile]->oMenuButtonState =
                MENU_BUTTON_STATE_ZOOM_OUT;
        }
    }
}

static void sound_mode_menu_create_buttons(struct Object *soundModeButton) {
    // Stereo option button
    sMainMenuButtons[MENU_BUTTON_STEREO] = spawn_object_rel_with_rot(
        soundModeButton, MODEL_MAIN_MENU_GENERIC_BUTTON, bhvMenuButton, 533, 0, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_STEREO]->oMenuButtonScale = 0.11111111f;
    // Mono option button
    sMainMenuButtons[MENU_BUTTON_MONO] = spawn_object_rel_with_rot(
        soundModeButton, MODEL_MAIN_MENU_GENERIC_BUTTON, bhvMenuButton, 0, 0, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_MONO]->oMenuButtonScale = 0.11111111f;
    // Headset option button
    sMainMenuButtons[MENU_BUTTON_HEADSET] = spawn_object_rel_with_rot(
        soundModeButton, MODEL_MAIN_MENU_GENERIC_BUTTON, bhvMenuButton, -533, 0, -100, 0, -0x8000, 0);
    sMainMenuButtons[MENU_BUTTON_HEADSET]->oMenuButtonScale = 0.11111111f;
    // Zoom in current selection
    sMainMenuButtons[29 + sSoundMode]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN;
}

static void sound_mode_menu_check_clicked_buttons(struct Object *soundModeButton) {
    if (soundModeButton->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        s32 buttonId;

        for (buttonId = 29; buttonId < 32; buttonId++) {
            s16 buttonX = sMainMenuButtons[buttonId]->oPosX;
            s16 buttonY = sMainMenuButtons[buttonId]->oPosY;

            if (button_clicked_test(buttonX, buttonY, 22.0f) == TRUE) {
                // why is this check here? it will always be true.
                if (buttonId == MENU_BUTTON_STEREO || buttonId == MENU_BUTTON_MONO
                    || buttonId == MENU_BUTTON_HEADSET) {
                    if (soundModeButton->oMenuButtonActionPhase == 0) {
                        play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
                        sMainMenuButtons[buttonId]->oMenuButtonState = MENU_BUTTON_STATE_ZOOM_IN_OUT;
                        sSelectedButtonID = buttonId;
                        sSoundMode = buttonId - 29;
                        save_file_set_sound_mode(sSoundMode);
                    }
                }
                sCurrentMenuLevel = MENU_LAYER_SUBMENU;
                break;
            }
        }
    }
}

static void main_menu_file_selected(struct Object *fileButton, s32 fileNum) {
    if (fileButton->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        D_801A7C0C = fileNum;
    }
}

static void return_to_main_menu(s16 prevMenuButtonId, struct Object *sourceButton) {
    s32 buttonID;

    if (sourceButton->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT
        && sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        play_sound(SOUND_MENU_CAMERAZOOMOUT, gDefaultSoundArgs);
        sMainMenuButtons[prevMenuButtonId]->oMenuButtonState = MENU_BUTTON_STATE_SHRINKING;
        sCurrentMenuLevel = MENU_LAYER_MAIN;
    }
    if (sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT) {
        // Hide buttons on corresponding submenu
        sSelectedButtonID = MENU_BUTTON_NONE;
        if (prevMenuButtonId == MENU_BUTTON_SCORE) {
            for (buttonID = 7; buttonID < 14; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_COPY) {
            for (buttonID = 14; buttonID < 21; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_ERASE) {
            for (buttonID = 21; buttonID < 28; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_SOUND_MODE) {
            for (buttonID = 29; buttonID < 32; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
    }
}

static void score_menu_init_from_submenu(s16 prevMenuButtonId, struct Object *sourceButton) {
    s32 buttonID;

    if (sourceButton->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT
        && sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        play_sound(SOUND_MENU_CAMERAZOOMOUT, gDefaultSoundArgs);
        sMainMenuButtons[prevMenuButtonId]->oMenuButtonState = MENU_BUTTON_STATE_SHRINKING;
        sCurrentMenuLevel = MENU_LAYER_MAIN;
    }
    if (sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT) {
        // Hide buttons on corresponding submenu
        if (prevMenuButtonId == MENU_BUTTON_SCORE) //! Not possible, this is checking if the score menu
                                                   //! was opened from the score menu!
        {
            for (buttonID = 7; buttonID < 14; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_COPY) {
            for (buttonID = 14; buttonID < 21; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_ERASE) {
            for (buttonID = 21; buttonID < 28; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        sSelectedButtonID = MENU_BUTTON_SCORE;
        play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
        sMainMenuButtons[MENU_BUTTON_SCORE]->oMenuButtonState = MENU_BUTTON_STATE_GROWING;
        score_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_SCORE]);
    }
}

static void copy_menu_init_from_submenu(s16 prevMenuButtonId, struct Object *sourceButton) {
    s32 buttonID;

    if (sourceButton->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT
        && sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        play_sound(SOUND_MENU_CAMERAZOOMOUT, gDefaultSoundArgs);
        sMainMenuButtons[prevMenuButtonId]->oMenuButtonState = MENU_BUTTON_STATE_SHRINKING;
        sCurrentMenuLevel = MENU_LAYER_MAIN;
    }
    if (sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT) {
        // Hide buttons on corresponding submenu
        if (prevMenuButtonId == MENU_BUTTON_SCORE) {
            for (buttonID = 7; buttonID < 14; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_COPY) //! Not possible, this is checking if the copy menu
                                                  //! was opened from the copy menu!
        {
            for (buttonID = 14; buttonID < 21; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_ERASE) {
            for (buttonID = 21; buttonID < 28; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        sSelectedButtonID = MENU_BUTTON_COPY;
        play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
        sMainMenuButtons[MENU_BUTTON_COPY]->oMenuButtonState = MENU_BUTTON_STATE_GROWING;
        copy_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_COPY]);
    }
}

static void erase_menu_init_from_submenu(s16 prevMenuButtonId, struct Object *sourceButton) {
    s32 buttonID;

    if (sourceButton->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT
        && sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_FULLSCREEN) {
        play_sound(SOUND_MENU_CAMERAZOOMOUT, gDefaultSoundArgs);
        sMainMenuButtons[prevMenuButtonId]->oMenuButtonState = MENU_BUTTON_STATE_SHRINKING;
        sCurrentMenuLevel = MENU_LAYER_MAIN;
    }
    if (sMainMenuButtons[prevMenuButtonId]->oMenuButtonState == MENU_BUTTON_STATE_DEFAULT) {
        // Hide buttons on corresponding submenu
        if (prevMenuButtonId == MENU_BUTTON_SCORE) {
            for (buttonID = 7; buttonID < 14; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_COPY) {
            for (buttonID = 14; buttonID < 21; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        if (prevMenuButtonId == MENU_BUTTON_ERASE) //! Not possible, this is checking if the erase menu
                                                   //! was opened from the erase menu!
        {
            for (buttonID = 21; buttonID < 28; buttonID++) {
                mark_obj_for_deletion(sMainMenuButtons[buttonID]);
            }
        }
        sSelectedButtonID = MENU_BUTTON_ERASE;
        play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
        sMainMenuButtons[MENU_BUTTON_ERASE]->oMenuButtonState = MENU_BUTTON_STATE_GROWING;
        erase_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_ERASE]);
    }
}
// Create buttons on the main menu. Unlike buttons on submenus, these are never hidden or recreated.
void bhvMenuButtonManager_init(void) {
    // File A
    if (save_file_exists(0) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_A] =
            spawn_object_rel_with_rot(gCurrentObject, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE,
                                      bhvMenuButton, -6400, 2800, 0, 0, 0, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_A] =
            spawn_object_rel_with_rot(gCurrentObject, 10, bhvMenuButton, -6400, 2800, 0, 0, 0, 0);
    }
    sMainMenuButtons[MENU_BUTTON_PLAY_FILE_A]->oMenuButtonScale = 1.0f;
    // File B
    if (save_file_exists(1) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_B] =
            spawn_object_rel_with_rot(gCurrentObject, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE,
                                      bhvMenuButton, 1500, 2800, 0, 0, 0, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_B] =
            spawn_object_rel_with_rot(gCurrentObject, MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE,
                                      bhvMenuButton, 1500, 2800, 0, 0, 0, 0);
    }
    sMainMenuButtons[MENU_BUTTON_PLAY_FILE_B]->oMenuButtonScale = 1.0f;
    // File C
    if (save_file_exists(2) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_C] =
            spawn_object_rel_with_rot(gCurrentObject, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE,
                                      bhvMenuButton, -6400, 0, 0, 0, 0, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_C] = spawn_object_rel_with_rot(
            gCurrentObject, MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE, bhvMenuButton, -6400, 0, 0, 0, 0, 0);
    }
    sMainMenuButtons[MENU_BUTTON_PLAY_FILE_C]->oMenuButtonScale = 1.0f;
    // File D
    if (save_file_exists(3) == TRUE) {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_D] = spawn_object_rel_with_rot(
            gCurrentObject, MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE, bhvMenuButton, 1500, 0, 0, 0, 0, 0);
    } else {
        sMainMenuButtons[MENU_BUTTON_PLAY_FILE_D] = spawn_object_rel_with_rot(
            gCurrentObject, MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE, bhvMenuButton, 1500, 0, 0, 0, 0, 0);
    }
    sMainMenuButtons[MENU_BUTTON_PLAY_FILE_D]->oMenuButtonScale = 1.0f;
    // Score menu button
    sMainMenuButtons[MENU_BUTTON_SCORE] = spawn_object_rel_with_rot(
        gCurrentObject, MODEL_MAIN_MENU_GREEN_SCORE_BUTTON, bhvMenuButton, -6400, -3500, 0, 0, 0, 0);
    sMainMenuButtons[MENU_BUTTON_SCORE]->oMenuButtonScale = 1.0f;
    // Copy menu button
    sMainMenuButtons[MENU_BUTTON_COPY] = spawn_object_rel_with_rot(
        gCurrentObject, MODEL_MAIN_MENU_BLUE_COPY_BUTTON, bhvMenuButton, -2134, -3500, 0, 0, 0, 0);
    sMainMenuButtons[MENU_BUTTON_COPY]->oMenuButtonScale = 1.0f;
    // Erase menu button
    sMainMenuButtons[MENU_BUTTON_ERASE] = spawn_object_rel_with_rot(
        gCurrentObject, MODEL_MAIN_MENU_RED_ERASE_BUTTON, bhvMenuButton, 2134, -3500, 0, 0, 0, 0);
    sMainMenuButtons[MENU_BUTTON_ERASE]->oMenuButtonScale = 1.0f;
    // Sound mode menu button
    sMainMenuButtons[MENU_BUTTON_SOUND_MODE] = spawn_object_rel_with_rot(
        gCurrentObject, MODEL_MAIN_MENU_PURPLE_SOUND_BUTTON, bhvMenuButton, 6400, -3500, 0, 0, 0, 0);
    sMainMenuButtons[MENU_BUTTON_SOUND_MODE]->oMenuButtonScale = 1.0f;

    sTextBaseAlpha = 0;
}

#ifdef VERSION_JP
#define FILE_SELECT_SOUND SOUND_MENU_STARSOUND
#else
#define FILE_SELECT_SOUND SOUND_MENU_STARSOUNDOKEYDOKEY
#endif

static void main_menu_check_clicked_buttons(void) {
    // Sound mode menu is handled separately because the ID for the sound mode menu button not grouped
    // with the IDs of the other submenus.
    if (button_clicked_test(sMainMenuButtons[MENU_BUTTON_SOUND_MODE]->oPosX,
                            sMainMenuButtons[MENU_BUTTON_SOUND_MODE]->oPosY, 200.0f)
        == TRUE) {
        sMainMenuButtons[MENU_BUTTON_SOUND_MODE]->oMenuButtonState = MENU_BUTTON_STATE_GROWING;
        sSelectedButtonID = MENU_BUTTON_SOUND_MODE;
    } else {
        s8 buttonId;

        for (buttonId = 0; buttonId < 7; buttonId++) {
            s16 buttonX = sMainMenuButtons[buttonId]->oPosX;
            s16 buttonY = sMainMenuButtons[buttonId]->oPosY;

            if (button_clicked_test(buttonX, buttonY, 200.0f) == TRUE) {
                sMainMenuButtons[buttonId]->oMenuButtonState = MENU_BUTTON_STATE_GROWING;
                sSelectedButtonID = buttonId;
                break;
            }
        }
    }

    switch (sSelectedButtonID) {
        case MENU_BUTTON_PLAY_FILE_A:
            play_sound(FILE_SELECT_SOUND, gDefaultSoundArgs);
            break;
        case MENU_BUTTON_PLAY_FILE_B:
            play_sound(FILE_SELECT_SOUND, gDefaultSoundArgs);
            break;
        case MENU_BUTTON_PLAY_FILE_C:
            play_sound(FILE_SELECT_SOUND, gDefaultSoundArgs);
            break;
        case MENU_BUTTON_PLAY_FILE_D:
            play_sound(FILE_SELECT_SOUND, gDefaultSoundArgs);
            break;
        case MENU_BUTTON_SCORE:
            play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
            score_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_SCORE]);
            break;
        case MENU_BUTTON_COPY:
            play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
            copy_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_COPY]);
            break;
        case MENU_BUTTON_ERASE:
            play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
            erase_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_ERASE]);
            break;
        case MENU_BUTTON_SOUND_MODE:
            play_sound(SOUND_MENU_CAMERAZOOMIN, gDefaultSoundArgs);
            sound_mode_menu_create_buttons(sMainMenuButtons[MENU_BUTTON_SOUND_MODE]);
            break;
    }

#undef FILE_SELECT_SOUND
}

void bhvMenuButtonManager_loop(void) {
    switch (sSelectedButtonID) {
        case MENU_BUTTON_NONE:
            main_menu_check_clicked_buttons();
            break;
        case MENU_BUTTON_PLAY_FILE_A:
            main_menu_file_selected(sMainMenuButtons[MENU_BUTTON_PLAY_FILE_A], 1);
            break;
        case MENU_BUTTON_PLAY_FILE_B:
            main_menu_file_selected(sMainMenuButtons[MENU_BUTTON_PLAY_FILE_B], 2);
            break;
        case MENU_BUTTON_PLAY_FILE_C:
            main_menu_file_selected(sMainMenuButtons[MENU_BUTTON_PLAY_FILE_C], 3);
            break;
        case MENU_BUTTON_PLAY_FILE_D:
            main_menu_file_selected(sMainMenuButtons[MENU_BUTTON_PLAY_FILE_D], 4);
            break;
        case MENU_BUTTON_SCORE:
            score_menu_check_clicked_buttons(sMainMenuButtons[MENU_BUTTON_SCORE]);
            break;
        case MENU_BUTTON_COPY:
            copy_menu_check_clicked_buttons(sMainMenuButtons[MENU_BUTTON_COPY]);
            break;
        case MENU_BUTTON_ERASE:
            erase_menu_check_clicked_buttons(sMainMenuButtons[MENU_BUTTON_ERASE]);
            break;

        case MENU_BUTTON_SCORE_FILE_A:
            score_menu_file_exiting(sMainMenuButtons[MENU_BUTTON_SCORE_FILE_A], MENU_BUTTON_SCORE);
            break;
        case MENU_BUTTON_SCORE_FILE_B:
            score_menu_file_exiting(sMainMenuButtons[MENU_BUTTON_SCORE_FILE_B], MENU_BUTTON_SCORE);
            break;
        case MENU_BUTTON_SCORE_FILE_C:
            score_menu_file_exiting(sMainMenuButtons[MENU_BUTTON_SCORE_FILE_C], MENU_BUTTON_SCORE);
            break;
        case MENU_BUTTON_SCORE_FILE_D:
            score_menu_file_exiting(sMainMenuButtons[MENU_BUTTON_SCORE_FILE_D], MENU_BUTTON_SCORE);
            break;
        case MENU_BUTTON_SCORE_RETURN:
            return_to_main_menu(MENU_BUTTON_SCORE, sMainMenuButtons[MENU_BUTTON_SCORE_RETURN]);
            break;
        case MENU_BUTTON_SCORE_COPY_FILE:
            copy_menu_init_from_submenu(MENU_BUTTON_SCORE,
                                        sMainMenuButtons[MENU_BUTTON_SCORE_COPY_FILE]);
            break;
        case MENU_BUTTON_SCORE_ERASE_FILE:
            erase_menu_init_from_submenu(MENU_BUTTON_SCORE,
                                         sMainMenuButtons[MENU_BUTTON_SCORE_ERASE_FILE]);
            break;

        case MENU_BUTTON_COPY_FILE_A:
            break;
        case MENU_BUTTON_COPY_FILE_B:
            break;
        case MENU_BUTTON_COPY_FILE_C:
            break;
        case MENU_BUTTON_COPY_FILE_D:
            break;
        case MENU_BUTTON_COPY_RETURN:
            return_to_main_menu(MENU_BUTTON_COPY, sMainMenuButtons[MENU_BUTTON_COPY_RETURN]);
            break;
        case MENU_BUTTON_COPY_CHECK_SCORE:
            score_menu_init_from_submenu(MENU_BUTTON_COPY,
                                         sMainMenuButtons[MENU_BUTTON_COPY_CHECK_SCORE]);
            break;
        case MENU_BUTTON_COPY_ERASE_FILE:
            erase_menu_init_from_submenu(MENU_BUTTON_COPY,
                                         sMainMenuButtons[MENU_BUTTON_COPY_ERASE_FILE]);
            break;

        case MENU_BUTTON_ERASE_FILE_A:
            break;
        case MENU_BUTTON_ERASE_FILE_B:
            break;
        case MENU_BUTTON_ERASE_FILE_C:
            break;
        case MENU_BUTTON_ERASE_FILE_D:
            break;
        case MENU_BUTTON_ERASE_RETURN:
            return_to_main_menu(MENU_BUTTON_ERASE, sMainMenuButtons[MENU_BUTTON_ERASE_RETURN]);
            break;
        case MENU_BUTTON_ERASE_CHECK_SCORE:
            score_menu_init_from_submenu(MENU_BUTTON_ERASE,
                                         sMainMenuButtons[MENU_BUTTON_ERASE_CHECK_SCORE]);
            break;
        case MENU_BUTTON_ERASE_COPY_FILE:
            copy_menu_init_from_submenu(MENU_BUTTON_ERASE,
                                        sMainMenuButtons[MENU_BUTTON_ERASE_COPY_FILE]);
            break;

        case MENU_BUTTON_SOUND_MODE:
            sound_mode_menu_check_clicked_buttons(sMainMenuButtons[MENU_BUTTON_SOUND_MODE]);
            break;
        case MENU_BUTTON_STEREO:
            return_to_main_menu(MENU_BUTTON_SOUND_MODE, sMainMenuButtons[MENU_BUTTON_STEREO]);
            break;
        case MENU_BUTTON_MONO:
            return_to_main_menu(MENU_BUTTON_SOUND_MODE, sMainMenuButtons[MENU_BUTTON_MONO]);
            break;
        case MENU_BUTTON_HEADSET:
            return_to_main_menu(MENU_BUTTON_SOUND_MODE, sMainMenuButtons[MENU_BUTTON_HEADSET]);
            break;
    }

    sClickPos[0] = -10000;
    sClickPos[1] = -10000;
}

static void handle_button_presses(void) {
    // If scoring a file, pressing A just changes the coin score mode.
    if (sSelectedButtonID == MENU_BUTTON_SCORE_FILE_A || sSelectedButtonID == MENU_BUTTON_SCORE_FILE_B
        || sSelectedButtonID == MENU_BUTTON_SCORE_FILE_C
        || sSelectedButtonID == MENU_BUTTON_SCORE_FILE_D) {
        if (gPlayer3Controller->buttonPressed & (B_BUTTON | START_BUTTON)) {
            sClickPos[0] = sCursorPos[0];
            sClickPos[1] = sCursorPos[1];
            sCursorClickingTimer = 1;
        } else if (gPlayer3Controller->buttonPressed & A_BUTTON) {
            sScoreFileCoinScoreMode = 1 - sScoreFileCoinScoreMode;
            play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
        }
    } else {
        if (gPlayer3Controller->buttonPressed & (A_BUTTON | B_BUTTON | START_BUTTON)) {
            sClickPos[0] = sCursorPos[0];
            sClickPos[1] = sCursorPos[1];
            sCursorClickingTimer = 1;
        }
    }
}

static void handle_controller_input(void) {
    s16 rawStickX = gPlayer3Controller->rawStickX;
    s16 rawStickY = gPlayer3Controller->rawStickY;

    // Handle deadzone
    if (rawStickY > -2 && rawStickY < 2) {
        rawStickY = 0;
    }
    if (rawStickX > -2 && rawStickX < 2) {
        rawStickX = 0;
    }

    // Move cursor
    sCursorPos[0] += rawStickX / 8;
    sCursorPos[1] += rawStickY / 8;

    // Stop cursor from going offscreen
    if (sCursorPos[0] > 132.0f) {
        sCursorPos[0] = 132.0f;
    }
    if (sCursorPos[0] < -132.0f) {
        sCursorPos[0] = -132.0f;
    }

    if (sCursorPos[1] > 90.0f) {
        sCursorPos[1] = 90.0f;
    }
    if (sCursorPos[1] < -90.0f) {
        sCursorPos[1] = -90.0f;
    }

    if (sCursorClickingTimer == 0) {
        handle_button_presses();
    }
}

static void draw_cursor(void) {
    handle_controller_input();
    dl_add_new_translation_matrix(1, sCursorPos[0] + 160.0f - 5.0, sCursorPos[1] + 120.0f - 25.0, 0.0f);
    // Get the right graphic to use for the cursor.
    if (sCursorClickingTimer == 0)
        // Idle
        gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_070073A0);
    if (sCursorClickingTimer != 0)
        // Grabbing
        gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_070073B8);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
    if (sCursorClickingTimer != 0) {
        sCursorClickingTimer++; // This is a very strange way to implement a timer? It counts up and
                                // then resets to 0 instead of just counting down to 0.
        if (sCursorClickingTimer == 5) {
            sCursorClickingTimer = 0;
        }
    }
}
// Print colorful text
static void menu_print_title_text(s8 type, s16 x, s16 y, const unsigned char *text) {
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha - sTextTransparency);
    PutString(type, x, y, text);
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
}
// Print normal white text
static void menu_print_generic_text(s16 x, s16 y, const unsigned char *text) {
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha - sTextTransparency);
    PrintGenericText(x, y, text);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
}

static s32 update_text_fade_out(void) {
    if (sFadeOutText == 1) {
        sTextTransparency += 50;
        if (sTextTransparency == 250) {
            sFadeOutText = 0;
            return TRUE;
        }
    } else {
        if (sTextTransparency > 0) {
            sTextTransparency -= 50;
        }
    }
    return FALSE;
}

static void display_file_star_count(s8 fileNum, s16 x, s16 y) {
    u8 starCountText[4];
    s8 offset = 0;
    s16 starCount;

    if (save_file_exists(fileNum) == TRUE) {
        starCount = save_file_get_total_star_count(fileNum, 0, 24);
        // Display star icon
        PutString(2, x, y, starIcon);
        // If star count is over 100, display x icon and move the star count text one digit to the
        // right.
        if (starCount < 100) {
            PutString(2, x + 16, y, xIcon);
            offset = 16;
        }
        // Display star count
        Int2Str(starCount, starCountText);
        PutString(2, x + offset + 16, y, starCountText);
    } else {
        // Display "new" text
        PutString(2, x, y, textNew);
    }
}

static void draw_main_menu(void) {
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    // Display "SELECT FILE" text
#ifdef VERSION_JP
    PutString(1, 96, 35, textSelectFile);
#else
    PutString(2, 93, 35, textSelectFile);
#endif
    // Display file star counts
    display_file_star_count(0, 92, 78);
    display_file_star_count(1, 209, 78);
    display_file_star_count(2, 92, 118);
    display_file_star_count(3, 209, 118);
    // Display menu names
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
#ifdef VERSION_JP
    PrintGenericText(50, 39, textScore);
    PrintGenericText(115, 39, textCopy);
    PrintGenericText(180, 39, textErase);
    PrintGenericText(235, 39, textSoundModes[sSoundMode]);
#else
    PrintGenericText(52, 39, textScore);
    PrintGenericText(117, 39, textCopy);
    PrintGenericText(177, 39, textErase);
    sSoundTextX = get_str_x_pos_from_center(254, textSoundModes[sSoundMode], 10.0f);
    PrintGenericText(sSoundTextX, 39, textSoundModes[sSoundMode]);
#endif
    // Display file names
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    PrintRegularText(92, 65, textMarioA);
    PrintRegularText(207, 65, textMarioB);
    PrintRegularText(92, 105, textMarioC);
    PrintRegularText(207, 105, textMarioD);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
}

static void score_menu_display_message(s8 messageID) {
    switch (messageID) {
#ifdef VERSION_JP
        case 0:
            menu_print_title_text(1, 90, 35, textCheckFile);
            break;
        case 1:
            menu_print_generic_text(90, 190, textNoSavedDataExists);
            break;
#else
        case 0:
            menu_print_title_text(2, 95, 35, textCheckFile);
            break;
        case 1:
            menu_print_generic_text(99, 190, textNoSavedDataExists);
            break;
#endif
    }
}

static void draw_score_menu(void) {
    // Update and display the message at the top of the menu.
    if (sMainMenuTimer == 20) {
        sFadeOutText = 1;
    }
    if (update_text_fade_out() == TRUE) {
        if (sStatusMessageId == 0) {
            sStatusMessageId = 1;
        } else {
            sStatusMessageId = 0;
        }
    }
    score_menu_display_message(sStatusMessageId);
    // Display file star counts
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    display_file_star_count(0, 90, 76);
    display_file_star_count(1, 211, 76);
    display_file_star_count(2, 90, 119);
    display_file_star_count(3, 211, 119);
    // Display menu names
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
#ifdef VERSION_JP
    PrintGenericText(45, 35, textReturn);
    PrintGenericText(128, 35, textCopyFileButton);
    PrintGenericText(228, 35, textEraseFileButton);
#else
    PrintGenericText(44, 35, textReturn);
    PrintGenericText(135, 35, textCopyFileButton);
    PrintGenericText(231, 35, textEraseFileButton);
#endif
    // Display file names
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    PrintRegularText(89, 62, textMarioA);
    PrintRegularText(211, 62, textMarioB);
    PrintRegularText(89, 105, textMarioC);
    PrintRegularText(211, 105, textMarioD);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
}

static void copy_menu_display_message(s8 messageId) {
    switch (messageId) {
#ifdef VERSION_JP
        case 0:
            if (sAllFilesExist == TRUE) {
                menu_print_generic_text(90, 190, textNoFileToCopyFrom);
            } else {
                menu_print_title_text(1, 90, 35, textCopyFile);
            }
            break;
        case 1:
            menu_print_generic_text(90, 190, textCopyItToWhere);
            break;
        case 2:
            menu_print_generic_text(90, 190, textNoSavedDataExists2);
            break;
        case 3:
            menu_print_generic_text(90, 190, textCopyFinished);
            break;
        case 4:
            menu_print_generic_text(90, 190, textSavedDataExists);
            break;
#else
        case 0:
            if (sAllFilesExist == TRUE) {
                menu_print_generic_text(119, 190, textNoFileToCopyFrom);
            } else {
                menu_print_title_text(2, 104, 35, textCopyFile);
            }
            break;
        case 1:
            menu_print_generic_text(109, 190, textCopyItToWhere);
            break;
        case 2:
            menu_print_generic_text(101, 190, textNoSavedDataExists2);
            break;
        case 3:
            menu_print_generic_text(110, 190, textCopyFinished);
            break;
        case 4:
            menu_print_generic_text(110, 190, textSavedDataExists);
            break;
#endif
    }
}

static void copy_menu_update_message(void) {
    switch (sMainMenuButtons[MENU_BUTTON_COPY]->oMenuButtonActionPhase) {
        case 0:
            if (sMainMenuTimer == 20) {
                sFadeOutText = 1;
            }
            if (update_text_fade_out() == TRUE) {
                if (sStatusMessageId == 0) {
                    sStatusMessageId = 2;
                } else {
                    sStatusMessageId = 0;
                }
            }
            break;
        case 1:
            if (sMainMenuTimer == 20 && sStatusMessageId == 4) {
                sFadeOutText = 1;
            }
            if (update_text_fade_out() == TRUE) {
                if (sStatusMessageId != 1) {
                    sStatusMessageId = 1;
                } else {
                    sStatusMessageId = 4;
                }
            }
            break;
        case 2:
            if (sMainMenuTimer == 20) {
                sFadeOutText = 1;
            }
            if (update_text_fade_out() == TRUE) {
                if (sStatusMessageId != 3) {
                    sStatusMessageId = 3;
                } else {
                    sStatusMessageId = 0;
                }
            }
            break;
    }
}

static void draw_copy_menu(void) {
    // Update and display the message at the top of the menu.
    copy_menu_update_message();
    copy_menu_display_message(sStatusMessageId);
    // Display file star counts
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    display_file_star_count(0, 90, 76);
    display_file_star_count(1, 211, 76);
    display_file_star_count(2, 90, 119);
    display_file_star_count(3, 211, 119);
    // Display menu names
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
#ifdef VERSION_JP
    PrintGenericText(45, 35, textReturn);
    PrintGenericText(133, 35, textViewScore);
    PrintGenericText(220, 35, textEraseFileButton);
#else
    PrintGenericText(44, 35, textReturn);
    PrintGenericText(128, 35, textViewScore);
    PrintGenericText(230, 35, textEraseFileButton);
#endif
    // Display file names
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    PrintRegularText(89, 62, textMarioA);
    PrintRegularText(211, 62, textMarioB);
    PrintRegularText(89, 105, textMarioC);
    PrintRegularText(211, 105, textMarioD);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
}

#ifdef VERSION_JP
#define TIMER_VAR1 0xA4
#define TIMER_VAR2 0x91
#else
#define TIMER_VAR1 0xA9
#define TIMER_VAR2 0x8C
#endif

static void erase_menu_yes_no_prompt(s16 x, s16 y) {
    s16 sp2E = gGlobalTimer << 12;
#ifdef VERSION_JP
    s16 sp2C = sCursorPos[0] + 160.0f;
#else
    s16 sp2C = sCursorPos[0] + (x + 0x46);
#endif
    s16 sp2A = sCursorPos[1] + 120.0f;

    if (sp2C < TIMER_VAR1 && sp2C >= TIMER_VAR2 && sp2A < 0xD2 && sp2A >= 0xBF) {
        sYesNoColor[0] = sins(sp2E) * 50.0f + 205.0f;
        sYesNoColor[1] = 150;
        D_801A7C04 = 1;
    } else if (sp2C < 0xDA && sp2C >= 0xBD && sp2A < 0xD2 && sp2A >= 0xBF) {
        sYesNoColor[0] = 150;
        sYesNoColor[1] = sins(sp2E) * 50.0f + 205.0f;
        D_801A7C04 = 2;
    } else {
        sYesNoColor[0] = 150;
        sYesNoColor[1] = 150;
        D_801A7C04 = 0;
    }
    if (sCursorClickingTimer == 2) {
        if (D_801A7C04 == 1) {
            play_sound(SOUND_MARIO_WAAAOOOW, gDefaultSoundArgs);
            sMainMenuButtons[MENU_BUTTON_ERASE]->oMenuButtonActionPhase = 2;
            sFadeOutText = 1;
            sMainMenuTimer = 0;
            save_file_erase(sSelectedFile);
            sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A + sSelectedFile]->header.gfx.sharedChild =
                gLoadedGraphNodes[MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE];
            sMainMenuButtons[sSelectedFile]->header.gfx.sharedChild =
                gLoadedGraphNodes[MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE];
            D_801A7C04 = 0;
        } else if (D_801A7C04 == 2) {
            play_sound(SOUND_MENU_CLICKFILESELECT, gDefaultSoundArgs);
            sMainMenuButtons[MENU_BUTTON_ERASE_FILE_A + sSelectedFile]->oMenuButtonState =
                MENU_BUTTON_STATE_ZOOM_OUT;
            sMainMenuButtons[MENU_BUTTON_ERASE]->oMenuButtonActionPhase = 0;
            sFadeOutText = 1;
            sMainMenuTimer = 0;
            D_801A7C04 = 0;
        }
    }
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, sYesNoColor[0], sYesNoColor[0], sYesNoColor[0], sTextBaseAlpha);
    PrintGenericText(x + 56, y, textYes);
    gDPSetEnvColor(gDisplayListHead++, sYesNoColor[1], sYesNoColor[1], sYesNoColor[1], sTextBaseAlpha);
    PrintGenericText(x + 98, y, textNo);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
}

#undef TIMER_VAR1
#undef TIMER_VAR2

static void erase_menu_display_message(s8 messageId) {
    unsigned char textEraseFile[] = { TEXT_ERASE_FILE };
    unsigned char textSure[] = { TEXT_SURE };
    unsigned char textNoSavedDataExists[] = { TEXT_NO_SAVED_DATA_EXISTS };
    unsigned char textMarioAJustErased[] = { TEXT_FILE_MARIO_A_JUST_ERASED };
    unsigned char textSavedDataExists[] = { TEXT_SAVED_DATA_EXISTS };

    switch (messageId) {
#ifdef VERSION_JP
        case 0:
            menu_print_title_text(1, 96, 35, textEraseFile);
            break;
        case 1:
            menu_print_generic_text(90, 190, textSure);
            erase_menu_yes_no_prompt(90, 190);
            break;
        case 2:
            menu_print_generic_text(90, 190, textNoSavedDataExists);
            break;
        case 3:
            textMarioAJustErased[3] = sSelectedFile + 10;
            menu_print_generic_text(90, 190, textMarioAJustErased);
            break;
        case 4:
            menu_print_generic_text(90, 190, textSavedDataExists);
            break;
    }
#else
        case 0:
            menu_print_title_text(2, 98, 35, textEraseFile);
            break;
        case 1:
            menu_print_generic_text(90, 190, textSure);
            erase_menu_yes_no_prompt(90, 190);
            break;
        case 2:
            menu_print_generic_text(100, 190, textNoSavedDataExists);
            break;
        case 3:
            textMarioAJustErased[6] = sSelectedFile + 10;
            menu_print_generic_text(100, 190, textMarioAJustErased);
            break;
        case 4:
            menu_print_generic_text(100, 190, textSavedDataExists);
            break;
    }
#endif
}

static void erase_menu_update_message(void) {
    switch (sMainMenuButtons[MENU_BUTTON_ERASE]->oMenuButtonActionPhase) {
        case 0:
            if (sMainMenuTimer == 20 && sStatusMessageId == 2) {
                sFadeOutText = 1;
            }
            if (update_text_fade_out() == TRUE) {
                if (sStatusMessageId == 0) {
                    sStatusMessageId = 2;
                } else {
                    sStatusMessageId = 0;
                }
            }
            break;
        case 1:
            if (update_text_fade_out() == TRUE) {
                if (sStatusMessageId != 1) {
                    sStatusMessageId = 1;
                }
                sCursorPos[0] = 43.0f;
                sCursorPos[1] = 80.0f;
            }
            break;
        case 2:
            if (sMainMenuTimer == 20) {
                sFadeOutText = 1;
            }
            if (update_text_fade_out() == TRUE) {
                if (sStatusMessageId != 3) {
                    sStatusMessageId = 3;
                } else {
                    sStatusMessageId = 0;
                }
            }
            break;
    }
}

static void draw_erase_menu(void) {
    // Update and display the message at the top of the menu.
    erase_menu_update_message();
    erase_menu_display_message(sStatusMessageId);
    // Display file star counts
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    display_file_star_count(0, 90, 76);
    display_file_star_count(1, 211, 76);
    display_file_star_count(2, 90, 119);
    display_file_star_count(3, 211, 119);
    // Display menu names
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
#ifdef VERSION_JP
    PrintGenericText(45, 35, textReturn);
    PrintGenericText(133, 35, textViewScore);
    PrintGenericText(223, 35, textCopyFileButton);
#else
    PrintGenericText(44, 35, textReturn);
    PrintGenericText(127, 35, textViewScore);
    PrintGenericText(233, 35, textCopyFileButton);
#endif
    // Display file names
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
    PrintRegularText(89, 62, textMarioA);
    PrintRegularText(211, 62, textMarioB);
    PrintRegularText(89, 105, textMarioC);
    PrintRegularText(211, 105, textMarioD);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
}

static void draw_sound_mode_menu(void) {
    s32 mode;
#ifndef VERSION_JP
    s16 textX;
#endif
    unsigned char textSoundSelect[] = { TEXT_SOUND_SELECT };
    // Display "SOUND SELECT" text
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
#ifdef VERSION_JP
    PutString(1, 96, 35, textSoundSelect);
#else
    PutString(2, 88, 35, textSoundSelect);
#endif
    // Display mode names
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    for (mode = 0; mode < 3; mode++) {
        if (mode == sSoundMode) {
            gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
        } else {
            gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, sTextBaseAlpha);
        }
#ifdef VERSION_JP
        PrintGenericText(mode * 74 + 67, 87, textSoundModes[mode]);
#else
        // Mode names are centered correctly on US
        textX = get_str_x_pos_from_center(mode * 74 + 87, textSoundModes[mode], 10.0f);
        PrintGenericText(textX, 87, textSoundModes[mode]);
#endif
    }
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
}

static unsigned char textStarX[] = { TEXT_STAR_X };

static void score_file_print_castle_secret_stars(s8 fileNum, s16 x, s16 y) {
    unsigned char secretStarsText[20];
    // Print "[star] x"
    PrintRegularText(x, y, textStarX);
    // Print number of castle secret stars
    Int2Str(save_file_get_total_star_count(fileNum, 15, 24), secretStarsText);
    PrintRegularText(x + 16, y, secretStarsText);
}

static void score_file_print_course_coin_score(s8 fileNum, s16 courseNum, s16 x, s16 y) {
    unsigned char coinScoreText[20];
    u8 stars = save_file_get_star_flags(fileNum, courseNum);
    unsigned char textCoinX[] = { TEXT_COIN_X };
    unsigned char textStar[] = { TEXT_STAR };
#ifdef VERSION_JP
#define LENGTH 5
#else
#define LENGTH 8
#endif
    unsigned char fileNames[][LENGTH] = {
        { TEXT_4DASHES }, // huh?
        { TEXT_SCORE_MARIO_A }, { TEXT_SCORE_MARIO_B }, { TEXT_SCORE_MARIO_C }, { TEXT_SCORE_MARIO_D },
    };
#undef LENGTH
    // MYSCORE
    if (sScoreFileCoinScoreMode == 0) {
        // Print "[coin] x"
        PrintRegularText(x + 25, y, textCoinX);
        // Print coin score
        Int2Str(save_file_get_course_coin_score(fileNum, courseNum), coinScoreText);
        PrintRegularText(x + 41, y, coinScoreText);
        // If collected, print 100 coin star
        if (stars & (1 << 6)) {
            PrintRegularText(x + 70, y, textStar);
        }
    }
    // HISCORE
    else {
#ifdef VERSION_JP
        // Print "[coin] x"
        PrintRegularText(x, y, textCoinX);
        // Print coin highscore
        Int2Str((u16) save_file_get_max_coin_score(courseNum) & 0xFFFF, coinScoreText);
        PrintRegularText(x + 16, y, coinScoreText);
        // Print coin highscore file
        PrintRegularText(x + 45, y,
                         fileNames[(save_file_get_max_coin_score(courseNum) >> 16) & 0xFFFF]);
#else
        // Print "[coin] x"
        PrintRegularText(x + 18, y, textCoinX);
        // Print coin highscore
        Int2Str((u16) save_file_get_max_coin_score(courseNum) & 0xFFFF, coinScoreText);
        PrintRegularText(x + 34, y, coinScoreText);
        // Print coin highscore file
        PrintRegularText(x + 60, y,
                         fileNames[(save_file_get_max_coin_score(courseNum) >> 16) & 0xFFFF]);
#endif
    }
}

static void score_file_print_course_star_score(s8 fileNum, s16 courseNum, s16 x, s16 y) {
    s16 i = 0;
    unsigned char starScoreText[20]; // unknown length
    u8 stars = save_file_get_star_flags(fileNum, courseNum);
    s8 starCount = save_file_get_course_star_count(fileNum, courseNum);
    // Don't count 100 coin star
    if (stars & (1 << 6)) {
        starCount--;
    }
    // Add 1 star character for every star collected
    for (i = 0; i < starCount; i++) {
        starScoreText[i] = 0xFA;
    }
    // Terminating byte
    starScoreText[i] = 0xFF;
    PrintRegularText(x, y, starScoreText);
}

static void draw_file_scores(s8 fileNum) {
// TODO: EU relocates level name table to translation segment 0x19
#ifndef VERSION_EU
    unsigned char textMario[] = { TEXT_MARIO };
#ifdef VERSION_JP
    unsigned char textFileLetter[] = { TEXT_0 };
    void **levelNameTable = segmented_to_virtual(seg2_level_name_table);
    unsigned char textHiScore[] = { TEXT_HI_SCORE };
    unsigned char textMyScore[] = { TEXT_MY_SCORE };
#else
    unsigned char textHiScore[] = { TEXT_HI_SCORE_EN };
    unsigned char textMyScore[] = { TEXT_MY_SCORE };
    unsigned char textFileLetter[] = { TEXT_0 };
    void **levelNameTable = segmented_to_virtual(seg2_level_name_table);
#endif

    textFileLetter[0] = fileNum + 0x0A; // get letter of file
    // Print file name at top
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);
#ifdef VERSION_JP
    PutString(1, 28, 15, textMario);
    PutString(2, 86, 15, textFileLetter);
#else
    PutString(2, 25, 15, textMario);
    PutString(2, 95, 15, textFileLetter);
#endif
    // Print file star count at top
    display_file_star_count(fileNum, 124, 15);
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, sTextBaseAlpha);

    //! Print course scores (for loops exist for a reason!)

#ifdef VERSION_JP
#define PADDING 0
#define PRINT_COURSE_SCORES(course, pad)                                                               \
    PrintRegularText(23 + (pad * 3), 35 + 12 * course, segmented_to_virtual(levelNameTable[course]));  \
    score_file_print_course_star_score(fileNum, course, 152, 35 + 12 * course);                        \
    score_file_print_course_coin_score(fileNum, course, 213, 35 + 12 * course);
#else
#define PADDING 1
#define PRINT_COURSE_SCORES(course, pad)                                                               \
    PrintRegularText(23 + (pad * 3), 35 + 12 * course, segmented_to_virtual(levelNameTable[course]));  \
    score_file_print_course_star_score(fileNum, course, 171, 35 + 12 * course);                        \
    score_file_print_course_coin_score(fileNum, course, 213, 35 + 12 * course);
#endif

    PRINT_COURSE_SCORES(0, PADDING)
    PRINT_COURSE_SCORES(1, PADDING)
    PRINT_COURSE_SCORES(2, PADDING)
    PRINT_COURSE_SCORES(3, PADDING)
    PRINT_COURSE_SCORES(4, PADDING)
    PRINT_COURSE_SCORES(5, PADDING)
    PRINT_COURSE_SCORES(6, PADDING)
    PRINT_COURSE_SCORES(7, PADDING)
    PRINT_COURSE_SCORES(8, PADDING)
    PRINT_COURSE_SCORES(9, 0)
    PRINT_COURSE_SCORES(10, 0)
    PRINT_COURSE_SCORES(11, 0)
    PRINT_COURSE_SCORES(12, 0)
    PRINT_COURSE_SCORES(13, 0)
    PRINT_COURSE_SCORES(14, 0)

#undef PRINT_COURSE_SCORES
#undef PADDING

#ifdef VERSION_JP
    // Print level name
    PrintRegularText(23, 215, segmented_to_virtual(levelNameTable[25]));
    // Print castle secret stars
    score_file_print_castle_secret_stars(fileNum, 152, 215);
    // Print current coin score mode
    if (sScoreFileCoinScoreMode == 0) {
        PrintRegularText(237, 24, textMyScore);
    } else {
        PrintRegularText(237, 24, textHiScore);
    }
#else
    // Print level name
    PrintRegularText(29, 215, segmented_to_virtual(levelNameTable[25]));
    // Print castle secret stars
    score_file_print_castle_secret_stars(fileNum, 171, 215);
    // Print current coin score mode
    if (sScoreFileCoinScoreMode == 0) {
        PrintRegularText(238, 24, textMyScore);
    } else {
        PrintRegularText(231, 24, textHiScore);
    }
#endif

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
#endif // !VERSION_EU
}

static void draw_current_menu(void) {
    UNUSED s32 unused1;
    UNUSED s32 unused2;

    dl_add_new_ortho_matrix();
    switch (sSelectedButtonID) {
        case MENU_BUTTON_NONE:
            draw_main_menu();
            break;
        case MENU_BUTTON_SCORE:
            draw_score_menu();
            sScoreFileCoinScoreMode = 0;
            break;
        case MENU_BUTTON_COPY:
            draw_copy_menu();
            break;
        case MENU_BUTTON_ERASE:
            draw_erase_menu();
            break;
        case MENU_BUTTON_SCORE_FILE_A:
            draw_file_scores(0);
            break;
        case MENU_BUTTON_SCORE_FILE_B:
            draw_file_scores(1);
            break;
        case MENU_BUTTON_SCORE_FILE_C:
            draw_file_scores(2);
            break;
        case MENU_BUTTON_SCORE_FILE_D:
            draw_file_scores(3);
            break;
        case MENU_BUTTON_SOUND_MODE:
            draw_sound_mode_menu();
            break;
    }
    if (save_file_exists(0) == TRUE && save_file_exists(1) == TRUE && save_file_exists(2) == TRUE
        && save_file_exists(3) == TRUE) {
        sAllFilesExist = TRUE;
    } else {
        sAllFilesExist = FALSE;
    }
    if (sTextBaseAlpha < 250) {
        sTextBaseAlpha += 10;
    }
    if (sMainMenuTimer < 1000) {
        sMainMenuTimer += 1;
    }
}

Gfx *Geo18_80176688(s32 run, UNUSED struct GraphNode *node, UNUSED f32 mtx[4][4]) {
    if (run == TRUE) {
        draw_current_menu();
        draw_cursor();
    }
    return NULL;
}
// Returning to file select screen after game overing
void LevelProc_801766DC(UNUSED s32 a, UNUSED s32 b) {
    sSelectedButtonID = MENU_BUTTON_NONE;
    sCurrentMenuLevel = MENU_LAYER_MAIN;
    sTextBaseAlpha = 0;
    // Place the cursor over the save file that was being played.
    switch (gCurrSaveFileNum) {
        case 1:
            sCursorPos[0] = -94.0f;
            sCursorPos[1] = 46.0f;
            break;
        case 2:
            sCursorPos[0] = 24.0f;
            sCursorPos[1] = 46.0f;
            break;
        case 3:
            sCursorPos[0] = -94.0f;
            sCursorPos[1] = 5.0f;
            break;
        case 4:
            sCursorPos[0] = 24.0f;
            sCursorPos[1] = 5.0f;
            break;
    }
    sClickPos[0] = -10000;
    sClickPos[1] = -10000;
    sCursorClickingTimer = 0;
    D_801A7C0C = 0;
    sSelectedFile = MENU_BUTTON_NONE;
    sFadeOutText = 0;
    sStatusMessageId = 0;
    sTextTransparency = 0;
    sMainMenuTimer = 0;
    D_801A7C04 = 0;
    sSoundMode = save_file_get_sound_mode();
}

int LevelProc_801768A0(UNUSED s32 a, UNUSED s32 b) {
    area_update_objects();
    return D_801A7C0C;
}
