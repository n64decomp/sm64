/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerRegister.h"

#include <assert.h>

#include "common/Utils.h"
#include "common/RabbitizerConfig.h"

#define RABBITIZER_DEF_REG(prefix, name, numeric) [RABBITIZER_REG_##prefix##_##name] = { "$" #numeric, "$" #name }

#define RABBITIZER_DEF_REG_NODOLLAR(prefix, name, numeric) [RABBITIZER_REG_##prefix##_##name] = { "$" #numeric, #name }

// numeric, named

const char *RabbitizerRegister_GprO32_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_GprO32.inc"
};

const char *RabbitizerRegister_GprN32_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_GprN32.inc"
};

const char *RabbitizerRegister_Cop0_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_Cop0.inc"
};

const char *RabbitizerRegister_Cop1O32_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_Cop1O32.inc"
};

const char *RabbitizerRegister_Cop1N32_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_Cop1N32.inc"
};

const char *RabbitizerRegister_Cop1N64_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_Cop1N64.inc"
};

const char *RabbitizerRegister_Cop1Control_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_Cop1Control.inc"
};

const char *RabbitizerRegister_Cop2_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_Cop2.inc"
};

/* RSP */

const char *RabbitizerRegister_RspGpr_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_RspGpr.inc"
};

const char *RabbitizerRegister_RspCop0_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_RspCop0.inc"
};

const char *RabbitizerRegister_RspCop2_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_RspCop2.inc"
};

const char *RabbitizerRegister_RspCop2Control_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_RspCop2Control.inc"
};

const char *RabbitizerRegister_RspVector_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_RspVector.inc"
};

/* RSP */

/* R5900 */

const char *RabbitizerRegister_R5900VF_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_R5900VF.inc"
};

const char *RabbitizerRegister_R5900VI_Names[][2] = {
#include "instructions/registers/RabbitizerRegister_R5900VI.inc"
};

/* R5900 */

const char *RabbitizerRegister_getNameGpr(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_GprO32_Names));

    switch (RabbitizerConfig_Cfg.regNames.gprAbiNames) {
        case RABBITIZER_ABI_NUMERIC:
            return RabbitizerRegister_GprO32_Names[regValue][0];

        default:
        case RABBITIZER_ABI_O32:
            return RabbitizerRegister_GprO32_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];

        case RABBITIZER_ABI_N32:
        case RABBITIZER_ABI_N64:
            return RabbitizerRegister_GprN32_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
    }
}

const char *RabbitizerRegister_getNameCop0(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_Cop0_Names));

    return RabbitizerRegister_Cop0_Names[regValue]
                                        [RabbitizerConfig_Cfg.regNames.namedRegisters && RabbitizerConfig_Cfg.regNames.vr4300Cop0NamedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameCop1(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_Cop1O32_Names));

    switch (RabbitizerConfig_Cfg.regNames.fprAbiNames) {
        default:
        case RABBITIZER_ABI_NUMERIC:
            return RabbitizerRegister_Cop1O32_Names[regValue][0];

        case RABBITIZER_ABI_O32:
            return RabbitizerRegister_Cop1O32_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];

        case RABBITIZER_ABI_N32:
            return RabbitizerRegister_Cop1N32_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];

        case RABBITIZER_ABI_N64:
            return RabbitizerRegister_Cop1N64_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
    }
}

const char *RabbitizerRegister_getNameCop1Control(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_Cop1Control_Names));

    return RabbitizerRegister_Cop1Control_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters && RabbitizerConfig_Cfg.regNames.userFpcCsr ? 1 : 0];
}

const char *RabbitizerRegister_getNameCop2(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_Cop2_Names));

    return RabbitizerRegister_Cop2_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameRspGpr(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_RspGpr_Names));

    return RabbitizerRegister_RspGpr_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameRspCop0(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_RspCop0_Names));

    return RabbitizerRegister_RspCop0_Names[regValue]
                                           [RabbitizerConfig_Cfg.regNames.namedRegisters && RabbitizerConfig_Cfg.regNames.vr4300RspCop0NamedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameRspCop2(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_RspCop2_Names));

    return RabbitizerRegister_RspCop2_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameRspCop2Control(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_RspCop2Control_Names));

    return RabbitizerRegister_RspCop2Control_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameRspVector(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_RspVector_Names));

    return RabbitizerRegister_RspVector_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameR5900VF(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_R5900VF_Names));

    return RabbitizerRegister_R5900VF_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}

const char *RabbitizerRegister_getNameR5900VI(uint8_t regValue) {
    assert(regValue < ARRAY_COUNT(RabbitizerRegister_R5900VI_Names));

    return RabbitizerRegister_R5900VI_Names[regValue][RabbitizerConfig_Cfg.regNames.namedRegisters ? 1 : 0];
}
