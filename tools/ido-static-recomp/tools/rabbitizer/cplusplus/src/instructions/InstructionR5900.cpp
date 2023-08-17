/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/InstructionR5900.hpp"

#include <stdexcept>

#include "instructions/RabbitizerInstructionR5900.h"

using namespace rabbitizer;

InstructionR5900::InstructionR5900(uint32_t word, uint32_t vram) : InstructionBase() {
    RabbitizerInstructionR5900_init(&this->instr, word, vram);
    RabbitizerInstructionR5900_processUniqueId(&this->instr);
}

InstructionR5900::~InstructionR5900() {
    RabbitizerInstructionR5900_destroy(&this->instr);
}

Registers::R5900::VF InstructionR5900::GetR5900_vfs() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rs)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vfs' operand.");
    }
#endif

    return static_cast<Registers::R5900::VF>(RAB_INSTR_R5900_GET_vfs(&this->instr));
}

Registers::R5900::VF InstructionR5900::GetR5900_vft() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rt)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vft' operand.");
    }
#endif

    return static_cast<Registers::R5900::VF>(RAB_INSTR_R5900_GET_vft(&this->instr));
}

Registers::R5900::VF InstructionR5900::GetR5900_vfd() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rd)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vfd' operand.");
    }
#endif

    return static_cast<Registers::R5900::VF>(RAB_INSTR_R5900_GET_vfd(&this->instr));
}

Registers::R5900::VI InstructionR5900::GetR5900_vis() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rs)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vis' operand.");
    }
#endif

    return static_cast<Registers::R5900::VI>(RAB_INSTR_R5900_GET_vis(&this->instr));
}

Registers::R5900::VI InstructionR5900::GetR5900_vit() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rt)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vit' operand.");
    }
#endif

    return static_cast<Registers::R5900::VI>(RAB_INSTR_R5900_GET_vit(&this->instr));
}

Registers::R5900::VI InstructionR5900::GetR5900_vid() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rd)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vid' operand.");
    }
#endif

    return static_cast<Registers::R5900::VI>(RAB_INSTR_R5900_GET_vid(&this->instr));
}

uint8_t InstructionR5900::GetR5900_mmi_function() const {
    return RAB_INSTR_R5900_GET_mmi_function(&this->instr);
}
uint8_t InstructionR5900::GetR5900_fhi_flo() const {
    return RAB_INSTR_R5900_GET_fhi_flo(&this->instr);
}

uint8_t InstructionR5900::GetR5900_xyzw_x() const {
    return RAB_INSTR_R5900_GET_xyzw_x(&this->instr);
}
uint8_t InstructionR5900::GetR5900_xyzw_y() const {
    return RAB_INSTR_R5900_GET_xyzw_y(&this->instr);
}
uint8_t InstructionR5900::GetR5900_xyzw_z() const {
    return RAB_INSTR_R5900_GET_xyzw_z(&this->instr);
}
uint8_t InstructionR5900::GetR5900_xyzw_w() const {
    return RAB_INSTR_R5900_GET_xyzw_w(&this->instr);
}
uint8_t InstructionR5900::GetR5900_n() const {
    return RAB_INSTR_R5900_GET_n(&this->instr);
}
uint8_t InstructionR5900::GetR5900_l() const {
    return RAB_INSTR_R5900_GET_l(&this->instr);
}
uint8_t InstructionR5900::GetR5900_m() const {
    return RAB_INSTR_R5900_GET_m(&this->instr);
}

uint8_t InstructionR5900::GetR5900_imm5() const {
    return RAB_INSTR_R5900_GET_imm5(&this->instr);
}
