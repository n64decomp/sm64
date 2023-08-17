/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRSUFFIX_H
#define RABBITIZER_INSTRSUFFIX_H
#pragma once

#include "common/Utils.h"

#ifdef __cplusplus
extern "C" {
#endif


struct RabbitizerInstruction;

typedef enum RabbitizerInstrSuffix {
    RABINSTRSUFFIX_NONE,

    RABINSTRSUFFIX_R5900_xyzw,

    RABINSTRSUFFIX_MAX
} RabbitizerInstrSuffix;

CONST NODISCARD NON_NULL(1)
size_t RabbitizerInstrSuffix_getSizeForBuffer(const struct RabbitizerInstruction *self, RabbitizerInstrSuffix instrSuffix);

CONST NODISCARD NON_NULL(1, 2)
size_t RabbitizerInstrSuffix_processSuffix(const struct RabbitizerInstruction *self, char *dst, RabbitizerInstrSuffix instrSuffix);


#ifdef __cplusplus
}
#endif

#endif
