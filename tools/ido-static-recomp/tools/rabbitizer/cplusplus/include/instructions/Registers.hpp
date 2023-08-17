/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_REGISTER_HPP
#define RABBITIZER_REGISTER_HPP
#pragma once


namespace rabbitizer {

    namespace Registers {
    #define RABBITIZER_DEF_REG(prefix, name, numeric) \
        prefix##_##name

    #define RABBITIZER_DEF_REG_NODOLLAR(prefix, name, numeric) \
        prefix##_##name

        namespace Cpu {
            enum class GprO32 {
                #include "instructions/registers/RabbitizerRegister_GprO32.inc"
            };

            enum class GprN32 {
                #include "instructions/registers/RabbitizerRegister_GprN32.inc"
            };


            enum class Cop0 {
                #include "instructions/registers/RabbitizerRegister_Cop0.inc"
            };

            // Float registers
            enum class Cop1O32 {
                #include "instructions/registers/RabbitizerRegister_Cop1O32.inc"
            };

            enum class Cop1N32 {
                #include "instructions/registers/RabbitizerRegister_Cop1N32.inc"
            };

            enum class Cop1N64 {
                #include "instructions/registers/RabbitizerRegister_Cop1N64.inc"
            };

            enum class Cop1Control {
                #include "instructions/registers/RabbitizerRegister_Cop1Control.inc"
            };

            enum class Cop2 {
                #include "instructions/registers/RabbitizerRegister_Cop2.inc"
            };
        };


        namespace Rsp {
            enum class Gpr {
                #include "instructions/registers/RabbitizerRegister_RspGpr.inc"
            };

            enum class Cop0 {
                #include "instructions/registers/RabbitizerRegister_RspCop0.inc"
            };

            enum class Cop2 {
                #include "instructions/registers/RabbitizerRegister_RspCop2.inc"
            };

            enum class Cop2Control {
                #include "instructions/registers/RabbitizerRegister_RspCop2Control.inc"
            };

            enum class Vector {
                #include "instructions/registers/RabbitizerRegister_RspVector.inc"
            };
        };


        namespace R5900 {
            enum class VF {
                #include "instructions/registers/RabbitizerRegister_R5900VF.inc"
            };

            enum class VI {
                #include "instructions/registers/RabbitizerRegister_R5900VI.inc"
            };
        };

    #undef RABBITIZER_DEF_REG
    #undef RABBITIZER_DEF_REG_NODOLLAR
    };
};


#endif
