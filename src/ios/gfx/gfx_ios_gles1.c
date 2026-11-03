/*
 * gfx_ios_gles1.c — OpenGL ES 1.1 fixed-function renderer for iOS 6
 * (iPad 1, PowerVR SGX535).
 *
 * Direct port of sm64ex's src/pc/gfx/gfx_opengl_legacy.c (RAPI_GL_LEGACY),
 * which itself uses only vertex arrays + fixed-function texenv — no
 * shaders, no immediate mode — so it maps cleanly onto GLES 1.1.
 *
 * GLES 1.1 deltas vs the donor file (all marked IOS6 below):
 *  - glColor3f does not exist in ES 1.1: replaced with glColor4f(..., 1).
 *  - The donor init rejects OpenGL ES outright: removed; ES-CM 1.1 is our
 *    only target. NPOT support forced off (rescale path) — always safe.
 *  - sm64-port's GfxRenderingAPI has no trailing shutdown slot: dropped.
 * GL_ALPHA_TEST / glAlphaFunc are ES 1.1 core (verified in the on-device
 * SDK header ES1/gl.h), so the donor's alpha discard is kept verbatim.
 */
#ifdef RAPI_IOS_GLES1

#include <stdint.h>
#include <stdbool.h>
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#ifndef _LANGUAGE_C
# define _LANGUAGE_C
#endif
#include <PR/gbi.h>
#include <macros.h>

#include <OpenGLES/ES1/gl.h>
#include <OpenGLES/ES1/glext.h>

#include "gfx_cc.h"
#include "gfx_rendering_api.h"
#include "ios_platform.h"

enum MixType {
    SH_MT_NONE,
    SH_MT_TEXTURE,
    SH_MT_COLOR,
    SH_MT_TEXTURE_TEXTURE,
    SH_MT_TEXTURE_COLOR,
    SH_MT_COLOR_COLOR,
};

struct ShaderProgram {
    bool enabled;
    uint32_t shader_id;
    struct CCFeatures cc;
    enum MixType mix;
    bool texture_used[2];
    int texture_ord[2];
    int num_inputs;
};

struct SamplerState {
    GLenum min_filter;
    GLenum mag_filter;
    GLenum wrap_s;
    GLenum wrap_t;
    GLuint tex;
};

static struct ShaderProgram shader_program_pool[64];
static uint8_t shader_program_pool_size;
static struct ShaderProgram *cur_shader = NULL;

static struct SamplerState tmu_state[2];

static const float *cur_buf = NULL;
static const float *cur_fog_ofs = NULL;
static size_t cur_buf_size = 0;
static size_t cur_buf_num_tris = 0;
static size_t cur_buf_stride = 0;

// IOS6/ES1: OpenGL ES 1.1 requires glColorPointer size to be 4, unlike
// desktop GL which also accepts 3. Scratch buffer to expand RGB vertex
// colors to RGBA (alpha = 1.0, exactly like desktop GL's size-3 arrays).
// Sized for the largest batch: MAX_BUFFERED (256) tris * 3 verts * 4 floats.
static float color_scratch[256 * 3 * 4];
static bool gl_blend = false;

static void *scale_buf = NULL;
static int scale_buf_size = 0;

static float c_mix[] = { 0.f, 0.f, 0.f, 1.f };
static float c_invmix[] = { 1.f, 1.f, 1.f, 1.f };
static const float c_white[] = { 1.f, 1.f, 1.f, 1.f };

// from https://github.com/z2442/sm64-port

static void resample_32bit(const uint32_t *in, const int inwidth, const int inheight, uint32_t *out, const int outwidth, const int outheight) {
  int i, j;
  const uint32_t *inrow;
  uint32_t frac, fracstep;

  fracstep = inwidth * 0x10000 / outwidth;
  for (i = 0; i < outheight; i++, out += outwidth) {
    inrow = in + inwidth * (i * inheight / outheight);
    frac = fracstep >> 1;
    for (j = 0; j < outwidth; j += 4) {
      out[j] = inrow[frac >> 16];
      frac += fracstep;
      out[j + 1] = inrow[frac >> 16];
      frac += fracstep;
      out[j + 2] = inrow[frac >> 16];
      frac += fracstep;
      out[j + 3] = inrow[frac >> 16];
      frac += fracstep;
    }
  }
}

static inline uint32_t next_pot(uint32_t v) {
    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;
    return v;
}

