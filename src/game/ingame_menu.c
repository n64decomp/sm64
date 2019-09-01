#include <ultra64.h>

#include "sm64.h"
#include "memory.h"
#include "types.h"
#include "audio/external.h"
#include "seq_ids.h"
#include "game.h"
#include "save_file.h"
#include "level_update.h"
#include "camera.h"
#include "text_strings.h"
#include "segment2.h"
#include "segment7.h"
#include "eu_translation.h"
#include "ingame_menu.h"
#include "engine/math_util.h"

extern Gfx *gDisplayListHead;
extern s32 gGlobalTimer;
extern s16 gCurrCourseNum;
extern s16 gCurrSaveFileNum;

extern Gfx coin_seg3_dl_03007940[];
extern Gfx coin_seg3_dl_03007968[];
extern Gfx coin_seg3_dl_03007990[];
extern Gfx coin_seg3_dl_030079B8[];

extern u8 main_menu_seg7_table_0700ABD0[];
extern Gfx castle_grounds_seg7_dl_0700EA58[];

u16 D_80360080;
s8 gLastDialogLineNum;
s32 gDialogVariable;
u16 D_80360088;
s16 gCutsceneMsgXOffset;
s16 gCutsceneMsgYOffset;
s8 D_8036008E;

extern u8 gLastCompletedCourseNum;
extern u8 gLastCompletedStarNum;

extern s32 select_or_activate_mario_cam(s32);

enum DialogBoxState {
    DIALOG_STATE_OPENING,
    DIALOG_STATE_WAITBUTTON,
    DIALOG_STATE_SCROLLING,
    DIALOG_STATE_CLOSING
};

enum DialogBoxType {
    DIALOG_TYPE_ROTATE, // used in NPCs and level messages
    DIALOG_TYPE_ZOOM    // used in signposts and wall signs and etc
};

#define ASCII_TO_DIALOG(asc)                                       \
    (((asc) >= '0' && (asc) <= '9') ? ((asc) - '0') :              \
     ((asc) >= 'A' && (asc) <= 'Z') ? ((asc) - 'A' + 0x0A) :       \
     ((asc) >= 'a' && (asc) <= 'z') ? ((asc) - 'a' + 0x24) : 0x00)

enum HudSpecialChars {
    HUD_CHAR_SYM_X = 0x32,
    HUD_CHAR_SYM_COIN = 0x33,
    HUD_CHAR_SYM_MARIO = 0x34,
    HUD_CHAR_SYM_STAR = 0x35,
#ifdef VERSION_EU
    HUD_CHAR_A_UMLAUT = 0x3A,
    HUD_CHAR_O_UMLAUT = 0x3B,
    HUD_CHAR_U_UMLAUT = 0x3C,
#endif
    HUD_CHAR_SPACE = 0x9E
};

// definitions for some of the special characters defined in charmap.txt
enum DialogSpecialChars {
#ifdef VERSION_EU
    DIALOG_CHAR_LOWER_A_GRAVE = 0x60,      // 'a' grave
    DIALOG_CHAR_LOWER_A_CIRCUMFLEX = 0x61, // 'a' circumflex
    DIALOG_CHAR_LOWER_A_UMLAUT = 0x62,     // 'a' umlaut
    DIALOG_CHAR_UPPER_A_GRAVE = 0x64,      // 'A' grave
    DIALOG_CHAR_UPPER_A_CIRCUMFLEX = 0x65, // 'A' circumflex
    DIALOG_CHAR_UPPER_A_UMLAUT = 0x66,     // 'A' umlaut
    DIALOG_CHAR_LOWER_E_GRAVE = 0x70,      // 'e' grave
    DIALOG_CHAR_LOWER_E_CIRCUMFLEX = 0x71, // 'e' circumflex
    DIALOG_CHAR_LOWER_E_UMLAUT = 0x72,     // 'e' umlaut
    DIALOG_CHAR_LOWER_E_ACUTE = 0x73,      // 'e' acute
    DIALOG_CHAR_UPPER_E_GRAVE = 0x74,      // 'E' grave
    DIALOG_CHAR_UPPER_E_CIRCUMFLEX = 0x75, // 'E' circumflex
    DIALOG_CHAR_UPPER_E_UMLAUT = 0x76,     // 'E' umlaut
    DIALOG_CHAR_UPPER_E_ACUTE = 0x77,      // 'E' acute
    DIALOG_CHAR_LOWER_U_GRAVE = 0x80,      // 'u' grave
    DIALOG_CHAR_LOWER_U_CIRCUMFLEX = 0x81, // 'u' circumflex
    DIALOG_CHAR_LOWER_U_UMLAUT = 0x82,     // 'u' umlaut
    DIALOG_CHAR_UPPER_U_GRAVE = 0x84,      // 'U' grave
    DIALOG_CHAR_UPPER_U_CIRCUMFLEX = 0x85, // 'U' circumflex
    DIALOG_CHAR_UPPER_U_UMLAUT = 0x86,     // 'U' umlaut
    DIALOG_CHAR_LOWER_O_CIRCUMFLEX = 0x91, // 'o' circumflex
    DIALOG_CHAR_LOWER_O_UMLAUT = 0x92,     // 'o' umlaut
    DIALOG_CHAR_UPPER_O_CIRCUMFLEX = 0x95, // 'O' circumflex
    DIALOG_CHAR_UPPER_O_UMLAUT = 0x96,     // 'O' umlaut
    DIALOG_CHAR_LOWER_I_CIRCUMFLEX = 0xA1, // 'i' circumflex
    DIALOG_CHAR_LOWER_I_UMLAUT = 0xA2,     // 'i' umlaut
    DIALOG_CHAR_I_NO_DIA = 0xEB,           // 'i' without diacritic
    DIALOG_CHAR_DOUBLE_LOW_QUOTE = 0xF0,   // German opening quotation mark
#endif
#if defined(VERSION_US) || defined(VERSION_EU)
    DIALOG_CHAR_MULTI_THE = 0xD1, // 'the'
    DIALOG_CHAR_MULTI_YOU = 0xD2, // 'you'
#endif
    DIALOG_CHAR_HANDAKUTEN = 0x6E,
    DIALOG_CHAR_COMMA = 0x6F,
    DIALOG_CHAR_SPACE = 0x9E,
    DIALOG_CHAR_STAR_COUNT = 0xE0,        // number of stars
    DIALOG_CHAR_PREFIX_DAKUTEN = 0xF0,    // prefix for kana with dakuten
    DIALOG_CHAR_PREFIX_HANDAKUTEN = 0xF1, // prefix for kana with handakuten
    DIALOG_CHAR_STAR_FILLED = 0xFA,
    DIALOG_CHAR_STAR_OPEN = 0xFD,
    DIALOG_CHAR_NEWLINE = 0xFE,
    DIALOG_CHAR_TERMINATOR = 0xFF
};

enum DialogMark { DIALOG_MARK_NONE = 0, DIALOG_MARK_DAKUTEN = 1, DIALOG_MARK_HANDAKUTEN = 2 };

#define DEFAULT_DIALOG_BOX_ANGLE 90.0f
#define DEFAULT_DIALOG_BOX_SCALE 19.0f

#ifndef VERSION_JP
u8 gDialogCharWidths[256] = { // TODO: Is there a way to auto generate this?
    7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  6,  6,  6,  6,  6,  6,
    6,  6,  5,  6,  6,  5,  8,  8,  6,  6,  6,  6,  6,  5,  6,  6,
    8,  7,  6,  6,  6,  5,  5,  6,  5,  5,  6,  5,  4,  5,  5,  3,
    7,  5,  5,  5,  6,  5,  5,  5,  5,  5,  7,  7,  5,  5,  4,  4,
    8,  6,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    8,  8,  8,  8,  7,  7,  6,  7,  7,  0,  0,  0,  0,  0,  0,  0,
#ifdef VERSION_EU
    6,  6,  6,  0,  6,  6,  6,  0,  0,  0,  0,  0,  0,  0,  0,  4,
    5,  5,  5,  5,  6,  6,  6,  6,  0,  0,  0,  0,  0,  0,  0,  0,
    5,  5,  5,  0,  6,  6,  6,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  5,  5,  0,  0,  6,  6,  0,  0,  0,  0,  0,  0,  0,  5,  6,
    0,  4,  4,  0,  0,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  0,
#else
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  4,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  5,  6,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
#endif
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
#ifdef VERSION_EU
    7,  5, 10,  5,  9,  8,  4,  0,  0,  0,  0,  5,  5,  6,  5,  0,
#else
    7,  5, 10,  5,  9,  8,  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,
#endif
    0,  0,  5,  7,  7,  6,  6,  8,  0,  8, 10,  6,  4, 10,  0,  0
};
#endif

s8 gDialogBoxState = DIALOG_STATE_OPENING;
f32 gDialogBoxOpenTimer = DEFAULT_DIALOG_BOX_ANGLE;
f32 gDialogBoxScale = DEFAULT_DIALOG_BOX_SCALE;
s16 gDialogScrollOffsetY = 0;
s8 gDialogBoxType = DIALOG_TYPE_ROTATE;
s16 gDialogID = -1;
s16 gLastDialogPageStrPos = 0;
s16 D_8033042C = 0; // EU: D_802FD64C
s8 D_80330430 = 1;
s8 D_80330434 = 0;
u8 D_80330438 = 0;
u8 D_8033043C = 0;
s32 gDialogResponse = 0;

#ifdef VERSION_EU
// TODO: where do these belong?
s16 gDialogX; // D_8032F69A
s16 gDialogY; // D_8032F69C
s32 gInGameLanguage;
#endif

#ifdef VERSION_JP
#define MAX_STRING_WIDTH 18
#else
#define MAX_STRING_WIDTH 16
#endif

// dl_add_new_identity_matrix?
void func_802D6440(void) {
    Mtx *matrix = (Mtx *) alloc_display_list(sizeof(Mtx));

    if (matrix == NULL) {
        return;
    }

    matrix->m[0][0] = 0x00010000;
    matrix->m[1][0] = 0x00000000;
    matrix->m[2][0] = 0x00000000;
    matrix->m[3][0] = 0x00000000;

    matrix->m[0][1] = 0x00000000;
    matrix->m[1][1] = 0x00010000;
    matrix->m[2][1] = 0x00000000;
    matrix->m[3][1] = 0x00000000;

    matrix->m[0][2] = 0x00000001;
    matrix->m[1][2] = 0x00000000;
    matrix->m[2][2] = 0x00000000;
    matrix->m[3][2] = 0x00000000;

    matrix->m[0][3] = 0x00000000;
    matrix->m[1][3] = 0x00000001;
    matrix->m[2][3] = 0x00000000;
    matrix->m[3][3] = 0x00000000;

    gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_LOAD);
    gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_LOAD | G_MTX_PROJECTION);
}

void dl_add_new_translation_matrix(s8 pushOp, f32 x, f32 y, f32 z) {
    Mtx *matrix = (Mtx *) alloc_display_list(sizeof(Mtx));

    if (matrix == NULL) {
        return;
    }

    guTranslate(matrix, x, y, z);

    if (pushOp == MENU_MTX_PUSH)
        gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_PUSH);

    if (pushOp == MENU_MTX_NOPUSH)
        gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_NOPUSH);
}

void dl_add_new_rotation_matrix(s8 pushOp, f32 a, f32 x, f32 y, f32 z) {
    Mtx *matrix = (Mtx *) alloc_display_list(sizeof(Mtx));

    if (matrix == NULL) {
        return;
    }

    guRotate(matrix, a, x, y, z);

    if (pushOp == MENU_MTX_PUSH)
        gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_PUSH);

    if (pushOp == MENU_MTX_NOPUSH)
        gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_NOPUSH);
}

void dl_add_new_scale_matrix(s8 pushOp, f32 x, f32 y, f32 z) {
    Mtx *matrix = (Mtx *) alloc_display_list(sizeof(Mtx));

    if (matrix == NULL) {
        return;
    }

    guScale(matrix, x, y, z);

    if (pushOp == MENU_MTX_PUSH)
        gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_PUSH);

    if (pushOp == MENU_MTX_NOPUSH)
        gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_NOPUSH);
}

void dl_add_new_ortho_matrix(void) {
    Mtx *matrix = (Mtx *) alloc_display_list(sizeof(Mtx));

    if (matrix == NULL) {
        return;
    }

    func_802D6440();

    guOrtho(matrix, 0.0f, 320.0f, 0.0f, 240.0f, -10.0f, 10.0f, 1.0f);

    // Should produce G_RDPHALF_1 in Fast3D
    gSPPerspNormalize((Gfx *) (gDisplayListHead++), 0x0000FFFF);

    gSPMatrix(gDisplayListHead++, VIRTUAL_TO_PHYSICAL(matrix), G_MTX_PROJECTION)
}

// dl_add_new_ia8_tex_from_i1
static u8 *func_802D69A0(u16 *in, s16 width, s16 height) {
    s32 inPos;
    u16 bitMask;
    u8 *out;
    s16 outPos;

    outPos = 0;
    out = alloc_display_list(width * height);

    if (out == NULL) {
        return NULL;
    }

    for (inPos = 0; inPos < (width * height) / 16; inPos++) {
        bitMask = 0x8000;

        while (bitMask != 0) {
            if (in[inPos] & bitMask) {
                out[outPos] = 0xFF;
            } else {
                out[outPos] = 0x00;
            }

            bitMask /= 2;
            outPos++;
        }
    }

    return out;
}

void render_generic_char(u8 c) {
    void **smallFontLUT;
    void *packedTexture;
#ifdef VERSION_JP
    void *unpackedTexture;
#endif

    smallFontLUT = segmented_to_virtual(seg2_small_font_lut);
    packedTexture = segmented_to_virtual(smallFontLUT[c]);

#ifdef VERSION_JP
    unpackedTexture = func_802D69A0(packedTexture, 8, 16);

    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_8b, 1, VIRTUAL_TO_PHYSICAL(unpackedTexture));
#else
#ifdef VERSION_US
    gDPPipeSync(gDisplayListHead++);
#endif
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_16b, 1, VIRTUAL_TO_PHYSICAL(packedTexture));
#endif
    gSPDisplayList(gDisplayListHead++, dl_ia8_render_char);
#ifdef VERSION_EU
    gSPTextureRectangleFlip(gDisplayListHead++, gDialogX << 2, (gDialogY - 16) << 2,
                            (gDialogX + 8) << 2, gDialogY << 2, 0, 0x200, 0x100, 0x400, 0x400);
