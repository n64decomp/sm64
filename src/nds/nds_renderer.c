#include <stdio.h>
#include <PR/gbi.h>

#include "nds_include.h"
#include <nds/arm9/postest.h>

#include "nds_renderer.h"

struct Color {
    uint8_t r, g, b, a;
};

struct Vertex {
    int16_t x, y, z;
    int16_t s, t;
    struct Color color;
};

struct Texture {
    uint8_t *original;
    uint8_t *converted;
    int name;
    uint8_t type;
    uint8_t size_x;
    uint8_t size_y;
};

struct Light {
    int16_t nx, ny, nz;
    int8_t x, y, z;
    struct Color color;
};

static struct Color env_color;
static struct Color fill_color;

static struct Vertex vertex_buffer[16];
static struct Texture texture_map[2048];
static struct Light lights[5];

uint16_t texture_fifo[2048];
uint16_t texture_fifo_start;
uint16_t texture_fifo_end;

static uint8_t *texture_address;
static uint8_t texture_format;
static uint8_t texture_bit_width;
static uint16_t texture_row_size;
static uint16_t texture_size;
static uint16_t texture_scale_s;
static uint16_t texture_scale_t;

static uint32_t geometry_mode;
static uint32_t rdphalf_1;
static uint32_t other_mode_l;
static uint32_t other_mode_h;
static Gwords texrect;

static uint8_t *z_buffer;
static uint8_t *c_buffer;

static bool texture_dirty;
static bool lights_dirty;
static int num_lights;

static int polygon_id;
static int poly_fmt;
static int tex_params;

static bool use_color;
static bool use_texture;
static bool use_env_color;
static bool use_env_alpha;

static bool shrunk;
static bool background;
static int32_t z_depth;

static int no_texture;
static int frame_count;

static void load_texture() {
    // Look up the current texture using a simple hash calculated from its address
    uint32_t index = ((uint32_t)texture_address >> 5) & 0x7FF;
    while (texture_map[index].original != texture_address && texture_map[index].original != NULL) {
        index = (index + 1) & 0x7FF;
    }

    struct Texture *cur = &texture_map[index];

    // Load the texture if it was found
    if (cur->original != NULL) {
        if (cur->name) {
            glBindTexture(GL_TEXTURE_2D, cur->name);
            return;
        }

        // Copy the texture back into VRAM if it was pushed out, pushing out other textures if necessary
        glGenTextures(1, &cur->name);
        glBindTexture(GL_TEXTURE_2D, cur->name);
        while (!glTexImage2D(GL_TEXTURE_2D, 0, cur->type, cur->size_x, cur->size_y, 0, TEXGEN_TEXCOORD, cur->converted)) {
            glDeleteTextures(1, &texture_map[texture_fifo[texture_fifo_end]].name);
            texture_map[texture_fifo[texture_fifo_end]].name = 0;
            texture_fifo_end = (texture_fifo_end + 1) & 0x7FF;
        }
        texture_fifo[texture_fifo_start] = index;
        texture_fifo_start = (texture_fifo_start + 1) & 0x7FF;
        return;
    }

    cur->original = texture_address;

    // The DS only supports texture sizes of 8 << x, but the N64 is less restricted
    // If a size is unsupported, the next size up is used and the texture is repeated to fill extra space

    // Determine the width of the new texture
    const int width = texture_row_size << (4 - texture_bit_width);
    for (cur->size_x = 0; (width - 1) >> (cur->size_x + 3) != 0; cur->size_x++);
    const int conv_width = 8 << cur->size_x;

    // Determine the height of the new texture
    const int height = ((texture_size << 1) >> texture_bit_width) / width;
    for (cur->size_y = 0; (height - 1) >> (cur->size_y + 3) != 0; cur->size_y++);
    const int conv_height = 8 << cur->size_y;

    // Convert the texture to a format the DS understands
    switch (texture_format) {
        case G_IM_FMT_RGBA:
            switch (texture_bit_width) {
                case G_IM_SIZ_16b:
                    cur->converted = (uint8_t*)malloc(conv_width * conv_height * 2);
                    for (int y = 0; y < conv_height; y++) {
                        for (int x = 0; x < conv_width; x++) {
                            const int index = ((y % height) * width + (x % width)) * 2;
                            const uint16_t color = (texture_address[index] << 8) | texture_address[index + 1];
                            const uint8_t r = ((color >> 11) & 0x1F);
                            const uint8_t g = ((color >>  6) & 0x1F);
                            const uint8_t b = ((color >>  1) & 0x1F);
                            const uint8_t a = ((color >>  0) & 0x01);
                            ((uint16_t*)cur->converted)[y * conv_width + x] = (a << 15) | (b << 10) | (g << 5) | r;
                        }
                    }
                    DC_FlushRange(cur->converted, conv_width * conv_height * 2);
                    cur->type = GL_RGBA;
                    break;

                default:
                    //printf("Unsupported RGBA texture bit width: %d\n", texture_bit_width);
                    glBindTexture(GL_TEXTURE_2D, cur->name = no_texture);
                    return;
            }
            break;

        case G_IM_FMT_IA:
            switch (texture_bit_width) {
                case G_IM_SIZ_4b:
                    cur->converted = (uint8_t*)malloc(conv_width * conv_height);
                    for (int y = 0; y < conv_height; y++) {
                        for (int x = 0; x < conv_width; x++) {
                            const int index = (y % height) * width + (x % width);
                            const uint8_t color = (texture_address[index / 2] >> ((index & 1) ? 0 : 4)) & 0x0F;
                            const uint8_t i = ((color >> 1) & 0x07);
                            const uint8_t a = ((color >> 0) & 0x01) ? 31 : 0;
                            cur->converted[y * conv_width + x] = (a << 3) | i;
                        }
                    }
                    DC_FlushRange(cur->converted, conv_width * conv_height);
                    cur->type = GL_RGB8_A5;
                    break;

                case G_IM_SIZ_8b:
                    cur->converted = (uint8_t*)malloc(conv_width * conv_height);
                    for (int y = 0; y < conv_height; y++) {
                        for (int x = 0; x < conv_width; x++) {
                            const uint8_t color = texture_address[(y % height) * width + (x % width)];
                            const uint8_t i = ((color >> 4) & 0x0F) *  7 / 15;
                            const uint8_t a = ((color >> 0) & 0x0F) * 31 / 15;
                            cur->converted[y * conv_width + x] = (a << 3) | i;
                        }
                    }
                    DC_FlushRange(cur->converted, conv_width * conv_height);
                    cur->type = GL_RGB8_A5;
                    break;

                case G_IM_SIZ_16b:
                    cur->converted = (uint8_t*)malloc(conv_width * conv_height);
                    for (int y = 0; y < conv_height; y++) {
                        for (int x = 0; x < conv_width; x++) {
                            const int index = ((y % height) * width + (x % width)) * 2;
                            const uint8_t i = texture_address[index + 0] *  7 / 255;
                            const uint8_t a = texture_address[index + 1] * 31 / 255;
                            cur->converted[y * conv_width + x] = (a << 3) | i;
                        }
                    }
                    DC_FlushRange(cur->converted, conv_width * conv_height);
                    cur->type = GL_RGB8_A5;
                    break;

                default:
                    //printf("Unsupported IA texture bit width: %d\n", texture_bit_width);
                    glBindTexture(GL_TEXTURE_2D, cur->name = no_texture);
                    return;
            }
            break;

        default:
            //printf("Unsupported texture format: %d\n", texture_format);
            glBindTexture(GL_TEXTURE_2D, cur->name = no_texture);
            return;
    }

    // Copy the texture into VRAM, pushing out other textures if necessary
    glGenTextures(1, &cur->name);
    glBindTexture(GL_TEXTURE_2D, cur->name);
    while (!glTexImage2D(GL_TEXTURE_2D, 0, cur->type, cur->size_x, cur->size_y, 0, TEXGEN_TEXCOORD, cur->converted)) {
        glDeleteTextures(1, &texture_map[texture_fifo[texture_fifo_end]].name);
        texture_map[texture_fifo[texture_fifo_end]].name = 0;
        texture_fifo_end = (texture_fifo_end + 1) & 0x7FF;
    }
    texture_fifo[texture_fifo_start] = index;
    texture_fifo_start = (texture_fifo_start + 1) & 0x7FF;
}

