#include <ultra64.h>

#include "sm64.h"
#include "game.h"
#include "memory.h"
#include "area.h"
#include "save_file.h"
#include "object_helpers.h"
#include "engine/behavior_script.h"
#include "ingame_menu.h"
#include "text_strings.h"
#include "audio/external.h"
#include "level_update.h"
#include "segment2.h"
#include "segment7.h"
#include "star_select.h"
#include "model_ids.h"
#include "object_list_processor.h"

static struct Object *sStarSelectIcons[8];
static s8 sCurrentMission; // The mission the course is loaded as, affects whether some objects spawn.

static u8 sObtainedStars;      // Number of obtained stars, excluding the coin star.
static s8 sVisibleStars;       // Total number of stars that appear in the act selector menu
static u8 sDefaultSelectedAct; // Act selected when the menu is first opened.

extern u8 bhvStarInActSelector[];

static s8 sSelectedAct = 0;
static s8 sSelectedStarIndex = 0;
static s32 sActSelectorMenuTimer = 0; // Delays the time until you can select an act.

void BehStarActSelectorLoop(void) {
    switch (gCurrentObject->oStarSelectorType) {
        case STAR_SELECTOR_NOT_SELECTED:
            gCurrentObject->oStarSelectorSize -= 0.1;
            if (gCurrentObject->oStarSelectorSize < 1.0)
                gCurrentObject->oStarSelectorSize = 1.0;
            gCurrentObject->oFaceAngleYaw = 0;
            break;
        case STAR_SELECTOR_SELECTED:
            gCurrentObject->oStarSelectorSize += 0.1;
            if (gCurrentObject->oStarSelectorSize > 1.3)
                gCurrentObject->oStarSelectorSize = 1.3;
            gCurrentObject->oFaceAngleYaw += 0x800;
            break;
        case STAR_SELECTOR_100_COINS:
            gCurrentObject->oFaceAngleYaw += 0x800;
            break;
    }

    obj_scale(gCurrentObject->oStarSelectorSize);
    gCurrentObject
        ->oStarSelectorTimer++; // unused timer field? only ever referenced here to my knowledge.
}

void Show100CoinStar(u8 stars) {
    if (stars & (1 << 6)) {
        // If the 100 coin star has been collected, create a new star selector next to the coin score.
        sStarSelectIcons[6] = spawn_object_abs_with_rot(gCurrentObject, 0, MODEL_STAR,
                                                        bhvStarInActSelector, 370, 24, -300, 0, 0, 0);
        sStarSelectIcons[6]->oStarSelectorSize = 0.8;
        sStarSelectIcons[6]->oStarSelectorType = STAR_SELECTOR_100_COINS;
    }
}

void BehActSelectorInit(void) {
    s16 i = 0;
    s32 selectorModelIDs[10];
    u8 stars = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

    sVisibleStars = 0;
    while (i != sObtainedStars) {
        if (stars & (1 << sVisibleStars)) // Star has been collected
        {
            selectorModelIDs[sVisibleStars] = MODEL_STAR;
            i++;
        } else // Star has not been collected
        {
            selectorModelIDs[sVisibleStars] = MODEL_TRANSPARENT_STAR;
            if (sDefaultSelectedAct == 0) // If this is the first star that has not been collected, set
                                          // the default selection to this star.
            {
                sDefaultSelectedAct = sVisibleStars + 1;
                sSelectedStarIndex = sVisibleStars;
            }
        }
        sVisibleStars++;
    }

    if (sVisibleStars == sObtainedStars
        && sVisibleStars != 6) // If the stars have been collected in order so far, show the next star.
    {
        selectorModelIDs[sVisibleStars] = MODEL_TRANSPARENT_STAR;
        sDefaultSelectedAct = sVisibleStars + 1;
        sSelectedStarIndex = sVisibleStars;
        sVisibleStars++;
    }

    if (sObtainedStars
        == 6) // If all stars have been collected, set the default selection to the last star.
        sDefaultSelectedAct = sVisibleStars;
    if (sObtainedStars == 0) //! Useless, since sDefaultSelectedAct has already been set in this
                             //! scenario by the code that shows the next uncollected star.
        sDefaultSelectedAct = 1;

    for (i = 0; i < sVisibleStars; i++) // Spawn star selector objects
    {
        sStarSelectIcons[i] =
            spawn_object_abs_with_rot(gCurrentObject, 0, selectorModelIDs[i], bhvStarInActSelector,
                                      75 + sVisibleStars * -75 + i * 152, 248, -300, 0, 0, 0);
        sStarSelectIcons[i]->oStarSelectorSize = 1.0f;
    }

    Show100CoinStar(stars);
}

