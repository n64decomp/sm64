#include "libultra_internal.h"
#include <string.h>
void *memcpy(void *dst, const void *src, size_t size) {
    u8 *_dst = dst;
    const u8 *_src = src;
    while (size > 0) {
        *_dst++ = *_src++;
        size--;
    }
    return dst;
}
size_t strlen(const u8 *str) {
    const u8 *ptr = str;
    while (*ptr)
        ptr++;
    return ptr - str;
}

const u8 *strchr(const u8 *str, s32 ch) {
    u8 c = ch;
    while (*str != c) {
        if (*str == 0)
            return NULL;
        str++;
    }
    return str;
}