static void draw_vertices(const struct Vertex **v, int count) {
    // Get the alpha value and return early if it's 0 (alpha 0 is wireframe on the DS)
    // Since the DS only supports one alpha value per polygon, just use the one from first vertex
    const int alpha = ((other_mode_l & (G_BL_A_MEM << 18)) ? 31 : (v[0]->color.a >> 3));
    if (alpha == 0) return;

    // Clear the vertex color if it shoudn't be used
    if (!use_color) {
        glColor3b(0xFF, 0xFF, 0xFF);
    }

    // Clear the texture if it shouldn't be used, or load it if it's dirty
    if (!use_texture) {
        glBindTexture(GL_TEXTURE_2D, no_texture);
        texture_dirty = true;
    } else if (texture_dirty) {
        load_texture();
        glTexParameter(GL_TEXTURE_2D, tex_params);
        texture_dirty = false;
    }

    // Apply the polygon attributes
    glPolyFmt(poly_fmt | POLY_ALPHA(alpha) | POLY_ID(polygon_id));
    glBegin(GL_TRIANGLE);

    if (geometry_mode & G_ZBUFFER) {
        // Incoming vertices expect W to be 1, not 1 << 12 like the DS sets
        // This is a hack to scale W values; it's reverted during matrix multiplication to prevent breakage
        if (!shrunk) {
            const m4x4 shrink = {{
                1 << 12, 0, 0, 0,
                0, 1 << 12, 0, 0,
                0, 0, 1 << 12, 0,
                0, 0, 0, 1 <<  0
            }};
            glMatrixMode(GL_MODELVIEW);
            glMultMatrix4x4(&shrink);
            shrunk = true;
        }

        // Send the vertices to the 3D engine
        for (int i = 0; i < count; i++) {
            if (use_color) glColor3b(v[i]->color.r, v[i]->color.g, v[i]->color.b);
            if (use_texture) glTexCoord2t16(v[i]->s, v[i]->t);
            glVertex3v16(v[i]->x, v[i]->y, v[i]->z);
        }

        // As part of the depth hack, move the hijacked Z value to the front once normal polygons start being sent
        // This relies on the assumption that background 2D elements are sent first, and foreground last
        if (background) {
            z_depth = (128 - 0x1000) * 6; // Room for 128 foreground quads
            background = false;
        }
    } else {
        // Since depth test is disabled, 2D elements are likely being drawn and these expect proper multiplication by 1
        // So instead of scaling the W value down, scale the other components up to have proper 12-bit fractionals
        const m4x4 enlarge = {{
            1 << 24, 0, 0, 0,
            0, 1 << 24, 0, 0,
            0, 0, 1 << 24, 0,
            0, 0, 0, 1 << (shrunk ? 24 : 12)
        }};
        glMatrixMode(GL_MODELVIEW);
        glPushMatrix();
        glMultMatrix4x4(&enlarge);

        for (int i = 0; i < count; i++) {
            // Send the vertex attributes to the 3D engine
            if (use_color) glColor3b(v[i]->color.r, v[i]->color.g, v[i]->color.b);
            if (use_texture) glTexCoord2t16(v[i]->s, v[i]->t);

            // Use position test to project the vertex so the result can be hijacked before sending it for real
            PosTest(v[i]->x, v[i]->y, v[i]->z);

            // Push the current matrices to the stack, and load an identity matrix so the outgoing vertex won't be affected
            glPushMatrix();
            glLoadIdentity();
            glMatrixMode(GL_PROJECTION);
            glPushMatrix();

            // Depth test can't be disabled on the DS; this is a problem, since 2D elements are usually drawn this way
            // This hack sets decreasing Z values so that these polygons will be properly rendered on top of each other
            // Since the W value can't be set directly, use a scaling matrix with a vertex of 1s to send the coordinates
            const m4x4 vertex = {{
                PosTestXresult(), 0, 0, 0,
                0, PosTestYresult(), 0, 0,
                0, 0, (--z_depth) / 6, 0,
                0, 0, 0, PosTestWresult()
            }};
            glLoadMatrix4x4(&vertex);
            glVertex3v16(1 << 12, 1 << 12, 1 << 12);

            // Restore the original matrices
            glPopMatrix(1);
            glMatrixMode(GL_MODELVIEW);
            glPopMatrix(1);
        }

        glPopMatrix(1);
    }
}

