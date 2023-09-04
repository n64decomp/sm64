# SPDX-FileCopyrightText: © 2022 Decompollaborate
# SPDX-License-Identifier: MIT

from setuptools import setup, Extension


setup(
    ext_modules=[
        Extension(
            name="rabbitizer",
            sources=["rabbitizer/rabbitizer_module.c", "rabbitizer/rabbitizer_submodule_Utils.c", "rabbitizer/rabbitizer_type_Instruction.c", "rabbitizer/rabbitizer_global_config.c", "rabbitizer/rabbitizer_type_TrackedRegisterState.c", "rabbitizer/rabbitizer_type_RegistersTracker.c", "rabbitizer/rabbitizer_type_LoPairingInfo.c",
            "rabbitizer/enums/rabbitizer_type_Enum.c", "rabbitizer/enums/enums_utils.c", "rabbitizer/enums/rabbitizer_enum_InstrCategory.c", "rabbitizer/enums/rabbitizer_enum_InstrId.c", "rabbitizer/enums/rabbitizer_enum_Abi.c",
            "rabbitizer/enums/registers/rabbitizer_enum_GprO32.c", "rabbitizer/enums/registers/rabbitizer_enum_GprN32.c",
            "src/instructions/RabbitizerInstruction/RabbitizerInstruction_Disassemble.c", "src/instructions/RabbitizerInstruction/RabbitizerInstruction_ProcessUniqueId.c", "src/instructions/RabbitizerInstruction/RabbitizerInstruction.c", "src/instructions/RabbitizerInstruction/RabbitizerInstruction_Examination.c",
            "src/instructions/RabbitizerInstructionRsp/RabbitizerInstructionRsp.c", "src/instructions/RabbitizerInstructionRsp/RabbitizerInstructionRsp_ProcessUniqueId.c",
            "src/instructions/RabbitizerInstructionR5900/RabbitizerInstructionR5900.c", "src/instructions/RabbitizerInstructionR5900/RabbitizerInstructionR5900_ProcessUniqueId.c",
            "src/instructions/RabbitizerInstrDescriptor.c", "src/instructions/RabbitizerInstrId.c", "src/instructions/RabbitizerRegister.c", "src/instructions/RabbitizerInstrSuffix.c",
            "src/analysis/RabbitizerTrackedRegisterState.c", "src/analysis/RabbitizerRegistersTracker.c", "src/analysis/RabbitizerLoPairingInfo.c",
            "src/common/Utils.c", "src/common/RabbitizerVersion.c", "src/common/RabbitizerConfig.c"],
            include_dirs=["include", "rabbitizer"],
            extra_compile_args = [
                "-std=c11",
                "-Wall",
                "-g",
            ],
        ),
    ],
)
