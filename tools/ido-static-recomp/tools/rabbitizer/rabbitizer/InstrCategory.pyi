#!/usr/bin/env python3

# SPDX-FileCopyrightText: © 2022 Decompollaborate
# SPDX-License-Identifier: MIT

from __future__ import annotations

from .Enum import Enum


class InstrCategory:
    CPU: Enum
    RSP: Enum
    R5900: Enum
    MAX: Enum