static uint32_t sqrt_fixed(uint32_t x) {
    // Calculate the square root of a 16-bit fractional fixed point number
    uint32_t r = x;
    uint32_t b = 0x40000000;
    uint32_t q = 0;
    while (b > 0x40) {
        uint32_t t = q + b;
        if (r >= t) {
            r -= t;
            q = t + b;
        }
        r <<= 1;
        b >>= 1;
    }
    return q >> 8;
}

static void g_vtx(Gwords *words) {
    const uint8_t count = ((words->w0 >> 12) & 0xFF);
    const uint8_t index = ((words->w0 >>  0) & 0xFF) >> 1;
    const Vtx *vertices = (const Vtx*)words->w1;

    // Store vertices in the vertex buffer
    for (uint8_t i = index - count; i < index; i++) {
        const Vtx_t  *v = &vertices[i].v;
        const Vtx_tn *n = &vertices[i].n;

        // Set the vertex coordinates
        vertex_buffer[i].x = v->ob[0];
        vertex_buffer[i].y = v->ob[1];
        vertex_buffer[i].z = v->ob[2];

        // Scale the texture coordinates, and shift out an additional bit to get 4-bit fractionals for the DS
        vertex_buffer[i].s = (v->tc[0] * texture_scale_s) >> 17;
        vertex_buffer[i].t = (v->tc[1] * texture_scale_t) >> 17;

        // Calulate vertex colors for lighting in software
        // The DS can *almost* do this in hardware, but the vectors need to be normalized after being transformed
        if (geometry_mode & G_LIGHTING) {
            // Use the last light as ambient light (or emission, in DS terms)
            uint32_t r = lights[num_lights].color.r;
            uint32_t g = lights[num_lights].color.g;
            uint32_t b = lights[num_lights].color.b;

            // Recalculate transformed light vectors if the lights or modelview matrix changed
            if (lights_dirty) {
                // Read the current modelview matrix from hardware
                int m[12];
                glGetFixed(GL_GET_MATRIX_VECTOR, m);

                for (int i = 0; i < num_lights; i++) {
                    // Multiply the light vector with the modelview matrix
                    lights[i].nx = (lights[i].x * m[0] + lights[i].y * m[1] + lights[i].z * m[2]) >> 7;
                    lights[i].ny = (lights[i].x * m[3] + lights[i].y * m[4] + lights[i].z * m[5]) >> 7;
                    lights[i].nz = (lights[i].x * m[6] + lights[i].y * m[7] + lights[i].z * m[8]) >> 7;

                    // Normalize the result
                    int s = (lights[i].nx * lights[i].nx + lights[i].ny * lights[i].ny + lights[i].nz * lights[i].nz) >> 8;
                    if (s > 0) {
                        s = sqrt_fixed(s);
                        lights[i].nx = (lights[i].nx << 16) / s;
                        lights[i].ny = (lights[i].ny << 16) / s;
                        lights[i].nz = (lights[i].nz << 16) / s;
                    }
                }

                lights_dirty = false;
            }

            // Multiply the light vertices with the vertex's normal to calculate light intensity
            for (int i = 2; i < num_lights; i++) {
                int intensity = (lights[i].nx * n->n[0] + lights[i].ny * n->n[1] + lights[i].nz * n->n[2]) >> 7;
                if (intensity > 0) {
                    r += (intensity * lights[i].color.r) >> 12;
                    g += (intensity * lights[i].color.g) >> 12;
                    b += (intensity * lights[i].color.b) >> 12;
                }
            }

            // Set the calulated vertex color
            vertex_buffer[i].color.r = (r > 0xFF) ? 0xFF : r;
            vertex_buffer[i].color.g = (g > 0xFF) ? 0xFF : g;
            vertex_buffer[i].color.b = (b > 0xFF) ? 0xFF : b;

            // Generate spherical texture coordinates by multiplying the vertex's normal with the lookat vectors
            if (geometry_mode & G_TEXTURE_GEN) {
                const int dot_y = (lights[0].nx * n->n[0] + lights[0].ny * n->n[1] + lights[0].nz * n->n[2]) >> 7;
                const int dot_x = (lights[1].nx * n->n[0] + lights[1].ny * n->n[1] + lights[1].nz * n->n[2]) >> 7;
                vertex_buffer[i].s = ((dot_x + (1 << 12)) * texture_scale_s) >> 15;
                vertex_buffer[i].t = ((dot_y + (1 << 12)) * texture_scale_t) >> 15;
            }
        } else if (use_env_color) {
            // Use the environment color as the vertex color if enabled
            vertex_buffer[i].color.r = env_color.r;
            vertex_buffer[i].color.g = env_color.g;
            vertex_buffer[i].color.b = env_color.b;
        } else {
            // Set the vertex color normally
            vertex_buffer[i].color.r = v->cn[0];
            vertex_buffer[i].color.g = v->cn[1];
            vertex_buffer[i].color.b = v->cn[2];
        }

        // Set the vertex alpha, using the environment alpha if enabled
        vertex_buffer[i].color.a = (use_env_alpha ? env_color.a : v->cn[3]);

        // Round texture coodinates (by adding 0.5) if linear filtering is enabled
        // The DS can't actually do linear filtering, but this still keeps textures from being slightly misplaced
        if ((other_mode_h & (3 << G_MDSFT_TEXTFILT)) != G_TF_POINT) {
            vertex_buffer[i].s += 1 << 4;
            vertex_buffer[i].t += 1 << 4;
        }
    }
}

