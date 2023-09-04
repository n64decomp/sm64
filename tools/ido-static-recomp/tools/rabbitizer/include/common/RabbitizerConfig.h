/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_CONFIG_H
#define RABBITIZER_CONFIG_H

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif


#define RABBITIZER_DEF_ABI(name) RABBITIZER_ABI_##name

typedef enum RabbitizerAbi {
    #include "Abi.inc"

    RABBITIZER_DEF_ABI(MAX),
} RabbitizerAbi;

#undef RABBITIZER_DEF_ABI

RabbitizerAbi RabbitizerAbi_fromStr(const char *name);


typedef struct RabbitizerConfig_RegisterNames {
    bool namedRegisters; // Enables using named registers. This option takes precedence over the other named register options
    RabbitizerAbi gprAbiNames; // The ABI names to be used for general purpose registers when disassembling the main processor's instructions
    RabbitizerAbi fprAbiNames; // The ABI names to be used for floating point registers when disassembling the floating point (coprocessor 1) instructions
    bool userFpcCsr; // Use FpcCsr as register $31 for the FP control/status register
    bool vr4300Cop0NamedRegisters; // Use named registers for VR4300's coprocessor 0 registers
    bool vr4300RspCop0NamedRegisters; // Use named registers for VR4300's RSP's coprocessor 0 registers
} RabbitizerConfig_RegisterNames;

typedef struct RabbitizerConfig_PseudoInstr {
    bool enablePseudos; // Produce pseudo instructions (like `move` or `b`) whenever those may match the desired original instruction
    bool pseudoBeqz;
    bool pseudoBnez;
    bool pseudoB;
    bool pseudoMove;
    bool pseudoNot;
    bool pseudoNegu;
    bool pseudoBal;
} RabbitizerConfig_PseudoInstr;

typedef struct RabbitizerConfig_ToolchainTweaks {
    bool treatJAsUnconditionalBranch; //! @deprecated
    /**
     * Enables a few fixes for SN64's assembler related to div/divu instructions
     *
     * - SN64's assembler doesn't like assembling `div $0, a, b` with .set noat active.
     * Removing the $0 fixes this issue (but not for handwritten asm)
     *
     * - SN64's assembler expands div to have break if dividing by zero
     * However, the break it generates is different than the one it generates with `break N`
     * So we replace break instrutions for SN64 with the exact word that the assembler generates when expanding div
     */
    bool sn64DivFix;
} RabbitizerConfig_ToolchainTweaks;

typedef struct RabbitizerConfig_Misc {
    int opcodeLJust; // The minimal number of characters to left-align the opcode name
    bool unknownInstrComment; // Generate a pseudo-disassembly comment when disassembling non implemented instructions
    bool omit0XOnSmallImm;
    bool upperCaseImm;
} RabbitizerConfig_Misc;

typedef struct RabbitizerConfig {
    RabbitizerConfig_RegisterNames regNames;
    RabbitizerConfig_PseudoInstr pseudos;
    RabbitizerConfig_ToolchainTweaks toolchainTweaks;
    RabbitizerConfig_Misc misc;
} RabbitizerConfig;

extern RabbitizerConfig RabbitizerConfig_Cfg;


#ifdef __cplusplus
}
#endif

#endif
