# sm64ios — Super Mario 64 for iOS 6 (armv7)

## Build this app

Use the separate [SM64 iOS Builder](https://github.com/JohnMama12/sm64-ios-builder)
to build this source in WSL. Download or clone that repository and follow its
README for Theos/SDK setup, ROM verification, and compiling a local `.deb`.
Provide your own authentic US ROM; this project provides no ROM, extracted
assets, SDK, or compiled app. The generated package is for local use only:
`src/pc/gfx/LICENSE.txt` prohibits binary redistribution.

> Note: ## ⚠️ 100% vibecoded
>
> The entire iOS port — UIKit shell, GLES 1.1 renderer, on-device build system, the SSH
> tooling — was written by **AI** (via the [OpenCode](https://opencode.ai)
> harness) and Github Copilot with a human at the controls: directing, testing on real hardware, fed it 
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
