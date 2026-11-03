#ifdef ENABLE_GFX_DUMMY
#include <time.h>
#include <errno.h>

#include "gfx_window_manager_api.h"
#include "gfx_rendering_api.h"

static void gfx_dummy_wm_init(const char *game_name, bool start_in_fullscreen) {
}

static void gfx_dummy_wm_set_keyboard_callbacks(bool (*on_key_down)(int scancode), bool (*on_key_up)(int scancode), void (*on_all_keys_up)(void)) {
}

static void gfx_dummy_wm_set_fullscreen_changed_callback(void (*on_fullscreen_changed)(bool is_now_fullscreen)) {
}

static void gfx_dummy_wm_set_fullscreen(bool enable) {
}

static void gfx_dummy_wm_main_loop(void (*run_one_game_iter)(void)) {
    while (1) {
        run_one_game_iter();
    }
}

static void gfx_dummy_wm_get_dimensions(uint32_t *width, uint32_t *height) {
    *width = 320;
    *height = 240;
}

static void gfx_dummy_wm_handle_events(void) {
}

static bool gfx_dummy_wm_start_frame(void) {
    return true;
}

static void gfx_dummy_wm_swap_buffers_begin(void) {
}

static struct timespec gfx_dummy_wm_timediff(struct timespec t1, struct timespec t2) {
    t1.tv_sec -= t2.tv_sec;
    t1.tv_nsec -= t2.tv_nsec;
    if (t1.tv_nsec < 0) {
        t1.tv_nsec += 1000000000;
        t1.tv_sec -= 1;
    }
    return t1;
}

static struct timespec gfx_dummy_wm_timeadd(struct timespec t1, struct timespec t2) {
    t1.tv_sec += t2.tv_sec;
    t1.tv_nsec += t2.tv_nsec;
    if (t1.tv_nsec > 1000000000) {
        t1.tv_nsec -= 1000000000;
        t1.tv_sec += 1;
    }
    return t1;
}

static void gfx_dummy_wm_swap_buffers_end(void) {
    static struct timespec prev;
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    struct timespec diff = gfx_dummy_wm_timediff(t, prev);
    if (diff.tv_sec == 0 && diff.tv_nsec < 1000000000 / 30) {
        struct timespec add = {0, 1000000000 / 30};
        struct timespec next = gfx_dummy_wm_timeadd(prev, add);
        while (clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &next, NULL) == EINTR) {
        }
        prev = next;
    } else {
        prev = t;
    }
}

static double gfx_dummy_wm_get_time(void) {
    return 0.0;
}

static bool gfx_dummy_renderer_z_is_from_0_to_1(void) {
    return false;
}

static void gfx_dummy_renderer_unload_shader(struct ShaderProgram *old_prg) {
}

static void gfx_dummy_renderer_load_shader(struct ShaderProgram *new_prg) {
}

static struct ShaderProgram *gfx_dummy_renderer_create_and_load_new_shader(uint32_t shader_id) {
    return NULL;
}

static struct ShaderProgram *gfx_dummy_renderer_lookup_shader(uint32_t shader_id) {
    return NULL;
}

static void gfx_dummy_renderer_shader_get_info(struct ShaderProgram *prg, uint8_t *num_inputs, bool used_textures[2]) {
    *num_inputs = 0;
    used_textures[0] = false;
    used_textures[1] = false;
}

static uint32_t gfx_dummy_renderer_new_texture(void) {
    return 0;
}

static void gfx_dummy_renderer_select_texture(int tile, uint32_t texture_id) {
}

static void gfx_dummy_renderer_upload_texture(const uint8_t *rgba32_buf, int width, int height) {
}

static void gfx_dummy_renderer_set_sampler_parameters(int tile, bool linear_filter, uint32_t cms, uint32_t cmt) {
}

static void gfx_dummy_renderer_set_depth_test(bool depth_test) {
}

static void gfx_dummy_renderer_set_depth_mask(bool z_upd) {
}

static void gfx_dummy_renderer_set_zmode_decal(bool zmode_decal) {
}

static void gfx_dummy_renderer_set_viewport(int x, int y, int width, int height) {
}

static void gfx_dummy_renderer_set_scissor(int x, int y, int width, int height) {
}

static void gfx_dummy_renderer_set_use_alpha(bool use_alpha) {
}

static void gfx_dummy_renderer_draw_triangles(float buf_vbo[], size_t buf_vbo_len, size_t buf_vbo_num_tris) {
}

static void gfx_dummy_renderer_init(void) {
}

static void gfx_dummy_renderer_on_resize(void) {
}

static void gfx_dummy_renderer_start_frame(void) {
}

static void gfx_dummy_renderer_end_frame(void) {
}

static void gfx_dummy_renderer_finish_render(void) {
}

struct GfxWindowManagerAPI gfx_dummy_wm_api = {
    gfx_dummy_wm_init,
    gfx_dummy_wm_set_keyboard_callbacks,
    gfx_dummy_wm_set_fullscreen_changed_callback,
    gfx_dummy_wm_set_fullscreen,
    gfx_dummy_wm_main_loop,
    gfx_dummy_wm_get_dimensions,
    gfx_dummy_wm_handle_events,
    gfx_dummy_wm_start_frame,
    gfx_dummy_wm_swap_buffers_begin,
    gfx_dummy_wm_swap_buffers_end,
    gfx_dummy_wm_get_time
};

struct GfxRenderingAPI gfx_dummy_renderer_api = {
    gfx_dummy_renderer_z_is_from_0_to_1,
    gfx_dummy_renderer_unload_shader,
    gfx_dummy_renderer_load_shader,
    gfx_dummy_renderer_create_and_load_new_shader,
    gfx_dummy_renderer_lookup_shader,
    gfx_dummy_renderer_shader_get_info,
    gfx_dummy_renderer_new_texture,
    gfx_dummy_renderer_select_texture,
    gfx_dummy_renderer_upload_texture,
    gfx_dummy_renderer_set_sampler_parameters,
    gfx_dummy_renderer_set_depth_test,
    gfx_dummy_renderer_set_depth_mask,
    gfx_dummy_renderer_set_zmode_decal,
    gfx_dummy_renderer_set_viewport,
    gfx_dummy_renderer_set_scissor,
    gfx_dummy_renderer_set_use_alpha,
    gfx_dummy_renderer_draw_triangles,
    gfx_dummy_renderer_init,
    gfx_dummy_renderer_on_resize,
    gfx_dummy_renderer_start_frame,
    gfx_dummy_renderer_end_frame,
    gfx_dummy_renderer_finish_render
};
#endif
