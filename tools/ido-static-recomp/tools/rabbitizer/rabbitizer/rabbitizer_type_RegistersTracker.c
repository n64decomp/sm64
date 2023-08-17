/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "rabbitizer_module.h"

#include "analysis/RabbitizerRegistersTracker.h"


typedef struct PyRabbitizerRegistersTracker {
    PyObject_HEAD
    RabbitizerRegistersTracker tracker;
} PyRabbitizerRegistersTracker;


static void rabbitizer_type_RegistersTracker_dealloc(PyRabbitizerRegistersTracker *self) {
    RabbitizerRegistersTracker_destroy(&self->tracker);
    Py_TYPE(self)->tp_free((PyObject *) self);
}

static int rabbitizer_type_RegistersTracker_init(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "other", NULL };
    PyRabbitizerRegistersTracker *pyOther = NULL;
    RabbitizerRegistersTracker *other = NULL;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "|O!", kwlist, &rabbitizer_type_RegistersTracker_TypeObject, &pyOther)) {
        return -1;
    }

    if (pyOther != NULL) {
        other = &pyOther->tracker;
    }

    RabbitizerRegistersTracker_init(&self->tracker, other);

    return 0;
}


static PyObject *rabbitizer_type_RegistersTracker_moveRegisters(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", NULL };
    PyRabbitizerInstruction *instr;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr)) {
        return NULL;
    }

    if (RabbitizerRegistersTracker_moveRegisters(&self->tracker, &instr->instr)) {
        Py_RETURN_TRUE;
    }
    Py_RETURN_FALSE;
}

static PyObject *rabbitizer_type_RegistersTracker_overwriteRegisters(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    int instrOffset;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!i", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &instrOffset)) {
        return NULL;
    }

    RabbitizerRegistersTracker_overwriteRegisters(&self->tracker, &instr->instr, instrOffset);

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_unsetRegistersAfterFuncCall(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "prevInstr", NULL };
    PyRabbitizerInstruction *instr;
    PyRabbitizerInstruction *prevInstr;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &rabbitizer_type_Instruction_TypeObject, &prevInstr)) {
        return NULL;
    }

    RabbitizerRegistersTracker_unsetRegistersAfterFuncCall(&self->tracker, &instr->instr, &prevInstr->instr);

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_getAddressIfCanSetType(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    int instrOffset;
    uint32_t dstAddress = 0;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!i", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &instrOffset)) {
        return NULL;
    }

    if (RabbitizerRegistersTracker_getAddressIfCanSetType(&self->tracker, &instr->instr, instrOffset, &dstAddress)) {
        return PyLong_FromLong(dstAddress);
    }

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_getJrInfo(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", NULL };
    PyRabbitizerInstruction *instr;
    int dstOffset = 0;
    uint32_t dstAddress = 0;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr)) {
        return NULL;
    }

    if (RabbitizerRegistersTracker_getJrInfo(&self->tracker, &instr->instr, &dstOffset, &dstAddress)) {
        return PyTuple_Pack(2, PyLong_FromLong(dstOffset), PyLong_FromLong(dstAddress));
    }

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_processLui(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "instrOffset", "prevInstr", NULL };
    PyRabbitizerInstruction *instr;
    int instrOffset;
    PyRabbitizerInstruction *pyPrevInstr = NULL;
    RabbitizerInstruction *prevInstr = NULL;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!i|O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &instrOffset, &rabbitizer_type_Instruction_TypeObject, &pyPrevInstr)) {
        return NULL;
    }

    if (pyPrevInstr != NULL) {
        prevInstr = &pyPrevInstr->instr;
    }

    RabbitizerRegistersTracker_processLui(&self->tracker, &instr->instr, instrOffset, prevInstr);

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_processGpLoad(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    int instrOffset;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!i", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &instrOffset)) {
        return NULL;
    }

    RabbitizerRegistersTracker_processGpLoad(&self->tracker, &instr->instr, instrOffset);

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_getLuiOffsetForConstant(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", NULL };
    PyRabbitizerInstruction *instr;
    int dstOffset = 0;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr)) {
        return NULL;
    }

    if (RabbitizerRegistersTracker_getLuiOffsetForConstant(&self->tracker, &instr->instr, &dstOffset)) {
        return PyLong_FromLong(dstOffset);
    }

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_processConstant(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "value", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    uint32_t value;
    int instrOffset;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!Ii", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &value, &instrOffset)) {
        return NULL;
    }

    RabbitizerRegistersTracker_processConstant(&self->tracker, &instr->instr, value, instrOffset);

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_getLuiOffsetForLo(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    int instrOffset;
    int dstOffset = 0;
    bool dstIsGp = false;
    bool validResults = false;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!i", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &instrOffset)) {
        return NULL;
    }

    validResults = RabbitizerRegistersTracker_getLuiOffsetForLo(&self->tracker, &instr->instr, instrOffset, &dstOffset, &dstIsGp);

    return PyTuple_Pack(3, PyLong_FromLong(dstOffset), PyBool_FromLong(dstIsGp), PyBool_FromLong(validResults));
}

