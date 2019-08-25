#include <ultra64.h>
#include <macros.h>
#include "gd_types.h"
#include "gd_macros.h"
#include "gd_main.h"
#include "gd_math.h"
#include "debug_utils.h"
#include "renderer.h"

/* 242300 -> 242338 */
f32 gd_sqrt_f(f32 val) {
    return (f32) gd_sqrt_d(val);
}

/* 242338 -> 24292C */
void func_80193B68(Mat4f *mtx, f32 a1, f32 a2, f32 a3, f32 sp78, f32 sp7C, f32 sp80, f32 sp84, f32 sp88,
                   f32 sp8C) {
    f32 sp64;
    struct GdVec3f sp58;
    struct GdVec3f sp4C;
    struct GdVec3f sp40;

    set_identity_mat4(mtx);
    sp58.z = sp78 - a1;
    sp58.y = sp7C - a2;
    sp58.x = sp80 - a3;

    sp64 = ABS(sp58.z) + ABS(sp58.y) + ABS(sp58.x);

    if (sp64 > 10000.0f || sp64 < 10.0f) {
        sp40.x = sp58.z;
        sp40.y = sp58.y;
        sp40.z = sp58.x;
        into_unit_vec3f(&sp40);
        sp40.x *= 10000.0f;
        sp40.y *= 10000.0f;
        sp40.z *= 10000.0f;

        sp58.z = sp40.x;
        sp58.y = sp40.y;
        sp58.x = sp40.z;
    }
    // L80193D44
    sp64 = -1.0 / gd_sqrt_f(SQ(sp58.z) + SQ(sp58.y) + SQ(sp58.x)); //? -1.0f
    sp58.z *= sp64;
    sp58.y *= sp64;
    sp58.x *= sp64;
    // 80193DC8
    sp4C.z = sp88 * sp58.x - sp8C * sp58.y;
    sp4C.y = sp8C * sp58.z - sp84 * sp58.x;
    sp4C.x = sp84 * sp58.y - sp88 * sp58.z;
    sp64 = 1.0 / gd_sqrt_f(SQ(sp4C.z) + SQ(sp4C.y) + SQ(sp4C.x)); //? 1.0f
    sp4C.z *= sp64;
    sp4C.y *= sp64;
    sp4C.x *= sp64;

    sp84 = sp58.y * sp4C.x - sp58.x * sp4C.y;
    sp88 = sp58.x * sp4C.z - sp58.z * sp4C.x;
    sp8C = sp58.z * sp4C.y - sp58.y * sp4C.z;
    sp64 = 1.0 / gd_sqrt_f(SQ(sp84) + SQ(sp88) + SQ(sp8C)); //? 1.0f
    sp84 *= sp64;
    sp88 *= sp64;
    sp8C *= sp64;
    // 80193FA8
    (*mtx)[0][0] = sp4C.z;
    (*mtx)[1][0] = sp4C.y;
    (*mtx)[2][0] = sp4C.x;
    (*mtx)[3][0] = -(a1 * sp4C.z + a2 * sp4C.y + a3 * sp4C.x);

    (*mtx)[0][1] = sp84;
    (*mtx)[1][1] = sp88;
    (*mtx)[2][1] = sp8C;
    (*mtx)[3][1] = -(a1 * sp84 + a2 * sp88 + a3 * sp8C);

    (*mtx)[0][2] = sp58.z;
    (*mtx)[1][2] = sp58.y;
    (*mtx)[2][2] = sp58.x;
    (*mtx)[3][2] = -(a1 * sp58.z + a2 * sp58.y + a3 * sp58.x);

    (*mtx)[0][3] = 0.0f;
    (*mtx)[1][3] = 0.0f;
    (*mtx)[2][3] = 0.0f;
    (*mtx)[3][3] = 1.0f;
}

/* 24292C -> 2429F0 */
void func_8019415C(Mat4f *mtx, struct GdVec3f *vec) {
    (*mtx)[0][0] *= vec->x;
    (*mtx)[0][1] *= vec->x;
    (*mtx)[0][2] *= vec->x;
    (*mtx)[1][0] *= vec->y;
    (*mtx)[1][1] *= vec->y;
    (*mtx)[1][2] *= vec->y;
    (*mtx)[2][0] *= vec->z;
    (*mtx)[2][1] *= vec->z;
    (*mtx)[2][2] *= vec->z;
}

