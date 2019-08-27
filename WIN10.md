# Builing on Windows 10

## Setting up the repository

Clone this repository. I'll refer to the directory as repo.

Open CMD and navigate to your repo folder.

Make sure files are using Unix line endings:

```
git config --local core.autocrlf false
git rm --cached -r .
git reset --hard
```

Now you can close CMD.

Choose which versions of the game you want to build:

* Find a clean SM64 JP rom and rename it to `baserom.jp.z64`.
* Find a clean SM64 US rom and rename it to `baserom.us.z64`.
* Find a clean SM64 EU rom and rename it to `baserom.eu.z64`.

Then put that file in your repo folder.

## Setting up the environment

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

## Installing qemu-irix

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

## Building the game

Go to the mount directory:

```
cd ~/mnt
```

From there you can navigate to your repo folder.

Add the following to the terminal:

```
make
```

Add one of these to choose which version to build:

```
VERSION=jp
VERSION=us
VERSION=eu
```

Add this if you're making changes to the code:

```
COMPARE=0
```

Add this to speed up the process by using multiple threads:

```
-j4
```

Finally press Enter to extract assets from the baserom and build the game.
