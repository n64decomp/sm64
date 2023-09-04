# Static Recompilation of IRIX Programs

Convert selected IRIX C toolchain programs into modern Linux or macOS programs

## Supported Programs

* IDO 5.3
  * cc, acpp, as0, as1, cfe, copt, ugen, ujoin, uld, umerge, uopt, usplit, ld, strip, upas
* IDO 7.1
  * cc, acpp, as0, as1, cfe, ugen, ujoin, uld, umerge, uopt, usplit, upas

## Dependencies

### Linux (Debian / Ubuntu)

```bash
sudo apt-get install build-essential
```

### macOS

[Install homebrew](https://brew.sh/) and then:

```bash
brew install make
```

## Building

First build the recomp binary itself

```bash
make setup
```

```bash
make VERSION=5.3
make VERSION=7.1
```

The build artifacts are located in `build/{7.1|5.3}/out`. Add `-j{thread num}` for multithreaded building.

By default, debug builds are created with less optimizations, debug flags, and unstripped binaries.
Add `RELEASE=1` to build release builds with optimizations and stripped binaries.

### Creating Universal ARM/x86_64 macOS Builds

By default, make build script create native binaries on macOS. This was done to minimize the time to build the recompiled suite.
In order to create "fat," universal ARM and x86_64, pass `TARGET=universal` to `gmake`.

### Manual Building

Example for compiling `as1` in a Linux environment:

```bash
make -C tools/rabbitizer
g++ -Itools/rabbitizer/include -Itools/rabbitizer/cplusplus/include recomp.cpp -o recomp.elf -g -Ltools/rabbitizer/build -lrabbitizerpp
./recomp.elf ido/7.1/usr/lib/as1 > as1_c.c
gcc libc_impl.c as1_c.c -o as1 -g -fno-strict-aliasing -lm -DIDO71
```

Use the same approach for `cc`, `cfe`, `uopt`, `ugen`, `as1` (and `copt` if you need that).

Use `-DIDO53` instead of `-DIDO71` if the program you are trying to recompile was compiled with IDO 5.3 rather than IDO 7.1.

To compile `ugen` for IDO 5.3, add `--conservative` when invoking `./recomp.elf`. This mimics UB present in `ugen53`. That program reads uninitialized stack memory and its result depends on that stack memory.