/* 2429F0 -> 242AB4 */
void func_80194220(Mat4f *mtx, struct GdVec3f *vec) {
    if (vec->x != 0.0f) {
        absrot_mat4(mtx, 0, vec->x);
    }
    if (vec->y != 0.0f) {
        absrot_mat4(mtx, 1, vec->y);
    }
    if (vec->z != 0.0f) {
        absrot_mat4(mtx, 2, vec->z);
    }
}

/* 242AB4 -> 242B28 */
void func_801942E4(Mat4f *mtx, struct GdVec3f *vec) {
    UNUSED Mat4f temp;
    f32 z, y, x;

    x = vec->x;
    y = vec->y;
    z = vec->z;

    (*mtx)[3][0] += x;
    (*mtx)[3][1] += y;
    (*mtx)[3][2] += z;
}

/* 242B28 -> 242EF8 */
void func_80194358(Mat4f *mtx, struct GdVec3f *vec, f32 a2) {
    f32 sp34;
    f32 sp30; // distance between unit vec.x and unit vec.y
    f32 sp2C; // cos(a2)
    f32 sp28; // sin(a2)
    f32 sp24 = RAD_PER_DEG;
    struct GdVec3f unit; // 18

    unit.x = vec->x;
    unit.y = vec->y;
    unit.z = vec->z;
    into_unit_vec3f(&unit);
    sp30 = gd_sqrt_f(SQ(unit.x) + SQ(unit.z));
    a2 *= sp24; // convert a2 from degrees to radians?
    sp28 = gd_sin_d(a2);
    sp2C = gd_cos_d(a2);

    set_identity_mat4(mtx);
    if (sp30 != 0.0f) {
        sp34 = 1.0f / sp30;
        (*mtx)[0][0] = ((-unit.z * sp2C) - (sp28 * unit.y * unit.x)) * sp34;
        (*mtx)[1][0] = ((unit.z * sp28) - (sp2C * unit.y * unit.x)) * sp34;
        (*mtx)[2][0] = -unit.x;
        (*mtx)[3][0] = 0.0f;
        (*mtx)[0][1] = sp28 * sp30;
        (*mtx)[1][1] = sp2C * sp30;
        (*mtx)[2][1] = -unit.y;
        (*mtx)[3][1] = 0.0f;
        (*mtx)[0][2] = ((sp2C * unit.x) - (sp28 * unit.y * unit.z)) * sp34;
        (*mtx)[1][2] = ((-sp28 * unit.x) - (sp2C * unit.y * unit.z)) * sp34;
        (*mtx)[2][2] = -unit.z;
        (*mtx)[3][2] = 0.0f;
        (*mtx)[0][3] = 0.0f;
        (*mtx)[1][3] = 0.0f;
        (*mtx)[2][3] = 0.0f;
        (*mtx)[3][3] = 1.0f;
    } else { // L80194600
        (*mtx)[0][0] = 0.0f;
        (*mtx)[1][0] = 1.0f;
        (*mtx)[2][0] = 0.0f;
        (*mtx)[3][0] = 0.0f;
        (*mtx)[0][1] = 0.0f;
        (*mtx)[1][1] = 0.0f;
        (*mtx)[2][1] = 1.0f;
        (*mtx)[3][1] = 0.0f;
        (*mtx)[0][2] = 1.0f;
        (*mtx)[1][2] = 0.0f;
        (*mtx)[2][2] = 0.0f;
        (*mtx)[3][2] = 0.0f;
        (*mtx)[0][3] = 0.0f;
        (*mtx)[1][3] = 0.0f;
        (*mtx)[2][3] = 0.0f;
        (*mtx)[3][3] = 1.0f;
    }
}

/* 242EF8 -> 242F40 */
f32 func_80194728(f32 a, f32 b) {
    if (b < a) {
        a = b;
    } else if (a < -b) {
        a = -b;
    }

    return a;
}

/* 242F40 -> 243050; orig name: func_80194770 */
void limit_vec3f(struct GdVec3f *vec, f32 limit) {
    if (vec->x > limit) {
        vec->x = limit;
    } else if (vec->x < -limit) {
        vec->x = -limit;
    }

    if (vec->y > limit) {
        vec->y = limit;
    } else if (vec->y < -limit) {
        vec->y = -limit;
    }

    if (vec->z > limit) {
        vec->z = limit;
    } else if (vec->z < -limit) {
        vec->z = -limit;
    }
}

