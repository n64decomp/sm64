#!/usr/bin/env python3

# SPDX-FileCopyrightText: © 2022 Decompollaborate
# SPDX-License-Identifier: MIT

from __future__ import annotations


class RegistersTracker:
    registerNum: int

    hasLuiValue: bool
    luiOffset: int # The offset of last lui which set a value to this register
    luiSetOnBranchLikely: bool

    hasGpGot: bool
    gpGotOffset: int

    hasLoValue: bool
    loOffset: int
    dereferenced: bool
    dereferenceOffset: int

    value: int
