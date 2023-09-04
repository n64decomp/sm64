/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

/**
 * Wrapper to expose rabbitizer's global configuration
 */

#include "rabbitizer_module.h"
#include "common/RabbitizerConfig.h"
#include "common/Utils.h"


#define DEF_MEMBER_GET_BOOL(category, name) \
    static PyObject *rabbitizer_global_config_get_##category##_##name(UNUSED PyObject *self, UNUSED PyObject *closure) { \
        if (RabbitizerConfig_Cfg.category.name) { \
            Py_RETURN_TRUE; \
        } \
        Py_RETURN_FALSE; \
    }
#define DEF_MEMBER_SET_BOOL(category, name) \
    static int rabbitizer_global_config_set_##category##_##name(UNUSED PyObject *self, PyObject *value, UNUSED void *closure) { \
        if (value == NULL) { \
            PyErr_SetString(PyExc_TypeError, "Cannot delete '" #category "." #name "' attribute"); \
            return -1; \
        } \
        RabbitizerConfig_Cfg.category.name = PyObject_IsTrue(value); \
        return 0; \
    }

#define DEF_MEMBER_GET_SET_BOOL(category, name) \
    DEF_MEMBER_GET_BOOL(category, name) \
    DEF_MEMBER_SET_BOOL(category, name)


#define DEF_MEMBER_GET_INT(category, name) \
    static PyObject *rabbitizer_global_config_get_##category##_##name(UNUSED PyObject *self, UNUSED PyObject *closure) { \
        return PyLong_FromLong(RabbitizerConfig_Cfg.category.name); \
    }
#define DEF_MEMBER_SET_INT(category, name, rangeCheck, minVal, maxVal) \
    static int rabbitizer_global_config_set_##category##_##name(UNUSED PyObject *self, PyObject *value, UNUSED void *closure) { \
        long val; \
        if (value == NULL) { \
            PyErr_SetString(PyExc_TypeError, "Cannot delete '" #category "_" #name "' attribute"); \
            return -1; \
        } \
        val = PyLong_AsLong(value); \
        if (val == -1) { \
            PyObject *err = PyErr_Occurred(); \
            if (err != NULL) { \
                return -1; \
            } \
        } \
        if (rangeCheck && (val < minVal || val > maxVal)) { \
            PyErr_SetString(PyExc_ValueError, "Invalid value for '" #category "_" #name "' attribute"); \
            return -1; \
        } \
        RabbitizerConfig_Cfg.category.name = val;\
        return 0; \
    }

#define DEF_MEMBER_GET_SET_INT(category, name, rangeCheck, minVal, maxVal) \
    DEF_MEMBER_GET_INT(category, name) \
    DEF_MEMBER_SET_INT(category, name, rangeCheck, minVal, maxVal)

#define DEF_MEMBER_GET_ABI(category, name) \
    static PyObject *rabbitizer_global_config_get_##category##_##name(UNUSED PyObject *self, UNUSED PyObject *ignored) { \
        PyObject *enumInstance = rabbitizer_enum_Abi_enumvalues[RabbitizerConfig_Cfg.category.name].instance; \
        if (enumInstance == NULL) { \
            PyErr_SetString(PyExc_RuntimeError, "Internal error: invalid enum value for '" #category "_" #name "'"); \
            return NULL; \
        } \
        Py_INCREF(enumInstance); \
        return enumInstance; \
    }
#define DEF_MEMBER_SET_ABI(category, name) \
    static int rabbitizer_global_config_set_##category##_##name(UNUSED PyObject *self, PyObject *value, UNUSED void *closure) { \
        int enumCheck; \
        if (value == NULL) { \
            PyErr_SetString(PyExc_TypeError, "Cannot delete '" #category "_" #name "' attribute"); \
            return -1; \
        } \
        enumCheck = rabbitizer_enum_Abi_Check(value); \
        if (enumCheck <= 0) { \
            if (enumCheck == 0) { \
                PyErr_SetString(PyExc_ValueError, "Invalid value for '" #category "_" #name "' attribute"); \
            } \
            return -1; \
        } \
        RabbitizerConfig_Cfg.category.name = ((PyRabbitizerEnum*)value)->value; \
        return 0; \
    }

#define DEF_MEMBER_GET_SET_ABI(category, name) \
    DEF_MEMBER_GET_ABI(category, name) \
    DEF_MEMBER_SET_ABI(category, name)


#define MEMBER_GET(category, name, docs, closure)      { #category "_" #name, (getter) rabbitizer_global_config_get_##category##_##name, (setter) NULL,                                             PyDoc_STR(docs), closure }
#define MEMBER_SET(category, name, docs, closure)      { #category "_" #name, (getter) NULL,                                             (setter) rabbitizer_global_config_set_##category##_##name, PyDoc_STR(docs), closure }
#define MEMBER_GET_SET(category, name, docs, closure)  { #category "_" #name, (getter) rabbitizer_global_config_get_##category##_##name, (setter) rabbitizer_global_config_set_##category##_##name, PyDoc_STR(docs), closure }


DEF_MEMBER_GET_SET_BOOL(regNames, namedRegisters)
DEF_MEMBER_GET_SET_ABI(regNames, gprAbiNames)
DEF_MEMBER_GET_SET_ABI(regNames, fprAbiNames)
DEF_MEMBER_GET_SET_BOOL(regNames, userFpcCsr)
DEF_MEMBER_GET_SET_BOOL(regNames, vr4300Cop0NamedRegisters)
DEF_MEMBER_GET_SET_BOOL(regNames, vr4300RspCop0NamedRegisters)

DEF_MEMBER_GET_SET_BOOL(pseudos, enablePseudos)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoBeqz)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoBnez)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoB)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoMove)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoNot)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoNegu)
DEF_MEMBER_GET_SET_BOOL(pseudos, pseudoBal)