/* 243050 -> 24315C */
void func_80194880(f32 a0, f32 *a1, f32 *a2) {
    f32 sp34;
    f32 sp30;
    f32 sp2C;

    sp2C = a0 / DEG_PER_RAD; // degree to radians
    sp34 = (*a1 * gd_cos_d(sp2C)) - (*a2 * gd_sin_d(sp2C));
    sp30 = (*a1 * gd_sin_d(sp2C)) + (*a2 * gd_cos_d(sp2C));
    *a1 = sp34;
    *a2 = sp30;
}

/* 24315C -> 243224 */
void Unknown8019498C(Mat4f *a0, s32 row, f32 a2) {
    Mat4f sp28;
    struct GdVec3f vec;

    vec.x = (*a0)[row][0];
    vec.y = (*a0)[row][1];
    vec.z = (*a0)[row][2];

    func_801961F4(&sp28, &vec, a2 / 2.0); //? 2.0f
    multiply_mat4(a0, &sp28, a0);
}

// TODO: enumerate second argument (0-2)?
/* 243224 -> 243368; orig name: func_80194A54 */
void absrot_mat4(Mat4f *mtx, s32 axisnum, f32 a2) {
    Mat4f sp30;
    struct GdVec3f rot; // 24

    switch (axisnum) {
        case 0:
            rot.x = 1.0f;
            rot.y = 0.0f;
            rot.z = 0.0f;
            break;
        case 1:
            rot.x = 0.0f;
            rot.y = 1.0f;
            rot.z = 0.0f;
            break;
        case 2:
            rot.x = 0.0f;
            rot.y = 0.0f;
            rot.z = 1.0f;
            break;
        default:
            fatal_printf("absrot_matrix4(): Bad axis num");
    }

    func_801961F4(&sp30, &rot, a2 / 2.0); //? 2.0f
    multiply_mat4(mtx, &sp30, mtx);
}

/* 243368 -> 2433C4 */
f32 magnitude_vec3f(struct GdVec3f *vec) {
    return gd_sqrt_f(SQ(vec->x) + SQ(vec->y) + SQ(vec->z));
}

/* 2433C4 -> 2434E4; orig name: func_80194BF4 */
s32 into_unit_vec3f(struct GdVec3f *vec) {
    f32 mag;
    if ((mag = SQ(vec->x) + SQ(vec->y) + SQ(vec->z)) == 0.0f) {
        return FALSE;
    }

    mag = gd_sqrt_f(mag);
    if (mag == 0.0f) {
        vec->x = 0.0f;
        vec->y = 0.0f;
        vec->z = 0.0f;
        return FALSE;
    }

    vec->x /= mag;
    vec->y /= mag;
    vec->z /= mag;

    return TRUE;
}

/* 2434E4 -> 243588; orig name: func_80194D14 */
void cross_product_vec3f(struct GdVec3f *a, struct GdVec3f *b, struct GdVec3f *dst) {
    struct GdVec3f result;

    result.x = (a->y * b->z) - (a->z * b->y);
    result.y = (a->z * b->x) - (a->x * b->z);
    result.z = (a->x * b->y) - (a->y * b->x);

    dst->x = result.x;
    dst->y = result.y;
    dst->z = result.z;
}

/* 243588 -> 2435CC; orig name: func_80194DB8 */
f32 dot_product_vec3f(struct GdVec3f *a, struct GdVec3f *b) {
    return (a->x * b->x) + (a->y * b->y) + (a->z * b->z);
}

/* 2435CC -> 24364C */
void Unknown80194DFC(Mat4f *src, Mat4f *dst) {
    s32 i;
    s32 j;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            (*dst)[i][j] = 1.0f / (*src)[i][j];
        }
    }
}

/* self */ void func_80194F90(Mat4f *, Mat4f *);
/* self */ f32 func_80195578(Mat4f *);

/* 24364C -> 243760; orig name: func_80194E7C */
void inverse_mat4(Mat4f *src, Mat4f *dst) {
    s32 i;
    s32 j;
    f32 determinant;

    func_80194F90(src, dst);
    determinant = func_80195578(dst);

    if (ABS(determinant) < 1e-5) //? 1e-5f
    {
        fatal_print("Non-singular matrix, no inverse!\n");
    }

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            (*dst)[i][j] /= determinant;
        }
    }
}

/* self */ f32 func_80195844(f32, f32, f32, f32, f32, f32, f32, f32, f32);

struct Row4 {
    f32 c0, c1, c2, c3;
};
struct InvMat4 {
    struct Row4 r0, r1, r2, r3;
};

