#include <ultra64.h>

#include "sm64.h"
#include "area.h"
#include "game.h"
#include "engine/math_util.h"
#include "engine/graph_node.h"
#include "memory.h"
#include "geo_misc.h"

#include "segment2.h"

u8 D_8032FF60[4] = { 0 };
u16 D_8032FF64[2] = { 0 };

s32 func_802CAAE0(s8 a0, u8 a1) {
    s32 sp4 = 0;

    D_8032FF60[a0]++;

    if (D_8032FF60[a0] == a1) {
        D_8032FF60[a0] = 0;
        D_8032FF64[a0] = 0;
        sp4 = 1;
    }
    return sp4;
}

u8 func_802CAB60(s8 a0, s8 a1, u8 a2) {
    u8 sp7;

    switch (a0) {
        case 0:
            sp7 = (f32) D_8032FF60[a1] * 255.0 / (f32)(a2 - 1) + 0.5;
            break;
        case 1:
            sp7 = (1.0 - D_8032FF60[a1] / (f32)(a2 - 1)) * 255.0 + 0.5;
            break;
    }
    return sp7;
}

Vtx *func_802CADB4(struct WarpTransitionData *transData, u8 alpha) {
    Vtx *verts = alloc_display_list(4 * sizeof(*verts));
    u8 r = transData->red;
    u8 g = transData->green;
    u8 b = transData->blue;

    if (verts != NULL) {
        make_vertex(verts, 0, 0, 0, -1, 0, 0, r, g, b, alpha);
        make_vertex(verts, 1, 320, 0, -1, 0, 0, r, g, b, alpha);
        make_vertex(verts, 2, 320, 240, -1, 0, 0, r, g, b, alpha);
        make_vertex(verts, 3, 0, 240, -1, 0, 0, r, g, b, alpha);
    } else {
    }
    return verts;
}

s32 func_802CAF38(s8 a0, u8 a1, struct WarpTransitionData *transData, u8 alpha) {
    Vtx *verts = func_802CADB4(transData, alpha);

    if (verts != NULL) {
        gSPDisplayList(gDisplayListHead++, dl_proj_mtx_fullscreen);
        gDPSetCombineMode(gDisplayListHead++, G_CC_SHADE, G_CC_SHADE);
        gDPSetRenderMode(gDisplayListHead++, G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2);
        gSPVertex(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(verts), 4, 0);
        gSPDisplayList(gDisplayListHead++, dl_draw_quad_verts_0123);
        gSPDisplayList(gDisplayListHead++, dl_screen_transition_end);
    }
    return func_802CAAE0(a0, a1);
}

s32 func_802CB0E4(s8 a0, u8 a1, struct WarpTransitionData *transData) {
    u8 alpha = func_802CAB60(1, a0, a1);

    return func_802CAF38(a0, a1, transData, alpha);
}

s32 func_802CB140(s8 a0, u8 a1, struct WarpTransitionData *transData) {
    u8 alpha = func_802CAB60(0, a0, a1);

    return func_802CAF38(a0, a1, transData, alpha);
}

s16 func_802CB19C(s8 a0, s8 a1, struct WarpTransitionData *transData) {
    f32 spC = transData->endCircleRadius - transData->startCircleRadius;
    f32 sp8 = D_8032FF60[a0] * spC / (f32)(a1 - 1);
    f32 sp4 = transData->startCircleRadius + sp8;

    return sp4 + 0.5;
}

f32 func_802CB274(s8 a0, s8 a1, struct WarpTransitionData *transData) {
    f32 sp2C = transData->startCircleX;
    f32 sp28 = transData->startCircleY;
    f32 sp24 = transData->endCircleX;
    f32 sp20 = transData->endCircleY;
    f32 sp1C = sqrtf((sp2C - sp24) * (sp2C - sp24) + (sp28 - sp20) * (sp28 - sp20));
    f32 sp18 = (f32) D_8032FF60[a0] * sp1C / (f32)(a1 - 1);

    return sp18;
}

u16 func_802CB384(struct WarpTransitionData *transData) {
    f32 sp1C = transData->endCircleX - transData->startCircleX;
    f32 sp18 = transData->endCircleY - transData->startCircleY;

    return atan2s(sp1C, sp18);
}

s16 func_802CB400(struct WarpTransitionData *transData, f32 a1, u16 a2) {
    f32 sp4 = transData->startCircleX + coss(a2) * a1;

    return sp4 + 0.5;
}