static void g_tri1(Gwords *words) {
    // Draw a triangle
    const struct Vertex *v[] = {
        &vertex_buffer[((words->w0 >> 16) & 0xFF) >> 1],
        &vertex_buffer[((words->w0 >>  8) & 0xFF) >> 1],
        &vertex_buffer[((words->w0 >>  0) & 0xFF) >> 1]
    };
    draw_vertices(v, 3);
}

static void g_tri2(Gwords *words) {
    // Draw two triangles at once
    const struct Vertex *v[] = {
        &vertex_buffer[((words->w0 >> 16) & 0xFF) >> 1],
        &vertex_buffer[((words->w0 >>  8) & 0xFF) >> 1],
        &vertex_buffer[((words->w0 >>  0) & 0xFF) >> 1],
        &vertex_buffer[((words->w1 >> 16) & 0xFF) >> 1],
        &vertex_buffer[((words->w1 >>  8) & 0xFF) >> 1],
        &vertex_buffer[((words->w1 >>  0) & 0xFF) >> 1]
    };
    draw_vertices(v, 6);
}

static void g_texture(Gwords *words) {
    // Set the texture scaling factors
    texture_scale_s = (words->w1 >> 16) & 0xFFFF;
    texture_scale_t = (words->w1 >>  0) & 0xFFFF;
}

static void g_popmtx(Gwords *words) {
    // Pop matrices from the modelview stack
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix(words->w1 / 64);
}

static void g_geometrymode(Gwords *words) {
    // Clear and set the geometry mode bits
    geometry_mode = (geometry_mode & words->w0) | words->w1;

    // Update the polygon culling settings
    poly_fmt |= POLY_CULL_NONE;
    if (geometry_mode & (1 << 9)) {
        poly_fmt &= ~POLY_CULL_BACK;
    }
    if (geometry_mode & (1 << 10)) {
        poly_fmt &= ~POLY_CULL_FRONT;
    }
}

