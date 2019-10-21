# Makefile to rebuild SM64 split image

### Default target ###

default: all

### Build Options ###

# Version of the game to build
VERSION ?= us
# Graphics microcode used
GRUCODE ?= f3d_old
# If COMPARE is 1, check the output sha1sum when building 'all'
COMPARE ?= 1
# If NON_MATCHING is 1, define the NON_MATCHING macro when building
NON_MATCHING ?= 0
# If ENDIAN_IND is 1, enable non-matching code changes that try to ensure
# endianness independence
ENDIAN_IND ?= 0

# Release

ifeq ($(VERSION),jp)
  VERSION_CFLAGS := -DVERSION_JP=1
  VERSION_ASFLAGS := --defsym VERSION_JP=1
  GRUCODE_CFLAGS := -DF3D_OLD
  GRUCODE_ASFLAGS := --defsym F3D_OLD=1
  TARGET := sm64.jp
else
ifeq ($(VERSION),us)
  VERSION_CFLAGS := -DVERSION_US=1
  VERSION_ASFLAGS := --defsym VERSION_US=1
  GRUCODE_CFLAGS := -DF3D_OLD
  GRUCODE_ASFLAGS := --defsym F3D_OLD=1
  TARGET := sm64.us
else
ifeq ($(VERSION),eu)
  $(warning Building EU is experimental and is prone to breaking. Try at your own risk.)
  VERSION_CFLAGS := -DVERSION_EU=1
  VERSION_ASFLAGS := --defsym VERSION_EU=1
  GRUCODE_CFLAGS := -DF3D_NEW
  GRUCODE_ASFLAGS := --defsym F3D_NEW=1
  TARGET := sm64.eu
else
  $(error unknown version "$(VERSION)")
endif
endif
endif

# Microcode

ifeq ($(GRUCODE),f3dex) # Fast3DEX
  GRUCODE_CFLAGS := -DF3DEX_GBI=1
  GRUCODE_ASFLAGS := --defsym F3DEX_GBI_SHARED=1 --defsym F3DEX_GBI=1
  TARGET := $(TARGET).f3dex
  COMPARE := 0
else
ifeq ($(GRUCODE), f3dex2) # Fast3DEX2
  GRUCODE_CFLAGS := -DF3DEX_GBI_2=1
  GRUCODE_ASFLAGS := --defsym F3DEX_GBI_SHARED=1 --defsym F3DEX_GBI_2=1
  TARGET := $(TARGET).f3dex2
  COMPARE := 0
else
ifeq ($(GRUCODE),f3d_new) # Fast3D 2.0H (Shindou)
  GRUCODE_CFLAGS := -DF3D_NEW
  GRUCODE_ASFLAGS := --defsym F3D_NEW=1
  TARGET := $(TARGET).f3d_new
  COMPARE := 0
else
ifeq ($(GRUCODE),f3dzex) # Fast3DZEX (2.0J / Animal Forest - Dōbutsu no Mori)
  $(warning Fast3DZEX is experimental. Try at your own risk.)
  GRUCODE_CFLAGS := -DF3DEX_GBI_2=1
  GRUCODE_ASFLAGS := --defsym F3DEX_GBI_SHARED=1 --defsym F3DZEX_GBI=1
  TARGET := $(TARGET).f3dzex
  COMPARE := 0
endif
endif
endif
endif

ifeq ($(NON_MATCHING),1)
  VERSION_CFLAGS := $(VERSION_CFLAGS) -DNON_MATCHING=1
  COMPARE := 0
endif

ifeq ($(ENDIAN_IND),1)
  VERSION_CFLAGS := $(VERSION_CFLAGS) -DENDIAN_IND=1
  COMPARE := 0
endif

################### Universal Dependencies ###################

# (This is a bit hacky, but a lot of rules implicitly depend
# on tools and assets, and we use directory globs further down
# in the makefile that we want should cover assets.)

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),distclean)

# Make sure assets exist
NOEXTRACT ?= 0
ifeq ($(NOEXTRACT),0)
DUMMY != ./extract_assets.py $(VERSION) >&2 || echo FAIL
ifeq ($(DUMMY),FAIL)
  $(error Failed to extract assets)
endif
endif

# Make tools if out of date
DUMMY != make -s -C tools >&2 || echo FAIL
ifeq ($(DUMMY),FAIL)
  $(error Failed to build tools)
endif

endif
endif

################ Target Executable and Sources ###############