#endif
}

#ifdef VERSION_EU
u8 *alloc_ia4_tex_from_i1(u8 *in, s16 width, s16 height) {
    u32 size = (u32) width * (u32) height;
    u8 *out;
    s32 inPos;
    s16 outPos;
    u8 bitMask;

    outPos = 0;
    out = (u8 *) alloc_display_list(size);

    if (out == NULL) {
        return NULL;
    }

    for (inPos = 0; inPos < (width * height) / 4; inPos++) {
        bitMask = 0x80;
        while (bitMask != 0) {
            out[outPos] = (in[inPos] & bitMask) ? 0xF0 : 0x00;
            bitMask /= 2;
            out[outPos] = (in[inPos] & bitMask) ? out[outPos] + 0x0F : out[outPos];
            bitMask /= 2;
            outPos++;
        }
    }

    return out;
}

void render_generic_char_at_pos(s16 xPos, s16 yPos, u8 c) {
    void **smallFontLUT;
    void *packedTexture;
    void *unpackedTexture;

    smallFontLUT = segmented_to_virtual(seg2_small_font_lut);
    packedTexture = segmented_to_virtual(smallFontLUT[c]);
    unpackedTexture = alloc_ia4_tex_from_i1(packedTexture, 8, 8);

    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_16b, 1, VIRTUAL_TO_PHYSICAL(unpackedTexture));
    gSPDisplayList(gDisplayListHead++, dl_ia8_render_char);
    gSPTextureRectangleFlip(gDisplayListHead++, xPos << 2, (yPos - 16) << 2, (xPos + 8) << 2, yPos << 2,
                            0, 0x200, 0x100, 0x400, 0x400);
}

void render_lowercase_diacritic(s16 *xPos, s16 *yPos, u8 letter, u8 diacritic) {
    render_generic_char_at_pos(*xPos, *yPos, letter);
    render_generic_char_at_pos(*xPos, *yPos, diacritic + 0xE7);
    *xPos += gDialogCharWidths[letter];
}

void render_uppercase_diacritic(s16 *xPos, s16 *yPos, u8 letter, u8 diacritic) {
    render_generic_char_at_pos(*xPos, *yPos, letter);
    render_generic_char_at_pos(*xPos, *yPos - 4, diacritic + 0xE3);
    *xPos += gDialogCharWidths[letter];
}
#endif // VERSION_EU

#ifndef VERSION_JP
struct MultiTextEntry {
    u8 length;
    u8 str[4];
};

#define TEXT_THE_RAW ASCII_TO_DIALOG('t'), ASCII_TO_DIALOG('h'), ASCII_TO_DIALOG('e'), 0x00
#define TEXT_YOU_RAW ASCII_TO_DIALOG('y'), ASCII_TO_DIALOG('o'), ASCII_TO_DIALOG('u'), 0x00

enum MutliStringIDs { STRING_THE, STRING_YOU };

/*
 * Place the multi-text string according to the ID passed. (US, EU)
 * 0: 'the'
 * 1: 'you'
 */
#ifdef VERSION_US
void put_multi_text_string(s8 multiTextID) // US: 802D76C8
#elif defined(VERSION_EU)
void put_multi_text_string(s16 *xPos, s16 *yPos, s8 multiTextID) // EU: 802AD650
#endif
{
    s8 i;
    struct MultiTextEntry textLengths[2] = {
        { 3, { TEXT_THE_RAW } },
        { 3, { TEXT_YOU_RAW } },
    };

    for (i = 0; i < textLengths[multiTextID].length; i++) {
#ifdef VERSION_US
        render_generic_char(textLengths[multiTextID].str[i]);
        dl_add_new_translation_matrix(2, (f32)(gDialogCharWidths[textLengths[multiTextID].str[i]]), 0.0f, 0.0f);
#elif defined(VERSION_EU)
        render_generic_char_at_pos(*xPos, *yPos, textLengths[multiTextID].str[i]);
        *xPos += gDialogCharWidths[textLengths[multiTextID].str[i]];
#endif
    }
}
#endif

void PrintGenericText(s16 x, s16 y, const u8 *str) {
    UNUSED s8 mark = DIALOG_MARK_NONE; // unused in EU
    s32 strPos = 0;
    u8 lineNum = 1;
#ifdef VERSION_EU
    s16 xCoord = x;
    s16 yCoord = 240 - y;
#endif

#ifndef VERSION_EU
    // create_new_translation_matrix
    dl_add_new_translation_matrix(MENU_MTX_PUSH, x, y, 0.0f);
#endif

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
        switch (str[strPos]) {
#ifdef VERSION_EU
            case DIALOG_CHAR_SPACE:
                xCoord += 5;
                break;
            case DIALOG_CHAR_NEWLINE:
                yCoord += 16;
                xCoord = x;
                lineNum++;
                break;
            case DIALOG_CHAR_LOWER_A_GRAVE:
            case DIALOG_CHAR_LOWER_A_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_A_UMLAUT:
                render_lowercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('a'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_UPPER_A_UMLAUT: // @bug grave and circumflux (0x64-0x65) are absent here
                render_uppercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('A'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_LOWER_E_GRAVE:
            case DIALOG_CHAR_LOWER_E_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_E_UMLAUT:
            case DIALOG_CHAR_LOWER_E_ACUTE:
                render_lowercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('e'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_UPPER_E_GRAVE:
            case DIALOG_CHAR_UPPER_E_CIRCUMFLEX:
            case DIALOG_CHAR_UPPER_E_UMLAUT:
            case DIALOG_CHAR_UPPER_E_ACUTE:
                render_uppercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('E'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_LOWER_U_GRAVE:
            case DIALOG_CHAR_LOWER_U_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_U_UMLAUT:
                render_lowercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('u'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_UPPER_U_UMLAUT: // @bug grave and circumflex (0x84-0x85) are absent here
                render_uppercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('U'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_LOWER_O_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_O_UMLAUT:
                render_lowercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('o'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_UPPER_O_UMLAUT: // @bug circumflex (0x95) is absent here
                render_uppercase_diacritic(&xCoord, &yCoord, ASCII_TO_DIALOG('O'), str[strPos] & 0xF);
                break;
            case DIALOG_CHAR_LOWER_I_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_I_UMLAUT:
                render_lowercase_diacritic(&xCoord, &yCoord, DIALOG_CHAR_I_NO_DIA, str[strPos] & 0xF);
                break;
#else // i.e. not EU
            case DIALOG_CHAR_PREFIX_DAKUTEN:
                mark = DIALOG_MARK_DAKUTEN;
                break;
            case DIALOG_CHAR_PREFIX_HANDAKUTEN:
                mark = DIALOG_MARK_HANDAKUTEN;
                break;
            case DIALOG_CHAR_NEWLINE:
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                dl_add_new_translation_matrix(MENU_MTX_PUSH, x, y - (lineNum * MAX_STRING_WIDTH), 0.0f);
                lineNum++;
                break;
            case DIALOG_CHAR_HANDAKUTEN:
                dl_add_new_translation_matrix(MENU_MTX_PUSH, -2.0f, -5.0f, 0.0f);
                render_generic_char(DIALOG_CHAR_PREFIX_HANDAKUTEN);
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                break;
#endif
#ifndef VERSION_JP
            case 0xD0: // '/'
#ifdef VERSION_US
                dl_add_new_translation_matrix(MENU_MTX_NOPUSH, (f32)(gDialogCharWidths[DIALOG_CHAR_SPACE] * 2), 0.0f, 0.0f);
#elif defined(VERSION_EU)
                xCoord += gDialogCharWidths[DIALOG_CHAR_SPACE] * 2;
#endif
                break;
            case DIALOG_CHAR_MULTI_THE:
#ifdef VERSION_EU
                put_multi_text_string(&xCoord, &yCoord, STRING_THE);
#else
                put_multi_text_string(STRING_THE);
#endif
                break;
            case DIALOG_CHAR_MULTI_YOU:
#ifdef VERSION_EU
                put_multi_text_string(&xCoord, &yCoord, STRING_YOU);
#else
                put_multi_text_string(STRING_YOU);
#endif
                break;
#endif
#ifndef VERSION_EU
            case DIALOG_CHAR_SPACE:
#ifdef VERSION_JP
                dl_add_new_translation_matrix(MENU_MTX_NOPUSH, 5.0f, 0.0f, 0.0f);
                break;
#else
                dl_add_new_translation_matrix(MENU_MTX_NOPUSH, (f32)(gDialogCharWidths[DIALOG_CHAR_SPACE]), 0.0f, 0.0f);
#endif
#endif
                break; // ? needed to match
            default:
#ifdef VERSION_EU
                render_generic_char_at_pos(xCoord, yCoord, str[strPos]);
                xCoord += gDialogCharWidths[str[strPos]];
                break;
#else
                render_generic_char(str[strPos]);
                if (mark != DIALOG_MARK_NONE) {
                    dl_add_new_translation_matrix(MENU_MTX_PUSH, 5.0f, 5.0f, 0.0f);
                    render_generic_char(mark + 0xEF);
                    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                    mark = DIALOG_MARK_NONE;
                }

#ifdef VERSION_JP
                dl_add_new_translation_matrix(MENU_MTX_NOPUSH, 10.0f, 0.0f, 0.0f);
#else
                dl_add_new_translation_matrix(MENU_MTX_NOPUSH, (f32)(gDialogCharWidths[str[strPos]]), 0.0f, 0.0f);
                break; // what an odd difference. US added a useless break here.
#endif
#endif
        }

        strPos++;
    }

#ifndef VERSION_EU
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
#endif
}

#ifdef VERSION_EU
void put_hud_char_umlaut(s16 x, s16 y, u8 chr) {
    void **fontLUT = segmented_to_virtual(seg2_hud_lut); // 0-9 A-Z Alphanumeric Font

    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fontLUT[chr]);
    gSPDisplayList(gDisplayListHead++, dl_rgba16_load_tex_block);
    gSPTextureRectangle(gDisplayListHead++, x << 2, y << 2, (x + 16) << 2, (y + 16) << 2, 0, 0, 0, 0x400, 0x400);

    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fontLUT[HUD_CHAR_A_UMLAUT]);
    gSPDisplayList(gDisplayListHead++, dl_rgba16_load_tex_block);
    gSPTextureRectangle(gDisplayListHead++, x << 2, (y - 4) << 2, (x + 16) << 2, (y + 12) << 2, 0, 0, 0, 0x400, 0x400);
}
#endif

// put_hud_menu_string
void PutString(s8 font, s16 x, s16 y, const u8 *str) {
    s32 strPos = 0;
    void **fontLUT1 = segmented_to_virtual(main_menu_seg7_table_0700ABD0); // japanese color font
    void **fontLUT2 = segmented_to_virtual(seg2_hud_lut);                  // 0-9 A-Z Alphanumeric Font
    u32 curX = x;
    u32 curY = y;

    u32 xStride;

    if (font == 1) {
        xStride = 16;
    } else {
#ifdef VERSION_JP
        xStride = 14;
#else
        xStride = 12;
#endif
    }

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
#ifdef VERSION_EU
        switch (str[strPos]) {
            case HUD_CHAR_SPACE:
                curX += xStride / 2;
                break;
            case HUD_CHAR_A_UMLAUT:
                put_hud_char_umlaut(curX, curY, ASCII_TO_DIALOG('A'));
                curX += xStride;
                break;
            case HUD_CHAR_O_UMLAUT:
                put_hud_char_umlaut(curX, curY, ASCII_TO_DIALOG('O'));
                curX += xStride;
                break;
            case HUD_CHAR_U_UMLAUT:
                put_hud_char_umlaut(curX, curY, ASCII_TO_DIALOG('U'));
                curX += xStride;
                break;
            default:
#endif
#ifdef VERSION_US
        if (str[strPos] == HUD_CHAR_SPACE) {
            if (0) //! dead code
            {
            }
            curX += 8;
            ; //! useless statement
        } else {
#endif
            gDPPipeSync(gDisplayListHead++);

            if (font == 1)
                gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fontLUT1[str[strPos]]);

            if (font == 2)
                gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fontLUT2[str[strPos]]);

            gSPDisplayList(gDisplayListHead++, dl_rgba16_load_tex_block);
            gSPTextureRectangle(gDisplayListHead++, curX << 2, curY << 2, (curX + 16) << 2,
                                (curY + 16) << 2, 0, 0, 0, 0x400, 0x400);

            curX += xStride;
#ifdef VERSION_EU
            break;
        }
#endif
#ifdef VERSION_US
        }
#endif
    strPos++;
    }
}

#ifdef VERSION_EU
void put_menu_char_umlaut(s16 x, s16 y, u8 chr) {
    void **fontLUT = segmented_to_virtual(main_menu_seg7_table_0700CD08);

    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_8b, 1, fontLUT[chr]);
    gDPLoadSync(gDisplayListHead++);
    gDPLoadBlock(gDisplayListHead++, 7, 0, 0, (0x40 - 1), 0x800);
    gSPTextureRectangle(gDisplayListHead++, x << 2, y << 2, (x + 8) << 2, (y + 8) << 2, 0, 0, 0, 0x400, 0x400);

    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_8b, 1, fontLUT[0xE9]);
    gDPLoadSync(gDisplayListHead++);
    gDPLoadBlock(gDisplayListHead++, 7, 0, 0, (0x40 - 1), 0x800);
    gSPTextureRectangle(gDisplayListHead++, x << 2, (y - 4) << 2, (x + 8) << 2, (y + 4) << 2, 0, 0, 0, 0x400, 0x400);
}
#endif

