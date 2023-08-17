/* SPDX-FileCopyrightText: © 2022 Decompollaborate */
/* SPDX-License-Identifier: MIT */

#ifndef RABBITIZER_LO_PAIRING_INFO_HPP
#define RABBITIZER_LO_PAIRING_INFO_HPP
#pragma once

#include "analysis/RabbitizerLoPairingInfo.h"


namespace rabbitizer {
    class LoPairingInfo {
    protected:
        RabbitizerLoPairingInfo pairingInfo;

    public:
        LoPairingInfo();
        LoPairingInfo(const RabbitizerLoPairingInfo &pairingInfo);

        /**
         * Returns a pointer to the inner RabbitizerLoPairingInfo.
         * It is recommended to not mess with it unless you know what you are doing.
         */
        RabbitizerLoPairingInfo *getCPtr();
        const RabbitizerLoPairingInfo *getCPtr() const;

        int getInstrOffset() const;
        int64_t getValue() const;
        bool shouldProcess() const;
        bool isGpRel() const;
        bool isGpGot() const;
    };
};


#endif
