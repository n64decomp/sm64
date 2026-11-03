# vendor-touch — reference copies from the donor repos (NOT built yet)

Copied verbatim for reference; iOS 6 adaptation happens in
`src/ios/app/N64PadView.*` + `src/ios/gfx/EAGLView.*`.

- `controller_touchscreen.h/.m`, `controller_touchscreen_layouts.inc`
  from ckosmic/sm64ex-ios @ c0a0a8c (`src/pc/controller/`).
  Touch-down/motion/up -> N64 pad wiring + control layouts.
- `gfx_uikit.h/.m` from same (`src/pc/gfx/`). UIKit window manager.
  NOTE: imports `../../ios/ios/TouchControlsViewController.h` (storyboard
  flow) which does not exist for on-device builds — that is why we wrote
  our own manual view hierarchy instead of compiling this file.
- `touch_*.png`, `icon_*.png` from `sm64ios/.../Assets.xcassets`.
  Button/joystick art for the N64 overlay (wired in a later step).

Do not edit these copies; port pieces into `app/` + `gfx/` with iOS 6
API (no storyboards, no weak refs, armv7, GLES1.1/2.0 only).
