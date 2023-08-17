/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_REGISTER_H
#define RABBITIZER_REGISTER_H
#pragma once

#include <stdint.h>

#include "common/Utils.h"

#ifdef __cplusplus
extern "C" {
#endif


#define RABBITIZER_DEF_REG(prefix, name, numeric) \
    RABBITIZER_REG_##prefix##_##name

#define RABBITIZER_DEF_REG_NODOLLAR(prefix, name, numeric) \
    RABBITIZER_REG_##prefix##_##name


typedef enum RabbitizerRegister_GprO32 {
    #include "instructions/registers/RabbitizerRegister_GprO32.inc"
} RabbitizerRegister_GprO32;

typedef enum RabbitizerRegister_GprN32 {
    #include "instructions/registers/RabbitizerRegister_GprN32.inc"
} RabbitizerRegister_GprN32;

typedef enum RabbitizerRegister_Cop0 {
    #include "instructions/registers/RabbitizerRegister_Cop0.inc"
} RabbitizerRegister_Cop0;

// Float registers
typedef enum RabbitizerRegister_Cop1O32 {
    #include "instructions/registers/RabbitizerRegister_Cop1O32.inc"
} RabbitizerRegister_Cop1O32;

typedef enum RabbitizerRegister_Cop1N32 {
    #include "instructions/registers/RabbitizerRegister_Cop1N32.inc"
} RabbitizerRegister_Cop1N32;

typedef enum RabbitizerRegister_Cop1N64 {
    #include "instructions/registers/RabbitizerRegister_Cop1N64.inc"
} RabbitizerRegister_Cop1N64;

typedef enum RabbitizerRegister_Cop1Control {
    #include "instructions/registers/RabbitizerRegister_Cop1Control.inc"
} RabbitizerRegister_Cop1Control;

typedef enum RabbitizerRegister_Cop2 {
    #include "instructions/registers/RabbitizerRegister_Cop2.inc"
} RabbitizerRegister_Cop2;


/* RSP */

typedef enum RabbitizerRegister_RspGpr {
    #include "instructions/registers/RabbitizerRegister_RspGpr.inc"
} RabbitizerRegister_RspGpr;

typedef enum RabbitizerRegister_RspCop0 {
    #include "instructions/registers/RabbitizerRegister_RspCop0.inc"
} RabbitizerRegister_RspCop0;

typedef enum RabbitizerRegister_RspCop2 {
    #include "instructions/registers/RabbitizerRegister_RspCop2.inc"
} RabbitizerRegister_RspCop2;

typedef enum RabbitizerRegister_RspCop2Control {
    #include "instructions/registers/RabbitizerRegister_RspCop2Control.inc"
} RabbitizerRegister_RspCop2Control;

typedef enum RabbitizerRegister_RspVector {
    #include "instructions/registers/RabbitizerRegister_RspVector.inc"
} RabbitizerRegister_RspVector;

/* RSP */

/* R5900 */

typedef enum RabbitizerRegister_R5900VF {
    #include "instructions/registers/RabbitizerRegister_R5900VF.inc"
} RabbitizerRegister_R5900VF;

typedef enum RabbitizerRegister_R5900VI {
    #include "instructions/registers/RabbitizerRegister_R5900VI.inc"
} RabbitizerRegister_R5900VI;

/* R5900 */


#undef RABBITIZER_DEF_REG
#undef RABBITIZER_DEF_REG_NODOLLAR


extern const char *RabbitizerRegister_GprO32_Names[][2];
extern const char *RabbitizerRegister_GprN32_Names[][2];
extern const char *RabbitizerRegister_Cop0_Names[][2];
extern const char *RabbitizerRegister_Cop1O32_Names[][2];
extern const char *RabbitizerRegister_Cop1N32_Names[][2];
extern const char *RabbitizerRegister_Cop1N64_Names[][2];
extern const char *RabbitizerRegister_Cop2_Names[][2];
extern const char *RabbitizerRegister_RspGpr_Names[][2];
extern const char *RabbitizerRegister_RspCop0_Names[][2];
extern const char *RabbitizerRegister_RspVector_Names[][2];


NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameGpr(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameCop0(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameCop1(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameCop1Control(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameCop2(uint8_t regValue);

NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameRspGpr(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameRspCop0(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameRspCop2(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameRspCop2Control(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameRspVector(uint8_t regValue);

NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameR5900VF(uint8_t regValue);
NODISCARD PURE RETURNS_NON_NULL
const char *RabbitizerRegister_getNameR5900VI(uint8_t regValue);


#ifdef __cplusplus
}
#endif

#endif
