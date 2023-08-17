/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "enums_utils.h"
#include "common/RabbitizerConfig.h"
#include "common/Utils.h"


#define RABBITIZER_DEF_ABI(name) { "Abi", #name, RABBITIZER_ABI_##name, false, NULL }

RabbitizerEnumMetadata rabbitizer_enum_Abi_enumvalues[] = {
    #include "common/Abi.inc"
    RABBITIZER_DEF_ABI(MAX),

    { 0 },
};

#undef RABBITIZER_DEF_ABI


static PyObject *rabbitizer_enum_Abi_fromStr(UNUSED PyObject *self, PyObject *args, PyObject *kwds) {
    static char *kwlist[] = { "name", NULL };
    const char *name = NULL;
    RabbitizerAbi abi;
    PyObject *ret;

    if (!PyArg_ParseTupleAndKeywords(args, kwds, "z", kwlist, &name)) {
        return NULL;
    }

    abi = RabbitizerAbi_fromStr(name);

    ret = rabbitizer_enum_Abi_enumvalues[abi].instance;
    Py_INCREF(ret);
    return ret;
}


#define METHOD_NO_ARGS(name, docs)  { #name, (PyCFunction) rabbitizer_enum_Abi_##name, METH_NOARGS,                  PyDoc_STR(docs) }
#define METHOD_ARGS(name, docs)     { #name, (PyCFunction) rabbitizer_enum_Abi_##name, METH_VARARGS | METH_KEYWORDS, PyDoc_STR(docs) }

static PyMethodDef rabbitizer_enum_Abi_methods[] = {
    METHOD_ARGS(fromStr, ""),

    { 0 },
};

DEF_ENUM(Abi, "")
