# Super Mario 64 (1996) for Nintendo DSi

- This repo contains a full decompilation of Super Mario 64 (J), (U), (E), and (SH), ported to the Nintendo DSi.
- Naming and documentation of the source code and data structures are in progress.

This repo does not include all assets necessary for compiling the ROMs.
A prior copy of the game is required to extract the assets.

## Windows installation
 * Download the latest source from [here](https://github.com/Hydr8gon/sm64/archive/nds.zip), extract it somewhere
 * Install Docker Desktop from [the Docker website](https://www.docker.com/get-started), and reboot when the installer prompts you
 * Place a Super Mario 64 ROM as baserom.us.z64 in the directory you extracted the zip to
 * Run `build_docker.bat`
 * Once the build is complete, the game will be in `build/us_nds/`.

## Linux installation
 * First follow [the guide for installing devkitPro packages](https://devkitpro.org/wiki/Getting_Started), also installing the `nds-dev` group as mentioned
 * Install the needed tools
   * Debian/Ubuntu: `sudo apt install -y build-essential git python`
   * Fedora: `sudo dnf install gcc make git python`
   * Arch/derivatives like Manjaro: `sudo pacman -S base-devel git python`
 * Clone this repository and change to its directory
   ```
   git clone https://github.com/Hydr8gon/sm64.git
   cd sm64
   ```
 * Place a copy of the USA version of Super Mario 64 in this directory, named `baserom.us.z64`, it should be in the same directory as `Makefile`.
 * Run `make -j$(nproc)` to build the game
 * If the build succeeded, the game will be in `build/us_nds`, named `sm64.us.nds`

## Docker Installation

### Create Docker image

After installing and starting Docker, create the docker image. This only needs to be done once.
```
docker build -t sm64dsi .
```

#### Build

To build, mount the local filesystem into the Docker container and build the ROM with `docker run sm64 make`.

##### macOS example for (U):
```
docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64dsi make VERSION=us -j4
```

##### Linux example for (U):
For a Linux host, Docker needs to be instructed which user should own the output files:
```
docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 --user $UID:$GID sm64dsi make VERSION=us -j4
```

Resulting artifacts can be found in the `build` directory.

## Project Structure
	
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
	|   └── nds: Nintendo DS-specific code
	├── text: dialog, level names, act names
	├── textures: skybox and generic texture data
	└── tools: build tools

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

Run `clang-format` on your code to ensure it meets the project's coding standards.

Official Discord for the original decomp: [discord.gg/DuYH3Fh](https://discord.gg/DuYH3Fh)