/* 243760 -> 243D48 */
// TODO: adjunct mat4?
void func_80194F90(Mat4f *src, Mat4f *adj) {
    struct InvMat4 inv; // 30

    inv.r3.c3 = (*src)[0][0];
    inv.r2.c3 = (*src)[0][1];
    inv.r1.c3 = (*src)[0][2];
    inv.r0.c3 = (*src)[0][3];
    inv.r3.c2 = (*src)[1][0];
    inv.r2.c2 = (*src)[1][1];
    inv.r1.c2 = (*src)[1][2];
    inv.r0.c2 = (*src)[1][3];
    inv.r3.c1 = (*src)[2][0];
    inv.r2.c1 = (*src)[2][1];
    inv.r1.c1 = (*src)[2][2];
    inv.r0.c1 = (*src)[2][3];
    inv.r3.c0 = (*src)[3][0];
    inv.r2.c0 = (*src)[3][1];
    inv.r1.c0 = (*src)[3][2];
    inv.r0.c0 = (*src)[3][3];

    (*adj)[0][0] = func_80195844(inv.r2.c2, inv.r2.c1, inv.r2.c0, inv.r1.c2, inv.r1.c1, inv.r1.c0,
                                 inv.r0.c2, inv.r0.c1, inv.r0.c0);

    (*adj)[1][0] = -func_80195844(inv.r3.c2, inv.r3.c1, inv.r3.c0, inv.r1.c2, inv.r1.c1, inv.r1.c0,
                                  inv.r0.c2, inv.r0.c1, inv.r0.c0);
    // 80195170
    (*adj)[2][0] = func_80195844(inv.r3.c2, inv.r3.c1, inv.r3.c0, inv.r2.c2, inv.r2.c1, inv.r2.c0,
                                 inv.r0.c2, inv.r0.c1, inv.r0.c0);
    // 801951B8
    (*adj)[3][0] = -func_80195844(inv.r3.c2, inv.r3.c1, inv.r3.c0, inv.r2.c2, inv.r2.c1, inv.r2.c0,
                                  inv.r1.c2, inv.r1.c1, inv.r1.c0);
    // 80195200
    (*adj)[0][1] = -func_80195844(inv.r2.c3, inv.r2.c1, inv.r2.c0, inv.r1.c3, inv.r1.c1, inv.r1.c0,
                                  inv.r0.c3, inv.r0.c1, inv.r0.c0);
    // 80195248
    (*adj)[1][1] = func_80195844(inv.r3.c3, inv.r3.c1, inv.r3.c0, inv.r1.c3, inv.r1.c1, inv.r1.c0,
                                 inv.r0.c3, inv.r0.c1, inv.r0.c0);
    // 80195290
    (*adj)[2][1] = -func_80195844(inv.r3.c3, inv.r3.c1, inv.r3.c0, inv.r2.c3, inv.r2.c1, inv.r2.c0,
                                  inv.r0.c3, inv.r0.c1, inv.r0.c0);
    // 801952D8
    (*adj)[3][1] = func_80195844(inv.r3.c3, inv.r3.c1, inv.r3.c0, inv.r2.c3, inv.r2.c1, inv.r2.c0,
                                 inv.r1.c3, inv.r1.c1, inv.r1.c0);
    // 80195320
    (*adj)[0][2] = func_80195844(inv.r2.c3, inv.r2.c2, inv.r2.c0, inv.r1.c3, inv.r1.c2, inv.r1.c0,
                                 inv.r0.c3, inv.r0.c2, inv.r0.c0);
    // 80195368
    (*adj)[1][2] = -func_80195844(inv.r3.c3, inv.r3.c2, inv.r3.c0, inv.r1.c3, inv.r1.c2, inv.r1.c0,
                                  inv.r0.c3, inv.r0.c2, inv.r0.c0);
    // 801953B0
    (*adj)[2][2] = func_80195844(inv.r3.c3, inv.r3.c2, inv.r3.c0, inv.r2.c3, inv.r2.c2, inv.r2.c0,
                                 inv.r0.c3, inv.r0.c2, inv.r0.c0);
    // 801953F8
    (*adj)[3][2] = -func_80195844(inv.r3.c3, inv.r3.c2, inv.r3.c0, inv.r2.c3, inv.r2.c2, inv.r2.c0,
                                  inv.r1.c3, inv.r1.c2, inv.r1.c0);
    // 80195440
    (*adj)[0][3] = -func_80195844(inv.r2.c3, inv.r2.c2, inv.r2.c1, inv.r1.c3, inv.r1.c2, inv.r1.c1,
                                  inv.r0.c3, inv.r0.c2, inv.r0.c1);
    // 80195488
    (*adj)[1][3] = func_80195844(inv.r3.c3, inv.r3.c2, inv.r3.c1, inv.r1.c3, inv.r1.c2, inv.r1.c1,
                                 inv.r0.c3, inv.r0.c2, inv.r0.c1);
    // 801954D0
    (*adj)[2][3] = -func_80195844(inv.r3.c3, inv.r3.c2, inv.r3.c1, inv.r2.c3, inv.r2.c2, inv.r2.c1,
                                  inv.r0.c3, inv.r0.c2, inv.r0.c1);
    // 80195518
    (*adj)[3][3] = func_80195844(inv.r3.c3, inv.r3.c2, inv.r3.c1, inv.r2.c3, inv.r2.c2, inv.r2.c1,
                                 inv.r1.c3, inv.r1.c2, inv.r1.c1);
}

