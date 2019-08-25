#ifndef _FILE_SELECT_H
#define _FILE_SELECT_H

#include "types.h"

#define MENU_LAYER_MAIN 1
#define MENU_LAYER_SUBMENU 2

enum MainMenuButtonStates {
    MENU_BUTTON_STATE_DEFAULT,
    MENU_BUTTON_STATE_GROWING,
    MENU_BUTTON_STATE_FULLSCREEN,
    MENU_BUTTON_STATE_SHRINKING,
    MENU_BUTTON_STATE_ZOOM_IN_OUT,
    MENU_BUTTON_STATE_ZOOM_IN,
    MENU_BUTTON_STATE_ZOOM_OUT
};

enum MenuButtonTypes {
    MENU_BUTTON_NONE = -1,  // no button selected (on main menu screen)

    // Main Menu (SELECT FILE)
    MENU_BUTTON_PLAY_FILE_A,
    MENU_BUTTON_PLAY_FILE_B,
    MENU_BUTTON_PLAY_FILE_C,
    MENU_BUTTON_PLAY_FILE_D,
    MENU_BUTTON_SCORE,
    MENU_BUTTON_COPY,
    MENU_BUTTON_ERASE,

    // Score Menu (CHECK FILE)
    MENU_BUTTON_SCORE_FILE_A,
    MENU_BUTTON_SCORE_FILE_B,
    MENU_BUTTON_SCORE_FILE_C,
    MENU_BUTTON_SCORE_FILE_D,
    MENU_BUTTON_SCORE_RETURN,
    MENU_BUTTON_SCORE_COPY_FILE,
    MENU_BUTTON_SCORE_ERASE_FILE,

    // Copy Menu (COPY FILE)
    MENU_BUTTON_COPY_FILE_A,
    MENU_BUTTON_COPY_FILE_B,
    MENU_BUTTON_COPY_FILE_C,
    MENU_BUTTON_COPY_FILE_D,
    MENU_BUTTON_COPY_RETURN,
    MENU_BUTTON_COPY_CHECK_SCORE,
    MENU_BUTTON_COPY_ERASE_FILE,

    // Erase Menu (ERASE FILE)
    MENU_BUTTON_ERASE_FILE_A,
    MENU_BUTTON_ERASE_FILE_B,
    MENU_BUTTON_ERASE_FILE_C,
    MENU_BUTTON_ERASE_FILE_D,
    MENU_BUTTON_ERASE_RETURN,
    MENU_BUTTON_ERASE_CHECK_SCORE,
    MENU_BUTTON_ERASE_COPY_FILE,

    // Sound Mode Menu (SOUND SELECT)
    MENU_BUTTON_SOUND_MODE,
    MENU_BUTTON_STEREO,
    MENU_BUTTON_MONO,
    MENU_BUTTON_HEADSET
};

extern Gfx main_menu_seg7_dl_070073A0[];
extern Gfx main_menu_seg7_dl_070073B8[];
extern Gfx dl_rgba16_text_begin[];
extern Gfx dl_rgba16_text_end[];
extern Gfx dl_ia8_text_begin[];
extern Gfx dl_ia8_text_end[];
extern Gfx main_menu_seg7_dl_0700D108[];
extern Gfx main_menu_seg7_dl_0700D160[];
extern u8 seg2_level_name_table[];
extern u32 gGlobalTimer;

extern void beh_yellow_background_menu_init(void);
extern void beh_yellow_background_menu_loop(void);
extern void bhvMenuButton_init(void);
extern void bhvMenuButton_loop(void);
extern void bhvMenuButtonManager_init(void);
extern void bhvMenuButtonManager_loop(void);
extern Gfx *Geo18_80176688(s32 run, UNUSED struct GraphNode *node, UNUSED f32 mtx[4][4]);
extern void LevelProc_801766DC(UNUSED s32 a, UNUSED s32 b);
extern s32 LevelProc_801768A0(UNUSED s32 a, UNUSED s32 b);

#endif /* _FILE_SELECT_H */
