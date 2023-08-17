/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "rabbitizer_module.h"

#include <stdbool.h>

#include "common/Utils.h"
#include "instructions/RabbitizerInstrId.h"


typedef enum ModuleAttributeCategory {
    MODULE_ATTRIBUTE_CAT_TYPE,
    MODULE_ATTRIBUTE_CAT_INIT, // submodules
    MODULE_ATTRIBUTE_CAT_GLOBAL,
} ModuleAttributeCategory;

typedef struct ModuleAttribute {
    union {
        PyTypeObject *type;
        PyObject *(*init)(void);
        PyTypeObject *global;
    };
    ModuleAttributeCategory cat;
    const char *name;
    bool isInstanced;
    PyObject *instance;
} ModuleAttributes;

#define MODULE_ATTRIBUTE_TYPE(name)   { {.type   = &rabbitizer_type_##name##_TypeObject},   MODULE_ATTRIBUTE_CAT_TYPE,   #name, false, NULL }
#define MODULE_ATTRIBUTE_INIT(name)   { {.init   = rabbitizer_submodule_##name##_Init},     MODULE_ATTRIBUTE_CAT_INIT,   #name, false, NULL }
#define MODULE_ATTRIBUTE_ENUM(name)   { {.init   = rabbitizer_enum_##name##_Init},          MODULE_ATTRIBUTE_CAT_INIT,   #name, false, NULL }
#define MODULE_ATTRIBUTE_GLOBAL(name) { {.global = &rabbitizer_global_##name##_TypeObject}, MODULE_ATTRIBUTE_CAT_GLOBAL, #name, false, NULL }

static ModuleAttributes rabbitizer_module_attributes[] = {
    MODULE_ATTRIBUTE_INIT(Utils),
    MODULE_ATTRIBUTE_GLOBAL(config),
    MODULE_ATTRIBUTE_TYPE(Enum),
    MODULE_ATTRIBUTE_ENUM(Abi),
    MODULE_ATTRIBUTE_ENUM(InstrCategory),
    MODULE_ATTRIBUTE_ENUM(InstrId),
    MODULE_ATTRIBUTE_ENUM(RegGprO32),
    MODULE_ATTRIBUTE_ENUM(RegGprN32),
    MODULE_ATTRIBUTE_TYPE(Instruction),
    MODULE_ATTRIBUTE_TYPE(LoPairingInfo),
    MODULE_ATTRIBUTE_TYPE(TrackedRegisterState),
    MODULE_ATTRIBUTE_TYPE(RegistersTracker),
};

static int rabbitizer_module_attributes_Ready(void) {
    // Sanity checks and PyType_Ready
    for (size_t i = 0; i < ARRAY_COUNT(rabbitizer_module_attributes); i++) {
        if (rabbitizer_module_attributes[i].global == NULL || rabbitizer_module_attributes[i].name == NULL) {
            return -1;
        }
        switch (rabbitizer_module_attributes[i].cat) {
            case MODULE_ATTRIBUTE_CAT_TYPE:
            case MODULE_ATTRIBUTE_CAT_GLOBAL:
                if (PyType_Ready(rabbitizer_module_attributes[i].type) < 0) {
                    return -1;
                }
                break;

            case MODULE_ATTRIBUTE_CAT_INIT:
                break;

            default:
                return -1;
        }
    }

    return 0;
}

static int rabbitizer_module_attributes_Initialize(PyObject *module) {
    for (size_t i = 0; i < ARRAY_COUNT(rabbitizer_module_attributes); i++) {
        switch (rabbitizer_module_attributes[i].cat) {
            case MODULE_ATTRIBUTE_CAT_TYPE:
                rabbitizer_module_attributes[i].instance = (PyObject*) rabbitizer_module_attributes[i].type;
                Py_INCREF(rabbitizer_module_attributes[i].instance);
                break;

            case MODULE_ATTRIBUTE_CAT_INIT:
                rabbitizer_module_attributes[i].instance = rabbitizer_module_attributes[i].init();
                if (rabbitizer_module_attributes[i].instance == NULL) {
                    goto error;
                }
                break;

            case MODULE_ATTRIBUTE_CAT_GLOBAL:
                rabbitizer_module_attributes[i].instance = PyObject_CallObject((PyObject*)rabbitizer_module_attributes[i].global, NULL);
                if (rabbitizer_module_attributes[i].instance == NULL) {
                    goto error;
                }
                break;
        }

        rabbitizer_module_attributes[i].isInstanced = true;
        if (PyModule_AddObject(module, rabbitizer_module_attributes[i].name, rabbitizer_module_attributes[i].instance) < 0) {
            goto error;
        }
    }

    return 0;

error:
    for (size_t i = 0; i < ARRAY_COUNT(rabbitizer_module_attributes); i++) {
        if (rabbitizer_module_attributes[i].isInstanced) {
            Py_DECREF(rabbitizer_module_attributes[i].instance);
        }
        rabbitizer_module_attributes[i].isInstanced = false;
    }
    return -1;
}


static PyModuleDef rabbitizer_module = {
    PyModuleDef_HEAD_INIT,
    .m_name = "rabbitizer",
    .m_doc = "",
    .m_size = -1,
};

PyMODINIT_FUNC PyInit_rabbitizer(void) {
    PyObject *module;

    if (rabbitizer_module_attributes_Ready() < 0) {
        return NULL;
    }

    module = PyModule_Create(&rabbitizer_module);
    if (module == NULL) {
        return NULL;
    }

    if (rabbitizer_module_attributes_Initialize(module) < 0) {
        Py_DECREF(module);
        return NULL;
    }

    return module;
}
