#ifndef INGAME_MENU_H
#define INGAME_MENU_H

#include "types.h"

#define MENU_MTX_PUSH 1
#define MENU_MTX_NOPUSH 2

#define MENU_SCROLL_VERTICAL 1
#define MENU_SCROLL_HORIZONTAL 2

extern s8 D_80330534;
extern s8 D_803305CC;

struct DialogEntry
{
 /*0x00*/ u32 unk00; // unused
 /*0x04*/ s8 linesPerBox;
 /*0x06*/ s16 leftOffset;
 /*0x08*/ s16 width;
 /*0x0C*/ u8 *str;
};

enum HudFontType {
    FONT_JAPANESE = 1,
    FONT_ENGLISH
};

extern s32 gDialogResponse;
extern u16 D_80360080;
extern s8 gLastDialogLineNum;
extern s32 gDialogVariable;
extern u16 D_80360088;
extern s16 gCutsceneMsgXOffset;
extern s16 gCutsceneMsgYOffset;
extern s8 D_8036008E;

extern void func_802D6440(void);
extern void dl_add_new_translation_matrix(s8 pushOp, f32 x, f32 y, f32 z);
extern void dl_add_new_rotation_matrix(s8 pushOp, f32 a, f32 x, f32 y, f32 z);
extern void dl_add_new_scale_matrix(s8 pushOp, f32 x, f32 y, f32 z);
extern void dl_add_new_ortho_matrix(void);
extern void func_802D6AFC(u8 c);
extern void PrintGenericText(s16 x, s16 y, const u8 *str);
extern void PutString(s8 font, s16 x, s16 y, const u8 *str);
extern void PrintRegularText(s16 x, s16 y, const u8 *str);
extern void print_credits_str_dialog(s16 x, s16 y, const u8 *str);
extern void handleMenuScrolling(s8 scrollDirection, s8 *currentIndex, s8 minIndex, s8 maxIndex);
#if defined(VERSION_US) || defined(VERSION_EU)
extern s16 get_str_x_pos_from_center(s16 centerPos, u8 *str, f32 scale);
#endif
#if defined(VERSION_JP) || defined(VERSION_EU)
#ifdef VERSION_JP
// remap JP get_str_x_pos_from_center() calls to get_str_x_pos_from_center_scale()
#define get_str_x_pos_from_center get_str_x_pos_from_center_scale
#endif
extern s16 get_str_x_pos_from_center_scale(s16 centerPos, u8 *str, f32 scale);
#endif
extern void ShowCoins(s32 useCourseCoinScore, s8 sp27, s8 sp2b, s16 x, s16 y);
extern void ShowStars(s8 sp2b, s8 sp2f, s16 x, s16 y);
extern void Int2Str(s32 num, u8 *dst);
extern s16 get_dialog_id(void);
extern void func_802D7F90(s16 a0);
extern void func_802D7FCC(s16 a0, s32 a1);
extern void CreateTextBox(s16 a0);
extern void func_802D8050(s16 a0);
extern void func_802D8098(void);
extern void func_802D8134(struct DialogEntry *sp40, s8 sp47);
extern void func_802D8450(s8 a0, s8 a1);
extern void func_802D875C(s8 *sp20, s16 *sp24);
extern u32 func_802D8954(s16 a0);
extern void func_802D8ED4(void);
extern void func_802D9030(s8 sp3b);
extern void func_802D91C0(s16 sp4a);
extern void func_802D93E0(void);
extern void func_802D9A14(s16);
extern void reset_cutscene_msg_fade(void);
extern void func_802D9A60(void);
extern void func_802D9AE8(void);
extern void print_credits_str_ascii(s16 x, s16 y, const char *str);
extern void set_cutscene_message(s16 xOffset, s16 yOffset, s16 msgIndex, s16 msgDuration);
extern void do_cutscene_handler(void);
extern void RenderHudCannonReticle(void);
extern void func_802DA4DC(void);
extern void func_802DA4F4(void);
extern void ShadeScreen(void);
extern void PrintAnimatedRedCoin(s16 sp4a, s16 sp4e);
extern void func_802DA874(void);
extern void func_802DA8EC(void);
extern void PauseScreenCameraMenu(s16 sp72, s16 sp76, s8 *sp78, s16 sp7e);
extern void PauseScreen2(s16 sp62, s16 sp66, s8 *sp68, s16 sp6e);
extern void PauseCastleMenuBox(s16 sp42, s16 sp46);
extern void func_802DB540(void);
extern void PauseScreen1(void);
extern void func_802DB698(s16 sp4a, s16 sp4e, s16 sp52, s16 sp56);
extern void func_802DB840(s16 sp52, s16 sp56);
extern s16 func_802DBBB0(void);
extern void func_802DBE2C(s8 sp43);
extern void func_802DC050(s16 sp32, s16 sp36);
extern void func_802DC2B4(s32 sp18, u8 sp1f);
extern void func_802DC330(void);
extern s16 func_802DCBD4(void);
extern s16 func_802DCD98(void);

#endif /* INGAME_MENU_H */
