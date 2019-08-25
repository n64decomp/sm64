#ifndef _HUD_PRINT_H
#define _HUD_PRINT_H

#include "types.h"

/* Segment 3 */
extern u8 *power_meter_seg3_health_icons_030293E0[];
extern Gfx* power_meter_seg3_dl_03029480;     //u8 []?
extern Gfx* power_meter_seg3_dl_03029570;     //u8 []?
extern Gfx* power_meter_seg3_dl_030295A0;     //u8 []?

/* Functions */
extern void render_hud_camera(s32, s32, u8[]);
extern void render_hud_c_buttons(s32, s32, u8[]);
extern void func_802E21A4(s16);
extern void func_802E2304(s16);
extern void func_802E24A8(void);
extern void func_802E2520(void);
extern void func_802E25D4(void);
extern void func_802E261C(s16 numHealthWedges);
extern void render_hud_hp(void);
extern void render_hud_mario_lives(void);
extern void render_hud_coins(void);
extern void render_hud_stars(void);
extern void func_802E29D4(void);
extern void render_hud_timer(void);
extern void set_camera_status(s16);
extern void show_camera_status(void);
extern void render_hud(void);

#endif /* _HUD_PRINT_H */
