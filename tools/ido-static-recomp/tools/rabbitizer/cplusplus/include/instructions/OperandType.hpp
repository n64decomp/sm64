/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_OPERAND_TYPE_HPP
#define RABBITIZER_OPERAND_TYPE_HPP
#pragma once


namespace rabbitizer {
    #define RAB_DEF_OPERAND(prefix, operand) \
        prefix##_##operand,

    enum class OperandType {
        RAB_DEF_OPERAND(ALL, INVALID)

    #include "instructions/operands/RabbitizerOperandType_cpu.inc"
    #include "instructions/operands/RabbitizerOperandType_rsp.inc"
    #include "instructions/operands/RabbitizerOperandType_r5900.inc"

        RAB_DEF_OPERAND(ALL, MAX)
    };

    #undef RAB_DEF_OPERAND
};


#endif
