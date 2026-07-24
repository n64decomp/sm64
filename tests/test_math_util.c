#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#define NON_MATCHING 1
#define AVOID_UB 1
#define _LANGUAGE_C 1

// Define _OS_LIBC_H to prevent include/PR/os_libc.h from re-declaring sprintf
#define _OS_LIBC_H_

#include "types.h"
#include "engine/math_util.h"

Vec3f gVec3fZero = { 0.0f, 0.0f, 0.0f };
Vec3f gVec3fOne = { 1.0f, 1.0f, 1.0f };

struct Surface;
f32 find_floor(f32 xPos, f32 yPos, f32 zPos, struct Surface **pfloor) {
    (void)xPos;
    (void)yPos;
    (void)zPos;
    if (pfloor != NULL) {
        *pfloor = NULL;
    }
    return yPos;
}

void guMtxF2L(Mat4 src, Mtx *dest) {
    (void)src;
    (void)dest;
}

#include "engine/math_util.c"

static int g_tests_run = 0;
static int g_tests_failed = 0;

#define ASSERT_TRUE(expr, msg) \
    do { \
        if (!(expr)) { \
            fprintf(stderr, "FAIL: %s:%d: %s\n", __FILE__, __LINE__, msg); \
            g_tests_failed++; \
            return; \
        } \
    } while (0)

#define ASSERT_FLOAT_EQ(val1, val2, tol, msg) \
    do { \
        if (fabsf((val1) - (val2)) > (tol)) { \
            fprintf(stderr, "FAIL: %s:%d: %s (expected %f, got %f)\n", __FILE__, __LINE__, msg, (double)(val2), (double)(val1)); \
            g_tests_failed++; \
            return; \
        } \
    } while (0)

void test_vec3f_copy(void) {
    g_tests_run++;
    Vec3f src = { 1.5f, -2.5f, 3.0f };
    Vec3f dest = { 0.0f, 0.0f, 0.0f };
    vec3f_copy(dest, src);
    ASSERT_FLOAT_EQ(dest[0], 1.5f, 1e-5f, "vec3f_copy: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], -2.5f, 1e-5f, "vec3f_copy: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], 3.0f, 1e-5f, "vec3f_copy: Z mismatch");
}

void test_vec3f_set(void) {
    g_tests_run++;
    Vec3f dest = { 0.0f, 0.0f, 0.0f };
    vec3f_set(dest, 10.0f, -5.5f, 0.1f);
    ASSERT_FLOAT_EQ(dest[0], 10.0f, 1e-5f, "vec3f_set: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], -5.5f, 1e-5f, "vec3f_set: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], 0.1f, 1e-5f, "vec3f_set: Z mismatch");
}

void test_vec3f_add(void) {
    g_tests_run++;
    Vec3f dest = { 1.0f, 2.0f, 3.0f };
    Vec3f a = { 0.5f, -1.0f, 2.5f };
    vec3f_add(dest, a);
    ASSERT_FLOAT_EQ(dest[0], 1.5f, 1e-5f, "vec3f_add: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], 1.0f, 1e-5f, "vec3f_add: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], 5.5f, 1e-5f, "vec3f_add: Z mismatch");
}

void test_vec3f_sum(void) {
    g_tests_run++;
    Vec3f dest = { 0.0f, 0.0f, 0.0f };
    Vec3f a = { 1.0f, -2.0f, 3.0f };
    Vec3f b = { 4.0f, 5.0f, -6.0f };
    vec3f_sum(dest, a, b);
    ASSERT_FLOAT_EQ(dest[0], 5.0f, 1e-5f, "vec3f_sum: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], 3.0f, 1e-5f, "vec3f_sum: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], -3.0f, 1e-5f, "vec3f_sum: Z mismatch");
}

void test_vec3s_copy(void) {
    g_tests_run++;
    Vec3s src = { 10, -20, 30 };
    Vec3s dest = { 0, 0, 0 };
    vec3s_copy(dest, src);
    ASSERT_TRUE(dest[0] == 10, "vec3s_copy: X mismatch");
    ASSERT_TRUE(dest[1] == -20, "vec3s_copy: Y mismatch");
    ASSERT_TRUE(dest[2] == 30, "vec3s_copy: Z mismatch");
}

void test_vec3s_set(void) {
    g_tests_run++;
    Vec3s dest = { 0, 0, 0 };
    vec3s_set(dest, 4, -5, 6);
    ASSERT_TRUE(dest[0] == 4, "vec3s_set: X mismatch");
    ASSERT_TRUE(dest[1] == -5, "vec3s_set: Y mismatch");
    ASSERT_TRUE(dest[2] == 6, "vec3s_set: Z mismatch");
}

