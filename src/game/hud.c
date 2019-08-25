#include <ultra64.h>

#include "sm64.h"
#include "display.h"
#include "game.h"
#include "level_update.h"
#include "camera.h"
#include "print.h"
#include "ingame_menu.h"
#include "hud.h"
#include "segment2.h"
#include "area.h"

/* Originally hud_print.c
 * This file seems to draw the in-game HUD
 **/

enum PowerMeterAnimation {
    POWER_METER_HIDDEN,
    POWER_METER_EMPHASIZED,
    POWER_METER_DEEMPHASIZING,
    POWER_METER_HIDING,
    POWER_METER_VISIBLE
};

struct PowerMeterHUD {
    s8 animation;
    s16 x;
    s16 y;
    f32 u_E8;
    s32 d_EC;
};

struct UnknownStruct803314F0 {
    u32 u_F0;
    u16 u_F4;
    u16 u_F6;
};

struct CameraHUD {
    s16 d_F8;
};

// some sort of store for shown health wedges (0-8); maybe from previous frame/update?
static s16 D_803600D0;

static struct PowerMeterHUD sPowerMeterHUD = {
    POWER_METER_HIDDEN, 140, 166, 1.0, 0x00000000,
};

static struct UnknownStruct803314F0 D_803314F0 = { 0x00000000, 0x000A, 0x0000 };

static struct CameraHUD sCameraHUD = { 0x0000 };

void render_hud_camera(s32 x, s32 y, u8 texture[]) {
    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, (u32) texture);
    gSPDisplayList(gDisplayListHead++, &dl_hud_img_load_tex_block);
    gSPTextureRectangle(gDisplayListHead++, x << 2, y << 2, (x + 15) << 2, (y + 15) << 2,
                        G_TX_RENDERTILE, 0, 0, 0x1000, 0x400);
}

void render_hud_c_buttons(s32 x, s32 y, u8 texture[]) {
    gDPSetTile(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0,
               (G_TX_NOMIRROR | G_TX_WRAP), G_TX_NOMASK, G_TX_NOLOD, (G_TX_NOMIRROR | G_TX_WRAP),
               G_TX_NOMASK, G_TX_NOLOD);
    gDPTileSync(gDisplayListHead++);
    gDPSetTile(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 2, 0, G_TX_RENDERTILE, 0,
               (G_TX_NOMIRROR | G_TX_CLAMP), 3, G_TX_NOLOD, (G_TX_NOMIRROR | G_TX_CLAMP), 3,
               G_TX_NOLOD);
    gDPSetTileSize(gDisplayListHead++, G_TX_RENDERTILE, 0, 0, 28, 28);
    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, (u32) texture);
    gDPLoadSync(gDisplayListHead++);
    gDPLoadBlock(gDisplayListHead++, G_TX_LOADTILE, 0, 0, 63, 1024);
    gSPTextureRectangle(gDisplayListHead++, x << 2, y << 2, (x + 7) << 2, (y + 7) << 2, G_TX_RENDERTILE,
                        0, 0, 0x1000, 0x400);
}

void func_802E21A4(s16 numHealthWedges) {
    u8 *(*sp34)[];

    sp34 = segmented_to_virtual(&power_meter_seg3_health_icons_030293E0);

    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1,
                       (*sp34)[numHealthWedges - 1]);
    gDPLoadSync(gDisplayListHead++);
    gDPLoadBlock(gDisplayListHead++, G_TX_LOADTILE, 0, 0, 1023, 256);
    gSP1Triangle(gDisplayListHead++, 0, 1, 2, 0);
    gSP1Triangle(gDisplayListHead++, 0, 2, 3, 0);
}

void func_802E2304(s16 numHealthWedges) {
    Mtx *sp2C;

    sp2C = alloc_display_list(0x40);

    if (sp2C == NULL)
        return;

    guTranslate(sp2C, (f32) sPowerMeterHUD.x, (f32) sPowerMeterHUD.y, 0);

    gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(sp2C++),
              (G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_PUSH));
    gSPDisplayList(gDisplayListHead++, &power_meter_seg3_dl_03029480);

    if (numHealthWedges != 0) {
        gSPDisplayList(gDisplayListHead++, &power_meter_seg3_dl_03029570);
        func_802E21A4(numHealthWedges);
        gSPDisplayList(gDisplayListHead++, &power_meter_seg3_dl_030295A0);
    }

    gSPPopMatrix(gDisplayListHead++, 0);
}

