/*
 * gfx_ios_wm.m — GfxWindowManagerAPI for iOS 6.
 * Display link (owned by SM64EAGLView) replaces the donor while(1) loop:
 * main_loop() registers produce_one_frame as the per-tick callback.
 * Touch input arrives via UIKit directly into N64PadView; no event pump.
 */
#import <Foundation/Foundation.h>

#include "gfx_window_manager_api.h"
#include "EAGLView.h"

static void (*s_frame_fn)(void) = NULL;

static void gfx_ios_wm_init(const char *game_name, bool start_in_fullscreen) {
    (void)game_name;
    (void)start_in_fullscreen;
    ios_bridge_make_current();
}

static void gfx_ios_wm_set_keyboard_callbacks(bool (*on_key_down)(int scancode),
        bool (*on_key_up)(int scancode), void (*on_all_keys_up)(void)) {
    (void)on_key_down;
    (void)on_key_up;
    (void)on_all_keys_up;
    // No keyboard on iPad 1 v1; touch pad feeds the controller directly.
}

static void gfx_ios_wm_set_fullscreen_changed_callback(void (*on_fullscreen_changed)(bool is_now_fullscreen)) {
    (void)on_fullscreen_changed;
}

static void gfx_ios_wm_set_fullscreen(bool enable) {
    (void)enable;
}

static void gfx_ios_wm_main_loop(void (*run_one_game_iter)(void)) {
    // Called once from pc_main; the display link takes over from here.
    s_frame_fn = run_one_game_iter;
    ios_bridge_set_frame_fn(run_one_game_iter);
    // Run one iteration immediately so boot doesn't wait a tick.
    run_one_game_iter();
}

static void gfx_ios_wm_get_dimensions(uint32_t *width, uint32_t *height) {
    unsigned int w = 0, h = 0;
    ios_bridge_get_dimensions(&w, &h);
    if (width) *width = (uint32_t)w;
    if (height) *height = (uint32_t)h;
}

static void gfx_ios_wm_handle_events(void) {
}

static bool gfx_ios_wm_start_frame(void) {
    ios_bridge_make_current();
    return true;
}

static void gfx_ios_wm_swap_buffers_begin(void) {
}

static void gfx_ios_wm_swap_buffers_end(void) {
    ios_bridge_present();
}

static double gfx_ios_wm_get_time(void) {
    return (double)[[NSDate date] timeIntervalSince1970];
}

struct GfxWindowManagerAPI gfx_ios_wm_api = {
    gfx_ios_wm_init,
    gfx_ios_wm_set_keyboard_callbacks,
    gfx_ios_wm_set_fullscreen_changed_callback,
    gfx_ios_wm_set_fullscreen,
    gfx_ios_wm_main_loop,
    gfx_ios_wm_get_dimensions,
    gfx_ios_wm_handle_events,
    gfx_ios_wm_start_frame,
    gfx_ios_wm_swap_buffers_begin,
    gfx_ios_wm_swap_buffers_end,
    gfx_ios_wm_get_time
};
