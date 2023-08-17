# Build options can be changed by modifying the makefile or by building with 'make SETTING=value'.
# It is also possible to override the settings in Defaults in a file called .make_options as 'SETTING=value'.

-include .make_options

#### Defaults ####

# if WERROR is 1, pass -Werror to CC, so warnings would be treated as errors
WERROR ?= 0
# if RELEASE is 1 strip binaries as well as enable optimizations
RELEASE ?= 1
# On Mac, set this to `universal` to build universal (x86+ARM) binaries
TARGET ?= native
# Set to 1 to build with sanitization enabled
# N.B. cannot be used for `make setup` at the moment due to recomp.cpp not respecting it
ASAN ?= 0

# IDO 5.3 only for Super Mario 64
IDO_VERSION := IDO53
IDO_TC      := cc acpp as0 as1 cfe copt ugen ujoin uld umerge uopt usplit


# -- determine the host environment and target
# | Host  | Targets           |
# |-------|-------------------|
# | macOS | native, universal |
# | linux | native            |
# | win   | native            |

UNAME_S := $(shell uname -s)
UNAME_P := $(shell uname -p)

MAKE   := make
ifeq ($(OS),Windows_NT)
  DETECTED_OS := windows
else ifeq ($(UNAME_S),Linux)
  DETECTED_OS := linux
else ifeq ($(UNAME_S),Darwin)
  DETECTED_OS := macos
  MAKE := gmake
  CPPFLAGS += -xc++
else
  $(error Unsupported host OS for Makefile)
endif

RABBITIZER := tools/rabbitizer
RABBITIZER_LIB := $(RABBITIZER)/build/librabbitizerpp.a

CC    := gcc
CXX   := g++
STRIP := strip

CSTD         ?= -std=c11
CFLAGS       ?= -MMD -fno-strict-aliasing -I.
CXXSTD       ?= -std=c++17
CXXFLAGS     ?= -MMD
WARNINGS     ?= -Wall -Wextra
LDFLAGS      ?= -lm
RECOMP_FLAGS ?=

ifneq ($(WERROR),0)
  WARNINGS += -Werror
endif

ifeq ($(RELEASE),1)
  OPTFLAGS     ?= -Os
else
  OPTFLAGS     ?= -Og -g3
  STRIP := @:
endif

ifneq ($(ASAN),0)
  CFLAGS      += -fsanitize=address -fsanitize=pointer-compare -fsanitize=pointer-subtract -fsanitize=undefined -fno-sanitize-recover=all
  CXXFLAGS    += -fsanitize=address -fsanitize=pointer-compare -fsanitize=pointer-subtract -fsanitize=undefined -fno-sanitize-recover=all
endif


ifeq ($(DETECTED_OS),windows)
  CXXFLAGS     += -static
endif

# -- Build Directories
# designed to work with Make 3.81 (macOS/last GPL-2 version)
# https://ismail.badawi.io/blog/automatic-directory-creation-in-make/
BUILD_BASE ?= build
BUILD_DIR  := $(BUILD_BASE)
BUILT_BIN  := $(BUILD_DIR)/out


# -- Location of original IDO binaries in SM64 repo
IRIX_USR_DIR ?= ../ido5.3_compiler/usr

# -- Location of the irix tool chain error messages
ERR_STRS        := $(BUILT_BIN)/err.english.cc

RECOMP_ELF      := $(BUILD_BASE)/recomp.elf
LIBC_IMPL_O     := libc_impl.o

TARGET_BINARIES := $(foreach binary,$(IDO_TC),$(BUILT_BIN)/$(binary))
O_FILES         := $(foreach binary,$(IDO_TC),$(BUILD_DIR)/$(binary).o)
C_FILES         := $(O_FILES:.o=.c)

# Automatic dependency files
DEP_FILES := $(O_FILES:.o=.d)

# create build directories
$(shell mkdir -p $(BUILT_BIN))

# per-file flags
# 5.3 ugen relies on UB stack reads
# to emulate, pass the conservative flag to `recomp`
$(BUILD_BASE)/ugen.c: RECOMP_FLAGS := --conservative

$(RECOMP_ELF): CXXFLAGS  += -I$(RABBITIZER)/include -I$(RABBITIZER)/cplusplus/include
$(RECOMP_ELF): LDFLAGS   += -L$(RABBITIZER)/build -lrabbitizerpp

ifneq ($(DETECTED_OS),windows)
# For traceback
$(RECOMP_ELF): LDFLAGS   += -ldl
endif
ifeq ($(DETECTED_OS),linux)
# For traceback
$(RECOMP_ELF): LDFLAGS   += -Wl,-export-dynamic
endif

# Too many warnings, disable everything for now...
$(RECOMP_ELF): WARNINGS  += -Wpedantic -Wno-shadow -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-implicit-fallthrough
%/$(LIBC_IMPL_O): CFLAGS   += -D$(IDO_VERSION)
# TODO: fix warnings
%/$(LIBC_IMPL_O): WARNINGS += -Wno-unused-parameter -Wno-unused-variable -Wno-unused-but-set-variable -Wno-sign-compare -Wno-deprecated-declarations

#### Main Targets ###

