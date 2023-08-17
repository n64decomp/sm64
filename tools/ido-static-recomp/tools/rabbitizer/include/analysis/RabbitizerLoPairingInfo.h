/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_LO_PAIRING_INFO_H
#define RABBITIZER_LO_PAIRING_INFO_H
#pragma once

#include <stdbool.h>

#include "common/Utils.h"

#ifdef __cplusplus
extern "C" {
#endif


typedef struct RabbitizerLoPairingInfo {
    int instrOffset;
    int64_t value; // could be either an unsigned 32 bits number or a signed one, so use 64 bits to ensure it fits
    bool shouldProcess;
    bool isGpRel;
    bool isGpGot;
} RabbitizerLoPairingInfo;


NON_NULL(1)
void RabbitizerLoPairingInfo_Init(RabbitizerLoPairingInfo *self);


#ifdef __cplusplus
}
#endif

#endif
