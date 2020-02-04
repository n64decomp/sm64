# Super Mario 64

This repo contains a full decompilation of Super Mario 64 (J) and (U).
The source and data have been decompiled but complete naming and documentation
all of the code and data is still a work in progress. Decompiling the (E) ROM
is also an ongoing effort.

It builds the following ROMs:

* sm64.jp.z64 `sha1: 8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51`
* sm64.us.z64 `sha1: 9bef1128717f958171a4afac3ed78ee2bb4e86ce`

This repo does not include all assets necessary for compiling the ROMs.
A prior copy of the game is required to extract the required assets.

## Installation

### Docker

#### 1. Copy baserom(s) for asset extraction

For each version (jp/us/eu) that you want to build a ROM for, put an existing ROM at
`./baserom.<version>.z64` for asset extraction.

#### 2. Create Docker Image

Run the following command and replace <version> with us,jp, or eu.

```
docker image build --build-arg version=<version> -t sm64 .
```

#### 3. Enter image/Copy built file

Create a shell into the Docker image with this command:
```
 docker run -it sm64 /bin/bash
```

You can find the built files in the /build folder.

You can also skip the previous step and copy the built rom out using the following command.
Change the versions if you are not using a us build.
```
docker cp sm64:/sm64/build/us/sm64.us.z64 ./sm64.us.z64
```



### Linux

#### 1. Copy baserom(s) for asset extraction

For each version (jp/us/eu) that you want to build a ROM for, put an existing ROM at
`./baserom.<version>.z64` for asset extraction.

#### 2. Install build dependencies

The build system has the following package requirements:
 * binutils-mips >= 2.27
 * python3 >= 3.6
 * libaudiofile
 * qemu-irix

__Debian / Ubuntu__
```
sudo apt install build-essential pkg-config git binutils-mips-linux-gnu python3 zlib1g-dev libaudiofile-dev
```

Download latest package from [qemu-irix Releases](https://github.com/n64decomp/qemu-irix/releases)
```
sudo dpkg -i qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
```

(Optional) Clone https://github.com/n64decomp/qemu-irix and follow the install instructions in the README.

__Arch Linux__
```
sudo pacman -S base-devel python audiofile
```
Install the following AUR packages:
* [mips64-elf-binutils](https://aur.archlinux.org/packages/mips64-elf-binutils) (AUR)
* [qemu-irix-git](https://aur.archlinux.org/packages/qemu-irix-git) (AUR)

#### 3. Build ROM

Run `make` to build the ROM (defaults to `VERSION=us`). Make sure your path to the repo 
is not too long or else this process will error, as the emulated IDO compiler cannot 
handle paths longer than 255 characters.
Examples:
```
make VERSION=jp -j4       # build (J) version instead with 4 jobs
make VERSION=eu COMPARE=0 # non-matching EU version still WIP
```

## Windows

For Windows, install WSL and a distro of your choice following
[Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
We recommend either Debian or Ubuntu 18.04 Linux distributions under WSL.

Then follow the directions in the [Linux](#linux) installation section above.

## macOS

macOS is currently unsupported as qemu-irix is unable to be built for macOS host.
The recommended path is installing a Linux distribution under a VM.

## Project Structure

```
sm64
├── actors: object behaviors, geo layout, and display lists
├── asm: handwritten assembly code, rom header
│   └── non_matchings: asm for non-matching sections
├── assets: animation and demo data
│   ├── anims: animation data
│   └── demos: demo data
├── bin: asm files for ordering display lists and textures
├── build: output directory
├── data: behavior scripts, misc. data
├── doxygen: documentation infrastructure
├── enhancements: example source modifications
├── include: header files
├── levels: level scripts, geo layout, and display lists
├── lib: SDK library code
├── sound: sequences, sound samples, and sound banks
├── src: C source code for game
│   ├── audio: audio code
│   ├── buffers: stacks, heaps, and task buffers
│   ├── engine: script processing engines and utils
│   ├── game: behaviors and rest of game source
│   ├── goddard: Mario intro screen
│   └── menu: title screen and file, act, and debug level selection menus
├── text: dialog, level names, act names
├── textures: skybox and generic texture data
└── tools: build tools
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

Run clang-format on your code to ensure it meets the project's coding standards.

Official discord: https://discord.gg/27JtCWs
