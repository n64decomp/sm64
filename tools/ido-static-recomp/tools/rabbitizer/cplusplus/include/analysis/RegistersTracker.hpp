/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_REGISTERS_TRACKER_HPP
#define RABBITIZER_REGISTERS_TRACKER_HPP
#pragma once

#include "analysis/RabbitizerRegistersTracker.h"

#include "analysis/LoPairingInfo.hpp"
#include "instructions/InstructionBase.hpp"


namespace rabbitizer {
    class RegistersTracker {
    protected:
        RabbitizerRegistersTracker tracker;

    public:
        RegistersTracker();
        RegistersTracker(const RegistersTracker &other);
        virtual ~RegistersTracker();

        /**
         * Returns a pointer to the inner RabbitizerRegistersTracker.
         * It is recommended to not mess with it unless you know what you are doing.
         */
        RabbitizerRegistersTracker *getCPtr();
        const RabbitizerRegistersTracker *getCPtr() const;

        bool moveRegisters(const InstructionBase &instr);
        void overwriteRegisters(const InstructionBase &instr, int instrOffset);
        void unsetRegistersAfterFuncCall(const InstructionBase &instr, const InstructionBase &prevInstr);
        bool getAddressIfCanSetType(const InstructionBase &instr, int instrOffset, uint32_t *dstAddress) const;
        bool getJrInfo(const InstructionBase &instr, int *dstOffset, uint32_t *dstAddress) const;

        void processLui(const InstructionBase &instr, int instrOffset);
        void processLui(const InstructionBase &instr, int instrOffset, const InstructionBase &prevInstr);
        void processGpLoad(const InstructionBase &instr, int instrOffset);
        bool getLuiOffsetForConstant(const InstructionBase &instr, int *dstOffset) const;
        void processConstant(const InstructionBase &instr, uint32_t value, int offset);
        LoPairingInfo preprocessLoAndGetInfo(const InstructionBase &instr, int instrOffset);
        void processLo(const InstructionBase &instr, uint32_t value, int offset);
        bool hasLoButNoHi(const InstructionBase &instr) const;
    };
};


#endif