void PrintRegularText(s16 x, s16 y, const u8 *str) {
    UNUSED s8 mark = DIALOG_MARK_NONE; // unused in EU
    s32 strPos = 0;
    s32 curX = x;
    s32 curY = y;
    void **fontLUT = segmented_to_virtual(main_menu_seg7_table_0700CD08);

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
        switch (str[strPos]) {
#ifdef VERSION_EU
            case DIALOG_CHAR_UPPER_A_UMLAUT:
                put_menu_char_umlaut(curX, curY, ASCII_TO_DIALOG('A'));
                curX += gDialogCharWidths[str[strPos]];
                break;
            case DIALOG_CHAR_UPPER_U_UMLAUT:
                put_menu_char_umlaut(curX, curY, ASCII_TO_DIALOG('U'));
                curX += gDialogCharWidths[str[strPos]];
                break;
            case DIALOG_CHAR_UPPER_O_UMLAUT:
                put_menu_char_umlaut(curX, curY, ASCII_TO_DIALOG('O'));
                curX += gDialogCharWidths[str[strPos]];
                break;
#else
            case DIALOG_CHAR_PREFIX_DAKUTEN:
                mark = DIALOG_MARK_DAKUTEN;
                break;
            case DIALOG_CHAR_PREFIX_HANDAKUTEN:
                mark = DIALOG_MARK_HANDAKUTEN;
                break;
#endif
            case HUD_CHAR_SPACE:
                curX += 4;
                break;
            default:
                gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_8b, 1, fontLUT[str[strPos]]);
                gDPLoadSync(gDisplayListHead++);
                gDPLoadBlock(gDisplayListHead++, 7, 0, 0, (0x40 - 1), 0x800);
                gSPTextureRectangle(gDisplayListHead++, curX << 2, curY << 2, (curX + 8) << 2,
                                    (curY + 8) << 2, 0, 0, 0, 0x400, 0x400);

#ifndef VERSION_EU
                if (mark != DIALOG_MARK_NONE) {
                    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_8b, 1, fontLUT[mark + 0xEF]);
                    gDPLoadSync(gDisplayListHead++);
                    gDPLoadBlock(gDisplayListHead++, 7, 0, 0, (0x40 - 1), 0x800);
                    gSPTextureRectangle(gDisplayListHead++, (curX + 6) << 2, (curY - 7) << 2,
                                        (curX + 14) << 2, (curY + 1) << 2, 0, 0, 0, 0x400, 0x400);

                    mark = DIALOG_MARK_NONE;
                }
#endif
#ifdef VERSION_JP
                curX += 9;
#else
                curX += gDialogCharWidths[str[strPos]];
#endif
        }
        strPos++;
    }
}

void print_credits_str_dialog(s16 x, s16 y, const u8 *str) {
    s32 strPos = 0;
    void **fontLUT = segmented_to_virtual(seg2_credits_font_lut);
    u32 curX = x;
    u32 curY = y;

    gDPSetTile(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0);
    gDPTileSync(gDisplayListHead++);
    gDPSetTile(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 2, 0, 0, 0, 2, 3, 0, 2, 3, 0);
    gDPSetTileSize(gDisplayListHead++, 0, 0, 0, (8 - 1) << 2, (8 - 1) << 2);

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
        switch (str[strPos]) {
            case DIALOG_CHAR_SPACE:
                curX += 4;
                break;
            default:
                gDPPipeSync(gDisplayListHead++);
                gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fontLUT[str[strPos]]);
                gDPLoadSync(gDisplayListHead++);
                gDPLoadBlock(gDisplayListHead++, 7, 0, 0, (0x40 - 1), 0x400);
                gSPTextureRectangle(gDisplayListHead++, curX << 2, curY << 2, (curX + 8) << 2,
                                    (curY + 8) << 2, 0, 0, 0, 0x400, 0x400);
                curX += 7;
                break;
        }
        strPos++;
    }
}

void handleMenuScrolling(s8 scrollDirection, s8 *currentIndex, s8 minIndex, s8 maxIndex) {
    u8 sp1f = 0;

    if (scrollDirection == MENU_SCROLL_VERTICAL) {
        if (gPlayer3Controller->rawStickY > 60) {
            sp1f++;
        }

        if (gPlayer3Controller->rawStickY < -60) {
            sp1f += 2;
        }
    } else if (scrollDirection == MENU_SCROLL_HORIZONTAL) {
        if (gPlayer3Controller->rawStickX > 60) {
            sp1f += 2;
        }

        if (gPlayer3Controller->rawStickX < -60) {
            sp1f++;
        }
    }

    if (((sp1f ^ D_80330438) & sp1f) == 2) {
        if (currentIndex[0] == maxIndex) {
            //! Probably originally a >=, but later replaced with an == and an else statement.
            currentIndex[0] = maxIndex;
        } else {
            play_sound(SOUND_MENU_CHANGESELECT, gDefaultSoundArgs);
            currentIndex[0]++;
        }
    }

    if (((sp1f ^ D_80330438) & sp1f) == 1) {
        if (currentIndex[0] == minIndex) {
            // Same applies to here as above
        } else {
            play_sound(SOUND_MENU_CHANGESELECT, gDefaultSoundArgs);
            currentIndex[0]--;
        }
    }

    if (D_8033043C == 10) {
        D_8033043C = 8;
        D_80330438 = 0;
    } else {
        D_8033043C++;
        D_80330438 = sp1f;
    }

    if ((sp1f & 3) == 0) {
        D_8033043C = 0;
    }
}

// EU has both get_str_x_pos_from_center and get_str_x_pos_from_center_scale
// US and JP only implement one or the other
#if defined(VERSION_US) || defined(VERSION_EU)
s16 get_str_x_pos_from_center(s16 centerPos, u8 *str, UNUSED f32 scale) {
    s16 strPos = 0;
    f32 spacesWidth = 0.0f;

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
        spacesWidth += gDialogCharWidths[str[strPos]];
        strPos++;
    }
    // return the x position of where the string starts as half the string's
    // length from the position of the provided center.
    return (s16)(centerPos - (s16)(spacesWidth / 2.0));
}
#endif

#if defined(VERSION_JP) || defined(VERSION_EU)
s16 get_str_x_pos_from_center_scale(s16 centerPos, u8 *str, f32 scale) {
    s16 strPos = 0;
    f32 charsWidth = 0.0f;
    f32 spacesWidth = 0.0f;

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
        //! EU checks for dakuten and handakuten despite dialog code unable to handle it
        if (str[strPos] == DIALOG_CHAR_SPACE) {
            spacesWidth += 1.0;
        } else if (str[strPos] != DIALOG_CHAR_PREFIX_DAKUTEN
                   && str[strPos] != DIALOG_CHAR_PREFIX_HANDAKUTEN) {
            charsWidth += 1.0;
        }
        strPos++;
    }
    // return the x position of where the string starts as half the string's
    // length from the position of the provided center.
    return (f32) centerPos - (scale * (charsWidth / 2.0)) - ((scale / 2.0) * (spacesWidth / 2.0));
}
#endif

#ifndef VERSION_JP
s16 get_str_width(u8 *str) {
    s16 strPos = 0;
    s16 width = 0;

    while (str[strPos] != DIALOG_CHAR_TERMINATOR) {
        width += gDialogCharWidths[str[strPos]];
        strPos++;
    }
    return width;
}
#endif

u8 gHudSymCoin[] = { HUD_CHAR_SYM_COIN, 0xFF };
u8 gHudSymX[] = { HUD_CHAR_SYM_X, 0xFF };

void ShowCoins(s32 useCourseCoinScore, s8 sp27, s8 sp2b, s16 x, s16 y) {
    u8 strNumCoins[4];
    s16 numCoins;

    if (!useCourseCoinScore) {
        numCoins = (u16)(save_file_get_max_coin_score(sp2b) & 0xFFFF);
    } else {
        numCoins = save_file_get_course_coin_score(sp27, sp2b);
    }

    if (numCoins != 0) {
        PutString(2, x, y, gHudSymCoin);
        PutString(2, x + 16, y, gHudSymX);
        Int2Str(numCoins, strNumCoins);
        PutString(2, x + 32, y, strNumCoins);
    }
}

void ShowStars(s8 sp2b, s8 sp2f, s16 x, s16 y) {
    u8 strStarCount[4];
    s16 starCount;
    u8 textSymStar[] = { HUD_CHAR_SYM_STAR, 0xFF };
    UNUSED u16 unused;
    u8 textSymX[] = { HUD_CHAR_SYM_X, 0xFF };

    starCount = save_file_get_course_star_count(sp2b, sp2f);

    if (starCount != 0) {
        PutString(2, x, y, textSymStar);
        PutString(2, x + 16, y, textSymX);
        Int2Str(starCount, strStarCount);
        PutString(2, x + 32, y, strStarCount);
    }
}

void Int2Str(s32 num, u8 *dst) {
    s32 digit1;
    s32 digit2;
    s32 digit3;

    s8 pos = 0;

    if (num > 999) {
        dst[0] = 0x00;
        dst[1] = DIALOG_CHAR_TERMINATOR;
        return;
    }

    digit1 = num / 100;
    digit2 = (num - digit1 * 100) / 10;
    digit3 = (num - digit1 * 100) - (digit2 * 10);

    if (digit1 != 0) {
        dst[pos++] = digit1;
    }

    if (digit2 != 0 || digit1 != 0) {
        dst[pos++] = digit2;
    }

    dst[pos++] = digit3;
    dst[pos] = DIALOG_CHAR_TERMINATOR;
}

s16 get_dialog_id(void) {
    return gDialogID;
}

void func_802D7F90(s16 a0) {
    if (gDialogID == -1) {
        gDialogID = a0;
        gDialogBoxType = DIALOG_TYPE_ROTATE;
    }
}

void func_802D7FCC(s16 a0, s32 a1) {
    if (gDialogID == -1) {
        gDialogID = a0;
        gDialogVariable = a1;
        gDialogBoxType = DIALOG_TYPE_ROTATE;
    }
}

void CreateTextBox(s16 a0) {
    if (gDialogID == -1) {
        gDialogID = a0;
        gDialogBoxType = DIALOG_TYPE_ZOOM;
    }
}

void func_802D8050(s16 a0) {
    if (gDialogID == -1) {
        gDialogID = a0;
        gDialogBoxType = DIALOG_TYPE_ROTATE;
        D_80330434 = 1;
    }
}

// reset_dialog_state?
void func_802D8098(void) {
    level_set_transition(0, 0);

    if (gDialogBoxType == DIALOG_TYPE_ZOOM) {
        stop_mario(2);
    }

    gDialogBoxScale = 19.0f;
    gDialogBoxOpenTimer = 90.0f;
    gDialogBoxState = DIALOG_STATE_OPENING;
    gDialogID = -1;
    D_8033042C = 0;
    D_80330434 = 0;
    gLastDialogPageStrPos = 0;
    gDialogResponse = 0;
}

#ifdef VERSION_JP
#define X_VAL1 -5.0f
#define Y_VAL1 2.0
#define Y_VAL2 4.0f
#else
#define X_VAL1 -7.0f
#define Y_VAL1 5.0
#define Y_VAL2 5.0f
#endif

void func_802D8134(struct DialogEntry *dialog, s8 sp47) {
    UNUSED s32 unused;

    dl_add_new_translation_matrix(2, dialog->leftOffset, dialog->width, 0);

    switch (gDialogBoxType) {
        case DIALOG_TYPE_ROTATE:
            if (gDialogBoxState == DIALOG_STATE_OPENING || gDialogBoxState == DIALOG_STATE_CLOSING) {
                dl_add_new_scale_matrix(2, 1.0 / gDialogBoxScale, 1.0 / gDialogBoxScale, 1.0f);
                dl_add_new_rotation_matrix(2, gDialogBoxOpenTimer * 4.0f, 0, 0, 1.0f); // convert the speed into angle
            }
            gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 0x96);
            break;
        case DIALOG_TYPE_ZOOM:
            if (gDialogBoxState == DIALOG_STATE_OPENING || gDialogBoxState == DIALOG_STATE_CLOSING) {
                dl_add_new_translation_matrix(2, 65.0 - (65.0 / gDialogBoxScale),
                                              (40.0 / gDialogBoxScale) - 40, 0);
                dl_add_new_scale_matrix(2, 1.0 / gDialogBoxScale, 1.0 / gDialogBoxScale, 1.0f);
            }
            gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 0x96);
            break;
    }

    dl_add_new_translation_matrix(1, X_VAL1, Y_VAL1, 0);
    dl_add_new_scale_matrix(2, 1.1f, ((f32) sp47 / Y_VAL2) + 0.1, 1.0f);

    gSPDisplayList(gDisplayListHead++, dl_draw_text_bg_box);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

// EU: func_802AEFF8
void func_802D8450(s8 a0, s8 a1) {
    u8 sp17;

    if (a0 == 1) {
        if (a1 == 1) {
            gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);
        } else {
            if (a1 == D_80330430) {
                sp17 = (gSineTable[D_80360080 >> 4] * 50.0f) + 200.0f;
                gDPSetEnvColor(gDisplayListHead++, sp17, sp17, sp17, 255);
            } else {
                gDPSetEnvColor(gDisplayListHead++, 200, 200, 200, 255);
            }
        }
    } else {
        switch (gDialogBoxType) {
            case DIALOG_TYPE_ROTATE:
                break;
            case DIALOG_TYPE_ZOOM:
                gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);
                break;
        }
    }
}

#ifdef VERSION_EU
void func_eu_802AF1B8(struct DialogEntry *dialog, s16 x, s16 y, u8 c) {
    s16 width;  // sp26
    s16 height; // sp24
    s16 tmpX;
    s16 tmpY;
    s16 xCoord; // sp1E
    s16 yCoord; // sp1C
    void **smallFontLUT;
    void *packedTexture;
    void *unpackedTexture;

    width = (8.0 - (gDialogBoxScale * 0.8));
    height = (16.0 - (gDialogBoxScale * 0.8));
    tmpX = (dialog->leftOffset + (65.0 - (65.0 / gDialogBoxScale)));
    tmpY = ((240 - dialog->width) - ((40.0 / gDialogBoxScale) - 40));
    xCoord = (tmpX + (x / gDialogBoxScale));
    yCoord = (tmpY + (y / gDialogBoxScale));

    smallFontLUT = segmented_to_virtual(seg2_small_font_lut);
    packedTexture = segmented_to_virtual(smallFontLUT[c]);
    unpackedTexture = alloc_ia4_tex_from_i1(packedTexture, 8, 8);

    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_16b, 1, VIRTUAL_TO_PHYSICAL(unpackedTexture));
    gSPDisplayList(gDisplayListHead++, dl_ia8_render_char);
    gSPTextureRectangleFlip(gDisplayListHead++, xCoord << 2, (yCoord - height) << 2,
                            (xCoord + width) << 2, yCoord << 2, 0, 0x200, 0x100, 0x400, 0x400);
}
#endif

#ifdef VERSION_JP
#define X_VAL3 5.0f
#define Y_VAL3 20
#else
#define X_VAL3 0.0f
#define Y_VAL3 16
#endif

