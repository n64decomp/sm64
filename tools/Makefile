include ../util.mk

HOST_ENV := $(shell uname 2>/dev/null || echo Unknown)
HOST_ENV := $(patsubst MINGW%,MinGW,$(HOST_ENV))

CC           := gcc
CXX          := g++
CFLAGS       := -I . -I sm64tools -Wall -Wextra -Wno-unused-parameter -pedantic -O2 -s
LDFLAGS      := -lm
ALL_PROGRAMS := armips textconv patch_elf_32bit aifc_decode aiff_extract_codebook vadpcm_enc tabledesign extract_data_for_mio skyconv
LIBAUDIOFILE := audiofile/libaudiofile.a

# Only build armips from tools if it is not found on the system
ifeq ($(call find-command,armips),)
  BUILD_PROGRAMS := $(ALL_PROGRAMS)
else
  BUILD_PROGRAMS := $(filter-out armips,$(ALL_PROGRAMS))
endif

default: all

textconv_SOURCES := textconv.c utf8.c hashtable.c

patch_elf_32bit_SOURCES := patch_elf_32bit.c

aifc_decode_SOURCES := aifc_decode.c

aiff_extract_codebook_SOURCES := aiff_extract_codebook.c

tabledesign: $(LIBAUDIOFILE)
tabledesign_SOURCES := sdk-tools/tabledesign/codebook.c sdk-tools/tabledesign/estimate.c sdk-tools/tabledesign/print.c sdk-tools/tabledesign/tabledesign.c
tabledesign_CFLAGS  := -Iaudiofile -Wno-uninitialized
tabledesign_LDFLAGS := -Laudiofile -laudiofile -lstdc++

vadpcm_enc_SOURCES := sdk-tools/adpcm/vadpcm_enc.c sdk-tools/adpcm/vpredictor.c sdk-tools/adpcm/quant.c sdk-tools/adpcm/util.c sdk-tools/adpcm/vencode.c
vadpcm_enc_CFLAGS  := -Wno-unused-result -Wno-uninitialized -Wno-sign-compare -Wno-absolute-value

extract_data_for_mio_SOURCES := extract_data_for_mio.c

skyconv_SOURCES := skyconv.c sm64tools/n64graphics.c sm64tools/utils.c

armips: CC := $(CXX)
armips_SOURCES := armips.cpp
armips_CFLAGS  := -std=c++11 -fno-exceptions -fno-rtti -pipe
armips_LDFLAGS := -pthread
ifeq ($(HOST_ENV),MinGW)
  armips_LDFLAGS += -municode
endif

all-except-recomp: $(LIBAUDIOFILE) $(BUILD_PROGRAMS)

all: all-except-recomp ido-static-recomp

clean:
	$(RM) $(ALL_PROGRAMS)
	$(MAKE) -C audiofile clean
	$(MAKE) -C ido-static-recomp clean

distclean: clean
	$(MAKE) -C ido-static-recomp distclean

define COMPILE
$(1): $($1_SOURCES)
	$$(CC) $(CFLAGS) $($1_CFLAGS) $$^ -o $$@ $($1_LDFLAGS) $(LDFLAGS)
endef

ido-static-recomp:
	@$(MAKE) -C ido-static-recomp setup
	@$(MAKE) -C ido-static-recomp

$(foreach p,$(BUILD_PROGRAMS),$(eval $(call COMPILE,$(p))))

$(LIBAUDIOFILE):
	@$(MAKE) -C audiofile

.PHONY: all all-except-recomp clean default ido-static-recomp