DEF_MEMBER_GET_SET_BOOL(toolchainTweaks, treatJAsUnconditionalBranch)
DEF_MEMBER_GET_SET_BOOL(toolchainTweaks, sn64DivFix)

DEF_MEMBER_GET_SET_INT(misc, opcodeLJust, false, 0, 0)
DEF_MEMBER_GET_SET_BOOL(misc, unknownInstrComment)
DEF_MEMBER_GET_SET_BOOL(misc, omit0XOnSmallImm)
DEF_MEMBER_GET_SET_BOOL(misc, upperCaseImm)


static PyGetSetDef rabbitizer_global_config_GetSets[] = {
    MEMBER_GET_SET(regNames, namedRegisters, "", NULL),
    MEMBER_GET_SET(regNames, gprAbiNames, "", NULL),
    MEMBER_GET_SET(regNames, fprAbiNames, "", NULL),
    MEMBER_GET_SET(regNames, userFpcCsr, "", NULL),
    MEMBER_GET_SET(regNames, vr4300Cop0NamedRegisters, "", NULL),
    MEMBER_GET_SET(regNames, vr4300RspCop0NamedRegisters, "", NULL),

    MEMBER_GET_SET(pseudos, enablePseudos, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoBeqz, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoBnez, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoB, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoMove, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoNot, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoNegu, "", NULL),
    MEMBER_GET_SET(pseudos, pseudoBal, "", NULL),

    MEMBER_GET_SET(toolchainTweaks, treatJAsUnconditionalBranch, "", NULL),
    MEMBER_GET_SET(toolchainTweaks, sn64DivFix, "", NULL),

    MEMBER_GET_SET(misc, opcodeLJust, "", NULL),
    MEMBER_GET_SET(misc, unknownInstrComment, "", NULL),
    MEMBER_GET_SET(misc, omit0XOnSmallImm, "", NULL),
    MEMBER_GET_SET(misc, upperCaseImm, "", NULL),

    { 0 },
};

PyTypeObject rabbitizer_global_config_TypeObject = {
    PyVarObject_HEAD_INIT(NULL, 0)
    .tp_name = "rabbitizer.config",
    .tp_doc = PyDoc_STR(""),
    .tp_basicsize = sizeof(PyObject),
    .tp_itemsize = 0,
    .tp_flags = Py_TPFLAGS_DEFAULT,
    .tp_new = PyType_GenericNew,
    .tp_getset = rabbitizer_global_config_GetSets,
};
