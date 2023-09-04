#!/usr/bin/env python3

# SPDX-FileCopyrightText: © 2022 Decompollaborate
# SPDX-License-Identifier: MIT

from __future__ import annotations


class LoPairingInfo:
    instrOffset: int
    value: int
    shouldProcess: bool
    isGpRel: bool
    isGpGot: bool

    def __init__(self): ...
