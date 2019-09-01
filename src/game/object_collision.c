#include <ultra64.h>

#include "sm64.h"
#include "mario.h"
#include "debug.h"
#include "spawn_object.h"
#include "object_list_processor.h"
#include "interaction.h"

struct Object *Unknown802C8460(struct Object *a) {
    struct Object *sp24;
    UNUSED s32 unused;
    s32 i;

    for (i = 0; i < a->numCollidedObjs; i++) {
        print_debug_top_down_objectinfo("ON", 0);
        sp24 = a->collidedObjs[i];
        if (sp24 != gMarioObject) {
            return sp24;
        }
    }
    return NULL;
}

int func_802C8504(struct Object *a, struct Object *b) {
    f32 sp3C = a->oPosY - a->hitboxDownOffset;
    f32 sp38 = b->oPosY - b->hitboxDownOffset;
    f32 dx = a->oPosX - b->oPosX;
    UNUSED f32 sp30 = sp3C - sp38;
    f32 dz = a->oPosZ - b->oPosZ;
    f32 collisionRadius = a->hitboxRadius + b->hitboxRadius;
    f32 distance = sqrtf(dx * dx + dz * dz);

    if (collisionRadius > distance) {
        f32 sp20 = a->hitboxHeight + sp3C;
        f32 sp1C = b->hitboxHeight + sp38;

        if (sp3C > sp1C) {
            return 0;
        }
        if (sp20 < sp38) {
            return 0;
        }
        if (a->numCollidedObjs >= 4) {
            return 0;
        }
        if (b->numCollidedObjs >= 4) {
            return 0;
        }
        a->collidedObjs[a->numCollidedObjs] = b;
        b->collidedObjs[b->numCollidedObjs] = a;
        a->collidedObjInteractTypes |= b->oInteractType;
        b->collidedObjInteractTypes |= a->oInteractType;
        a->numCollidedObjs++;
        b->numCollidedObjs++;
        return 1;
    }

    //! no return value
}

int func_802C870C(struct Object *a, struct Object *b) {
    f32 sp3C = a->oPosY - a->hitboxDownOffset;
    f32 sp38 = b->oPosY - b->hitboxDownOffset;
    f32 sp34 = a->oPosX - b->oPosX;
    UNUSED f32 sp30 = sp3C - sp38;
    f32 sp2C = a->oPosZ - b->oPosZ;
    f32 sp28 = a->hurtboxRadius + b->hurtboxRadius;
    f32 sp24 = sqrtf(sp34 * sp34 + sp2C * sp2C);

    if (a == gMarioObject) {
        b->oInteractionSubtype |= INT_SUBTYPE_DELAY_INVINCIBILITY;
    }

    if (sp28 > sp24) {
        f32 sp20 = a->hitboxHeight + sp3C;
        f32 sp1C = b->hurtboxHeight + sp38;

        if (sp3C > sp1C) {
            return 0;
        }
        if (sp20 < sp38) {
            return 0;
        }
        if (a == gMarioObject) {
            b->oInteractionSubtype &= ~INT_SUBTYPE_DELAY_INVINCIBILITY;
        }
        return 1;
    }

    //! no return value
}

void func_802C88A8(struct Object *a) {
    struct Object *sp4 = (struct Object *) a->header.next;

    while (sp4 != a) {
        sp4->numCollidedObjs = 0;
        sp4->collidedObjInteractTypes = 0;
        if (sp4->oIntangibleTimer > 0) {
            sp4->oIntangibleTimer--;
        }
        sp4 = (struct Object *) sp4->header.next;
    }
}

void func_802C8918(struct Object *a, struct Object *b, struct Object *c) {
    if (a->oIntangibleTimer == 0) {
        while (b != c) {
            if (b->oIntangibleTimer == 0) {
                if (func_802C8504(a, b) && b->hurtboxRadius != 0.0f) {
                    func_802C870C(a, b);
                }
            }
            b = (struct Object *) b->header.next;
        }
    }
}

void func_802C89CC(void) {
    struct Object *sp1C = (struct Object *) &gObjectLists[OBJ_LIST_PLAYER];
    struct Object *sp18 = (struct Object *) sp1C->header.next;

    while (sp18 != sp1C) {
        func_802C8918(sp18, (struct Object *) sp18->header.next, sp1C);
        func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_POLELIKE].next,
                      (struct Object *) &gObjectLists[OBJ_LIST_POLELIKE]);
        func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_LEVEL].next,
                      (struct Object *) &gObjectLists[OBJ_LIST_LEVEL]);
        func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_GENACTOR].next,
                      (struct Object *) &gObjectLists[OBJ_LIST_GENACTOR]);
        func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_PUSHABLE].next,
                      (struct Object *) &gObjectLists[OBJ_LIST_PUSHABLE]);
        func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_SURFACE].next,
                      (struct Object *) &gObjectLists[OBJ_LIST_SURFACE]);
        func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_DESTRUCTIVE].next,
                      (struct Object *) &gObjectLists[OBJ_LIST_DESTRUCTIVE]);
        sp18 = (struct Object *) sp18->header.next;
    }
}

void func_802C8AD4(void) {
    struct Object *sp1C = (struct Object *) &gObjectLists[OBJ_LIST_PUSHABLE];
    struct Object *sp18 = (struct Object *) sp1C->header.next;

    while (sp18 != sp1C) {
        func_802C8918(sp18, (struct Object *) sp18->header.next, sp1C);
        sp18 = (struct Object *) sp18->header.next;
    }
}

void func_802C8B50(void) {
    struct Object *sp1C = (struct Object *) &gObjectLists[OBJ_LIST_DESTRUCTIVE];
    struct Object *sp18 = (struct Object *) sp1C->header.next;

    while (sp18 != sp1C) {
        if (sp18->oDistanceToMario < 2000.0f && !(sp18->activeFlags & ACTIVE_FLAG_UNK9)) {
            func_802C8918(sp18, (struct Object *) sp18->header.next, sp1C);
            func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_GENACTOR].next,
                          (struct Object *) &gObjectLists[OBJ_LIST_GENACTOR]);
            func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_PUSHABLE].next,
                          (struct Object *) &gObjectLists[OBJ_LIST_PUSHABLE]);
            func_802C8918(sp18, (struct Object *) gObjectLists[OBJ_LIST_SURFACE].next,
                          (struct Object *) &gObjectLists[OBJ_LIST_SURFACE]);
        }
        sp18 = (struct Object *) sp18->header.next;
    }
}

void detect_object_collisions(void) {
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_POLELIKE]);
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_PLAYER]);
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_PUSHABLE]);
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_GENACTOR]);
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_LEVEL]);
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_SURFACE]);
    func_802C88A8((struct Object *) &gObjectLists[OBJ_LIST_DESTRUCTIVE]);
    func_802C89CC();
    func_802C8B50();
    func_802C8AD4();
}