static void g_mtx(Gwords *words) {
    // Load a matrix, shifting the elements so they have 12-bit fractionals for the DS
    m4x4 matrix;
    for (int i = 0; i < 16; i += 2) {
        const uint32_t *data = &((uint32_t*)words->w1)[i / 2];
        matrix.m[i + 0] = ((int32_t)((data[0] & 0xFFFF0000) | (data[8] >> 16)) + 8) >> 4;
        matrix.m[i + 1] = ((int32_t)((data[0] << 16) | (data[8] & 0x0000FFFF)) + 8) >> 4;
    }

    // Perform a matrix operation
    const uint8_t params = words->w0 ^ G_MTX_PUSH;
    if (params & G_MTX_PROJECTION) {
        glMatrixMode(GL_PROJECTION);

        // Load or multiply the projection matrix
        if (params & G_MTX_LOAD) {
            glLoadMatrix4x4(&matrix);
        } else {
            glMultMatrix4x4(&matrix);
        }
    } else {
        glMatrixMode(GL_MODELVIEW);

        // Push the current modelview matrix to the stack if requested
        if (params & G_MTX_PUSH) {
            glPushMatrix();
        }

        // Load or multiply the modelview matrix
        if (params & G_MTX_LOAD) {
            glLoadMatrix4x4(&matrix);
        } else {
            // Revert the W value scaling hack so matrix multiplication works properly
            if (shrunk) {
                const m4x4 enlarge = {{
                    1 << 12, 0, 0, 0,
                    0, 1 << 12, 0, 0,
                    0, 0, 1 << 12, 0,
                    0, 0, 0, 1 << 24
                }};
                glMultMatrix4x4(&enlarge);
            }

            glMultMatrix4x4(&matrix);
        }

        shrunk = false;
        lights_dirty = true;
    }
}

static void g_moveword(Gwords *words) {
    // Set values that are normally at specific locations in DMEM
    const uint8_t index = (words->w0 >> 16) & 0xFF;
    switch (index) {
        case G_MW_NUMLIGHT:
            // Set the current number of lights, including the lookat vectors
            num_lights = (words->w1 / 24) + 2;
            break;

        // Unimplemented writes
        case G_MW_CLIP:      break;
        case G_MW_FOG:       break;
        case G_MW_PERSPNORM: break;

        default:
            //printf("Unsupported G_MOVEWORD index: 0x%.2X\n", index);
            break;
    }
}

static void g_movemem(Gwords *words) {
    // Set a block of values that are normally at specific locations in DMEM
    const uint8_t index = (words->w0 >> 0) & 0xFF;
    switch (index) {
        case G_MV_VIEWPORT: {
            // Calulate and set the specified viewport
            const Vp_t *vp = (Vp_t*)words->w1;
            const uint8_t x2 = ((vp->vscale[0] >> 1) * 255 / 320);
            const uint8_t x1 = ((vp->vtrans[0] >> 1) * 255 / 320 - x2) >> 1;
            const uint8_t y2 = ((vp->vscale[1] >> 1) * 191 / 240);
            const uint8_t y1 = ((vp->vtrans[1] >> 1) * 191 / 240 - y2) >> 1;
            glViewport(x1, y1, x2, y2);
            break;
        }

        case G_MV_LIGHT: {
            // Set light parameters
            const int index = ((words->w0 >> 8) & 0xFF) / 3;
            const Light_t *light = (Light_t*)words->w1;
            if (index >= 2) { // Not lookat vectors
                lights[index].color.r = light->col[0];
                lights[index].color.g = light->col[1];
                lights[index].color.b = light->col[2];
            }
            if (index < num_lights) { // Not ambient light
                lights[index].x = light->dir[0];
                lights[index].y = light->dir[1];
                lights[index].z = light->dir[2];
                lights_dirty = true;
            }
            break;
        }

        default:
            //printf("Unsupported G_MOVEMEM index: 0x%.2X\n", index);
            break;
    }
}

static void g_rdphalf_1(Gwords *words) {
    // Set the higher half of the RDP word (holds upper-left texture coordinates for G_TEXRECT)
    rdphalf_1 = words->w1;
}

static void g_setothermode_l(Gwords *words) {
    // Set the specified bits in the lower half of the other mode word
    const uint8_t bits = ((words->w0 >> 0) & 0xFF) + 1;
    const uint8_t shift = 32 - ((words->w0 >> 8) & 0xFF) - bits;
    const uint32_t mask = ((1 << bits) - 1) << shift;
    other_mode_l = (other_mode_l & ~mask) | (words->w1 & mask);
}

static void g_setothermode_h(Gwords *words) {
    // Set the specified bits in the higher half of the other mode word
    const uint8_t bits = ((words->w0 >> 0) & 0xFF) + 1;
    const uint8_t shift = 32 - ((words->w0 >> 8) & 0xFF) - bits;
    const uint32_t mask = ((1 << bits) - 1) << shift;
    other_mode_h = (other_mode_h & ~mask) | (words->w1 & mask);
}

static void g_texrect(Gwords *words) {
    // Store the G_TEXRECT parameters so they can be used after the texture coordinates are set
    texrect = *words;
}