static inline uint32_t is_pot(const uint32_t v) {
    return (v & (v - 1)) == 0;
}

static bool gfx_opengl_z_is_from_0_to_1(void) {
    return false;
}

static inline GLenum texenv_set_color(UNUSED struct ShaderProgram *prg) {
    return GL_REPLACE;
}

static inline GLenum texenv_set_texture(UNUSED struct ShaderProgram *prg) {
    return GL_REPLACE;
}

static inline GLenum texenv_set_texture_color(struct ShaderProgram *prg) {
    GLenum mode;

    // HACK: lord forgive me for this, but this is easier

    switch (prg->shader_id) {
        case 0x0000038D: // mario's eyes
        case 0x01200A00: // intro copyright fade in
            mode = GL_DECAL;
            break;
        case 0x01045A00: // peach letter, explosions
        case 0x00000551: // goddard
            mode = GL_BLEND;
            break;
        default:
            mode = GL_MODULATE;
            break;
    }

    return mode;
}

static inline GLenum texenv_set_texture_texture(UNUSED struct ShaderProgram *prg) {
    return GL_MODULATE;
}

static void gfx_opengl_apply_shader(struct ShaderProgram *prg) {
    const float *ofs = cur_buf;

    // vertices are always there
    glVertexPointer(4, GL_FLOAT, cur_buf_stride, ofs);
    ofs += 4;

    // have texture(s), specify same texcoords for every active texture
    if (prg->texture_used[0] || prg->texture_used[1]) {
        glEnable(GL_TEXTURE_2D);
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        glTexCoordPointer(2, GL_FLOAT, cur_buf_stride, ofs);
        ofs += 2;
    } else {
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glDisable(GL_TEXTURE_2D);
    }

    if (prg->shader_id & SHADER_OPT_FOG) {
        // blend it on top of normal tris later
        cur_fog_ofs = ofs;
        ofs += 4;
    }

    if (prg->num_inputs) {
        // have colors
        // TODO: more than one color (maybe glSecondaryColorPointer?)
        // HACK: if there's a texture and two colors, one of them is likely for speculars or some shit (see mario head)
        //       if there's two colors but no texture, the real color is likely the second one
        // HACKHACK: alpha is 0 in the transition shader (0x01A00045), maybe figure out the flags instead
        const int vlen = (prg->cc.opt_alpha && prg->shader_id != 0x01A00045) ? 4 : 3;
        const int hack = vlen * (prg->num_inputs > 1);

        if (prg->texture_used[1] && prg->cc.do_mix[0]) {
            // HACK: when two textures are mixed by vertex color, store the color
            //       it will be used later when rendering two texture passes
            c_mix[0] = *(ofs + hack + 0);
            c_mix[1] = *(ofs + hack + 1);
            c_mix[2] = *(ofs + hack + 2);
            c_invmix[0] = 1.f - c_mix[0];
            c_invmix[1] = 1.f - c_mix[1];
            c_invmix[2] = 1.f - c_mix[2];
            glDisableClientState(GL_COLOR_ARRAY);
            glColor4f(c_mix[0], c_mix[1], c_mix[2], 1.f); // IOS6: no glColor3f in ES
        } else {
            // otherwise use vertex colors as normal
            glEnableClientState(GL_COLOR_ARRAY);
            if (vlen == 3) {
                // IOS6/ES1: glColorPointer size must be 4 in OpenGL ES 1.1; a
                // size-3 call raises GL_INVALID_VALUE and leaves the previous
                // (stale) color pointer in place, corrupting vertex colors.
                // Expand RGB -> RGBA (alpha 1.0) into a scratch buffer.
                const uint8_t *src = (const uint8_t *)(ofs + hack);
                float *dst = color_scratch;
                const int n = (int)cur_buf_num_tris * 3;
                for (int i = 0; i < n; i++) {
                    const float *s = (const float *)(src + i * cur_buf_stride);
                    dst[0] = s[0];
                    dst[1] = s[1];
                    dst[2] = s[2];
                    dst[3] = 1.0f;
                    dst += 4;
                }
                glColorPointer(4, GL_FLOAT, 0, color_scratch);
            } else {
                glColorPointer(4, GL_FLOAT, cur_buf_stride, ofs + hack);
            }
        }

        ofs += prg->num_inputs * vlen;
    } else {
        glDisableClientState(GL_COLOR_ARRAY);
    }

    if (!prg->enabled) {
        // we only need to do this once
        prg->enabled = true;

        if (prg->shader_id & SHADER_OPT_TEXTURE_EDGE) {
            // (horrible) alpha discard
            glEnable(GL_ALPHA_TEST);
            glAlphaFunc(GL_GREATER, 0.666f);
        } else {
            glDisable(GL_ALPHA_TEST);
        }

        // configure texenv
        GLenum mode;
        switch (prg->mix) {
            case SH_MT_TEXTURE:         mode = texenv_set_texture(prg); break;
            case SH_MT_TEXTURE_TEXTURE: mode = texenv_set_texture_texture(prg); break;
            case SH_MT_TEXTURE_COLOR:   mode = texenv_set_texture_color(prg); break;
            default:                    mode = texenv_set_color(prg); break;
        }
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, mode);
    }
}

