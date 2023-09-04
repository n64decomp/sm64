/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "common/RabbitizerConfig.h"

#include <string.h>

RabbitizerAbi RabbitizerAbi_fromStr(const char *name) {
    if (name == NULL || strcmp(name, "32") == 0 || strcmp(name, "o32") == 0 || strcmp(name, "O32") == 0) {
        return RABBITIZER_ABI_O32;
    }
    if (strcmp(name, "n32") == 0 || strcmp(name, "N32") == 0) {
        return RABBITIZER_ABI_N32;
    }
    if (strcmp(name, "64") == 0 || strcmp(name, "n64") == 0 || strcmp(name, "N64") == 0) {
        return RABBITIZER_ABI_N64;
    }
    return RABBITIZER_ABI_NUMERIC;
}

RabbitizerConfig RabbitizerConfig_Cfg = {
    .regNames = {
        .namedRegisters = true,
        .gprAbiNames = RABBITIZER_ABI_O32,
        .fprAbiNames = RABBITIZER_ABI_NUMERIC,
        .userFpcCsr = true,
        .vr4300Cop0NamedRegisters = true,
        .vr4300RspCop0NamedRegisters = true,
    },
    .pseudos = {
        .enablePseudos = true,
        .pseudoBeqz = true,
        .pseudoBnez = true,
        .pseudoB = true,
        .pseudoMove = true,
        .pseudoNot = true,
        .pseudoNegu = true,
        .pseudoBal = true,
    },
    .toolchainTweaks = {
        .treatJAsUnconditionalBranch = false,
        .sn64DivFix = false,
    },
    .misc = {
        .opcodeLJust = 7+4,
        .unknownInstrComment = true,
        .omit0XOnSmallImm = false,
        .upperCaseImm = true,
    }
};