static void g_rdphalf_2(Gwords *words) {
    // G_TEXRECT is actually performed here; the texture coordinates must be set in the RDP word before it can begin

    // Get the alpha value and return early if it's 0 (alpha 0 is wireframe on the DS)
    const int alpha = (use_env_alpha ? (env_color.a >> 3) : 31);
    if (alpha == 0) return;

    // Push the current matrices to the stack, and load identity matrices so the outgoing vertices won't be affected
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();
    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();

    // Load the texture if it's dirty
    if (texture_dirty) {
        load_texture();
        glTexParameter(GL_TEXTURE_2D, tex_params);
        texture_dirty = false;
    }

    // Apply the polygon attributes, using the environment alpha if enabled
    glPolyFmt(POLY_CULL_NONE | POLY_ALPHA(alpha));
    glBegin(GL_TRIANGLE);

    // Check if copy mode is enabled; certian rules change if this is the case
    // The rectangle dimensions are a pixel bigger, and the S-coordinate change has 2 extra fractional bits(?)
    const bool copy = ((other_mode_h & (3 << G_MDSFT_CYCLETYPE)) == G_CYC_COPY);

    // Use the environment color if enabled, or clear the vertex color
    if (use_env_color && !copy) {
        glColor3b(env_color.r, env_color.g, env_color.b);
    } else {
        glColor3b(0xFF, 0xFF, 0xFF);
    }

    // Get the rectangle dimensions
    int16_t x1 = ((texrect.w1 >> 12) & 0xFFF);
    int16_t y1 = ((texrect.w1 >>  0) & 0xFFF);
    int16_t x2 = ((texrect.w0 >> 12) & 0xFFF) + (copy ? (1 << 2) : 0);
    int16_t y2 = ((texrect.w0 >>  0) & 0xFFF) + (copy ? (1 << 2) : 0);

    // Calculate the texture coordinates
    const int16_t s1 = (((rdphalf_1 >> 16) & 0xFFFF) >> 1);
    const int16_t t1 = (((rdphalf_1 >>  0) & 0xFFFF) >> 1);
    const int16_t s2 = s1 + ((((words->w1 >> 16) & 0xFFFF) * (x2 - x1)) >> (copy ? 10 : 8));
    const int16_t t2 = t1 + ((((words->w1 >>  0) & 0xFFFF) * (y2 - y1)) >> 8);

    // Scale the dimensions to be between -1 and 1 with 12 fractional bits
    x1 =  (x1 * (2 << 12) / (320 << 2) - (1 << 12));
    y1 = -(y1 * (2 << 12) / (240 << 2) - (1 << 12));
    x2 =  (x2 * (2 << 12) / (320 << 2) - (1 << 12));
    y2 = -(y2 * (2 << 12) / (240 << 2) - (1 << 12));

    // Draw one half of the rectangle, using depth hijacking
    glTexCoord2t16(s1, t1);
    glVertex3v16(x1, y1, (--z_depth) / 6);
    glTexCoord2t16(s1, t2);
    glVertex3v16(x1, y2, (--z_depth) / 6);
    glTexCoord2t16(s2, t1);
    glVertex3v16(x2, y1, (--z_depth) / 6);

    // Draw the other half of the rectangle, using depth hijacking
    glTexCoord2t16(s2, t1);
    glVertex3v16(x2, y1, (--z_depth) / 6);
    glTexCoord2t16(s1, t2);
    glVertex3v16(x1, y2, (--z_depth) / 6);
    glTexCoord2t16(s2, t2);
    glVertex3v16(x2, y2, (--z_depth) / 6);

    // Restore the original matrices
    glPopMatrix(1);
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix(1);
}

static void g_loadblock(Gwords *words) {
    const int tile = (words->w1 >> 24) & 0x07;
    if (tile != G_TX_LOADTILE) return;

    // Set the size of the current texture in memory, in bytes
    texture_size = (((words->w1 >> 12) & 0xFFF) + 1);
    switch (texture_bit_width) {
        case G_IM_SIZ_4b:  texture_size >>= 1; break;
        case G_IM_SIZ_16b: texture_size <<= 1; break;
    }
}

static void g_settile(Gwords *words) {
    const int tile = (words->w1 >> 24) & 0x07;
    if (tile != G_TX_RENDERTILE) return;

    // Set the texture properties
    texture_format    = (words->w0 >> 21) & 0x007;
    texture_bit_width = (words->w0 >> 19) & 0x003;
    texture_row_size  = (words->w0 >>  9) & 0x1FF;
    const uint8_t cms = (words->w1 >>  8) & 0x003;
    const uint8_t cmt = (words->w1 >> 18) & 0x003;

    // Update the texture parameters
    tex_params = 0;
    if (!(cms & G_TX_CLAMP)) {
        tex_params |= GL_TEXTURE_WRAP_S;
        if (cms & G_TX_MIRROR) {
            tex_params |= GL_TEXTURE_FLIP_S;
        }
    }
    if (!(cmt & G_TX_CLAMP)) {
        tex_params |= GL_TEXTURE_WRAP_T;
        if (cmt & G_TX_MIRROR) {
            tex_params |= GL_TEXTURE_FLIP_T;
        }
    }
}