static void gfx_opengl_unload_shader(struct ShaderProgram *old_prg) {
    if (cur_shader && (cur_shader == old_prg || !old_prg)) {
        cur_shader->enabled = false;
        cur_shader = NULL;
    }
    cur_fog_ofs = NULL; // clear fog colors
}

static void gfx_opengl_load_shader(struct ShaderProgram *new_prg) {
    cur_shader = new_prg;
    if (cur_shader)
        cur_shader->enabled = false;
}

static struct ShaderProgram *gfx_opengl_create_and_load_new_shader(uint32_t shader_id) {
    struct CCFeatures ccf;
    gfx_cc_get_features(shader_id, &ccf);

    struct ShaderProgram *prg = &shader_program_pool[shader_program_pool_size++];

    prg->shader_id = shader_id;
    prg->cc = ccf;
    prg->num_inputs = ccf.num_inputs;
    prg->texture_used[0] = ccf.used_textures[0];
    prg->texture_used[1] = ccf.used_textures[1];

    if (ccf.used_textures[0] && ccf.used_textures[1]) {
        prg->mix = SH_MT_TEXTURE_TEXTURE;
        if (ccf.do_single[1]) {
            prg->texture_ord[0] = 1;
            prg->texture_ord[1] = 0;
        } else {
            prg->texture_ord[0] = 0;
            prg->texture_ord[1] = 1;
        }
    } else if (ccf.used_textures[0] && ccf.num_inputs) {
        prg->mix = SH_MT_TEXTURE_COLOR;
    } else if (ccf.used_textures[0]) {
        prg->mix = SH_MT_TEXTURE;
    } else if (ccf.num_inputs > 1) {
        prg->mix = SH_MT_COLOR_COLOR;
    } else if (ccf.num_inputs) {
        prg->mix = SH_MT_COLOR;
    }

    prg->enabled = false;

    gfx_opengl_load_shader(prg);

    return prg;
}

static struct ShaderProgram *gfx_opengl_lookup_shader(uint32_t shader_id) {
    for (size_t i = 0; i < shader_program_pool_size; i++)
        if (shader_program_pool[i].shader_id == shader_id)
            return &shader_program_pool[i];
    return NULL;
}

static void gfx_opengl_shader_get_info(struct ShaderProgram *prg, uint8_t *num_inputs, bool used_textures[2]) {
    *num_inputs = prg->num_inputs;
    used_textures[0] = prg->texture_used[0];
    used_textures[1] = prg->texture_used[1];
}

static GLuint gfx_opengl_new_texture(void) {
    GLuint ret;
    glGenTextures(1, &ret);
    return ret;
}

static void gfx_opengl_select_texture(int tile, GLuint texture_id) {
    tmu_state[tile].tex = texture_id; // remember this for multitexturing later
    glBindTexture(GL_TEXTURE_2D, texture_id);
}

static inline void *gfx_opengl_scale_texture(const uint8_t *data, const int w, const int h, const int to_w, const int to_h) {
    const int psize = to_w * to_h * 4;

    // realloc scale buffer if it's too small
    if (psize > scale_buf_size) {
        scale_buf = realloc(scale_buf, psize);
        if (!scale_buf) sys_fatal("Out of memory allocating NPOT scale buffer\n");
        scale_buf_size = psize;
    }

    resample_32bit((const uint32_t *)data, w, h, scale_buf, to_w, to_h);

    return scale_buf;
}

static void gfx_opengl_upload_texture(const uint8_t *rgba32_buf, int width, int height) {
    // IOS6: SGX535 path always rescales NPOT (no mipmapped NPOT on v1).
    if (!is_pot(width) || !is_pot(height)) {
        const int pwidth = next_pot(width);
        const int pheight = next_pot(height);
        rgba32_buf = gfx_opengl_scale_texture(rgba32_buf, width, height, pwidth, pheight);
        width = pwidth;
        height = pheight;
    }

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, rgba32_buf);
}