/* 243D48 -> 244014 */
// TODO: determinant mat4
f32 func_80195578(Mat4f *mtx) {
    f32 det;
    struct InvMat4 inv; // 54 -> 94

    inv.r3.c3 = (*mtx)[0][0];
    inv.r2.c3 = (*mtx)[0][1];
    inv.r1.c3 = (*mtx)[0][2];
    inv.r0.c3 = (*mtx)[0][3];
    inv.r3.c2 = (*mtx)[1][0];
    inv.r2.c2 = (*mtx)[1][1];
    inv.r1.c2 = (*mtx)[1][2];
    inv.r0.c2 = (*mtx)[1][3];
    inv.r3.c1 = (*mtx)[2][0];
    inv.r2.c1 = (*mtx)[2][1];
    inv.r1.c1 = (*mtx)[2][2];
    inv.r0.c1 = (*mtx)[2][3];
    inv.r3.c0 = (*mtx)[3][0];
    inv.r2.c0 = (*mtx)[3][1];
    inv.r1.c0 = (*mtx)[3][2];
    inv.r0.c0 = (*mtx)[3][3];

    det = (inv.r3.c3
               * func_80195844(inv.r2.c2, inv.r2.c1, inv.r2.c0, inv.r1.c2, inv.r1.c1, inv.r1.c0,
                               inv.r0.c2, inv.r0.c1, inv.r0.c0)
           - inv.r2.c3
                 * func_80195844(inv.r3.c2, inv.r3.c1, inv.r3.c0, inv.r1.c2, inv.r1.c1, inv.r1.c0,
                                 inv.r0.c2, inv.r0.c1, inv.r0.c0))
          + inv.r1.c3
                * func_80195844(inv.r3.c2, inv.r3.c1, inv.r3.c0, inv.r2.c2, inv.r2.c1, inv.r2.c0,
                                inv.r0.c2, inv.r0.c1, inv.r0.c0)
          - inv.r0.c3
                * func_80195844(inv.r3.c2, inv.r3.c1, inv.r3.c0, inv.r2.c2, inv.r2.c1, inv.r2.c0,
                                inv.r1.c2, inv.r1.c1, inv.r1.c0);

    return det;
}

/* self */ f32 func_8019590C(f32, f32, f32, f32);

/* 244014 -> 2440DC */
// TODO: determinant_3x3
f32 func_80195844(f32 r0c0, f32 r0c1, f32 r0c2, f32 r1c0, f32 r1c1, f32 r1c2, f32 r2c0, f32 r2c1,
                  f32 r2c2) {
    f32 det;

    det = r0c0 * func_8019590C(r1c1, r1c2, r2c1, r2c2) - r1c0 * func_8019590C(r0c1, r0c2, r2c1, r2c2)
          + r2c0 * func_8019590C(r0c1, r0c2, r1c1, r1c2);

    return det;
}

/* 2440DC -> 244120 */
// TODO: determinant_2x2
f32 func_8019590C(f32 a, f32 b, f32 c, f32 d) {
    f32 det = a * d - b * c;

    return det;
}

/* 244120 -> 2441B0 */
void Unknown80195950(Mat4f *mtx, struct GdVec3f *vec, f32 x, f32 y, f32 z) {
    s32 i;

    vec->x = -x;
    vec->y = -y;
    vec->z = -z;

    (*mtx)[0][0] = 1.0f;

    for (i = 1; i < 4; i++) {
        (*mtx)[0][i] = 0.0f;
    }
}

