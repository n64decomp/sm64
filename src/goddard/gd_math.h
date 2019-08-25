#ifndef GD_MATH_H
#define GD_MATH_H

#include <ultra64.h>
#include "gd_types.h"

extern void func_80193B68(Mat4f *, f32, f32, f32, f32, f32, f32, f32, f32, f32);
extern void func_8019415C(Mat4f *, struct GdVec3f *);
extern void func_80194220(Mat4f *, struct GdVec3f *);
extern void func_801942E4(Mat4f *, struct GdVec3f *);
extern void func_80194358(Mat4f *, struct GdVec3f *, f32);
extern f32 func_80194728(f32, f32);     /* min(f1, +/-f2)? */
extern void limit_vec3f(struct GdVec3f *, f32);
extern void func_80194880(f32, f32 *, f32 *);
extern void absrot_mat4(Mat4f *, s32, f32);
extern f32 magnitude_vec3f(struct GdVec3f *);
extern s32 into_unit_vec3f(struct GdVec3f *);
extern void cross_product_vec3f(struct GdVec3f *a, struct GdVec3f *b, struct GdVec3f *dst);
extern f32 dot_product_vec3f(struct GdVec3f *, struct GdVec3f *);
extern void inverse_mat4(Mat4f *, Mat4f *);
extern void func_801961F4(Mat4f *, struct GdVec3f *, f32);
extern void set_identity_mat4(Mat4f *);
extern void cpy_mat4(const Mat4f *, Mat4f *);
extern void func_80196430(struct GdVec3f *, const Mat4f *);
extern void func_80196540(struct GdVec3f *, const Mat4f *);
extern void multiply_mat4(const Mat4f *, const Mat4f *, Mat4f *);
extern void gd_print_vec(const char *, const struct GdVec3f *);
extern void gd_print_plane(const char *, const struct GdPlaneF *);
extern void gd_print_mtx(const char *, const Mat4f *);

#endif /* GD_MATH_H */
