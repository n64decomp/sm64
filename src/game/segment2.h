#ifndef SEGMENT2_H
#define SEGMENT2_H

#include "types.h"

extern u8 _segment2_mio0SegmentRomStart[];
extern u8 _segment2_mio0SegmentRomEnd[];

extern u8 seg2_level_name_table[];
extern u8 seg2_act_name_table[];
extern u8 dl_rgba16_text_begin[];
extern u8 dl_rgba16_text_end[];
extern u8 dl_ia8_text_begin[];
extern u8 dl_ia8_text_end[];
extern u8 texture_transition_star_half[];
extern u8 texture_transition_circle_half[];
extern u8 texture_transition_mario[];
extern u8 texture_transition_bowser_half[];
extern u8 texture_waterbox_water[];
extern u8 texture_waterbox_mist[];
extern u8 texture_waterbox_jrb_water[];
extern u8 texture_waterbox_unknown_water[];
extern u8 texture_waterbox_lava[];
extern Gfx dl_proj_mtx_fullscreen[];
extern u8 dl_draw_quad_verts_0123[];
extern Gfx dl_screen_transition_end[];
extern Gfx dl_transition_draw_filled_region[];
extern u8 dl_shadow_circle[];
extern u8 dl_shadow_square[];
extern u8 dl_shadow_9_verts[];
extern u8 dl_shadow_4_verts[];
extern u8 dl_shadow_end[];
extern u8 dl_skybox_begin[];
extern u8 dl_skybox_tex_settings[];
extern u8 dl_skybox_end[];
extern u8 dl_waterbox_ia16_begin[];
extern Gfx dl_waterbox_rgba16_begin[];
extern Gfx dl_waterbox_end[];
extern u8 dl_paintings_draw_ripples[];
extern u8 dl_paintings_rippling_begin[];
extern u8 dl_paintings_rippling_end[];
extern u8 dl_paintings_env_mapped_begin[];
extern u8 dl_paintings_env_mapped_end[];
extern u8 seg2_triangle_mesh[];
extern u8 seg2_mesh_order[];
extern u8* main_hud_lut[58];
extern u8 dl_hud_img_load_tex_block[];
extern u8 dl_hud_img_begin[];
extern u8 dl_hud_img_end[];
extern void *main_font_lut[];
extern Gfx dl_ia8_render_char[];
extern Gfx dl_rgba16_load_tex_block[];
extern void *main_credits_font_lut[];
extern u8* main_hud_camera_lut[6];
extern Gfx dl_draw_text_bg_box[];
extern Gfx dl_draw_triangle[];
extern void *seg2_dialog_table[];

#endif /* SEGMENT2_H */