s16 func_802CB484(struct WarpTransitionData *transData, f32 a1, u16 a2) {
    f32 sp4 = transData->startCircleY + sins(a2) * a1;

    return sp4 + 0.5;
}

void func_802CB508(Vtx *verts, s32 n, s8 a2, struct WarpTransitionData *transData, s16 sp62, s16 sp66,
                   s16 sp6A, s16 sp6E, s16 sp72, s16 sp76) {
    u8 r = transData->red;
    u8 g = transData->green;
    u8 b = transData->blue;
    u16 sp4A = D_8032FF64[a2];
    f32 sp44 = sp6A * coss(sp4A) - sp6E * sins(sp4A) + sp62;
    f32 sp40 = sp6A * sins(sp4A) + sp6E * coss(sp4A) + sp66;
    s16 x = round_float(sp44);
    s16 y = round_float(sp40);

    make_vertex(verts, n, x, y, -1, sp72 * 32, sp76 * 32, r, g, b, 255);
}

void func_802CB6A0(Vtx *verts, s8 sp47, struct WarpTransitionData *transData, s16 sp4E, s16 sp52,
                   s16 sp56, s8 sp5B) {
    switch (sp5B) {
        case 0:
            func_802CB508(verts, 0, sp47, transData, sp4E, sp52, -sp56, -sp56, -31, 63);
            func_802CB508(verts, 1, sp47, transData, sp4E, sp52, sp56, -sp56, 31, 63);
            func_802CB508(verts, 2, sp47, transData, sp4E, sp52, sp56, sp56, 31, 0);
            func_802CB508(verts, 3, sp47, transData, sp4E, sp52, -sp56, sp56, -31, 0);
            break;
        case 1:
            func_802CB508(verts, 0, sp47, transData, sp4E, sp52, -sp56, -sp56, 0, 63);
            func_802CB508(verts, 1, sp47, transData, sp4E, sp52, sp56, -sp56, 63, 63);
            func_802CB508(verts, 2, sp47, transData, sp4E, sp52, sp56, sp56, 63, 0);
            func_802CB508(verts, 3, sp47, transData, sp4E, sp52, -sp56, sp56, 0, 0);
            break;
    }
    func_802CB508(verts, 4, sp47, transData, sp4E, sp52, -2000, -2000, 0, 0);
    func_802CB508(verts, 5, sp47, transData, sp4E, sp52, 2000, -2000, 0, 0);
    func_802CB508(verts, 6, sp47, transData, sp4E, sp52, 2000, 2000, 0, 0);
    func_802CB508(verts, 7, sp47, transData, sp4E, sp52, -2000, 2000, 0, 0);
}

void *D_8032FF68[] = {
    texture_transition_star_half,
    texture_transition_circle_half,
    texture_transition_mario,
    texture_transition_bowser_half,
};

s32 func_802CB9F8(s8 spBB, s8 spBF, struct WarpTransitionData *transData, s8 spC7, s8 spCB) {
    f32 spB4 = func_802CB274(spBB, spBF, transData);
    u16 spB2 = func_802CB384(transData);
    s16 spB0 = func_802CB400(transData, spB4, spB2);
    s16 spAE = func_802CB484(transData, spB4, spB2);
    s16 spAC = func_802CB19C(spBB, spBF, transData);
    Vtx *spA8 = alloc_display_list(8 * sizeof(*spA8));

    if (spA8 != NULL) {
        func_802CB6A0(spA8, spBB, transData, spB0, spAE, spAC, spCB); // TODO types
        gSPDisplayList(gDisplayListHead++, dl_proj_mtx_fullscreen);
        gDPSetCombineMode(gDisplayListHead++, G_CC_SHADE, G_CC_SHADE);
        gDPSetRenderMode(gDisplayListHead++, G_RM_AA_OPA_SURF, G_RM_AA_OPA_SURF2);
        gSPVertex(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(spA8), 8, 0);
        gSPDisplayList(gDisplayListHead++, dl_transition_draw_filled_region);
        gDPPipeSync(gDisplayListHead++);
        gDPSetCombineMode(gDisplayListHead++, G_CC_MODULATEIDECALA, G_CC_MODULATEIDECALA);
        gDPSetRenderMode(gDisplayListHead++, G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2);
        gDPSetTextureFilter(gDisplayListHead++, G_TF_BILERP);
    switch (spCB) {
        case 0:
            gDPLoadTextureBlock(gDisplayListHead++, D_8032FF68[spC7], G_IM_FMT_IA, G_IM_SIZ_8b, 32, 64, 0,
                G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 5, 6, G_TX_NOLOD, G_TX_NOLOD);
            break;
        case 1:
            gDPLoadTextureBlock(gDisplayListHead++, D_8032FF68[spC7], G_IM_FMT_IA, G_IM_SIZ_8b, 64, 64, 0,
                G_TX_CLAMP, G_TX_CLAMP, 6, 6, G_TX_NOLOD, G_TX_NOLOD);
            break;
        }
        gSPTexture(gDisplayListHead++, 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON);
        gSPVertex(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(spA8), 4, 0);
        gSPDisplayList(gDisplayListHead++, dl_draw_quad_verts_0123);
        gSPTexture(gDisplayListHead++, 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF);
        gSPDisplayList(gDisplayListHead++, dl_screen_transition_end);
        D_8032FF64[spBB] += transData->unk10;
    } else {
    }
    return func_802CAAE0(spBB, spBF);
}

