/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#include "instructions/RabbitizerInstruction.h"
#include "instructions/RabbitizerInstructionRsp.h"
#include "instructions/RabbitizerInstructionR5900.h"

#include <assert.h>
#include <string.h>
#include <stdio.h>

#include "common/Utils.h"
#include "common/RabbitizerConfig.h"
#include "instructions/RabbitizerRegister.h"
#include "instructions/RabbitizerInstrSuffix.h"

typedef size_t (*OperandCallback)(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength);

size_t RabbitizerOperandType_process_cpu_rs(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameGpr(RAB_INSTR_GET_rs(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_rt(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameGpr(RAB_INSTR_GET_rt(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_rd(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameGpr(RAB_INSTR_GET_rd(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_zero(UNUSED const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride,
                                              UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameGpr(0);

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_cop0d(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameCop0(RAB_INSTR_GET_cop0d(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_fs(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameCop1(RAB_INSTR_GET_fs(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_ft(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameCop1(RAB_INSTR_GET_ft(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_fd(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameCop1(RAB_INSTR_GET_fd(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_cop1cs(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameCop1Control(RAB_INSTR_GET_cop1cs(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_cop2t(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameCop2(RAB_INSTR_GET_cop2t(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_sa(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

// TODO: consider making this a proper configuration
#if 0
    if (RAB_INSTR_GET_sa(self) < 10) {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", RAB_INSTR_GET_sa(self));
    } else {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%x", RAB_INSTR_GET_sa(self));
    }
#endif
    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", RAB_INSTR_GET_sa(self));
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_op(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

// TODO: consider making this a proper configuration
#if 0
    if (RAB_INSTR_GET_op(self) < 10) {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", RAB_INSTR_GET_op(self));
    } else {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%x", RAB_INSTR_GET_op(self));
    }
#endif
    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%02X", RAB_INSTR_GET_op(self));
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_code(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    int code = RAB_INSTR_GET_code_upper(self);
    int lower = RAB_INSTR_GET_code_lower(self);

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", code);
    if (lower) {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, ", %i", lower);
    }

    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_code_lower(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride,
                                                    UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    int code_lower = RAB_INSTR_GET_code_lower(self);

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", code_lower);

    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_copraw(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%X", RAB_INSTR_GET_copraw(self));

    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_label(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    if ((immOverride != NULL) && (immOverrideLength > 0)) {
        memcpy(dst, immOverride, immOverrideLength);
        return immOverrideLength;
    }

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "func_%06X", RabbitizerInstruction_getInstrIndexAsVram(self));
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_immediate(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    int32_t number;

    if ((immOverride != NULL) && (immOverrideLength > 0)) {
        memcpy(dst, immOverride, immOverrideLength);
        return immOverrideLength;
    }

    number = RabbitizerInstruction_getProcessedImmediate(self);
    if (RabbitizerConfig_Cfg.misc.omit0XOnSmallImm) {
        if (number > -10 && number < 10) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", number);
            return totalSize;
        }
    }
    if (number < 0) {
        if (RabbitizerConfig_Cfg.misc.upperCaseImm) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "-0x%X", -number);
        } else {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "-0x%x", -number);
        }
    } else {
        if (RabbitizerConfig_Cfg.misc.upperCaseImm) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%X", number);
        } else {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%x", number);
        }
    }
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_branch_target_label(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    if ((immOverride != NULL) && (immOverrideLength > 0)) {
        memcpy(dst, immOverride, immOverrideLength);
        return immOverrideLength;
    }

    RABUTILS_BUFFER_CPY(dst, totalSize, ". + 4 + (");
    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_cpu_immediate(self, dst, NULL, 0));
    RABUTILS_BUFFER_CPY(dst, totalSize, " << 2)");
    return totalSize;
}

size_t RabbitizerOperandType_process_cpu_immediate_base(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

// TODO: consider making this a proper configuration
#if 0
    if ((immOverride != NULL) && (immOverrideLength > 0) || RAB_INSTR_GET_immediate(self) != 0) {
        RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_cpu_immediate(self, dst, immOverride, immOverrideLength));
    }
#endif
    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_cpu_immediate(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');
    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_cpu_rs(self, dst, immOverride, immOverrideLength));
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_rs(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspGpr(RAB_INSTR_GET_rs(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_rt(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspGpr(RAB_INSTR_GET_rt(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_rd(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspGpr(RAB_INSTR_GET_rd(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_cop0d(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspCop0(RAB_INSTR_GET_cop0d(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_cop2t(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspCop2(RAB_INSTR_RSP_GET_cop2t(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_cop2cd(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspCop2Control(RAB_INSTR_RSP_GET_cop2cd(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vs(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspVector(RAB_INSTR_RSP_GET_vs(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vt(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspVector(RAB_INSTR_RSP_GET_vt(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vd(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameRspVector(RAB_INSTR_RSP_GET_vd(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vt_elementhigh(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t element;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_rsp_vt(self, dst, immOverride, immOverrideLength));

    element = RAB_INSTR_RSP_GET_elementhigh(self);
    if (element != 0) {
        if ((element & 0x8) == 0x8) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%i]", element & 7);
        } else if ((element & 0xC) == 0x4) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%ih]", element & (~0xC));
        } else if ((element & 0xE) == 0x2) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%iq]", element & (~0xE));
        } else {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%i]", element);
        }
    }
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vt_elementlow(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_rsp_vt(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%i]", RAB_INSTR_RSP_GET_elementlow(self));
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vd_de(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t de;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_rsp_vd(self, dst, immOverride, immOverrideLength));

    de = RAB_INSTR_RSP_GET_de(self);
    if ((de & 0x8) == 0x8) {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%i]", de & (~0x8));
    } else if ((de & 0xC) == 0x4) {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%ih]", de & (~0xC));
    } else if ((de & 0xE) == 0x2) {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%iq]", de & (~0xE));
    } else {
        RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%i]", de);
    }
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_vs_index(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_rsp_vs(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "[%i]", RAB_INSTR_RSP_GET_index(self));
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_offset_rs(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%X", RabbitizerInstructionRsp_GetOffsetVector(self));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');
    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_rsp_rs(self, dst, immOverride, immOverrideLength));
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');
    return totalSize;
}

size_t RabbitizerOperandType_process_rsp_immediate_base(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

// TODO: consider making this a proper configuration
#if 0
    if ((immOverride != NULL) && (immOverrideLength > 0) || RAB_INSTR_GET_immediate(self) != 0) {
        RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_cpu_immediate(self, dst, immOverride, immOverrideLength));
    }
#endif
    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_cpu_immediate(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');
    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_rsp_rs(self, dst, immOverride, immOverrideLength));
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_I(UNUSED const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride,
                                             UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_CPY(dst, totalSize, "$I");

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_Q(UNUSED const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride,
                                             UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_CPY(dst, totalSize, "$Q");

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_R(UNUSED const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride,
                                             UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_CPY(dst, totalSize, "$R");

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_ACC(UNUSED const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride,
                                               UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_CPY(dst, totalSize, "$ACC");

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_ACCxyzw(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_ACC(self, dst, immOverride, immOverrideLength));

#if 0
    if (RAB_INSTR_R5900_GET_xyzw_x(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'x');
    }
    if (RAB_INSTR_R5900_GET_xyzw_y(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'y');
    }
    if (RAB_INSTR_R5900_GET_xyzw_z(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'z');
    }
    if (RAB_INSTR_R5900_GET_xyzw_w(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'w');
    }
#endif

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfs(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameR5900VF(RAB_INSTR_R5900_GET_vfs(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vft(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameR5900VF(RAB_INSTR_R5900_GET_vft(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfd(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameR5900VF(RAB_INSTR_R5900_GET_vfd(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfsxyzw(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfs(self, dst, immOverride, immOverrideLength));

#if 0
    if (RAB_INSTR_R5900_GET_xyzw_x(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'x');
    }
    if (RAB_INSTR_R5900_GET_xyzw_y(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'y');
    }
    if (RAB_INSTR_R5900_GET_xyzw_z(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'z');
    }
    if (RAB_INSTR_R5900_GET_xyzw_w(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'w');
    }
#endif

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vftxyzw(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vft(self, dst, immOverride, immOverrideLength));

#if 0
    if (RAB_INSTR_R5900_GET_xyzw_x(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'x');
    }
    if (RAB_INSTR_R5900_GET_xyzw_y(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'y');
    }
    if (RAB_INSTR_R5900_GET_xyzw_z(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'z');
    }
    if (RAB_INSTR_R5900_GET_xyzw_w(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'w');
    }
#endif

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfdxyzw(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfd(self, dst, immOverride, immOverrideLength));

#if 0
    if (RAB_INSTR_R5900_GET_xyzw_x(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'x');
    }
    if (RAB_INSTR_R5900_GET_xyzw_y(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'y');
    }
    if (RAB_INSTR_R5900_GET_xyzw_z(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'z');
    }
    if (RAB_INSTR_R5900_GET_xyzw_w(self)) {
        RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, 'w');
    }
#endif

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfsn(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfs(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_n(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vftn(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vft(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_n(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfdn(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfd(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_n(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfsl(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfs(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_l(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vftl(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vft(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_l(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfdl(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfd(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_l(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfsm(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfs(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_m(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vftm(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vft(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_m(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vfdm(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    uint8_t n;

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vfd(self, dst, immOverride, immOverrideLength));

    n = RAB_INSTR_R5900_GET_m(self);
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, "xyzw"[n]);

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vis(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameR5900VI(RAB_INSTR_R5900_GET_vis(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vit(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameR5900VI(RAB_INSTR_R5900_GET_vit(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vid(const RabbitizerInstruction *self, char *dst, UNUSED const char *immOverride, UNUSED size_t immOverrideLength) {
    size_t totalSize = 0;
    const char *reg = RabbitizerRegister_getNameR5900VI(RAB_INSTR_R5900_GET_vid(self));

    RABUTILS_BUFFER_CPY(dst, totalSize, reg);
    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vis_predecr(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '-');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '-');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vis(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vit_predecr(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '-');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '-');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vit(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vid_predecr(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '-');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '-');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vid(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vis_postincr(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vis(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '+');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '+');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vit_postincr(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vit(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '+');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '+');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_vid_postincr(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '(');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerOperandType_process_r5900_vid(self, dst, immOverride, immOverrideLength));

    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '+');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '+');
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ')');

    return totalSize;
}

size_t RabbitizerOperandType_process_r5900_immediate5(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;
    int32_t number;

    if ((immOverride != NULL) && (immOverrideLength > 0)) {
        memcpy(dst, immOverride, immOverrideLength);
        return immOverrideLength;
    }

    number = RAB_INSTR_R5900_GET_imm5(self);
    if (RabbitizerConfig_Cfg.misc.omit0XOnSmallImm) {
        if (number > -10 && number < 10) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "%i", number);
            return totalSize;
        }
    }
    if (number < 0) {
        if (RabbitizerConfig_Cfg.misc.upperCaseImm) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "-0x%X", -number);
        } else {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "-0x%x", -number);
        }
    } else {
        if (RabbitizerConfig_Cfg.misc.upperCaseImm) {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%X", number);
        } else {
            RABUTILS_BUFFER_SPRINTF(dst, totalSize, "0x%x", number);
        }
    }
    return totalSize;
}

#define RAB_DEF_OPERAND(prefix, operand) [RAB_OPERAND_##prefix##_##operand] = RabbitizerOperandType_process_##prefix##_##operand,

const OperandCallback instrOpercandCallbacks[] = {
#include "instructions/operands/RabbitizerOperandType_cpu.inc"
#include "instructions/operands/RabbitizerOperandType_rsp.inc"
#include "instructions/operands/RabbitizerOperandType_r5900.inc"
};

#undef RAB_DEF_OPERAND

size_t RabbitizerInstruction_getSizeForBufferOperandsDisasm(const RabbitizerInstruction *self, size_t immOverrideLength) {
    size_t totalSize = 0;
    char auxBuffer[0x100] = { 0 };
    char immOverride[0x100] = { 0 };

    for (size_t i = 0; i < ARRAY_COUNT(self->descriptor->operands) && self->descriptor->operands[i] != RAB_OPERAND_ALL_INVALID; i++) {
        RabbitizerOperandType operand;
        OperandCallback callback;

        if (i != 0) {
            totalSize += 2;
        }

        operand = self->descriptor->operands[i];
        assert(operand > RAB_OPERAND_ALL_INVALID);
        assert(operand < RAB_OPERAND_ALL_MAX);

        callback = instrOpercandCallbacks[operand];
        assert(callback != NULL);
        totalSize += callback(self, auxBuffer, immOverride, immOverrideLength);
    }

    return totalSize;
}

size_t RabbitizerInstruction_disassembleOperands(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength) {
    size_t totalSize = 0;

    for (size_t i = 0; i < ARRAY_COUNT(self->descriptor->operands) && self->descriptor->operands[i] != RAB_OPERAND_ALL_INVALID; i++) {
        RabbitizerOperandType operand;
        OperandCallback callback;

        if (i != 0) {
            RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ',');
            RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ' ');
        }

        operand = self->descriptor->operands[i];
        assert(operand > RAB_OPERAND_ALL_INVALID);
        assert(operand < RAB_OPERAND_ALL_MAX);

        callback = instrOpercandCallbacks[operand];
        assert(callback != NULL);

        RABUTILS_BUFFER_ADVANCE(dst, totalSize, callback(self, dst, immOverride, immOverrideLength));
    }

    *dst = '\0';
    return totalSize;
}

size_t RabbitizerInstruction_getSizeForBufferInstrDisasm(const RabbitizerInstruction *self, size_t immOverrideLength, int extraLJust) {
    size_t totalSize = 0;
    size_t opcodeNameLength;

    opcodeNameLength = strlen(RabbitizerInstrId_getOpcodeName(self->uniqueId));

    totalSize += opcodeNameLength;

    totalSize += RabbitizerInstrSuffix_getSizeForBuffer(self, self->descriptor->instrSuffix);

    if (self->descriptor->operands[0] == RAB_OPERAND_ALL_INVALID) {
        // There are no operands
        return totalSize;
    }

    if (RabbitizerConfig_Cfg.misc.opcodeLJust > 0) {
        totalSize += RabbitizerConfig_Cfg.misc.opcodeLJust;
    }
    if (extraLJust > 0) {
        totalSize += extraLJust;
    }
    totalSize++;

    totalSize += RabbitizerInstruction_getSizeForBufferOperandsDisasm(self, immOverrideLength);

    return totalSize;
}

size_t RabbitizerInstruction_disassembleInstruction(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength,
                                                    int extraLJust) {
    size_t totalSize = 0;
    const char *opcodeName = RabbitizerInstrId_getOpcodeName(self->uniqueId);

    RABUTILS_BUFFER_CPY(dst, totalSize, opcodeName);

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerInstrSuffix_processSuffix(self, dst, self->descriptor->instrSuffix));

    if (self->descriptor->operands[0] == RAB_OPERAND_ALL_INVALID) {
        // There are no operands
        *dst = '\0';
        return totalSize;
    }

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerUtils_CharFill(dst, RabbitizerConfig_Cfg.misc.opcodeLJust + extraLJust - totalSize, ' '));
    RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ' ');

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerInstruction_disassembleOperands(self, dst, immOverride, immOverrideLength));

    *dst = '\0';
    return totalSize;
}

size_t RabbitizerInstruction_getSizeForBufferDataDisasm(UNUSED const RabbitizerInstruction *self, int extraLJust) {
    size_t totalSize = 0;

    totalSize += strlen(".word");
    totalSize += RabbitizerConfig_Cfg.misc.opcodeLJust + extraLJust;
    totalSize += 11;
    return totalSize;
}

size_t RabbitizerInstruction_disassembleAsData(const RabbitizerInstruction *self, char *dst, int extraLJust) {
    size_t totalSize = 0;

    RABUTILS_BUFFER_CPY(dst, totalSize, ".word");

    RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerUtils_CharFill(dst, RabbitizerConfig_Cfg.misc.opcodeLJust + extraLJust - totalSize, ' '));

    RABUTILS_BUFFER_SPRINTF(dst, totalSize, " 0x%08X", RabbitizerInstruction_getRaw(self));
    return totalSize;
}

bool RabbitizerInstruction_mustDisasmAsData(const RabbitizerInstruction *self) {
    if (RabbitizerConfig_Cfg.toolchainTweaks.sn64DivFix) {
        if (self->uniqueId == RABBITIZER_INSTR_ID_cpu_break) {
            return true;
        }
    }

    if (!RabbitizerInstruction_isValid(self)) {
        return true;
    }
    return false;
}

size_t RabbitizerInstruction_getSizeForBuffer(const RabbitizerInstruction *self, size_t immOverrideLength, int extraLJust) {
    if (!RabbitizerInstruction_isImplemented(self) || RabbitizerInstruction_mustDisasmAsData(self)) {
        size_t totalSize = RabbitizerInstruction_getSizeForBufferDataDisasm(self, extraLJust);

        if (RabbitizerConfig_Cfg.misc.unknownInstrComment) {
            totalSize += 40;
            totalSize += 3;
            totalSize += RabbitizerInstruction_getSizeForBufferInstrDisasm(self, immOverrideLength, extraLJust);
            totalSize += 11;
        }
        return totalSize;
    }

    return RabbitizerInstruction_getSizeForBufferInstrDisasm(self, immOverrideLength, extraLJust);
}

size_t RabbitizerInstruction_disassemble(const RabbitizerInstruction *self, char *dst, const char *immOverride, size_t immOverrideLength, int extraLJust) {
    assert(dst != NULL);

    if (!RabbitizerInstruction_isImplemented(self) || RabbitizerInstruction_mustDisasmAsData(self)) {
        size_t totalSize = 0;

        RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerInstruction_disassembleAsData(self, dst, extraLJust));

        if (RabbitizerConfig_Cfg.misc.unknownInstrComment) {
            uint32_t validBits;

            RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerUtils_CharFill(dst, 40 - totalSize, ' '));

            RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ' ');
            RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, '#');
            RABUTILS_BUFFER_WRITE_CHAR(dst, totalSize, ' ');

            RABUTILS_BUFFER_ADVANCE(dst, totalSize, RabbitizerInstruction_disassembleInstruction(self, dst, immOverride, immOverrideLength, extraLJust));

            validBits = RabbitizerInstruction_getValidBits(self);

            RABUTILS_BUFFER_SPRINTF(dst, totalSize, " # %08X", ((~validBits) & self->word));
        }

        return totalSize;
    }

    return RabbitizerInstruction_disassembleInstruction(self, dst, immOverride, immOverrideLength, extraLJust);
}
