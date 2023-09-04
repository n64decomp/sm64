/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "rabbitizer_module.h"


static void rabbitizer_type_TrackedRegisterState_dealloc(PyRabbitizerTrackedRegisterState *self) {
    RabbitizerTrackedRegisterState_destroy(&self->registerState);
    Py_TYPE(self)->tp_free((PyObject *) self);
}

static int rabbitizer_type_TrackedRegisterState_init(PyRabbitizerTrackedRegisterState *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "registerNum", NULL };
    int registerNum;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "i", kwlist, &registerNum)) {
        return -1;
    }

    RabbitizerTrackedRegisterState_init(&self->registerState, registerNum);

    return 0;
}


#define DEF_MEMBER_GET_BOOL(name) \
    static PyObject *rabbitizer_type_TrackedRegisterState_member_get_##name(PyRabbitizerTrackedRegisterState *self, UNUSED PyObject *closure) { \
        if (self->registerState.name) { \
            Py_RETURN_TRUE; \
        } \
        Py_RETURN_FALSE; \
    }

#define DEF_MEMBER_GET_INT(name) \
    static PyObject *rabbitizer_type_TrackedRegisterState_member_get_##name(PyRabbitizerTrackedRegisterState *self, UNUSED PyObject *closure) { \
        return PyLong_FromLong(self->registerState.name); \
    }

#define DEF_MEMBER_GET_UINT(name) \
    static PyObject *rabbitizer_type_TrackedRegisterState_member_get_##name(PyRabbitizerTrackedRegisterState *self, UNUSED PyObject *closure) { \
        return PyLong_FromUnsignedLong(self->registerState.name); \
    }


DEF_MEMBER_GET_INT(registerNum)

DEF_MEMBER_GET_BOOL(hasLuiValue)
DEF_MEMBER_GET_INT(luiOffset)
DEF_MEMBER_GET_BOOL(luiSetOnBranchLikely)

DEF_MEMBER_GET_BOOL(hasGpGot)
DEF_MEMBER_GET_INT(gpGotOffset)

DEF_MEMBER_GET_BOOL(hasLoValue)
DEF_MEMBER_GET_INT(loOffset)
DEF_MEMBER_GET_BOOL(dereferenced)
DEF_MEMBER_GET_INT(dereferenceOffset)

DEF_MEMBER_GET_UINT(value)


#define MEMBER_GET(name, docs, closure)      { #name, (getter) rabbitizer_type_TrackedRegisterState_member_get_##name, (setter) NULL,                                                   PyDoc_STR(docs), closure }
#define MEMBER_SET(name, docs, closure)      { #name, (getter) NULL,                                                   (setter) rabbitizer_type_TrackedRegisterState_member_set_##name, PyDoc_STR(docs), closure }
#define MEMBER_GET_SET(name, docs, closure)  { #name, (getter) rabbitizer_type_TrackedRegisterState_member_get_##name, (setter) rabbitizer_type_TrackedRegisterState_member_set_##name, PyDoc_STR(docs), closure }


static PyGetSetDef rabbitizer_type_TrackedRegisterState_getsetters[] = {
    MEMBER_GET(registerNum, "", NULL),

    MEMBER_GET(hasLuiValue, "", NULL),
    MEMBER_GET(luiOffset, "", NULL),
    MEMBER_GET(luiSetOnBranchLikely, "", NULL),

    MEMBER_GET(hasGpGot, "", NULL),
    MEMBER_GET(gpGotOffset, "", NULL),

    MEMBER_GET(hasLoValue, "", NULL),
    MEMBER_GET(loOffset, "", NULL),
    MEMBER_GET(dereferenced, "", NULL),
    MEMBER_GET(dereferenceOffset, "", NULL),

    MEMBER_GET(value, "", NULL),

    { 0 }
};


PyTypeObject rabbitizer_type_TrackedRegisterState_TypeObject = {
    PyVarObject_HEAD_INIT(NULL, 0)
    .tp_name = "rabbitizer.TrackedRegisterState",
    .tp_doc = PyDoc_STR("TrackedRegisterState"),
    .tp_basicsize = sizeof(PyRabbitizerTrackedRegisterState),
    .tp_itemsize = 0,
    .tp_flags = Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,
    .tp_new = PyType_GenericNew,
    .tp_init = (initproc) rabbitizer_type_TrackedRegisterState_init,
    .tp_dealloc = (destructor) rabbitizer_type_TrackedRegisterState_dealloc,
    // .tp_repr = (reprfunc) rabbitizer_type_TrackedRegisterState_repr,
    // .tp_str = (reprfunc) rabbitizer_type_TrackedRegisterState_str,
    // .tp_methods = rabbitizer_type_TrackedRegisterState_methods,
    .tp_getset = rabbitizer_type_TrackedRegisterState_getsetters,
};
