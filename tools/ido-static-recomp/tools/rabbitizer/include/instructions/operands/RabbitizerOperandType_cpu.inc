/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

RAB_DEF_OPERAND(cpu, rs)
RAB_DEF_OPERAND(cpu, rt)
RAB_DEF_OPERAND(cpu, rd)
RAB_DEF_OPERAND(cpu, sa)
RAB_DEF_OPERAND(cpu, zero) // $zero
// RAB_DEF_OPERAND(cpu, function)
RAB_DEF_OPERAND(cpu, cop0d)
RAB_DEF_OPERAND(cpu, fs)
RAB_DEF_OPERAND(cpu, ft)
RAB_DEF_OPERAND(cpu, fd)
RAB_DEF_OPERAND(cpu, cop1cs) // Coprocessor 1 control fs
RAB_DEF_OPERAND(cpu, cop2t)
RAB_DEF_OPERAND(cpu, op)
RAB_DEF_OPERAND(cpu, code)
RAB_DEF_OPERAND(cpu, code_lower)
RAB_DEF_OPERAND(cpu, copraw)
RAB_DEF_OPERAND(cpu, label)
RAB_DEF_OPERAND(cpu, immediate)
RAB_DEF_OPERAND(cpu, branch_target_label)

// composed/aliased operands
RAB_DEF_OPERAND(cpu, immediate_base)
