#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#define NON_MATCHING 1
#define AVOID_UB 1
#define _LANGUAGE_C 1

#include "types.h"
#include "engine/math_util.h"

Vec3f gVec3fZero = { 0.0f, 0.0f, 0.0f };

struct Surface;
f32 find_floor(f32 xPos, f32 yPos, f32 zPos, struct Surface **pfloor) {
    (void)xPos;
    (void)yPos;
    (void)zPos;
    if (pfloor != NULL) {
        *pfloor = NULL;
    }
    return 0.0f;
}

void guMtxF2L(Mat4 src, Mtx *dest) {
    (void)src;
    (void)dest;
}

#include "engine/math_util.c"

int is_close(f32 a, f32 b, f32 epsilon) {
    return fabsf(a - b) < epsilon;
}

void test_normalize_axis_x(void) {
    Vec3f v = { 5.0f, 0.0f, 0.0f };
    vec3f_normalize(v);
    assert(is_close(v[0], 1.0f, 1e-5f));
    assert(is_close(v[1], 0.0f, 1e-5f));
    assert(is_close(v[2], 0.0f, 1e-5f));
    printf("  test_normalize_axis_x passed!\n");
}

void test_normalize_axis_y(void) {
    Vec3f v = { 0.0f, -12.3f, 0.0f };
    vec3f_normalize(v);
    assert(is_close(v[0], 0.0f, 1e-5f));
    assert(is_close(v[1], -1.0f, 1e-5f));
    assert(is_close(v[2], 0.0f, 1e-5f));
    printf("  test_normalize_axis_y passed!\n");
}

void test_normalize_axis_z(void) {
    Vec3f v = { 0.0f, 0.0f, 0.1f };
    vec3f_normalize(v);
    assert(is_close(v[0], 0.0f, 1e-5f));
    assert(is_close(v[1], 0.0f, 1e-5f));
    assert(is_close(v[2], 1.0f, 1e-5f));
    printf("  test_normalize_axis_z passed!\n");
}

void test_normalize_3d_vector(void) {
    Vec3f v = { 1.0f, 2.0f, 2.0f };
    vec3f_normalize(v);
    assert(is_close(v[0], 1.0f / 3.0f, 1e-5f));
    assert(is_close(v[1], 2.0f / 3.0f, 1e-5f));
    assert(is_close(v[2], 2.0f / 3.0f, 1e-5f));
    printf("  test_normalize_3d_vector passed!\n");
}

void test_normalize_zero_vector(void) {
    Vec3f v = { 0.0f, 0.0f, 0.0f };
    vec3f_normalize(v);
    assert(isnan(v[0]));
    assert(isnan(v[1]));
    assert(isnan(v[2]));
    printf("  test_normalize_zero_vector passed!\n");
}

void fill_dummy_matrix(Mat4 m) {
    int i, j;
    float val = 99.0f;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            m[i][j] = val;
            val += 1.0f;
        }
    }
}

void verify_translation_matrix(Mat4 dest, Vec3f b) {
    int i, j;

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (i == j) {
                if (dest[i][j] != 1.0f) {
                    fprintf(stderr, "Error: Expected diagonal dest[%d][%d] to be 1.0, got %f\n", i, j, dest[i][j]);
                    exit(1);
                }
            } else {
                if (dest[i][j] != 0.0f) {
                    fprintf(stderr, "Error: Expected non-diagonal dest[%d][%d] to be 0.0, got %f\n", i, j, dest[i][j]);
                    exit(1);
                }
            }
        }
    }

    for (i = 0; i < 3; i++) {
        if (dest[i][3] != 0.0f) {
            fprintf(stderr, "Error: Expected dest[%d][3] to be 0.0, got %f\n", i, dest[i][3]);
            exit(1);
        }
    }

    if (isnan(b[0])) {
        if (!isnan(dest[3][0])) {
            fprintf(stderr, "Error: Expected dest[3][0] to be NaN, got %f\n", dest[3][0]);
            exit(1);
        }
    } else {
        if (dest[3][0] != b[0]) {
            fprintf(stderr, "Error: Expected dest[3][0] to be %f, got %f\n", b[0], dest[3][0]);
            exit(1);
        }
    }

    if (isnan(b[1])) {
        if (!isnan(dest[3][1])) {
            fprintf(stderr, "Error: Expected dest[3][1] to be NaN, got %f\n", dest[3][1]);
            exit(1);
        }
    } else {
        if (dest[3][1] != b[1]) {
            fprintf(stderr, "Error: Expected dest[3][1] to be %f, got %f\n", b[1], dest[3][1]);
            exit(1);
        }
    }

    if (isnan(b[2])) {
        if (!isnan(dest[3][2])) {
            fprintf(stderr, "Error: Expected dest[3][2] to be NaN, got %f\n", dest[3][2]);
            exit(1);
        }
    } else {
        if (dest[3][2] != b[2]) {
            fprintf(stderr, "Error: Expected dest[3][2] to be %f, got %f\n", b[2], dest[3][2]);
            exit(1);
        }
    }

    if (dest[3][3] != 1.0f) {
        fprintf(stderr, "Error: Expected dest[3][3] to be 1.0, got %f\n", dest[3][3]);
        exit(1);
    }
}

void test_happy_path(void) {
    printf("  Running test_happy_path...\n");
    Mat4 dest;
    Vec3f b = { 1.5f, -2.0f, 3.75f };

    fill_dummy_matrix(dest);
    mtxf_translate(dest, b);
    verify_translation_matrix(dest, b);
    printf("  test_happy_path passed!\n");
}

void test_zero_translation(void) {
    printf("  Running test_zero_translation...\n");
    Mat4 dest;
    Vec3f b = { 0.0f, 0.0f, 0.0f };

    fill_dummy_matrix(dest);
    mtxf_translate(dest, b);
    verify_translation_matrix(dest, b);
    printf("  test_zero_translation passed!\n");
}

void test_large_translation(void) {
    printf("  Running test_large_translation...\n");
    Mat4 dest;
    Vec3f b = { 1.2345e5f, -9.8765e5f, 5.5555e6f };

    fill_dummy_matrix(dest);
    mtxf_translate(dest, b);
    verify_translation_matrix(dest, b);
    printf("  test_large_translation passed!\n");
}

void test_nan_inf_translation(void) {
    printf("  Running test_nan_inf_translation...\n");
    Mat4 dest;
    Vec3f b = { (float)NAN, (float)INFINITY, (float)-INFINITY };

    fill_dummy_matrix(dest);
    mtxf_translate(dest, b);
    verify_translation_matrix(dest, b);
    printf("  test_nan_inf_translation passed!\n");
}

int main(void) {
    printf("=== Starting Math Utility Unit Tests ===\n");
    test_normalize_axis_x();
    test_normalize_axis_y();
    test_normalize_axis_z();
    test_normalize_3d_vector();
    test_normalize_zero_vector();
    test_happy_path();
    test_zero_translation();
    test_large_translation();
    test_nan_inf_translation();
    printf("=== All Math Utility Unit Tests Passed! ===\n");
    return 0;
}
