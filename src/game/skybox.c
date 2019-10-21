#include <ultra64.h>

#include "sm64.h"
#include "engine/math_util.h"
#include "memory.h"
#include "area.h"
#include "save_file.h"
#include "segment2.h"
#include "level_update.h"
#include "geo_misc.h"

struct Struct8035FF50 {
    u16 unk0;
    s16 unk2;
    s32 unk4;
    s32 unk8;
    s32 unkC;
};

struct Struct8032FFC8 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 filler3[1];
};

struct SkyboxList {
    struct Gfx *ptr[50];
};

extern struct SkyboxList water_skybox_ptrlist_0A020000;
extern struct SkyboxList bitfs_skybox_ptrlist_0A018800;
extern struct SkyboxList wdw_skybox_ptrlist_0A020000;
extern struct SkyboxList cloud_floor_skybox_ptrlist_0A020000;
extern struct SkyboxList ccm_skybox_ptrlist_0A020000;
extern struct SkyboxList ssl_skybox_ptrlist_0A020000;
extern struct SkyboxList bbh_skybox_ptrlist_0A014800;
extern struct SkyboxList bidw_skybox_ptrlist_0A020000;
extern struct SkyboxList clouds_skybox_ptrlist_0A014800;
extern struct SkyboxList bits_skybox_ptrlist_0A020000;

// TODO: These should be defined here
struct Struct8035FF50 D_8035FF50[2];

struct SkyboxList *gSkyboxLists[10] = {
    &water_skybox_ptrlist_0A020000,       // water_skybox
    &bitfs_skybox_ptrlist_0A018800,       // bitfs_skybox
    &wdw_skybox_ptrlist_0A020000,         // wdw_skybox
    &cloud_floor_skybox_ptrlist_0A020000, // cloud_floor_skybox
    &ccm_skybox_ptrlist_0A020000,         // ccm_skybox
    &ssl_skybox_ptrlist_0A020000,         // ssl_skybox
    &bbh_skybox_ptrlist_0A014800,         // bbh_skybox
    &bidw_skybox_ptrlist_0A020000,        // bidw_skybox
    &clouds_skybox_ptrlist_0A014800,      // clouds_skybox
    &bits_skybox_ptrlist_0A020000,        // bits_skybox
};
u8 gSkyboxColors[][3] = {
    { 0x50, 0x64, 0x5A },
    { 0xFF, 0xFF, 0xFF },
};

//! double literals are used instead of floats

int func_802CEAD0(s8 a, f32 b) {
    f32 spC = D_8035FF50[a].unk0;
    f32 sp8 = (115200.0 * spC) / (b * 65536.0);
    s32 sp4 = sp8 + 0.5;

    if (sp4 > 1280) {
        sp4 -= sp4 / 1280 * 1280;
    }
    return 1280 - sp4;
}

int func_802CEBBC(s8 a, UNUSED f32 b) {
    f32 sp24 = (f32) D_8035FF50[a].unk2 * 360.0 / 65535.0;
    f32 sp20 = 360.0f * sp24 / 90.0;
    s32 sp1C = round_float(sp20);
    s32 sp18 = sp1C + 0x258;

    if (sp18 > 960) {
        sp18 = 960;
    }
    if (sp18 < 240) {
        sp18 = 240;
    }
    return sp18;
}

int func_802CEC9C(s8 a) {
    s32 sp4 = D_8035FF50[a].unk4 / 160;
    s32 sp0 = (960 - D_8035FF50[a].unk8) / 120;

    return sp0 * 10 + sp4;
}

// generates vertices for some rectangle
Vtx *make_skybox_rect(s32 a, s8 b) {
    Vtx *verts = alloc_display_list(4 * sizeof(*verts));
    s16 x = a % 10 * 160;
    s16 y = 960 - a / 10 * 120;

    if (verts != NULL) {
        make_vertex(verts, 0, x, y, -1, 0, 0, gSkyboxColors[b][0], gSkyboxColors[b][1],
                    gSkyboxColors[b][2], 255);
        make_vertex(verts, 1, x, y - 0x78, -1, 0, 992, gSkyboxColors[b][0], gSkyboxColors[b][1],
                    gSkyboxColors[b][2], 255);
        make_vertex(verts, 2, x + 160, y - 0x78, -1, 992, 992, gSkyboxColors[b][0], gSkyboxColors[b][1],
                    gSkyboxColors[b][2], 255);
        make_vertex(verts, 3, x + 160, y, -1, 992, 0, gSkyboxColors[b][0], gSkyboxColors[b][1],
                    gSkyboxColors[b][2], 255);
    } else {
    }
    return verts;
}

