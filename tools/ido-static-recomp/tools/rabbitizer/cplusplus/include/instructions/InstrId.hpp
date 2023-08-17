/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRID_HPP
#define RABBITIZER_INSTRID_HPP
#pragma once

#include <string>


namespace rabbitizer {
    namespace InstrId {
        #define RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, ...) \
            prefix##_##name,

        #define RABBITIZER_DEF_INSTR_ID_ALTNAME(prefix, caseBits, name, altname, ...) \
            RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, __VA_ARGS__)

        enum class UniqueId {
            #include "instructions/instr_id/RabbitizerInstrId_cpu.inc"

            #include "instructions/instr_id/RabbitizerInstrId_rsp.inc"

            #include "instructions/instr_id/RabbitizerInstrId_r5900.inc"

            ALL_MAX = RABBITIZER_DEF_INSTR_ID(r5900, , MAX, )
        };

        #undef RABBITIZER_DEF_INSTR_ID
        #undef RABBITIZER_DEF_INSTR_ID_ALTNAME


        std::string getOpcodeName(UniqueId uniqueId);
    };
};


#endif