/* 2441B0 -> 2442D4 */
void Unknown801959E0(f32 *a0, struct GdVec3f *vec, f32 a2, s32 a3, s32 sp38) {
    s32 sp24;
    s32 sp20;
    UNUSED f32 sp1C;
    UNUSED f32 sp18;
    UNUSED struct GdVec3f sp0C;
    struct GdVec3f sp00;

    sp00.x = vec->x;
    sp00.y = vec->y;
    sp00.z = vec->z;

    if (sp38 < 0) {
        goto end;
    }
    // L80195A24
    sp24 = a3 + 1;
    if (sp24 >= 4) {
        sp24 = 1;
    }
    // L80195A48
    if ((sp20 = sp24 + 1) >= 4) {
        sp20 = 1;
    }
    // L80195A68
    sp1C = a0[sp24];
    sp18 = a0[sp20];
    sp0C.x = a0[0];
    sp0C.y = a0[a3];
    sp0C.z = a2 + a2;

end: // L80195AD0
    vec->x = sp00.x;
    vec->y = sp00.y;
    vec->z = sp00.z;
}

/* 2442D4 -> 244448 */
void Unknown80195B04(f32 *a0, UNUSED s32 a1, f32 a2, f32 a3, s32 sp28, s32 sp2C) {
    s32 sp14;
    s32 sp10;
    f32 sp0C;
    UNUSED u32 pad[2];

    if ((sp14 = sp28 + 1) >= 4) {
        sp14 = 1;
    }
    if ((sp10 = sp14 + 1) >= 4) {
        sp10 = 1;
    }

    sp0C = a0[sp28];
    a0[sp28] = ((f32) sp2C) * a3 * a0[0] + sp0C * a2;
    a0[0] = a0[0] * a2 - ((f32) sp2C) * a3 * sp0C;

    sp0C = a0[sp14];
    a0[sp14] = a0[sp10] * a3 + sp0C * a2;
    a0[sp10] = a0[sp10] * a2 - a3 * sp0C;
}

/* 244448 -> 244568 */
void func_80195C78(Mat4f *mtx) {
    s32 i;       // 14
    s32 j;       // 10
    f32 temp[3]; // 04

    for (i = 0; i < 3; i++) {
        temp[i] = (*mtx)[0][i + 1];
    }
    for (i = 1; i < 4; i++) {
        for (j = 1; j < 4; j++) {
            (*mtx)[i - 1][j - 1] = (*mtx)[i][j];
        }
    }

    (*mtx)[0][3] = 0.0f;
    (*mtx)[1][3] = 0.0f;
    (*mtx)[2][3] = 0.0f;
    (*mtx)[3][3] = 1.0f;

    for (i = 0; i < 3; i++) {
        (*mtx)[3][i] = temp[i];
    }
}

/* 244568 -> 2447A4 */
void Unknown80195D98(f32 *a0, UNUSED s32 a1, Mat4f *mtx) {
    f32 sp3C;
    f32 sp38;
    f32 temp[4]; // 28
    s32 i;       // 24
    s32 sp20;    // row?
    s32 sp1C;

    for (i = 0; i < 4; i++) {
        temp[i] = SQ(a0[i]);
    }
    for (i = 1; i < 4; i++) {
        if ((sp20 = i + 1) >= 4) {
            sp20 = 1;
        }
        if ((sp1C = sp20 + 1) >= 4) {
            sp1C = 1;
        }

        sp3C = 2.0 * a0[i] * a0[sp20]; //? 2.0f
        sp38 = 2.0 * a0[sp1C] * a0[0]; //? 2.0f

        (*mtx)[sp20][i] = sp3C - sp38;
        (*mtx)[i][sp20] = sp3C + sp38;
        (*mtx)[i][i] = temp[i] + temp[0] - temp[sp20] - temp[sp1C];
        (*mtx)[i][0] = 0.0f;
    }
    (*mtx)[0][0] = 1.0f;
    func_80195C78(mtx);
}

