/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRUCTION_H
#define RABBITIZER_INSTRUCTION_H
#pragma once

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "common/Utils.h"

#include "RabbitizerInstrId.h"
#include "RabbitizerInstrDescriptor.h"

#ifdef __cplusplus
extern "C" {
#endif


#define RABBITIZER_DEF_INSTR_CATEGORY(name) RABBITIZER_INSTRCAT_##name

typedef enum RabbitizerInstrCategory {
    #include "instructions/InstrCategory.inc"

    RABBITIZER_DEF_INSTR_CATEGORY(MAX),
} RabbitizerInstrCategory;

#undef RABBITIZER_DEF_INSTR_CATEGORY


typedef struct RabbitizerInstruction {
    uint32_t word;
    uint32_t _mandatorybits;

    RabbitizerInstrId uniqueId;
    const RabbitizerInstrDescriptor *descriptor;

    uint32_t vram;
    bool _handwrittenCategory;
    bool inHandwrittenFunction;
    RabbitizerInstrCategory category;
} RabbitizerInstruction;


#define RAB_INSTR_GET_opcode(self)                  (SHIFTR((self)->word, 26,  6))
#define RAB_INSTR_GET_rs(self)                      (SHIFTR((self)->word, 21,  5))
#define RAB_INSTR_GET_rt(self)                      (SHIFTR((self)->word, 16,  5))
#define RAB_INSTR_GET_rd(self)                      (SHIFTR((self)->word, 11,  5))
#define RAB_INSTR_GET_sa(self)                      (SHIFTR((self)->word,  6,  5))
#define RAB_INSTR_GET_function(self)                (SHIFTR((self)->word,  0,  6))

#define RAB_INSTR_GET_cop0d(self)                   (SHIFTR((self)->word, 11,  5))

#define RAB_INSTR_GET_instr_index(self)             (SHIFTR((self)->word,  0, 26))
#define RAB_INSTR_GET_immediate(self)               (SHIFTR((self)->word,  0, 16))

#define RAB_INSTR_GET_fs(self)                      (SHIFTR((self)->word, 11,  5))
#define RAB_INSTR_GET_ft(self)                      (SHIFTR((self)->word, 16,  5))
#define RAB_INSTR_GET_fd(self)                      (SHIFTR((self)->word,  6,  5))
#define RAB_INSTR_GET_cop1cs(self)                  (SHIFTR((self)->word, 11,  5))

#define RAB_INSTR_GET_op(self)                      (SHIFTR((self)->word, 16,  5))

#define RAB_INSTR_GET_code(self)                    (SHIFTR((self)->word,  6, 20))
#define RAB_INSTR_GET_code_upper(self)              (SHIFTR((self)->word, 16, 10))
#define RAB_INSTR_GET_code_lower(self)              (SHIFTR((self)->word,  6, 10))

#define RAB_INSTR_GET_copraw(self)                  (SHIFTR((self)->word,  0, 25))

#define RAB_INSTR_GET_fmt(self)                     (SHIFTR((self)->word, 21,  5))
#define RAB_INSTR_GET_fc(self)                      (SHIFTR((self)->word,  4,  2))
#define RAB_INSTR_GET_cond(self)                    (SHIFTR((self)->word,  0,  4))

#define RAB_INSTR_GET_cop2t(self)                   (SHIFTR((self)->word, 16,  5))

#define RAB_INSTR_GET_tf(self)                      (SHIFTR((self)->word, 16,  1))
#define RAB_INSTR_GET_nd(self)                      (SHIFTR((self)->word, 17,  1))
#define RAB_INSTR_GET_bc_fmt(self)                  (SHIFTR((self)->word, 16,  5))

#define RAB_INSTR_GET_stype(self)                   (SHIFTR((self)->word,  6,  5))


#define RAB_INSTR_PACK_opcode(word, value)          (BITREPACK_RIGHT((word), (value), 26,  6))
#define RAB_INSTR_PACK_rs(word, value)              (BITREPACK((word), (value), 21,  5))
#define RAB_INSTR_PACK_rt(word, value)              (BITREPACK((word), (value), 16,  5))
#define RAB_INSTR_PACK_rd(word, value)              (BITREPACK((word), (value), 11,  5))
#define RAB_INSTR_PACK_sa(word, value)              (BITREPACK((word), (value),  6,  5))
#define RAB_INSTR_PACK_function(word, value)        (BITREPACK((word), (value),  0,  6))

#define RAB_INSTR_PACK_cop0d(word, value)           (BITREPACK((word), (value), 11,  5))

#define RAB_INSTR_PACK_instr_index(word, value)     (BITREPACK((word), (value),  0, 26))
#define RAB_INSTR_PACK_immediate(word, value)       (BITREPACK((word), (value),  0, 16))

#define RAB_INSTR_PACK_code(word, value)            (BITREPACK((word), (value),  6, 20))
#define RAB_INSTR_PACK_code_upper(word, value)      (BITREPACK((word), (value), 16, 10))
#define RAB_INSTR_PACK_code_lower(word, value)      (BITREPACK((word), (value),  6, 10))

#define RAB_INSTR_PACK_copraw(word, value)          (BITREPACK((word), (value),  0, 25))

#define RAB_INSTR_PACK_fmt(word, value)             (BITREPACK((word), (value), 21,  5))
#define RAB_INSTR_PACK_fc(word, value)              (BITREPACK((word), (value),  4,  2))
#define RAB_INSTR_PACK_cond(word, value)            (BITREPACK((word), (value),  0,  4))

#define RAB_INSTR_PACK_fs(word, value)              (BITREPACK((word), (value), 11,  5))
#define RAB_INSTR_PACK_ft(word, value)              (BITREPACK((word), (value), 16,  5))
#define RAB_INSTR_PACK_fd(word, value)              (BITREPACK((word), (value),  6,  5))
#define RAB_INSTR_PACK_cop1cs(word, value)          (BITREPACK((word), (value), 11,  5))

#define RAB_INSTR_PACK_op(word, value)              (BITREPACK((word), (value), 16,  5))

#define RAB_INSTR_PACK_cop2t(word, value)           (BITREPACK((word), (value), 16,  5))

#define RAB_INSTR_PACK_tf(word, value)              (BITREPACK((word), (value), 16,  1))
#define RAB_INSTR_PACK_nd(word, value)              (BITREPACK((word), (value), 17,  1))
#define RAB_INSTR_PACK_bc_fmt(word, value)          (BITREPACK((word), (value), 16,  5))

#define RAB_INSTR_PACK_stype(word, value)           (BITREPACK((word), (value),  6,  5))


NON_NULL(1)
void RabbitizerInstruction_init(RabbitizerInstruction *self, uint32_t word, uint32_t vram);
NON_NULL(1)
void RabbitizerInstruction_destroy(RabbitizerInstruction* self);


/* Process uniqueId */

NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Normal(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Special(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Regimm(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor0_BC0(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor0_Tlb(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor0(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor1_BC1(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuS(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuD(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuW(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor1_FpuL(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor1(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstruction_processUniqueId_Coprocessor2(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstruction_processUniqueId(RabbitizerInstruction *self);

/* Process uniqueId */


/* General getters */

NODISCARD NON_NULL(1) PURE
uint32_t RabbitizerInstruction_getRaw(const RabbitizerInstruction *self);

NODISCARD NON_NULL(1) PURE
uint32_t RabbitizerInstruction_getImmediate(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
int32_t RabbitizerInstruction_getProcessedImmediate(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
uint32_t RabbitizerInstruction_getInstrIndex(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
uint32_t RabbitizerInstruction_getInstrIndexAsVram(const RabbitizerInstruction *self);

NODISCARD NON_NULL(1) PURE
int32_t RabbitizerInstruction_getBranchOffset(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
int32_t RabbitizerInstruction_getGenericBranchOffset(const RabbitizerInstruction *self, uint32_t currentVram);

/* General getters */

NON_NULL(1)
void RabbitizerInstruction_blankOut(RabbitizerInstruction *self);


/* Instruction examination */

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isImplemented(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isLikelyHandwritten(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isNop(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isUnconditionalBranch(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isJrRa(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isJrNotRa(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_hasDelaySlot(const RabbitizerInstruction *self);

NODISCARD NON_NULL(1) PURE
const char *RabbitizerInstruction_mapInstrToType(const RabbitizerInstruction *self);

NODISCARD NON_NULL(1, 2) PURE
bool RabbitizerInstruction_sameOpcode(const RabbitizerInstruction *self, const RabbitizerInstruction *other);
NODISCARD NON_NULL(1, 2) PURE
bool RabbitizerInstruction_sameOpcodeButDifferentArguments(const RabbitizerInstruction *self, const RabbitizerInstruction *other);

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_hasOperand(const RabbitizerInstruction *self, RabbitizerOperandType operand);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_hasOperandAlias(const RabbitizerInstruction *self, RabbitizerOperandType operand);

NODISCARD NON_NULL(1) PURE
uint32_t RabbitizerInstruction_getValidBits(const RabbitizerInstruction *self);
NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_isValid(const RabbitizerInstruction *self);

/* Instruction examination */


/* Disassembly */

NODISCARD NON_NULL(1) PURE
bool RabbitizerInstruction_mustDisasmAsData(const RabbitizerInstruction *self);

NODISCARD NON_NULL(1) PURE
size_t RabbitizerInstruction_getSizeForBufferOperandsDisasm(const RabbitizerInstruction *self, size_t immOverrideLength);
NON_NULL(1, 2)
size_t RabbitizerInstruction_disassembleOperands(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength);

NODISCARD NON_NULL(1) PURE
size_t RabbitizerInstruction_getSizeForBufferInstrDisasm(const RabbitizerInstruction *self, size_t immOverrideLength, int extraLJust);
NON_NULL(1, 2)
size_t RabbitizerInstruction_disassembleInstruction(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength, int extraLJust);

NODISCARD NON_NULL(1) PURE
size_t RabbitizerInstruction_getSizeForBufferDataDisasm(const RabbitizerInstruction *self, int extraLJust);
NON_NULL(1, 2)
size_t RabbitizerInstruction_disassembleAsData(const RabbitizerInstruction *self, char *dst, int extraLJust);

NODISCARD NON_NULL(1) PURE
size_t RabbitizerInstruction_getSizeForBuffer(const RabbitizerInstruction *self, size_t immOverrideLength, int extraLJust);
NON_NULL(1, 2)
size_t RabbitizerInstruction_disassemble(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength, int extraLJust);

/* Disassembly */


#ifdef __cplusplus
}
#endif

#endif
