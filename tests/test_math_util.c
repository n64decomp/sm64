#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

// Include necessary headers first or provide definitions so we can mock/stub
#define NON_MATCHING 1
#define AVOID_UB 1
#define _LANGUAGE_C 1

// Stub functions and variables referenced in math_util.c but not defined there
#include "types.h"

Vec3f gVec3fZero = { 0.0f, 0.0f, 0.0f };

struct Surface;
f32 find_floor(f32 xPos, f32 yPos, f32 zPos, struct Surface **pfloor) {
    (void)xPos;
    (void)yPos;
    (void)zPos;
    if (pfloor) *pfloor = NULL;
    return 0.0f;
}

void guMtxF2L(float src[4][4], Mtx *dest) {
    (void)src;
    (void)dest;
}

// Now include math_util.c to get vec3f_normalize
#include "engine/math_util.c"

// Helper to check if two floats are close enough
int is_close(f32 a, f32 b, f32 epsilon) {
    return fabsf(a - b) < epsilon;
}

void test_normalize_axis_x(void) {
    Vec3f v = { 5.0f, 0.0f, 0.0f };
    vec3f_normalize(v);
    assert(is_close(v[0], 1.0f, 1e-5f));
    assert(is_close(v[1], 0.0f, 1e-5f));
    assert(is_close(v[2], 0.0f, 1e-5f));
    printf("test_normalize_axis_x passed!\n");
}

void test_normalize_axis_y(void) {
    Vec3f v = { 0.0f, -12.3f, 0.0f };
    vec3f_normalize(v);
    assert(is_close(v[0], 0.0f, 1e-5f));
    assert(is_close(v[1], -1.0f, 1e-5f));
    assert(is_close(v[2], 0.0f, 1e-5f));
    printf("test_normalize_axis_y passed!\n");
}

void test_normalize_axis_z(void) {
    Vec3f v = { 0.0f, 0.0f, 0.1f };
    vec3f_normalize(v);
    assert(is_close(v[0], 0.0f, 1e-5f));
    assert(is_close(v[1], 0.0f, 1e-5f));
    assert(is_close(v[2], 1.0f, 1e-5f));
    printf("test_normalize_axis_z passed!\n");
}

void test_normalize_3d_vector(void) {
    Vec3f v = { 1.0f, 2.0f, 2.0f }; // Length is sqrt(1+4+4) = 3
    vec3f_normalize(v);
    assert(is_close(v[0], 1.0f / 3.0f, 1e-5f));
    assert(is_close(v[1], 2.0f / 3.0f, 1e-5f));
    assert(is_close(v[2], 2.0f / 3.0f, 1e-5f));
    printf("test_normalize_3d_vector passed!\n");
}

void test_normalize_zero_vector(void) {
    Vec3f v = { 0.0f, 0.0f, 0.0f };
    vec3f_normalize(v);
    // Since we divide by zero, components should be Inf or NaN depending on behavior
    // 1.0 / 0.0 is Inf, so we multiply 0.0 * Inf which is NaN.
    assert(isnan(v[0]));
    assert(isnan(v[1]));
    assert(isnan(v[2]));
    printf("test_normalize_zero_vector passed!\n");
}

int main(void) {
    printf("Running vec3f_normalize tests...\n");
    test_normalize_axis_x();
    test_normalize_axis_y();
    test_normalize_axis_z();
    test_normalize_3d_vector();
    test_normalize_zero_vector();
    printf("All tests passed successfully!\n");
    return 0;
}