#ifdef VERSION_EU
void func_802D8690(s8 lineNum, s8 sp27, s8 *sp28, s8 *sp2c)
#else
void func_802D8690(s8 lineNum, s8 sp27, s8 *sp28, s8 *sp2c, s16 *sp30)
#endif
{
#ifndef VERSION_EU
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
#endif

    if (lineNum == sp27) {
        sp28[0] = 1;
        return;
    }
#ifdef VERSION_EU
    gDialogY += 16;
#else
    dl_add_new_translation_matrix(1, X_VAL3, 2 - (lineNum * Y_VAL3), 0);

    sp30[0] = 0;
#endif
    sp2c[0] = 1;
}

#ifdef VERSION_JP
void func_802D875C(s8 *sp20, s16 *sp24) {
    if (sp24[0] != 0) {
        dl_add_new_translation_matrix(2, sp20[0] * 10, 0, 0);
    }

    dl_add_new_translation_matrix(1, -2.0f, -5.0f, 0);
    render_generic_char(DIALOG_CHAR_PREFIX_HANDAKUTEN);

    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    sp24[0]++;
    sp20[0] = 1;
}
#endif

#ifdef VERSION_EU
void func_eu_802AF478(struct DialogEntry *dialog, s8 *sp24)
#else
void func_802D8830(s8 *sp20, s16 *sp24)
#endif
{
    s8 tensDigit = gDialogVariable / 10;
    s8 onesDigit = gDialogVariable - (tensDigit * 10); // remainder

    if (tensDigit != 0) {
#ifdef VERSION_JP
        dl_add_new_translation_matrix(2, sp20[0] * 10, 0, 0);
        render_generic_char(tensDigit);
#elif defined(VERSION_EU)
        func_eu_802AF1B8(dialog, gDialogX, gDialogY, tensDigit);
        gDialogX += gDialogCharWidths[tensDigit];
        sp24[0] = 1;
#else
        if (sp20[0] != 1) {
            dl_add_new_translation_matrix(2, (f32)(gDialogCharWidths[DIALOG_CHAR_SPACE] * sp20[0]), 0, 0);
        }

        render_generic_char(tensDigit);
        dl_add_new_translation_matrix(2, (f32) gDialogCharWidths[tensDigit], 0, 0);
        sp20[0] = 1;
        sp24[0]++;
#endif
    }
#ifndef VERSION_EU
    else {
#ifdef VERSION_JP
        sp20[0]++;
#endif
    }
#endif

#ifdef VERSION_EU
    func_eu_802AF1B8(dialog, gDialogX, gDialogY, onesDigit);
    gDialogX += gDialogCharWidths[onesDigit];
    sp24[0] = 1;
#else

#ifdef VERSION_JP
    dl_add_new_translation_matrix(2, sp20[0] * 10, 0, 0);
    render_generic_char(onesDigit);
#else
    if (sp20[0] != 1) {
        dl_add_new_translation_matrix(2, (f32)(gDialogCharWidths[DIALOG_CHAR_SPACE] * (sp20[0] - 1)), 0, 0);
    }

    render_generic_char(onesDigit);
    dl_add_new_translation_matrix(2, (f32) gDialogCharWidths[onesDigit], 0, 0);
#endif

    sp24[0]++;
    sp20[0] = 1;
#endif
}

#ifndef VERSION_JP
#ifdef VERSION_EU
void func_eu_802AF590(s8 multiTextId, s8 a1, s8 a3, UNUSED s16 a2, s8 lowerBound, struct DialogEntry *dialog)
#else
void func_u_802D9634(s8 multiTextId, s8 a1, s16 *a2, s8 a3, s8 sp10, s8 lowerBound)
#endif
{
    s8 i;
    struct MultiTextEntry textLengths[2] = {
        { 3, { TEXT_THE_RAW } },
        { 3, { TEXT_YOU_RAW } },
    };

    if (a1 >= lowerBound && a1 <= (lowerBound + a3)) {
#ifdef VERSION_US
        if (a2[0] != 0 || (sp10 != 1)) {
            dl_add_new_translation_matrix(2, (gDialogCharWidths[DIALOG_CHAR_SPACE] * (sp10 - 1)), 0, 0);
        }
#endif
        for (i = 0; i < textLengths[multiTextId].length; i++) {
#ifdef VERSION_EU
            func_eu_802AF1B8(dialog, gDialogX, gDialogY, textLengths[multiTextId].str[i]);
            gDialogX += gDialogCharWidths[textLengths[multiTextId].str[i]];
#else
            render_generic_char(textLengths[multiTextId].str[i]);
            dl_add_new_translation_matrix(2, (gDialogCharWidths[textLengths[multiTextId].str[i]]), 0, 0);
#endif
        }
    }
#ifdef VERSION_US
    a2 += textLengths[multiTextId].length;
#endif
}
#endif

#ifdef VERSION_EU
void func_eu_802AF6D4(struct DialogEntry *dialog, u8 chr, u8 diacritic) {
    func_eu_802AF1B8(dialog, gDialogX, gDialogY, chr);
    func_eu_802AF1B8(dialog, gDialogX, gDialogY, diacritic + 0xE7);
    gDialogX += gDialogCharWidths[chr];
}

void func_eu_802AF758(struct DialogEntry *dialog, u8 chr, u8 diacritic) {
    func_eu_802AF1B8(dialog, gDialogX, gDialogY, chr);
    func_eu_802AF1B8(dialog, gDialogX, gDialogY - 4, diacritic + 0xE3);
    gDialogX += gDialogCharWidths[chr];
}
#endif

u32 func_802D8954(s16 a0) {
    if (a0 < 0) {
        a0 = 0;
    }

    return a0;
}

#if defined(VERSION_EU) && !defined(NON_MATCHING)
// TODO: EU is not quite matching
void func_802D8980(s8 sp63, struct DialogEntry *dialog, s8 sp5B);
GLOBAL_ASM("asm/non_matchings/func_802AF808_eu.s")
#else
#ifdef VERSION_JP
void func_802D8980(s8 sp63, struct DialogEntry *dialog)
#else
void func_802D8980(s8 sp63, struct DialogEntry *dialog, s8 sp5B)
#endif
{
    UNUSED s32 u0, u1; // a guess?

    u8 strChar; // sp4F;

    u8 *str = (u8 *) segmented_to_virtual(dialog->str); // sp48
    s8 lineNum = 1;                                     // sp47 in US

    s8 totalLines;

    s8 sp4d_45 = 0;                    // EU sp5d
    UNUSED s8 mark = DIALOG_MARK_NONE; // unused in US, EU
    s8 sp4b_43 = 1;

    s8 linesPerBox = dialog->linesPerBox; // sp42

    s16 strIdx;  // sp40, EU: s7
#ifndef VERSION_EU
    s16 linePos; // sp3E

    linePos = 0;
#endif

    if (gDialogBoxState == DIALOG_STATE_SCROLLING) {
        totalLines = (linesPerBox * 2) + 1; // if scrolling, consider the number of lines for both
                                            // the current page and the page being scrolled to.
    } else {
        totalLines = linesPerBox + 1;
    }

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    strIdx = D_8033042C;
#ifdef VERSION_EU
    gDialogX = 0;
    gDialogY = 14;
#endif

    if (gDialogBoxState == DIALOG_STATE_SCROLLING) {
#ifdef VERSION_EU
        gDialogY -= gDialogScrollOffsetY;
#else
        dl_add_new_translation_matrix(2, 0, (f32) gDialogScrollOffsetY, 0);
#endif
    }

#ifndef VERSION_EU
    dl_add_new_translation_matrix(1, X_VAL3, 2 - lineNum * Y_VAL3, 0);
#endif

    while (sp4d_45 == 0) {
        func_802D8450(sp63, lineNum);
        strChar = str[strIdx];

        switch (strChar) {
            case DIALOG_CHAR_TERMINATOR:
                sp4d_45 = 2;
#ifndef VERSION_EU
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
#endif
                break;
            case DIALOG_CHAR_NEWLINE:
                lineNum++;
#ifdef VERSION_EU
                func_802D8690(lineNum, totalLines, &sp4d_45, &sp4b_43);
                gDialogX = 0;
#else
                func_802D8690(lineNum, totalLines, &sp4d_45, &sp4b_43, &linePos);
#endif
                break;
#ifdef VERSION_EU
            case DIALOG_CHAR_LOWER_A_GRAVE:
            case DIALOG_CHAR_LOWER_A_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_A_UMLAUT:
                func_eu_802AF6D4(dialog, ASCII_TO_DIALOG('a'), strChar & 0xF);
                break;
            case DIALOG_CHAR_UPPER_A_GRAVE:
            case DIALOG_CHAR_UPPER_A_CIRCUMFLEX:
            case DIALOG_CHAR_UPPER_A_UMLAUT:
                func_eu_802AF758(dialog, ASCII_TO_DIALOG('A'), strChar & 0xF);
                break;
            case DIALOG_CHAR_LOWER_E_GRAVE:
            case DIALOG_CHAR_LOWER_E_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_E_UMLAUT:
            case DIALOG_CHAR_LOWER_E_ACUTE:
                func_eu_802AF6D4(dialog, ASCII_TO_DIALOG('e'), strChar & 0xF);
                break;
            case DIALOG_CHAR_UPPER_E_GRAVE:
            case DIALOG_CHAR_UPPER_E_CIRCUMFLEX:
            case DIALOG_CHAR_UPPER_E_UMLAUT:
            case DIALOG_CHAR_UPPER_E_ACUTE:
                func_eu_802AF758(dialog, ASCII_TO_DIALOG('E'), strChar & 0xF);
                break;
            case DIALOG_CHAR_LOWER_U_GRAVE:
            case DIALOG_CHAR_LOWER_U_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_U_UMLAUT:
                func_eu_802AF6D4(dialog, ASCII_TO_DIALOG('u'), strChar & 0xF);
                break;
            case DIALOG_CHAR_UPPER_U_GRAVE:
            case DIALOG_CHAR_UPPER_U_CIRCUMFLEX:
            case DIALOG_CHAR_UPPER_U_UMLAUT:
                func_eu_802AF758(dialog, ASCII_TO_DIALOG('U'), strChar & 0xF);
                break;
            case DIALOG_CHAR_LOWER_O_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_O_UMLAUT:
                func_eu_802AF6D4(dialog, ASCII_TO_DIALOG('o'), strChar & 0xF);
                break;
            case DIALOG_CHAR_UPPER_O_CIRCUMFLEX:
            case DIALOG_CHAR_UPPER_O_UMLAUT:
                func_eu_802AF758(dialog, ASCII_TO_DIALOG('O'), strChar & 0xF);
                break;
            case DIALOG_CHAR_LOWER_I_CIRCUMFLEX:
            case DIALOG_CHAR_LOWER_I_UMLAUT:
                func_eu_802AF6D4(dialog, DIALOG_CHAR_I_NO_DIA, strChar & 0xF);
                break;
#else
            case DIALOG_CHAR_PREFIX_DAKUTEN:
                mark = DIALOG_MARK_DAKUTEN;
                break;
            case DIALOG_CHAR_PREFIX_HANDAKUTEN:
                mark = DIALOG_MARK_HANDAKUTEN;
                break;
#endif
            case DIALOG_CHAR_SPACE:
#ifdef VERSION_EU
                gDialogX += gDialogCharWidths[DIALOG_CHAR_SPACE];
#else
#ifdef VERSION_JP
                if (linePos != 0) {
#endif
                    sp4b_43++;
#ifdef VERSION_JP
                }
#endif
                linePos++;
    
#endif
                break;
#ifdef VERSION_JP
            case DIALOG_CHAR_HANDAKUTEN:
                func_802D875C(&sp4b_43, &linePos);
                break;
#else
            case 0xD0: // '/'
#ifdef VERSION_EU
                gDialogX += gDialogCharWidths[DIALOG_CHAR_SPACE] * 2;
#else
                sp4b_43 += 2;
                linePos += 2;
#endif
                break;
            case DIALOG_CHAR_MULTI_THE:
#ifdef VERSION_EU
                func_eu_802AF590(0, lineNum, linesPerBox, sp4b_43, sp5B, dialog);
#else
                func_u_802D9634(0, lineNum, &linePos, linesPerBox, sp4b_43, sp5B);
#endif
                sp4b_43 = 1;
                break;
            case DIALOG_CHAR_MULTI_YOU:
#ifdef VERSION_EU
                func_eu_802AF590(1, lineNum, linesPerBox, sp4b_43, sp5B, dialog);
#else
                func_u_802D9634(1, lineNum, &linePos, linesPerBox, sp4b_43, sp5B);
#endif
                sp4b_43 = 1;
                break;
#endif
            case DIALOG_CHAR_STAR_COUNT:
#ifdef VERSION_EU
                func_eu_802AF478(dialog, &sp4b_43);
#else
                func_802D8830(&sp4b_43, &linePos);
#endif
                break;
#ifdef VERSION_EU
            case DIALOG_CHAR_DOUBLE_LOW_QUOTE:
                func_eu_802AF1B8(dialog, gDialogX, gDialogY + 8, 0xF6);
                gDialogX += gDialogCharWidths[0xF6];
                break;
#endif
            default: // any other character
#ifdef VERSION_JP
                if (linePos != 0) {
                    dl_add_new_translation_matrix(2, sp4b_43 * 10, 0, 0);
                }

                render_generic_char(strChar);
                sp4b_43 = 1;
                linePos++;

                if (mark != 0) {
                    dl_add_new_translation_matrix(1, 5.0f, 7.0f, 0);
                    render_generic_char(mark + 0xEF);
                    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                    mark = 0;
                }
#else
                if (lineNum >= sp5B && lineNum <= (sp5B + linesPerBox)) {
#ifdef VERSION_EU
                    func_eu_802AF1B8(dialog, gDialogX, gDialogY, strChar);
                    gDialogX += gDialogCharWidths[strChar];
#else
                    if (linePos || sp4b_43 != 1) {
                        dl_add_new_translation_matrix(
                            2, (f32)(gDialogCharWidths[DIALOG_CHAR_SPACE] * (sp4b_43 - 1)), 0, 0);
                    }

                    render_generic_char(strChar);
                    dl_add_new_translation_matrix(2, (f32)(gDialogCharWidths[strChar]), 0, 0);
                    sp4b_43 = 1;
                    linePos++;
#endif
                }
#endif
        }

#ifdef VERSION_JP
        if (linePos == 12) {
            if (str[strIdx + 1] == DIALOG_CHAR_HANDAKUTEN) {
                func_802D875C(&sp4b_43, &linePos);
                strIdx++;
            }

            if (str[strIdx + 1] == DIALOG_CHAR_COMMA) {
                dl_add_new_translation_matrix(2, sp4b_43 * 10, 0, 0);
                render_generic_char(DIALOG_CHAR_COMMA);
                strIdx++;
            }

            if (str[strIdx + 1] == DIALOG_CHAR_NEWLINE) {
                strIdx++;
            }

            if (str[strIdx + 1] == DIALOG_CHAR_TERMINATOR) {
                sp4d_45 = 2;
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                break; // exit loop
            } else {
                lineNum++;
                func_802D8690(lineNum, totalLines, &sp4d_45, &sp4b_43, &linePos);
            }
        }
#endif

        strIdx++;
    }
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);

    if (gDialogBoxState == DIALOG_STATE_WAITBUTTON) {
        if (sp4d_45 == 2) {
            gLastDialogPageStrPos = -1;
        } else {
            gLastDialogPageStrPos = strIdx;
        }
    }

    gLastDialogLineNum = lineNum;
}
#endif

