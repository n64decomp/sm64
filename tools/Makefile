CC := gcc
CXX := g++
CFLAGS := -I . -Wall -Wextra -Wno-unused-parameter -pedantic -std=c99 -O2 -s
LDFLAGS := -lm
PROGRAMS := n64graphics n64graphics_ci mio0 n64cksum textconv patch_libultra_math aifc_decode aiff_extract_codebook vadpcm_enc tabledesign extract_data_for_mio skyconv

# if armips is not found on the system, build it in tools
ifeq (, $(shell which armips 2> /dev/null))
CXX_PROGRAMS += armips
endif

ifeq ($(OS),Windows_NT)
ARMIPS_FLAGS := -municode
endif

default: all

armips: armips.cpp
	$(CXX) $(CXXFLAGS) -fno-exceptions -fno-rtti -pipe $^ -o $@ -lpthread $(ARMIPS_FLAGS)

n64graphics_SOURCES := n64graphics.c utils.c
n64graphics_CFLAGS  := -DN64GRAPHICS_STANDALONE

n64graphics_ci_SOURCES := n64graphics_ci_dir/n64graphics_ci.c n64graphics_ci_dir/exoquant/exoquant.c n64graphics_ci_dir/utils.c

mio0_SOURCES := libmio0.c
mio0_CFLAGS := -DMIO0_STANDALONE

n64cksum_SOURCES := n64cksum.c utils.c
n64cksum_CFLAGS := -DN64CKSUM_STANDALONE

textconv_SOURCES := textconv.c utf8.c hashtable.c
patch_libultra_math_SOURCES := patch_libultra_math.c

aifc_decode_SOURCES := aifc_decode.c

aiff_extract_codebook_SOURCES := aiff_extract_codebook.c

tabledesign_SOURCES := sdk-tools/tabledesign/codebook.c sdk-tools/tabledesign/estimate.c sdk-tools/tabledesign/print.c sdk-tools/tabledesign/tabledesign.c
tabledesign_CFLAGS := -Iaudiofile -Wno-uninitialized
tabledesign_LDFLAGS := -Laudiofile -laudiofile -lstdc++ -lm

vadpcm_enc_SOURCES := sdk-tools/adpcm/vadpcm_enc.c sdk-tools/adpcm/vpredictor.c sdk-tools/adpcm/quant.c sdk-tools/adpcm/util.c sdk-tools/adpcm/vencode.c
vadpcm_enc_CFLAGS := -Wno-unused-result -Wno-uninitialized -Wno-sign-compare -Wno-absolute-value

extract_data_for_mio_SOURCES := extract_data_for_mio.c

skyconv_SOURCES := skyconv.c n64graphics.c utils.c

LIBAUDIOFILE := audiofile/libaudiofile.a

$(LIBAUDIOFILE):
	@$(MAKE) -C audiofile

all: $(LIBAUDIOFILE) $(PROGRAMS) $(CXX_PROGRAMS)

clean:
	$(RM) $(PROGRAMS) $(CXX_PROGRAMS)
	$(MAKE) -C audiofile clean

define COMPILE
$(1): $($1_SOURCES)
	$(CC) $(CFLAGS) $($1_CFLAGS) $$^ -o $$@ $(LDFLAGS) $($1_LDFLAGS)
endef

$(foreach p,$(PROGRAMS),$(eval $(call COMPILE,$(p))))

.PHONY: all clean default