static void g_fillrect(Gwords *words) {
    // If the color buffer is set to the depth buffer, the game is probably trying to clear it; this can be ignored
    if (c_buffer == z_buffer) return;

    // Get the alpha value and return early if it's 0 (alpha 0 is wireframe on the DS)
    const int alpha = fill_color.a >> 3;
    if (alpha == 0) return;

    // Push the current matrices to the stack, and load identity matrices so the outgoing vertices won't be affected
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();
    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();

    // Clear the texture
    glBindTexture(GL_TEXTURE_2D, no_texture);
    texture_dirty = true;

    // Apply the polygon attributes and the fill color
    glPolyFmt(POLY_CULL_NONE | POLY_ALPHA(alpha));
    glBegin(GL_TRIANGLE);
    glColor3b(fill_color.r, fill_color.g, fill_color.b);

    // Get the rectangle dimensions, scaled to be between -1 and 1 with 12 fractional bits
    const int16_t x1 =  ((((words->w1 >> 12) & 0xFFF) + (0 << 2)) * (2 << 12) / (320 << 2) - (1 << 12));
    const int16_t y1 = -((((words->w1 >>  0) & 0xFFF) + (0 << 2)) * (2 << 12) / (240 << 2) - (1 << 12));
    const int16_t x2 =  ((((words->w0 >> 12) & 0xFFF) + (1 << 2)) * (2 << 12) / (320 << 2) - (1 << 12));
    const int16_t y2 = -((((words->w0 >>  0) & 0xFFF) + (1 << 2)) * (2 << 12) / (240 << 2) - (1 << 12));

    // Draw one half of the rectangle, using depth hijacking
    glVertex3v16(x1, y1, (--z_depth) / 6);
    glVertex3v16(x1, y2, (--z_depth) / 6);
    glVertex3v16(x2, y1, (--z_depth) / 6);

    // Draw the other half of the rectangle, using depth hijacking
    glVertex3v16(x2, y1, (--z_depth) / 6);
    glVertex3v16(x1, y2, (--z_depth) / 6);
    glVertex3v16(x2, y2, (--z_depth) / 6);

    // Restore the original matrices
    glMatrixMode(GL_PROJECTION);
    glPopMatrix(1);
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix(1);
}

static void g_setfillcolor(Gwords *words) {
    // Set the fill color
    fill_color.r = (words->w1 >> 24) & 0xFF;
    fill_color.g = (words->w1 >> 16) & 0xFF;
    fill_color.b = (words->w1 >>  8) & 0xFF;
    fill_color.a = (words->w1 >>  0) & 0xFF;
}

static void g_setenvcolor(Gwords *words) {
    // Set the environment color
    env_color.r = (words->w1 >> 24) & 0xFF;
    env_color.g = (words->w1 >> 16) & 0xFF;
    env_color.b = (words->w1 >>  8) & 0xFF;
    env_color.a = (words->w1 >>  0) & 0xFF;
}

static void g_setcombine(Gwords *words) {
    const uint8_t a_color = (words->w0 >> 20) & 0x0F;
    const uint8_t b_color = (words->w1 >> 28) & 0x0F;
    const uint8_t c_color = (words->w0 >> 15) & 0x1F;
    const uint8_t d_color = (words->w1 >> 15) & 0x07;
    //const uint8_t a_alpha = (words->w0 >> 12) & 0x07;
    //const uint8_t b_alpha = (words->w1 >> 12) & 0x07;
    const uint8_t c_alpha = (words->w0 >>  9) & 0x07;
    const uint8_t d_alpha = (words->w1 >>  9) & 0x07;

    // The N64 color combiner works by using the formula (A - B) * C + D, with color and alpha handled separately
    // The DS is much more limited when it comes to blending; this is just an approximation that seems to work well for SM64

    use_env_color = (c_color == G_CCMUX_ENVIRONMENT || d_color == G_CCMUX_ENVIRONMENT);
    use_env_alpha = (c_alpha == G_CCMUX_ENVIRONMENT || d_alpha == G_CCMUX_ENVIRONMENT);
    use_color = use_env_color || (a_color == G_CCMUX_SHADE || b_color == G_CCMUX_SHADE || c_color == G_CCMUX_SHADE || d_color == G_CCMUX_SHADE);
    use_texture = (a_color == G_CCMUX_TEXEL0 || b_color == G_CCMUX_TEXEL0 || c_color == G_CCMUX_TEXEL0 || d_color == G_CCMUX_TEXEL0);

    if (b_color == d_color) {
        poly_fmt |= POLY_DECAL;

        // Hack to hide goddard's texture since it can't be properly blended
        if (a_color == G_CCMUX_PRIMITIVE) {
            use_texture = false;
        }
    } else {
        poly_fmt &= ~POLY_DECAL;
    }

    // The DS doesn't draw transparent pixels over other transparent pixels with the same polygon ID
    // This prevents overlapping artifacts on polygons from the same object, but also breaks blending of separate objects
    // As a guess of when objects start and end, change the polygon ID every time the color combine settings change
    polygon_id = (polygon_id + 1) & 0x3F;
}

static void g_settimg(Gwords *words) {
    // Set the address of the current texture in memory
    texture_address = (uint8_t*)words->w1;
    texture_format = (words->w0 >> 21) & 0x07;
    texture_bit_width = (words->w0 >> 19) & 0x03;
    texture_dirty = true;
}

static void g_setzimg(Gwords *words) {
    // Set the address of the depth buffer
    // This doesn't matter much on the DS, but it's used to detect attempts to draw to the depth buffer
    z_buffer = (uint8_t*)words->w1;
}