#ifdef VERSION_JP
#define X_VAL4_1 50
#define X_VAL4_2 25
#define Y_VAL4_1 1
#define Y_VAL4_2 20
#else
#define X_VAL4_1 56
#define X_VAL4_2 47
#define Y_VAL4_1 2
#define Y_VAL4_2 16
#endif

void func_802D8ED4(void) {
    if (gDialogBoxState == DIALOG_STATE_WAITBUTTON) {
        handleMenuScrolling(MENU_SCROLL_HORIZONTAL, &D_80330430, 1, 2);
    }

    dl_add_new_translation_matrix(2, (D_80330430 * X_VAL4_1) - X_VAL4_2, Y_VAL4_1 - (gLastDialogLineNum * Y_VAL4_2), 0);

    if (gDialogBoxType == DIALOG_TYPE_ROTATE) {
        gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);
    } else {
        gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);
    }

    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
}

#ifdef VERSION_EU
#define X_VAL5 122.0f
#define Y_VAL5_1 -16
#define Y_VAL5_2 3
#define X_Y_VAL6 0.5f
#elif defined(VERSION_US)
#define X_VAL5 118.0f
#define Y_VAL5_1 -16
#define Y_VAL5_2 5
#define X_Y_VAL6 0.8f
#elif defined(VERSION_JP)
#define X_VAL5 123.0f
#define Y_VAL5_1 -20
#define Y_VAL5_2 2
#define X_Y_VAL6 0.8f
#endif

void func_802D9030(s8 sp3b) {
    s32 sp34 = gGlobalTimer;

    if (sp34 & 0x08) {
        return;
    }

    dl_add_new_translation_matrix(1, X_VAL5, (sp3b * Y_VAL5_1) + Y_VAL5_2, 0);
    dl_add_new_scale_matrix(2, X_Y_VAL6, X_Y_VAL6, 1.0f);
    dl_add_new_rotation_matrix(2, -DEFAULT_DIALOG_BOX_ANGLE, 0, 0, 1.0f);

    if (gDialogBoxType == DIALOG_TYPE_ROTATE) {
        gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);
    } else {
        gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);
    }

    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

void func_802D91C0(s16 sp4a) {
    // dialog ID tables
    s16 sp3c[] = { 0x0011, 0x0072, 0x0080, 0x0075, 0x0096 };
    s16 sp34[] = { 0x0005, 0x0009, 0x0037, 0x00A4 };
    s16 sp28[] = { 0x000A, 0x000B, 0x000C, 0x000D, 0x000E };
#ifdef VERSION_JP
    s16 sp20[] = { 0x0011, 0x0073, 0x0076, 0x0098 };
#else
    s16 sp20[] = { 0x0011, 0x0073, 0x0074, 0x0076, 0x0098 };
#endif
    s16 i;

    for (i = 0; i < (s16) ARRAY_COUNT(sp3c); i++) {
        if (sp3c[i] == sp4a) {
            func_80320040(0, 60);
            play_music(0, SEQUENCE_ARGS(4, SEQ_EVENT_BOSS), 0);
            return;
        }
    }

    for (i = 0; i < (s16) ARRAY_COUNT(sp34); i++) {
        if (sp34[i] == sp4a && D_80330430 == 1) {
            play_race_fanfare();
            return;
        }
    }

    for (i = 0; i < (s16) ARRAY_COUNT(sp28); i++) {
        if (sp28[i] == sp4a && D_80330430 == 1) {
            play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
            return;
        }
    }

    for (i = 0; i < (s16) ARRAY_COUNT(sp20); i++) {
        if (sp20[i] == sp4a) {
            func_8031F7CC(0, 1);
            return;
        }
    }
}

s16 D_8033047C = -1;

u8 gEndCutsceneStrEn0[] = { TEXT_FILE_MARIO_EXCLAMATION };
u8 gEndCutsceneStrEn1[] = { TEXT_POWER_STARS_RESTORED };
u8 gEndCutsceneStrEn2[] = { TEXT_THANKS_TO_YOU };
u8 gEndCutsceneStrEn3[] = { TEXT_THANK_YOU_MARIO };
u8 gEndCutsceneStrEn4[] = { TEXT_SOMETHING_SPECIAL };
u8 gEndCutsceneStrEn5[] = { TEXT_COME_ON_EVERYBODY };
u8 gEndCutsceneStrEn6[] = { TEXT_LETS_HAVE_CAKE };
u8 gEndCutsceneStrEn7[] = { TEXT_FOR_MARIO };
u8 gEndCutsceneStrEn8[] = { TEXT_FILE_MARIO_QUESTION };

u8 *gEndCutsceneStringsEn[] = {
    gEndCutsceneStrEn0,
    gEndCutsceneStrEn1,
    gEndCutsceneStrEn2,
    gEndCutsceneStrEn3,
    gEndCutsceneStrEn4,
    gEndCutsceneStrEn5,
    gEndCutsceneStrEn6,
    gEndCutsceneStrEn7,
    // This [8] string is actually unused. In the cutscene handler, the developers do not
    // set the 8th one, but use the first string again at the very end, so Peach ends up
    // saying "Mario!" twice. It is likely that she was originally meant to say "Mario?" at
    // the end but the developers changed their mind, possibly because the line recorded
    // sounded more like an exclamation than a question.
    gEndCutsceneStrEn8,
    NULL
};

#ifdef VERSION_EU
u8 gEndCutsceneStrFr0[] = { TEXT_FILE_MARIO_EXCLAMATION };
u8 gEndCutsceneStrFr1[] = { TEXT_POWER_STARS_RESTORED_FR };
u8 gEndCutsceneStrFr2[] = { TEXT_THANKS_TO_YOU_FR };
u8 gEndCutsceneStrFr3[] = { TEXT_THANK_YOU_MARIO_FR };
u8 gEndCutsceneStrFr4[] = { TEXT_SOMETHING_SPECIAL_FR };
u8 gEndCutsceneStrFr5[] = { TEXT_COME_ON_EVERYBODY_FR };
u8 gEndCutsceneStrFr6[] = { TEXT_LETS_HAVE_CAKE_FR };
u8 gEndCutsceneStrFr7[] = { TEXT_FOR_MARIO_FR };
u8 gEndCutsceneStrFr8[] = { TEXT_FILE_MARIO_QUESTION };

u8 *gEndCutsceneStringsFr[] = {
    gEndCutsceneStrFr0,
    gEndCutsceneStrFr1,
    gEndCutsceneStrFr2,
    gEndCutsceneStrFr3,
    gEndCutsceneStrFr4,
    gEndCutsceneStrFr5,
    gEndCutsceneStrFr6,
    gEndCutsceneStrFr7,
    gEndCutsceneStrFr8,
    NULL
};

u8 gEndCutsceneStrDe0[] = { TEXT_FILE_MARIO_EXCLAMATION };
u8 gEndCutsceneStrDe1[] = { TEXT_POWER_STARS_RESTORED_DE };
u8 gEndCutsceneStrDe2[] = { TEXT_THANKS_TO_YOU_DE };
u8 gEndCutsceneStrDe3[] = { TEXT_THANK_YOU_MARIO_DE };
u8 gEndCutsceneStrDe4[] = { TEXT_SOMETHING_SPECIAL_DE };
u8 gEndCutsceneStrDe5[] = { TEXT_COME_ON_EVERYBODY_DE };
u8 gEndCutsceneStrDe6[] = { TEXT_LETS_HAVE_CAKE_DE };
u8 gEndCutsceneStrDe7[] = { TEXT_FOR_MARIO_DE };
u8 gEndCutsceneStrDe8[] = { TEXT_FILE_MARIO_QUESTION };

u8 *gEndCutsceneStringsDe[] = {
    gEndCutsceneStrDe0,
    gEndCutsceneStrDe1,
    gEndCutsceneStrDe2,
    gEndCutsceneStrDe3,
    gEndCutsceneStrDe4,
    gEndCutsceneStrDe5,
    gEndCutsceneStrDe6,
    gEndCutsceneStrDe7,
    gEndCutsceneStrDe8,
    NULL
};
#endif

u16 gCutsceneMsgFade = 0;
s16 gCutsceneMsgIndex = -1;
s16 gCutsceneMsgDuration = -1;
s16 gCutsceneMsgTimer = 0;
s8 D_80330530 = 1;
s8 D_80330534 = 1;

#ifdef VERSION_JP
#define DIAG_VAL1 20
#define DIAG_VAL3 130
#define DIAG_VAL4 4
#else
#define DIAG_VAL1 16
#define DIAG_VAL3 132 // US & EU
#define DIAG_VAL4 5
#endif
#ifdef VERSION_EU
#define DIAG_VAL2 238
#else
#define DIAG_VAL2 240 // JP & US
#endif

void func_802D93E0(void) {
#ifdef VERSION_EU
    s8 sp2F;
#endif
    void **dialogTable;
    struct DialogEntry *dialog;
#ifdef VERSION_US
    s8 sp2F;
#endif
#ifdef VERSION_EU
    gInGameLanguage = eu_get_language();
    switch (gInGameLanguage) {
        case LANGUAGE_ENGLISH:
            dialogTable = segmented_to_virtual(dialog_table_eu_en);
            break;
        case LANGUAGE_FRENCH:
            dialogTable = segmented_to_virtual(dialog_table_eu_fr);
            break;
        case LANGUAGE_GERMAN:
            dialogTable = segmented_to_virtual(dialog_table_eu_de);
            break;
    }
#else
    dialogTable = segmented_to_virtual(seg2_dialog_table);
#endif
    dialog = segmented_to_virtual(dialogTable[gDialogID]);

    // if the dialog entry is invalid, set the ID to -1.
    if (segmented_to_virtual(NULL) == dialog) {
        gDialogID = -1;
        return;
    }

#ifdef VERSION_EU
    gDialogX = 0;
    gDialogY = 0;
#endif

    switch (gDialogBoxState) {
        case DIALOG_STATE_OPENING:
            if (gDialogBoxOpenTimer == DEFAULT_DIALOG_BOX_ANGLE) {
                play_dialog_sound(gDialogID);
                play_sound(SOUND_MENU_MESSAGEAPPEAR, gDefaultSoundArgs);
            }

            if (gDialogBoxType == DIALOG_TYPE_ROTATE) {
                gDialogBoxOpenTimer -= 7.5;
                gDialogBoxScale -= 1.5;
            } else {
                gDialogBoxOpenTimer -= 10.0;
                gDialogBoxScale -= 2.0;
            }

            if (gDialogBoxOpenTimer == 0.0f) {
                gDialogBoxState = DIALOG_STATE_WAITBUTTON;
                D_80330430 = 1;
            }
#ifndef VERSION_JP
            sp2F = 1;
#endif
            break;
        case DIALOG_STATE_WAITBUTTON:
            gDialogBoxOpenTimer = 0.0f;

            if ((gPlayer3Controller->buttonPressed & A_BUTTON)
                || (gPlayer3Controller->buttonPressed & B_BUTTON)) {
                if (gLastDialogPageStrPos == -1) {
                    func_802D91C0(gDialogID);
                    gDialogBoxState = DIALOG_STATE_CLOSING;
                } else {
                    gDialogBoxState = DIALOG_STATE_SCROLLING;
                    play_sound(SOUND_MENU_MESSAGENEXTPAGE, gDefaultSoundArgs);
                }
            }
#ifndef VERSION_JP
            sp2F = 1;
#endif
            break;
        case DIALOG_STATE_SCROLLING:
            gDialogScrollOffsetY += dialog->linesPerBox * 2;

            if (gDialogScrollOffsetY >= dialog->linesPerBox * DIAG_VAL1) {
                D_8033042C = gLastDialogPageStrPos;
                gDialogBoxState = DIALOG_STATE_WAITBUTTON;
                gDialogScrollOffsetY = 0;
            }
#ifndef VERSION_JP
            sp2F = (gDialogScrollOffsetY / 16) + 1;
#endif
            break;
        case DIALOG_STATE_CLOSING:
            if (gDialogBoxOpenTimer == 20.0f) {
                level_set_transition(0, 0);
                play_sound(SOUND_MENU_MESSAGEDISAPPEAR, gDefaultSoundArgs);

                if (gDialogBoxType == DIALOG_TYPE_ZOOM) {
                    stop_mario(2);
                }

                gDialogResponse = D_80330430;
            }

            gDialogBoxOpenTimer = gDialogBoxOpenTimer + 10.0f;
            gDialogBoxScale = gDialogBoxScale + 2.0f;

            if (gDialogBoxOpenTimer == DEFAULT_DIALOG_BOX_ANGLE) {
                gDialogBoxState = DIALOG_STATE_OPENING;
                gDialogID = -1;
                D_8033042C = 0;
                D_80330434 = 0;
                gLastDialogPageStrPos = 0;
                gDialogResponse = 0;
            }
#ifndef VERSION_JP
            sp2F = 1;
#endif
            break;
    }

    func_802D8134(dialog, dialog->linesPerBox);

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, func_802D8954(dialog->leftOffset),
                  func_802D8954(DIAG_VAL2 - dialog->width),
#ifdef VERSION_EU
                  func_802D8954(dialog->leftOffset + DIAG_VAL3 / gDialogBoxScale),
                  func_802D8954((240 - dialog->width) + ((dialog->linesPerBox * 80) / DIAG_VAL4) / gDialogBoxScale));
