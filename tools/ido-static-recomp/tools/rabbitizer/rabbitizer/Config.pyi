#!/usr/bin/env python3

# SPDX-FileCopyrightText: © 2022 Decompollaborate
# SPDX-License-Identifier: MIT

from __future__ import annotations

from .Enum import Enum


class Abi:
    NUMERIC: Enum
    O32: Enum
    N32: Enum
    N64: Enum

    @staticmethod
    def fromStr(name: str | None) -> Enum: ...


class _RabbitizerConfig:
    regNames_namedRegisters: bool = True
    regNames_gprAbiNames: Enum = Abi.O32
    regNames_fprAbiNames: Enum = Abi.NUMERIC
    regNames_userFpcCsr: bool = True
    regNames_vr4300Cop0NamedRegisters: bool = True
    regNames_vr4300RspCop0NamedRegisters: bool = True

    pseudos_enablePseudos: bool = True
    pseudos_pseudoBeqz: bool = True
    pseudos_pseudoBnez: bool = True
    pseudos_pseudoB: bool = True
    pseudos_pseudoMove: bool = True
    pseudos_pseudoNot: bool = True
    pseudos_pseudoNegu: bool = True
    pseudos_pseudoBal: bool = True

    toolchainTweaks_sn64DivFix: bool = False
    toolchainTweaks_treatJAsUnconditionalBranch: bool = False

    misc_opcodeLJust: int = 11
    misc_unknownInstrComment: bool = True
    misc_omit0XOnSmallImm: bool = False
    misc_upperCaseImm: bool = True

config: _RabbitizerConfig