void func_802CEF4C(Gfx **dlist, s8 b, s8 c, s8 d) {
    s32 sp54;
    s32 sp50;

    for (sp54 = 0; sp54 < 3; sp54++) {
        for (sp50 = 0; sp50 < 3; sp50++) {
            s32 sp4C = D_8035FF50[c].unkC + sp54 * 10 + sp50;
            struct Gfx *sp48 =
                ((struct SkyboxList *) segmented_to_virtual((void *) gSkyboxLists[b]))->ptr[sp4C];
            Vtx *vertices = make_skybox_rect(sp4C, d);

            // Why is the width 1 here?
            gDPSetTextureImage((*dlist)++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sp48);
            gDPTileSync((*dlist)++);
            gDPSetTile((*dlist)++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, 7, 0, G_TX_NOMIRROR | G_TX_WRAP,
                       G_TX_NOMASK, G_TX_NOLOD, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK, G_TX_NOLOD);
            gDPLoadSync((*dlist)++);
            gDPLoadBlock((*dlist)++, 7, 0, 0, 1023, 256);
            gSPVertex((*dlist)++, VIRTUAL_TO_PHYSICAL(vertices), 4, 0);
            gSPDisplayList((*dlist)++, dl_draw_quad_verts_0123);
        }
    }
}

void *func_802CF188(s8 a) {
    f32 left = D_8035FF50[a].unk4;
    f32 right = D_8035FF50[a].unk4 + 0x140;
    f32 bottom = D_8035FF50[a].unk8 - 0xF0;
    f32 top = D_8035FF50[a].unk8;
    Mtx *mtx = alloc_display_list(sizeof(*mtx));

    if (mtx != NULL) {
        guOrtho(mtx, left, right, bottom, top, 0.0f, 3.0f, 1.0f);
    } else {
    }

    return mtx;
}

Gfx *func_802CF2A8(s8 a, s8 b, s8 c) {
    s32 sp3C = 5 + 3*3*7;
    void *sp38 = alloc_display_list(sp3C * sizeof(Gfx));
    Gfx *dlist = sp38;

    if (sp38 == NULL) {
        return NULL;
    } else {
        Mtx *mtx = func_802CF188(a);

        gSPDisplayList(dlist++, dl_skybox_begin);
        gSPMatrix(dlist++, VIRTUAL_TO_PHYSICAL(mtx), G_MTX_PROJECTION | G_MTX_MUL);
        gSPDisplayList(dlist++, dl_skybox_tex_settings);
        func_802CEF4C(&dlist, b, a, c);
        gSPDisplayList(dlist++, dl_skybox_end);
        gSPEndDisplayList(dlist);
    }
    return sp38;
}

Gfx *func_802CF414(s8 a, s8 b, f32 c, f32 d, f32 e, f32 f, f32 g, f32 h, f32 i) {
    f32 sp34 = g - d;
    f32 sp30 = h - e;
    f32 sp2C = i - f;
    s8 sp2B = 1;

    if (b == 8 && !(save_file_get_star_flags(gCurrSaveFileNum - 1, 2) & 1)) {
        sp2B = 0;
    }

    c = 90.0f;
    D_8035FF50[a].unk0 = atan2s(sp2C, sp34);
    D_8035FF50[a].unk2 = atan2s(sqrtf(sp34 * sp34 + sp2C * sp2C), sp30);
    D_8035FF50[a].unk4 = func_802CEAD0(a, c);
    D_8035FF50[a].unk8 = func_802CEBBC(a, c);
    D_8035FF50[a].unkC = func_802CEC9C(a);

    return func_802CF2A8(a, b, sp2B);
}