#else
                  func_802D8954(DIAG_VAL3 + dialog->leftOffset),
                  func_802D8954(240 + ((dialog->linesPerBox * 80) / DIAG_VAL4) - dialog->width));
#endif
#ifdef VERSION_JP
    func_802D8980(0, dialog);
#else
    func_802D8980(0, dialog, sp2F);
#endif

    if (gLastDialogPageStrPos == -1 && D_80330434 == 1) {
        func_802D8ED4();
    }

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, 2, 2, 316, 236);

    if (gLastDialogPageStrPos != -1 && gDialogBoxState == DIALOG_STATE_WAITBUTTON) {
        func_802D9030(dialog->linesPerBox);
    }
}

void func_802D9A14(s16 a0) {
    if (D_8033047C == -1) {
        D_8033047C = a0;
    }
}

void reset_cutscene_msg_fade(void) {
    gCutsceneMsgFade = 0;
}

void func_802D9A60(void) {
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, gCutsceneMsgFade);
}

void func_802D9AE8(void) {
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);

    if (gCutsceneMsgFade < 250) {
        gCutsceneMsgFade += 25;
    } else {
        gCutsceneMsgFade = 255;
    }
}

u8 ascii_to_credits_char(u8 c) {
    if (c >= 'A' && c <= 'Z') {
        return (c - ('A' - 0xA));
    }

    if (c >= 'a' && c <= 'z') { // remap lower to upper case
        return (c - ('a' - 0xA));
    }

    if (c == ' ') {
        return DIALOG_CHAR_SPACE;
    }
    if (c == '.') {
        return 0x24;
    }
    if (c == '3') {
        return ASCII_TO_DIALOG('3');
    }
    if (c == '4') {
        return ASCII_TO_DIALOG('4');
    }
    if (c == '6') {
        return ASCII_TO_DIALOG('6');
    }

    return DIALOG_CHAR_SPACE;
}

void print_credits_str_ascii(s16 x, s16 y, const char *str) {
    s32 pos = 0;
    u8 c = str[pos];
    u8 creditStr[100];

    while (c != 0) {
        creditStr[pos++] = ascii_to_credits_char(c);
        c = str[pos];
    }

    creditStr[pos] = DIALOG_CHAR_TERMINATOR;

    print_credits_str_dialog(x, y, creditStr);
}

void set_cutscene_message(s16 xOffset, s16 yOffset, s16 msgIndex, s16 msgDuration) {
    // is message done printing?
    if (gCutsceneMsgIndex == -1) {
        gCutsceneMsgIndex = msgIndex;
        gCutsceneMsgDuration = msgDuration;
        gCutsceneMsgTimer = 0;
        gCutsceneMsgXOffset = xOffset;
        gCutsceneMsgYOffset = yOffset;
        gCutsceneMsgFade = 0;
    }
}

void do_cutscene_handler(void) {
    s16 x;

    // is a cutscene playing? do not perform this handler's actions if so.
    if (gCutsceneMsgIndex == -1) {
        return;
    }

    dl_add_new_ortho_matrix();

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, gCutsceneMsgFade);

#ifdef VERSION_EU
    switch (eu_get_language()) {
        case LANGUAGE_ENGLISH:
            x = get_str_x_pos_from_center(gCutsceneMsgXOffset, gEndCutsceneStringsEn[gCutsceneMsgIndex], 10.0f);
            PrintGenericText(x, 240 - gCutsceneMsgYOffset, gEndCutsceneStringsEn[gCutsceneMsgIndex]);
            break;
        case LANGUAGE_FRENCH:
            x = get_str_x_pos_from_center(gCutsceneMsgXOffset, gEndCutsceneStringsFr[gCutsceneMsgIndex], 10.0f);
            PrintGenericText(x, 240 - gCutsceneMsgYOffset, gEndCutsceneStringsFr[gCutsceneMsgIndex + 8]);
            break;
        case LANGUAGE_GERMAN:
            x = get_str_x_pos_from_center(gCutsceneMsgXOffset, gEndCutsceneStringsDe[gCutsceneMsgIndex], 10.0f);
            PrintGenericText(x, 240 - gCutsceneMsgYOffset, gEndCutsceneStringsDe[gCutsceneMsgIndex + 16]);
            break;
    }
#else
    // get the x coordinate of where the cutscene string starts.
    x = get_str_x_pos_from_center(gCutsceneMsgXOffset, gEndCutsceneStringsEn[gCutsceneMsgIndex], 10.0f);

    PrintGenericText(x, 240 - gCutsceneMsgYOffset, gEndCutsceneStringsEn[gCutsceneMsgIndex]);
#endif

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);

    // if the timing variable is less than 5, increment
    // the fade until we are at full opacity.
    if (gCutsceneMsgTimer < 5) {
        gCutsceneMsgFade += 50;
    }

    // if the cutscene frame length + the fade-in counter is
    // less than the timer, it means we have exceeded the
    // time that the message is supposed to remain on
    // screen. if (message_duration = 50) and (msg_timer = 55)
    // then after the first 5 frames, the message will remain
    // on screen for another 50 frames until it starts fading.
    if (gCutsceneMsgDuration + 5 < gCutsceneMsgTimer) {
        gCutsceneMsgFade -= 50;
    }

    // like the first check, it takes 5 frames to fade out, so
    // perform a + 10 to account for the earlier check (10-5=5).
    if (gCutsceneMsgDuration + 10 < gCutsceneMsgTimer) {
        gCutsceneMsgIndex = -1;
        gCutsceneMsgFade = 0;
        gCutsceneMsgTimer = 0;
        return;
    }

    gCutsceneMsgTimer++;
}

#ifndef VERSION_JP
extern Gfx castle_grounds_seg7_us_dl_0700F2E8[];
#endif

#ifdef VERSION_JP
#define PEACH_MESSAGE_TIMER 170
#else
#define PEACH_MESSAGE_TIMER 250
#endif

#ifdef VERSION_JP
#define STR_X 53
#define STR_Y 136
#else
#define STR_X 38
#define STR_Y 142
#endif
// "Dear Mario" message handler
void print_peach_letter_message(void) {
    void **dialogTable;
    struct DialogEntry *dialog;
    u8 *str;
#ifdef VERSION_EU
    gInGameLanguage = eu_get_language();
    switch (gInGameLanguage) {
        case LANGUAGE_ENGLISH:
            dialogTable = segmented_to_virtual(dialog_table_eu_en);
            break;
        case LANGUAGE_FRENCH:
            dialogTable = segmented_to_virtual(dialog_table_eu_fr);
            break;
        case LANGUAGE_GERMAN:
            dialogTable = segmented_to_virtual(dialog_table_eu_de);
            break;
    }
#else
    dialogTable = segmented_to_virtual(seg2_dialog_table);
#endif
    dialog = segmented_to_virtual(dialogTable[gDialogID]);

    str = segmented_to_virtual(dialog->str);

    dl_add_new_translation_matrix(1, 97.0f, 118.0f, 0);

    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, gCutsceneMsgFade);
    gSPDisplayList(gDisplayListHead++, castle_grounds_seg7_dl_0700EA58);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 20, 20, 20, gCutsceneMsgFade);

    PrintGenericText(STR_X, STR_Y, str);
#ifdef VERSION_JP
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);
#else
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    gDPSetEnvColor(gDisplayListHead++, 200, 80, 120, gCutsceneMsgFade);
    gSPDisplayList(gDisplayListHead++, castle_grounds_seg7_us_dl_0700F2E8);
#endif

    // at the start/end of message, reset the fade.
    if (gCutsceneMsgTimer == 0) {
        gCutsceneMsgFade = 0;
    }

    // we're less than 20 increments, so increase the fade.
    if (gCutsceneMsgTimer < 20) {
        gCutsceneMsgFade += 10;
    }

    // we're after PEACH_MESSAGE_TIMER increments, so decrease the fade.
    if (gCutsceneMsgTimer > PEACH_MESSAGE_TIMER) {
        gCutsceneMsgFade -= 10;
    }

    // 20 increments after the start of the decrease, we're
    // back where we are, so reset everything at the end.
    if (gCutsceneMsgTimer > (PEACH_MESSAGE_TIMER + 20)) {
        gCutsceneMsgIndex = -1;
        gCutsceneMsgFade = 0; //! uselessly reset since the next execution will just set it to 0 again.
        gDialogID = -1;
        gCutsceneMsgTimer = 0;
        return; // return to avoid incrementing the timer
    }

    gCutsceneMsgTimer++;
}

