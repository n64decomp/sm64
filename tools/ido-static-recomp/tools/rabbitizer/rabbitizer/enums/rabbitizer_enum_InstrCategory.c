/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "enums_utils.h"
#include "instructions/RabbitizerInstruction.h"


#define RABBITIZER_DEF_INSTR_CATEGORY(name) { "InstrCategory", #name, RABBITIZER_INSTRCAT_##name, false, NULL }

RabbitizerEnumMetadata rabbitizer_enum_InstrCategory_enumvalues[] = {
    #include "instructions/InstrCategory.inc"
    RABBITIZER_DEF_INSTR_CATEGORY(MAX),

    { 0 },
};

#undef RABBITIZER_DEF_INSTR_CATEGORY

static PyMethodDef rabbitizer_enum_InstrCategory_methods[] = {
    { 0 },
};

DEF_ENUM(InstrCategory, "")
