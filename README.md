# sm64ios — Super Mario 64 for iOS 6 (first-generation iPad / armv7)

> Note: ## ⚠️ 100% vibecoded
>
> The entire iOS port — UIKit shell, GLES 1.1 renderer, on-device build system, the SSH
> tooling — was written by **AI** (via the [OpenCode](https://opencode.ai)
> harness) with a human at the controls: directing, testing on real hardware, fed it 
> back crash logs until it ran.  It works, but it is
> machine-written code. Expect werid bugs here and there!

A native port of *Super Mario 64* to old 32-bit iOS. No Xcode, no Mac, no PC in the loop for
the game itself: the app is **compiled on the iPad** with an on-device clang and pseudo-signed
with `ldid`. The target is the first-generation iPad (1 GHz A4, PowerVR SGX535, 256 MB RAM)
running iOS 6, on top of a decompilation and a PC port:

- **[n64decomp/sm64](https://github.com/n64decomp/sm64)** — the Super Mario 64 decompilation.
  This repository is a **modified fork** of it (all of its history is here).
- **[sm64-port/sm64-port](https://github.com/sm64-port/sm64-port)** — the PC port whose
  porting layer this fork reuses (`src/pc/**`, the root `Makefile`, the asset-extraction
  toolchain). Several of those files are carried over byte-for-byte.
- The iOS layer (`src/ios/**`, `tools/ios/**`, `src/ios/Makefile.ios`) is new in this fork.

---

## Status /

- **Tested:** iOS 6 (6.1.3) on a first-generation iPad (`iPad1,1`) set up with
  **SundanceInH2A**. The full game boots, plays, and saves, with audio and on-screen controls.
- **Not tested:** every other device and every other iOS version. There is exactly one
  known-good configuration — the one listed above it may or may not work on other devices. 
- **Expected range:** this is a 32-bit (armv7) app built against the iOS 6 SDK, using
  OpenGL ES 1.1 + EAGL. In principle that should run on iOS 6 through iOS 10 — the last iOS
  release that runs 32-bit apps. iOS 11 and later **cannot** run 32-bit apps at all, so this
  port can never run there. iOS 7–10 is untested: treat it as a "maybe", not a promise.
-**Bugs:**
- The game runs correctly, I have not encountered any crashes. A couple of game textures/vertex colors may display incorrectly.
- The game's audio occasionally cuts to white noise, muting or lowering the volume to 0 and back up seems to tempoairly fix it.


## ⚠️ No ROM, no game assets, no binaries provided

**This repository contains no ROM, no extracted game assets, and no compiled binaries.**
All original assets must be generated locally, on your machine, from *your own* ROM.

- You need your own, legally obtained copy of *Super Mario 64* to build and play this.
  Nothing is provided, linked, or hinted at here. Do not ask for ROMs.
- No compiled output is provided. You must compile everything from scratch
  yourself — and per one of the bundled licenses (below) you may not redistribute compiled
  binaries of this project in any shape or form.


## Supported game regions and hashes

The app's ROM validator and the build system recognize the classic SM64 dumps by SHA-1:

| Region             | File you provide    | SHA-1                                      | Status                           |
| ------------------ | ------------------- | ------------------------------------------ | -------------------------------- |
| US (NTSC-U)        | `baserom.us.z64`    | `9bef1128717f958171a4afac3ed78ee2bb4e86ce` | **Supported** (built and tested) |
| JP (NTSC-J)        | `baserom.jp.z64`    | `8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51` | Recognized; not supported on iOS |
| EU (PAL)           | `baserom.eu.z64`    | `4ac5721683d0e0b6bbb561b58a71740845dceea9` | Recognized; not supported on iOS |
| Shindou (JP, 1997) | `baserom.sh.z64`    | `3f319ae697533a255a1003d09202379d78d5a2e0` | Recognized; not supported on iOS |

Only the **US** version is supported end-to-end: the iOS build compiles `VERSION_US` data only
(`src/ios/Makefile.ios`). The validator recognizes all four hashes above and will start the US
game from any of them — but only the US combination has been built and tested; treat the rest
as unsupported. A dump in the "wrong" byte order (`.n64`/`.v64` instead of
`.z64`) is fixed for you by `tools/ios/romcheck.py`:

```sh
python tools/ios/romcheck.py "Super Mario 64 (USA).n64"
# -> writes baserom.us.z64 and prints OK/MISMATCH
```

## Requirements

### Dev machine (for asset extraction and pushing files to the iPad)

- Linux, or Windows with MSYS2/MinGW (Git Bash works too)
- `git`, Python 3, GNU Make and a C compiler — nothing else. On Ubuntu:
  `sudo apt install -y git build-essential python3`.
  On Windows: `pacman -S git make python3 mingw-w64-x86_64-gcc` in an MSYS2 **MinGW** shell.
  No SDL, no PC toolchain: building a PC copy of the game is not part of this workflow.
- `pip install paramiko` (used by `tools/ios/deploy.py`; iOS 6's sshd is too old for modern
  OpenSSH clients).

### iPad

- Jailbroken iOS 6 device (target: first-generation iPad, iPad1,1), SSH enabled.
- From Cydia: `org.coolstar.llvm-clang32`, `org.coolstar.ld64`, `org.coolstar.cctools`,
  `ldid`, `make`, `openssh` (and `uikittools` for `uicache`/`uiopen`).
- An iPhoneOS 6.x SDK installed at `/private/var/sdk` (edit `SYSROOT` in
  `src/ios/Makefile.ios` if yours lives elsewhere).
- A root SSH key in `/var/root/.ssh/authorized_keys` (or use password auth).

## Build guide

### 1. Get the source

```sh
git clone <your-fork-url> sm64ios
cd sm64ios
```

### 2. Put your ROM in the right spot

Place your US ROM in the **repository root, next to the `Makefile`**, named exactly
`baserom.us.z64` (use `tools/ios/romcheck.py` from the section above to convert and verify).


### 3. Generate the game data (on the dev machine)

```sh
make -j4
```

That is the default target (also available as `make assets`). It builds the small host tools
in `tools/`, extracts the ROM into `build/us_pc/**`, and converts every texture, text table,
animation, demo and sound bank that the game compiles against. It does **not** compile or
link a PC copy of the game: there is nothing extra to install and no SDL to configure.

The sound tables are always written for the 32-bit little-endian armv7 target, so a 64-bit
host cannot produce audio data the iPad chokes on (this used to be a separate manual step).

Re-running `make` is cheap: only changed files are regenerated. Nothing under `build/` is
tracked by git — see the note at the top of this README.

### 4. Push everything to the iPad

```sh
pip install paramiko                      # one-time
SM64IOS_HOST=192.168.x.x python tools/ios/deploy.py sync
```

(`SM64IOS_HOST` is your iPad's IP. On Windows PowerShell: `$env:SM64IOS_HOST="192.168.x.x"`;
cmd.exe: `set SM64IOS_HOST=192.168.x.x`.) Other optional variables: `SM64IOS_USER` (default
`root`), `SM64IOS_KEY` (default `~/.ssh/sm64ios_ed25519`), `SM64IOS_REMOTE_DIR` (default
`/var/root/sm64ios_build`).

`deploy.py sync` copies `src`, `include`, `actors`, `levels`, `bin`, `data`, `sound`, `lib`
and the generated `build/us_pc` to the device, skipping compiled objects and raw textures
(see `SYNC_DIRS`/`SKIP_EXT` in the script). A manual `rsync`/`scp` of those same directories
works too; if you use a raw `ssh`, note that the iOS 6 sshd only speaks ancient KEX/ciphers —
add `-oKexAlgorithms=+diffie-hellman-group1-sha1 -oHostKeyAlgorithms=+ssh-rsa
-oPubkeyAcceptedAlgorithms=+ssh-rsa`, or just let `deploy.py` handle it.

### 5. Compile on the device — terminal or SSH

Either **SSH in** from your computer (`ssh root@192.168.x.x`), or open a **terminal app on
the iPad itself** (e.g. MobileTerminal). The commands are identical:

```sh
cd /var/root/sm64ios_build/src/ios
make -f Makefile.ios game GAME_OPT=-O0
```

- `GAME_OPT=-O0` is the configuration everything was tested with (and what `deploy.py` uses).
  `-O2` (the Makefile default) builds too and is faster if you don't hit issues — it was just
  less road-tested on the A4.
- In a hurry, `make -f Makefile.ios game_objs` compiles the game objects without linking —
  a quick way to check the toolchain.
- A full build compiles several hundred game files on a 1 GHz A4 — the first run is slow;
  subsequent (incremental) builds are fast.
- Output: `src/ios/build/SM64.app`, with the binary already `ldid`-signed by the Makefile.

Or do step 4 + 5 in one shot from the dev machine: `python tools/ios/deploy.py build`.

### 6. Install and launch

On the device (or over SSH):

```sh
cd /var/root/sm64ios_build/src/ios
rm -rf /Applications/SM64.app
cp -R build/SM64.app /Applications/SM64.app
su mobile -c uicache
su mobile -c 'uiopen sm64ios://launch'
```

`uicache` refreshes SpringBoard so the app icon appears; `uiopen` launches it via its URL
scheme (`sm64ios://`). You can also just tap the **SM64** icon on the home screen.
From the dev machine: `python tools/ios/deploy.py install` does step 5 + this install.

### 7. Give the app its ROM

```sh
SM64IOS_HOST=192.168.x.x python tools/ios/deploy.py pushrom baserom.us.z64
```

This drops the ROM into `/var/mobile/Documents/` (the app's Documents folder). Alternatives:
iTunes File Sharing (the app exposes its Documents) or a plain `scp` to that directory.

On launch the app scans Documents for `.z64`/`.n64`/`.v64` files, validates the SHA-1 against
the table above, and boots the game once it finds a good one. Saves and settings
(`sm64_save_file.bin`, `sm64config.txt`) are created in the same folder.

### Quick reference (already-set-up machine)

```sh
make -j4                                                  # after source or asset changes
SM64IOS_HOST=<ipad-ip> python tools/ios/deploy.py install # sync + build + install
SM64IOS_HOST=<ipad-ip> python tools/ios/deploy.py pushrom baserom.us.z64   # first time
SM64IOS_HOST=<ipad-ip> python tools/ios/deploy.py launch
```

## Troubleshooting

- **Crash at boot inside the audio code.** Stale generated data from an older checkout. Run
  `make clean`, then `make` (step 3), sync, and rebuild.
- **"ROMs found, but no known SM64 dump".** Hash mismatch — check the table above, convert
  the dump with `tools/ios/romcheck.py`.
- **`ssh`/`scp` refuse to connect.** Modern OpenSSH rejects the iOS 6 sshd's algorithms; use
  the legacy flags above, or `tools/ios/deploy.py`, which exists for exactly this reason.
- **The game feels slow.** Try rebuilding with `GAME_OPT=-O2` (or without overriding it).
  `-O0` is the most tested setting, not the fastest.
- **Is the app even alive?** `tail /var/mobile/Documents/sm64ios-heartbeat.log` — the app
  logs its boot stages (EAGL context, framebuffer, ROM boot) there.
- **"EAGL context failed"** on the shell screen — no GLES 1.1 on the device; unexpected on
  any armv7 iOS device.

## Repository layout (iOS-relevant)

```
src/ios/
  Makefile.ios        the on-device build (clang, armv7, iOS 6 SDK, ldid)
  app/                UIKit shell: main, app delegate, ROM validator, on-screen N64 pad
  app/icons/          app icon set — every iOS 6 size for iPhone, iPad and iTunes artwork
  gfx/                EAGLView (CAEAGLLayer + CADisplayLink) and the GLES 1.1 Fast3D
                      renderer plugin (RAPI) the game renders through
  audio/              CoreAudio/RemoteIO audio output
  libultra_shim/      early bring-up libultra shims (kept for reference)
  vendor-touch/       reference copies of the touch-control code the pad was adapted from
                      (see its README.txt for provenance)
tools/ios/
  deploy.py           sync / build / install / launch / pushrom over SSH (paramiko)
  romcheck.py         ROM dump validation + byte-order conversion
  grab_screen.py      screenshot grabber (dev helper)
  symbolize.py        crash log symbolizer (dev helper)
```

## Credits, lineage and licensing

This is a **modified fork of [n64decomp/sm64](https://github.com/n64decomp/sm64)**. If you
fork or reuse it, please keep the upstream credits — this project would not exist without:

- **[n64decomp/sm64](https://github.com/n64decomp/sm64)** — the decompilation: all of the
  game code, actors, levels and data structures this port compiles. Licensed CC0-1.0.
- **[sm64-port/sm64-port](https://github.com/sm64-port/sm64-port)** — the PC port: the
  porting layer (`src/pc/**`), build system, and extraction toolchain adapted here. The
  Fast3D renderer under `src/pc/gfx/` is © 2020 Emill and MaikelChan.
- **VDavid003 ([sm64-port-android](https://github.com/VDavid003/sm64-port-android))** — the
  on-screen touch controls the N64 pad is based on ("please keep authorship").
- **ckosmic/[sm64ex-ios](https://github.com/ckosmic/sm64ex-ios)** — reference touch/gfx code
  kept under `src/ios/vendor-touch/` (`README.txt` there records the exact provenance).
- **queueRAM's [sm64tools](https://github.com/queueRAM/sm64tools)** — `n64graphics`/`mio0`
  and friends (MIT), vendored under `tools/`.
- **stb** and the other vendored helpers under `tools/` — each ships with its own license
  file. The N64 matching toolchain upstream ships (IDO/iQue compilers, armips, asm-processor,
  n64cksum, ...) is **not** included in this fork; only the asset-pipeline tools are.
- Tested on iOS 6 on a first-generation iPad using **SundanceInH2A**. Assumed to work on iPad 2,3,4,etc 

**Licensing summary**

- The project's own code is **CC0 1.0 Universal** (`LICENSE.md`) — the same license as
  n64decomp/sm64.
- Exceptions (third-party code bundled in-tree):
  - `src/pc/gfx/` — the Fast3D renderer is **source-only**: redistribution in binary form is
    not allowed (`src/pc/gfx/LICENSE.txt`). Another reason this repo ships source only.
  - `tools/**` — third-party build tools keep their own licenses (e.g.
    `tools/sm64tools.LICENSE` — MIT © queueRAM; `tools/n64graphics_ci_dir/LICENSE`;
    `tools/stb/*`).
  - `src/ios/vendor-touch/` — reference copies, see its `README.txt`.
- **No Game assets are included here** *Super Mario 64* and its assets are
  © Nintendo.