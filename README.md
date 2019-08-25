# Super Mario 64

This is a decompilation of Super Mario 64.

It builds the following ROMs:

* sm64.jp.z64 `sha1: 8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51`
* sm64.us.z64 `sha1: 9bef1128717f958171a4afac3ed78ee2bb4e86ce`

This repo does not include all assets necessary for compiling the ROMs.
A prior copy of the game is required.

Official discord: https://discord.gg/27JtCWs

## Installation

### Linux

1. For each version (jp/us/eu) that you want to build a ROM for, put an existing ROM at `baserom.<version>.z64`.
This will be used for asset extraction.

2. Install the following packages:

* make
* git
* binutils-mips-linux-gnu / mips64-elf (>= 2.27)
* python3 (>= 3.7)
* build-essential
* pkg-config
* zlib1g-dev
* libaudiofile-dev

3. Clone https://github.com/camthesaxman/qemu-irix to somewhere and follow its install instructions in the README.

    3b. Optionally, grab the prebuilt qemu-irix from the Releases section.

4. Take the executable `qemu-irix` in irix-linux-user and put it somewhere where you will define an environment variable to it.

5. Define `QEMU_IRIX` in your bashrc to point to this qemu-irix executable.

6. After setting this repository up, run `make` to build the ROM. Make sure your path is not too long or else this process will error, as the emulated IDO compiler cannot handle paths longer than 255 characters.

## Windows

For Windows, install WSL and a distro of your choice (preferably a modern version of Ubuntu) and follow the Linux guide.