int func_802CC108(s8 sp23, s8 sp27, u8 sp2B, struct WarpTransitionData *sp2C) {
    switch (sp27) {
        case 0:
            return func_802CB0E4(sp23, sp2B, sp2C);
            break;
        case 1:
            return func_802CB140(sp23, sp2B, sp2C);
            break;
        case 8:
            return func_802CB9F8(sp23, sp2B, sp2C, 0, 0);
            break;
        case 9:
            return func_802CB9F8(sp23, sp2B, sp2C, 0, 0);
            break;
        case 10:
            return func_802CB9F8(sp23, sp2B, sp2C, 1, 0);
            break;
        case 11:
            return func_802CB9F8(sp23, sp2B, sp2C, 1, 0);
            break;
        case 16:
            return func_802CB9F8(sp23, sp2B, sp2C, 2, 1);
            break;
        case 17:
            return func_802CB9F8(sp23, sp2B, sp2C, 2, 1);
            break;
        case 18:
            return func_802CB9F8(sp23, sp2B, sp2C, 3, 0);
            break;
        case 19:
            return func_802CB9F8(sp23, sp2B, sp2C, 3, 0);
            break;
    }
}

Gfx *func_802CC2E8(void) {
    Vtx *verts = alloc_display_list(4 * sizeof(*verts));
    Gfx *dlist = alloc_display_list(16 * sizeof(*dlist));
    Gfx *g = dlist;

    if (verts != NULL && dlist != NULL) {
        make_vertex(verts, 0, 0, 0, -1, -1152, 1824, 0, 0, 0, 255);
        make_vertex(verts, 1, 320, 0, -1, 1152, 1824, 0, 0, 0, 255);
        make_vertex(verts, 2, 320, 240, -1, 1152, 192, 0, 0, 0, 255);
        make_vertex(verts, 3, 0, 240, -1, -1152, 192, 0, 0, 0, 255);

        gSPDisplayList(g++, dl_proj_mtx_fullscreen)
        gDPSetCombineMode(g++, G_CC_MODULATEIDECALA, G_CC_MODULATEIDECALA);
        gDPSetTextureFilter(g++, G_TF_BILERP);
        gDPLoadTextureBlock(g++, D_8032FF68[1], G_IM_FMT_IA, G_IM_SIZ_8b, 32, 64, 0,
            G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 5, 6, G_TX_NOLOD, G_TX_NOLOD);
        gSPTexture(g++, 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON);
        gSPVertex(g++, VIRTUAL_TO_PHYSICAL(verts), 4, 0);
        gSPDisplayList(g++, dl_draw_quad_verts_0123);
        gSPTexture(g++, 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF);
        gSPDisplayList(g++, dl_screen_transition_end);
        gSPEndDisplayList(g);
    } else {
        return NULL;
    }
    return dlist;
}

Gfx *Geo18_802CD1E8(s32 run, struct GraphNode *node, UNUSED f32 mtx[4][4]) {
    struct GraphNodeGenerated *sp1C = (struct GraphNodeGenerated *) node;
    Gfx *dlist = NULL;

    if (run == TRUE && gCurrentArea != NULL
        && gCurrentArea->camera->currPreset == CAMERA_PRESET_INSIDE_CANNON) {
        sp1C->fnNode.node.flags = (sp1C->fnNode.node.flags & 0xFF) | 0x500;
        dlist = func_802CC2E8();
    }
    return dlist;
}