void RenderHudCannonReticle(void) {
    dl_add_new_translation_matrix(1, 160.0f, 120.0f, 0);

    gDPSetEnvColor(gDisplayListHead++, 50, 50, 50, 180);
    dl_add_new_translation_matrix(1, -20.0f, -8.0f, 0);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    dl_add_new_translation_matrix(1, 20.0f, 8.0f, 0);
    dl_add_new_rotation_matrix(2, 180.0f, 0, 0, 1.0f);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    dl_add_new_translation_matrix(1, 8.0f, -20.0f, 0);
    dl_add_new_rotation_matrix(2, DEFAULT_DIALOG_BOX_ANGLE, 0, 0, 1.0f);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    dl_add_new_translation_matrix(1, -8.0f, 20.0f, 0);
    dl_add_new_rotation_matrix(2, -DEFAULT_DIALOG_BOX_ANGLE, 0, 0, 1.0f);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

void func_802DA4DC(void) {
    D_8036008E = 0;
}

void func_802DA4F4(void) {
    if (select_or_activate_mario_cam(0) == 1) {
        D_80330530 = 1;
    } else {
        D_80330530 = 2;
    }
}

void ShadeScreen(void) {
    dl_add_new_translation_matrix(1, 0, 240.0f, 0);
    dl_add_new_scale_matrix(2, 2.6f, 3.4f, 1.0f);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 110);
    gSPDisplayList(gDisplayListHead++, dl_draw_text_bg_box);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

void PrintAnimatedRedCoin(s16 sp4a, s16 sp4e) {
    s32 timer = gGlobalTimer;

    dl_add_new_translation_matrix(1, sp4a, sp4e, 0);
    dl_add_new_scale_matrix(2, 0.2f, 0.2f, 1.0f);
    gDPSetRenderMode(gDisplayListHead++, G_RM_TEX_EDGE, G_RM_TEX_EDGE2);

    switch (timer & 6) {
        case 0:
            gSPDisplayList(gDisplayListHead++, coin_seg3_dl_03007940);
            break;
        case 2:
            gSPDisplayList(gDisplayListHead++, coin_seg3_dl_03007968);
            break;
        case 4:
            gSPDisplayList(gDisplayListHead++, coin_seg3_dl_03007990);
            break;
        case 6:
            gSPDisplayList(gDisplayListHead++, coin_seg3_dl_030079B8);
            break;
    }

    gDPSetRenderMode(gDisplayListHead++, G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

void func_802DA874(void) {
    s8 sp1f;

    for (sp1f = 0; sp1f < D_8036008E; sp1f++) {
        PrintAnimatedRedCoin(290 - sp1f * 20, 16);
    }
}

#ifdef VERSION_EU
u8 gTextCourseArr[][7] = { // D_802FDA10
    { TEXT_COURSE },
    { TEXT_COURSE_FR },
    { TEXT_COURSE_DE }
};
#endif

#ifdef VERSION_JP
#define CRS_NUM_X1 93
#else
#define CRS_NUM_X1 100
#endif
#ifdef VERSION_EU
#define TXT_STAR_X 89
#define ACT_NAME_X 107
#define LVL_NAME_X 108
#else
#define TXT_STAR_X 98
#define ACT_NAME_X 116
#define LVL_NAME_X 117
#endif
void func_802DA8EC(void) {
#ifdef VERSION_EU
    u8 textMyScore[][10] = { { TEXT_MY_SCORE }, { TEXT_MY_SCORE_FR }, { TEXT_MY_SCORE_DE } };
#else
    u8 textCourse[] = { TEXT_COURSE };
    u8 textMyScore[] = { TEXT_MY_SCORE };
#endif
    u8 textStar[] = { TEXT_STAR };
    u8 textUnfilledStar[] = { TEXT_UNFILLED_STAR };

    u8 strCourseNum[4];
    void **levelNameTbl;
    u8 *levelName;
    void **actNameTbl;
    u8 *actName;
    u8 courseIndex;
    u8 starFlags;

#ifndef VERSION_EU
    levelNameTbl = segmented_to_virtual(seg2_level_name_table);
    actNameTbl = segmented_to_virtual(seg2_act_name_table);
#endif

    courseIndex = gCurrCourseNum - 1;
    starFlags = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

#ifdef VERSION_EU
    switch (gInGameLanguage) {
        case LANGUAGE_ENGLISH:
            actNameTbl = segmented_to_virtual(act_name_table_eu_en);
            levelNameTbl = segmented_to_virtual(level_name_table_eu_en);
            break;
        case LANGUAGE_FRENCH:
            actNameTbl = segmented_to_virtual(act_name_table_eu_fr);
            levelNameTbl = segmented_to_virtual(level_name_table_eu_fr);
            break;
        case LANGUAGE_GERMAN:
            actNameTbl = segmented_to_virtual(act_name_table_eu_de);
            levelNameTbl = segmented_to_virtual(level_name_table_eu_de);
            break;
    }
#endif

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

    if (courseIndex < COURSE_STAGES_COUNT) {
        ShowCoins(1, gCurrSaveFileNum - 1, courseIndex, 178, 103);
        ShowStars(gCurrSaveFileNum - 1, courseIndex, 118, 103);
    }

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);

    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

    if (courseIndex < COURSE_STAGES_COUNT && save_file_get_course_star_count(gCurrSaveFileNum - 1, courseIndex) != 0) {
#ifdef VERSION_EU
        PrintGenericText(48, 121, textMyScore[gInGameLanguage]);
#else
        PrintGenericText(62, 121, textMyScore);
#endif
    }

    levelName = segmented_to_virtual(levelNameTbl[courseIndex]);

    if (courseIndex < COURSE_STAGES_COUNT) {
#ifdef VERSION_EU
        PrintGenericText(48, 157, gTextCourseArr[gInGameLanguage]);
#else
        PrintGenericText(63, 157, textCourse);
#endif
        Int2Str(gCurrCourseNum, strCourseNum);
#ifdef VERSION_EU
        PrintGenericText(get_str_width(gTextCourseArr[gInGameLanguage]) + 51, 157, strCourseNum);
#else
        PrintGenericText(CRS_NUM_X1, 157, strCourseNum);
#endif

        actName = segmented_to_virtual(actNameTbl[(gCurrCourseNum - 1) * 6 + D_80330534 - 1]);

        if (starFlags & (1 << (D_80330534 - 1))) {
            PrintGenericText(TXT_STAR_X, 140, textStar);
        } else {
            PrintGenericText(TXT_STAR_X, 140, textUnfilledStar);
        }

        PrintGenericText(ACT_NAME_X, 140, actName);
#ifndef VERSION_JP
        PrintGenericText(LVL_NAME_X, 157, &levelName[3]);
#endif
    }
#ifndef VERSION_JP
    else {
#ifdef VERSION_US
        PrintGenericText(94, 157, &levelName[3]);
#elif defined(VERSION_EU)
        PrintGenericText(get_str_x_pos_from_center(159, &levelName[3], 10.0f), 157, &levelName[3]);
#endif
    }
#else
    PrintGenericText(117, 157, &levelName[3]);
#endif
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
}

#ifdef VERSION_JP
#define TXT1_X 4
#define TXT2_X 116
#define Y_VAL7 0
#else
#define TXT1_X 3
#define TXT2_X 119
#define Y_VAL7 2
#endif

void PauseScreenCameraMenu(s16 sp72, s16 sp76, s8 *sp78, s16 sp7e) {
    u8 textLakituMario[] = { TEXT_LAKITU_MARIO };
    u8 textLakituStop[] = { TEXT_LAKITU_STOP };
#ifdef VERSION_EU
    u8 textNormalUpClose[][20] = {
        { TEXT_NORMAL_UPCLOSE },
        { TEXT_NORMAL_UPCLOSE_FR },
        { TEXT_NORMAL_UPCLOSE_DE }
    };
    u8 textNormalFixed[][17] = {
        { TEXT_NORMAL_FIXED },
        { TEXT_NORMAL_FIXED_FR },
        { TEXT_NORMAL_FIXED_DE },
    };
#else
    u8 textNormalUpClose[] = { TEXT_NORMAL_UPCLOSE };
    u8 textNormalFixed[] = { TEXT_NORMAL_FIXED };
#endif

    handleMenuScrolling(MENU_SCROLL_HORIZONTAL, sp78, 1, 2);

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

    PrintGenericText(sp72 + 14, sp76 + 2, textLakituMario);
#ifdef VERSION_EU
    PrintGenericText(sp72 + TXT1_X, sp76 - 13, textNormalUpClose[gInGameLanguage]);
#else
    PrintGenericText(sp72 + TXT1_X, sp76 - 13, textNormalUpClose);
#endif
    PrintGenericText(sp72 + 124, sp76 + 2, textLakituStop);
#ifdef VERSION_EU
    PrintGenericText(sp72 + TXT2_X, sp76 - 13, textNormalFixed[gInGameLanguage]);
#else
    PrintGenericText(sp72 + TXT2_X, sp76 - 13, textNormalFixed);
#endif

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    dl_add_new_translation_matrix(1, ((sp78[0] - 1) * sp7e) + sp72, sp76 + Y_VAL7, 0);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    switch (sp78[0]) {
        case 1:
            select_or_activate_mario_cam(1);
            break;
        case 2:
            select_or_activate_mario_cam(2);
            break;
    }
}

#ifdef VERSION_JP
#define X_VAL8 0
#define Y_VAL8 4
#else
#define X_VAL8 4
#define Y_VAL8 2
#endif

void PauseScreen2(s16 sp62, s16 sp66, s8 *sp68, s16 sp6e) {
#ifdef VERSION_EU
    u8 textContinue[][10] = {
        { TEXT_CONTINUE },
        { TEXT_CONTINUE_FR },
        { TEXT_CONTINUE_DE }
    };
    u8 textExitCourse[][15] = {
        { TEXT_EXIT_COURSE },
        { TEXT_EXIT_COURSE_FR },
        { TEXT_EXIT_COURSE_DE }
    };
    u8 textCameraAngleR[][24] = {
        { TEXT_CAMERA_ANGLE_R_EN },
        { TEXT_CAMERA_ANGLE_R_FR },
        { TEXT_CAMERA_ANGLE_R_DE }
    };
#else
    u8 textContinue[] = { TEXT_CONTINUE };
    u8 textExitCourse[] = { TEXT_EXIT_COURSE };
    u8 textCameraAngleR[] = { TEXT_CAMERA_ANGLE_R };
#endif

    handleMenuScrolling(MENU_SCROLL_VERTICAL, sp68, 1, 3);

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

#ifdef VERSION_EU
    PrintGenericText(sp62 + 10, sp66 - 2, textContinue[gInGameLanguage]);
    PrintGenericText(sp62 + 10, sp66 - 17, textExitCourse[gInGameLanguage]);
#else
    PrintGenericText(sp62 + 10, sp66 - 2, textContinue);
    PrintGenericText(sp62 + 10, sp66 - 17, textExitCourse);
#endif

    if (sp68[0] != 3) {
#ifdef VERSION_EU
        PrintGenericText(sp62 + 10, sp66 - 33, textCameraAngleR[gInGameLanguage]);
#else
        PrintGenericText(sp62 + 10, sp66 - 33, textCameraAngleR);
#endif
        gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);

        dl_add_new_translation_matrix(1, sp62 - X_VAL8, (sp66 - ((sp68[0] - 1) * sp6e)) - Y_VAL8, 0);

        gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
        gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
        gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
    }

    if (sp68[0] == 3) {
        PauseScreenCameraMenu(sp62 - 42, sp66 - 42, &D_80330530, 110);
    }
}

void PauseCastleMenuBox(s16 sp42, s16 sp46) {
    dl_add_new_translation_matrix(1, sp42 - 78, sp46 - 32, 0);
    dl_add_new_scale_matrix(2, 1.2f, 0.8f, 1.0f);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 105);
    gSPDisplayList(gDisplayListHead++, dl_draw_text_bg_box);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    dl_add_new_translation_matrix(1, sp42 + 6, sp46 - 28, 0);
    dl_add_new_rotation_matrix(2, DEFAULT_DIALOG_BOX_ANGLE, 0, 0, 1.0f);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    dl_add_new_translation_matrix(1, sp42 - 9, sp46 - 101, 0);
    dl_add_new_rotation_matrix(2, 270.0f, 0, 0, 1.0f);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

void func_802DB540(void) {
    u8 sp07;

    if (gLastCompletedCourseNum == 0) {
        sp07 = 0;
    } else {
        sp07 = gLastCompletedCourseNum - 1;

        if (sp07 >= COURSE_STAGES_COUNT) {
            sp07 = COURSE_STAGES_COUNT;
        }
    }

    D_80330430 = sp07;
}

void PauseScreen1(void) {
    u8 sp28[] = { TEXT_PAUSE };

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

#ifdef VERSION_EU
    PutString(2, get_str_x_pos_from_center_scale(160, sp28, 12.0f), 81, sp28);
#else
    PutString(2, 123, 81, sp28);
#endif

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
}

void func_802DB698(s16 sp4a, s16 sp4e, s16 sp52, s16 sp56) {
    s16 sp46 = 0;

    u8 sp28[COURSE_STAGES_COUNT * 2];

    u8 textStar[] = { TEXT_STAR };

    u8 sp23 = save_file_get_star_flags(sp52, sp56);
    u16 sp20 = save_file_get_course_star_count(sp52, sp56);

    u16 sp1e = 0;

    if (sp23 & 0x40) {
        sp20--;
        PrintGenericText(sp4a + 89, sp4e - 5, textStar);
    }

    while (sp46 != sp20) {
        if (sp23 & (1 << sp1e)) {
            sp28[sp1e * 2] = DIALOG_CHAR_STAR_FILLED;
            sp46++;
        } else {
            sp28[sp1e * 2] = DIALOG_CHAR_STAR_OPEN;
        }

        sp28[sp1e * 2 + 1] = DIALOG_CHAR_SPACE;
        sp1e++;
    }

    if (sp20 == sp1e && sp20 != 6) {
        sp28[sp1e * 2] = DIALOG_CHAR_STAR_OPEN;
        sp28[sp1e * 2 + 1] = DIALOG_CHAR_SPACE;
        sp1e++;
    }

    sp28[sp1e * 2] = DIALOG_CHAR_TERMINATOR;

    PrintGenericText(sp4a + 14, sp4e + 13, sp28);
}

void func_802DB840(s16 x, s16 y) {
#ifdef VERSION_EU
    void **levelNameTbl;
#else
    void **levelNameTbl = segmented_to_virtual(seg2_level_name_table);
#endif

#ifdef VERSION_EU
    u8 textCoin[] = { TEXT_COIN };
    u8 textX[] = { TEXT_VARIABLE_X };
#else
    u8 textCoin[] = { TEXT_COIN_X };
#endif

    void *levelName;

    u8 strVal[8];
    s16 sp3a = D_80330430;

#ifdef VERSION_EU
    switch (gInGameLanguage) {
        case LANGUAGE_ENGLISH:
            levelNameTbl = segmented_to_virtual(level_name_table_eu_en);
            break;
        case LANGUAGE_FRENCH:
            levelNameTbl = segmented_to_virtual(level_name_table_eu_fr);
            break;
        case LANGUAGE_GERMAN:
            levelNameTbl = segmented_to_virtual(level_name_table_eu_de);
            break;
    }
#endif

    handleMenuScrolling(MENU_SCROLL_VERTICAL, &D_80330430, -1, COURSE_STAGES_COUNT + 1);

    if (D_80330430 == COURSE_STAGES_COUNT + 1) {
        D_80330430 = 0;
    }

    if (D_80330430 == -1) {
        D_80330430 = COURSE_STAGES_COUNT;
    }

    if (D_80330430 != COURSE_STAGES_COUNT) {
        while (save_file_get_course_star_count(gCurrSaveFileNum - 1, D_80330430) == 0) {
            if (D_80330430 >= sp3a) {
                D_80330430++;
            } else {
                D_80330430--;
            }

            if (D_80330430 == COURSE_STAGES_COUNT || D_80330430 == -1) {
                D_80330430 = COURSE_STAGES_COUNT;
                break;
            }
        }
    }

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

    if (D_80330430 < COURSE_STAGES_COUNT) {
        levelName = segmented_to_virtual(levelNameTbl[D_80330430]);
        func_802DB698(x, y, gCurrSaveFileNum - 1, D_80330430);
        PrintGenericText(x + 34, y - 5, textCoin);
#ifdef VERSION_EU
        PrintGenericText(x + 44, y - 5, textX);
#endif
        Int2Str(save_file_get_course_coin_score(gCurrSaveFileNum - 1, D_80330430), strVal);
        PrintGenericText(x + 54, y - 5, strVal);
#ifdef VERSION_EU
        PrintGenericText(x - 17, y + 30, levelName);
#endif
    } else {
        u8 textStarX[] = { TEXT_STAR_X };
        levelName = segmented_to_virtual(levelNameTbl[COURSE_MAX]);
        PrintGenericText(x + 40, y + 13, textStarX);
        Int2Str(save_file_get_total_star_count(gCurrSaveFileNum - 1, COURSE_BONUS_STAGES - 1, COURSE_MAX - 1), strVal);
        PrintGenericText(x + 60, y + 13, strVal);
#ifdef VERSION_EU
        PrintGenericText(get_str_x_pos_from_center(x + 51, levelName, 10.0f), y + 30, levelName);
#endif
    }

#ifndef VERSION_EU
    PrintGenericText(x - 9, y + 30, levelName);
#endif

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
}

s8 D_803305C0 = 0;
s32 D_803305C4 = 0;
s32 D_803305C8 = 0; // gCourseCompleteMenuCoins
s8 D_803305CC = 0;

s16 func_802DBBB0(void) {
    s16 sp26;

#ifdef VERSION_EU
    gInGameLanguage = eu_get_language();
#endif

    switch (gDialogBoxState) {
        case DIALOG_STATE_OPENING:
            D_80330430 = 1;
            D_80360088 = 0;
            level_set_transition(-1, 0);
#ifdef VERSION_JP
            play_sound(SOUND_MENU_PAUSE1, gDefaultSoundArgs);
#else
            play_sound(SOUND_MENU_PAUSE1_HIGHPRIO, gDefaultSoundArgs);
#endif

            if (gCurrCourseNum >= COURSE_MIN && gCurrCourseNum <= COURSE_MAX) {
                func_802DA4F4();
                gDialogBoxState = DIALOG_STATE_WAITBUTTON;
            } else {
                func_802DB540();
                gDialogBoxState = DIALOG_STATE_SCROLLING;
            }
            break;
        case DIALOG_STATE_WAITBUTTON:
            ShadeScreen();
            func_802DA8EC();
            func_802DA874();

            if (gMarioStates[0].action & ACT_FLAG_PAUSE_EXIT) {
                PauseScreen2(99, 93, &D_80330430, 15);
            }

#ifdef VERSION_EU
            if (gPlayer3Controller->buttonPressed & (A_BUTTON | Z_TRIG | START_BUTTON))
#else
            if (gPlayer3Controller->buttonPressed & A_BUTTON
             || gPlayer3Controller->buttonPressed & START_BUTTON)
#endif
            {
                level_set_transition(0, 0);
                play_sound(SOUND_MENU_PAUSE2, gDefaultSoundArgs);
                gDialogBoxState = DIALOG_STATE_OPENING;
                D_8033047C = -1;

                if (D_80330430 == 2) {
                    sp26 = D_80330430;
                } else {
                    sp26 = 1;
                }

                return sp26;
            }
            break;
        case DIALOG_STATE_SCROLLING:
            ShadeScreen();
            PauseScreen1();
            PauseCastleMenuBox(160, 143);
            func_802DB840(104, 60);

#ifdef VERSION_EU
            if (gPlayer3Controller->buttonPressed & (A_BUTTON | Z_TRIG | START_BUTTON))
#else
            if (gPlayer3Controller->buttonPressed & A_BUTTON
             || gPlayer3Controller->buttonPressed & START_BUTTON)
#endif
            {
                level_set_transition(0, 0);
                play_sound(SOUND_MENU_PAUSE2, gDefaultSoundArgs);
                D_8033047C = -1;
                gDialogBoxState = DIALOG_STATE_OPENING;

                return 1;
            }
            break;
    }

    if (D_80360088 < 250) {
        D_80360088 += 25;
    }

    return 0;
}

#ifdef VERSION_JP
#define TXT_HISCORE_X 112
#define TXT_HISCORE_Y 48
#define TXT_CONGRATS_X 60
#else
#define TXT_HISCORE_X 109
#define TXT_HISCORE_Y 36
#define TXT_CONGRATS_X 70
#endif

void func_802DBE2C(s8 sp4b) {
#ifdef VERSION_EU
    u8 textHiScore[][15] = {
        { TEXT_HI_SCORE_EN },
        { TEXT_HI_SCORE_FR },
        { TEXT_HI_SCORE_DE }
    };
    u8 textCongratulations[][16] = {
        { TEXT_CONGRATULATIONS },
        { TEXT_CONGRATULATIONS_FR },
        { TEXT_CONGRATULATIONS_DE }
    };
#else
    u8 textHiScore[] = { TEXT_HI_SCORE_EN };
    u8 textCongratulations[] = { TEXT_CONGRATULATIONS };
#endif

    u8 sp27 = sins(D_80360080) * 50.0f + 200.0f;

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, sp27, sp27, sp27, 255);

    if (sp4b == 0) {
#ifdef VERSION_EU
        PutString(2, get_str_x_pos_from_center_scale(160, textHiScore[gInGameLanguage], 12.0f),
                  36, textHiScore[gInGameLanguage]);
#else
        PutString(2, TXT_HISCORE_X, TXT_HISCORE_Y, textHiScore);
#endif
    } else {
#ifdef VERSION_EU
        PutString(2, get_str_x_pos_from_center_scale(160, textCongratulations[gInGameLanguage], 12.0f),
                  67, textCongratulations[gInGameLanguage]);
#else
        PutString(2, TXT_CONGRATS_X, 67, textCongratulations);
#endif
    }

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
}