static void animate_power_meter_emphasized(void) {
    s16 hudDisplayFlags;
    hudDisplayFlags = gHudDisplay.flags;

    if (!(hudDisplayFlags & HUD_DISPLAY_FLAG_EMPHASIZE_POWER)) {
        if (sPowerMeterHUD.d_EC == 45.0)
            sPowerMeterHUD.animation = POWER_METER_DEEMPHASIZING;
    } else {
        sPowerMeterHUD.d_EC = 0;
    }
}

static void animate_power_meter_deemphasizing(void) {
    s16 speed = 5;

    if (sPowerMeterHUD.y >= 181)
        speed = 3;

    if (sPowerMeterHUD.y >= 191)
        speed = 2;

    if (sPowerMeterHUD.y >= 196)
        speed = 1;

    sPowerMeterHUD.y += speed;

    if (sPowerMeterHUD.y >= 201) {
        sPowerMeterHUD.y = 200;
        sPowerMeterHUD.animation = POWER_METER_VISIBLE;
    }
}

static void animate_power_meter_hiding(void) {
    sPowerMeterHUD.y += 20;
    if (sPowerMeterHUD.y >= 301) {
        sPowerMeterHUD.animation = POWER_METER_HIDDEN;
        sPowerMeterHUD.d_EC = 0;
    }
}

void func_802E261C(s16 numHealthWedges) {
    if (numHealthWedges < 8 && D_803600D0 == 8 && sPowerMeterHUD.animation == POWER_METER_HIDDEN) {
        sPowerMeterHUD.animation = POWER_METER_EMPHASIZED;
        sPowerMeterHUD.y = 166;
    }

    if (numHealthWedges == 8 && D_803600D0 == 7)
        sPowerMeterHUD.d_EC = 0;

    if (numHealthWedges == 8 && sPowerMeterHUD.d_EC > 45.0)
        sPowerMeterHUD.animation = POWER_METER_HIDING;

    D_803600D0 = numHealthWedges;

    if (gPlayerStatusForCamera->action & 0x2000) {
        if (sPowerMeterHUD.animation == POWER_METER_HIDDEN
            || sPowerMeterHUD.animation == POWER_METER_EMPHASIZED) {
            sPowerMeterHUD.animation = POWER_METER_DEEMPHASIZING;
            sPowerMeterHUD.y = 166;
        }
        sPowerMeterHUD.d_EC = 0;
    }
}

void render_hud_hp(void) {
    s16 shownHealthWedges = gHudDisplay.wedges;

    if (sPowerMeterHUD.animation != POWER_METER_HIDING)
        func_802E261C(shownHealthWedges);

    if (sPowerMeterHUD.animation == POWER_METER_HIDDEN)
        return;

    switch (sPowerMeterHUD.animation) {
        case POWER_METER_EMPHASIZED:
            animate_power_meter_emphasized();
            break;
        case POWER_METER_DEEMPHASIZING:
            animate_power_meter_deemphasizing();
            break;
        case POWER_METER_HIDING:
            animate_power_meter_hiding();
            break;
        default:
            break;
    }

    func_802E2304(shownHealthWedges);

    sPowerMeterHUD.d_EC += 1;
}

#ifdef VERSION_JP
#define HUD_TOP_Y 210
#else
#define HUD_TOP_Y 209
#endif

void render_hud_mario_lives(void) {
    print_text(22, HUD_TOP_Y, ","); // 'Mario Head' glyph
    print_text(38, HUD_TOP_Y, "*"); // 'X' glyph
    print_text_fmt_int(54, HUD_TOP_Y, "%d", gHudDisplay.lives);
}

void render_hud_coins(void) {
    print_text(168, HUD_TOP_Y, "+"); // 'Coin' glyph
    print_text(184, HUD_TOP_Y, "*"); // 'X' glyph
    print_text_fmt_int(198, HUD_TOP_Y, "%d", gHudDisplay.coins);
}

#ifdef VERSION_JP
#define HUD_STARS_X 247
#else
#define HUD_STARS_X 242
#endif

void render_hud_stars(void) {
    s8 showX = 0;

    if (D_803305CC == 1 && gGlobalTimer & 0x00000008)
        return;

    if (gHudDisplay.stars < 100)
        showX = 1;

    print_text(HUD_STARS_X, HUD_TOP_Y, "-"); // 'Star' glyph
    if (showX == 1)
        print_text((HUD_STARS_X + 16), HUD_TOP_Y, "*"); // 'X' glyph
    print_text_fmt_int(((showX * 14) + (HUD_STARS_X + 16)), HUD_TOP_Y, "%d", gHudDisplay.stars);
}