static inline GLenum gfx_cm_to_opengl(uint32_t val) {
    if (val & G_TX_CLAMP) return GL_CLAMP_TO_EDGE;
    // IOS6: ES 1.1 exposes this as GL_MIRRORED_REPEAT_OES (same 0x8370).
#ifdef GL_MIRRORED_REPEAT
    return (val & G_TX_MIRROR) ? GL_MIRRORED_REPEAT : GL_REPEAT;
#else
    return (val & G_TX_MIRROR) ? GL_MIRRORED_REPEAT_OES : GL_REPEAT;
#endif
}

static inline void gfx_opengl_apply_tmu_state(const int tile) {
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, tmu_state[tile].min_filter);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, tmu_state[tile].mag_filter);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, tmu_state[tile].wrap_s);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, tmu_state[tile].wrap_t);
}

static void gfx_opengl_set_sampler_parameters(int tile, bool linear_filter, uint32_t cms, uint32_t cmt) {
    const GLenum filter = linear_filter ? GL_LINEAR : GL_NEAREST;

    const GLenum wrap_s = gfx_cm_to_opengl(cms);
    const GLenum wrap_t = gfx_cm_to_opengl(cmt);

    tmu_state[tile].min_filter = filter;
    tmu_state[tile].mag_filter = filter;
    tmu_state[tile].wrap_s = wrap_s;
    tmu_state[tile].wrap_t = wrap_t;

    // set state for the first texture right away
    if (!tile) gfx_opengl_apply_tmu_state(tile);
}

static void gfx_opengl_set_depth_test(bool depth_test) {
    if (depth_test)
        glEnable(GL_DEPTH_TEST);
    else
        glDisable(GL_DEPTH_TEST);
}

static void gfx_opengl_set_depth_mask(bool z_upd) {
    glDepthMask(z_upd ? GL_TRUE : GL_FALSE);
}

static void gfx_opengl_set_zmode_decal(bool zmode_decal) {
    if (zmode_decal) {
        glPolygonOffset(-2, -2);
        glEnable(GL_POLYGON_OFFSET_FILL);
    } else {
        glPolygonOffset(0, 0);
        glDisable(GL_POLYGON_OFFSET_FILL);
    }
}

static void gfx_opengl_set_viewport(int x, int y, int width, int height) {
    glViewport(x, y, width, height);
}

static void gfx_opengl_set_scissor(int x, int y, int width, int height) {
    glScissor(x, y, width, height);
}

static void gfx_opengl_set_use_alpha(bool use_alpha) {
    gl_blend = use_alpha;
    if (use_alpha)
        glEnable(GL_BLEND);
    else
        glDisable(GL_BLEND);
}

// draws the same triangles as plain fog color + fog intensity as alpha
// on top of the normal tris and blends them to achieve sort of the same effect
// as fog would
static inline void gfx_opengl_pass_fog(void) {
    // if texturing is enabled, disable it, since we're blending colors
    if (cur_shader->texture_used[0] || cur_shader->texture_used[1])
        glDisable(GL_TEXTURE_2D);

    glEnableClientState(GL_COLOR_ARRAY); // enable color array temporarily
    glColorPointer(4, GL_FLOAT, cur_buf_stride, cur_fog_ofs); // set fog colors as primary colors
    if (!gl_blend) glEnable(GL_BLEND); // enable blending temporarily
    glDepthFunc(GL_LEQUAL); // Z is the same as the base triangles

    glDrawArrays(GL_TRIANGLES, 0, 3 * cur_buf_num_tris);

    glDepthFunc(GL_LESS); // set back to default
    if (!gl_blend) glDisable(GL_BLEND); // disable blending if it was disabled
    glDisableClientState(GL_COLOR_ARRAY); // will get reenabled later anyway

    // if texturing was enabled, re-enable it
    if (cur_shader->texture_used[0] || cur_shader->texture_used[1])
        glEnable(GL_TEXTURE_2D);
}

