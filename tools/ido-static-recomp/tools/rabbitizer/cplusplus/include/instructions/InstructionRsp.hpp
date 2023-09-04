/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRUCTION_RSP_HPP
#define RABBITIZER_INSTRUCTION_RSP_HPP
#pragma once

#include "InstructionBase.hpp"


namespace rabbitizer {
    class InstructionRsp : public InstructionBase {
    public:
        InstructionRsp(uint32_t word, uint32_t vram);
        virtual ~InstructionRsp();

        Registers::Rsp::Gpr GetRsp_rs() const;
        Registers::Rsp::Gpr GetRsp_rt() const;
        Registers::Rsp::Gpr GetRsp_rd() const;

        Registers::Rsp::Cop0 GetRsp_cop0d() const;

        Registers::Rsp::Cop2 GetRsp_cop2t() const;

        Registers::Rsp::Cop2Control GetRsp_cop2cd() const;

        Registers::Rsp::Vector GetRsp_vs() const;
        Registers::Rsp::Vector GetRsp_vt() const;
        Registers::Rsp::Vector GetRsp_vd() const;

        uint8_t GetRsp_elementhigh() const;
        uint8_t GetRsp_elementlow() const;

        uint8_t GetRsp_index() const;
        uint8_t GetRsp_de() const;
    };
};


#endif
