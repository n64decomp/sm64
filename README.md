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

## Building on Linux

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

## Building on Windows 10

### Setting up the repository

Clone this repository. I'll refer to the directory as repo.

Open CMD and navigate to your repo folder.

Make sure files are using Unix line endings:

```
git config --local core.autocrlf false
Do `git rm --cached -r .
git reset --hard
```

Now you can close CMD.

Choose which versions of the game you want to build:

* Find a clean SM64 JP rom and rename it to `baserom.jp.z64`.
* Find a clean SM64 US rom and rename it to `baserom.us.z64`.
* Find a clean SM64 EU rom and rename it to `baserom.eu.z64`.

Then put that file in your repo folder.

### Setting up the environment

Go to the Microsoft Store and install the newest Ubuntu.

Notes about WSL:

* Your drives are accessed through `~/mnt/`.
* You paste by clicking the right mouse button.
* If you get `permission denied`, put `sudo` in front of the command.
* When asked to press `Y` or `Enter` to continue, do so.

Install dependencies:

```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install git binutils-mips-linux-gnu python3.7 build-essential pkg-config zlib1g-dev libaudiofile-dev
```

### Installing qemu-irix

Make sure you're in your home directory:

```
cd ~
```

Install qemu-irix:

```
wget https://github.com/camthesaxman/qemu-irix/releases/download/v0.1/qemu-irix
sudo mkdir -p /opt/qemu-irix/bin
sudo cp ./qemu-irix /opt/qemu-irix/bin
sudo chmod +x /opt/qemu-irix/bin/qemu-irix
```

Test whether it worked:

```
ls /opt/qemu-irix/bin
```

It should return `qemu-irix` in green letters.

Next we'll add qemu-irix to the path variable.

Open your bashrc file in a text editor:

```
nano ~/.bashrc
```

Use the arrow keys to scroll to the bottom of the file.

If last line is something like `QEMU_IRIX="/home/username/Documents/qemu-irix"`, remove it.

At the end of the file, add:

```
export QEMU_IRIX=/opt/qemu-irix/bin/qemu-irix
```

Press Ctrl + O to export the file, and make sure to confirm saving it.

Press Ctrl + X to exit the text editor.

This will take effect when you restart Ubuntu.

If you don't want to restart, paste into the terminal:

```
export QEMU_IRIX=/opt/qemu-irix/bin/qemu-irix
```

Test whether it worked:

```
${QEMU_IRIX}
```

It should return something, most likely `no user program specified`.

### Building the game

Go to the mount directory:

```
cd ~/mnt
```

From there you can navigate to your repo folder.

To extract the assets from your rom and build the game (Japan) with 4 jobs:

```
make VERSION=jp -j4
```

To extract the assets from your rom and build the game (US) with 4 jobs:

```
make VERSION=us -j4
```

To extract the assets from your rom and build the game (EU, non-matching) with 4 jobs:

```
make VERSION=eu COMPARE=0 -j4
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

Run clang-format on your code to ensure it meets the project's coding standards.

Official discord: https://discord.gg/27JtCWs