/* 2447A4 -> 2449C4 */
void func_80195FD4(Mat4f *mtx, struct GdVec3f *vec, f32 a, f32 b) {
    f32 spC;
    struct GdVec3f rev; // 0

    rev.z = vec->x;
    rev.y = vec->y;
    rev.x = vec->z;

    spC = 1.0 - b;

    (*mtx)[0][0] = spC * rev.z * rev.z + b;
    (*mtx)[0][1] = spC * rev.z * rev.y + a * rev.x;
    (*mtx)[0][2] = spC * rev.z * rev.x - a * rev.y;
    (*mtx)[0][3] = 0.0f;
    (*mtx)[1][0] = spC * rev.z * rev.y - a * rev.x;
    (*mtx)[1][1] = spC * rev.y * rev.y + b;
    (*mtx)[1][2] = spC * rev.y * rev.x + a * rev.z;
    (*mtx)[1][3] = 0.0f;
    (*mtx)[2][0] = spC * rev.z * rev.x + a * rev.y;
    (*mtx)[2][1] = spC * rev.y * rev.x - a * rev.z;
    (*mtx)[2][2] = spC * rev.x * rev.x + b;
    (*mtx)[2][3] = 0.0f;
    (*mtx)[3][0] = 0.0f;
    (*mtx)[3][1] = 0.0f;
    (*mtx)[3][2] = 0.0f;
    (*mtx)[3][3] = 1.0f;
}

/* 2449C4 -> 244A50 */
void func_801961F4(Mat4f *mtx, struct GdVec3f *vec, f32 ang) {
    f32 ycmp; // 1c
    f32 xcmp; // 18

    // probably is "(angle * pi / 180) / 2"
    ycmp = gd_sin_d(ang / (DEG_PER_RAD / 2.0));
    xcmp = gd_cos_d(ang / (DEG_PER_RAD / 2.0));

    func_80195FD4(mtx, vec, ycmp, xcmp);
}

/* 244A50 -> 244B30 */
void set_identity_mat4(Mat4f *mtx) {
    (*mtx)[0][0] = 1.0f;
    (*mtx)[0][1] = 0.0f;
    (*mtx)[0][2] = 0.0f;
    (*mtx)[0][3] = 0.0f;
    (*mtx)[1][0] = 0.0f;
    (*mtx)[1][1] = 1.0f;
    (*mtx)[1][2] = 0.0f;
    (*mtx)[1][3] = 0.0f;
    (*mtx)[2][0] = 0.0f;
    (*mtx)[2][1] = 0.0f;
    (*mtx)[2][2] = 1.0f;
    (*mtx)[2][3] = 0.0f;
    (*mtx)[3][0] = 0.0f;
    (*mtx)[3][1] = 0.0f;
    (*mtx)[3][2] = 0.0f;
    (*mtx)[3][3] = 1.0f;
}

/* 244B30 -> 244C00 */
void cpy_mat4(const Mat4f *src, Mat4f *dst) {
    (*dst)[0][0] = (*src)[0][0];
    (*dst)[0][1] = (*src)[0][1];
    (*dst)[0][2] = (*src)[0][2];
    (*dst)[0][3] = (*src)[0][3];
    (*dst)[1][0] = (*src)[1][0];
    (*dst)[1][1] = (*src)[1][1];
    (*dst)[1][2] = (*src)[1][2];
    (*dst)[1][3] = (*src)[1][3];
    (*dst)[2][0] = (*src)[2][0];
    (*dst)[2][1] = (*src)[2][1];
    (*dst)[2][2] = (*src)[2][2];
    (*dst)[2][3] = (*src)[2][3];
    (*dst)[3][0] = (*src)[3][0];
    (*dst)[3][1] = (*src)[3][1];
    (*dst)[3][2] = (*src)[3][2];
    (*dst)[3][3] = (*src)[3][3];
}

/* 244C00 -> 244D10 */
void func_80196430(struct GdVec3f *vec, const Mat4f *mtx) {
    struct GdVec3f dot;

    dot.x = (*mtx)[0][0] * vec->x + (*mtx)[1][0] * vec->y + (*mtx)[2][0] * vec->z;
    dot.y = (*mtx)[0][1] * vec->x + (*mtx)[1][1] * vec->y + (*mtx)[2][1] * vec->z;
    dot.z = (*mtx)[0][2] * vec->x + (*mtx)[1][2] * vec->y + (*mtx)[2][2] * vec->z;
    dot.x += (*mtx)[3][0];
    dot.y += (*mtx)[3][1];
    dot.z += (*mtx)[3][2];

    vec->x = dot.x;
    vec->y = dot.y;
    vec->z = dot.z;
}