all: $(TARGET_BINARIES) $(ERR_STRS)

setup:
	$(MAKE) -C $(RABBITIZER) static CC=$(CC) CXX=$(CXX) DEBUG=$(DEBUG)
	$(MAKE) $(RECOMP_ELF)

clean:
	$(RM) -r $(BUILD_DIR)

distclean:
	$(RM) -r $(BUILD_BASE)
	$(MAKE) -C $(RABBITIZER) distclean

c_files: $(C_FILES)


.PHONY: all clean distclean setup
.DEFAULT_GOAL := all
# Prevent removing intermediate files
.SECONDARY:


#### Various Recipes ####

$(BUILD_BASE)/%.elf: %.cpp
	$(CXX) $(CXXSTD) $(OPTFLAGS) $(CXXFLAGS) $(WARNINGS) -o $@ $^ $(LDFLAGS)


$(BUILD_DIR)/%.c: $(IRIX_USR_DIR)/lib/%
	$(RECOMP_ELF) $(RECOMP_FLAGS) $< > $@ || ($(RM) -f $@ && false)

# cc and strip are special and are stored in the `bin` folder instead of the `lib` one
$(BUILD_DIR)/%.c: $(IRIX_USR_DIR)/bin/%
	$(RECOMP_ELF) $(RECOMP_FLAGS) $< > $@ || ($(RM) -f $@ && false)


$(BUILT_BIN)/%.cc: $(IRIX_USR_DIR)/lib/%.cc
	cp $^ $@


ifeq ($(TARGET),universal)
MACOS_FAT_TARGETS ?= arm64-apple-macos11 x86_64-apple-macos10.14

FAT_FOLDERS  := $(foreach target,$(MACOS_FAT_TARGETS),$(BUILD_DIR)/$(target))

# create build directories
$(shell mkdir -p $(FAT_FOLDERS))

# TODO: simplify
FAT_BINARIES := $(foreach binary,$(IDO_TC),$(BUILT_BIN)/arm64-apple-macos11/$(binary)) \
                $(foreach binary,$(IDO_TC),$(BUILT_BIN)/x86_64-apple-macos10.14/$(binary))

$(BUILT_BIN)/%: $(BUILD_DIR)/arm64-apple-macos11/% $(BUILD_DIR)/x86_64-apple-macos10.14/% | $(ERR_STRS)
	lipo -create -output $@ $^


$(BUILD_DIR)/arm64-apple-macos11/%: $(BUILD_DIR)/arm64-apple-macos11/%.o $(BUILD_DIR)/arm64-apple-macos11/$(LIBC_IMPL_O) | $(ERR_STRS)
	$(CC) $(CSTD) $(OPTFLAGS) $(CFLAGS) -target arm64-apple-macos11 -o $@ $^ $(LDFLAGS)
	$(STRIP) $@

$(BUILD_DIR)/x86_64-apple-macos10.14/%: $(BUILD_DIR)/x86_64-apple-macos10.14/%.o $(BUILD_DIR)/x86_64-apple-macos10.14/$(LIBC_IMPL_O) | $(ERR_STRS)
	$(CC) $(CSTD) $(OPTFLAGS) $(CFLAGS) -target x86_64-apple-macos10.14 -o $@ $^ $(LDFLAGS)
	$(STRIP) $@

$(BUILD_DIR)/arm64-apple-macos11/%.o: $(BUILD_DIR)/%.c
	$(CC) -c $(CSTD) $(OPTFLAGS) $(CFLAGS) -target arm64-apple-macos11 -o $@ $<

$(BUILD_DIR)/x86_64-apple-macos10.14/%.o: $(BUILD_DIR)/%.c
	$(CC) -c $(CSTD) $(OPTFLAGS) $(CFLAGS) -target x86_64-apple-macos10.14 -o $@ $<


$(BUILD_DIR)/arm64-apple-macos11/$(LIBC_IMPL_O): libc_impl.c
	$(CC) -c $(CSTD) $(OPTFLAGS) $(CFLAGS) $(WARNINGS) -target arm64-apple-macos11 -o $@ $<

$(BUILD_DIR)/x86_64-apple-macos10.14/$(LIBC_IMPL_O): libc_impl.c
	$(CC) -c $(CSTD) $(OPTFLAGS) $(CFLAGS) $(WARNINGS) -target x86_64-apple-macos10.14 -o $@ $<

else
$(BUILT_BIN)/%: $(BUILD_DIR)/%.o $(BUILD_DIR)/$(LIBC_IMPL_O) | $(ERR_STRS)
	$(CC) $(CSTD) $(OPTFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	$(STRIP) $@

$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.c
	$(CC) -c $(CSTD) $(OPTFLAGS) $(CFLAGS) -o $@ $<


$(BUILD_DIR)/$(LIBC_IMPL_O): libc_impl.c
	$(CC) -c $(CSTD) $(OPTFLAGS) $(CFLAGS) $(WARNINGS) -o $@ $<
endif

# Remove built-in rules, to improve performance
MAKEFLAGS += --no-builtin-rules

-include $(DEP_FILES)

# --- Debugging
# run `make print-VARIABLE` to debug that variable
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
