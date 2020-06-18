# Super Mario 64 Port

- This repo contains a full decompilation of Super Mario 64 (J), (U), and (E) with minor exceptions in the audio subsystem.
- Naming and documentation of the source code and data structures are in progress.
- Efforts to decompile the Shindou ROM steadily advance toward a matching build.
- Beyond Nintendo 64, it can also target Linux and Windows natively.

This repo does not include all assets necessary for compiling the game.
A prior copy of the game is required to extract the assets.

## Building native executables

### Linux

1. Install prerequisites (Ubuntu): `sudo apt install -y git build-essential pkg-config libusb-1.0-0-dev libsdl2-dev`.
2. Clone the repo: `git clone https://github.com/sm64-port/sm64-port.git`.
3. Place a Super Mario 64 ROM called `baserom.<VERSION>.z64` into the project folder for asset extraction, where `VERSION` can be `us`, `jp`, or `eu`.
4. Run `make` to build. Qualify the version through `make VERSION=<VERSION>`. Add `-j4` to improve build speed (hardware dependent based on the amount of CPU cores available).
5. The executable binary will be located at `build/<VERSION>_pc/sm64.<VERSION>.f3dex2e`.

### Windows

1. Install and update MSYS2, following the directions listed on https://www.msys2.org/.
2. Launch MSYS2 MinGW and install required packages depending on your machine (do **NOT** launch "MSYS2 MSYS"):
  a. 64-bit: Launch "MSYS2 MinGW 64-bit" and install: `pacman -S git make python3 mingw-w64-x86_64-gcc`
  b. 32-bit (will also work on 64-bit machines): Launch "MSYS2 MinGW 32-bit" and install: `pacman -S git make python3 mingw-w64-i686-gcc`
  * Do **NOT** install `gcc`.
3. Clone the repo: `git clone https://github.com/sm64-port/sm64-port.git` and enter it `cd sm64-port`.
4. Place a *Super Mario 64* ROM called `baserom.<VERSION>.z64` into the project folder for asset extraction, where `VERSION` can be `us`, `jp`, or `eu`.
5. Run `make` to build. Qualify the version through `make VERSION=<VERSION>`. Add `-j4` to improve build speed (hardware dependent based on the amount of CPU cores available).
6. The executable binary will be located at `build/<VERSION>_pc/sm64.<VERSION>.f3dex2e.exe`.

### Debugging

The code can be debugged using `gdb`. On Linux install the `gdb` package and execute `gdb <executable>`. On MSYS2 install by executing `pacman -S winpty gdb` and execute `winpty gdb <executable>`. The `winpty` program makes sure the keyboard works correctly in the terminal. In the Makefile, make sure you compile the sources using `-g` rather than `-O2` to include debugging symbols. See any online tutorial for how to use gdb.

## Quick Start ROM building (for Ubuntu)

1. Install prerequisites: `sudo apt install -y build-essential git binutils-mips-linux-gnu python3`.
2. Clone the repo from within Linux: `git clone https://github.com/n64decomp/sm64.git`.
3. Place a Super Mario 64 ROM called `baserom.<VERSION>.z64` into the project folder for asset extraction, where `VERSION` can be `us`, `jp`, or `eu`.
4. Run `make` to build. Qualify the version through `make TARGET_N64=1 VERSION=<VERSION>`. Add `-j4` to improve build speed (hardware dependent based on the amount of CPU cores available).

Ensure the repo path length does not exceed 255 characters. Long path names result in build errors.

## Installation for ROM building

### Windows

