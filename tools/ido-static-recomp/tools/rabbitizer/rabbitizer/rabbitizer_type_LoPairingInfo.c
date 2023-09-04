/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "rabbitizer_module.h"


static void rabbitizer_type_LoPairingInfo_dealloc(PyRabbitizerLoPairingInfo *self) {
    Py_TYPE(self)->tp_free((PyObject *) self);
}

static int rabbitizer_type_LoPairingInfo_init(PyRabbitizerLoPairingInfo *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { NULL };

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "", kwlist)) {
        return -1;
    }

    RabbitizerLoPairingInfo_Init(&self->pairingInfo);

    return 0;
}


static PyMemberDef rabbitizer_type_LoPairingInfo_members[] = {
    { "instrOffset", T_INT, offsetof(PyRabbitizerLoPairingInfo, pairingInfo.instrOffset), 0, "" },
    { "value", T_LONG, offsetof(PyRabbitizerLoPairingInfo, pairingInfo.value), 0, "" },
    { "shouldProcess", T_BOOL, offsetof(PyRabbitizerLoPairingInfo, pairingInfo.shouldProcess), 0, "" },
    { "isGpRel", T_BOOL, offsetof(PyRabbitizerLoPairingInfo, pairingInfo.isGpRel), 0, "" },
    { "isGpGot", T_BOOL, offsetof(PyRabbitizerLoPairingInfo, pairingInfo.isGpGot), 0, "" },

    { 0 }
};


PyTypeObject rabbitizer_type_LoPairingInfo_TypeObject = {
    PyVarObject_HEAD_INIT(NULL, 0)
    .tp_name = "rabbitizer.LoPairingInfo",
    .tp_doc = PyDoc_STR("LoPairingInfo"),
    .tp_basicsize = sizeof(PyRabbitizerLoPairingInfo),
    .tp_itemsize = 0,
    .tp_flags = Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,
    .tp_new = PyType_GenericNew,
    .tp_init = (initproc) rabbitizer_type_LoPairingInfo_init,
    .tp_dealloc = (destructor) rabbitizer_type_LoPairingInfo_dealloc,
    // .tp_repr = (reprfunc) rabbitizer_type_LoPairingInfo_repr,
    // .tp_str = (reprfunc) rabbitizer_type_LoPairingInfo_str,
    .tp_members = rabbitizer_type_LoPairingInfo_members,
    // .tp_methods = rabbitizer_type_Instr_methods,
    // .tp_getset = Instr_getsetters,
};
