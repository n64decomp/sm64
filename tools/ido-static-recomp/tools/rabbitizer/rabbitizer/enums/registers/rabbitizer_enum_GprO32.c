/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "enums/enums_utils.h"
#include "instructions/RabbitizerRegister.h"


#define RABBITIZER_DEF_REG(prefix, name, numeric) \
    { "RegGprO32", #name, RABBITIZER_REG_##prefix##_##name, false, NULL }

#define RABBITIZER_DEF_REG_NODOLLAR(prefix, name, numeric) \
    { "RegGprO32", #name, RABBITIZER_REG_##prefix##_##name, false, NULL }

RabbitizerEnumMetadata rabbitizer_enum_RegGprO32_enumvalues[] = {
    #include "instructions/registers/RabbitizerRegister_GprO32.inc"

    { 0 },
};

#undef RABBITIZER_DEF_REG
#undef RABBITIZER_DEF_REG_NODOLLAR


static PyMethodDef rabbitizer_enum_RegGprO32_methods[] = {
    { 0 },
};

DEF_ENUM(RegGprO32, "")