void BehActSelectorLoop(void) {
    s8 i;
    u8 starIndexCounter;
    u8 stars = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

    if (sObtainedStars != 6) {
        // Sometimes, stars are not selectable even if they appear on the screen.
        // This code filters selectable and non-selectable stars.
        sSelectedAct = 0;
        handleMenuScrolling(MENU_SCROLL_HORIZONTAL, &sSelectedStarIndex, 0, sObtainedStars);
        starIndexCounter = sSelectedStarIndex;
        for (i = 0; i < sVisibleStars; i++) {
            if ((stars & (1 << i))
                || i + 1 == sDefaultSelectedAct) // Can the star be selected (is it either already
                                                 // completed or the first non-completed mission)
            {
                if (starIndexCounter == 0) // We have reached the sSelectedStarIndex-th selectable star.
                {
                    sSelectedAct = i;
                    break;
                }
                starIndexCounter--;
            }
        }
    } else {
        // If all stars are collected then they are all selectable.
        handleMenuScrolling(MENU_SCROLL_HORIZONTAL, &sSelectedStarIndex, 0, sVisibleStars - 1);
        sSelectedAct = sSelectedStarIndex;
    }

    for (i = 0; i < sVisibleStars; i++) {
        if (sSelectedAct == i)
            sStarSelectIcons[i]->oStarSelectorType = STAR_SELECTOR_SELECTED;
        else
            sStarSelectIcons[i]->oStarSelectorType = STAR_SELECTOR_NOT_SELECTED;
    }
}

static void ShowCourseNumber(void) {
    u8 courseNum[4];

    dl_add_new_translation_matrix(1, 158.0f, 81.0f, 0.0f);

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700F228);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);

    Int2Str(gCurrCourseNum, courseNum);
    if (gCurrCourseNum < 10)
        PutString(2, 152, 158, courseNum);
    else
        PutString(2, 143, 158, courseNum);

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
}

static void ShowActSelectorMenu(void) {
// TODO: EU relocates level and act name tables to translation segment 0x19
#ifndef VERSION_EU
#ifdef VERSION_JP
    unsigned char myScore[] = { TEXT_MY_SCORE };
#else
    unsigned char myScore[] = { TEXT_MYSCORE };
#endif
    unsigned char starNumbers[] = { TEXT_0 };
    u32 *levelNameTbl = (u32 *) segmented_to_virtual(seg2_level_name_table);
    u8 *currLevelName = (u8 *) segmented_to_virtual((void *) levelNameTbl[gCurrCourseNum - 1]);
    u32 *actNameTbl = (u32 *) segmented_to_virtual(seg2_act_name_table);
    u8 *selectedActName;
    s16 x;
    s16 x2;
    s8 i;

    dl_add_new_ortho_matrix();

    // Display the coin highscore.
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);

    ShowCoins(1, gCurrSaveFileNum - 1, gCurrCourseNum - 1, 155, 106);

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);

    // Display the "MY SCORE" text
    if (save_file_get_course_coin_score(gCurrSaveFileNum - 1, gCurrCourseNum - 1) != 0)
        PrintGenericText(102, 118, myScore);

    // Display the level name; add 3 to skip the number and spacing to get to the actual string to
    // center.
    x = get_str_x_pos_from_center(160, currLevelName + 3, 10.0f);
    PrintGenericText(x, 33, currLevelName + 3);

    // Display the course number.
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);

    ShowCourseNumber();

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);

    // Display the name of the selected act.
    if (sVisibleStars != 0) {
        selectedActName =
            (u8 *) segmented_to_virtual((void *) (actNameTbl[(gCurrCourseNum - 1) * 6 + sSelectedAct]));
#ifdef VERSION_JP
        x2 = get_str_x_pos_from_center(158, selectedActName, 8.0f);
#else
        x2 = get_str_x_pos_from_center(163, selectedActName, 8.0f);
#endif
        PrintRegularText(x2, 81, selectedActName);
    }

    // Display the numbers above each star.
    for (i = 1; i <= sVisibleStars; i++) {
        starNumbers[0] = i;
        PrintRegularText(i * 34 - sVisibleStars * 17 + 0x8B, 38, starNumbers);
    }

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
#endif // !VERSION_EU
}

//! @bug Another geo function missing the third param. Harmless in practice due to o32 convention.
Gfx *Geo18_80177518(s16 run, UNUSED struct GraphNode *node) {
    if (run == TRUE)
        ShowActSelectorMenu();
    return NULL;
}

void LevelProc_80177560(UNUSED s32 a, UNUSED s32 b) {
    u8 stars = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

    sCurrentMission = 0;
    sDefaultSelectedAct = 0;
    sVisibleStars = 0;
    sActSelectorMenuTimer = 0;
    sObtainedStars = save_file_get_course_star_count(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

    // Don't count 100 coin star
    if (stars & (1 << 6))
        sObtainedStars--;
}

int LevelProc_80177610(UNUSED s32 a, UNUSED s32 b) {
    if (sActSelectorMenuTimer >= 11) {
        if ((gPlayer3Controller->buttonPressed & A_BUTTON)
            || (gPlayer3Controller->buttonPressed & START_BUTTON)
            || (gPlayer3Controller->buttonPressed & B_BUTTON)) {
#ifdef VERSION_JP
            play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
#else
            play_sound(SOUND_MENU_STARSOUNDLETSAGO, gDefaultSoundArgs);
#endif
            if (sDefaultSelectedAct > sSelectedAct)
                sCurrentMission = sSelectedAct + 1;
            else
                sCurrentMission = sDefaultSelectedAct;
            D_80330534 = sSelectedAct + 1;
        }
    }
    area_update_objects();
    sActSelectorMenuTimer++;
    return sCurrentMission;
}