/* 244D10 -> 244DE4 */
void func_80196540(struct GdVec3f *vec, const Mat4f *mtx) {
    struct GdVec3f dot;

    dot.x = (*mtx)[0][0] * vec->x + (*mtx)[1][0] * vec->y + (*mtx)[2][0] * vec->z;
    dot.y = (*mtx)[0][1] * vec->x + (*mtx)[1][1] * vec->y + (*mtx)[2][1] * vec->z;
    dot.z = (*mtx)[0][2] * vec->x + (*mtx)[1][2] * vec->y + (*mtx)[2][2] * vec->z;

    vec->x = dot.x;
    vec->y = dot.y;
    vec->z = dot.z;
}

#define MAT4_DOT_PROD(A, B, R, row, col)                                                               \
    {                                                                                                  \
        (R)[(row)][(col)] = (A)[(row)][0] * (B)[0][(col)];                                             \
        (R)[(row)][(col)] += (A)[(row)][1] * (B)[1][(col)];                                            \
        (R)[(row)][(col)] += (A)[(row)][2] * (B)[2][(col)];                                            \
        (R)[(row)][(col)] += (A)[(row)][3] * (B)[3][(col)];                                            \
    }

#define MAT4_MULTIPLY(A, B, R)                                                                         \
    {                                                                                                  \
        MAT4_DOT_PROD((A), (B), (R), 0, 0);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 0, 1);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 0, 2);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 0, 3);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 1, 0);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 1, 1);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 1, 2);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 1, 3);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 2, 0);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 2, 1);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 2, 2);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 2, 3);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 3, 0);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 3, 1);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 3, 2);                                                            \
        MAT4_DOT_PROD((A), (B), (R), 3, 3);                                                            \
    }

/* 244DE4 -> 24575C; orig name: func_80196614 */
void multiply_mat4(const Mat4f *mA, const Mat4f *mB, Mat4f *dst) {
    Mat4f res; // 18

    MAT4_MULTIPLY((*mA), (*mB), res);
    cpy_mat4(&res, dst);
}

#undef MAT4_MULTIPLY
#undef MAT4_DOT_PROD

/* 24575C -> 245778 */
void gd_print_vec(UNUSED const char *prefix, UNUSED const struct GdVec3f *vec) {
    UNUSED u8 pad[8];

    printf("%f,%f,%f\n", vec->x, vec->y, vec->z);
    printf("\n");
}

/* 245778 -> 245794 */
void gd_print_plane(UNUSED const char *prefix, UNUSED const struct GdPlaneF *p) {
    UNUSED u8 pad[8];

    printf("Min X = %f, Max X = %f \n", p->p0.x, p->p1.x);
    printf("Min Y = %f, Max Y = %f \n", p->p0.y, p->p1.y);
    printf("Min Z = %f, Max Z = %f \n", p->p0.z, p->p1.z);
    printf("\n");
}

/* 245794 -> 245838 */
void gd_print_mtx(UNUSED const char *prefix, const Mat4f *mtx) {
    s32 i; // 1c
    s32 j; // 18

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            gd_printf("%f ", (*mtx)[i][j]);
        }
        gd_printf("\n");
    }
}

/* 245838 -> 2458C0 */
void Unknown80197068(const char *prefix, const f32 *f) {
    s32 i; // 1c

    gd_printf(prefix);
    for (i = 0; i < 4; i++) {
        gd_printf("%f ", f[i]);
    }
    gd_printf("\n");
}

/* 2458C0 -> 245A48 */
void Unknown801970F0(Mat4f *dst, f32 x, f32 y, f32 z, s32 copy) {
    f32 sp74 = 100.0f;
    Mat4f sp34;
    f32 sp30;
    f32 sp2C;
    f32 mag; // 28
    f32 sp24;
    struct GdVec3f sp18;

    mag = gd_sqrt_f(SQ(x) + SQ(y) + SQ(z));

    if (mag == 0.0f) {
        if (copy) {
            set_identity_mat4(dst);
        }
        return;
    }

    sp24 = gd_sqrt_f(SQ(sp74) + SQ(mag));
    sp30 = sp74 / sp24;
    sp2C = mag / sp24;
    sp18.x = -y / mag;
    sp18.y = -x / mag;
    sp18.z = -z / mag;

    func_80195FD4(&sp34, &sp18, sp2C, sp30);
    if (!copy) {
        multiply_mat4(dst, &sp34, dst);
    } else {
        cpy_mat4(&sp34, dst);
    }
}