void test_vec3s_add(void) {
    g_tests_run++;
    Vec3s dest = { 1, 2, 3 };
    Vec3s a = { 10, -5, 20 };
    vec3s_add(dest, a);
    ASSERT_TRUE(dest[0] == 11, "vec3s_add: X mismatch");
    ASSERT_TRUE(dest[1] == -3, "vec3s_add: Y mismatch");
    ASSERT_TRUE(dest[2] == 23, "vec3s_add: Z mismatch");
}

void test_vec3s_sum(void) {
    g_tests_run++;
    Vec3s dest = { 0, 0, 0 };
    Vec3s a = { 1, 2, 3 };
    Vec3s b = { 10, 20, 30 };
    vec3s_sum(dest, a, b);
    ASSERT_TRUE(dest[0] == 11, "vec3s_sum: X mismatch");
    ASSERT_TRUE(dest[1] == 22, "vec3s_sum: Y mismatch");
    ASSERT_TRUE(dest[2] == 33, "vec3s_sum: Z mismatch");
}

void test_vec3s_sub(void) {
    g_tests_run++;
    Vec3s dest = { 10, 20, 30 };
    Vec3s a = { 1, 2, 3 };
    vec3s_sub(dest, a);
    ASSERT_TRUE(dest[0] == 9, "vec3s_sub: X mismatch");
    ASSERT_TRUE(dest[1] == 18, "vec3s_sub: Y mismatch");
    ASSERT_TRUE(dest[2] == 27, "vec3s_sub: Z mismatch");
}

void test_vec3s_to_vec3f(void) {
    g_tests_run++;
    Vec3f dest = { 0.0f, 0.0f, 0.0f };
    Vec3s a = { -10, 20, -30 };
    vec3s_to_vec3f(dest, a);
    ASSERT_FLOAT_EQ(dest[0], -10.0f, 1e-5f, "vec3s_to_vec3f: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], 20.0f, 1e-5f, "vec3s_to_vec3f: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], -30.0f, 1e-5f, "vec3s_to_vec3f: Z mismatch");
}

void test_vec3f_to_vec3s(void) {
    g_tests_run++;
    Vec3s dest = { 0, 0, 0 };
    Vec3f a = { 1.4f, 2.6f, -3.5f };
    vec3f_to_vec3s(dest, a);
    ASSERT_TRUE(dest[0] == 1, "vec3f_to_vec3s: X mismatch");
    ASSERT_TRUE(dest[1] == 3, "vec3f_to_vec3s: Y mismatch");
    ASSERT_TRUE(dest[2] == -4, "vec3f_to_vec3s: Z mismatch");
}

void test_vec3f_cross(void) {
    g_tests_run++;
    Vec3f dest = { 0.0f, 0.0f, 0.0f };
    Vec3f a = { 1.0f, 0.0f, 0.0f };
    Vec3f b = { 0.0f, 1.0f, 0.0f };
    vec3f_cross(dest, a, b);
    ASSERT_FLOAT_EQ(dest[0], 0.0f, 1e-5f, "vec3f_cross: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], 0.0f, 1e-5f, "vec3f_cross: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], 1.0f, 1e-5f, "vec3f_cross: Z mismatch");
}

void test_vec3f_normalize(void) {
    g_tests_run++;
    Vec3f dest = { 3.0f, 0.0f, 4.0f };
    vec3f_normalize(dest);
    ASSERT_FLOAT_EQ(dest[0], 0.6f, 1e-5f, "vec3f_normalize: X mismatch");
    ASSERT_FLOAT_EQ(dest[1], 0.0f, 1e-5f, "vec3f_normalize: Y mismatch");
    ASSERT_FLOAT_EQ(dest[2], 0.8f, 1e-5f, "vec3f_normalize: Z mismatch");
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

void test_mtxf_translate(void) {
    g_tests_run++;
    Mat4 dest;
    Vec3f b = { 1.5f, -2.0f, 3.75f };

    fill_dummy_matrix(dest);
    mtxf_translate(dest, b);
    verify_translation_matrix(dest, b);
}

int main(void) {
    printf("Running math utility tests...\n");

    test_vec3f_copy();
    test_vec3f_set();
    test_vec3f_add();
    test_vec3f_sum();
    test_vec3s_copy();
    test_vec3s_set();
    test_vec3s_add();
    test_vec3s_sum();
    test_vec3s_sub();
    test_vec3s_to_vec3f();
    test_vec3f_to_vec3s();
    test_vec3f_cross();
    test_vec3f_normalize();
    test_mtxf_translate();

    printf("Tests run: %d, Tests failed: %d\n", g_tests_run, g_tests_failed);

    if (g_tests_failed > 0) {
        printf("SOME TESTS FAILED!\n");
        return 1;
    }

    printf("ALL TESTS PASSED SUCCESSFULLY!\n");
    return 0;
}
