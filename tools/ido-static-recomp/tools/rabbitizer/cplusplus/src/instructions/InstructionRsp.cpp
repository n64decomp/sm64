/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/InstructionRsp.hpp"

#include <stdexcept>

#include "instructions/RabbitizerInstructionRsp.h"

using namespace rabbitizer;

InstructionRsp::InstructionRsp(uint32_t word, uint32_t vram) : InstructionBase() {
    RabbitizerInstructionRsp_init(&this->instr, word, vram);
    RabbitizerInstructionRsp_processUniqueId(&this->instr);
}

InstructionRsp::~InstructionRsp() {
    RabbitizerInstructionRsp_destroy(&this->instr);
}

Registers::Rsp::Gpr InstructionRsp::GetRsp_rs() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rs)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'rs' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Gpr>(RAB_INSTR_GET_rs(&this->instr));
}
Registers::Rsp::Gpr InstructionRsp::GetRsp_rt() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rt)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'rt' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Gpr>(RAB_INSTR_GET_rt(&this->instr));
}
Registers::Rsp::Gpr InstructionRsp::GetRsp_rd() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_rd)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'rd' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Gpr>(RAB_INSTR_GET_rd(&this->instr));
}

Registers::Rsp::Cop0 InstructionRsp::GetRsp_cop0d() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_cop0d)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'cop0d' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Cop0>(RAB_INSTR_GET_cop0d(&this->instr));
}

Registers::Rsp::Cop2 InstructionRsp::GetRsp_cop2t() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_cop2t)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'cop2t' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Cop2>(RAB_INSTR_RSP_GET_cop2t(&this->instr));
}

Registers::Rsp::Cop2Control InstructionRsp::GetRsp_cop2cd() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_cop2t)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'cop2cd' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Cop2Control>(RAB_INSTR_RSP_GET_cop2cd(&this->instr));
}

Registers::Rsp::Vector InstructionRsp::GetRsp_vs() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_vs)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vs' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Vector>(RAB_INSTR_RSP_GET_vs(&this->instr));
}
Registers::Rsp::Vector InstructionRsp::GetRsp_vt() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_vt)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vt' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Vector>(RAB_INSTR_RSP_GET_vt(&this->instr));
}
Registers::Rsp::Vector InstructionRsp::GetRsp_vd() const {
#ifdef RAB_SANITY_CHECKS
    if (!hasOperandAlias(OperandType::rsp_vd)) {
        // TODO: make a rabbitizer exception class
        throw std::runtime_error("Instruction '" + getOpcodeName() + "' does not have 'vd' operand.");
    }
#endif

    return static_cast<Registers::Rsp::Vector>(RAB_INSTR_RSP_GET_vd(&this->instr));
}

uint8_t InstructionRsp::GetRsp_elementhigh() const {
    return RAB_INSTR_RSP_GET_elementhigh(&this->instr);
}
uint8_t InstructionRsp::GetRsp_elementlow() const {
    return RAB_INSTR_RSP_GET_elementlow(&this->instr);
}

uint8_t InstructionRsp::GetRsp_index() const {
    return RAB_INSTR_RSP_GET_index(&this->instr);
}
uint8_t InstructionRsp::GetRsp_de() const {
    return RAB_INSTR_RSP_GET_de(&this->instr);
}
