/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstrSuffix.h"

#include <assert.h>

#include "common/Utils.h"
#include "instructions/RabbitizerInstruction.h"
#include "instructions/RabbitizerInstructionRsp.h"
#include "instructions/RabbitizerInstructionR5900.h"

typedef size_t (*InstrSuffixCallback)(const RabbitizerInstruction *self, char *dst);

size_t RabbitizerInstrSuffix_None(UNUSED const RabbitizerInstruction *self, UNUSED char *dst) {
    return 0;
}

size_t RabbitizerInstrSuffixR5900_xyzw(const RabbitizerInstruction *self, char *dst) {
    size_t totalSize = 0;

    if (RAB_INSTR_R5900_GET_xyzw_x(self) || RAB_INSTR_R5900_GET_xyzw_y(self) || RAB_INSTR_R5900_GET_xyzw_z(self) || RAB_INSTR_R5900_GET_xyzw_w(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '.');
    }

    if (RAB_INSTR_R5900_GET_xyzw_x(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'x');
    }
    if (RAB_INSTR_R5900_GET_xyzw_y(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'y');
    }
    if (RAB_INSTR_R5900_GET_xyzw_z(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'z');
    }
    if (RAB_INSTR_R5900_GET_xyzw_w(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'w');
    }

    return totalSize;
}
const InstrSuffixCallback instrSuffixCallbacks[] = {
    [RABINSTRSUFFIX_NONE] = RabbitizerInstrSuffix_None,

    [RABINSTRSUFFIX_R5900_xyzw] = RabbitizerInstrSuffixR5900_xyzw,
};

size_t RabbitizerInstrSuffix_getSizeForBuffer(UNUSED const RabbitizerInstruction *self, UNUSED RabbitizerInstrSuffix instrSuffix) {
    // Just hardcode the size of the bigger possible suffix, faster than actually computing it.
    return 5;
}

size_t RabbitizerInstrSuffix_processSuffix(const RabbitizerInstruction *self, char *dst, RabbitizerInstrSuffix instrSuffix) {
    InstrSuffixCallback callback;

    assert(instrSuffix >= RABINSTRSUFFIX_NONE);
    assert(instrSuffix < RABINSTRSUFFIX_MAX);

    callback = instrSuffixCallbacks[instrSuffix];
    assert(callback != NULL);

    return callback(self, dst);
}
