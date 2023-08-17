/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRUCTION_RSP_H
#define RABBITIZER_INSTRUCTION_RSP_H
#pragma once

#include "RabbitizerInstruction.h"

#ifdef __cplusplus
extern "C" {
#endif


#define RAB_INSTR_RSP_GET_cop2t(self)               (SHIFTR((self)->word, 16,  5))
#define RAB_INSTR_RSP_GET_cop2cd(self)              (SHIFTR((self)->word, 11,  5))

#define RAB_INSTR_RSP_GET_vs(self)                  (SHIFTR((self)->word, 11,  5))
#define RAB_INSTR_RSP_GET_vt(self)                  (SHIFTR((self)->word, 16,  5))
#define RAB_INSTR_RSP_GET_vd(self)                  (SHIFTR((self)->word,  6,  5))

#define RAB_INSTR_RSP_GET_elementhigh(self)         (SHIFTR((self)->word, 21,  4))
#define RAB_INSTR_RSP_GET_elementlow(self)          (SHIFTR((self)->word,  7,  4))
#define RAB_INSTR_RSP_GET_OFFSET_VECTOR_RAW(self)   (SHIFTR((self)->word,  0,  7))

#define RAB_INSTR_RSP_GET_index(self)               (SHIFTR((self)->word,  7,  4))
#define RAB_INSTR_RSP_GET_de(self)                  (SHIFTR((self)->word, 11,  5))


#define RAB_INSTR_RSP_PACK_cop2t(word, value)       (BITREPACK((word), value, 16,  5))
#define RAB_INSTR_RSP_PACK_cop2cd(word, value)      (BITREPACK((word), value, 11,  5))

#define RAB_INSTR_RSP_PACK_vs(word, value)          (BITREPACK((word), value, 11,  5))
#define RAB_INSTR_RSP_PACK_vt(word, value)          (BITREPACK((word), value, 16,  5))
#define RAB_INSTR_RSP_PACK_vd(word, value)          (BITREPACK((word), value,  6,  5))

#define RAB_INSTR_RSP_PACK_elementhigh(word, value) (BITREPACK((word), value, 21,  4))
#define RAB_INSTR_RSP_PACK_elementlow(word, value)  (BITREPACK((word), value,  7,  4))

#define RAB_INSTR_RSP_PACK_index(word, value)       (BITREPACK((word), value,  7,  4))
#define RAB_INSTR_RSP_PACK_offset(word, value)      (BITREPACK((word), value,  0,  7))
#define RAB_INSTR_RSP_PACK_de(word, value)          (BITREPACK((word), value, 11,  5))


NON_NULL(1)
void RabbitizerInstructionRsp_init(RabbitizerInstruction *self, uint32_t word, uint32_t vram);
NON_NULL(1)
void RabbitizerInstructionRsp_destroy(RabbitizerInstruction *self);


NON_NULL(1)
void RabbitizerInstructionRsp_processUniqueId_Normal(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionRsp_processUniqueId_Special(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionRsp_processUniqueId_Regimm(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstructionRsp_processUniqueId(RabbitizerInstruction *self);


NODISCARD NON_NULL(1) PURE
uint16_t RabbitizerInstructionRsp_GetOffsetVector(const RabbitizerInstruction *self);


#ifdef __cplusplus
}
#endif

#endif
