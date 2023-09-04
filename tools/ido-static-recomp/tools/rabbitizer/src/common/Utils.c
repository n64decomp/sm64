/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "common/Utils.h"

#include <stdbool.h>
#include <string.h>

int32_t RabbitizerUtils_From2Complement(uint32_t number, int bits) {
    bool isNegative = number & (1ULL << (bits - 1));

    if (isNegative) {
        return -((~number + 1) & ((1ULL << bits) - 1));
    }

    return number;
}

size_t RabbitizerUtils_CharFill(char *dst, int count, char fillchar) {
    if (count <= 0) {
        return 0;
    }

    memset(dst, fillchar, count);

    return count;
}

size_t RabbitizerUtils_escapeString(char *dst, size_t dstSize, const char *src, size_t srcSize) {
    size_t srcPos = 0;
    size_t dstpos = 0;

    for (; srcPos < srcSize && dstpos < dstSize; srcPos++, src++) {
        // The cases of this switch are sorted by ASCII order
        switch (*src) {
            case '\a':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, 'a');
                break;

            case '\t':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, 't');
                break;

            case '\n':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, 'n');
                break;

            case '\f':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, 'f');
                break;

            case '\r':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, 'r');
                break;

            case '"':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '"');
                break;

            case '\\':
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, '\\');
                break;

            default:
                RABUTILS_BUFFER_WRITE_CHAR(dst, dstpos, *src);
                break;
        }
    }

    return dstpos;
}
