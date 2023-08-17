/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRDESCRIPTOR_H
#define RABBITIZER_INSTRDESCRIPTOR_H
#pragma once

#include <stdbool.h>

#include "common/Utils.h"
#include "RabbitizerOperandType.h"
#include "RabbitizerInstrId.h"
#include "RabbitizerInstrSuffix.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef enum RabbitizerInstrType {
    RABBITIZER_INSTR_TYPE_UNKNOWN,
    RABBITIZER_INSTR_TYPE_J,
    RABBITIZER_INSTR_TYPE_I,
    RABBITIZER_INSTR_TYPE_R,
    RABBITIZER_INSTR_TYPE_REGIMM,
    RABBITIZER_INSTR_TYPE_MAX,
} RabbitizerInstrType;

typedef enum RabbitizerArchitectureVersion {
    RABBITIZER_ARCHVERSION_INVALID=-1,
    RABBITIZER_ARCHVERSION_UNKNOWN,
    RABBITIZER_ARCHVERSION_MIPS_I,
    RABBITIZER_ARCHVERSION_MIPS_II,
    RABBITIZER_ARCHVERSION_MIPS_III,
    RABBITIZER_ARCHVERSION_MIPS_IV
} RabbitizerArchitectureVersion;

typedef struct RabbitizerInstrDescriptor {
    RabbitizerOperandType operands[4];
    RabbitizerInstrType instrType;

    RabbitizerInstrSuffix instrSuffix;

    bool isBranch;
    bool isBranchLikely;
    bool isJump;
    bool isTrap;

    bool isFloat;
    bool isDouble;

    bool isUnsigned;

    bool modifiesRt;
    bool modifiesRd;

    bool notEmitedByCompilers;

    bool canBeHi;
    bool canBeLo;
    bool doesLink; // "and link" family of instructions
    bool doesDereference;
    bool doesLoad; // loads data from memory
    bool doesStore; // stores data to memory
    bool maybeIsMove;

    bool isPseudo;

    RabbitizerArchitectureVersion architectureVersion; // TODO: consider removing
} RabbitizerInstrDescriptor;

// TODO: less redundant name
extern const RabbitizerInstrDescriptor RabbitizerInstrDescriptor_Descriptors[];


NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isUnknownType(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isJType(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isIType(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isRType(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isRegimmType(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
RabbitizerInstrSuffix RabbitizerInstrDescriptor_instrSuffix(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isBranch(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isBranchLikely(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isJump(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isTrap(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isFloat(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isDouble(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isUnsigned(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_modifiesRt(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_modifiesRd(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_notEmitedByCompilers(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_canBeHi(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_canBeLo(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_doesLink(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_doesDereference(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_doesLoad(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_doesStore(const RabbitizerInstrDescriptor *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_maybeIsMove(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstrDescriptor_isPseudo(const RabbitizerInstrDescriptor *self);

NODISCARD NON_NULL(1) PURE
RabbitizerArchitectureVersion RabbitizerInstrDescriptor_getArchitectureVersion(const RabbitizerInstrDescriptor *self);


#ifdef __cplusplus
}
#endif

#endif
