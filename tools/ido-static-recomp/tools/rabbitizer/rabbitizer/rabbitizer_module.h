/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_MODULE_H
#define RABBITIZER_MODULE_H
#pragma once

#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include "structmember.h"

#include "enums/enums_utils.h"

#include "instructions/RabbitizerInstruction.h"
#include "analysis/RabbitizerTrackedRegisterState.h"
#include "analysis/RabbitizerLoPairingInfo.h"

// TODO: clean up this...


typedef struct PyRabbitizerInstruction {
    PyObject_HEAD
    RabbitizerInstruction instr;
} PyRabbitizerInstruction;

typedef struct PyRabbitizerTrackedRegisterState {
    PyObject_HEAD
    RabbitizerTrackedRegisterState registerState;
} PyRabbitizerTrackedRegisterState;

typedef struct PyRabbitizerLoPairingInfo {
    PyObject_HEAD
    RabbitizerLoPairingInfo pairingInfo;
} PyRabbitizerLoPairingInfo;


PyObject *rabbitizer_submodule_Utils_Init(void);

extern PyTypeObject rabbitizer_global_config_TypeObject;

extern PyTypeObject rabbitizer_type_Enum_TypeObject;
extern PyTypeObject rabbitizer_type_Instruction_TypeObject;
extern PyTypeObject rabbitizer_type_LoPairingInfo_TypeObject;
extern PyTypeObject rabbitizer_type_TrackedRegisterState_TypeObject;
extern PyTypeObject rabbitizer_type_RegistersTracker_TypeObject;

DECL_ENUM(Abi)
DECL_ENUM(InstrCategory)
DECL_ENUM(InstrId)

DECL_ENUM(RegGprO32)
DECL_ENUM(RegGprN32)

#endif
