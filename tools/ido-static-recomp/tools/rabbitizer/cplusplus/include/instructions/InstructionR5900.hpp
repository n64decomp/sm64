/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRUCTION_R5900_HPP
#define RABBITIZER_INSTRUCTION_R5900_HPP
#pragma once

#include "InstructionBase.hpp"


namespace rabbitizer {
    class InstructionR5900 : public InstructionBase {
    public:
        InstructionR5900(uint32_t word, uint32_t vram);
        virtual ~InstructionR5900();

        Registers::R5900::VF GetR5900_vfs() const;
        Registers::R5900::VF GetR5900_vft() const;
        Registers::R5900::VF GetR5900_vfd() const;

        Registers::R5900::VI GetR5900_vis() const;
        Registers::R5900::VI GetR5900_vit() const;
        Registers::R5900::VI GetR5900_vid() const;

        uint8_t GetR5900_mmi_function() const;
        uint8_t GetR5900_fhi_flo() const;

        uint8_t GetR5900_xyzw_x() const;
        uint8_t GetR5900_xyzw_y() const;
        uint8_t GetR5900_xyzw_z() const;
        uint8_t GetR5900_xyzw_w() const;
        uint8_t GetR5900_n() const;
        uint8_t GetR5900_l() const;
        uint8_t GetR5900_m() const;

        uint8_t GetR5900_imm5() const;
    };
};


#endif