static PyObject *rabbitizer_type_RegistersTracker_preprocessLoAndGetInfo(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    int instrOffset;
    PyRabbitizerLoPairingInfo *ret;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!i", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &instrOffset)) {
        return NULL;
    }

    ret = PyObject_CallObject((PyObject*)&rabbitizer_type_LoPairingInfo_TypeObject, NULL);
    if (ret == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "Internal error: not able to instance LoPairingInfo object");
        return NULL;
    }

    ret->pairingInfo = RabbitizerRegistersTracker_preprocessLoAndGetInfo(&self->tracker, &instr->instr, instrOffset);

    return ret;
}

static PyObject *rabbitizer_type_RegistersTracker_processLo(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", "value", "instrOffset", NULL };
    PyRabbitizerInstruction *instr;
    uint32_t value;
    int instrOffset;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!Ii", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr, &value, &instrOffset)) {
        return NULL;
    }

    RabbitizerRegistersTracker_processLo(&self->tracker, &instr->instr, value, instrOffset);

    Py_RETURN_NONE;
}

static PyObject *rabbitizer_type_RegistersTracker_hasLoButNoHi(PyRabbitizerRegistersTracker *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "instr", NULL };
    PyRabbitizerInstruction *instr;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &rabbitizer_type_Instruction_TypeObject, &instr)) {
        return NULL;
    }

    if (RabbitizerRegistersTracker_hasLoButNoHi(&self->tracker, &instr->instr)) {
        Py_RETURN_TRUE;
    }
    Py_RETURN_FALSE;
}


#define METHOD_NO_ARGS(name, docs)  { #name, (PyCFunction)rabbitizer_type_RegistersTracker_##name, METH_NOARGS,                  PyDoc_STR(docs) }
#define METHOD_ARGS(name, docs)     { #name, (PyCFunction)rabbitizer_type_RegistersTracker_##name, METH_VARARGS | METH_KEYWORDS, PyDoc_STR(docs) }

static PyMethodDef rabbitizer_type_RegistersTracker_methods[] = {
    METHOD_ARGS(moveRegisters, ""),
    METHOD_ARGS(overwriteRegisters, ""),
    METHOD_ARGS(unsetRegistersAfterFuncCall, ""),
    METHOD_ARGS(getAddressIfCanSetType, ""),
    METHOD_ARGS(getJrInfo, ""),
    METHOD_ARGS(processLui, ""),
    METHOD_ARGS(processGpLoad, ""),
    METHOD_ARGS(getLuiOffsetForConstant, ""),
    METHOD_ARGS(processConstant, ""),
    METHOD_ARGS(getLuiOffsetForLo, ""),
    METHOD_ARGS(preprocessLoAndGetInfo, ""),
    METHOD_ARGS(processLo, ""),
    METHOD_ARGS(hasLoButNoHi, ""),

    { 0 },
};


PyObject *rabbitizer_type_RegistersTracker___getitem__(PyRabbitizerRegistersTracker* self, Py_ssize_t index) {
    RabbitizerTrackedRegisterState *state;
    PyObject *args;
    PyRabbitizerTrackedRegisterState *pyState;

    if (index < 0 || index >= ARRAY_COUNT(self->tracker.registers)) {
        PyErr_SetString(PyExc_IndexError, "Index must be a value between 0 and 31");
        return NULL;
    }

    state = &self->tracker.registers[index];

    args = Py_BuildValue("(i)", state->registerNum);
    if (args == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "Internal error: not able to instance TrackedRegisterState parameters");
        return NULL;
    }

    pyState = PyObject_CallObject((PyObject*)&rabbitizer_type_TrackedRegisterState_TypeObject, args);
    Py_DECREF(args);
    if (pyState == NULL) {
        PyErr_SetString(PyExc_RuntimeError, "Internal error: not able to instance TrackedRegisterState object");
        return NULL;
    }

    RabbitizerTrackedRegisterState_copyState(&pyState->registerState, state);
    return pyState;
}


static PySequenceMethods example_classSeqMethods = {
	.sq_item = (ssizeargfunc)rabbitizer_type_RegistersTracker___getitem__, // sq_item
};


PyTypeObject rabbitizer_type_RegistersTracker_TypeObject = {
    PyVarObject_HEAD_INIT(NULL, 0)
    .tp_name = "rabbitizer.RegistersTracker",
    .tp_doc = PyDoc_STR("RegistersTracker"),
    .tp_basicsize = sizeof(PyRabbitizerRegistersTracker),
    .tp_itemsize = 0,
    .tp_flags = Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,
    .tp_new = PyType_GenericNew,
    .tp_init = (initproc) rabbitizer_type_RegistersTracker_init,
    .tp_dealloc = (destructor) rabbitizer_type_RegistersTracker_dealloc,
    // .tp_repr = (reprfunc) rabbitizer_type_RegistersTracker_repr,
    .tp_as_sequence = &example_classSeqMethods,
    // .tp_str = (reprfunc) rabbitizer_type_RegistersTracker_str,
    .tp_methods = rabbitizer_type_RegistersTracker_methods,
    // .tp_getset = rabbitizer_type_RegistersTracker_getsetters,
};
