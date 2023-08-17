/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_OPERAND_TYPE_H
#define RABBITIZER_OPERAND_TYPE_H
#pragma once

#ifdef __cplusplus
extern "C" {
#endif


#define RAB_DEF_OPERAND(prefix, operand) \
    RAB_OPERAND_##prefix##_##operand,

typedef enum RabbitizerOperandType {
    RAB_DEF_OPERAND(ALL, INVALID)

#include "operands/RabbitizerOperandType_cpu.inc"
#include "operands/RabbitizerOperandType_rsp.inc"
#include "operands/RabbitizerOperandType_r5900.inc"

    RAB_DEF_OPERAND(ALL, MAX)
} RabbitizerOperandType;

#undef RAB_DEF_OPERAND


#ifdef __cplusplus
}
#endif

#endif
