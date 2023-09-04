#include "libultra_internal.h"

#if !defined(VERSION_CN) || !defined(TARGET_N64)

void guNormalize(f32 *x, f32 *y, f32 *z) {
    f32 tmp = 1.0f / sqrtf(*x * *x + *y * *y + *z * *z);
    *x = *x * tmp;
    *y = *y * tmp;
    *z = *z * tmp;
}

#endif
