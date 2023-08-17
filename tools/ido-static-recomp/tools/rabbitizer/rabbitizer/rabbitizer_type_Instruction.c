/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "rabbitizer_module.h"

#include "instructions/RabbitizerInstructionRsp.h"
#include "instructions/RabbitizerInstructionR5900.h"
#include "common/RabbitizerConfig.h"


static void rabbitizer_type_Instruction_dealloc(PyRabbitizerInstruction *self) {
    RabbitizerInstruction_destroy(&self->instr);
    Py_TYPE(self)->tp_free((PyObject *) self);
}

static int rabbitizer_type_Instruction_init(PyRabbitizerInstruction *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "word", "vram", "category", NULL };
    uint32_t word;
    uint32_t vram;
    PyObject *category = NULL;
    int enumCheck;
    RabbitizerInstrCategory instrCategory = RABBITIZER_INSTRCAT_CPU;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "I|IO!", kwlist, &word, &vram, &rabbitizer_type_Enum_TypeObject, &category)) {
        return -1;
    }

    if (category != NULL) {
        enumCheck = rabbitizer_enum_InstrCategory_Check(category);

        if (enumCheck <= 0) {
            if (enumCheck == 0) {
                PyErr_SetString(PyExc_ValueError, "Invalid value for 'category' parameter");
            }
            return -1;
        }

        instrCategory = ((PyRabbitizerEnum*)category)->value;
    }

    switch (instrCategory) {
        case RABBITIZER_INSTRCAT_RSP:
            RabbitizerInstructionRsp_init(&self->instr, word, vram);
            RabbitizerInstructionRsp_processUniqueId(&self->instr);
            break;

        case RABBITIZER_INSTRCAT_R5900:
            RabbitizerInstructionR5900_init(&self->instr, word, vram);
            RabbitizerInstructionR5900_processUniqueId(&self->instr);
            break;

        case RABBITIZER_INSTRCAT_CPU:
        case RABBITIZER_INSTRCAT_MAX:
            RabbitizerInstruction_init(&self->instr, word, vram);
            RabbitizerInstruction_processUniqueId(&self->instr);
            break;
    }

    return 0;
}

static PyMemberDef rabbitizer_type_Instruction_members[] = {
    { "vram", T_UINT, offsetof(PyRabbitizerInstruction, instr.vram), 0, "vram description" },
    { "inHandwrittenFunction", T_BOOL, offsetof(PyRabbitizerInstruction, instr.inHandwrittenFunction), 0, "inHandwrittenFunction description" },

    { 0 }
};


#define DEF_MEMBER_GET_UINT(name) \
    static PyObject *rabbitizer_type_Instruction_member_get_##name(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) { \
        return PyLong_FromUnsignedLong(RAB_INSTR_GET_##name(&self->instr)); \
    }

#define DEF_MEMBER_GET_REGGPR(name) \
    static PyObject *rabbitizer_type_Instruction_member_get_##name(PyRabbitizerInstruction *self, UNUSED PyObject *closure) { \
        uint32_t reg; \
        PyObject *enumInstance = NULL; \
        \
        if (!RabbitizerInstruction_hasOperandAlias(&self->instr, RAB_OPERAND_cpu_##name)) { \
            PyErr_Format(PyExc_RuntimeError, "'%s' instruction does not reference register '" #name "'", RabbitizerInstrId_getOpcodeName(self->instr.uniqueId)); \
            return NULL; \
        } \
        \
        reg = RAB_INSTR_GET_##name(&self->instr); \
        switch (RabbitizerConfig_Cfg.regNames.gprAbiNames) { \
            case RABBITIZER_ABI_N32: \
            case RABBITIZER_ABI_N64: \
                enumInstance = rabbitizer_enum_RegGprN32_enumvalues[reg].instance; \
                break; \
        \
            default: \
                enumInstance = rabbitizer_enum_RegGprO32_enumvalues[reg].instance; \
                break; \
        } \
        \
        if (enumInstance == NULL) { \
            PyErr_SetString(PyExc_RuntimeError, "Internal error: invalid RegGpr enum value"); \
            return NULL; \
        } \
        \
        Py_INCREF(enumInstance); \
        return enumInstance; \
    }

DEF_MEMBER_GET_REGGPR(rs)
DEF_MEMBER_GET_REGGPR(rt)
DEF_MEMBER_GET_REGGPR(rd)

DEF_MEMBER_GET_UINT(sa)

static PyObject *rabbitizer_type_Instruction_member_get_uniqueId(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) {
    PyObject *enumInstance = rabbitizer_enum_InstrId_enumvalues[self->instr.uniqueId].instance;

    if (enumInstance == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "Internal error: invalid uniqueId enum value");
        return NULL;
    }

    Py_INCREF(enumInstance);
    return enumInstance;
}