Install WSL and a distro of your choice following
[Windows Subsystem for Linux Installation Guide for Windows 10.](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
We recommend either Debian or Ubuntu 18.04 Linux distributions under WSL.
Note: WSL1 does not currently support Ubuntu 20.04.

Next, clone the SM64 repo from within the Linux shell:
`git clone https://github.com/n64decomp/sm64.git`

Then continue following the directions in the [Linux](#linux) installation section below.

### Linux

There are 3 steps to set up a working build.

#### Step 1: Install dependencies

The build system has the following package requirements:
 * ``binutils-mips``
 * ``python3 >= 3.6``
 * ``qemu-irix`` (When building without GCC)

Dependency installation instructions for common Linux distros are provided below:

##### Debian / Ubuntu
To install build dependencies:
```
sudo apt install -y build-essential git binutils-mips-linux-gnu python3
```

Download latest package from [qemu-irix Releases.](https://github.com/n64decomp/qemu-irix/releases)

Install this package with:
```
sudo dpkg -i qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
```

##### Arch Linux
To install build dependencies:
```
sudo pacman -S base-devel python
```
Install the following AUR packages:
* [mips64-elf-binutils](https://aur.archlinux.org/packages/mips64-elf-binutils) (AUR)
* [qemu-irix-git](https://aur.archlinux.org/packages/qemu-irix-git) (AUR)


##### Other Linux distributions

Most modern Linux distributions should have equivalent packages to the other two listed above.
You may have to use a different version of GNU binutils. Listed below are fully compatible binutils
distributions with support in the makefile, and examples of distros that offer them:

* `mips64-elf-` (Arch AUR)
* `mips-linux-gnu-` (Ubuntu and other Debian-based distros)
* `mips64-linux-gnu-` (RHEL/CentOS/Fedora)

You may also use [Docker](#docker-installation) to handle installing an image with minimal dependencies.

#### Step 2: Copy baserom(s) for asset extraction

For each version (jp/us/eu) for which you want to build a ROM, put an existing ROM at
`./baserom.<VERSION>.z64` for asset extraction.

##### Step 3: Build the ROM

Run `make` to build the ROM (defaults to `VERSION=us`).
Other examples:
```
make VERSION=jp -j4       # build (J) version instead with 4 jobs
make VERSION=eu COMPARE=0 # build (EU) version but do not compare ROM hashes
```

Resulting artifacts can be found in the `build` directory.

The full list of configurable variables are listed below, with the default being the first listed:

* ``VERSION``: ``us``, ``jp``, ``eu``, ``sh`` (WIP)
* ``GRUCODE``: ``f3d_old``, ``f3d_new``, ``f3dex``, ``f3dex2``, ``f3dzex``
* ``COMPARE``: ``1`` (compare ROM hash), ``0`` (do not compare ROM hash)
* ``NON_MATCHING``: Use functionally equivalent C implementations for non-matchings. Also will avoid instances of undefined behavior.
* ``CROSS``: Cross-compiler tool prefix (Example: ``mips64-elf-``).
* ``QEMU_IRIX``: Path to a ``qemu-irix`` binary.
* ``TARGET_N64``: ``0`` If set to one, will build an N64 ROM. An unmodified repository will produce one of the following ROMs depending on what ``VERSION`` is set to:

  * sm64.jp.z64 `sha1: 8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51`
  * sm64.us.z64 `sha1: 9bef1128717f958171a4afac3ed78ee2bb4e86ce`
  * sm64.eu.z64 `sha1: 4ac5721683d0e0b6bbb561b58a71740845dceea9`


### macOS

Installing Docker is the recommended avenue for macOS users. This project does not support macOS natively due to lack of macOS host support.

### Docker Installation

#### Create Docker image

Create the docker image with `docker build -t sm64`.

#### Build

To build, mount the local filesystem into the Docker container and build the ROM with `docker run`.

##### macOS example for (U):
```
docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64 make VERSION=us -j4
```

##### Linux example for (U):
For a Linux host, Docker needs to be instructed which user should own the output files:
```
docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 --user $UID:$UID sm64 make VERSION=us -j4
```

Resulting artifacts can be found in the `build` directory.

## Project Structure

```
sm64
├── actors: object behaviors, geo layout, and display lists
├── asm: handwritten assembly code, rom header
│   └── non_matchings: asm for non-matching sections
├── assets: animation and demo data
│   ├── anims: animation data
│   └── demos: demo data
├── bin: C files for ordering display lists and textures
├── build: output directory
├── data: behavior scripts, misc. data
├── doxygen: documentation infrastructure
├── enhancements: example source modifications
├── include: header files
├── levels: level scripts, geo layout, and display lists
├── lib: SDK library code
├── rsp: audio and Fast3D RSP assembly code
├── sound: sequences, sound samples, and sound banks
├── src: C source code for game
│   ├── audio: audio code
│   ├── buffers: stacks, heaps, and task buffers
│   ├── engine: script processing engines and utils
│   ├── game: behaviors and rest of game source
│   ├── goddard: Mario intro screen
│   ├── menu: title screen and file, act, and debug level selection menus
│   └── pc: port code, audio and video renderer
├── text: dialog, level names, act names
├── textures: skybox and generic texture data
└── tools: build tools
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

Run `clang-format` on your code to ensure it meets the project's coding standards.

Official Discord: https://discord.gg/7bcNTPK
