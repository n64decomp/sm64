#!/bin/bash
set -o pipefail
INPUT="$1"
OUTPUT="${INPUT%.*}.o"

rm -f "$OUTPUT"

CC="$MIPS_CC"  # ido 7.1 via recomp or qemu-irix
AS="mips-linux-gnu-as"
ASFLAGS="-march=vr4300 -mabi=32"
OPTFLAGS=$(grep 'COMPILE-FLAGS: ' $INPUT | sed 's#^.*COMPILE-FLAGS: ##' | sed 's#}$##')
ASMPFLAGS=$(grep 'ASMP-FLAGS: ' $INPUT | sed 's#^.*ASMP-FLAGS: ##' | sed 's#}$##')
ISET=$(grep 'COMPILE-ISET: ' $INPUT | sed 's#^.*COMPILE-ISET: ##' | sed 's#}$##')
if [[ -z "$OPTFLAGS" ]]; then
    OPTFLAGS="-g"
fi
CFLAGS="-Wab,-r4300_mul -G 0 -Xcpluscomm -fullwarn -wlint -woff 819,820,852,821 -signed -c"
if [[ -z "$ISET" ]]; then
    CFLAGS="$CFLAGS -mips2"
fi
if [[ "$OPTFLAGS" != *-KPIC* ]]; then
	CFLAGS="$CFLAGS -non_shared"
fi

set -e
python3 build.py --drop-mdebug-gptab $ASMPFLAGS $CC -- $AS $ASFLAGS -- $CFLAGS $OPTFLAGS $ISET -o "$OUTPUT" "$INPUT"