#define MEMBER_GET(name, docs, closure)      { #name, (getter) rabbitizer_type_Instruction_member_get_##name, (setter) NULL,                                          PyDoc_STR(docs), closure }
#define MEMBER_SET(name, docs, closure)      { #name, (getter) NULL,                                          (setter) rabbitizer_type_Instruction_member_set_##name, PyDoc_STR(docs), closure }
#define MEMBER_GET_SET(name, docs, closure)  { #name, (getter) rabbitizer_type_Instruction_member_get_##name, (setter) rabbitizer_type_Instruction_member_set_##name, PyDoc_STR(docs), closure }


static PyGetSetDef rabbitizer_type_Instruction_getsetters[] = {
    MEMBER_GET(rs, "", NULL),
    MEMBER_GET(rt, "", NULL),
    MEMBER_GET(rd, "", NULL),
    MEMBER_GET(sa, "", NULL),
    MEMBER_GET(uniqueId, "", NULL),

    { 0 }
};


#define DEF_METHOD_GET_UINT(name) \
    static PyObject *rabbitizer_type_Instruction_##name(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) { \
        return PyLong_FromUnsignedLong(RabbitizerInstruction_##name(&self->instr)); \
    }

#define DEF_METHOD_GET_INT(name) \
    static PyObject *rabbitizer_type_Instruction_##name(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) { \
        return PyLong_FromLong(RabbitizerInstruction_##name(&self->instr)); \
    }

DEF_METHOD_GET_UINT(getRaw)
DEF_METHOD_GET_UINT(getImmediate)
DEF_METHOD_GET_INT(getProcessedImmediate)
DEF_METHOD_GET_UINT(getInstrIndexAsVram)
DEF_METHOD_GET_INT(getBranchOffset)

static PyObject *rabbitizer_type_Instruction_getOpcodeName(PyRabbitizerInstruction *self, UNUSED PyObject *closure) {
    return PyUnicode_FromString(RabbitizerInstrId_getOpcodeName(self->instr.uniqueId));
}

static PyObject *rabbitizer_type_Instruction_getGenericBranchOffset(PyRabbitizerInstruction *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "currentVram", NULL };
    uint32_t currentVram;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "I", kwlist, &currentVram)) {
        return NULL;
    }

    return PyLong_FromLong(RabbitizerInstruction_getGenericBranchOffset(&self->instr, currentVram));
}

static PyObject *rabbitizer_type_Instruction_blankOut(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) {
    RabbitizerInstruction_blankOut(&self->instr);
    Py_RETURN_NONE;
}


#define DEF_METHOD_BOOL(name) \
    static PyObject *rabbitizer_type_Instruction_##name(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) { \
        if (RabbitizerInstruction_##name(&self->instr)) { \
            Py_RETURN_TRUE; \
        } \
        Py_RETURN_FALSE; \
    }

DEF_METHOD_BOOL(isImplemented)
DEF_METHOD_BOOL(isLikelyHandwritten)
DEF_METHOD_BOOL(isNop)
DEF_METHOD_BOOL(isUnconditionalBranch)
DEF_METHOD_BOOL(isJrRa)
DEF_METHOD_BOOL(isJrNotRa)
DEF_METHOD_BOOL(hasDelaySlot)

static PyObject *rabbitizer_type_Instruction_mapInstrToType(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) {
    const char *type = RabbitizerInstruction_mapInstrToType(&self->instr);

    if (type != NULL) {
        return PyUnicode_FromString(type);
    }
    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_Instruction_sameOpcode(PyRabbitizerInstruction *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "other", NULL };
    PyRabbitizerInstruction *other;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &other)) {
        return NULL;
    }

    if (RabbitizerInstruction_sameOpcode(&self->instr, &other->instr)) {
        Py_RETURN_TRUE;
    }
    Py_RETURN_FALSE;
}

static PyObject *rabbitizer_type_Instruction_sameOpcodeButDifferentArguments(PyRabbitizerInstruction *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "other", NULL };
    PyRabbitizerInstruction *other;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &other)) {
        return NULL;
    }

    if (RabbitizerInstruction_sameOpcodeButDifferentArguments(&self->instr, &other->instr)) {
        Py_RETURN_TRUE;
    }
    Py_RETURN_FALSE;
}

DEF_METHOD_BOOL(isValid)

#define DEF_DESCRIPTOR_METHOD_BOOL(name) \
    static PyObject *rabbitizer_type_Instruction_##name(PyRabbitizerInstruction *self, PyObject *Py_UNUSED(ignored)) { \
        if (RabbitizerInstrDescriptor_##name(self->instr.descriptor)) { \
            Py_RETURN_TRUE; \
        } \
        Py_RETURN_FALSE; \
    }

