/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_ENUMS_UTILS_H
#define RABBITIZER_ENUMS_UTILS_H
#pragma once


#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include "structmember.h"

#include <stdbool.h>


extern PyTypeObject rabbitizer_type_Enum_TypeObject;


typedef struct PyRabbitizerEnum {
    PyObject_HEAD
    PyObject *enumType;
    PyObject *name;
    int value;
} PyRabbitizerEnum;

typedef struct RabbitizerEnumMetadata {
    const char *enumType;
    const char *name;
    int value;
    bool isInstanced;
    PyObject *instance;
} RabbitizerEnumMetadata;


int rabbitizer_EnumMetadata_Initialize(PyObject *submodule, RabbitizerEnumMetadata *enumValues);


#define DECL_ENUM(enumName) \
    extern RabbitizerEnumMetadata rabbitizer_enum_##enumName##_enumvalues[]; \
    PyObject *rabbitizer_enum_##enumName##_Init(void); \
    /* Return true if o is of this enum type */ \
    int rabbitizer_enum_##enumName##_Check(PyObject *o);

#define DEF_ENUM(enumName, docs) \
    static PyModuleDef rabbitizer_enum_##enumName##_module = { \
        PyModuleDef_HEAD_INIT, \
        .m_name = "rabbitizer." #enumName, \
        .m_doc = PyDoc_STR(docs), \
        .m_size = -1, \
        .m_methods = rabbitizer_enum_##enumName##_methods, \
    }; \
    PyObject *rabbitizer_enum_##enumName##_Init(void) { \
        PyObject *submodule; \
        if (PyType_Ready(&rabbitizer_type_Enum_TypeObject) < 0) { \
            return NULL; \
        } \
        submodule = PyModule_Create(&rabbitizer_enum_##enumName##_module); \
        if (submodule == NULL) { \
            return NULL; \
        } \
        if (rabbitizer_EnumMetadata_Initialize(submodule, rabbitizer_enum_##enumName##_enumvalues) < 0) { \
            Py_DECREF(submodule); \
            return NULL; \
        } \
        return submodule; \
    } \
    /* Return true if o is of this enum type */ \
    int rabbitizer_enum_##enumName##_Check(PyObject *o) { \
        int isInstance = PyObject_IsInstance(o, (PyObject*)&rabbitizer_type_Enum_TypeObject); \
        int enumTypeCmp; \
        if (isInstance < 0) { \
            /* An error happened */ \
            /* PyObject_IsInstance already sets an exception, so nothing else to do here */ \
            return -1; \
        } \
        if (isInstance == 0) { \
            /* `other` isn't an instance of the Enum type */ \
            return 0; \
        } \
        /* Check if both enums have the same `enumType` */ \
        enumTypeCmp = PyUnicode_CompareWithASCIIString(((PyRabbitizerEnum*)o)->enumType, #enumName); \
        return enumTypeCmp == 0; \
    }

#endif
