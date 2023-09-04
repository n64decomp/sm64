include ../../util.mk

HOST_ENV := $(shell uname 2>/dev/null || echo Unknown)
HOST_ENV := $(patsubst MINGW%,MinGW,$(HOST_ENV))

CC           := gcc
CXX          := g++
CFLAGS       := -I . -Wall -Wextra -Wno-unused-parameter -pedantic -O2 -s
LDFLAGS      := -lm
ALL_PROGRAMS := n64graphics n64graphics_ci mio0 n64cksum

BUILD_PROGRAMS := $(ALL_PROGRAMS)

default: all

n64graphics_SOURCES := n64graphics.c utils.c
n64graphics_CFLAGS  := -DN64GRAPHICS_STANDALONE

n64graphics_ci_SOURCES := n64graphics_ci_dir/n64graphics_ci.c n64graphics_ci_dir/exoquant/exoquant.c n64graphics_ci_dir/utils.c

mio0_SOURCES := libmio0.c
mio0_CFLAGS  := -DMIO0_STANDALONE

n64cksum_SOURCES := n64cksum.c utils.c
n64cksum_CFLAGS  := -DN64CKSUM_STANDALONE

all: $(BUILD_PROGRAMS)

clean:
	$(RM) $(ALL_PROGRAMS)

define COMPILE
$(1): $($1_SOURCES)
	$$(CC) $(CFLAGS) $($1_CFLAGS) $$^ -o $$@ $($1_LDFLAGS) $(LDFLAGS)
endef

$(foreach p,$(BUILD_PROGRAMS),$(eval $(call COMPILE,$(p))))

.PHONY: all clean default