// this assumes the two textures are combined like so:
// result = mix(tex0.rgb, tex1.rgb, vertex.rgb)
static inline void gfx_opengl_pass_mix_texture(void) {
    // set second texture
    glBindTexture(GL_TEXTURE_2D, tmu_state[cur_shader->texture_ord[1]].tex);
    gfx_opengl_apply_tmu_state(cur_shader->texture_ord[1]);

    if (!gl_blend) glEnable(GL_BLEND); // enable blending temporarily
    glBlendFunc(GL_ONE, GL_ONE); // additive blending
    glDepthFunc(GL_LEQUAL); // Z is the same as the base triangles

    // draw the same triangles, but with the inverse of the mix color
    glColor4f(c_invmix[0], c_invmix[1], c_invmix[2], 1.f); // IOS6: no glColor3f
    glDrawArrays(GL_TRIANGLES, 0, 3 * cur_buf_num_tris);
    glColor4f(1.f, 1.f, 1.f, 1.f); // reset color

    glDepthFunc(GL_LESS); // set back to default
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); // same here
    if (!gl_blend) glDisable(GL_BLEND); // disable blending if it was disabled

    // set old texture
    glBindTexture(GL_TEXTURE_2D, tmu_state[cur_shader->texture_ord[0]].tex);
    gfx_opengl_apply_tmu_state(cur_shader->texture_ord[0]);
}

static void gfx_opengl_draw_triangles(float buf_vbo[], size_t buf_vbo_len, size_t buf_vbo_num_tris) {
    cur_buf = buf_vbo;
    cur_buf_size = buf_vbo_len * 4;
    cur_buf_num_tris = buf_vbo_num_tris;
    cur_buf_stride = cur_buf_size / (3 * cur_buf_num_tris);

    gfx_opengl_apply_shader(cur_shader);

    // if there's two textures, set primary texture first
    if (cur_shader->texture_used[1])
        glBindTexture(GL_TEXTURE_2D, tmu_state[cur_shader->texture_ord[0]].tex);

    glDrawArrays(GL_TRIANGLES, 0, 3 * cur_buf_num_tris);

    // if there's two textures, draw polys with the second texture
    if (cur_shader->texture_used[1]) gfx_opengl_pass_mix_texture();

    // cur_fog_ofs is only set if fog is emulated via blend pass
    if (cur_fog_ofs) gfx_opengl_pass_fog();
}

static void gfx_opengl_init(void) {
    // IOS6: EAGLContext is created by the UIKit shell (EAGLView) before the
    // game core starts; the context is current on the game thread here.
    printf("GL_VERSION = %s\n", glGetString(GL_VERSION));

    // NPOT always rescaled on v1 (see upload_texture); preallocate the
    // scale buffer the same way the donor does for non-NPOT hardware.
    scale_buf_size = 64 * 64 * 4;
    scale_buf = malloc(scale_buf_size);
    if (!scale_buf) sys_fatal("Out of memory allocating for NPOT scale buffer\n");

    // these also never change
    glDisable(GL_LIGHTING);
    glDisable(GL_CULL_FACE);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    glEnableClientState(GL_VERTEX_ARRAY);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glTexEnvfv(GL_TEXTURE_ENV, GL_TEXTURE_ENV_COLOR, c_white);
}

static void gfx_opengl_on_resize(void) {
}

static void gfx_opengl_start_frame(void) {
    glDisable(GL_SCISSOR_TEST);
    glDepthMask(GL_TRUE); // Must be set to clear Z-buffer
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_SCISSOR_TEST);
}

static void gfx_opengl_end_frame(void) {
}

static void gfx_opengl_finish_render(void) {
}

struct GfxRenderingAPI gfx_ios_gles1_api = {
    gfx_opengl_z_is_from_0_to_1,
    gfx_opengl_unload_shader,
    gfx_opengl_load_shader,
    gfx_opengl_create_and_load_new_shader,
    gfx_opengl_lookup_shader,
    gfx_opengl_shader_get_info,
    gfx_opengl_new_texture,
    gfx_opengl_select_texture,
    gfx_opengl_upload_texture,
    gfx_opengl_set_sampler_parameters,
    gfx_opengl_set_depth_test,
    gfx_opengl_set_depth_mask,
    gfx_opengl_set_zmode_decal,
    gfx_opengl_set_viewport,
    gfx_opengl_set_scissor,
    gfx_opengl_set_use_alpha,
    gfx_opengl_draw_triangles,
    gfx_opengl_init,
    gfx_opengl_on_resize,
    gfx_opengl_start_frame,
    gfx_opengl_end_frame,
    gfx_opengl_finish_render
};

#endif // RAPI_IOS_GLES1
