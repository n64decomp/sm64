# Building on Linux

1: For each version (jp/us/eu) that you want to build a ROM for, put an existing ROM at
`./baserom.<version>.z64` for asset extraction.

2: Install the following packages:

__Debian / Ubuntu__
* git
* binutils-mips-linux-gnu / mips64-elf (>= 2.27)
* python3 (>= 3.7)
* build-essential
* pkg-config
* zlib1g-dev
* libaudiofile-dev

__Arch Linux__
* base-devel
* python
* audiofile
* [mips64-elf-binutils](https://aur.archlinux.org/packages/mips64-elf-binutils) (AUR)
* [qemu-irix-git](https://aur.archlinux.org/packages/qemu-irix-git) (AUR)

3: Install qemu-irix

3.a: Options:
1. Clone https://github.com/n64decomp/qemu-irix to somewhere and follow its
   install instructions in the README.
2. Optionally, grab the prebuilt qemu-irix from the Releases section.
3. (Arch) Use AUR package [qemu-irix-git](https://aur.archlinux.org/packages/qemu-irix-git)

3.b: (For options 1 or 2), copy executable `qemu-irix` from irix-linux-user to
   somewhere convenient with a relatively short path.

```
mkdir -p /opt/qemu-irix/bin
cp irix-linux-user/qemu-irix /opt/qemu-irix/bin
```

3.c: Define `QEMU_IRIX` environment variable in your `~/.bashrc` to point to this qemu-irix executable.

```
export QEMU_IRIX=/opt/qemu-irix/bin/qemu-irix
```

4: Run `make` to build the ROM (defaults to us version). Make sure your path to
   the repo is not too long or else this process will error, as the emulated
   IDO compiler cannot handle paths longer than 255 characters.

Build examples:

```
make VERSION=jp -j4       # build (J) version instead with 4 jobs
make VERSION=eu COMPARE=0 # non-matching EU version still WIP
```