void func_802DC050(s16 sp32, s16 sp36) {
    u8 sp2c[4];
    u8 hudTextSymCoin[] = { HUD_CHAR_SYM_COIN, 0xFF };
    u8 hudTextSymX[] = { HUD_CHAR_SYM_X, 0xFF };

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);

    PutString(2, sp32, sp36, hudTextSymCoin);
    PutString(2, sp32 + 16, sp36, hudTextSymX);

    Int2Str(D_803305C8, sp2c);
    PutString(2, sp32 + 32, sp36, sp2c);

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);

    if (D_803305C8 >= gHudDisplay.coins) {
        D_803305C0 = 1;
        D_803305C8 = gHudDisplay.coins;

        if (gGotFileCoinHiScore != 0) {
            func_802DBE2C(0);
        }
    } else {
        if ((D_803305C4 & 1) || gHudDisplay.coins > 70) {
            D_803305C8++;
            play_sound(SOUND_MENU_YOSHIGAINLIVES, gDefaultSoundArgs);

            if (D_803305C8 == 50 || D_803305C8 == 100 || D_803305C8 == 150) {
                play_sound(SOUND_GENERAL_1UP, gDefaultSoundArgs);
                gMarioState[0].numLives++;
            }
        }

        if (gHudDisplay.coins == D_803305C8 && gGotFileCoinHiScore != 0) {
            play_sound(SOUND_MENU_MARIOCASTLEWARP2, gDefaultSoundArgs);
        }
    }
}

void func_802DC2B4(s32 sp18, u8 sp1f) {
    if (gHudDisplay.coins == D_803305C8 && (gCurrCourseStarFlags & sp1f) == 0 && D_803305CC == 0) {
        play_star_fanfare();
        D_803305CC = sp18;
    }
}

#ifdef VERSION_EU
#define TXT_NAME_X1 centerX
#define TXT_NAME_X2 centerX - 1
#else
#define TXT_NAME_X1 71
#define TXT_NAME_X2 69
#endif
#ifdef VERSION_JP
#define CRS_NUM_X2 95
#define CRS_NUM_X3 93
#define TXT_CLEAR_X1 205
#define TXT_CLEAR_X2 203
#else
#define CRS_NUM_X2 104
#define CRS_NUM_X3 102
#define TXT_CLEAR_X1 get_str_width(name) + 81
#define TXT_CLEAR_X2 get_str_width(name) + 79
#endif

void func_802DC330(void) {
#ifdef VERSION_JP
    u8 textSymStar[] = { HUD_CHAR_SYM_STAR, 0xFF };
    u8 textCourse[] = { TEXT_COURSE };
    u8 textCatch[] = { TEXT_CATCH };
    u8 textClear[] = { TEXT_CLEAR };
#elif defined(VERSION_EU)
    UNUSED u8 textClear[] = { TEXT_CLEAR }; // unused in EU
    u8 textSymStar[] = { HUD_CHAR_SYM_STAR, 0xFF };
#define textCourse gTextCourseArr[gInGameLanguage]
#else
    u8 textCourse[] = { TEXT_COURSE };
    UNUSED u8 textCatch[] = { TEXT_CATCH }; // unused in US
    UNUSED u8 textClear[] = { TEXT_CLEAR };
    u8 textSymStar[] = { HUD_CHAR_SYM_STAR, 0xFF };
#endif

    void **actNameTbl;
    void **levelNameTbl;
    u8 *name;

    u8 strCourseNum[4];

#ifdef VERSION_EU
    s16 centerX;
    switch (gInGameLanguage) {
        case LANGUAGE_ENGLISH:
            actNameTbl = segmented_to_virtual(act_name_table_eu_en);
            levelNameTbl = segmented_to_virtual(level_name_table_eu_en);
            break;
        case LANGUAGE_FRENCH:
            actNameTbl = segmented_to_virtual(act_name_table_eu_fr);
            levelNameTbl = segmented_to_virtual(level_name_table_eu_fr);
            break;
        case LANGUAGE_GERMAN:
            actNameTbl = segmented_to_virtual(act_name_table_eu_de);
            levelNameTbl = segmented_to_virtual(level_name_table_eu_de);
            break;
    }
#else
    actNameTbl = segmented_to_virtual(seg2_act_name_table);
    levelNameTbl = segmented_to_virtual(seg2_level_name_table);
#endif

    if (gLastCompletedCourseNum <= COURSE_STAGES_MAX) {
        func_802DC050(118, 103);
        func_802DC2B4(1, 1 << (gLastCompletedStarNum - 1));

        if (gLastCompletedStarNum == 7) {
            name = segmented_to_virtual(actNameTbl[COURSE_STAGES_MAX * 6 + 1]);
        } else {
            name = segmented_to_virtual(actNameTbl[(gLastCompletedCourseNum - 1) * 6 + gLastCompletedStarNum - 1]);
        }

        gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
        Int2Str(gLastCompletedCourseNum, strCourseNum);
        gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, D_80360088);
        PrintGenericText(65, 165, textCourse);
        PrintGenericText(CRS_NUM_X2, 165, strCourseNum);
        gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
        PrintGenericText(63, 167, textCourse);
        PrintGenericText(CRS_NUM_X3, 167, strCourseNum);
        gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
    } else if (gLastCompletedCourseNum == COURSE_BITDW || gLastCompletedCourseNum == COURSE_BITFS) {
        name = segmented_to_virtual(levelNameTbl[gLastCompletedCourseNum - 1]);
        gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
        gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, D_80360088);
#ifdef VERSION_EU
        centerX = get_str_x_pos_from_center(153, name, 12.0f);
#endif
        PrintGenericText(TXT_NAME_X1, 130, name);
#ifndef VERSION_EU
        PrintGenericText(TXT_CLEAR_X1, 130, textClear);
#endif
        gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
        PrintGenericText(TXT_NAME_X2, 132, name);
#ifndef VERSION_EU
        PrintGenericText(TXT_CLEAR_X2, 132, textClear);
#endif
        gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
        func_802DBE2C(1);
        func_802DC050(118, 111);
        func_802DC2B4(2, 0);
        return;
    } else {
        name = segmented_to_virtual(actNameTbl[COURSE_STAGES_MAX * 6]);
        func_802DC050(118, 103);
        func_802DC2B4(1, 1 << (gLastCompletedStarNum - 1));
    }

    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
    PutString(2, 55, 77, textSymStar);
    gSPDisplayList(gDisplayListHead++, dl_rgba16_text_end);
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, D_80360088);
    PrintGenericText(76, 145, name);
#ifdef VERSION_JP
    PrintGenericText(220, 145, textCatch);
#endif
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
    PrintGenericText(74, 147, name);
#ifdef VERSION_JP
    PrintGenericText(218, 147, textCatch);
#endif
    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);
}

#ifdef VERSION_JP
#define TXT_SAVEOPTIONS_X x + 10
#elif defined(VERSION_US)
#define TXT_SAVEOPTIONS_X x + 12
#elif defined(VERSION_EU)
#define TXT_SAVEOPTIONS_X xOffset
#endif
#ifdef VERSION_JP
#define TXT_SAVECONT_Y 2
#define TXT_SAVEQUIT_Y 18
#define TXT_CONTNOSAVE_Y 38
#else
#define TXT_SAVECONT_Y 0
#define TXT_SAVEQUIT_Y 20
#define TXT_CONTNOSAVE_Y 40
#endif

#ifdef VERSION_EU
#define X_VAL9 xOffset - 12
void render_save_confirmation(s16 y, s8 *sp68, s16 sp6e)
#else
#define X_VAL9 x
void render_save_confirmation(s16 x, s16 y, s8 *sp68, s16 sp6e)
#endif
{
#ifdef VERSION_EU
    u8 textSaveAndContinueArr[][24] = {
        { TEXT_SAVE_AND_CONTINUE },
        { TEXT_SAVE_AND_CONTINUE_FR },
        { TEXT_SAVE_AND_CONTINUE_DE }
    };
    u8 textSaveAndQuitArr[][22] = {
        { TEXT_SAVE_AND_QUIT },
        { TEXT_SAVE_AND_QUIT_FR },
        { TEXT_SAVE_AND_QUIT_DE }
    };
    u8 textContinueWithoutSaveArr[][27] = {
        { TEXT_CONTINUE_WITHOUT_SAVING },
        { TEXT_CONTINUE_WITHOUT_SAVING_FR },
        { TEXT_CONTINUE_WITHOUT_SAVING_DE }
    };
#define textSaveAndContinue textSaveAndContinueArr[gInGameLanguage]
#define textSaveAndQuit textSaveAndQuitArr[gInGameLanguage]
#define textContinueWithoutSave textContinueWithoutSaveArr[gInGameLanguage]

    s16 xOffset = get_str_x_pos_from_center(160, textContinueWithoutSaveArr[gInGameLanguage], 12.0f);
#else
    u8 textSaveAndContinue[] = { TEXT_SAVE_AND_CONTINUE };
    u8 textSaveAndQuit[] = { TEXT_SAVE_AND_QUIT };
    u8 textContinueWithoutSave[] = { TEXT_CONTINUE_WITHOUT_SAVING };
#endif

    handleMenuScrolling(MENU_SCROLL_VERTICAL, sp68, 1, 3);

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_begin);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);

    PrintGenericText(TXT_SAVEOPTIONS_X, y + TXT_SAVECONT_Y, textSaveAndContinue);
    PrintGenericText(TXT_SAVEOPTIONS_X, y - TXT_SAVEQUIT_Y, textSaveAndQuit);
    PrintGenericText(TXT_SAVEOPTIONS_X, y - TXT_CONTNOSAVE_Y, textContinueWithoutSave);

    gSPDisplayList(gDisplayListHead++, dl_ia8_text_end);

    dl_add_new_translation_matrix(1, X_VAL9, y - ((sp68[0] - 1) * sp6e), 0);

    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, D_80360088);
    gSPDisplayList(gDisplayListHead++, dl_draw_triangle);

    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}

s16 func_802DCBD4(void) {
    s16 sp26;
#ifdef VERSION_EU
    gInGameLanguage = eu_get_language();
#endif

    switch (gDialogBoxState) {
        case DIALOG_STATE_OPENING:
            func_802DC330();
            if (D_803305C4 > 100 && D_803305C0 == 1) {
                gDialogBoxState = DIALOG_STATE_WAITBUTTON;
                level_set_transition(-1, 0);
                D_80360088 = 0;
                D_80330430 = 1;
            }
            break;
        case DIALOG_STATE_WAITBUTTON:
            ShadeScreen();
            func_802DC330();
#ifdef VERSION_EU
            render_save_confirmation(86, &D_80330430, 20);
#else
            render_save_confirmation(100, 86, &D_80330430, 20);
#endif

            if (D_803305C4 > 110
                && (gPlayer3Controller->buttonPressed & A_BUTTON
                 || gPlayer3Controller->buttonPressed & START_BUTTON
#ifdef VERSION_EU
                 || gPlayer3Controller->buttonPressed & Z_TRIG
#endif
                )) {
                level_set_transition(0, 0);
                play_sound(SOUND_MENU_STARSOUND, gDefaultSoundArgs);
                gDialogBoxState = DIALOG_STATE_OPENING;
                D_8033047C = -1;
                sp26 = D_80330430;
                D_803305C4 = 0;
                D_803305C8 = 0;
                D_803305C0 = 0;
                D_803305CC = 0;

                return sp26;
            }
            break;
    }

    if (D_80360088 < 250) {
        D_80360088 += 25;
    }

    D_803305C4++;

    return 0;
}

s16 func_802DCD98() {
    s16 sp26 = 0;

    dl_add_new_ortho_matrix();

    if (D_8033047C != -1) {
        switch (D_8033047C) {
            case 0:
                sp26 = func_802DBBB0();
                break;
            case 1:
                sp26 = func_802DBBB0();
                break;
            case 2:
                sp26 = func_802DCBD4();
                break;
            case 3:
                sp26 = func_802DCBD4();
                break;
        }

        D_80360080 = (s16) D_80360080 + 0x1000;
    } else if (gDialogID != -1) {
        // is the "Dear Mario, please come
        // to the castle" message?
        if (gDialogID == 20) {
            print_peach_letter_message(); // the peach message needs to be
                                          // repositioned seperately
            return sp26;
        }

        func_802D93E0();
        D_80360080 = (s16) D_80360080 + 0x1000;
    }

    return sp26;
}
