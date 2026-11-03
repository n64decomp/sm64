include ../util.mk

CC           := gcc
CFLAGS       := -I . -Wall -Wextra -Wno-unused-parameter -pedantic -O2 -s
LDFLAGS      := -lm
# Only the tools the asset pipeline uses (extraction, texture/text/sound
# conversion). The N64 matching toolchain that upstream ships (ido/ique
# compilers, armips, asm_processor, n64cksum, ...) is not part of this fork.
ALL_PROGRAMS := aifc_decode aiff_extract_codebook mio0 n64graphics n64graphics_ci skyconv textconv vadpcm_enc
BUILD_PROGRAMS := $(ALL_PROGRAMS)

default: all

n64graphics_SOURCES := n64graphics.c utils.c
n64graphics_CFLAGS  := -DN64GRAPHICS_STANDALONE

n64graphics_ci_SOURCES := n64graphics_ci_dir/n64graphics_ci.c n64graphics_ci_dir/exoquant/exoquant.c n64graphics_ci_dir/utils.c

mio0_SOURCES := libmio0.c
mio0_CFLAGS  := -DMIO0_STANDALONE

textconv_SOURCES := textconv.c utf8.c hashtable.c

aifc_decode_SOURCES := aifc_decode.c

aiff_extract_codebook_SOURCES := aiff_extract_codebook.c

vadpcm_enc_SOURCES := sdk-tools/adpcm/vadpcm_enc.c sdk-tools/adpcm/vpredictor.c sdk-tools/adpcm/quant.c sdk-tools/adpcm/util.c sdk-tools/adpcm/vencode.c
vadpcm_enc_CFLAGS  := -Wno-unused-result -Wno-uninitialized -Wno-sign-compare -Wno-absolute-value

skyconv_SOURCES := skyconv.c n64graphics.c utils.c

all: all-except-recomp

# Kept as a separate name because the top-level Makefile asks for it.
all-except-recomp: $(BUILD_PROGRAMS)

clean:
	$(RM) $(ALL_PROGRAMS)

define COMPILE
$(1): $($1_SOURCES)
	$$(CC) $(CFLAGS) $($1_CFLAGS) $$^ -o $$@ $($1_LDFLAGS) $(LDFLAGS)
endef

$(foreach p,$(BUILD_PROGRAMS),$(eval $(call COMPILE,$(p))))

.PHONY: all all-except-recomp clean default
