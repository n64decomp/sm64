/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstrId.h"

#include <assert.h>

#define RABBITIZER_DEF_INSTR_ID(prefix, caseBits, name, ...) [RABBITIZER_INSTR_ID_##prefix##_##name] = #name,

#define RABBITIZER_DEF_INSTR_ID_ALTNAME(prefix, caseBits, name, altname, ...) [RABBITIZER_INSTR_ID_##prefix##_##name] = #altname,

const char *RabbitizerInstrId_Names[] = {
#include "instructions/instr_id/RabbitizerInstrId_cpu.inc"
#include "instructions/instr_id/RabbitizerInstrId_rsp.inc"
#include "instructions/instr_id/RabbitizerInstrId_r5900.inc"
};

#undef RABBITIZER_DEF_INSTR_ID
#undef RABBITIZER_DEF_INSTR_ID_ALTNAME

const char *RabbitizerInstrId_getOpcodeName(RabbitizerInstrId uniqueId) {
    assert(uniqueId >= RABBITIZER_INSTR_ID_cpu_INVALID && uniqueId < RABBITIZER_INSTR_ID_ALL_MAX);
    assert(uniqueId != RABBITIZER_INSTR_ID_cpu_MAX);
    assert(uniqueId != RABBITIZER_INSTR_ID_rsp_MAX);
    assert(uniqueId != RABBITIZER_INSTR_ID_r5900_MAX);

    return RabbitizerInstrId_Names[uniqueId];
}