static void g_setcimg(Gwords *words) {
    // Set the address of the color buffer
    // This doesn't matter much on the DS, but it's used to detect attempts to draw to the depth buffer
    c_buffer = (uint8_t*)words->w1;
}

static void execute(Gfx* cmd) {
    // Interpret a list of Fast3DEX2 commands using the DS hardware
    while (true) {
        const uint8_t opcode = cmd->words.w0 >> 24;

        switch (opcode) {
            case G_VTX:            g_vtx(&cmd->words);            break;
            case G_TRI1:           g_tri1(&cmd->words);           break;
            case G_TRI2:           g_tri2(&cmd->words);           break;
            case G_TEXTURE:        g_texture(&cmd->words);        break;
            case G_POPMTX:         g_popmtx(&cmd->words);         break;
            case G_GEOMETRYMODE:   g_geometrymode(&cmd->words);   break;
            case G_MTX:            g_mtx(&cmd->words);            break;
            case G_MOVEWORD:       g_moveword(&cmd->words);       break;
            case G_MOVEMEM:        g_movemem(&cmd->words);        break;
            case G_RDPHALF_1:      g_rdphalf_1(&cmd->words);      break;
            case G_SETOTHERMODE_L: g_setothermode_l(&cmd->words); break;
            case G_SETOTHERMODE_H: g_setothermode_h(&cmd->words); break;
            case G_TEXRECT:        g_texrect(&cmd->words);        break;
            case G_RDPHALF_2:      g_rdphalf_2(&cmd->words);      break;
            case G_LOADBLOCK:      g_loadblock(&cmd->words);      break;
            case G_SETTILE:        g_settile(&cmd->words);        break;
            case G_FILLRECT:       g_fillrect(&cmd->words);       break;
            case G_SETFILLCOLOR:   g_setfillcolor(&cmd->words);   break;
            case G_SETENVCOLOR:    g_setenvcolor(&cmd->words);    break;
            case G_SETCOMBINE:     g_setcombine(&cmd->words);     break;
            case G_SETTIMG:        g_settimg(&cmd->words);        break;
            case G_SETZIMG:        g_setzimg(&cmd->words);        break;
            case G_SETCIMG:        g_setcimg(&cmd->words);        break;

            // Opcodes that don't need to do anything
            case G_RDPLOADSYNC: break;
            case G_RDPPIPESYNC: break;
            case G_RDPTILESYNC: break;
            case G_RDPFULLSYNC: break;

            // Unimplemented opcodes
            case G_SETSCISSOR:    break;
            case G_SETTILESIZE:   break;
            case G_SETFOGCOLOR:   break;
            case G_SETBLENDCOLOR: break;
            case G_SETPRIMCOLOR:  break;

            case G_DL:
                // Branch to another display list
                if (cmd->words.w0 & (1 << 16)) { // Without return
                    cmd = (Gfx*)cmd->words.w1;
                    continue;
                } else { // With return
                    execute((Gfx*)cmd->words.w1);
                    break;
                }

            case G_ENDDL:
                // Return from the current display list
                return;

            default:
                //printf("Unsupported GBI command: 0x%.2X\n", opcode);
                break;
        }

        cmd++;
    }
}

static void count_frames() {
    // Count a frame (triggered at V-blank)
    frame_count++;
}

void renderer_init() {
    // Set up the screens
    videoSetMode(MODE_0_3D);
    consoleDemoInit();

    // Initialize the 3D renderer
    glInit();
    glClearColor(0, 0, 0, 31);
    glClearDepth(GL_MAX_DEPTH);
    glEnable(GL_ANTIALIAS);
    glEnable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);

    // Set up texture VRAM (bank C is used by the console)
    vramSetBankA(VRAM_A_TEXTURE);
    vramSetBankB(VRAM_B_TEXTURE);
    vramSetBankD(VRAM_D_TEXTURE);
    vramSetBankE(VRAM_E_TEX_PALETTE);

    // Generate an empty texture for when no texture should be used
    glGenTextures(1, &no_texture);
    glBindTexture(GL_TEXTURE_2D, no_texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_NOTEXTURE, 0, 0, 0, TEXGEN_TEXCOORD, NULL);

    // Set up an intensity palette for IA textures
    uint16_t palette[8];
    for (int x = 0; x < 8; x++) {
        const int i = x * 31 / 7;
        palette[x] = (i << 10) | (i << 5) | i;
    }
    glColorTableEXT(GL_TEXTURE_2D, 0, 8, 0, 0, palette);

    // Set up the frame counter to trigger on V-blank
    irqSet(IRQ_VBLANK, count_frames);
    irqEnable(IRQ_VBLANK);
}

void draw_frame(Gfx *display_list) {
    // Reset the depth hack parameters
    background = true;
    z_depth = 0x1000 * 6;

    // Process and draw a frame
    execute(display_list);
    glFlush(0);

    // Limit to 30FPS by waiting for up to 2 frames, depending on how long it took the current frame to render
    for (int i = frame_count; i < 2; i++) {
        swiWaitForVBlank();
    }

    // Reset the frame counter
    frame_count = 0;
}
