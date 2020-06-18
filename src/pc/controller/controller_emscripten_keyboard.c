#ifdef TARGET_WEB

#include <string.h>
#include <emscripten/html5.h>
#include "macros.h"
#include "controller_keyboard.h"

static const struct {
    const char *code;
    int scancode;
} keymap_browser[] = {
    {"Escape", 0x01},
    {"Digit1", 0x02 },
    {"Digit2", 0x03 },
    {"Digit3", 0x04 },
    {"Digit4", 0x05 },
    {"Digit5", 0x06 },
    {"Digit6", 0x07 },
    {"Digit7", 0x08 },
    {"Digit8", 0x09 },
    {"Digit9", 0x0a },
    {"Digit0", 0x0b },
    {"Minus", 0x0c },
    {"Equal", 0x0d },
    {"Backspace", 0x0e },
    {"Tab", 0x0f },
    {"KeyQ", 0x10 },
    {"KeyW", 0x11 },
    {"KeyE", 0x12 },
    {"KeyR", 0x13 },
    {"KeyT", 0x14 },
    {"KeyY", 0x15 },
    {"KeyU", 0x16 },
    {"KeyI", 0x17 },
    {"KeyO", 0x18 },
    {"KeyP", 0x19 },
    {"BracketLeft", 0x1a },
    {"BracketRight", 0x1b },
    {"Enter", 0x1c },
    {"ControlLeft", 0x1d },
    {"KeyA", 0x1e },
    {"KeyS", 0x1f },
    {"KeyD", 0x20 },
    {"KeyF", 0x21 },
    {"KeyG", 0x22 },
    {"KeyH", 0x23 },
    {"KeyJ", 0x24 },
    {"KeyK", 0x25 },
    {"KeyL", 0x26 },
    {"Semicolon", 0x27 },
    {"Quote", 0x28 },
    {"Backquote", 0x29 },
    {"ShiftLeft", 0x2a },
    {"Backslash", 0x2b },
    {"KeyZ", 0x2c },
    {"KeyX", 0x2d },
    {"KeyC", 0x2e },
    {"KeyV", 0x2f },
    {"KeyB", 0x30 },
    {"KeyN", 0x31 },
    {"KeyM", 0x32 },
    {"Comma", 0x33 },
    {"Period", 0x34 },
    {"Slash", 0x35 },
    {"ShiftRight", 0x36 },
    {"NumpadMultiply", 0x37 },
    {"AltLeft", 0x38 },
    {"Space", 0x39 },
    {"CapsLock", 0x3a },
    {"F1", 0x3b },
    {"F2", 0x3c },
    {"F3", 0x3d },
    {"F4", 0x3e },
    {"F5", 0x3f },
    {"F6", 0x40 },
    {"F7", 0x41 },
    {"F8", 0x42 },
    {"F9", 0x43 },
    {"F10", 0x44 },
    {"NumLock", 0x45 },
    {"ScrollLock", 0x46 },
    {"Numpad7", 0x47 },
    {"Numpad8", 0x48 },
    {"Numpad9", 0x49 },
    {"NumpadSubtract", 0x4a },
    {"Numpad4", 0x4b },
    {"Numpad5", 0x4c },
    {"Numpad6", 0x4d },
    {"NumpadAdd", 0x4e },
    {"Numpad1", 0x4f },
    {"Numpad2", 0x50 },
    {"Numpad3", 0x51 },
    {"Numpad0", 0x52 },
    {"NumpadDecimal", 0x53 },
    {"PrintScreen", 0x54 },
    // 0x55
    {"IntlBackslash", 0x56 },
    {"F11", 0x57 },
    {"F12", 0x58 },
    {"IntlRo", 0x59 },
    //{"Katakana", 0 },
    //{"Hiragana", 0 },
    {"NumpadEnter", 0x11c },
    {"ControlRight", 0x11d },
    {"NumpadDivide", 0x135 },
    {"AltRight", 0x138 },
    {"Home", 0x147 },
    {"ArrowUp", 0x148 },
    {"PageUp", 0x149 },
    {"ArrowLeft", 0x14b },
    {"ArrowRight", 0x14d },
    {"End", 0x14f },
    {"ArrowDown", 0x150 },
    {"PageDown", 0x151 },
    {"Insert", 0x152 },
    {"Delete", 0x153 },
    {"Pause", 0x21d },
    {"MetaLeft", 0x15b },
    {"MetaRight", 0x15c },
    {"ContextMenu", 0x15d },
};

static EM_BOOL controller_emscripten_keyboard_handler(int event_type, const EmscriptenKeyboardEvent *key_event, UNUSED void *user_data) {
    for (size_t i = 0; i < sizeof(keymap_browser) / sizeof(keymap_browser[0]); i++) {
        if (strcmp(key_event->code, keymap_browser[i].code) == 0) {
            if (event_type == EMSCRIPTEN_EVENT_KEYDOWN) {
                return keyboard_on_key_down(keymap_browser[i].scancode);
            } else if (event_type == EMSCRIPTEN_EVENT_KEYUP) {
                return keyboard_on_key_up(keymap_browser[i].scancode);
            }
            break;
        }
    }
    return EM_FALSE;
}

static EM_BOOL controller_emscripten_keyboard_blur_handler(UNUSED int event_type, UNUSED const EmscriptenFocusEvent *focus_event, UNUSED void *user_data) {
    keyboard_on_all_keys_up();
    return EM_TRUE;
}

void controller_emscripten_keyboard_init(void) {
    // Should be #window according to docs, but that crashes
    const char *target = EMSCRIPTEN_EVENT_TARGET_WINDOW;

    emscripten_set_keydown_callback(target, NULL, EM_FALSE, controller_emscripten_keyboard_handler);
    emscripten_set_keyup_callback(target, NULL, EM_FALSE, controller_emscripten_keyboard_handler);
    emscripten_set_blur_callback(target, NULL, EM_FALSE, controller_emscripten_keyboard_blur_handler);
}

#endif
