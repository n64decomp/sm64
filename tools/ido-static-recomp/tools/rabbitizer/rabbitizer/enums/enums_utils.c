/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "enums_utils.h"


int rabbitizer_EnumMetadata_Initialize(PyObject *submodule, RabbitizerEnumMetadata *enumValues) {
    for (size_t i = 0; enumValues[i].enumType != 0; i++) {
        PyObject *args;

        args = Py_BuildValue("ssi", enumValues[i].enumType, enumValues[i].name, enumValues[i].value);
        if (args == NULL) {
            goto error;
        }

        enumValues[i].instance = PyObject_CallObject((PyObject*)&rabbitizer_type_Enum_TypeObject, args);
        Py_DECREF(args);
        if (enumValues[i].instance == NULL) {
            goto error;
        }

        enumValues[i].isInstanced = true;
        if (PyModule_AddObject(submodule, enumValues[i].name, enumValues[i].instance) < 0) {
            goto error;
        }
    }
    return 0;

error:
    for (size_t i = 0; enumValues[i].enumType != 0; i++) {
        if (enumValues[i].isInstanced) {
            Py_DECREF(enumValues[i].instance);
        }
        enumValues[i].isInstanced = false;
    }

    return -1;
}
