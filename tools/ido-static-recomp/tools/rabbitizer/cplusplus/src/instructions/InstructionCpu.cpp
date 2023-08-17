/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/InstructionCpu.hpp"

using namespace rabbitizer;

InstructionCpu::InstructionCpu(uint32_t word, uint32_t vram) : InstructionBase() {
    RabbitizerInstruction_init(&this->instr, word, vram);
    RabbitizerInstruction_processUniqueId(&this->instr);
}

InstructionCpu::~InstructionCpu() {
    RabbitizerInstruction_destroy(&this->instr);
}
