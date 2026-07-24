#!/usr/bin/env bash
for A in tests/*.c tests/*.p; do
    OBJDUMPFLAGS=-srt
    echo $A
    ./compile-test.sh "$A" && mips-linux-gnu-objdump $OBJDUMPFLAGS "${A%.*}.o" | diff - "${A%.*}.objdump" || echo FAIL "$A"
done