DEF_DESCRIPTOR_METHOD_BOOL(isUnknownType)
DEF_DESCRIPTOR_METHOD_BOOL(isJType)
DEF_DESCRIPTOR_METHOD_BOOL(isIType)
DEF_DESCRIPTOR_METHOD_BOOL(isRType)
DEF_DESCRIPTOR_METHOD_BOOL(isRegimmType)
DEF_DESCRIPTOR_METHOD_BOOL(isBranch)
DEF_DESCRIPTOR_METHOD_BOOL(isBranchLikely)
DEF_DESCRIPTOR_METHOD_BOOL(isJump)
DEF_DESCRIPTOR_METHOD_BOOL(isTrap)
DEF_DESCRIPTOR_METHOD_BOOL(isFloat)
DEF_DESCRIPTOR_METHOD_BOOL(isDouble)
DEF_DESCRIPTOR_METHOD_BOOL(isUnsigned)
DEF_DESCRIPTOR_METHOD_BOOL(modifiesRt)
DEF_DESCRIPTOR_METHOD_BOOL(modifiesRd)
DEF_DESCRIPTOR_METHOD_BOOL(notEmitedByCompilers)
DEF_DESCRIPTOR_METHOD_BOOL(canBeHi)
DEF_DESCRIPTOR_METHOD_BOOL(canBeLo)
DEF_DESCRIPTOR_METHOD_BOOL(doesLink)
DEF_DESCRIPTOR_METHOD_BOOL(doesDereference)
DEF_DESCRIPTOR_METHOD_BOOL(doesLoad)
DEF_DESCRIPTOR_METHOD_BOOL(doesStore)
DEF_DESCRIPTOR_METHOD_BOOL(maybeIsMove)
DEF_DESCRIPTOR_METHOD_BOOL(isPseudo)
// TODO: create an enum type for architectureVersion
// architectureVersion


static PyObject *rabbitizer_type_Instruction_disassemble(PyRabbitizerInstruction *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = {"immOverride", "extraLJust", NULL};
    const char *immOverride = NULL;
    size_t immOverrideLength = 0;
    int extraLJust = 0;
    size_t bufferSize;
    char *buffer;
    PyObject *ret;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "|zi", kwlist, &immOverride, &extraLJust)) {
        return NULL;
    }

    if (immOverride != NULL) {
        immOverrideLength = strlen(immOverride);
    }

    bufferSize = RabbitizerInstruction_getSizeForBuffer(&self->instr, immOverrideLength, extraLJust);

    buffer = malloc(bufferSize+1);
    if (buffer == NULL) {
        // TODO: signal an exception?
        return NULL;
    }

    RabbitizerInstruction_disassemble(&self->instr, buffer, immOverride, immOverrideLength, extraLJust);

    ret = PyUnicode_FromString(buffer);
    free(buffer);
    return ret;
}


// To allow piclking the object
static PyObject *rabbitizer_type_Instruction___reduce__(PyRabbitizerInstruction *self, UNUSED PyObject *closure) {
    PyObject *args;
    PyObject *word;
    PyObject *vram;
    PyObject *category;

    word = PyLong_FromUnsignedLong(RabbitizerInstruction_getRaw(&self->instr));
    vram = PyLong_FromUnsignedLong(self->instr.vram);
    category = rabbitizer_enum_InstrCategory_enumvalues[self->instr.category].instance;

    args = PyTuple_Pack(3, word, vram, category);

    return PyTuple_Pack(2, (PyObject*)&rabbitizer_type_Instruction_TypeObject, args);
}


#define METHOD_NO_ARGS(name, docs)  { #name, (PyCFunction)rabbitizer_type_Instruction_##name, METH_NOARGS,                  PyDoc_STR(docs) }
#define METHOD_ARGS(name, docs)     { #name, (PyCFunction)rabbitizer_type_Instruction_##name, METH_VARARGS | METH_KEYWORDS, PyDoc_STR(docs) }


