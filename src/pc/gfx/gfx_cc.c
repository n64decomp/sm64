#include "gfx_cc.h"

void gfx_cc_get_features(uint32_t shader_id, struct CCFeatures *cc_features) {
    for (int i = 0; i < 4; i++) {
        cc_features->c[0][i] = (shader_id >> (i * 3)) & 7;
        cc_features->c[1][i] = (shader_id >> (12 + i * 3)) & 7;
    }

    cc_features->opt_alpha = (shader_id & SHADER_OPT_ALPHA) != 0;
    cc_features->opt_fog = (shader_id & SHADER_OPT_FOG) != 0;
    cc_features->opt_texture_edge = (shader_id & SHADER_OPT_TEXTURE_EDGE) != 0;
    cc_features->opt_noise = (shader_id & SHADER_OPT_NOISE) != 0;

    cc_features->used_textures[0] = false;
    cc_features->used_textures[1] = false;
    cc_features->num_inputs = 0;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            if (cc_features->c[i][j] >= SHADER_INPUT_1 && cc_features->c[i][j] <= SHADER_INPUT_4) {
                if (cc_features->c[i][j] > cc_features->num_inputs) {
                    cc_features->num_inputs = cc_features->c[i][j];
                }
            }
            if (cc_features->c[i][j] == SHADER_TEXEL0 || cc_features->c[i][j] == SHADER_TEXEL0A) {
                cc_features->used_textures[0] = true;
            }
            if (cc_features->c[i][j] == SHADER_TEXEL1) {
                cc_features->used_textures[1] = true;
            }
        }
    }

    cc_features->do_single[0] = cc_features->c[0][2] == 0;
    cc_features->do_single[1] = cc_features->c[1][2] == 0;
    cc_features->do_multiply[0] = cc_features->c[0][1] == 0 && cc_features->c[0][3] == 0;
    cc_features->do_multiply[1] = cc_features->c[1][1] == 0 && cc_features->c[1][3] == 0;
    cc_features->do_mix[0] = cc_features->c[0][1] == cc_features->c[0][3];
    cc_features->do_mix[1] = cc_features->c[1][1] == cc_features->c[1][3];
    cc_features->color_alpha_same = (shader_id & 0xfff) == ((shader_id >> 12) & 0xfff);
}
