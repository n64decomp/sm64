#!/usr/bin/env bash
for A in "$@"; do
    OBJDUMPFLAGS="-srt"
    ./compile-test.sh "$A" && mips-linux-gnu-objdump $OBJDUMPFLAGS "${A%.*}.o" > "${A%.*}.objdump"
done
