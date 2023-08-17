/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstructionRsp.h"

void RabbitizerInstructionRsp_init(RabbitizerInstruction *self, uint32_t word, uint32_t vram) {
    RabbitizerInstruction_init(self, word, vram);

    self->uniqueId = RABBITIZER_INSTR_ID_rsp_INVALID;
    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];

    self->_handwrittenCategory = true;
    self->category = RABBITIZER_INSTRCAT_RSP;
}

void RabbitizerInstructionRsp_destroy(RabbitizerInstruction *self) {
    RabbitizerInstruction_destroy(self);
}

uint16_t RabbitizerInstructionRsp_GetOffsetVector(const RabbitizerInstruction *self) {
    uint16_t offset = RAB_INSTR_RSP_GET_OFFSET_VECTOR_RAW(self);

    switch (self->uniqueId) {
        case RABBITIZER_INSTR_ID_rsp_lsv:
        case RABBITIZER_INSTR_ID_rsp_ssv:
            return offset << 1;

        case RABBITIZER_INSTR_ID_rsp_llv:
        case RABBITIZER_INSTR_ID_rsp_slv:
            return offset << 2;

        case RABBITIZER_INSTR_ID_rsp_ldv:
        case RABBITIZER_INSTR_ID_rsp_sdv:
        case RABBITIZER_INSTR_ID_rsp_lpv:
        case RABBITIZER_INSTR_ID_rsp_spv:
        case RABBITIZER_INSTR_ID_rsp_luv:
        case RABBITIZER_INSTR_ID_rsp_suv:
            return offset << 3;

        case RABBITIZER_INSTR_ID_rsp_lqv:
        case RABBITIZER_INSTR_ID_rsp_sqv:
        case RABBITIZER_INSTR_ID_rsp_lrv:
        case RABBITIZER_INSTR_ID_rsp_srv:
        case RABBITIZER_INSTR_ID_rsp_lhv:
        case RABBITIZER_INSTR_ID_rsp_shv:
        case RABBITIZER_INSTR_ID_rsp_lfv:
        case RABBITIZER_INSTR_ID_rsp_sfv:
        case RABBITIZER_INSTR_ID_rsp_ltv:
        case RABBITIZER_INSTR_ID_rsp_stv:
        case RABBITIZER_INSTR_ID_rsp_swv:
            return offset << 4;

        default:
            return offset;
    }
}
