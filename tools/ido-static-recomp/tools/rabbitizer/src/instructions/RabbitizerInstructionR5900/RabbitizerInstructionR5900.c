/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstructionR5900.h"

void RabbitizerInstructionR5900_init(RabbitizerInstruction *self, uint32_t word, uint32_t vram) {
    RabbitizerInstruction_init(self, word, vram);

    self->uniqueId = RABBITIZER_INSTR_ID_r5900_INVALID;
    self->descriptor = &RabbitizerInstrDescriptor_Descriptors[self->uniqueId];

    self->category = RABBITIZER_INSTRCAT_R5900;
}

void RabbitizerInstructionR5900_destroy(RabbitizerInstruction *self) {
    RabbitizerInstruction_destroy(self);
}
