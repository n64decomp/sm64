#ifndef PRINT_H
#define PRINT_H

#include <PR/ultratypes.h>

#define TEXRECT_MIN_X 10
#define TEXRECT_MAX_X 300
#define TEXRECT_MIN_Y 5
#define TEXRECT_MAX_Y 220

#define GLYPH_SPACE           -1
#define GLYPH_U               30
#define GLYPH_EXCLAMATION_PNT 36
#define GLYPH_TWO_EXCLAMATION 37
#define GLYPH_QUESTION_MARK   38
#define GLYPH_AMPERSAND       39
#define GLYPH_PERCENT         40
#define GLYPH_MULTIPLY        50
#define GLYPH_COIN            51
#define GLYPH_MARIO_HEAD      52
#define GLYPH_STAR            53
#define GLYPH_PERIOD          54
#define GLYPH_BETA_KEY        55
#define GLYPH_APOSTROPHE      56
#define GLYPH_DOUBLE_QUOTE    57
#define GLYPH_UMLAUT          58

//[BR] Accent texture indexes
#define GLYPH_HUD_ACUTE       37
#define GLYPH_TEXT_ACUTE      231
#define GLYPH_TEXT_CIRCUMFLEX 232
#define GLYPH_TEXT_TILDE      233
#define GLYPH_TEXT_GRAVE      234
#define GLYPH_MENU_CEDILLA    237
#define GLYPH_CRD_ACUTE       37
#define GLYPH_CRD_CIRCUMFLEX  38
#define GLYPH_CRD_TILDE       39
#define GLYPH_CRD_CEDILLA     40

void print_text_fmt_int(s32 x, s32 y, const char *str, s32 n);
void print_text(s32 x, s32 y, const char *str);
void print_text_centered(s32 x, s32 y, const char *str);
void render_text_labels(void);

#endif // PRINT_H