static PyMethodDef rabbitizer_type_Instruction_methods[] = {
    METHOD_NO_ARGS(getRaw, ""),
    METHOD_NO_ARGS(getImmediate, ""),
    METHOD_NO_ARGS(getProcessedImmediate, ""),
    METHOD_NO_ARGS(getInstrIndexAsVram, ""),
    METHOD_NO_ARGS(getBranchOffset, ""),
    METHOD_ARGS(getGenericBranchOffset, ""),
    METHOD_NO_ARGS(getOpcodeName, ""),

    METHOD_NO_ARGS(blankOut, ""),

    METHOD_NO_ARGS(isImplemented, ""),
    METHOD_NO_ARGS(isLikelyHandwritten, ""),
    METHOD_NO_ARGS(isNop, ""),
    METHOD_NO_ARGS(isUnconditionalBranch, ""),
    METHOD_NO_ARGS(isJrRa, ""),
    METHOD_NO_ARGS(isJrNotRa, ""),
    METHOD_NO_ARGS(hasDelaySlot, ""),
    METHOD_NO_ARGS(mapInstrToType, ""),

    METHOD_ARGS(sameOpcode, "description"),
    METHOD_ARGS(sameOpcodeButDifferentArguments, "description"),

    METHOD_NO_ARGS(isValid, ""),

    METHOD_NO_ARGS(isUnknownType, ""),
    METHOD_NO_ARGS(isJType, ""),
    METHOD_NO_ARGS(isIType, ""),
    METHOD_NO_ARGS(isRType, ""),
    METHOD_NO_ARGS(isRegimmType, ""),
    METHOD_NO_ARGS(isBranch, ""),
    METHOD_NO_ARGS(isBranchLikely, ""),
    METHOD_NO_ARGS(isJump, ""),
    METHOD_NO_ARGS(isTrap, ""),
    METHOD_NO_ARGS(isFloat, ""),
    METHOD_NO_ARGS(isDouble, ""),
    METHOD_NO_ARGS(isUnsigned, ""),
    METHOD_NO_ARGS(modifiesRt, ""),
    METHOD_NO_ARGS(modifiesRd, ""),
    METHOD_NO_ARGS(notEmitedByCompilers, ""),
    METHOD_NO_ARGS(canBeHi, ""),
    METHOD_NO_ARGS(canBeLo, ""),
    METHOD_NO_ARGS(doesLink, ""),
    METHOD_NO_ARGS(doesDereference, ""),
    METHOD_NO_ARGS(doesLoad, ""),
    METHOD_NO_ARGS(doesStore, ""),
    METHOD_NO_ARGS(maybeIsMove, ""),
    METHOD_NO_ARGS(isPseudo, ""),
    // METHOD_NO_ARGS(getArchitectureVersion, ""),

    METHOD_ARGS(disassemble, "description"),

    METHOD_ARGS(__reduce__, ""),

    { 0 },
};


static PyObject *rabbitizer_type_Instruction_repr(PyRabbitizerInstruction *self) {
    PyObject *ret;
    size_t disasmBufferSize;
    char *bufferStart;
    char *buffer;
    size_t typeNameLength;
    size_t extraSize = 3 + 8 + 4; // "(0x" + 32bits hex + ") # "
    int len;

    typeNameLength = strlen("rabbitizer.Instruction");

    disasmBufferSize = RabbitizerInstruction_getSizeForBuffer(&self->instr, 0, 0);

    buffer = bufferStart = malloc(disasmBufferSize+1 + typeNameLength + extraSize);
    if (buffer == NULL) {
        // TODO: signal an exception?
        return NULL;
    }

    memcpy(buffer, "rabbitizer.Instruction", typeNameLength);
    buffer += typeNameLength;

    len = sprintf(buffer, "(0x%08X) # ", RabbitizerInstruction_getRaw(&self->instr));
    if (len != 15) {
        // bad stuff
        // TODO: exception?
    }
    assert(len == 15);
    buffer += len;

    RabbitizerInstruction_disassemble(&self->instr, buffer, NULL, 0, 0);

    ret = PyUnicode_FromString(bufferStart);
    free(bufferStart);
    return ret;
}

static PyObject *rabbitizer_type_Instruction_str(PyRabbitizerInstruction *self) {
    return rabbitizer_type_Instruction_disassemble(self, Py_BuildValue("()"), Py_BuildValue("{}"));
}


PyTypeObject rabbitizer_type_Instruction_TypeObject = {
    PyVarObject_HEAD_INIT(NULL, 0)
    .tp_name = "rabbitizer.Instruction",
    .tp_doc = PyDoc_STR("Instruction"),
    .tp_basicsize = sizeof(PyRabbitizerInstruction),
    .tp_itemsize = 0,
    .tp_flags = Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,
    .tp_new = PyType_GenericNew,
    .tp_init = (initproc) rabbitizer_type_Instruction_init,
    .tp_dealloc = (destructor) rabbitizer_type_Instruction_dealloc,
    .tp_repr = (reprfunc) rabbitizer_type_Instruction_repr,
    .tp_str = (reprfunc) rabbitizer_type_Instruction_str,
    .tp_members = rabbitizer_type_Instruction_members,
    .tp_methods = rabbitizer_type_Instruction_methods,
    .tp_getset = rabbitizer_type_Instruction_getsetters,
};
