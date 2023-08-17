/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstrDescriptor.h"

#include "instructions/RabbitizerInstruction.h"

#define RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, ...) [RABBITIZER_INSTR_ID_##prefix##_##name] = { __VA_ARGS__ },

#define RABBITIZER_DEF_INSTR_ID_ALTNAME(prefix, caseBits, name, altname, ...) RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, __VA_ARGS__)

const RabbitizerInstrDescriptor RabbitizerInstrDescriptor_Descriptors[] = {
#include "instructions/instr_id/RabbitizerInstrId_cpu.inc"
#include "instructions/instr_id/RabbitizerInstrId_rsp.inc"
#include "instructions/instr_id/RabbitizerInstrId_r5900.inc"
};

#undef RABBITIZER_DEF_INSTR_ID
#undef RABBITIZER_DEF_INSTR_ID_ALTNAME

bool RabbitizerInstrDescriptor_isUnknownType(const RabbitizerInstrDescriptor *self) {
    return self->instrType == RABBITIZER_INSTR_TYPE_UNKNOWN;
}
bool RabbitizerInstrDescriptor_isJType(const RabbitizerInstrDescriptor *self) {
    return self->instrType == RABBITIZER_INSTR_TYPE_J;
}
bool RabbitizerInstrDescriptor_isIType(const RabbitizerInstrDescriptor *self) {
    return self->instrType == RABBITIZER_INSTR_TYPE_I;
}
bool RabbitizerInstrDescriptor_isRType(const RabbitizerInstrDescriptor *self) {
    return self->instrType == RABBITIZER_INSTR_TYPE_R;
}
bool RabbitizerInstrDescriptor_isRegimmType(const RabbitizerInstrDescriptor *self) {
    return self->instrType == RABBITIZER_INSTR_TYPE_REGIMM;
}

RabbitizerInstrSuffix RabbitizerInstrDescriptor_instrSuffix(const RabbitizerInstrDescriptor *self) {
    return self->instrSuffix;
}

bool RabbitizerInstrDescriptor_isBranch(const RabbitizerInstrDescriptor *self) {
    return self->isBranch;
}
bool RabbitizerInstrDescriptor_isBranchLikely(const RabbitizerInstrDescriptor *self) {
    return self->isBranchLikely;
}
bool RabbitizerInstrDescriptor_isJump(const RabbitizerInstrDescriptor *self) {
    return self->isJump;
}
bool RabbitizerInstrDescriptor_isTrap(const RabbitizerInstrDescriptor *self) {
    return self->isTrap;
}

bool RabbitizerInstrDescriptor_isFloat(const RabbitizerInstrDescriptor *self) {
    return self->isFloat;
}
bool RabbitizerInstrDescriptor_isDouble(const RabbitizerInstrDescriptor *self) {
    return self->isDouble;
}

bool RabbitizerInstrDescriptor_isUnsigned(const RabbitizerInstrDescriptor *self) {
    return self->isUnsigned;
}

bool RabbitizerInstrDescriptor_modifiesRt(const RabbitizerInstrDescriptor *self) {
    return self->modifiesRt;
}
bool RabbitizerInstrDescriptor_modifiesRd(const RabbitizerInstrDescriptor *self) {
    return self->modifiesRd;
}

bool RabbitizerInstrDescriptor_notEmitedByCompilers(const RabbitizerInstrDescriptor *self) {
    return self->notEmitedByCompilers;
}

bool RabbitizerInstrDescriptor_canBeHi(const RabbitizerInstrDescriptor *self) {
    return self->canBeHi;
}
bool RabbitizerInstrDescriptor_canBeLo(const RabbitizerInstrDescriptor *self) {
    return self->canBeLo;
}
bool RabbitizerInstrDescriptor_doesLink(const RabbitizerInstrDescriptor *self) {
    return self->doesLink;
}
bool RabbitizerInstrDescriptor_doesDereference(const RabbitizerInstrDescriptor *self) {
    return self->doesDereference;
}
bool RabbitizerInstrDescriptor_doesLoad(const RabbitizerInstrDescriptor *self) {
    return self->doesLoad;
}
bool RabbitizerInstrDescriptor_doesStore(const RabbitizerInstrDescriptor *self) {
    return self->doesStore;
}
bool RabbitizerInstrDescriptor_maybeIsMove(const RabbitizerInstrDescriptor *self) {
    return self->maybeIsMove;
}

bool RabbitizerInstrDescriptor_isPseudo(const RabbitizerInstrDescriptor *self) {
    return self->isPseudo;
}

RabbitizerArchitectureVersion RabbitizerInstrDescriptor_getArchitectureVersion(const RabbitizerInstrDescriptor *self) {
    return self->architectureVersion;
}
