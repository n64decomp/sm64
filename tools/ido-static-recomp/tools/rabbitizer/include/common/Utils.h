/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_UTILS_H
#define RABBITIZER_UTILS_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif


#if !defined(__GNUC__) && !defined(__clang__)
#define __attribute__(x)
#endif

#if __STDC_VERSION__ >= 202000L
#define CONST [[gnu::const]]
#define DEPRECATED(reason) [[deprecated (reason)]]
#define FALLTHROUGH [[fallthrough]]
#define NODISCARD [[nodiscard]]
#define NORETURN [[noreturn]]
#define NON_NULL(...) [[gnu::nonnull (__VA_ARGS__)]]
#define PURE [[gnu::pure]]
#define RETURNS_NON_NULL [[gnu::returns_nonnull]]
#define UNUSED [[maybe_unused]]
#else
#define CONST __attribute__((const))
#define DEPRECATED(reason) __attribute__((deprecated (reason)))
#define FALLTHROUGH __attribute__((fallthrough))
#define NODISCARD __attribute__((warn_unused_result))
#define NORETURN _Noreturn
#define NON_NULL(...) __attribute__((nonnull (__VA_ARGS__)))
#define PURE __attribute__((pure))
#define RETURNS_NON_NULL __attribute__((returns_nonnull))
#define UNUSED __attribute__((unused))
#endif


#if defined(_MSC_VER)
#  define UNREACHABLE __assume(0)
#elif defined(__GNUC__) || defined(__clang__)
#  define UNREACHABLE __builtin_unreachable()
#else
#  define UNREACHABLE
#endif


#define ARRAY_COUNT(arr) (sizeof(arr) / sizeof((arr)[0]))

#define RAB_STRINGIFY(x) #x

#define MASK(v, w) ((v) & ((1 << (w)) - 1))

/*
 * the SHIFT macros take a value, a shift amount, and a width.
 *
 * For the left shift, the lower bits of the value are masked,
 * then shifted left.
 *
 * For the right shift, the value is shifted right, then the lower bits
 * are masked.
 *
 * (NOTE: SHIFTL(v, 0, 32) won't work, just use an assignment)
 *
 */
#define SHIFTL(v, s, w) (MASK((v), (w)) << (s))
#define SHIFTR(v, s, w) (MASK((v) >> (s), (w)))

#define BITREPACK(fullword, v, s, w) ((SHIFTR((fullword), (s)+(w), 32-((s)+(w))) << ((s)+(w))) | SHIFTL((v), (s), (w)) | MASK((fullword), (s)))
#define BITREPACK_RIGHT(fullword, v, s, w) (SHIFTL((v), (s), (w)) | MASK((fullword), (s)))


#define RABUTILS_BUFFER_ADVANCE(buffer, totalSize, expression) \
    do {                                                       \
        size_t __tempSize = expression;                        \
        (buffer) += __tempSize;                                \
        (totalSize) += __tempSize;                             \
    } while (0)

#define RABUTILS_BUFFER_WRITE_CHAR(buffer, totalSize, character) \
    do {                                                         \
        *(buffer) = (character);                                 \
        RABUTILS_BUFFER_ADVANCE(buffer, totalSize, 1);           \
    } while (0)

#define RABUTILS_BUFFER_SPRINTF(buffer, totalSize, format, ...) \
    do {                                                        \
        int _len = sprintf(buffer, format, __VA_ARGS__);        \
        assert(_len > 0);                                       \
        RABUTILS_BUFFER_ADVANCE(buffer, totalSize, _len);       \
    } while (0)

#define RABUTILS_BUFFER_CPY(buffer, totalSize, string)         \
    do {                                                       \
        size_t _tempSize = strlen(string);                     \
        memcpy(buffer, string, _tempSize);                     \
        RABUTILS_BUFFER_ADVANCE(buffer, totalSize, _tempSize); \
    } while (0)


CONST NODISCARD
int32_t RabbitizerUtils_From2Complement(uint32_t number, int bits);
NON_NULL(1)
size_t RabbitizerUtils_CharFill(char *dst, int count, char fillchar);
NON_NULL(1, 3)
size_t RabbitizerUtils_escapeString(char *dst, size_t dstSize, const char *src, size_t srcSize);


#ifdef __cplusplus
}
#endif

#endif