void func_802E29D4() {
    s16 i;

    for (i = 0; i < gHudDisplay.keys; i++)
        print_text((i * 16) + 220, 142, "/"); // unused glyph (originally for a key?)
}

void render_hud_timer(void) {
    u8 *(*hudPrintLUT)[58];
    u16 timerValFrames;
    u16 timerMins;
    u16 timerSecs;
    u16 timerFracSecs;

    hudPrintLUT = segmented_to_virtual(&seg2_hud_lut);
    timerValFrames = gHudDisplay.timer;
    timerMins = timerValFrames / (30 * 60);
    timerSecs = (timerValFrames - (timerMins * 1800)) / 30;

    timerFracSecs = ((timerValFrames - (timerMins * 1800) - (timerSecs * 30)) & 0xFFFF) / 3;

    print_text(170, 185, "TIME");
    print_text_fmt_int(229, 185, "%0d", timerMins);
    print_text_fmt_int(249, 185, "%02d", timerSecs);
    print_text_fmt_int(283, 185, "%d", timerFracSecs);
    gSPDisplayList(gDisplayListHead++, dl_hud_img_begin);
    render_hud_camera(239, 32, (*hudPrintLUT)[56]);
    render_hud_camera(274, 32, (*hudPrintLUT)[57]);
    gSPDisplayList(gDisplayListHead++, dl_hud_img_end);
}

void set_camera_status(s16 a0) {
    sCameraHUD.d_F8 = a0;
}

void show_camera_status(void) {
    u8 *(*cameraLUT)[6];
    s32 x;
    s32 y;

    cameraLUT = segmented_to_virtual(&seg2_hud_camera_lut);
    x = 266;
    y = 205;

    if (sCameraHUD.d_F8 == 0)
        return;

    gSPDisplayList(gDisplayListHead++, dl_hud_img_begin);
    render_hud_camera(x, y, (*cameraLUT)[0]);

    switch (sCameraHUD.d_F8 & 0x07) {
        case 1 << 0: // 1
            render_hud_camera(x + 16, y, (*cameraLUT)[1]);
            break;
        case 1 << 1: // 2
            render_hud_camera(x + 16, y, (*cameraLUT)[2]);
            break;
        case 1 << 2: // 4
            render_hud_camera(x + 16, y, (*cameraLUT)[3]);
            break;
    }

    switch (sCameraHUD.d_F8 & 0x18) {
        case 1 << 3: // 8
            render_hud_c_buttons(x + 4, y + 16, (*cameraLUT)[5]);
            break;
        case 1 << 4: // 16
            render_hud_c_buttons(x + 4, y - 8, (*cameraLUT)[4]);
            break;
    }

    gSPDisplayList(gDisplayListHead++, dl_hud_img_end);
}

void render_hud(void) {
    s16 hudDisplayFlags;

    hudDisplayFlags = gHudDisplay.flags;

    if (hudDisplayFlags == HUD_DISPLAY_NONE) {
        sPowerMeterHUD.animation = POWER_METER_HIDDEN;
        D_803600D0 = 8;
        sPowerMeterHUD.d_EC = 0;
    } else {
        dl_add_new_ortho_matrix();

        if (gCurrentArea != NULL && gCurrentArea->camera->currPreset == CAMERA_PRESET_INSIDE_CANNON)
            RenderHudCannonReticle();

        if (hudDisplayFlags & HUD_DISPLAY_FLAG_LIVES)
            render_hud_mario_lives();

        if (hudDisplayFlags & HUD_DISPLAY_FLAG_COIN_COUNT)
            render_hud_coins();

        if (hudDisplayFlags & HUD_DISPLAY_FLAG_STAR_COUNT)
            render_hud_stars();

        if (hudDisplayFlags & HUD_DISPLAY_FLAG_UNKNOWN_0010)
            func_802E29D4();

        if (hudDisplayFlags & HUD_DISPLAY_FLAG_CAMERA_AND_POWER) {
            render_hud_hp();
            show_camera_status();
        }

        if (hudDisplayFlags & HUD_DISPLAY_FLAG_TIMER)
            render_hud_timer();
    }
}