# BUILD_DIR is location where all build artifacts are placed
BUILD_DIR_BASE := build
BUILD_DIR := $(BUILD_DIR_BASE)/$(VERSION)

LIBULTRA := $(BUILD_DIR)/libultra.a
ROM := $(BUILD_DIR)/$(TARGET).z64
ELF := $(BUILD_DIR)/$(TARGET).elf
LD_SCRIPT := sm64.ld
MIO0_DIR := $(BUILD_DIR)/mio0
SOUND_BIN_DIR := $(BUILD_DIR)/sound
TEXTURE_DIR := textures
ACTOR_DIR := actors

# Directories containing source files
SRC_DIRS := src src/engine src/game src/audio src/menu src/buffers
ASM_DIRS := asm actors lib data levels assets sound text
BIN_DIRS := bin bin/$(VERSION)

ULTRA_SRC_DIRS := lib/src lib/src/math
ULTRA_ASM_DIRS := lib/asm lib/data
ULTRA_BIN_DIRS := lib/bin

GODDARD_SRC_DIRS := src/goddard src/goddard/dynlists

LEVEL_DIRS := $(patsubst levels/%,%,$(dir $(wildcard levels/*/header.s)))

MIPSISET := -mips2 -32

ifeq ($(VERSION),eu)
  OPT_FLAGS := -O2
else
  OPT_FLAGS := -g
endif

# File dependencies and variables for specific files
include Makefile.split

# Source code files
C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))
ULTRA_C_FILES := $(foreach dir,$(ULTRA_SRC_DIRS),$(wildcard $(dir)/*.c))
GODDARD_C_FILES := $(foreach dir,$(GODDARD_SRC_DIRS),$(wildcard $(dir)/*.c))
ULTRA_S_FILES := $(foreach dir,$(ULTRA_ASM_DIRS),$(wildcard $(dir)/*.s))
LEVEL_S_FILES := $(addsuffix header.s,$(addprefix bin/,$(LEVEL_DIRS)))

SOUND_BANK_FILES := $(wildcard sound/sound_banks/*.json)
SOUND_SEQUENCE_FILES := $(wildcard sound/sequences/$(VERSION)/*.m64) \
    $(wildcard sound/sequences/*.m64) \
    $(foreach file,$(wildcard sound/sequences/$(VERSION)/*.s),$(BUILD_DIR)/$(file:.s=.m64)) \
    $(foreach file,$(wildcard sound/sequences/*.s),$(BUILD_DIR)/$(file:.s=.m64))
SOUND_SAMPLE_DIRS := $(wildcard sound/samples/*)
SOUND_SAMPLE_AIFFS := $(foreach dir,$(SOUND_SAMPLE_DIRS),$(wildcard $(dir)/*.aiff))
SOUND_SAMPLE_TABLES := $(foreach file,$(SOUND_SAMPLE_AIFFS),$(BUILD_DIR)/$(file:.aiff=.table))
SOUND_SAMPLE_AIFCS := $(foreach file,$(SOUND_SAMPLE_AIFFS),$(BUILD_DIR)/$(file:.aiff=.aifc))
SOUND_OBJ_FILES := $(SOUND_BIN_DIR)/sound_data.ctl.o \
                   $(SOUND_BIN_DIR)/sound_data.tbl.o \
                   $(SOUND_BIN_DIR)/sequences.bin.o \
                   $(SOUND_BIN_DIR)/bank_sets.o


# Object files
O_FILES := $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.o)) \
           $(foreach file,$(LEVEL_S_FILES),$(BUILD_DIR)/$(file:.s=.o))

ULTRA_O_FILES := $(foreach file,$(ULTRA_S_FILES),$(BUILD_DIR)/$(file:.s=.o)) \
                 $(foreach file,$(ULTRA_C_FILES),$(BUILD_DIR)/$(file:.c=.o))

GODDARD_O_FILES := $(foreach file,$(GODDARD_C_FILES),$(BUILD_DIR)/$(file:.c=.o))

# Automatic dependency files
DEP_FILES := $(O_FILES:.o=.d) $(ULTRA_O_FILES:.o=.d) $(GODDARD_O_FILES:.o=.d) $(BUILD_DIR)/$(LD_SCRIPT).d

# Files with NON_MATCHING ifdefs
NON_MATCHING_C_FILES != grep -rl NON_MATCHING $(wildcard src/audio/*.c) $(wildcard src/game/*.c)
NON_MATCHING_O_FILES = $(foreach file,$(NON_MATCHING_C_FILES),$(BUILD_DIR)/$(file:.c=.o))
NON_MATCHING_DEP = $(BUILD_DIR)/src/audio/non_matching_dep

# Segment elf files
SEG_FILES := $(SEGMENT_ELF_FILES) $(ACTOR_ELF_FILES) $(LEVEL_ELF_FILES)

##################### Compiler Options #######################
IRIX_ROOT := tools/ido5.3_compiler

ifeq ($(shell type mips-linux-gnu-ld >/dev/null 2>/dev/null; echo $$?), 0)
  CROSS := mips-linux-gnu-
else
  CROSS := mips64-elf-
endif

# check that either QEMU_IRIX is set or qemu-irix package installed
ifndef QEMU_IRIX
  QEMU_IRIX := $(shell which qemu-irix)
  ifeq (, $(QEMU_IRIX))
    $(error Please install qemu-irix package or set QEMU_IRIX env var to the full qemu-irix binary path)
  endif
endif

AS        := $(CROSS)as
CC        := $(QEMU_IRIX) -silent -L $(IRIX_ROOT) $(IRIX_ROOT)/usr/bin/cc
CPP       := cpp -P
LD        := $(CROSS)ld
AR        := $(CROSS)ar
OBJDUMP   := $(CROSS)objdump
OBJCOPY   := $(CROSS)objcopy
PYTHON    := python3

# Check code syntax with host compiler
CC_CHECK := gcc -fsyntax-only -fsigned-char -nostdinc -fno-builtin -I include -I $(BUILD_DIR)/include -I src -std=gnu90 -Wall -Wextra -Wno-format-security -D_LANGUAGE_C $(VERSION_CFLAGS) $(GRUCODE_CFLAGS)

ASFLAGS := -march=vr4300 -mabi=32 -I include -I $(BUILD_DIR) $(VERSION_ASFLAGS) $(GRUCODE_ASFLAGS)
CFLAGS = -Wab,-r4300_mul -non_shared -G 0 -Xcpluscomm -Xfullwarn $(OPT_FLAGS) -signed -I include -I $(BUILD_DIR)/include -I src -D_LANGUAGE_C $(VERSION_CFLAGS) $(MIPSISET) $(GRUCODE_CFLAGS)
OBJCOPYFLAGS := --pad-to=0x800000 --gap-fill=0xFF
SYMBOL_LINKING_FLAGS := $(addprefix -R ,$(SEG_FILES))
LDFLAGS := -T undefined_syms.txt -T $(BUILD_DIR)/$(LD_SCRIPT) -Map $(BUILD_DIR)/sm64.$(VERSION).map --no-check-sections $(SYMBOL_LINKING_FLAGS)

ifeq ($(shell getconf LONG_BIT), 32)
  # Work around memory allocation bug in QEMU
  export QEMU_GUEST_BASE := 1
else
  # Ensure that gcc treats the code as 32-bit
  CC_CHECK += -m32
endif

####################### Other Tools #########################

# N64 tools
TOOLS_DIR = tools
MIO0TOOL = $(TOOLS_DIR)/mio0
N64CKSUM = $(TOOLS_DIR)/n64cksum
N64GRAPHICS = $(TOOLS_DIR)/n64graphics
N64GRAPHICS_CI = $(TOOLS_DIR)/n64graphics_ci
TEXTCONV = $(TOOLS_DIR)/textconv
IPLFONTUTIL = $(TOOLS_DIR)/iplfontutil
AIFF_EXTRACT_CODEBOOK = $(TOOLS_DIR)/aiff_extract_codebook
VADPCM_ENC = $(TOOLS_DIR)/vadpcm_enc
EMULATOR = mupen64plus
EMU_FLAGS = --noosd
LOADER = loader64
LOADER_FLAGS = -vwf
SHA1SUM = sha1sum

###################### Dependency Check #####################

BINUTILS_VER_MAJOR := $(shell $(LD) --version | grep ^GNU | sed 's/^.* //; s/\..*//g')
BINUTILS_VER_MINOR := $(shell $(LD) --version | grep ^GNU | sed 's/^[^.]*\.//; s/\..*//g')
BINUTILS_DEPEND := $(shell expr $(BINUTILS_VER_MAJOR) \>= 2 \& $(BINUTILS_VER_MINOR) \>= 27)
ifeq ($(BINUTILS_DEPEND),0)
$(error binutils version 2.27 required, version $(BINUTILS_VER_MAJOR).$(BINUTILS_VER_MINOR) detected)
endif

######################## Targets #############################

all: $(ROM)
ifeq ($(COMPARE),1)
	@$(SHA1SUM) -c $(TARGET).sha1 || (echo 'The build succeeded, but did not match the official ROM. This is expected if you are making changes to the game.\nTo silence this message, use "make COMPARE=0"'. && false)
endif

clean:
	$(RM) -r $(BUILD_DIR_BASE)

distclean:
	$(RM) -r $(BUILD_DIR_BASE)
	./extract_assets.py --clean

test: $(ROM)
	$(EMULATOR) $(EMU_FLAGS) $<

load: $(ROM)
	$(LOADER) $(LOADER_FLAGS) $<

libultra: $(BUILD_DIR)/libultra.a

asm/boot.s: $(BUILD_DIR)/lib/bin/ipl3_font.bin

$(BUILD_DIR)/lib/bin/ipl3_font.bin: lib/ipl3_font.png
	$(IPLFONTUTIL) e $< $@

$(BUILD_DIR)/include/text_strings.h: include/text_strings.h.in
	$(TEXTCONV) charmap.txt $< $@

$(BUILD_DIR)/include/text_menu_strings.h: include/text_menu_strings.h.in
	$(TEXTCONV) charmap_menu.txt $< $@

$(BUILD_DIR)/text/%.s: text/$(VERSION)/%.s.in
	$(TEXTCONV) charmap.txt $< $@

ifeq ($(VERSION),eu)
ASM_DIRS += text/de text/en text/fr
# EU encoded text inserted into individual segment 0x19 files
$(BUILD_DIR)/bin/$(VERSION)/translation_de.o: $(BUILD_DIR)/text/de/dialog.s $(BUILD_DIR)/text/de/level.s $(BUILD_DIR)/text/de/star.s
$(BUILD_DIR)/bin/$(VERSION)/translation_en.o: $(BUILD_DIR)/text/en/dialog.s $(BUILD_DIR)/text/en/level.s $(BUILD_DIR)/text/en/star.s
$(BUILD_DIR)/bin/$(VERSION)/translation_fr.o: $(BUILD_DIR)/text/fr/dialog.s $(BUILD_DIR)/text/fr/level.s $(BUILD_DIR)/text/fr/star.s
else
# non-EU encoded text inserted into segment 0x02
$(BUILD_DIR)/bin/segment2.o: $(BUILD_DIR)/text/debug.s $(BUILD_DIR)/text/dialog.s $(BUILD_DIR)/text/level.s $(BUILD_DIR)/text/star.s
endif

ALL_DIRS := $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS) $(GODDARD_SRC_DIRS) $(ULTRA_SRC_DIRS) $(ULTRA_ASM_DIRS) $(ULTRA_BIN_DIRS) $(BIN_DIRS) $(TEXTURE_DIRS) $(SOUND_SAMPLE_DIRS) $(addprefix levels/,$(LEVEL_DIRS)) $(addprefix bin/,$(LEVEL_DIRS)) include) $(MIO0_DIR) $(addprefix $(MIO0_DIR)/,$(LEVEL_DIRS)) $(addprefix $(MIO0_DIR)/,$(VERSION)) $(SOUND_BIN_DIR) $(SOUND_BIN_DIR)/sequences/$(VERSION)

# Make sure build directory exists before compiling anything
DUMMY != mkdir -p $(ALL_DIRS)

$(BUILD_DIR)/include/text_strings.h: $(BUILD_DIR)/include/text_menu_strings.h
$(BUILD_DIR)/src/menu/file_select.o: $(BUILD_DIR)/include/text_strings.h
$(BUILD_DIR)/src/menu/star_select.o: $(BUILD_DIR)/include/text_strings.h
$(BUILD_DIR)/src/game/ingame_menu.o: $(BUILD_DIR)/include/text_strings.h

################################################################
# TEXTURE GENERATION                                           #
################################################################

# RGBA32, RGBA16, IA16, IA8, IA4, IA1, I8, I4
$(BUILD_DIR)/%: %.png
	$(N64GRAPHICS) -i $@ -g $< -f $(lastword $(subst ., ,$@))

# Color Index CI8
$(BUILD_DIR)/%.ci8: %.ci8.png
	$(N64GRAPHICS_CI) -i $@ -g $< -f ci8

# Color Index CI4
$(BUILD_DIR)/%.ci4: %.ci4.png
	$(N64GRAPHICS_CI) -i $@ -g $< -f ci4

################################################################

# compressed segment generation
$(BUILD_DIR)/bin/%.o: bin/%.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

# compressed segment generation (actors)
$(BUILD_DIR)/bin/%.o: actors/%.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

$(BUILD_DIR)/bin/%/leveldata.o: levels/%/leveldata.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

$(BUILD_DIR)/bin/%/header.o: levels/%/header.s $(MIO0_DIR)/%/leveldata.mio0 levels/%/script.s
	$(AS) $(ASFLAGS) --no-pad-sections -o $@ $<

# TODO: ideally this would be `-Trodata-segment=0x07000000` but that doesn't set the address
$(BUILD_DIR)/bin/%.elf: $(BUILD_DIR)/bin/%.o
	$(LD) -e 0 -Ttext=$(SEGMENT_ADDRESS) -Map $@.map -o $@ $<

# Override for level.elf, which otherwise matches the above pattern
.SECONDEXPANSION:
$(BUILD_DIR)/bin/%/leveldata.elf: $(BUILD_DIR)/bin/%/leveldata.o $(BUILD_DIR)/bin/$$(TEXTURE_BIN).elf
	$(LD) -e 0 -Ttext=$(SEGMENT_ADDRESS) -Map $@.map --just-symbols=$(BUILD_DIR)/bin/$(TEXTURE_BIN).elf -o $@ $<

$(BUILD_DIR)/bin/%.bin: $(BUILD_DIR)/bin/%.elf
	$(OBJCOPY) -j .rodata $< -O binary $@

$(MIO0_DIR)/%.mio0: $(BUILD_DIR)/bin/%.bin
	$(MIO0TOOL) $< $@

$(MIO0_DIR)/%.mio0.o: $(MIO0_DIR)/%.mio0.s
	$(AS) $(ASFLAGS) -o $@ $<

$(MIO0_DIR)/%.mio0.s: $(MIO0_DIR)/%.mio0
	printf ".section .data\n\n.incbin \"$<\"\n" > $@

$(BUILD_DIR)/%.table: %.aiff
	$(AIFF_EXTRACT_CODEBOOK) $< >$@

$(BUILD_DIR)/%.aifc: $(BUILD_DIR)/%.table %.aiff
	$(VADPCM_ENC) -c $^ $@

$(SOUND_BIN_DIR)/sound_data.ctl: sound/sound_banks/ $(SOUND_BANK_FILES) $(SOUND_SAMPLE_AIFCS)
	$(PYTHON) tools/assemble_sound.py $(BUILD_DIR)/sound/samples/ sound/sound_banks/ $(SOUND_BIN_DIR)/sound_data.ctl $(SOUND_BIN_DIR)/sound_data.tbl $(VERSION_CFLAGS)

$(SOUND_BIN_DIR)/sound_data.tbl: $(SOUND_BIN_DIR)/sound_data.ctl
	touch $@

$(SOUND_BIN_DIR)/sequences.bin: $(SOUND_BANK_FILES) sound/sequences.json sound/sequences/ sound/sequences/$(VERSION)/ $(SOUND_SEQUENCE_FILES)
	$(PYTHON) tools/assemble_sound.py --sequences $@ $(SOUND_BIN_DIR)/bank_sets sound/sound_banks/ sound/sequences.json $(SOUND_SEQUENCE_FILES) $(VERSION_CFLAGS)

$(SOUND_BIN_DIR)/bank_sets: $(SOUND_BIN_DIR)/sequences.bin
	touch $@

$(SOUND_BIN_DIR)/%.m64: $(SOUND_BIN_DIR)/%.o
	$(OBJCOPY) -j .rodata $< -O binary $@

$(SOUND_BIN_DIR)/%.o: $(SOUND_BIN_DIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(SOUND_BIN_DIR)/%.s: $(SOUND_BIN_DIR)/%
	printf ".section .data\n\n.incbin \"$<\"\n" > $@

# Source code
$(BUILD_DIR)/src/goddard/%.o: OPT_FLAGS := -g
$(BUILD_DIR)/src/goddard/%.o: MIPSISET := -mips1
$(NON_MATCHING_O_FILES): CC := $(PYTHON) tools/asm_processor/build.py $(CC) -- $(AS) $(ASFLAGS) --
$(BUILD_DIR)/src/audio/%.o: OPT_FLAGS := -O2 -Wo,-loopunroll,0
$(BUILD_DIR)/src/audio/load.o: OPT_FLAGS := -O2 -framepointer -Wo,-loopunroll,0
$(BUILD_DIR)/lib/src/%.o: OPT_FLAGS :=
$(BUILD_DIR)/lib/src/math/ll%.o: MIPSISET := -mips3 -32
$(BUILD_DIR)/lib/src/math/%.o: OPT_FLAGS := -O2
$(BUILD_DIR)/lib/src/math/ll%.o: OPT_FLAGS :=
$(BUILD_DIR)/lib/src/ldiv.o: OPT_FLAGS := -O2
$(BUILD_DIR)/lib/src/string.o: OPT_FLAGS := -O2
$(BUILD_DIR)/lib/src/gu%.o: OPT_FLAGS := -O3
$(BUILD_DIR)/lib/src/al%.o: OPT_FLAGS := -O3

ifeq ($(VERSION),eu)
$(BUILD_DIR)/lib/src/_Litob.o: OPT_FLAGS := -O3
$(BUILD_DIR)/lib/src/_Ldtob.o: OPT_FLAGS := -O3
$(BUILD_DIR)/lib/src/_Printf.o: OPT_FLAGS := -O3
endif

# Rebuild files with '#ifdef NON_MATCHING' when that macro changes.
$(NON_MATCHING_O_FILES): $(NON_MATCHING_DEP).$(NON_MATCHING)
$(NON_MATCHING_DEP).$(NON_MATCHING):
	@rm -f $(NON_MATCHING_DEP).*
	touch $@

$(BUILD_DIR)/lib/src/math/%.o: lib/src/math/%.c
	@$(CC_CHECK) -MMD -MP -MT $@ -MF $(BUILD_DIR)/lib/src/math/$*.d $<
	$(CC) -c $(CFLAGS) -o $@ $<
	tools/patch_libultra_math $@ || rm $@

$(BUILD_DIR)/%.o: %.c
	@$(CC_CHECK) -MMD -MP -MT $@ -MF $(BUILD_DIR)/$*.d $<
	$(CC) -c $(CFLAGS) -o $@ $<


$(BUILD_DIR)/%.o: %.s $(MIO0_FILES)
	$(AS) $(ASFLAGS) -MD $(BUILD_DIR)/$*.d -o $@ $<

$(BUILD_DIR)/$(LD_SCRIPT): $(LD_SCRIPT)
	$(CPP) $(VERSION_CFLAGS) -MMD -MP -MT $@ -MF $@.d -I include/ -DBUILD_DIR=$(BUILD_DIR) -o $@ $<

$(BUILD_DIR)/libultra.a: $(ULTRA_O_FILES)
	$(AR) rcs -o $@ $(ULTRA_O_FILES)

$(BUILD_DIR)/libgoddard.a: $(GODDARD_O_FILES)
	$(AR) rcs -o $@ $(GODDARD_O_FILES)

$(ELF): $(O_FILES) $(MIO0_OBJ_FILES) $(SOUND_OBJ_FILES) $(SEG_FILES) $(BUILD_DIR)/$(LD_SCRIPT) undefined_syms.txt $(BUILD_DIR)/libultra.a $(BUILD_DIR)/libgoddard.a
	$(LD) -L $(BUILD_DIR) $(LDFLAGS) -o $@ $(O_FILES)$(LIBS) -lultra -lgoddard

$(ROM): $(ELF)
	$(OBJCOPY) $(OBJCOPYFLAGS) $< $(@:.z64=.bin) -O binary
	$(N64CKSUM) $(@:.z64=.bin) $@

$(BUILD_DIR)/$(TARGET).objdump: $(ELF)
	$(OBJDUMP) -D $< > $@



.PHONY: all clean distclean default diff test load libultra
.PRECIOUS: $(MIO0_DIR)/%.mio0 $(MIO0_DIR)/%.mio0.s $(BUILD_DIR)/bin/%.elf $(SOUND_BIN_DIR)/%.ctl $(SOUND_BIN_DIR)/%.tbl $(SOUND_SAMPLE_TABLES) $(SOUND_BIN_DIR)/%.s
.DELETE_ON_ERROR:

# Remove built-in rules, to improve performance
MAKEFLAGS += --no-builtin-rules

-include $(DEP_FILES)

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
