/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_INSTRUCTION_R5900_H
#define RABBITIZER_INSTRUCTION_R5900_H
#pragma once

#include "RabbitizerInstruction.h"

#ifdef __cplusplus
extern "C" {
#endif


#define RAB_INSTR_R5900_GET_mmi_function(self)          (SHIFTR((self)->word,  6,  5))
#define RAB_INSTR_R5900_GET_fhi_flo(self)               ((SHIFTR((self)->word,  6,  5) << 2) | SHIFTR((self)->word,  0,  2))

#define RAB_INSTR_R5900_GET_vfs(self)                   (SHIFTR((self)->word, 11,  5))
#define RAB_INSTR_R5900_GET_vft(self)                   (SHIFTR((self)->word, 16,  5))
#define RAB_INSTR_R5900_GET_vfd(self)                   (SHIFTR((self)->word,  6,  5))

#define RAB_INSTR_R5900_GET_xyzw_x(self)                (SHIFTR((self)->word, 24,  1))
#define RAB_INSTR_R5900_GET_xyzw_y(self)                (SHIFTR((self)->word, 23,  1))
#define RAB_INSTR_R5900_GET_xyzw_z(self)                (SHIFTR((self)->word, 22,  1))
#define RAB_INSTR_R5900_GET_xyzw_w(self)                (SHIFTR((self)->word, 21,  1))
#define RAB_INSTR_R5900_GET_n(self)                     (SHIFTR((self)->word,  0,  2))
#define RAB_INSTR_R5900_GET_l(self)                     (SHIFTR((self)->word, 21,  2))
#define RAB_INSTR_R5900_GET_m(self)                     (SHIFTR((self)->word, 23,  2))

#define RAB_INSTR_R5900_GET_vis(self)                   (SHIFTR((self)->word, 11,  5))
#define RAB_INSTR_R5900_GET_vit(self)                   (SHIFTR((self)->word, 16,  5))
#define RAB_INSTR_R5900_GET_vid(self)                   (SHIFTR((self)->word,  6,  5))

#define RAB_INSTR_R5900_GET_imm5(self)                  (SHIFTR((self)->word,  6,  5))


#define RAB_INSTR_R5900_PACK_mmi_function(word, value)  (BITREPACK((word), (value),  6,  5))
#define RAB_INSTR_R5900_PACK_fhi_flo(word, value)       (BITREPACK(BITREPACK((word), (value) >> 2,  6,  5), (value),  0,  2))

#define RAB_INSTR_R5900_PACK_vfs(word, value)           (BITREPACK((word), (value), 11,  5))
#define RAB_INSTR_R5900_PACK_vft(word, value)           (BITREPACK((word), (value), 16,  5))
#define RAB_INSTR_R5900_PACK_vfd(word, value)           (BITREPACK((word), (value),  6,  5))

#define RAB_INSTR_R5900_PACK_xyzw_x(word, value)        (BITREPACK((word), (value), 24,  1))
#define RAB_INSTR_R5900_PACK_xyzw_y(word, value)        (BITREPACK((word), (value), 23,  1))
#define RAB_INSTR_R5900_PACK_xyzw_z(word, value)        (BITREPACK((word), (value), 22,  1))
#define RAB_INSTR_R5900_PACK_xyzw_w(word, value)        (BITREPACK((word), (value), 21,  1))
#define RAB_INSTR_R5900_PACK_n(word, value)             (BITREPACK((word), (value),  0,  2))
#define RAB_INSTR_R5900_PACK_l(word, value)             (BITREPACK((word), (value), 21,  2))
#define RAB_INSTR_R5900_PACK_m(word, value)             (BITREPACK((word), (value), 23,  2))

#define RAB_INSTR_R5900_PACK_vis(word, value)           (BITREPACK((word), (value), 11,  5))
#define RAB_INSTR_R5900_PACK_vit(word, value)           (BITREPACK((word), (value), 16,  5))
#define RAB_INSTR_R5900_PACK_vid(word, value)           (BITREPACK((word), (value),  6,  5))

#define RAB_INSTR_R5900_PACK_imm5(word, value)          (BITREPACK((word), (value),  6,  5))


NON_NULL(1)
void RabbitizerInstructionR5900_init(RabbitizerInstruction *self, uint32_t word, uint32_t vram);
NON_NULL(1)
void RabbitizerInstructionR5900_destroy(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_Normal(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_Special(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_Regimm(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_Coprocessor0(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_Coprocessor1(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_Coprocessor2(RabbitizerInstruction *self);
NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId_MMI(RabbitizerInstruction *self);

NON_NULL(1)
void RabbitizerInstructionR5900_processUniqueId(RabbitizerInstruction *self);


#ifdef __cplusplus
}
#endif

#endif
