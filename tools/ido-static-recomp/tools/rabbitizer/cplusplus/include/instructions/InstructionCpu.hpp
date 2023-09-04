/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRUCTION_CPU_HPP
#define RABBITIZER_INSTRUCTION_CPU_HPP
#pragma once

#include "InstructionBase.hpp"


namespace rabbitizer {
    class InstructionCpu : public InstructionBase {
    public:
        InstructionCpu(uint32_t word, uint32_t vram);
        virtual ~InstructionCpu();
    };
};


#endif
