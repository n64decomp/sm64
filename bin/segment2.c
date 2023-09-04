#include <PR/ultratypes.h>
#include <PR/gbi.h>

#include "config.h"
#include "macros.h"
#include "types.h"
#include "game/ingame_menu.h"

#include "make_const_nonconst.h"

// SM64 (US/JP/EU/SH) Segment 02

ALIGNED8 static const Texture texture_hud_char_0[] = {
#include "textures/segment2/segment2.00000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_1[] = {
#include "textures/segment2/segment2.00200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_2[] = {
#include "textures/segment2/segment2.00400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_3[] = {
#include "textures/segment2/segment2.00600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_4[] = {
#include "textures/segment2/segment2.00800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_5[] = {
#include "textures/segment2/segment2.00A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_6[] = {
#include "textures/segment2/segment2.00C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_7[] = {
#include "textures/segment2/segment2.00E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_8[] = {
#include "textures/segment2/segment2.01000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_9[] = {
#include "textures/segment2/segment2.01200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_A[] = {
#include "textures/segment2/segment2.01400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_B[] = {
#include "textures/segment2/segment2.01600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_C[] = {
#include "textures/segment2/segment2.01800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_D[] = {
#include "textures/segment2/segment2.01A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_E[] = {
#include "textures/segment2/segment2.01C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_F[] = {
#include "textures/segment2/segment2.01E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_G[] = {
#include "textures/segment2/segment2.02000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_H[] = {
#include "textures/segment2/segment2.02200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_I[] = {
#include "textures/segment2/segment2.02400.rgba16.inc.c"
};

#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_J[] = {
#include "textures/segment2/segment2.02600.rgba16.inc.c"
};
#endif

ALIGNED8 static const Texture texture_hud_char_K[] = {
#include "textures/segment2/segment2.02800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_L[] = {
#include "textures/segment2/segment2.02A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_M[] = {
#include "textures/segment2/segment2.02C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_N[] = {
#include "textures/segment2/segment2.02E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_O[] = {
#include "textures/segment2/segment2.03000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_P[] = {
#include "textures/segment2/segment2.03200.rgba16.inc.c"
};

#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_Q[] = {
#include "textures/segment2/segment2.03400.rgba16.inc.c"
};
#endif

ALIGNED8 static const Texture texture_hud_char_R[] = {
#include "textures/segment2/segment2.03600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_S[] = {
#include "textures/segment2/segment2.03800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_T[] = {
#include "textures/segment2/segment2.03A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_U[] = {
#include "textures/segment2/segment2.03C00.rgba16.inc.c"
};

#if defined(VERSION_EU) || defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_V[] = {
#include "textures/segment2/segment2.03E00.rgba16.inc.c"
};
#endif

ALIGNED8 static const Texture texture_hud_char_W[] = {
#include "textures/segment2/segment2.04000.rgba16.inc.c"
};

#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_X[] = {
#include "textures/segment2/segment2.04200.rgba16.inc.c"
};
#endif

ALIGNED8 static const Texture texture_hud_char_Y[] = {
#include "textures/segment2/segment2.04400.rgba16.inc.c"
};

#if defined(VERSION_EU) || defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_Z[] = {
#include "textures/segment2/segment2.04600.rgba16.inc.c"
};
#endif

ALIGNED8 static const Texture texture_hud_char_apostrophe[] = {
#include "textures/segment2/segment2.04800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_double_quote[] = {
#include "textures/segment2/segment2.04A00.rgba16.inc.c"
};

#ifdef VERSION_EU
ALIGNED8 static const Texture texture_hud_char_umlaut[] = {
#include "textures/segment2/segment2.umlaut.rgba16.inc.c"// EU ¨
};
#endif

#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_exclamation[] = {
#include "textures/segment2/segment2.04C00.rgba16.inc.c"// JP !
};

ALIGNED8 static const Texture texture_hud_char_double_exclamation[] = {
#include "textures/segment2/segment2.04E00.rgba16.inc.c"// JP !!
};

ALIGNED8 static const Texture texture_hud_char_question[] = {
#include "textures/segment2/segment2.05000.rgba16.inc.c"// JP ?
};

ALIGNED8 static const Texture texture_hud_char_ampersand[] = {
#include "textures/segment2/segment2.05200.rgba16.inc.c"// JP &
};

ALIGNED8 static const Texture texture_hud_char_percent[] = {
#include "textures/segment2/segment2.05400.rgba16.inc.c"// JP %
};
#endif

ALIGNED8 static const Texture texture_hud_char_multiply[] = {
#include "textures/segment2/segment2.05600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_coin[] = {
#include "textures/segment2/segment2.05800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_mario_head[] = {
#include "textures/segment2/segment2.05A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_star[] = {
#include "textures/segment2/segment2.05C00.rgba16.inc.c"
};

#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_decimal_point[] = {
#include "textures/segment2/segment2.05E00.rgba16.inc.c"
};
#endif

#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_hud_char_beta_key[] = {
#include "textures/segment2/segment2.06000.rgba16.inc.c"
};
#endif

#if defined(VERSION_CN)
ALIGNED8 static const Texture texture_hud_char_cn_04A00[] = {
#include "textures/segment2/segment2_cn.04A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_04C00[] = {
#include "textures/segment2/segment2_cn.04C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_04E00[] = {
#include "textures/segment2/segment2_cn.04E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05000[] = {
#include "textures/segment2/segment2_cn.05000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05200[] = {
#include "textures/segment2/segment2_cn.05200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05400[] = {
#include "textures/segment2/segment2_cn.05400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05600[] = {
#include "textures/segment2/segment2_cn.05600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05800[] = {
#include "textures/segment2/segment2_cn.05800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05A00[] = {
#include "textures/segment2/segment2_cn.05A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05C00[] = {
#include "textures/segment2/segment2_cn.05C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_05E00[] = {
#include "textures/segment2/segment2_cn.05E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06000[] = {
#include "textures/segment2/segment2_cn.06000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06200[] = {
#include "textures/segment2/segment2_cn.06200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06400[] = {
#include "textures/segment2/segment2_cn.06400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06600[] = {
#include "textures/segment2/segment2_cn.06600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06800[] = {
#include "textures/segment2/segment2_cn.06800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06A00[] = {
#include "textures/segment2/segment2_cn.06A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06C00[] = {
#include "textures/segment2/segment2_cn.06C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_06E00[] = {
#include "textures/segment2/segment2_cn.06E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07000[] = {
#include "textures/segment2/segment2_cn.07000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07200[] = {
#include "textures/segment2/segment2_cn.07200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07400[] = {
#include "textures/segment2/segment2_cn.07400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07600[] = {
#include "textures/segment2/segment2_cn.07600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07800[] = {
#include "textures/segment2/segment2_cn.07800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07A00[] = {
#include "textures/segment2/segment2_cn.07A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07C00[] = {
#include "textures/segment2/segment2_cn.07C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_07E00[] = {
#include "textures/segment2/segment2_cn.07E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08000[] = {
#include "textures/segment2/segment2_cn.08000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08200[] = {
#include "textures/segment2/segment2_cn.08200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08400[] = {
#include "textures/segment2/segment2_cn.08400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08600[] = {
#include "textures/segment2/segment2_cn.08600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08800[] = {
#include "textures/segment2/segment2_cn.08800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08A00[] = {
#include "textures/segment2/segment2_cn.08A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08C00[] = {
#include "textures/segment2/segment2_cn.08C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_08E00[] = {
#include "textures/segment2/segment2_cn.08E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09000[] = {
#include "textures/segment2/segment2_cn.09000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09200[] = {
#include "textures/segment2/segment2_cn.09200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09400[] = {
#include "textures/segment2/segment2_cn.09400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09600[] = {
#include "textures/segment2/segment2_cn.09600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09800[] = {
#include "textures/segment2/segment2_cn.09800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09A00[] = {
#include "textures/segment2/segment2_cn.09A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09C00[] = {
#include "textures/segment2/segment2_cn.09C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_09E00[] = {
#include "textures/segment2/segment2_cn.09E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0A000[] = {
#include "textures/segment2/segment2_cn.0A000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0A200[] = {
#include "textures/segment2/segment2_cn.0A200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0A400[] = {
#include "textures/segment2/segment2_cn.0A400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0A600[] = {
#include "textures/segment2/segment2_cn.0A600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0A800[] = {
#include "textures/segment2/segment2_cn.0A800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0AA00[] = {
#include "textures/segment2/segment2_cn.0AA00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0AC00[] = {
#include "textures/segment2/segment2_cn.0AC00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0AE00[] = {
#include "textures/segment2/segment2_cn.0AE00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0B000[] = {
#include "textures/segment2/segment2_cn.0B000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0B200[] = {
#include "textures/segment2/segment2_cn.0B200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0B400[] = {
#include "textures/segment2/segment2_cn.0B400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0B600[] = {
#include "textures/segment2/segment2_cn.0B600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0B800[] = {
#include "textures/segment2/segment2_cn.0B800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0BA00[] = {
#include "textures/segment2/segment2_cn.0BA00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0BC00[] = {
#include "textures/segment2/segment2_cn.0BC00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0BE00[] = {
#include "textures/segment2/segment2_cn.0BE00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0C000[] = {
#include "textures/segment2/segment2_cn.0C000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0C200[] = {
#include "textures/segment2/segment2_cn.0C200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0C400[] = {
#include "textures/segment2/segment2_cn.0C400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0C600[] = {
#include "textures/segment2/segment2_cn.0C600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0C800[] = {
#include "textures/segment2/segment2_cn.0C800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0CA00[] = {
#include "textures/segment2/segment2_cn.0CA00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0CC00[] = {
#include "textures/segment2/segment2_cn.0CC00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0CE00[] = {
#include "textures/segment2/segment2_cn.0CE00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0D000[] = {
#include "textures/segment2/segment2_cn.0D000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0D200[] = {
#include "textures/segment2/segment2_cn.0D200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0D400[] = {
#include "textures/segment2/segment2_cn.0D400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0D600[] = {
#include "textures/segment2/segment2_cn.0D600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0D800[] = {
#include "textures/segment2/segment2_cn.0D800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0DA00[] = {
#include "textures/segment2/segment2_cn.0DA00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0DC00[] = {
#include "textures/segment2/segment2_cn.0DC00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0DE00[] = {
#include "textures/segment2/segment2_cn.0DE00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0E000[] = {
#include "textures/segment2/segment2_cn.0E000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0E200[] = {
#include "textures/segment2/segment2_cn.0E200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0E400[] = {
#include "textures/segment2/segment2_cn.0E400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0E600[] = {
#include "textures/segment2/segment2_cn.0E600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0E800[] = {
#include "textures/segment2/segment2_cn.0E800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0EA00[] = {
#include "textures/segment2/segment2_cn.0EA00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0EC00[] = {
#include "textures/segment2/segment2_cn.0EC00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0EE00[] = {
#include "textures/segment2/segment2_cn.0EE00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0F000[] = {
#include "textures/segment2/segment2_cn.0F000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0F200[] = {
#include "textures/segment2/segment2_cn.0F200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0F400[] = {
#include "textures/segment2/segment2_cn.0F400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0F600[] = {
#include "textures/segment2/segment2_cn.0F600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0F800[] = {
#include "textures/segment2/segment2_cn.0F800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0FA00[] = {
#include "textures/segment2/segment2_cn.0FA00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0FC00[] = {
#include "textures/segment2/segment2_cn.0FC00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_0FE00[] = {
#include "textures/segment2/segment2_cn.0FE00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10000[] = {
#include "textures/segment2/segment2_cn.10000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10200[] = {
#include "textures/segment2/segment2_cn.10200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10400[] = {
#include "textures/segment2/segment2_cn.10400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10600[] = {
#include "textures/segment2/segment2_cn.10600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10800[] = {
#include "textures/segment2/segment2_cn.10800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10A00[] = {
#include "textures/segment2/segment2_cn.10A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10C00[] = {
#include "textures/segment2/segment2_cn.10C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_10E00[] = {
#include "textures/segment2/segment2_cn.10E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11000[] = {
#include "textures/segment2/segment2_cn.11000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11200[] = {
#include "textures/segment2/segment2_cn.11200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11400[] = {
#include "textures/segment2/segment2_cn.11400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11600[] = {
#include "textures/segment2/segment2_cn.11600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11800[] = {
#include "textures/segment2/segment2_cn.11800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11A00[] = {
#include "textures/segment2/segment2_cn.11A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11C00[] = {
#include "textures/segment2/segment2_cn.11C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_11E00[] = {
#include "textures/segment2/segment2_cn.11E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12000[] = {
#include "textures/segment2/segment2_cn.12000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12200[] = {
#include "textures/segment2/segment2_cn.12200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12400[] = {
#include "textures/segment2/segment2_cn.12400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12600[] = {
#include "textures/segment2/segment2_cn.12600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12800[] = {
#include "textures/segment2/segment2_cn.12800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12A00[] = {
#include "textures/segment2/segment2_cn.12A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12C00[] = {
#include "textures/segment2/segment2_cn.12C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_12E00[] = {
#include "textures/segment2/segment2_cn.12E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13000[] = {
#include "textures/segment2/segment2_cn.13000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13200[] = {
#include "textures/segment2/segment2_cn.13200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13400[] = {
#include "textures/segment2/segment2_cn.13400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13600[] = {
#include "textures/segment2/segment2_cn.13600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13800[] = {
#include "textures/segment2/segment2_cn.13800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13A00[] = {
#include "textures/segment2/segment2_cn.13A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13C00[] = {
#include "textures/segment2/segment2_cn.13C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_13E00[] = {
#include "textures/segment2/segment2_cn.13E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_cn_14000[] = {
#include "textures/segment2/segment2_cn.14000.rgba16.inc.c"
};
#endif // VERSION_CN

ALIGNED8 static const Texture texture_credits_char_3[] = {
#include "textures/segment2/segment2.06200.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_4[] = {
#include "textures/segment2/segment2.06280.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_6[] = {
#include "textures/segment2/segment2.06300.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_A[] = {
#include "textures/segment2/segment2.06380.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_B[] = {
#include "textures/segment2/segment2.06400.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_C[] = {
#include "textures/segment2/segment2.06480.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_D[] = {
#include "textures/segment2/segment2.06500.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_E[] = {
#include "textures/segment2/segment2.06580.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_F[] = {
#include "textures/segment2/segment2.06600.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_G[] = {
#include "textures/segment2/segment2.06680.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_H[] = {
#include "textures/segment2/segment2.06700.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_I[] = {
#include "textures/segment2/segment2.06780.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_J[] = {
#include "textures/segment2/segment2.06800.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_K[] = {
#include "textures/segment2/segment2.06880.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_L[] = {
#include "textures/segment2/segment2.06900.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_M[] = {
#include "textures/segment2/segment2.06980.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_N[] = {
#include "textures/segment2/segment2.06A00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_O[] = {
#include "textures/segment2/segment2.06A80.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_P[] = {
#include "textures/segment2/segment2.06B00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_Q[] = {
#include "textures/segment2/segment2.06B80.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_R[] = {
#include "textures/segment2/segment2.06C00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_S[] = {
#include "textures/segment2/segment2.06C80.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_T[] = {
#include "textures/segment2/segment2.06D00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_U[] = {
#include "textures/segment2/segment2.06D80.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_V[] = {
#include "textures/segment2/segment2.06E00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_W[] = {
#include "textures/segment2/segment2.06E80.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_X[] = {
#include "textures/segment2/segment2.06F00.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_Y[] = {
#include "textures/segment2/segment2.06F80.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_Z[] = {
#include "textures/segment2/segment2.07000.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_credits_char_period[] = {
#include "textures/segment2/segment2.07080.rgba16.inc.c"
};

// JP Small Font
#if defined(VERSION_JP) || defined(VERSION_SH)
ALIGNED8 static const Texture texture_font_char_jp_0[] = {
#include "textures/segment2/segment2.07100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_1[] = {
#include "textures/segment2/segment2.07110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_2[] = {
#include "textures/segment2/segment2.07120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_3[] = {
#include "textures/segment2/segment2.07130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_4[] = {
#include "textures/segment2/segment2.07140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_5[] = {
#include "textures/segment2/segment2.07150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_6[] = {
#include "textures/segment2/segment2.07160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_7[] = {
#include "textures/segment2/segment2.07170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_8[] = {
#include "textures/segment2/segment2.07180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_9[] = {
#include "textures/segment2/segment2.07190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_A[] = {
#include "textures/segment2/segment2.071A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_B[] = {
#include "textures/segment2/segment2.071B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_C[] = {
#include "textures/segment2/segment2.071C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_D[] = {
#include "textures/segment2/segment2.071D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_E[] = {
#include "textures/segment2/segment2.071E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_F[] = {
#include "textures/segment2/segment2.071F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_G[] = {
#include "textures/segment2/segment2.07200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_H[] = {
#include "textures/segment2/segment2.07210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_I[] = {
#include "textures/segment2/segment2.07220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_J[] = {
#include "textures/segment2/segment2.07230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_K[] = {
#include "textures/segment2/segment2.07240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_L[] = {
#include "textures/segment2/segment2.07250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_M[] = {
#include "textures/segment2/segment2.07260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_N[] = {
#include "textures/segment2/segment2.07270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_O[] = {
#include "textures/segment2/segment2.07280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_P[] = {
#include "textures/segment2/segment2.07290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_Q[] = {
#include "textures/segment2/segment2.072A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_R[] = {
#include "textures/segment2/segment2.072B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_S[] = {
#include "textures/segment2/segment2.072C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_T[] = {
#include "textures/segment2/segment2.072D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_U[] = {
#include "textures/segment2/segment2.072E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_V[] = {
#include "textures/segment2/segment2.072F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_W[] = {
#include "textures/segment2/segment2.07300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_X[] = {
#include "textures/segment2/segment2.07310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_Y[] = {
#include "textures/segment2/segment2.07320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_Z[] = {
#include "textures/segment2/segment2.07330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_long_vowel[] = {
#include "textures/segment2/segment2.07340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_exclamation[] = {
#include "textures/segment2/segment2.07350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_dakuten[] = {
#include "textures/segment2/segment2.07360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_handakuten[] = {
#include "textures/segment2/segment2.07370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_percent[] = {
#include "textures/segment2/segment2.07380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_question[] = {
#include "textures/segment2/segment2.07390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_left_right_arrow[] = {
#include "textures/segment2/segment2.073A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_open_parentheses[] = {
#include "textures/segment2/segment2.073B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_close_open_parentheses[] = {
#include "textures/segment2/segment2.073C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_close_parentheses[] = {
#include "textures/segment2/segment2.073D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_coin[] = {
#include "textures/segment2/segment2.073E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_multiply[] = {
#include "textures/segment2/segment2.073F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_star_filled[] = {
#include "textures/segment2/segment2.07400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_star_hollow[] = {
#include "textures/segment2/segment2.07410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_a[] = {
#include "textures/segment2/segment2.07420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_i[] = {
#include "textures/segment2/segment2.07430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_u[] = {
#include "textures/segment2/segment2.07440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_c[] = {
#include "textures/segment2/segment2.07450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_o[] = {
#include "textures/segment2/segment2.07460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ka[] = {
#include "textures/segment2/segment2.07470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ki[] = {
#include "textures/segment2/segment2.07480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ku[] = {
#include "textures/segment2/segment2.07490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ke[] = {
#include "textures/segment2/segment2.074A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ko[] = {
#include "textures/segment2/segment2.074B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_sa[] = {
#include "textures/segment2/segment2.074C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_shi[] = {
#include "textures/segment2/segment2.074D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_su[] = {
#include "textures/segment2/segment2.074E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_se[] = {
#include "textures/segment2/segment2.074F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_so[] = {
#include "textures/segment2/segment2.07500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ta[] = {
#include "textures/segment2/segment2.07510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_chi[] = {
#include "textures/segment2/segment2.07520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_tsu[] = {
#include "textures/segment2/segment2.07530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_te[] = {
#include "textures/segment2/segment2.07540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_to[] = {
#include "textures/segment2/segment2.07550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_na[] = {
#include "textures/segment2/segment2.07560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ni[] = {
#include "textures/segment2/segment2.07570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_nu[] = {
#include "textures/segment2/segment2.07580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ne[] = {
#include "textures/segment2/segment2.07590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_no[] = {
#include "textures/segment2/segment2.075A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ha[] = {
#include "textures/segment2/segment2.075B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_hi[] = {
#include "textures/segment2/segment2.075C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_hu[] = {
#include "textures/segment2/segment2.075D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_he[] = {
#include "textures/segment2/segment2.075E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ho[] = {
#include "textures/segment2/segment2.075F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ma[] = {
#include "textures/segment2/segment2.07600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_mi[] = {
#include "textures/segment2/segment2.07610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_mu[] = {
#include "textures/segment2/segment2.07620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_me[] = {
#include "textures/segment2/segment2.07630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_mo[] = {
#include "textures/segment2/segment2.07640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ya[] = {
#include "textures/segment2/segment2.07650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_yu[] = {
#include "textures/segment2/segment2.07660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_yo[] = {
#include "textures/segment2/segment2.07670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ra[] = {
#include "textures/segment2/segment2.07680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ri[] = {
#include "textures/segment2/segment2.07690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ru[] = {
#include "textures/segment2/segment2.076A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_re[] = {
#include "textures/segment2/segment2.076B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_ro[] = {
#include "textures/segment2/segment2.076C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_wa[] = {
#include "textures/segment2/segment2.076D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_wo[] = {
#include "textures/segment2/segment2.076E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_n[] = {
#include "textures/segment2/segment2.076F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_e[] = {
#include "textures/segment2/segment2.07700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_tsu[] = {
#include "textures/segment2/segment2.07710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_ya[] = {
#include "textures/segment2/segment2.07720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_yu[] = {
#include "textures/segment2/segment2.07730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_yo[] = {
#include "textures/segment2/segment2.07740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_a[] = {
#include "textures/segment2/segment2.07750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_i[] = {
#include "textures/segment2/segment2.07760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_o[] = {
#include "textures/segment2/segment2.07770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_hiragana_small_u[] = {
#include "textures/segment2/segment2.07780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_interpunct[] = {
#include "textures/segment2/segment2.07790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_comma[] = {
#include "textures/segment2/segment2.077A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_a[] = {
#include "textures/segment2/segment2.077B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_i[] = {
#include "textures/segment2/segment2.077C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_u[] = {
#include "textures/segment2/segment2.077D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_e[] = {
#include "textures/segment2/segment2.077E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_o[] = {
#include "textures/segment2/segment2.077F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ka[] = {
#include "textures/segment2/segment2.07800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ki[] = {
#include "textures/segment2/segment2.07810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ku[] = {
#include "textures/segment2/segment2.07820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ke[] = {
#include "textures/segment2/segment2.07830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ko[] = {
#include "textures/segment2/segment2.07840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_sa[] = {
#include "textures/segment2/segment2.07850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_shi[] = {
#include "textures/segment2/segment2.07860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_su[] = {
#include "textures/segment2/segment2.07870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_se[] = {
#include "textures/segment2/segment2.07880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_so[] = {
#include "textures/segment2/segment2.07890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ta[] = {
#include "textures/segment2/segment2.078A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_chi[] = {
#include "textures/segment2/segment2.078B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_tsu[] = {
#include "textures/segment2/segment2.078C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_te[] = {
#include "textures/segment2/segment2.078D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_to[] = {
#include "textures/segment2/segment2.078E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_na[] = {
#include "textures/segment2/segment2.078F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ni[] = {
#include "textures/segment2/segment2.07900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_nu[] = {
#include "textures/segment2/segment2.07910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ne[] = {
#include "textures/segment2/segment2.07920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_no[] = {
#include "textures/segment2/segment2.07930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ha[] = {
#include "textures/segment2/segment2.07940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_hi[] = {
#include "textures/segment2/segment2.07950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_hu[] = {
#include "textures/segment2/segment2.07960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_he[] = {
#include "textures/segment2/segment2.07970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ho[] = {
#include "textures/segment2/segment2.07980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ma[] = {
#include "textures/segment2/segment2.07990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_mi[] = {
#include "textures/segment2/segment2.079A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_mu[] = {
#include "textures/segment2/segment2.079B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_me[] = {
#include "textures/segment2/segment2.079C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_mo[] = {
#include "textures/segment2/segment2.079D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ya[] = {
#include "textures/segment2/segment2.079E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_yu[] = {
#include "textures/segment2/segment2.079F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_yo[] = {
#include "textures/segment2/segment2.07A00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ra[] = {
#include "textures/segment2/segment2.07A10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ri[] = {
#include "textures/segment2/segment2.07A20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ru[] = {
#include "textures/segment2/segment2.07A30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_re[] = {
#include "textures/segment2/segment2.07A40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_ro[] = {
#include "textures/segment2/segment2.07A50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_wa[] = {
#include "textures/segment2/segment2.07A60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_n[] = {
#include "textures/segment2/segment2.07A70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_e[] = {
#include "textures/segment2/segment2.07A80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_tsu[] = {
#include "textures/segment2/segment2.07A90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_ya[] = {
#include "textures/segment2/segment2.07AA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_yu[] = {
#include "textures/segment2/segment2.07AB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_yo[] = {
#include "textures/segment2/segment2.07AC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_a[] = {
#include "textures/segment2/segment2.07AD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_i[] = {
#include "textures/segment2/segment2.07AE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_u[] = {
#include "textures/segment2/segment2.07AF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_katakana_small_o[] = {
#include "textures/segment2/segment2.07B00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_double_quotation_open[] = {
#include "textures/segment2/segment2.07B10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_double_quotation_close[] = {
#include "textures/segment2/segment2.07B20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_wave_dash[] = {
#include "textures/segment2/segment2.07B30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_jp_ellipsis[] = {
#include "textures/segment2/segment2.07B40.ia1.inc.c"
};

// EU Small Font
#elif defined(VERSION_EU)

ALIGNED8 static const Texture texture_font_char_eu_0[] = {
#include "textures/segment2/font_graphics.05F00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_1[] = {
#include "textures/segment2/font_graphics.05F10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_2[] = {
#include "textures/segment2/font_graphics.05F20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_3[] = {
#include "textures/segment2/font_graphics.05F30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_4[] = {
#include "textures/segment2/font_graphics.05F40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_5[] = {
#include "textures/segment2/font_graphics.05F50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_6[] = {
#include "textures/segment2/font_graphics.05F60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_7[] = {
#include "textures/segment2/font_graphics.05F70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_8[] = {
#include "textures/segment2/font_graphics.05F80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_9[] = {
#include "textures/segment2/font_graphics.05F90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_A[] = {
#include "textures/segment2/font_graphics.05FA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_B[] = {
#include "textures/segment2/font_graphics.05FB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_C[] = {
#include "textures/segment2/font_graphics.05FC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_D[] = {
#include "textures/segment2/font_graphics.05FD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_E[] = {
#include "textures/segment2/font_graphics.05FE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_F[] = {
#include "textures/segment2/font_graphics.05FF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_G[] = {
#include "textures/segment2/font_graphics.06000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_H[] = {
#include "textures/segment2/font_graphics.06010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_I[] = {
#include "textures/segment2/font_graphics.06020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_J[] = {
#include "textures/segment2/font_graphics.06030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_K[] = {
#include "textures/segment2/font_graphics.06040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_L[] = {
#include "textures/segment2/font_graphics.06050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_M[] = {
#include "textures/segment2/font_graphics.06060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_N[] = {
#include "textures/segment2/font_graphics.06070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_O[] = {
#include "textures/segment2/font_graphics.06080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_P[] = {
#include "textures/segment2/font_graphics.06090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_Q[] = {
#include "textures/segment2/font_graphics.060A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_R[] = {
#include "textures/segment2/font_graphics.060B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_S[] = {
#include "textures/segment2/font_graphics.060C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_T[] = {
#include "textures/segment2/font_graphics.060D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_U[] = {
#include "textures/segment2/font_graphics.060E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_V[] = {
#include "textures/segment2/font_graphics.060F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_W[] = {
#include "textures/segment2/font_graphics.06100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_X[] = {
#include "textures/segment2/font_graphics.06110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_Y[] = {
#include "textures/segment2/font_graphics.06120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_Z[] = {
#include "textures/segment2/font_graphics.06130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_a[] = {
#include "textures/segment2/font_graphics.06140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_b[] = {
#include "textures/segment2/font_graphics.06150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_c[] = {
#include "textures/segment2/font_graphics.06160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_d[] = {
#include "textures/segment2/font_graphics.06170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_e[] = {
#include "textures/segment2/font_graphics.06180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_f[] = {
#include "textures/segment2/font_graphics.06190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_g[] = {
#include "textures/segment2/font_graphics.061A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_h[] = {
#include "textures/segment2/font_graphics.061B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_i[] = {
#include "textures/segment2/font_graphics.061C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_j[] = {
#include "textures/segment2/font_graphics.061D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_k[] = {
#include "textures/segment2/font_graphics.061E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_l[] = {
#include "textures/segment2/font_graphics.061F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_m[] = {
#include "textures/segment2/font_graphics.06200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_n[] = {
#include "textures/segment2/font_graphics.06210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_o[] = {
#include "textures/segment2/font_graphics.06220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_p[] = {
#include "textures/segment2/font_graphics.06230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_q[] = {
#include "textures/segment2/font_graphics.06240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_r[] = {
#include "textures/segment2/font_graphics.06250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_s[] = {
#include "textures/segment2/font_graphics.06260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_t[] = {
#include "textures/segment2/font_graphics.06270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_u[] = {
#include "textures/segment2/font_graphics.06280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_v[] = {
#include "textures/segment2/font_graphics.06290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_w[] = {
#include "textures/segment2/font_graphics.062A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_x[] = {
#include "textures/segment2/font_graphics.062B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_y[] = {
#include "textures/segment2/font_graphics.062C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_z[] = {
#include "textures/segment2/font_graphics.062D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_left_right_arrow[] = {
#include "textures/segment2/font_graphics.062E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_ampersand[] = {
#include "textures/segment2/font_graphics.062F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_exclamation[] = {
#include "textures/segment2/font_graphics.06300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_coin[] = {
#include "textures/segment2/font_graphics.06310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_multiply[] = {
#include "textures/segment2/font_graphics.06320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_open_parentheses[] = {
#include "textures/segment2/font_graphics.06330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_close_open_parentheses[] = {
#include "textures/segment2/font_graphics.06340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_close_parentheses[] = {
#include "textures/segment2/font_graphics.06350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_tilde[] = {
#include "textures/segment2/font_graphics.06360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_period[] = {
#include "textures/segment2/font_graphics.06370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_percent[] = {
#include "textures/segment2/font_graphics.06380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_interpunct[] = {
#include "textures/segment2/font_graphics.06390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_comma[] = {
#include "textures/segment2/font_graphics.063A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_apostrophe[] = {
#include "textures/segment2/font_graphics.063B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_question[] = {
#include "textures/segment2/font_graphics.063C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_star_filled[] = {
#include "textures/segment2/font_graphics.063D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_star_hollow[] = {
#include "textures/segment2/font_graphics.063E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_double_quote_open[] = {
#include "textures/segment2/font_graphics.063F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_double_quote_close[] = {
#include "textures/segment2/font_graphics.06400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_colon[] = {
#include "textures/segment2/font_graphics.06410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_EU_slash[] = {
#include "textures/segment2/font_graphics.06420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_A[] = {
#include "textures/segment2/font_graphics.06430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_B[] = {
#include "textures/segment2/font_graphics.06440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_C[] = {
#include "textures/segment2/font_graphics.06450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_Z[] = {
#include "textures/segment2/font_graphics.06460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_R[] = {
#include "textures/segment2/font_graphics.06470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_C_up[] = {
#include "textures/segment2/font_graphics.06480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_C_down[] = {
#include "textures/segment2/font_graphics.06490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_C_left[] = {
#include "textures/segment2/font_graphics.064A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_button_C_right[] = {
#include "textures/segment2/font_graphics.064B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_umlaut[] = {
#include "textures/segment2/font_graphics.064C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_circumflex[] = {
#include "textures/segment2/font_graphics.064D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_grave[] = {
#include "textures/segment2/font_graphics.064E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_acute[] = {
#include "textures/segment2/font_graphics.064F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_cedilla[] = {
#include "textures/segment2/font_graphics.06500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_unknown[] = {
#include "textures/segment2/font_graphics.06510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_Cedilla[] = {
#include "textures/segment2/font_graphics.06520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_eu_eszeet[] = {
#include "textures/segment2/font_graphics.06530.ia1.inc.c"
};

// US Small Font
#else
ALIGNED8 static const Texture texture_font_char_us_0[] = {
#include "textures/segment2/font_graphics.05900.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_1[] = {
#include "textures/segment2/font_graphics.05940.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_2[] = {
#include "textures/segment2/font_graphics.05980.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_3[] = {
#include "textures/segment2/font_graphics.059C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_4[] = {
#include "textures/segment2/font_graphics.05A00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_5[] = {
#include "textures/segment2/font_graphics.05A40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_6[] = {
#include "textures/segment2/font_graphics.05A80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_7[] = {
#include "textures/segment2/font_graphics.05AC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_8[] = {
#include "textures/segment2/font_graphics.05B00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_9[] = {
#include "textures/segment2/font_graphics.05B40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_A[] = {
#include "textures/segment2/font_graphics.05B80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_B[] = {
#include "textures/segment2/font_graphics.05BC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_C[] = {
#include "textures/segment2/font_graphics.05C00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_D[] = {
#include "textures/segment2/font_graphics.05C40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_E[] = {
#include "textures/segment2/font_graphics.05C80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_F[] = {
#include "textures/segment2/font_graphics.05CC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_G[] = {
#include "textures/segment2/font_graphics.05D00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_H[] = {
#include "textures/segment2/font_graphics.05D40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_I[] = {
#include "textures/segment2/font_graphics.05D80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_J[] = {
#include "textures/segment2/font_graphics.05DC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_K[] = {
#include "textures/segment2/font_graphics.05E00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_L[] = {
#include "textures/segment2/font_graphics.05E40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_M[] = {
#include "textures/segment2/font_graphics.05E80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_N[] = {
#include "textures/segment2/font_graphics.05EC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_O[] = {
#include "textures/segment2/font_graphics.05F00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_P[] = {
#include "textures/segment2/font_graphics.05F40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_Q[] = {
#include "textures/segment2/font_graphics.05F80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_R[] = {
#include "textures/segment2/font_graphics.05FC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_S[] = {
#include "textures/segment2/font_graphics.06000.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_T[] = {
#include "textures/segment2/font_graphics.06040.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_U[] = {
#include "textures/segment2/font_graphics.06080.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_V[] = {
#include "textures/segment2/font_graphics.060C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_W[] = {
#include "textures/segment2/font_graphics.06100.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_X[] = {
#include "textures/segment2/font_graphics.06140.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_Y[] = {
#include "textures/segment2/font_graphics.06180.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_Z[] = {
#include "textures/segment2/font_graphics.061C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_a[] = {
#include "textures/segment2/font_graphics.06200.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_b[] = {
#include "textures/segment2/font_graphics.06240.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_c[] = {
#include "textures/segment2/font_graphics.06280.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_d[] = {
#include "textures/segment2/font_graphics.062C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_e[] = {
#include "textures/segment2/font_graphics.06300.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_f[] = {
#include "textures/segment2/font_graphics.06340.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_g[] = {
#include "textures/segment2/font_graphics.06380.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_h[] = {
#include "textures/segment2/font_graphics.063C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_i[] = {
#include "textures/segment2/font_graphics.06400.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_j[] = {
#include "textures/segment2/font_graphics.06440.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_k[] = {
#include "textures/segment2/font_graphics.06480.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_l[] = {
#include "textures/segment2/font_graphics.064C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_m[] = {
#include "textures/segment2/font_graphics.06500.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_n[] = {
#include "textures/segment2/font_graphics.06540.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_o[] = {
#include "textures/segment2/font_graphics.06580.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_p[] = {
#include "textures/segment2/font_graphics.065C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_q[] = {
#include "textures/segment2/font_graphics.06600.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_r[] = {
#include "textures/segment2/font_graphics.06640.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_s[] = {
#include "textures/segment2/font_graphics.06680.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_t[] = {
#include "textures/segment2/font_graphics.066C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_u[] = {
#include "textures/segment2/font_graphics.06700.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_v[] = {
#include "textures/segment2/font_graphics.06740.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_w[] = {
#include "textures/segment2/font_graphics.06780.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_x[] = {
#include "textures/segment2/font_graphics.067C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_y[] = {
#include "textures/segment2/font_graphics.06800.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_z[] = {
#include "textures/segment2/font_graphics.06840.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_left_right_arrow[] = {
#include "textures/segment2/font_graphics.06880.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_exclamation[] = {
#include "textures/segment2/font_graphics.068C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_coin[] = {
#include "textures/segment2/font_graphics.06900.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_multiply[] = {
#include "textures/segment2/font_graphics.06940.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_open_parentheses[] = {
#include "textures/segment2/font_graphics.06980.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_close_open_parentheses[] = {
#include "textures/segment2/font_graphics.069C0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_close_parentheses[] = {
#include "textures/segment2/font_graphics.06A00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_tilde[] = {
#include "textures/segment2/font_graphics.06A40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_period[] = {
#include "textures/segment2/font_graphics.06A80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_percent[] = {
#include "textures/segment2/font_graphics.06AC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_interpunct[] = {
#include "textures/segment2/font_graphics.06B00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_comma[] = {
#include "textures/segment2/font_graphics.06B40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_apostrophe[] = {
#include "textures/segment2/font_graphics.06B80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_question[] = {
#include "textures/segment2/font_graphics.06BC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_star_filled[] = {
#include "textures/segment2/font_graphics.06C00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_star_hollow[] = {
#include "textures/segment2/font_graphics.06C40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_double_quote_open[] = {
#include "textures/segment2/font_graphics.06C80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_double_quote_close[] = {
#include "textures/segment2/font_graphics.06CC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_ellipsis[] = {
#include "textures/segment2/font_graphics.06D00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_slash[] = {
#include "textures/segment2/font_graphics.06D40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_ampersand[] = {
#include "textures/segment2/font_graphics.06D80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_A[] = {
#include "textures/segment2/font_graphics.06DC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_B[] = {
#include "textures/segment2/font_graphics.06E00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_C[] = {
#include "textures/segment2/font_graphics.06E40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_Z[] = {
#include "textures/segment2/font_graphics.06E80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_R[] = {
#include "textures/segment2/font_graphics.06EC0.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_C_up[] = {
#include "textures/segment2/font_graphics.06F00.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_C_down[] = {
#include "textures/segment2/font_graphics.06F40.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_C_left[] = {
#include "textures/segment2/font_graphics.06F80.ia4.inc.c"
};

ALIGNED8 static const Texture texture_font_char_us_button_C_right[] = {
#include "textures/segment2/font_graphics.06FC0.ia4.inc.c"
};
#endif

#if defined(VERSION_CN)
ALIGNED8 static const Texture texture_font_char_cn_16800[] = {
#include "textures/segment2/segment2_cn.16800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16810[] = {
#include "textures/segment2/segment2_cn.16810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16820[] = {
#include "textures/segment2/segment2_cn.16820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16830[] = {
#include "textures/segment2/segment2_cn.16830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16840[] = {
#include "textures/segment2/segment2_cn.16840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16850[] = {
#include "textures/segment2/segment2_cn.16850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16860[] = {
#include "textures/segment2/segment2_cn.16860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16870[] = {
#include "textures/segment2/segment2_cn.16870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16880[] = {
#include "textures/segment2/segment2_cn.16880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16890[] = {
#include "textures/segment2/segment2_cn.16890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_168A0[] = {
#include "textures/segment2/segment2_cn.168A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_168B0[] = {
#include "textures/segment2/segment2_cn.168B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_168C0[] = {
#include "textures/segment2/segment2_cn.168C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_168D0[] = {
#include "textures/segment2/segment2_cn.168D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_168E0[] = {
#include "textures/segment2/segment2_cn.168E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_168F0[] = {
#include "textures/segment2/segment2_cn.168F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16900[] = {
#include "textures/segment2/segment2_cn.16900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16910[] = {
#include "textures/segment2/segment2_cn.16910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16920[] = {
#include "textures/segment2/segment2_cn.16920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16930[] = {
#include "textures/segment2/segment2_cn.16930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16940[] = {
#include "textures/segment2/segment2_cn.16940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16950[] = {
#include "textures/segment2/segment2_cn.16950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16960[] = {
#include "textures/segment2/segment2_cn.16960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16970[] = {
#include "textures/segment2/segment2_cn.16970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16980[] = {
#include "textures/segment2/segment2_cn.16980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16990[] = {
#include "textures/segment2/segment2_cn.16990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_169A0[] = {
#include "textures/segment2/segment2_cn.169A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_169B0[] = {
#include "textures/segment2/segment2_cn.169B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_169C0[] = {
#include "textures/segment2/segment2_cn.169C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_169D0[] = {
#include "textures/segment2/segment2_cn.169D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_169E0[] = {
#include "textures/segment2/segment2_cn.169E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_169F0[] = {
#include "textures/segment2/segment2_cn.169F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A00[] = {
#include "textures/segment2/segment2_cn.16A00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A10[] = {
#include "textures/segment2/segment2_cn.16A10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A20[] = {
#include "textures/segment2/segment2_cn.16A20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A30[] = {
#include "textures/segment2/segment2_cn.16A30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A40[] = {
#include "textures/segment2/segment2_cn.16A40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A50[] = {
#include "textures/segment2/segment2_cn.16A50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A60[] = {
#include "textures/segment2/segment2_cn.16A60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A70[] = {
#include "textures/segment2/segment2_cn.16A70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A80[] = {
#include "textures/segment2/segment2_cn.16A80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16A90[] = {
#include "textures/segment2/segment2_cn.16A90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16AA0[] = {
#include "textures/segment2/segment2_cn.16AA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16AB0[] = {
#include "textures/segment2/segment2_cn.16AB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16AC0[] = {
#include "textures/segment2/segment2_cn.16AC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16AD0[] = {
#include "textures/segment2/segment2_cn.16AD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16AE0[] = {
#include "textures/segment2/segment2_cn.16AE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16AF0[] = {
#include "textures/segment2/segment2_cn.16AF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B00[] = {
#include "textures/segment2/segment2_cn.16B00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B10[] = {
#include "textures/segment2/segment2_cn.16B10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B20[] = {
#include "textures/segment2/segment2_cn.16B20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B30[] = {
#include "textures/segment2/segment2_cn.16B30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B40[] = {
#include "textures/segment2/segment2_cn.16B40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B50[] = {
#include "textures/segment2/segment2_cn.16B50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B60[] = {
#include "textures/segment2/segment2_cn.16B60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B70[] = {
#include "textures/segment2/segment2_cn.16B70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B80[] = {
#include "textures/segment2/segment2_cn.16B80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16B90[] = {
#include "textures/segment2/segment2_cn.16B90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16BA0[] = {
#include "textures/segment2/segment2_cn.16BA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16BB0[] = {
#include "textures/segment2/segment2_cn.16BB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16BC0[] = {
#include "textures/segment2/segment2_cn.16BC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16BD0[] = {
#include "textures/segment2/segment2_cn.16BD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16BE0[] = {
#include "textures/segment2/segment2_cn.16BE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16BF0[] = {
#include "textures/segment2/segment2_cn.16BF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C00[] = {
#include "textures/segment2/segment2_cn.16C00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C10[] = {
#include "textures/segment2/segment2_cn.16C10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C20[] = {
#include "textures/segment2/segment2_cn.16C20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C30[] = {
#include "textures/segment2/segment2_cn.16C30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C40[] = {
#include "textures/segment2/segment2_cn.16C40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C50[] = {
#include "textures/segment2/segment2_cn.16C50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C60[] = {
#include "textures/segment2/segment2_cn.16C60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C70[] = {
#include "textures/segment2/segment2_cn.16C70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C80[] = {
#include "textures/segment2/segment2_cn.16C80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16C90[] = {
#include "textures/segment2/segment2_cn.16C90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16CA0[] = {
#include "textures/segment2/segment2_cn.16CA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16CB0[] = {
#include "textures/segment2/segment2_cn.16CB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16CC0[] = {
#include "textures/segment2/segment2_cn.16CC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16CD0[] = {
#include "textures/segment2/segment2_cn.16CD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16CE0[] = {
#include "textures/segment2/segment2_cn.16CE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16CF0[] = {
#include "textures/segment2/segment2_cn.16CF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D00[] = {
#include "textures/segment2/segment2_cn.16D00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D10[] = {
#include "textures/segment2/segment2_cn.16D10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D20[] = {
#include "textures/segment2/segment2_cn.16D20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D30[] = {
#include "textures/segment2/segment2_cn.16D30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D40[] = {
#include "textures/segment2/segment2_cn.16D40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D50[] = {
#include "textures/segment2/segment2_cn.16D50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D60[] = {
#include "textures/segment2/segment2_cn.16D60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D70[] = {
#include "textures/segment2/segment2_cn.16D70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D80[] = {
#include "textures/segment2/segment2_cn.16D80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16D90[] = {
#include "textures/segment2/segment2_cn.16D90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16DA0[] = {
#include "textures/segment2/segment2_cn.16DA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16DB0[] = {
#include "textures/segment2/segment2_cn.16DB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16DC0[] = {
#include "textures/segment2/segment2_cn.16DC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16DD0[] = {
#include "textures/segment2/segment2_cn.16DD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16DE0[] = {
#include "textures/segment2/segment2_cn.16DE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16DF0[] = {
#include "textures/segment2/segment2_cn.16DF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E00[] = {
#include "textures/segment2/segment2_cn.16E00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E10[] = {
#include "textures/segment2/segment2_cn.16E10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E20[] = {
#include "textures/segment2/segment2_cn.16E20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E30[] = {
#include "textures/segment2/segment2_cn.16E30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E40[] = {
#include "textures/segment2/segment2_cn.16E40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E50[] = {
#include "textures/segment2/segment2_cn.16E50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E60[] = {
#include "textures/segment2/segment2_cn.16E60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E70[] = {
#include "textures/segment2/segment2_cn.16E70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E80[] = {
#include "textures/segment2/segment2_cn.16E80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16E90[] = {
#include "textures/segment2/segment2_cn.16E90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16EA0[] = {
#include "textures/segment2/segment2_cn.16EA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16EB0[] = {
#include "textures/segment2/segment2_cn.16EB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16EC0[] = {
#include "textures/segment2/segment2_cn.16EC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16ED0[] = {
#include "textures/segment2/segment2_cn.16ED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16EE0[] = {
#include "textures/segment2/segment2_cn.16EE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16EF0[] = {
#include "textures/segment2/segment2_cn.16EF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F00[] = {
#include "textures/segment2/segment2_cn.16F00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F10[] = {
#include "textures/segment2/segment2_cn.16F10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F20[] = {
#include "textures/segment2/segment2_cn.16F20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F30[] = {
#include "textures/segment2/segment2_cn.16F30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F40[] = {
#include "textures/segment2/segment2_cn.16F40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F50[] = {
#include "textures/segment2/segment2_cn.16F50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F60[] = {
#include "textures/segment2/segment2_cn.16F60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F70[] = {
#include "textures/segment2/segment2_cn.16F70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F80[] = {
#include "textures/segment2/segment2_cn.16F80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16F90[] = {
#include "textures/segment2/segment2_cn.16F90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16FA0[] = {
#include "textures/segment2/segment2_cn.16FA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16FB0[] = {
#include "textures/segment2/segment2_cn.16FB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16FC0[] = {
#include "textures/segment2/segment2_cn.16FC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16FD0[] = {
#include "textures/segment2/segment2_cn.16FD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16FE0[] = {
#include "textures/segment2/segment2_cn.16FE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_16FF0[] = {
#include "textures/segment2/segment2_cn.16FF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17000[] = {
#include "textures/segment2/segment2_cn.17000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17010[] = {
#include "textures/segment2/segment2_cn.17010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17020[] = {
#include "textures/segment2/segment2_cn.17020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17030[] = {
#include "textures/segment2/segment2_cn.17030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17040[] = {
#include "textures/segment2/segment2_cn.17040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17050[] = {
#include "textures/segment2/segment2_cn.17050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17060[] = {
#include "textures/segment2/segment2_cn.17060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17070[] = {
#include "textures/segment2/segment2_cn.17070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17080[] = {
#include "textures/segment2/segment2_cn.17080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17090[] = {
#include "textures/segment2/segment2_cn.17090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_170A0[] = {
#include "textures/segment2/segment2_cn.170A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_170B0[] = {
#include "textures/segment2/segment2_cn.170B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_170C0[] = {
#include "textures/segment2/segment2_cn.170C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_170D0[] = {
#include "textures/segment2/segment2_cn.170D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_170E0[] = {
#include "textures/segment2/segment2_cn.170E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_170F0[] = {
#include "textures/segment2/segment2_cn.170F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17100[] = {
#include "textures/segment2/segment2_cn.17100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17110[] = {
#include "textures/segment2/segment2_cn.17110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17120[] = {
#include "textures/segment2/segment2_cn.17120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17130[] = {
#include "textures/segment2/segment2_cn.17130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17140[] = {
#include "textures/segment2/segment2_cn.17140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17150[] = {
#include "textures/segment2/segment2_cn.17150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17160[] = {
#include "textures/segment2/segment2_cn.17160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17170[] = {
#include "textures/segment2/segment2_cn.17170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17180[] = {
#include "textures/segment2/segment2_cn.17180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17190[] = {
#include "textures/segment2/segment2_cn.17190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_171A0[] = {
#include "textures/segment2/segment2_cn.171A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_171B0[] = {
#include "textures/segment2/segment2_cn.171B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_171C0[] = {
#include "textures/segment2/segment2_cn.171C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_171D0[] = {
#include "textures/segment2/segment2_cn.171D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_171E0[] = {
#include "textures/segment2/segment2_cn.171E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_171F0[] = {
#include "textures/segment2/segment2_cn.171F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17200[] = {
#include "textures/segment2/segment2_cn.17200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17210[] = {
#include "textures/segment2/segment2_cn.17210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17220[] = {
#include "textures/segment2/segment2_cn.17220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17230[] = {
#include "textures/segment2/segment2_cn.17230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17240[] = {
#include "textures/segment2/segment2_cn.17240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17250[] = {
#include "textures/segment2/segment2_cn.17250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17260[] = {
#include "textures/segment2/segment2_cn.17260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17270[] = {
#include "textures/segment2/segment2_cn.17270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17280[] = {
#include "textures/segment2/segment2_cn.17280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17290[] = {
#include "textures/segment2/segment2_cn.17290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_172A0[] = {
#include "textures/segment2/segment2_cn.172A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_172B0[] = {
#include "textures/segment2/segment2_cn.172B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_172C0[] = {
#include "textures/segment2/segment2_cn.172C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_172D0[] = {
#include "textures/segment2/segment2_cn.172D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_172E0[] = {
#include "textures/segment2/segment2_cn.172E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_172F0[] = {
#include "textures/segment2/segment2_cn.172F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17300[] = {
#include "textures/segment2/segment2_cn.17300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17310[] = {
#include "textures/segment2/segment2_cn.17310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17320[] = {
#include "textures/segment2/segment2_cn.17320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17330[] = {
#include "textures/segment2/segment2_cn.17330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17340[] = {
#include "textures/segment2/segment2_cn.17340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17350[] = {
#include "textures/segment2/segment2_cn.17350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17360[] = {
#include "textures/segment2/segment2_cn.17360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17370[] = {
#include "textures/segment2/segment2_cn.17370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17380[] = {
#include "textures/segment2/segment2_cn.17380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17390[] = {
#include "textures/segment2/segment2_cn.17390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_173A0[] = {
#include "textures/segment2/segment2_cn.173A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_173B0[] = {
#include "textures/segment2/segment2_cn.173B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_173C0[] = {
#include "textures/segment2/segment2_cn.173C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_173D0[] = {
#include "textures/segment2/segment2_cn.173D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_173E0[] = {
#include "textures/segment2/segment2_cn.173E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_173F0[] = {
#include "textures/segment2/segment2_cn.173F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17400[] = {
#include "textures/segment2/segment2_cn.17400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17410[] = {
#include "textures/segment2/segment2_cn.17410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17420[] = {
#include "textures/segment2/segment2_cn.17420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17430[] = {
#include "textures/segment2/segment2_cn.17430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17440[] = {
#include "textures/segment2/segment2_cn.17440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17450[] = {
#include "textures/segment2/segment2_cn.17450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17460[] = {
#include "textures/segment2/segment2_cn.17460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17470[] = {
#include "textures/segment2/segment2_cn.17470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17480[] = {
#include "textures/segment2/segment2_cn.17480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17490[] = {
#include "textures/segment2/segment2_cn.17490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_174A0[] = {
#include "textures/segment2/segment2_cn.174A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_174B0[] = {
#include "textures/segment2/segment2_cn.174B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_174C0[] = {
#include "textures/segment2/segment2_cn.174C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_174D0[] = {
#include "textures/segment2/segment2_cn.174D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_174E0[] = {
#include "textures/segment2/segment2_cn.174E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_174F0[] = {
#include "textures/segment2/segment2_cn.174F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17500[] = {
#include "textures/segment2/segment2_cn.17500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17510[] = {
#include "textures/segment2/segment2_cn.17510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17520[] = {
#include "textures/segment2/segment2_cn.17520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17530[] = {
#include "textures/segment2/segment2_cn.17530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17540[] = {
#include "textures/segment2/segment2_cn.17540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17550[] = {
#include "textures/segment2/segment2_cn.17550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17560[] = {
#include "textures/segment2/segment2_cn.17560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17570[] = {
#include "textures/segment2/segment2_cn.17570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17580[] = {
#include "textures/segment2/segment2_cn.17580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17590[] = {
#include "textures/segment2/segment2_cn.17590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_175A0[] = {
#include "textures/segment2/segment2_cn.175A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_175B0[] = {
#include "textures/segment2/segment2_cn.175B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_175C0[] = {
#include "textures/segment2/segment2_cn.175C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_175D0[] = {
#include "textures/segment2/segment2_cn.175D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_175E0[] = {
#include "textures/segment2/segment2_cn.175E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_175F0[] = {
#include "textures/segment2/segment2_cn.175F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17600[] = {
#include "textures/segment2/segment2_cn.17600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17610[] = {
#include "textures/segment2/segment2_cn.17610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17620[] = {
#include "textures/segment2/segment2_cn.17620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17630[] = {
#include "textures/segment2/segment2_cn.17630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17640[] = {
#include "textures/segment2/segment2_cn.17640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17650[] = {
#include "textures/segment2/segment2_cn.17650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17660[] = {
#include "textures/segment2/segment2_cn.17660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17670[] = {
#include "textures/segment2/segment2_cn.17670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17680[] = {
#include "textures/segment2/segment2_cn.17680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17690[] = {
#include "textures/segment2/segment2_cn.17690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_176A0[] = {
#include "textures/segment2/segment2_cn.176A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_176B0[] = {
#include "textures/segment2/segment2_cn.176B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_176C0[] = {
#include "textures/segment2/segment2_cn.176C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_176D0[] = {
#include "textures/segment2/segment2_cn.176D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_176E0[] = {
#include "textures/segment2/segment2_cn.176E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_176F0[] = {
#include "textures/segment2/segment2_cn.176F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17700[] = {
#include "textures/segment2/segment2_cn.17700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17710[] = {
#include "textures/segment2/segment2_cn.17710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17720[] = {
#include "textures/segment2/segment2_cn.17720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17730[] = {
#include "textures/segment2/segment2_cn.17730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17740[] = {
#include "textures/segment2/segment2_cn.17740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17750[] = {
#include "textures/segment2/segment2_cn.17750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17760[] = {
#include "textures/segment2/segment2_cn.17760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17770[] = {
#include "textures/segment2/segment2_cn.17770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17780[] = {
#include "textures/segment2/segment2_cn.17780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17790[] = {
#include "textures/segment2/segment2_cn.17790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_177A0[] = {
#include "textures/segment2/segment2_cn.177A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_177B0[] = {
#include "textures/segment2/segment2_cn.177B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_177C0[] = {
#include "textures/segment2/segment2_cn.177C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_177D0[] = {
#include "textures/segment2/segment2_cn.177D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_177E0[] = {
#include "textures/segment2/segment2_cn.177E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_177F0[] = {
#include "textures/segment2/segment2_cn.177F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17800[] = {
#include "textures/segment2/segment2_cn.17800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17810[] = {
#include "textures/segment2/segment2_cn.17810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17820[] = {
#include "textures/segment2/segment2_cn.17820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17830[] = {
#include "textures/segment2/segment2_cn.17830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17840[] = {
#include "textures/segment2/segment2_cn.17840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17850[] = {
#include "textures/segment2/segment2_cn.17850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17860[] = {
#include "textures/segment2/segment2_cn.17860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17870[] = {
#include "textures/segment2/segment2_cn.17870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17880[] = {
#include "textures/segment2/segment2_cn.17880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17890[] = {
#include "textures/segment2/segment2_cn.17890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_178A0[] = {
#include "textures/segment2/segment2_cn.178A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_178B0[] = {
#include "textures/segment2/segment2_cn.178B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_178C0[] = {
#include "textures/segment2/segment2_cn.178C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_178D0[] = {
#include "textures/segment2/segment2_cn.178D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_178E0[] = {
#include "textures/segment2/segment2_cn.178E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_178F0[] = {
#include "textures/segment2/segment2_cn.178F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17900[] = {
#include "textures/segment2/segment2_cn.17900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17910[] = {
#include "textures/segment2/segment2_cn.17910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17920[] = {
#include "textures/segment2/segment2_cn.17920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17930[] = {
#include "textures/segment2/segment2_cn.17930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17940[] = {
#include "textures/segment2/segment2_cn.17940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17950[] = {
#include "textures/segment2/segment2_cn.17950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17960[] = {
#include "textures/segment2/segment2_cn.17960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17970[] = {
#include "textures/segment2/segment2_cn.17970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17980[] = {
#include "textures/segment2/segment2_cn.17980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17990[] = {
#include "textures/segment2/segment2_cn.17990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_179A0[] = {
#include "textures/segment2/segment2_cn.179A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_179B0[] = {
#include "textures/segment2/segment2_cn.179B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_179C0[] = {
#include "textures/segment2/segment2_cn.179C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_179D0[] = {
#include "textures/segment2/segment2_cn.179D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_179E0[] = {
#include "textures/segment2/segment2_cn.179E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_179F0[] = {
#include "textures/segment2/segment2_cn.179F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A00[] = {
#include "textures/segment2/segment2_cn.17A00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A10[] = {
#include "textures/segment2/segment2_cn.17A10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A20[] = {
#include "textures/segment2/segment2_cn.17A20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A30[] = {
#include "textures/segment2/segment2_cn.17A30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A40[] = {
#include "textures/segment2/segment2_cn.17A40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A50[] = {
#include "textures/segment2/segment2_cn.17A50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A60[] = {
#include "textures/segment2/segment2_cn.17A60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A70[] = {
#include "textures/segment2/segment2_cn.17A70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A80[] = {
#include "textures/segment2/segment2_cn.17A80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17A90[] = {
#include "textures/segment2/segment2_cn.17A90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17AA0[] = {
#include "textures/segment2/segment2_cn.17AA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17AB0[] = {
#include "textures/segment2/segment2_cn.17AB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17AC0[] = {
#include "textures/segment2/segment2_cn.17AC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17AD0[] = {
#include "textures/segment2/segment2_cn.17AD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17AE0[] = {
#include "textures/segment2/segment2_cn.17AE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17AF0[] = {
#include "textures/segment2/segment2_cn.17AF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B00[] = {
#include "textures/segment2/segment2_cn.17B00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B10[] = {
#include "textures/segment2/segment2_cn.17B10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B20[] = {
#include "textures/segment2/segment2_cn.17B20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B30[] = {
#include "textures/segment2/segment2_cn.17B30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B40[] = {
#include "textures/segment2/segment2_cn.17B40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B50[] = {
#include "textures/segment2/segment2_cn.17B50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B60[] = {
#include "textures/segment2/segment2_cn.17B60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B70[] = {
#include "textures/segment2/segment2_cn.17B70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B80[] = {
#include "textures/segment2/segment2_cn.17B80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17B90[] = {
#include "textures/segment2/segment2_cn.17B90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17BA0[] = {
#include "textures/segment2/segment2_cn.17BA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17BB0[] = {
#include "textures/segment2/segment2_cn.17BB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17BC0[] = {
#include "textures/segment2/segment2_cn.17BC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17BD0[] = {
#include "textures/segment2/segment2_cn.17BD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17BE0[] = {
#include "textures/segment2/segment2_cn.17BE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17BF0[] = {
#include "textures/segment2/segment2_cn.17BF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C00[] = {
#include "textures/segment2/segment2_cn.17C00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C10[] = {
#include "textures/segment2/segment2_cn.17C10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C20[] = {
#include "textures/segment2/segment2_cn.17C20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C30[] = {
#include "textures/segment2/segment2_cn.17C30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C40[] = {
#include "textures/segment2/segment2_cn.17C40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C50[] = {
#include "textures/segment2/segment2_cn.17C50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C60[] = {
#include "textures/segment2/segment2_cn.17C60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C70[] = {
#include "textures/segment2/segment2_cn.17C70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C80[] = {
#include "textures/segment2/segment2_cn.17C80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17C90[] = {
#include "textures/segment2/segment2_cn.17C90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17CA0[] = {
#include "textures/segment2/segment2_cn.17CA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17CB0[] = {
#include "textures/segment2/segment2_cn.17CB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17CC0[] = {
#include "textures/segment2/segment2_cn.17CC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17CD0[] = {
#include "textures/segment2/segment2_cn.17CD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17CE0[] = {
#include "textures/segment2/segment2_cn.17CE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17CF0[] = {
#include "textures/segment2/segment2_cn.17CF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D00[] = {
#include "textures/segment2/segment2_cn.17D00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D10[] = {
#include "textures/segment2/segment2_cn.17D10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D20[] = {
#include "textures/segment2/segment2_cn.17D20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D30[] = {
#include "textures/segment2/segment2_cn.17D30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D40[] = {
#include "textures/segment2/segment2_cn.17D40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D50[] = {
#include "textures/segment2/segment2_cn.17D50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D60[] = {
#include "textures/segment2/segment2_cn.17D60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D70[] = {
#include "textures/segment2/segment2_cn.17D70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D80[] = {
#include "textures/segment2/segment2_cn.17D80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17D90[] = {
#include "textures/segment2/segment2_cn.17D90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17DA0[] = {
#include "textures/segment2/segment2_cn.17DA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17DB0[] = {
#include "textures/segment2/segment2_cn.17DB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17DC0[] = {
#include "textures/segment2/segment2_cn.17DC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17DD0[] = {
#include "textures/segment2/segment2_cn.17DD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17DE0[] = {
#include "textures/segment2/segment2_cn.17DE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17DF0[] = {
#include "textures/segment2/segment2_cn.17DF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E00[] = {
#include "textures/segment2/segment2_cn.17E00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E10[] = {
#include "textures/segment2/segment2_cn.17E10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E20[] = {
#include "textures/segment2/segment2_cn.17E20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E30[] = {
#include "textures/segment2/segment2_cn.17E30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E40[] = {
#include "textures/segment2/segment2_cn.17E40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E50[] = {
#include "textures/segment2/segment2_cn.17E50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E60[] = {
#include "textures/segment2/segment2_cn.17E60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E70[] = {
#include "textures/segment2/segment2_cn.17E70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E80[] = {
#include "textures/segment2/segment2_cn.17E80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17E90[] = {
#include "textures/segment2/segment2_cn.17E90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17EA0[] = {
#include "textures/segment2/segment2_cn.17EA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17EB0[] = {
#include "textures/segment2/segment2_cn.17EB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17EC0[] = {
#include "textures/segment2/segment2_cn.17EC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17ED0[] = {
#include "textures/segment2/segment2_cn.17ED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17EE0[] = {
#include "textures/segment2/segment2_cn.17EE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17EF0[] = {
#include "textures/segment2/segment2_cn.17EF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F00[] = {
#include "textures/segment2/segment2_cn.17F00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F10[] = {
#include "textures/segment2/segment2_cn.17F10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F20[] = {
#include "textures/segment2/segment2_cn.17F20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F30[] = {
#include "textures/segment2/segment2_cn.17F30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F40[] = {
#include "textures/segment2/segment2_cn.17F40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F50[] = {
#include "textures/segment2/segment2_cn.17F50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F60[] = {
#include "textures/segment2/segment2_cn.17F60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F70[] = {
#include "textures/segment2/segment2_cn.17F70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F80[] = {
#include "textures/segment2/segment2_cn.17F80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17F90[] = {
#include "textures/segment2/segment2_cn.17F90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17FA0[] = {
#include "textures/segment2/segment2_cn.17FA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17FB0[] = {
#include "textures/segment2/segment2_cn.17FB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17FC0[] = {
#include "textures/segment2/segment2_cn.17FC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17FD0[] = {
#include "textures/segment2/segment2_cn.17FD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17FE0[] = {
#include "textures/segment2/segment2_cn.17FE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_17FF0[] = {
#include "textures/segment2/segment2_cn.17FF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18000[] = {
#include "textures/segment2/segment2_cn.18000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18010[] = {
#include "textures/segment2/segment2_cn.18010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18020[] = {
#include "textures/segment2/segment2_cn.18020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18030[] = {
#include "textures/segment2/segment2_cn.18030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18040[] = {
#include "textures/segment2/segment2_cn.18040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18050[] = {
#include "textures/segment2/segment2_cn.18050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18060[] = {
#include "textures/segment2/segment2_cn.18060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18070[] = {
#include "textures/segment2/segment2_cn.18070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18080[] = {
#include "textures/segment2/segment2_cn.18080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18090[] = {
#include "textures/segment2/segment2_cn.18090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_180A0[] = {
#include "textures/segment2/segment2_cn.180A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_180B0[] = {
#include "textures/segment2/segment2_cn.180B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_180C0[] = {
#include "textures/segment2/segment2_cn.180C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_180D0[] = {
#include "textures/segment2/segment2_cn.180D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_180E0[] = {
#include "textures/segment2/segment2_cn.180E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_180F0[] = {
#include "textures/segment2/segment2_cn.180F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18100[] = {
#include "textures/segment2/segment2_cn.18100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18110[] = {
#include "textures/segment2/segment2_cn.18110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18120[] = {
#include "textures/segment2/segment2_cn.18120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18130[] = {
#include "textures/segment2/segment2_cn.18130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18140[] = {
#include "textures/segment2/segment2_cn.18140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18150[] = {
#include "textures/segment2/segment2_cn.18150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18160[] = {
#include "textures/segment2/segment2_cn.18160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18170[] = {
#include "textures/segment2/segment2_cn.18170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18180[] = {
#include "textures/segment2/segment2_cn.18180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18190[] = {
#include "textures/segment2/segment2_cn.18190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_181A0[] = {
#include "textures/segment2/segment2_cn.181A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_181B0[] = {
#include "textures/segment2/segment2_cn.181B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_181C0[] = {
#include "textures/segment2/segment2_cn.181C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_181D0[] = {
#include "textures/segment2/segment2_cn.181D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_181E0[] = {
#include "textures/segment2/segment2_cn.181E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_181F0[] = {
#include "textures/segment2/segment2_cn.181F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18200[] = {
#include "textures/segment2/segment2_cn.18200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18210[] = {
#include "textures/segment2/segment2_cn.18210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18220[] = {
#include "textures/segment2/segment2_cn.18220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18230[] = {
#include "textures/segment2/segment2_cn.18230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18240[] = {
#include "textures/segment2/segment2_cn.18240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18250[] = {
#include "textures/segment2/segment2_cn.18250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18260[] = {
#include "textures/segment2/segment2_cn.18260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18270[] = {
#include "textures/segment2/segment2_cn.18270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18280[] = {
#include "textures/segment2/segment2_cn.18280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18290[] = {
#include "textures/segment2/segment2_cn.18290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_182A0[] = {
#include "textures/segment2/segment2_cn.182A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_182B0[] = {
#include "textures/segment2/segment2_cn.182B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_182C0[] = {
#include "textures/segment2/segment2_cn.182C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_182D0[] = {
#include "textures/segment2/segment2_cn.182D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_182E0[] = {
#include "textures/segment2/segment2_cn.182E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_182F0[] = {
#include "textures/segment2/segment2_cn.182F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18300[] = {
#include "textures/segment2/segment2_cn.18300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18310[] = {
#include "textures/segment2/segment2_cn.18310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18320[] = {
#include "textures/segment2/segment2_cn.18320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18330[] = {
#include "textures/segment2/segment2_cn.18330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18340[] = {
#include "textures/segment2/segment2_cn.18340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18350[] = {
#include "textures/segment2/segment2_cn.18350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18360[] = {
#include "textures/segment2/segment2_cn.18360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18370[] = {
#include "textures/segment2/segment2_cn.18370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18380[] = {
#include "textures/segment2/segment2_cn.18380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18390[] = {
#include "textures/segment2/segment2_cn.18390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_183A0[] = {
#include "textures/segment2/segment2_cn.183A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_183B0[] = {
#include "textures/segment2/segment2_cn.183B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_183C0[] = {
#include "textures/segment2/segment2_cn.183C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_183D0[] = {
#include "textures/segment2/segment2_cn.183D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_183E0[] = {
#include "textures/segment2/segment2_cn.183E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_183F0[] = {
#include "textures/segment2/segment2_cn.183F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18400[] = {
#include "textures/segment2/segment2_cn.18400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18410[] = {
#include "textures/segment2/segment2_cn.18410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18420[] = {
#include "textures/segment2/segment2_cn.18420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18430[] = {
#include "textures/segment2/segment2_cn.18430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18440[] = {
#include "textures/segment2/segment2_cn.18440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18450[] = {
#include "textures/segment2/segment2_cn.18450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18460[] = {
#include "textures/segment2/segment2_cn.18460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18470[] = {
#include "textures/segment2/segment2_cn.18470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18480[] = {
#include "textures/segment2/segment2_cn.18480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18490[] = {
#include "textures/segment2/segment2_cn.18490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_184A0[] = {
#include "textures/segment2/segment2_cn.184A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_184B0[] = {
#include "textures/segment2/segment2_cn.184B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_184C0[] = {
#include "textures/segment2/segment2_cn.184C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_184D0[] = {
#include "textures/segment2/segment2_cn.184D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_184E0[] = {
#include "textures/segment2/segment2_cn.184E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_184F0[] = {
#include "textures/segment2/segment2_cn.184F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18500[] = {
#include "textures/segment2/segment2_cn.18500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18510[] = {
#include "textures/segment2/segment2_cn.18510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18520[] = {
#include "textures/segment2/segment2_cn.18520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18530[] = {
#include "textures/segment2/segment2_cn.18530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18540[] = {
#include "textures/segment2/segment2_cn.18540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18550[] = {
#include "textures/segment2/segment2_cn.18550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18560[] = {
#include "textures/segment2/segment2_cn.18560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18570[] = {
#include "textures/segment2/segment2_cn.18570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18580[] = {
#include "textures/segment2/segment2_cn.18580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18590[] = {
#include "textures/segment2/segment2_cn.18590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_185A0[] = {
#include "textures/segment2/segment2_cn.185A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_185B0[] = {
#include "textures/segment2/segment2_cn.185B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_185C0[] = {
#include "textures/segment2/segment2_cn.185C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_185D0[] = {
#include "textures/segment2/segment2_cn.185D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_185E0[] = {
#include "textures/segment2/segment2_cn.185E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_185F0[] = {
#include "textures/segment2/segment2_cn.185F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18600[] = {
#include "textures/segment2/segment2_cn.18600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18610[] = {
#include "textures/segment2/segment2_cn.18610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18620[] = {
#include "textures/segment2/segment2_cn.18620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18630[] = {
#include "textures/segment2/segment2_cn.18630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18640[] = {
#include "textures/segment2/segment2_cn.18640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18650[] = {
#include "textures/segment2/segment2_cn.18650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18660[] = {
#include "textures/segment2/segment2_cn.18660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18670[] = {
#include "textures/segment2/segment2_cn.18670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18680[] = {
#include "textures/segment2/segment2_cn.18680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18690[] = {
#include "textures/segment2/segment2_cn.18690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_186A0[] = {
#include "textures/segment2/segment2_cn.186A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_186B0[] = {
#include "textures/segment2/segment2_cn.186B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_186C0[] = {
#include "textures/segment2/segment2_cn.186C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_186D0[] = {
#include "textures/segment2/segment2_cn.186D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_186E0[] = {
#include "textures/segment2/segment2_cn.186E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_186F0[] = {
#include "textures/segment2/segment2_cn.186F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18700[] = {
#include "textures/segment2/segment2_cn.18700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18710[] = {
#include "textures/segment2/segment2_cn.18710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18720[] = {
#include "textures/segment2/segment2_cn.18720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18730[] = {
#include "textures/segment2/segment2_cn.18730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18740[] = {
#include "textures/segment2/segment2_cn.18740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18750[] = {
#include "textures/segment2/segment2_cn.18750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18760[] = {
#include "textures/segment2/segment2_cn.18760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18770[] = {
#include "textures/segment2/segment2_cn.18770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18780[] = {
#include "textures/segment2/segment2_cn.18780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18790[] = {
#include "textures/segment2/segment2_cn.18790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_187A0[] = {
#include "textures/segment2/segment2_cn.187A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_187B0[] = {
#include "textures/segment2/segment2_cn.187B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_187C0[] = {
#include "textures/segment2/segment2_cn.187C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_187D0[] = {
#include "textures/segment2/segment2_cn.187D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_187E0[] = {
#include "textures/segment2/segment2_cn.187E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_187F0[] = {
#include "textures/segment2/segment2_cn.187F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18800[] = {
#include "textures/segment2/segment2_cn.18800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18810[] = {
#include "textures/segment2/segment2_cn.18810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18820[] = {
#include "textures/segment2/segment2_cn.18820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18830[] = {
#include "textures/segment2/segment2_cn.18830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18840[] = {
#include "textures/segment2/segment2_cn.18840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18850[] = {
#include "textures/segment2/segment2_cn.18850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18860[] = {
#include "textures/segment2/segment2_cn.18860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18870[] = {
#include "textures/segment2/segment2_cn.18870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18880[] = {
#include "textures/segment2/segment2_cn.18880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18890[] = {
#include "textures/segment2/segment2_cn.18890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_188A0[] = {
#include "textures/segment2/segment2_cn.188A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_188B0[] = {
#include "textures/segment2/segment2_cn.188B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_188C0[] = {
#include "textures/segment2/segment2_cn.188C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_188D0[] = {
#include "textures/segment2/segment2_cn.188D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_188E0[] = {
#include "textures/segment2/segment2_cn.188E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_188F0[] = {
#include "textures/segment2/segment2_cn.188F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18900[] = {
#include "textures/segment2/segment2_cn.18900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18910[] = {
#include "textures/segment2/segment2_cn.18910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18920[] = {
#include "textures/segment2/segment2_cn.18920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18930[] = {
#include "textures/segment2/segment2_cn.18930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18940[] = {
#include "textures/segment2/segment2_cn.18940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18950[] = {
#include "textures/segment2/segment2_cn.18950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18960[] = {
#include "textures/segment2/segment2_cn.18960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18970[] = {
#include "textures/segment2/segment2_cn.18970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18980[] = {
#include "textures/segment2/segment2_cn.18980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18990[] = {
#include "textures/segment2/segment2_cn.18990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_189A0[] = {
#include "textures/segment2/segment2_cn.189A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_189B0[] = {
#include "textures/segment2/segment2_cn.189B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_189C0[] = {
#include "textures/segment2/segment2_cn.189C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_189D0[] = {
#include "textures/segment2/segment2_cn.189D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_189E0[] = {
#include "textures/segment2/segment2_cn.189E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_189F0[] = {
#include "textures/segment2/segment2_cn.189F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A00[] = {
#include "textures/segment2/segment2_cn.18A00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A10[] = {
#include "textures/segment2/segment2_cn.18A10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A20[] = {
#include "textures/segment2/segment2_cn.18A20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A30[] = {
#include "textures/segment2/segment2_cn.18A30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A40[] = {
#include "textures/segment2/segment2_cn.18A40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A50[] = {
#include "textures/segment2/segment2_cn.18A50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A60[] = {
#include "textures/segment2/segment2_cn.18A60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A70[] = {
#include "textures/segment2/segment2_cn.18A70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A80[] = {
#include "textures/segment2/segment2_cn.18A80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18A90[] = {
#include "textures/segment2/segment2_cn.18A90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18AA0[] = {
#include "textures/segment2/segment2_cn.18AA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18AB0[] = {
#include "textures/segment2/segment2_cn.18AB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18AC0[] = {
#include "textures/segment2/segment2_cn.18AC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18AD0[] = {
#include "textures/segment2/segment2_cn.18AD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18AE0[] = {
#include "textures/segment2/segment2_cn.18AE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18AF0[] = {
#include "textures/segment2/segment2_cn.18AF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B00[] = {
#include "textures/segment2/segment2_cn.18B00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B10[] = {
#include "textures/segment2/segment2_cn.18B10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B20[] = {
#include "textures/segment2/segment2_cn.18B20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B30[] = {
#include "textures/segment2/segment2_cn.18B30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B40[] = {
#include "textures/segment2/segment2_cn.18B40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B50[] = {
#include "textures/segment2/segment2_cn.18B50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B60[] = {
#include "textures/segment2/segment2_cn.18B60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B70[] = {
#include "textures/segment2/segment2_cn.18B70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B80[] = {
#include "textures/segment2/segment2_cn.18B80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18B90[] = {
#include "textures/segment2/segment2_cn.18B90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18BA0[] = {
#include "textures/segment2/segment2_cn.18BA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18BB0[] = {
#include "textures/segment2/segment2_cn.18BB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18BC0[] = {
#include "textures/segment2/segment2_cn.18BC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18BD0[] = {
#include "textures/segment2/segment2_cn.18BD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18BE0[] = {
#include "textures/segment2/segment2_cn.18BE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18BF0[] = {
#include "textures/segment2/segment2_cn.18BF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C00[] = {
#include "textures/segment2/segment2_cn.18C00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C10[] = {
#include "textures/segment2/segment2_cn.18C10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C20[] = {
#include "textures/segment2/segment2_cn.18C20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C30[] = {
#include "textures/segment2/segment2_cn.18C30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C40[] = {
#include "textures/segment2/segment2_cn.18C40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C50[] = {
#include "textures/segment2/segment2_cn.18C50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C60[] = {
#include "textures/segment2/segment2_cn.18C60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C70[] = {
#include "textures/segment2/segment2_cn.18C70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C80[] = {
#include "textures/segment2/segment2_cn.18C80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18C90[] = {
#include "textures/segment2/segment2_cn.18C90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18CA0[] = {
#include "textures/segment2/segment2_cn.18CA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18CB0[] = {
#include "textures/segment2/segment2_cn.18CB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18CC0[] = {
#include "textures/segment2/segment2_cn.18CC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18CD0[] = {
#include "textures/segment2/segment2_cn.18CD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18CE0[] = {
#include "textures/segment2/segment2_cn.18CE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18CF0[] = {
#include "textures/segment2/segment2_cn.18CF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D00[] = {
#include "textures/segment2/segment2_cn.18D00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D10[] = {
#include "textures/segment2/segment2_cn.18D10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D20[] = {
#include "textures/segment2/segment2_cn.18D20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D30[] = {
#include "textures/segment2/segment2_cn.18D30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D40[] = {
#include "textures/segment2/segment2_cn.18D40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D50[] = {
#include "textures/segment2/segment2_cn.18D50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D60[] = {
#include "textures/segment2/segment2_cn.18D60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D70[] = {
#include "textures/segment2/segment2_cn.18D70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D80[] = {
#include "textures/segment2/segment2_cn.18D80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18D90[] = {
#include "textures/segment2/segment2_cn.18D90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18DA0[] = {
#include "textures/segment2/segment2_cn.18DA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18DB0[] = {
#include "textures/segment2/segment2_cn.18DB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18DC0[] = {
#include "textures/segment2/segment2_cn.18DC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18DD0[] = {
#include "textures/segment2/segment2_cn.18DD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18DE0[] = {
#include "textures/segment2/segment2_cn.18DE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18DF0[] = {
#include "textures/segment2/segment2_cn.18DF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E00[] = {
#include "textures/segment2/segment2_cn.18E00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E10[] = {
#include "textures/segment2/segment2_cn.18E10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E20[] = {
#include "textures/segment2/segment2_cn.18E20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E30[] = {
#include "textures/segment2/segment2_cn.18E30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E40[] = {
#include "textures/segment2/segment2_cn.18E40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E50[] = {
#include "textures/segment2/segment2_cn.18E50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E60[] = {
#include "textures/segment2/segment2_cn.18E60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E70[] = {
#include "textures/segment2/segment2_cn.18E70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E80[] = {
#include "textures/segment2/segment2_cn.18E80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18E90[] = {
#include "textures/segment2/segment2_cn.18E90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18EA0[] = {
#include "textures/segment2/segment2_cn.18EA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18EB0[] = {
#include "textures/segment2/segment2_cn.18EB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18EC0[] = {
#include "textures/segment2/segment2_cn.18EC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18ED0[] = {
#include "textures/segment2/segment2_cn.18ED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18EE0[] = {
#include "textures/segment2/segment2_cn.18EE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18EF0[] = {
#include "textures/segment2/segment2_cn.18EF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F00[] = {
#include "textures/segment2/segment2_cn.18F00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F10[] = {
#include "textures/segment2/segment2_cn.18F10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F20[] = {
#include "textures/segment2/segment2_cn.18F20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F30[] = {
#include "textures/segment2/segment2_cn.18F30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F40[] = {
#include "textures/segment2/segment2_cn.18F40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F50[] = {
#include "textures/segment2/segment2_cn.18F50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F60[] = {
#include "textures/segment2/segment2_cn.18F60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F70[] = {
#include "textures/segment2/segment2_cn.18F70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F80[] = {
#include "textures/segment2/segment2_cn.18F80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18F90[] = {
#include "textures/segment2/segment2_cn.18F90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18FA0[] = {
#include "textures/segment2/segment2_cn.18FA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18FB0[] = {
#include "textures/segment2/segment2_cn.18FB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18FC0[] = {
#include "textures/segment2/segment2_cn.18FC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18FD0[] = {
#include "textures/segment2/segment2_cn.18FD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18FE0[] = {
#include "textures/segment2/segment2_cn.18FE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_18FF0[] = {
#include "textures/segment2/segment2_cn.18FF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19000[] = {
#include "textures/segment2/segment2_cn.19000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19010[] = {
#include "textures/segment2/segment2_cn.19010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19020[] = {
#include "textures/segment2/segment2_cn.19020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19030[] = {
#include "textures/segment2/segment2_cn.19030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19040[] = {
#include "textures/segment2/segment2_cn.19040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19050[] = {
#include "textures/segment2/segment2_cn.19050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19060[] = {
#include "textures/segment2/segment2_cn.19060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19070[] = {
#include "textures/segment2/segment2_cn.19070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19080[] = {
#include "textures/segment2/segment2_cn.19080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19090[] = {
#include "textures/segment2/segment2_cn.19090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_190A0[] = {
#include "textures/segment2/segment2_cn.190A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_190B0[] = {
#include "textures/segment2/segment2_cn.190B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_190C0[] = {
#include "textures/segment2/segment2_cn.190C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_190D0[] = {
#include "textures/segment2/segment2_cn.190D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_190E0[] = {
#include "textures/segment2/segment2_cn.190E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_190F0[] = {
#include "textures/segment2/segment2_cn.190F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19100[] = {
#include "textures/segment2/segment2_cn.19100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19110[] = {
#include "textures/segment2/segment2_cn.19110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19120[] = {
#include "textures/segment2/segment2_cn.19120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19130[] = {
#include "textures/segment2/segment2_cn.19130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19140[] = {
#include "textures/segment2/segment2_cn.19140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19150[] = {
#include "textures/segment2/segment2_cn.19150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19160[] = {
#include "textures/segment2/segment2_cn.19160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19170[] = {
#include "textures/segment2/segment2_cn.19170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19180[] = {
#include "textures/segment2/segment2_cn.19180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19190[] = {
#include "textures/segment2/segment2_cn.19190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_191A0[] = {
#include "textures/segment2/segment2_cn.191A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_191B0[] = {
#include "textures/segment2/segment2_cn.191B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_191C0[] = {
#include "textures/segment2/segment2_cn.191C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_191D0[] = {
#include "textures/segment2/segment2_cn.191D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_191E0[] = {
#include "textures/segment2/segment2_cn.191E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_191F0[] = {
#include "textures/segment2/segment2_cn.191F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19200[] = {
#include "textures/segment2/segment2_cn.19200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19210[] = {
#include "textures/segment2/segment2_cn.19210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19220[] = {
#include "textures/segment2/segment2_cn.19220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19230[] = {
#include "textures/segment2/segment2_cn.19230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19240[] = {
#include "textures/segment2/segment2_cn.19240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19250[] = {
#include "textures/segment2/segment2_cn.19250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19260[] = {
#include "textures/segment2/segment2_cn.19260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19270[] = {
#include "textures/segment2/segment2_cn.19270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19280[] = {
#include "textures/segment2/segment2_cn.19280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19290[] = {
#include "textures/segment2/segment2_cn.19290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_192A0[] = {
#include "textures/segment2/segment2_cn.192A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_192B0[] = {
#include "textures/segment2/segment2_cn.192B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_192C0[] = {
#include "textures/segment2/segment2_cn.192C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_192D0[] = {
#include "textures/segment2/segment2_cn.192D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_192E0[] = {
#include "textures/segment2/segment2_cn.192E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_192F0[] = {
#include "textures/segment2/segment2_cn.192F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19300[] = {
#include "textures/segment2/segment2_cn.19300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19310[] = {
#include "textures/segment2/segment2_cn.19310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19320[] = {
#include "textures/segment2/segment2_cn.19320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19330[] = {
#include "textures/segment2/segment2_cn.19330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19340[] = {
#include "textures/segment2/segment2_cn.19340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19350[] = {
#include "textures/segment2/segment2_cn.19350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19360[] = {
#include "textures/segment2/segment2_cn.19360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19370[] = {
#include "textures/segment2/segment2_cn.19370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19380[] = {
#include "textures/segment2/segment2_cn.19380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19390[] = {
#include "textures/segment2/segment2_cn.19390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_193A0[] = {
#include "textures/segment2/segment2_cn.193A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_193B0[] = {
#include "textures/segment2/segment2_cn.193B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_193C0[] = {
#include "textures/segment2/segment2_cn.193C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_193D0[] = {
#include "textures/segment2/segment2_cn.193D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_193E0[] = {
#include "textures/segment2/segment2_cn.193E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_193F0[] = {
#include "textures/segment2/segment2_cn.193F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19400[] = {
#include "textures/segment2/segment2_cn.19400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19410[] = {
#include "textures/segment2/segment2_cn.19410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19420[] = {
#include "textures/segment2/segment2_cn.19420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19430[] = {
#include "textures/segment2/segment2_cn.19430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19440[] = {
#include "textures/segment2/segment2_cn.19440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19450[] = {
#include "textures/segment2/segment2_cn.19450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19460[] = {
#include "textures/segment2/segment2_cn.19460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19470[] = {
#include "textures/segment2/segment2_cn.19470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19480[] = {
#include "textures/segment2/segment2_cn.19480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19490[] = {
#include "textures/segment2/segment2_cn.19490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_194A0[] = {
#include "textures/segment2/segment2_cn.194A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_194B0[] = {
#include "textures/segment2/segment2_cn.194B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_194C0[] = {
#include "textures/segment2/segment2_cn.194C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_194D0[] = {
#include "textures/segment2/segment2_cn.194D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_194E0[] = {
#include "textures/segment2/segment2_cn.194E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_194F0[] = {
#include "textures/segment2/segment2_cn.194F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19500[] = {
#include "textures/segment2/segment2_cn.19500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19510[] = {
#include "textures/segment2/segment2_cn.19510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19520[] = {
#include "textures/segment2/segment2_cn.19520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19530[] = {
#include "textures/segment2/segment2_cn.19530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19540[] = {
#include "textures/segment2/segment2_cn.19540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19550[] = {
#include "textures/segment2/segment2_cn.19550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19560[] = {
#include "textures/segment2/segment2_cn.19560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19570[] = {
#include "textures/segment2/segment2_cn.19570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19580[] = {
#include "textures/segment2/segment2_cn.19580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19590[] = {
#include "textures/segment2/segment2_cn.19590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_195A0[] = {
#include "textures/segment2/segment2_cn.195A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_195B0[] = {
#include "textures/segment2/segment2_cn.195B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_195C0[] = {
#include "textures/segment2/segment2_cn.195C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_195D0[] = {
#include "textures/segment2/segment2_cn.195D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_195E0[] = {
#include "textures/segment2/segment2_cn.195E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_195F0[] = {
#include "textures/segment2/segment2_cn.195F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19600[] = {
#include "textures/segment2/segment2_cn.19600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19610[] = {
#include "textures/segment2/segment2_cn.19610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19620[] = {
#include "textures/segment2/segment2_cn.19620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19630[] = {
#include "textures/segment2/segment2_cn.19630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19640[] = {
#include "textures/segment2/segment2_cn.19640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19650[] = {
#include "textures/segment2/segment2_cn.19650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19660[] = {
#include "textures/segment2/segment2_cn.19660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19670[] = {
#include "textures/segment2/segment2_cn.19670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19680[] = {
#include "textures/segment2/segment2_cn.19680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19690[] = {
#include "textures/segment2/segment2_cn.19690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_196A0[] = {
#include "textures/segment2/segment2_cn.196A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_196B0[] = {
#include "textures/segment2/segment2_cn.196B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_196C0[] = {
#include "textures/segment2/segment2_cn.196C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_196D0[] = {
#include "textures/segment2/segment2_cn.196D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_196E0[] = {
#include "textures/segment2/segment2_cn.196E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_196F0[] = {
#include "textures/segment2/segment2_cn.196F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19700[] = {
#include "textures/segment2/segment2_cn.19700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19710[] = {
#include "textures/segment2/segment2_cn.19710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19720[] = {
#include "textures/segment2/segment2_cn.19720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19730[] = {
#include "textures/segment2/segment2_cn.19730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19740[] = {
#include "textures/segment2/segment2_cn.19740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19750[] = {
#include "textures/segment2/segment2_cn.19750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19760[] = {
#include "textures/segment2/segment2_cn.19760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19770[] = {
#include "textures/segment2/segment2_cn.19770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19780[] = {
#include "textures/segment2/segment2_cn.19780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19790[] = {
#include "textures/segment2/segment2_cn.19790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_197A0[] = {
#include "textures/segment2/segment2_cn.197A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_197B0[] = {
#include "textures/segment2/segment2_cn.197B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_197C0[] = {
#include "textures/segment2/segment2_cn.197C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_197D0[] = {
#include "textures/segment2/segment2_cn.197D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_197E0[] = {
#include "textures/segment2/segment2_cn.197E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_197F0[] = {
#include "textures/segment2/segment2_cn.197F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19800[] = {
#include "textures/segment2/segment2_cn.19800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19810[] = {
#include "textures/segment2/segment2_cn.19810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19820[] = {
#include "textures/segment2/segment2_cn.19820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19830[] = {
#include "textures/segment2/segment2_cn.19830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19840[] = {
#include "textures/segment2/segment2_cn.19840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19850[] = {
#include "textures/segment2/segment2_cn.19850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19860[] = {
#include "textures/segment2/segment2_cn.19860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19870[] = {
#include "textures/segment2/segment2_cn.19870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19880[] = {
#include "textures/segment2/segment2_cn.19880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19890[] = {
#include "textures/segment2/segment2_cn.19890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_198A0[] = {
#include "textures/segment2/segment2_cn.198A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_198B0[] = {
#include "textures/segment2/segment2_cn.198B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_198C0[] = {
#include "textures/segment2/segment2_cn.198C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_198D0[] = {
#include "textures/segment2/segment2_cn.198D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_198E0[] = {
#include "textures/segment2/segment2_cn.198E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_198F0[] = {
#include "textures/segment2/segment2_cn.198F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19900[] = {
#include "textures/segment2/segment2_cn.19900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19910[] = {
#include "textures/segment2/segment2_cn.19910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19920[] = {
#include "textures/segment2/segment2_cn.19920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19930[] = {
#include "textures/segment2/segment2_cn.19930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19940[] = {
#include "textures/segment2/segment2_cn.19940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19950[] = {
#include "textures/segment2/segment2_cn.19950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19960[] = {
#include "textures/segment2/segment2_cn.19960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19970[] = {
#include "textures/segment2/segment2_cn.19970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19980[] = {
#include "textures/segment2/segment2_cn.19980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19990[] = {
#include "textures/segment2/segment2_cn.19990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_199A0[] = {
#include "textures/segment2/segment2_cn.199A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_199B0[] = {
#include "textures/segment2/segment2_cn.199B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_199C0[] = {
#include "textures/segment2/segment2_cn.199C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_199D0[] = {
#include "textures/segment2/segment2_cn.199D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_199E0[] = {
#include "textures/segment2/segment2_cn.199E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_199F0[] = {
#include "textures/segment2/segment2_cn.199F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A00[] = {
#include "textures/segment2/segment2_cn.19A00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A10[] = {
#include "textures/segment2/segment2_cn.19A10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A20[] = {
#include "textures/segment2/segment2_cn.19A20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A30[] = {
#include "textures/segment2/segment2_cn.19A30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A40[] = {
#include "textures/segment2/segment2_cn.19A40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A50[] = {
#include "textures/segment2/segment2_cn.19A50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A60[] = {
#include "textures/segment2/segment2_cn.19A60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A70[] = {
#include "textures/segment2/segment2_cn.19A70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A80[] = {
#include "textures/segment2/segment2_cn.19A80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19A90[] = {
#include "textures/segment2/segment2_cn.19A90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19AA0[] = {
#include "textures/segment2/segment2_cn.19AA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19AB0[] = {
#include "textures/segment2/segment2_cn.19AB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19AC0[] = {
#include "textures/segment2/segment2_cn.19AC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19AD0[] = {
#include "textures/segment2/segment2_cn.19AD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19AE0[] = {
#include "textures/segment2/segment2_cn.19AE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19AF0[] = {
#include "textures/segment2/segment2_cn.19AF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B00[] = {
#include "textures/segment2/segment2_cn.19B00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B10[] = {
#include "textures/segment2/segment2_cn.19B10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B20[] = {
#include "textures/segment2/segment2_cn.19B20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B30[] = {
#include "textures/segment2/segment2_cn.19B30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B40[] = {
#include "textures/segment2/segment2_cn.19B40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B50[] = {
#include "textures/segment2/segment2_cn.19B50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B60[] = {
#include "textures/segment2/segment2_cn.19B60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B70[] = {
#include "textures/segment2/segment2_cn.19B70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B80[] = {
#include "textures/segment2/segment2_cn.19B80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19B90[] = {
#include "textures/segment2/segment2_cn.19B90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19BA0[] = {
#include "textures/segment2/segment2_cn.19BA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19BB0[] = {
#include "textures/segment2/segment2_cn.19BB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19BC0[] = {
#include "textures/segment2/segment2_cn.19BC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19BD0[] = {
#include "textures/segment2/segment2_cn.19BD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19BE0[] = {
#include "textures/segment2/segment2_cn.19BE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19BF0[] = {
#include "textures/segment2/segment2_cn.19BF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C00[] = {
#include "textures/segment2/segment2_cn.19C00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C10[] = {
#include "textures/segment2/segment2_cn.19C10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C20[] = {
#include "textures/segment2/segment2_cn.19C20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C30[] = {
#include "textures/segment2/segment2_cn.19C30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C40[] = {
#include "textures/segment2/segment2_cn.19C40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C50[] = {
#include "textures/segment2/segment2_cn.19C50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C60[] = {
#include "textures/segment2/segment2_cn.19C60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C70[] = {
#include "textures/segment2/segment2_cn.19C70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C80[] = {
#include "textures/segment2/segment2_cn.19C80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19C90[] = {
#include "textures/segment2/segment2_cn.19C90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19CA0[] = {
#include "textures/segment2/segment2_cn.19CA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19CB0[] = {
#include "textures/segment2/segment2_cn.19CB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19CC0[] = {
#include "textures/segment2/segment2_cn.19CC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19CD0[] = {
#include "textures/segment2/segment2_cn.19CD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19CE0[] = {
#include "textures/segment2/segment2_cn.19CE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19CF0[] = {
#include "textures/segment2/segment2_cn.19CF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D00[] = {
#include "textures/segment2/segment2_cn.19D00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D10[] = {
#include "textures/segment2/segment2_cn.19D10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D20[] = {
#include "textures/segment2/segment2_cn.19D20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D30[] = {
#include "textures/segment2/segment2_cn.19D30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D40[] = {
#include "textures/segment2/segment2_cn.19D40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D50[] = {
#include "textures/segment2/segment2_cn.19D50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D60[] = {
#include "textures/segment2/segment2_cn.19D60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D70[] = {
#include "textures/segment2/segment2_cn.19D70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D80[] = {
#include "textures/segment2/segment2_cn.19D80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19D90[] = {
#include "textures/segment2/segment2_cn.19D90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19DA0[] = {
#include "textures/segment2/segment2_cn.19DA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19DB0[] = {
#include "textures/segment2/segment2_cn.19DB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19DC0[] = {
#include "textures/segment2/segment2_cn.19DC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19DD0[] = {
#include "textures/segment2/segment2_cn.19DD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19DE0[] = {
#include "textures/segment2/segment2_cn.19DE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19DF0[] = {
#include "textures/segment2/segment2_cn.19DF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E00[] = {
#include "textures/segment2/segment2_cn.19E00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E10[] = {
#include "textures/segment2/segment2_cn.19E10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E20[] = {
#include "textures/segment2/segment2_cn.19E20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E30[] = {
#include "textures/segment2/segment2_cn.19E30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E40[] = {
#include "textures/segment2/segment2_cn.19E40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E50[] = {
#include "textures/segment2/segment2_cn.19E50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E60[] = {
#include "textures/segment2/segment2_cn.19E60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E70[] = {
#include "textures/segment2/segment2_cn.19E70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E80[] = {
#include "textures/segment2/segment2_cn.19E80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19E90[] = {
#include "textures/segment2/segment2_cn.19E90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19EA0[] = {
#include "textures/segment2/segment2_cn.19EA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19EB0[] = {
#include "textures/segment2/segment2_cn.19EB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19EC0[] = {
#include "textures/segment2/segment2_cn.19EC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19ED0[] = {
#include "textures/segment2/segment2_cn.19ED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19EE0[] = {
#include "textures/segment2/segment2_cn.19EE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19EF0[] = {
#include "textures/segment2/segment2_cn.19EF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F00[] = {
#include "textures/segment2/segment2_cn.19F00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F10[] = {
#include "textures/segment2/segment2_cn.19F10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F20[] = {
#include "textures/segment2/segment2_cn.19F20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F30[] = {
#include "textures/segment2/segment2_cn.19F30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F40[] = {
#include "textures/segment2/segment2_cn.19F40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F50[] = {
#include "textures/segment2/segment2_cn.19F50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F60[] = {
#include "textures/segment2/segment2_cn.19F60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F70[] = {
#include "textures/segment2/segment2_cn.19F70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F80[] = {
#include "textures/segment2/segment2_cn.19F80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19F90[] = {
#include "textures/segment2/segment2_cn.19F90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19FA0[] = {
#include "textures/segment2/segment2_cn.19FA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19FB0[] = {
#include "textures/segment2/segment2_cn.19FB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19FC0[] = {
#include "textures/segment2/segment2_cn.19FC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19FD0[] = {
#include "textures/segment2/segment2_cn.19FD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19FE0[] = {
#include "textures/segment2/segment2_cn.19FE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_19FF0[] = {
#include "textures/segment2/segment2_cn.19FF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A000[] = {
#include "textures/segment2/segment2_cn.1A000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A010[] = {
#include "textures/segment2/segment2_cn.1A010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A020[] = {
#include "textures/segment2/segment2_cn.1A020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A030[] = {
#include "textures/segment2/segment2_cn.1A030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A040[] = {
#include "textures/segment2/segment2_cn.1A040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A050[] = {
#include "textures/segment2/segment2_cn.1A050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A060[] = {
#include "textures/segment2/segment2_cn.1A060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A070[] = {
#include "textures/segment2/segment2_cn.1A070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A080[] = {
#include "textures/segment2/segment2_cn.1A080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A090[] = {
#include "textures/segment2/segment2_cn.1A090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A0A0[] = {
#include "textures/segment2/segment2_cn.1A0A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A0B0[] = {
#include "textures/segment2/segment2_cn.1A0B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A0C0[] = {
#include "textures/segment2/segment2_cn.1A0C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A0D0[] = {
#include "textures/segment2/segment2_cn.1A0D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A0E0[] = {
#include "textures/segment2/segment2_cn.1A0E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A0F0[] = {
#include "textures/segment2/segment2_cn.1A0F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A100[] = {
#include "textures/segment2/segment2_cn.1A100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A110[] = {
#include "textures/segment2/segment2_cn.1A110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A120[] = {
#include "textures/segment2/segment2_cn.1A120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A130[] = {
#include "textures/segment2/segment2_cn.1A130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A140[] = {
#include "textures/segment2/segment2_cn.1A140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A150[] = {
#include "textures/segment2/segment2_cn.1A150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A160[] = {
#include "textures/segment2/segment2_cn.1A160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A170[] = {
#include "textures/segment2/segment2_cn.1A170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A180[] = {
#include "textures/segment2/segment2_cn.1A180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A190[] = {
#include "textures/segment2/segment2_cn.1A190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A1A0[] = {
#include "textures/segment2/segment2_cn.1A1A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A1B0[] = {
#include "textures/segment2/segment2_cn.1A1B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A1C0[] = {
#include "textures/segment2/segment2_cn.1A1C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A1D0[] = {
#include "textures/segment2/segment2_cn.1A1D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A1E0[] = {
#include "textures/segment2/segment2_cn.1A1E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A1F0[] = {
#include "textures/segment2/segment2_cn.1A1F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A200[] = {
#include "textures/segment2/segment2_cn.1A200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A210[] = {
#include "textures/segment2/segment2_cn.1A210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A220[] = {
#include "textures/segment2/segment2_cn.1A220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A230[] = {
#include "textures/segment2/segment2_cn.1A230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A240[] = {
#include "textures/segment2/segment2_cn.1A240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A250[] = {
#include "textures/segment2/segment2_cn.1A250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A260[] = {
#include "textures/segment2/segment2_cn.1A260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A270[] = {
#include "textures/segment2/segment2_cn.1A270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A280[] = {
#include "textures/segment2/segment2_cn.1A280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A290[] = {
#include "textures/segment2/segment2_cn.1A290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A2A0[] = {
#include "textures/segment2/segment2_cn.1A2A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A2B0[] = {
#include "textures/segment2/segment2_cn.1A2B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A2C0[] = {
#include "textures/segment2/segment2_cn.1A2C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A2D0[] = {
#include "textures/segment2/segment2_cn.1A2D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A2E0[] = {
#include "textures/segment2/segment2_cn.1A2E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A2F0[] = {
#include "textures/segment2/segment2_cn.1A2F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A300[] = {
#include "textures/segment2/segment2_cn.1A300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A310[] = {
#include "textures/segment2/segment2_cn.1A310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A320[] = {
#include "textures/segment2/segment2_cn.1A320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A330[] = {
#include "textures/segment2/segment2_cn.1A330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A340[] = {
#include "textures/segment2/segment2_cn.1A340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A350[] = {
#include "textures/segment2/segment2_cn.1A350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A360[] = {
#include "textures/segment2/segment2_cn.1A360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A370[] = {
#include "textures/segment2/segment2_cn.1A370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A380[] = {
#include "textures/segment2/segment2_cn.1A380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A390[] = {
#include "textures/segment2/segment2_cn.1A390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A3A0[] = {
#include "textures/segment2/segment2_cn.1A3A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A3B0[] = {
#include "textures/segment2/segment2_cn.1A3B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A3C0[] = {
#include "textures/segment2/segment2_cn.1A3C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A3D0[] = {
#include "textures/segment2/segment2_cn.1A3D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A3E0[] = {
#include "textures/segment2/segment2_cn.1A3E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A3F0[] = {
#include "textures/segment2/segment2_cn.1A3F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A400[] = {
#include "textures/segment2/segment2_cn.1A400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A410[] = {
#include "textures/segment2/segment2_cn.1A410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A420[] = {
#include "textures/segment2/segment2_cn.1A420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A430[] = {
#include "textures/segment2/segment2_cn.1A430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A440[] = {
#include "textures/segment2/segment2_cn.1A440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A450[] = {
#include "textures/segment2/segment2_cn.1A450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A460[] = {
#include "textures/segment2/segment2_cn.1A460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A470[] = {
#include "textures/segment2/segment2_cn.1A470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A480[] = {
#include "textures/segment2/segment2_cn.1A480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A490[] = {
#include "textures/segment2/segment2_cn.1A490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A4A0[] = {
#include "textures/segment2/segment2_cn.1A4A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A4B0[] = {
#include "textures/segment2/segment2_cn.1A4B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A4C0[] = {
#include "textures/segment2/segment2_cn.1A4C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A4D0[] = {
#include "textures/segment2/segment2_cn.1A4D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A4E0[] = {
#include "textures/segment2/segment2_cn.1A4E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A4F0[] = {
#include "textures/segment2/segment2_cn.1A4F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A500[] = {
#include "textures/segment2/segment2_cn.1A500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A510[] = {
#include "textures/segment2/segment2_cn.1A510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A520[] = {
#include "textures/segment2/segment2_cn.1A520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A530[] = {
#include "textures/segment2/segment2_cn.1A530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A540[] = {
#include "textures/segment2/segment2_cn.1A540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A550[] = {
#include "textures/segment2/segment2_cn.1A550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A560[] = {
#include "textures/segment2/segment2_cn.1A560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A570[] = {
#include "textures/segment2/segment2_cn.1A570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A580[] = {
#include "textures/segment2/segment2_cn.1A580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A590[] = {
#include "textures/segment2/segment2_cn.1A590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A5A0[] = {
#include "textures/segment2/segment2_cn.1A5A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A5B0[] = {
#include "textures/segment2/segment2_cn.1A5B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A5C0[] = {
#include "textures/segment2/segment2_cn.1A5C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A5D0[] = {
#include "textures/segment2/segment2_cn.1A5D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A5E0[] = {
#include "textures/segment2/segment2_cn.1A5E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A5F0[] = {
#include "textures/segment2/segment2_cn.1A5F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A600[] = {
#include "textures/segment2/segment2_cn.1A600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A610[] = {
#include "textures/segment2/segment2_cn.1A610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A620[] = {
#include "textures/segment2/segment2_cn.1A620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A630[] = {
#include "textures/segment2/segment2_cn.1A630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A640[] = {
#include "textures/segment2/segment2_cn.1A640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A650[] = {
#include "textures/segment2/segment2_cn.1A650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A660[] = {
#include "textures/segment2/segment2_cn.1A660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A670[] = {
#include "textures/segment2/segment2_cn.1A670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A680[] = {
#include "textures/segment2/segment2_cn.1A680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A690[] = {
#include "textures/segment2/segment2_cn.1A690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A6A0[] = {
#include "textures/segment2/segment2_cn.1A6A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A6B0[] = {
#include "textures/segment2/segment2_cn.1A6B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A6C0[] = {
#include "textures/segment2/segment2_cn.1A6C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A6D0[] = {
#include "textures/segment2/segment2_cn.1A6D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A6E0[] = {
#include "textures/segment2/segment2_cn.1A6E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A6F0[] = {
#include "textures/segment2/segment2_cn.1A6F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A700[] = {
#include "textures/segment2/segment2_cn.1A700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A710[] = {
#include "textures/segment2/segment2_cn.1A710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A720[] = {
#include "textures/segment2/segment2_cn.1A720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A730[] = {
#include "textures/segment2/segment2_cn.1A730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A740[] = {
#include "textures/segment2/segment2_cn.1A740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A750[] = {
#include "textures/segment2/segment2_cn.1A750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A760[] = {
#include "textures/segment2/segment2_cn.1A760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A770[] = {
#include "textures/segment2/segment2_cn.1A770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A780[] = {
#include "textures/segment2/segment2_cn.1A780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A790[] = {
#include "textures/segment2/segment2_cn.1A790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A7A0[] = {
#include "textures/segment2/segment2_cn.1A7A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A7B0[] = {
#include "textures/segment2/segment2_cn.1A7B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A7C0[] = {
#include "textures/segment2/segment2_cn.1A7C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A7D0[] = {
#include "textures/segment2/segment2_cn.1A7D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A7E0[] = {
#include "textures/segment2/segment2_cn.1A7E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A7F0[] = {
#include "textures/segment2/segment2_cn.1A7F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A800[] = {
#include "textures/segment2/segment2_cn.1A800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A810[] = {
#include "textures/segment2/segment2_cn.1A810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A820[] = {
#include "textures/segment2/segment2_cn.1A820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A830[] = {
#include "textures/segment2/segment2_cn.1A830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A840[] = {
#include "textures/segment2/segment2_cn.1A840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A850[] = {
#include "textures/segment2/segment2_cn.1A850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A860[] = {
#include "textures/segment2/segment2_cn.1A860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A870[] = {
#include "textures/segment2/segment2_cn.1A870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A880[] = {
#include "textures/segment2/segment2_cn.1A880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A890[] = {
#include "textures/segment2/segment2_cn.1A890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A8A0[] = {
#include "textures/segment2/segment2_cn.1A8A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A8B0[] = {
#include "textures/segment2/segment2_cn.1A8B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A8C0[] = {
#include "textures/segment2/segment2_cn.1A8C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A8D0[] = {
#include "textures/segment2/segment2_cn.1A8D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A8E0[] = {
#include "textures/segment2/segment2_cn.1A8E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A8F0[] = {
#include "textures/segment2/segment2_cn.1A8F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A900[] = {
#include "textures/segment2/segment2_cn.1A900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A910[] = {
#include "textures/segment2/segment2_cn.1A910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A920[] = {
#include "textures/segment2/segment2_cn.1A920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A930[] = {
#include "textures/segment2/segment2_cn.1A930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A940[] = {
#include "textures/segment2/segment2_cn.1A940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A950[] = {
#include "textures/segment2/segment2_cn.1A950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A960[] = {
#include "textures/segment2/segment2_cn.1A960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A970[] = {
#include "textures/segment2/segment2_cn.1A970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A980[] = {
#include "textures/segment2/segment2_cn.1A980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A990[] = {
#include "textures/segment2/segment2_cn.1A990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A9A0[] = {
#include "textures/segment2/segment2_cn.1A9A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A9B0[] = {
#include "textures/segment2/segment2_cn.1A9B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A9C0[] = {
#include "textures/segment2/segment2_cn.1A9C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A9D0[] = {
#include "textures/segment2/segment2_cn.1A9D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A9E0[] = {
#include "textures/segment2/segment2_cn.1A9E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1A9F0[] = {
#include "textures/segment2/segment2_cn.1A9F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA00[] = {
#include "textures/segment2/segment2_cn.1AA00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA10[] = {
#include "textures/segment2/segment2_cn.1AA10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA20[] = {
#include "textures/segment2/segment2_cn.1AA20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA30[] = {
#include "textures/segment2/segment2_cn.1AA30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA40[] = {
#include "textures/segment2/segment2_cn.1AA40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA50[] = {
#include "textures/segment2/segment2_cn.1AA50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA60[] = {
#include "textures/segment2/segment2_cn.1AA60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA70[] = {
#include "textures/segment2/segment2_cn.1AA70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA80[] = {
#include "textures/segment2/segment2_cn.1AA80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AA90[] = {
#include "textures/segment2/segment2_cn.1AA90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AAA0[] = {
#include "textures/segment2/segment2_cn.1AAA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AAB0[] = {
#include "textures/segment2/segment2_cn.1AAB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AAC0[] = {
#include "textures/segment2/segment2_cn.1AAC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AAD0[] = {
#include "textures/segment2/segment2_cn.1AAD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AAE0[] = {
#include "textures/segment2/segment2_cn.1AAE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AAF0[] = {
#include "textures/segment2/segment2_cn.1AAF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB00[] = {
#include "textures/segment2/segment2_cn.1AB00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB10[] = {
#include "textures/segment2/segment2_cn.1AB10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB20[] = {
#include "textures/segment2/segment2_cn.1AB20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB30[] = {
#include "textures/segment2/segment2_cn.1AB30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB40[] = {
#include "textures/segment2/segment2_cn.1AB40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB50[] = {
#include "textures/segment2/segment2_cn.1AB50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB60[] = {
#include "textures/segment2/segment2_cn.1AB60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB70[] = {
#include "textures/segment2/segment2_cn.1AB70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB80[] = {
#include "textures/segment2/segment2_cn.1AB80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AB90[] = {
#include "textures/segment2/segment2_cn.1AB90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ABA0[] = {
#include "textures/segment2/segment2_cn.1ABA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ABB0[] = {
#include "textures/segment2/segment2_cn.1ABB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ABC0[] = {
#include "textures/segment2/segment2_cn.1ABC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ABD0[] = {
#include "textures/segment2/segment2_cn.1ABD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ABE0[] = {
#include "textures/segment2/segment2_cn.1ABE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ABF0[] = {
#include "textures/segment2/segment2_cn.1ABF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC00[] = {
#include "textures/segment2/segment2_cn.1AC00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC10[] = {
#include "textures/segment2/segment2_cn.1AC10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC20[] = {
#include "textures/segment2/segment2_cn.1AC20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC30[] = {
#include "textures/segment2/segment2_cn.1AC30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC40[] = {
#include "textures/segment2/segment2_cn.1AC40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC50[] = {
#include "textures/segment2/segment2_cn.1AC50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC60[] = {
#include "textures/segment2/segment2_cn.1AC60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC70[] = {
#include "textures/segment2/segment2_cn.1AC70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC80[] = {
#include "textures/segment2/segment2_cn.1AC80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AC90[] = {
#include "textures/segment2/segment2_cn.1AC90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ACA0[] = {
#include "textures/segment2/segment2_cn.1ACA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ACB0[] = {
#include "textures/segment2/segment2_cn.1ACB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ACC0[] = {
#include "textures/segment2/segment2_cn.1ACC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ACD0[] = {
#include "textures/segment2/segment2_cn.1ACD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ACE0[] = {
#include "textures/segment2/segment2_cn.1ACE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ACF0[] = {
#include "textures/segment2/segment2_cn.1ACF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD00[] = {
#include "textures/segment2/segment2_cn.1AD00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD10[] = {
#include "textures/segment2/segment2_cn.1AD10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD20[] = {
#include "textures/segment2/segment2_cn.1AD20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD30[] = {
#include "textures/segment2/segment2_cn.1AD30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD40[] = {
#include "textures/segment2/segment2_cn.1AD40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD50[] = {
#include "textures/segment2/segment2_cn.1AD50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD60[] = {
#include "textures/segment2/segment2_cn.1AD60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD70[] = {
#include "textures/segment2/segment2_cn.1AD70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD80[] = {
#include "textures/segment2/segment2_cn.1AD80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AD90[] = {
#include "textures/segment2/segment2_cn.1AD90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ADA0[] = {
#include "textures/segment2/segment2_cn.1ADA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ADB0[] = {
#include "textures/segment2/segment2_cn.1ADB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ADC0[] = {
#include "textures/segment2/segment2_cn.1ADC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ADD0[] = {
#include "textures/segment2/segment2_cn.1ADD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ADE0[] = {
#include "textures/segment2/segment2_cn.1ADE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ADF0[] = {
#include "textures/segment2/segment2_cn.1ADF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE00[] = {
#include "textures/segment2/segment2_cn.1AE00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE10[] = {
#include "textures/segment2/segment2_cn.1AE10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE20[] = {
#include "textures/segment2/segment2_cn.1AE20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE30[] = {
#include "textures/segment2/segment2_cn.1AE30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE40[] = {
#include "textures/segment2/segment2_cn.1AE40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE50[] = {
#include "textures/segment2/segment2_cn.1AE50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE60[] = {
#include "textures/segment2/segment2_cn.1AE60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE70[] = {
#include "textures/segment2/segment2_cn.1AE70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE80[] = {
#include "textures/segment2/segment2_cn.1AE80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AE90[] = {
#include "textures/segment2/segment2_cn.1AE90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AEA0[] = {
#include "textures/segment2/segment2_cn.1AEA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AEB0[] = {
#include "textures/segment2/segment2_cn.1AEB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AEC0[] = {
#include "textures/segment2/segment2_cn.1AEC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AED0[] = {
#include "textures/segment2/segment2_cn.1AED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AEE0[] = {
#include "textures/segment2/segment2_cn.1AEE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AEF0[] = {
#include "textures/segment2/segment2_cn.1AEF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF00[] = {
#include "textures/segment2/segment2_cn.1AF00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF10[] = {
#include "textures/segment2/segment2_cn.1AF10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF20[] = {
#include "textures/segment2/segment2_cn.1AF20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF30[] = {
#include "textures/segment2/segment2_cn.1AF30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF40[] = {
#include "textures/segment2/segment2_cn.1AF40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF50[] = {
#include "textures/segment2/segment2_cn.1AF50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF60[] = {
#include "textures/segment2/segment2_cn.1AF60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF70[] = {
#include "textures/segment2/segment2_cn.1AF70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF80[] = {
#include "textures/segment2/segment2_cn.1AF80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AF90[] = {
#include "textures/segment2/segment2_cn.1AF90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AFA0[] = {
#include "textures/segment2/segment2_cn.1AFA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AFB0[] = {
#include "textures/segment2/segment2_cn.1AFB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AFC0[] = {
#include "textures/segment2/segment2_cn.1AFC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AFD0[] = {
#include "textures/segment2/segment2_cn.1AFD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AFE0[] = {
#include "textures/segment2/segment2_cn.1AFE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1AFF0[] = {
#include "textures/segment2/segment2_cn.1AFF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B000[] = {
#include "textures/segment2/segment2_cn.1B000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B010[] = {
#include "textures/segment2/segment2_cn.1B010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B020[] = {
#include "textures/segment2/segment2_cn.1B020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B030[] = {
#include "textures/segment2/segment2_cn.1B030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B040[] = {
#include "textures/segment2/segment2_cn.1B040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B050[] = {
#include "textures/segment2/segment2_cn.1B050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B060[] = {
#include "textures/segment2/segment2_cn.1B060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B070[] = {
#include "textures/segment2/segment2_cn.1B070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B080[] = {
#include "textures/segment2/segment2_cn.1B080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B090[] = {
#include "textures/segment2/segment2_cn.1B090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B0A0[] = {
#include "textures/segment2/segment2_cn.1B0A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B0B0[] = {
#include "textures/segment2/segment2_cn.1B0B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B0C0[] = {
#include "textures/segment2/segment2_cn.1B0C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B0D0[] = {
#include "textures/segment2/segment2_cn.1B0D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B0E0[] = {
#include "textures/segment2/segment2_cn.1B0E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B0F0[] = {
#include "textures/segment2/segment2_cn.1B0F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B100[] = {
#include "textures/segment2/segment2_cn.1B100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B110[] = {
#include "textures/segment2/segment2_cn.1B110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B120[] = {
#include "textures/segment2/segment2_cn.1B120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B130[] = {
#include "textures/segment2/segment2_cn.1B130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B140[] = {
#include "textures/segment2/segment2_cn.1B140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B150[] = {
#include "textures/segment2/segment2_cn.1B150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B160[] = {
#include "textures/segment2/segment2_cn.1B160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B170[] = {
#include "textures/segment2/segment2_cn.1B170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B180[] = {
#include "textures/segment2/segment2_cn.1B180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B190[] = {
#include "textures/segment2/segment2_cn.1B190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B1A0[] = {
#include "textures/segment2/segment2_cn.1B1A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B1B0[] = {
#include "textures/segment2/segment2_cn.1B1B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B1C0[] = {
#include "textures/segment2/segment2_cn.1B1C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B1D0[] = {
#include "textures/segment2/segment2_cn.1B1D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B1E0[] = {
#include "textures/segment2/segment2_cn.1B1E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B1F0[] = {
#include "textures/segment2/segment2_cn.1B1F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B200[] = {
#include "textures/segment2/segment2_cn.1B200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B210[] = {
#include "textures/segment2/segment2_cn.1B210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B220[] = {
#include "textures/segment2/segment2_cn.1B220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B230[] = {
#include "textures/segment2/segment2_cn.1B230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B240[] = {
#include "textures/segment2/segment2_cn.1B240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B250[] = {
#include "textures/segment2/segment2_cn.1B250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B260[] = {
#include "textures/segment2/segment2_cn.1B260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B270[] = {
#include "textures/segment2/segment2_cn.1B270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B280[] = {
#include "textures/segment2/segment2_cn.1B280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B290[] = {
#include "textures/segment2/segment2_cn.1B290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B2A0[] = {
#include "textures/segment2/segment2_cn.1B2A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B2B0[] = {
#include "textures/segment2/segment2_cn.1B2B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B2C0[] = {
#include "textures/segment2/segment2_cn.1B2C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B2D0[] = {
#include "textures/segment2/segment2_cn.1B2D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B2E0[] = {
#include "textures/segment2/segment2_cn.1B2E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B2F0[] = {
#include "textures/segment2/segment2_cn.1B2F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B300[] = {
#include "textures/segment2/segment2_cn.1B300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B310[] = {
#include "textures/segment2/segment2_cn.1B310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B320[] = {
#include "textures/segment2/segment2_cn.1B320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B330[] = {
#include "textures/segment2/segment2_cn.1B330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B340[] = {
#include "textures/segment2/segment2_cn.1B340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B350[] = {
#include "textures/segment2/segment2_cn.1B350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B360[] = {
#include "textures/segment2/segment2_cn.1B360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B370[] = {
#include "textures/segment2/segment2_cn.1B370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B380[] = {
#include "textures/segment2/segment2_cn.1B380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B390[] = {
#include "textures/segment2/segment2_cn.1B390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B3A0[] = {
#include "textures/segment2/segment2_cn.1B3A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B3B0[] = {
#include "textures/segment2/segment2_cn.1B3B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B3C0[] = {
#include "textures/segment2/segment2_cn.1B3C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B3D0[] = {
#include "textures/segment2/segment2_cn.1B3D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B3E0[] = {
#include "textures/segment2/segment2_cn.1B3E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B3F0[] = {
#include "textures/segment2/segment2_cn.1B3F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B400[] = {
#include "textures/segment2/segment2_cn.1B400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B410[] = {
#include "textures/segment2/segment2_cn.1B410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B420[] = {
#include "textures/segment2/segment2_cn.1B420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B430[] = {
#include "textures/segment2/segment2_cn.1B430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B440[] = {
#include "textures/segment2/segment2_cn.1B440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B450[] = {
#include "textures/segment2/segment2_cn.1B450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B460[] = {
#include "textures/segment2/segment2_cn.1B460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B470[] = {
#include "textures/segment2/segment2_cn.1B470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B480[] = {
#include "textures/segment2/segment2_cn.1B480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B490[] = {
#include "textures/segment2/segment2_cn.1B490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B4A0[] = {
#include "textures/segment2/segment2_cn.1B4A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B4B0[] = {
#include "textures/segment2/segment2_cn.1B4B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B4C0[] = {
#include "textures/segment2/segment2_cn.1B4C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B4D0[] = {
#include "textures/segment2/segment2_cn.1B4D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B4E0[] = {
#include "textures/segment2/segment2_cn.1B4E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B4F0[] = {
#include "textures/segment2/segment2_cn.1B4F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B500[] = {
#include "textures/segment2/segment2_cn.1B500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B510[] = {
#include "textures/segment2/segment2_cn.1B510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B520[] = {
#include "textures/segment2/segment2_cn.1B520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B530[] = {
#include "textures/segment2/segment2_cn.1B530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B540[] = {
#include "textures/segment2/segment2_cn.1B540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B550[] = {
#include "textures/segment2/segment2_cn.1B550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B560[] = {
#include "textures/segment2/segment2_cn.1B560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B570[] = {
#include "textures/segment2/segment2_cn.1B570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B580[] = {
#include "textures/segment2/segment2_cn.1B580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B590[] = {
#include "textures/segment2/segment2_cn.1B590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B5A0[] = {
#include "textures/segment2/segment2_cn.1B5A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B5B0[] = {
#include "textures/segment2/segment2_cn.1B5B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B5C0[] = {
#include "textures/segment2/segment2_cn.1B5C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B5D0[] = {
#include "textures/segment2/segment2_cn.1B5D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B5E0[] = {
#include "textures/segment2/segment2_cn.1B5E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B5F0[] = {
#include "textures/segment2/segment2_cn.1B5F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B600[] = {
#include "textures/segment2/segment2_cn.1B600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B610[] = {
#include "textures/segment2/segment2_cn.1B610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B620[] = {
#include "textures/segment2/segment2_cn.1B620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B630[] = {
#include "textures/segment2/segment2_cn.1B630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B640[] = {
#include "textures/segment2/segment2_cn.1B640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B650[] = {
#include "textures/segment2/segment2_cn.1B650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B660[] = {
#include "textures/segment2/segment2_cn.1B660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B670[] = {
#include "textures/segment2/segment2_cn.1B670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B680[] = {
#include "textures/segment2/segment2_cn.1B680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B690[] = {
#include "textures/segment2/segment2_cn.1B690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B6A0[] = {
#include "textures/segment2/segment2_cn.1B6A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B6B0[] = {
#include "textures/segment2/segment2_cn.1B6B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B6C0[] = {
#include "textures/segment2/segment2_cn.1B6C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B6D0[] = {
#include "textures/segment2/segment2_cn.1B6D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B6E0[] = {
#include "textures/segment2/segment2_cn.1B6E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B6F0[] = {
#include "textures/segment2/segment2_cn.1B6F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B700[] = {
#include "textures/segment2/segment2_cn.1B700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B710[] = {
#include "textures/segment2/segment2_cn.1B710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B720[] = {
#include "textures/segment2/segment2_cn.1B720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B730[] = {
#include "textures/segment2/segment2_cn.1B730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B740[] = {
#include "textures/segment2/segment2_cn.1B740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B750[] = {
#include "textures/segment2/segment2_cn.1B750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B760[] = {
#include "textures/segment2/segment2_cn.1B760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B770[] = {
#include "textures/segment2/segment2_cn.1B770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B780[] = {
#include "textures/segment2/segment2_cn.1B780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B790[] = {
#include "textures/segment2/segment2_cn.1B790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B7A0[] = {
#include "textures/segment2/segment2_cn.1B7A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B7B0[] = {
#include "textures/segment2/segment2_cn.1B7B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B7C0[] = {
#include "textures/segment2/segment2_cn.1B7C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B7D0[] = {
#include "textures/segment2/segment2_cn.1B7D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B7E0[] = {
#include "textures/segment2/segment2_cn.1B7E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B7F0[] = {
#include "textures/segment2/segment2_cn.1B7F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B800[] = {
#include "textures/segment2/segment2_cn.1B800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B810[] = {
#include "textures/segment2/segment2_cn.1B810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B820[] = {
#include "textures/segment2/segment2_cn.1B820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B830[] = {
#include "textures/segment2/segment2_cn.1B830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B840[] = {
#include "textures/segment2/segment2_cn.1B840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B850[] = {
#include "textures/segment2/segment2_cn.1B850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B860[] = {
#include "textures/segment2/segment2_cn.1B860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B870[] = {
#include "textures/segment2/segment2_cn.1B870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B880[] = {
#include "textures/segment2/segment2_cn.1B880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B890[] = {
#include "textures/segment2/segment2_cn.1B890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B8A0[] = {
#include "textures/segment2/segment2_cn.1B8A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B8B0[] = {
#include "textures/segment2/segment2_cn.1B8B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B8C0[] = {
#include "textures/segment2/segment2_cn.1B8C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B8D0[] = {
#include "textures/segment2/segment2_cn.1B8D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B8E0[] = {
#include "textures/segment2/segment2_cn.1B8E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B8F0[] = {
#include "textures/segment2/segment2_cn.1B8F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B900[] = {
#include "textures/segment2/segment2_cn.1B900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B910[] = {
#include "textures/segment2/segment2_cn.1B910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B920[] = {
#include "textures/segment2/segment2_cn.1B920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B930[] = {
#include "textures/segment2/segment2_cn.1B930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B940[] = {
#include "textures/segment2/segment2_cn.1B940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B950[] = {
#include "textures/segment2/segment2_cn.1B950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B960[] = {
#include "textures/segment2/segment2_cn.1B960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B970[] = {
#include "textures/segment2/segment2_cn.1B970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B980[] = {
#include "textures/segment2/segment2_cn.1B980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B990[] = {
#include "textures/segment2/segment2_cn.1B990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B9A0[] = {
#include "textures/segment2/segment2_cn.1B9A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B9B0[] = {
#include "textures/segment2/segment2_cn.1B9B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B9C0[] = {
#include "textures/segment2/segment2_cn.1B9C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B9D0[] = {
#include "textures/segment2/segment2_cn.1B9D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B9E0[] = {
#include "textures/segment2/segment2_cn.1B9E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1B9F0[] = {
#include "textures/segment2/segment2_cn.1B9F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA00[] = {
#include "textures/segment2/segment2_cn.1BA00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA10[] = {
#include "textures/segment2/segment2_cn.1BA10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA20[] = {
#include "textures/segment2/segment2_cn.1BA20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA30[] = {
#include "textures/segment2/segment2_cn.1BA30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA40[] = {
#include "textures/segment2/segment2_cn.1BA40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA50[] = {
#include "textures/segment2/segment2_cn.1BA50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA60[] = {
#include "textures/segment2/segment2_cn.1BA60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA70[] = {
#include "textures/segment2/segment2_cn.1BA70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA80[] = {
#include "textures/segment2/segment2_cn.1BA80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BA90[] = {
#include "textures/segment2/segment2_cn.1BA90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BAA0[] = {
#include "textures/segment2/segment2_cn.1BAA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BAB0[] = {
#include "textures/segment2/segment2_cn.1BAB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BAC0[] = {
#include "textures/segment2/segment2_cn.1BAC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BAD0[] = {
#include "textures/segment2/segment2_cn.1BAD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BAE0[] = {
#include "textures/segment2/segment2_cn.1BAE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BAF0[] = {
#include "textures/segment2/segment2_cn.1BAF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB00[] = {
#include "textures/segment2/segment2_cn.1BB00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB10[] = {
#include "textures/segment2/segment2_cn.1BB10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB20[] = {
#include "textures/segment2/segment2_cn.1BB20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB30[] = {
#include "textures/segment2/segment2_cn.1BB30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB40[] = {
#include "textures/segment2/segment2_cn.1BB40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB50[] = {
#include "textures/segment2/segment2_cn.1BB50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB60[] = {
#include "textures/segment2/segment2_cn.1BB60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB70[] = {
#include "textures/segment2/segment2_cn.1BB70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB80[] = {
#include "textures/segment2/segment2_cn.1BB80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BB90[] = {
#include "textures/segment2/segment2_cn.1BB90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BBA0[] = {
#include "textures/segment2/segment2_cn.1BBA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BBB0[] = {
#include "textures/segment2/segment2_cn.1BBB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BBC0[] = {
#include "textures/segment2/segment2_cn.1BBC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BBD0[] = {
#include "textures/segment2/segment2_cn.1BBD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BBE0[] = {
#include "textures/segment2/segment2_cn.1BBE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BBF0[] = {
#include "textures/segment2/segment2_cn.1BBF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC00[] = {
#include "textures/segment2/segment2_cn.1BC00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC10[] = {
#include "textures/segment2/segment2_cn.1BC10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC20[] = {
#include "textures/segment2/segment2_cn.1BC20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC30[] = {
#include "textures/segment2/segment2_cn.1BC30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC40[] = {
#include "textures/segment2/segment2_cn.1BC40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC50[] = {
#include "textures/segment2/segment2_cn.1BC50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC60[] = {
#include "textures/segment2/segment2_cn.1BC60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC70[] = {
#include "textures/segment2/segment2_cn.1BC70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC80[] = {
#include "textures/segment2/segment2_cn.1BC80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BC90[] = {
#include "textures/segment2/segment2_cn.1BC90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BCA0[] = {
#include "textures/segment2/segment2_cn.1BCA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BCB0[] = {
#include "textures/segment2/segment2_cn.1BCB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BCC0[] = {
#include "textures/segment2/segment2_cn.1BCC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BCD0[] = {
#include "textures/segment2/segment2_cn.1BCD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BCE0[] = {
#include "textures/segment2/segment2_cn.1BCE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BCF0[] = {
#include "textures/segment2/segment2_cn.1BCF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD00[] = {
#include "textures/segment2/segment2_cn.1BD00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD10[] = {
#include "textures/segment2/segment2_cn.1BD10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD20[] = {
#include "textures/segment2/segment2_cn.1BD20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD30[] = {
#include "textures/segment2/segment2_cn.1BD30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD40[] = {
#include "textures/segment2/segment2_cn.1BD40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD50[] = {
#include "textures/segment2/segment2_cn.1BD50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD60[] = {
#include "textures/segment2/segment2_cn.1BD60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD70[] = {
#include "textures/segment2/segment2_cn.1BD70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD80[] = {
#include "textures/segment2/segment2_cn.1BD80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BD90[] = {
#include "textures/segment2/segment2_cn.1BD90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BDA0[] = {
#include "textures/segment2/segment2_cn.1BDA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BDB0[] = {
#include "textures/segment2/segment2_cn.1BDB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BDC0[] = {
#include "textures/segment2/segment2_cn.1BDC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BDD0[] = {
#include "textures/segment2/segment2_cn.1BDD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BDE0[] = {
#include "textures/segment2/segment2_cn.1BDE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BDF0[] = {
#include "textures/segment2/segment2_cn.1BDF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE00[] = {
#include "textures/segment2/segment2_cn.1BE00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE10[] = {
#include "textures/segment2/segment2_cn.1BE10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE20[] = {
#include "textures/segment2/segment2_cn.1BE20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE30[] = {
#include "textures/segment2/segment2_cn.1BE30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE40[] = {
#include "textures/segment2/segment2_cn.1BE40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE50[] = {
#include "textures/segment2/segment2_cn.1BE50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE60[] = {
#include "textures/segment2/segment2_cn.1BE60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE70[] = {
#include "textures/segment2/segment2_cn.1BE70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE80[] = {
#include "textures/segment2/segment2_cn.1BE80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BE90[] = {
#include "textures/segment2/segment2_cn.1BE90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BEA0[] = {
#include "textures/segment2/segment2_cn.1BEA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BEB0[] = {
#include "textures/segment2/segment2_cn.1BEB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BEC0[] = {
#include "textures/segment2/segment2_cn.1BEC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BED0[] = {
#include "textures/segment2/segment2_cn.1BED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BEE0[] = {
#include "textures/segment2/segment2_cn.1BEE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BEF0[] = {
#include "textures/segment2/segment2_cn.1BEF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF00[] = {
#include "textures/segment2/segment2_cn.1BF00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF10[] = {
#include "textures/segment2/segment2_cn.1BF10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF20[] = {
#include "textures/segment2/segment2_cn.1BF20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF30[] = {
#include "textures/segment2/segment2_cn.1BF30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF40[] = {
#include "textures/segment2/segment2_cn.1BF40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF50[] = {
#include "textures/segment2/segment2_cn.1BF50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF60[] = {
#include "textures/segment2/segment2_cn.1BF60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF70[] = {
#include "textures/segment2/segment2_cn.1BF70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF80[] = {
#include "textures/segment2/segment2_cn.1BF80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BF90[] = {
#include "textures/segment2/segment2_cn.1BF90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BFA0[] = {
#include "textures/segment2/segment2_cn.1BFA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BFB0[] = {
#include "textures/segment2/segment2_cn.1BFB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BFC0[] = {
#include "textures/segment2/segment2_cn.1BFC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BFD0[] = {
#include "textures/segment2/segment2_cn.1BFD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BFE0[] = {
#include "textures/segment2/segment2_cn.1BFE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1BFF0[] = {
#include "textures/segment2/segment2_cn.1BFF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C000[] = {
#include "textures/segment2/segment2_cn.1C000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C010[] = {
#include "textures/segment2/segment2_cn.1C010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C020[] = {
#include "textures/segment2/segment2_cn.1C020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C030[] = {
#include "textures/segment2/segment2_cn.1C030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C040[] = {
#include "textures/segment2/segment2_cn.1C040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C050[] = {
#include "textures/segment2/segment2_cn.1C050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C060[] = {
#include "textures/segment2/segment2_cn.1C060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C070[] = {
#include "textures/segment2/segment2_cn.1C070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C080[] = {
#include "textures/segment2/segment2_cn.1C080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C090[] = {
#include "textures/segment2/segment2_cn.1C090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C0A0[] = {
#include "textures/segment2/segment2_cn.1C0A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C0B0[] = {
#include "textures/segment2/segment2_cn.1C0B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C0C0[] = {
#include "textures/segment2/segment2_cn.1C0C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C0D0[] = {
#include "textures/segment2/segment2_cn.1C0D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C0E0[] = {
#include "textures/segment2/segment2_cn.1C0E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C0F0[] = {
#include "textures/segment2/segment2_cn.1C0F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C100[] = {
#include "textures/segment2/segment2_cn.1C100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C110[] = {
#include "textures/segment2/segment2_cn.1C110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C120[] = {
#include "textures/segment2/segment2_cn.1C120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C130[] = {
#include "textures/segment2/segment2_cn.1C130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C140[] = {
#include "textures/segment2/segment2_cn.1C140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C150[] = {
#include "textures/segment2/segment2_cn.1C150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C160[] = {
#include "textures/segment2/segment2_cn.1C160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C170[] = {
#include "textures/segment2/segment2_cn.1C170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C180[] = {
#include "textures/segment2/segment2_cn.1C180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C190[] = {
#include "textures/segment2/segment2_cn.1C190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C1A0[] = {
#include "textures/segment2/segment2_cn.1C1A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C1B0[] = {
#include "textures/segment2/segment2_cn.1C1B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C1C0[] = {
#include "textures/segment2/segment2_cn.1C1C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C1D0[] = {
#include "textures/segment2/segment2_cn.1C1D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C1E0[] = {
#include "textures/segment2/segment2_cn.1C1E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C1F0[] = {
#include "textures/segment2/segment2_cn.1C1F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C200[] = {
#include "textures/segment2/segment2_cn.1C200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C210[] = {
#include "textures/segment2/segment2_cn.1C210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C220[] = {
#include "textures/segment2/segment2_cn.1C220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C230[] = {
#include "textures/segment2/segment2_cn.1C230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C240[] = {
#include "textures/segment2/segment2_cn.1C240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C250[] = {
#include "textures/segment2/segment2_cn.1C250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C260[] = {
#include "textures/segment2/segment2_cn.1C260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C270[] = {
#include "textures/segment2/segment2_cn.1C270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C280[] = {
#include "textures/segment2/segment2_cn.1C280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C290[] = {
#include "textures/segment2/segment2_cn.1C290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C2A0[] = {
#include "textures/segment2/segment2_cn.1C2A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C2B0[] = {
#include "textures/segment2/segment2_cn.1C2B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C2C0[] = {
#include "textures/segment2/segment2_cn.1C2C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C2D0[] = {
#include "textures/segment2/segment2_cn.1C2D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C2E0[] = {
#include "textures/segment2/segment2_cn.1C2E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C2F0[] = {
#include "textures/segment2/segment2_cn.1C2F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C300[] = {
#include "textures/segment2/segment2_cn.1C300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C310[] = {
#include "textures/segment2/segment2_cn.1C310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C320[] = {
#include "textures/segment2/segment2_cn.1C320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C330[] = {
#include "textures/segment2/segment2_cn.1C330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C340[] = {
#include "textures/segment2/segment2_cn.1C340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C350[] = {
#include "textures/segment2/segment2_cn.1C350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C360[] = {
#include "textures/segment2/segment2_cn.1C360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C370[] = {
#include "textures/segment2/segment2_cn.1C370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C380[] = {
#include "textures/segment2/segment2_cn.1C380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C390[] = {
#include "textures/segment2/segment2_cn.1C390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C3A0[] = {
#include "textures/segment2/segment2_cn.1C3A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C3B0[] = {
#include "textures/segment2/segment2_cn.1C3B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C3C0[] = {
#include "textures/segment2/segment2_cn.1C3C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C3D0[] = {
#include "textures/segment2/segment2_cn.1C3D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C3E0[] = {
#include "textures/segment2/segment2_cn.1C3E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C3F0[] = {
#include "textures/segment2/segment2_cn.1C3F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C400[] = {
#include "textures/segment2/segment2_cn.1C400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C410[] = {
#include "textures/segment2/segment2_cn.1C410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C420[] = {
#include "textures/segment2/segment2_cn.1C420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C430[] = {
#include "textures/segment2/segment2_cn.1C430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C440[] = {
#include "textures/segment2/segment2_cn.1C440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C450[] = {
#include "textures/segment2/segment2_cn.1C450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C460[] = {
#include "textures/segment2/segment2_cn.1C460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C470[] = {
#include "textures/segment2/segment2_cn.1C470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C480[] = {
#include "textures/segment2/segment2_cn.1C480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C490[] = {
#include "textures/segment2/segment2_cn.1C490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C4A0[] = {
#include "textures/segment2/segment2_cn.1C4A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C4B0[] = {
#include "textures/segment2/segment2_cn.1C4B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C4C0[] = {
#include "textures/segment2/segment2_cn.1C4C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C4D0[] = {
#include "textures/segment2/segment2_cn.1C4D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C4E0[] = {
#include "textures/segment2/segment2_cn.1C4E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C4F0[] = {
#include "textures/segment2/segment2_cn.1C4F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C500[] = {
#include "textures/segment2/segment2_cn.1C500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C510[] = {
#include "textures/segment2/segment2_cn.1C510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C520[] = {
#include "textures/segment2/segment2_cn.1C520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C530[] = {
#include "textures/segment2/segment2_cn.1C530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C540[] = {
#include "textures/segment2/segment2_cn.1C540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C550[] = {
#include "textures/segment2/segment2_cn.1C550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C560[] = {
#include "textures/segment2/segment2_cn.1C560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C570[] = {
#include "textures/segment2/segment2_cn.1C570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C580[] = {
#include "textures/segment2/segment2_cn.1C580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C590[] = {
#include "textures/segment2/segment2_cn.1C590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C5A0[] = {
#include "textures/segment2/segment2_cn.1C5A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C5B0[] = {
#include "textures/segment2/segment2_cn.1C5B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C5C0[] = {
#include "textures/segment2/segment2_cn.1C5C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C5D0[] = {
#include "textures/segment2/segment2_cn.1C5D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C5E0[] = {
#include "textures/segment2/segment2_cn.1C5E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C5F0[] = {
#include "textures/segment2/segment2_cn.1C5F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C600[] = {
#include "textures/segment2/segment2_cn.1C600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C610[] = {
#include "textures/segment2/segment2_cn.1C610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C620[] = {
#include "textures/segment2/segment2_cn.1C620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C630[] = {
#include "textures/segment2/segment2_cn.1C630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C640[] = {
#include "textures/segment2/segment2_cn.1C640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C650[] = {
#include "textures/segment2/segment2_cn.1C650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C660[] = {
#include "textures/segment2/segment2_cn.1C660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C670[] = {
#include "textures/segment2/segment2_cn.1C670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C680[] = {
#include "textures/segment2/segment2_cn.1C680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C690[] = {
#include "textures/segment2/segment2_cn.1C690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C6A0[] = {
#include "textures/segment2/segment2_cn.1C6A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C6B0[] = {
#include "textures/segment2/segment2_cn.1C6B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C6C0[] = {
#include "textures/segment2/segment2_cn.1C6C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C6D0[] = {
#include "textures/segment2/segment2_cn.1C6D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C6E0[] = {
#include "textures/segment2/segment2_cn.1C6E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C6F0[] = {
#include "textures/segment2/segment2_cn.1C6F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C700[] = {
#include "textures/segment2/segment2_cn.1C700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C710[] = {
#include "textures/segment2/segment2_cn.1C710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C720[] = {
#include "textures/segment2/segment2_cn.1C720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C730[] = {
#include "textures/segment2/segment2_cn.1C730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C740[] = {
#include "textures/segment2/segment2_cn.1C740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C750[] = {
#include "textures/segment2/segment2_cn.1C750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C760[] = {
#include "textures/segment2/segment2_cn.1C760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C770[] = {
#include "textures/segment2/segment2_cn.1C770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C780[] = {
#include "textures/segment2/segment2_cn.1C780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C790[] = {
#include "textures/segment2/segment2_cn.1C790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C7A0[] = {
#include "textures/segment2/segment2_cn.1C7A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C7B0[] = {
#include "textures/segment2/segment2_cn.1C7B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C7C0[] = {
#include "textures/segment2/segment2_cn.1C7C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C7D0[] = {
#include "textures/segment2/segment2_cn.1C7D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C7E0[] = {
#include "textures/segment2/segment2_cn.1C7E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C7F0[] = {
#include "textures/segment2/segment2_cn.1C7F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C800[] = {
#include "textures/segment2/segment2_cn.1C800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C810[] = {
#include "textures/segment2/segment2_cn.1C810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C820[] = {
#include "textures/segment2/segment2_cn.1C820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C830[] = {
#include "textures/segment2/segment2_cn.1C830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C840[] = {
#include "textures/segment2/segment2_cn.1C840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C850[] = {
#include "textures/segment2/segment2_cn.1C850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C860[] = {
#include "textures/segment2/segment2_cn.1C860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C870[] = {
#include "textures/segment2/segment2_cn.1C870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C880[] = {
#include "textures/segment2/segment2_cn.1C880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C890[] = {
#include "textures/segment2/segment2_cn.1C890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C8A0[] = {
#include "textures/segment2/segment2_cn.1C8A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C8B0[] = {
#include "textures/segment2/segment2_cn.1C8B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C8C0[] = {
#include "textures/segment2/segment2_cn.1C8C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C8D0[] = {
#include "textures/segment2/segment2_cn.1C8D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C8E0[] = {
#include "textures/segment2/segment2_cn.1C8E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C8F0[] = {
#include "textures/segment2/segment2_cn.1C8F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C900[] = {
#include "textures/segment2/segment2_cn.1C900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C910[] = {
#include "textures/segment2/segment2_cn.1C910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C920[] = {
#include "textures/segment2/segment2_cn.1C920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C930[] = {
#include "textures/segment2/segment2_cn.1C930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C940[] = {
#include "textures/segment2/segment2_cn.1C940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C950[] = {
#include "textures/segment2/segment2_cn.1C950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C960[] = {
#include "textures/segment2/segment2_cn.1C960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C970[] = {
#include "textures/segment2/segment2_cn.1C970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C980[] = {
#include "textures/segment2/segment2_cn.1C980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C990[] = {
#include "textures/segment2/segment2_cn.1C990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C9A0[] = {
#include "textures/segment2/segment2_cn.1C9A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C9B0[] = {
#include "textures/segment2/segment2_cn.1C9B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C9C0[] = {
#include "textures/segment2/segment2_cn.1C9C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C9D0[] = {
#include "textures/segment2/segment2_cn.1C9D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C9E0[] = {
#include "textures/segment2/segment2_cn.1C9E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1C9F0[] = {
#include "textures/segment2/segment2_cn.1C9F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA00[] = {
#include "textures/segment2/segment2_cn.1CA00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA10[] = {
#include "textures/segment2/segment2_cn.1CA10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA20[] = {
#include "textures/segment2/segment2_cn.1CA20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA30[] = {
#include "textures/segment2/segment2_cn.1CA30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA40[] = {
#include "textures/segment2/segment2_cn.1CA40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA50[] = {
#include "textures/segment2/segment2_cn.1CA50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA60[] = {
#include "textures/segment2/segment2_cn.1CA60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA70[] = {
#include "textures/segment2/segment2_cn.1CA70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA80[] = {
#include "textures/segment2/segment2_cn.1CA80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CA90[] = {
#include "textures/segment2/segment2_cn.1CA90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CAA0[] = {
#include "textures/segment2/segment2_cn.1CAA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CAB0[] = {
#include "textures/segment2/segment2_cn.1CAB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CAC0[] = {
#include "textures/segment2/segment2_cn.1CAC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CAD0[] = {
#include "textures/segment2/segment2_cn.1CAD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CAE0[] = {
#include "textures/segment2/segment2_cn.1CAE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CAF0[] = {
#include "textures/segment2/segment2_cn.1CAF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB00[] = {
#include "textures/segment2/segment2_cn.1CB00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB10[] = {
#include "textures/segment2/segment2_cn.1CB10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB20[] = {
#include "textures/segment2/segment2_cn.1CB20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB30[] = {
#include "textures/segment2/segment2_cn.1CB30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB40[] = {
#include "textures/segment2/segment2_cn.1CB40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB50[] = {
#include "textures/segment2/segment2_cn.1CB50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB60[] = {
#include "textures/segment2/segment2_cn.1CB60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB70[] = {
#include "textures/segment2/segment2_cn.1CB70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB80[] = {
#include "textures/segment2/segment2_cn.1CB80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CB90[] = {
#include "textures/segment2/segment2_cn.1CB90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CBA0[] = {
#include "textures/segment2/segment2_cn.1CBA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CBB0[] = {
#include "textures/segment2/segment2_cn.1CBB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CBC0[] = {
#include "textures/segment2/segment2_cn.1CBC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CBD0[] = {
#include "textures/segment2/segment2_cn.1CBD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CBE0[] = {
#include "textures/segment2/segment2_cn.1CBE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CBF0[] = {
#include "textures/segment2/segment2_cn.1CBF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC00[] = {
#include "textures/segment2/segment2_cn.1CC00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC10[] = {
#include "textures/segment2/segment2_cn.1CC10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC20[] = {
#include "textures/segment2/segment2_cn.1CC20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC30[] = {
#include "textures/segment2/segment2_cn.1CC30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC40[] = {
#include "textures/segment2/segment2_cn.1CC40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC50[] = {
#include "textures/segment2/segment2_cn.1CC50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC60[] = {
#include "textures/segment2/segment2_cn.1CC60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC70[] = {
#include "textures/segment2/segment2_cn.1CC70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC80[] = {
#include "textures/segment2/segment2_cn.1CC80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CC90[] = {
#include "textures/segment2/segment2_cn.1CC90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CCA0[] = {
#include "textures/segment2/segment2_cn.1CCA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CCB0[] = {
#include "textures/segment2/segment2_cn.1CCB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CCC0[] = {
#include "textures/segment2/segment2_cn.1CCC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CCD0[] = {
#include "textures/segment2/segment2_cn.1CCD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CCE0[] = {
#include "textures/segment2/segment2_cn.1CCE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CCF0[] = {
#include "textures/segment2/segment2_cn.1CCF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD00[] = {
#include "textures/segment2/segment2_cn.1CD00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD10[] = {
#include "textures/segment2/segment2_cn.1CD10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD20[] = {
#include "textures/segment2/segment2_cn.1CD20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD30[] = {
#include "textures/segment2/segment2_cn.1CD30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD40[] = {
#include "textures/segment2/segment2_cn.1CD40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD50[] = {
#include "textures/segment2/segment2_cn.1CD50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD60[] = {
#include "textures/segment2/segment2_cn.1CD60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD70[] = {
#include "textures/segment2/segment2_cn.1CD70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD80[] = {
#include "textures/segment2/segment2_cn.1CD80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CD90[] = {
#include "textures/segment2/segment2_cn.1CD90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CDA0[] = {
#include "textures/segment2/segment2_cn.1CDA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CDB0[] = {
#include "textures/segment2/segment2_cn.1CDB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CDC0[] = {
#include "textures/segment2/segment2_cn.1CDC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CDD0[] = {
#include "textures/segment2/segment2_cn.1CDD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CDE0[] = {
#include "textures/segment2/segment2_cn.1CDE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CDF0[] = {
#include "textures/segment2/segment2_cn.1CDF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE00[] = {
#include "textures/segment2/segment2_cn.1CE00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE10[] = {
#include "textures/segment2/segment2_cn.1CE10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE20[] = {
#include "textures/segment2/segment2_cn.1CE20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE30[] = {
#include "textures/segment2/segment2_cn.1CE30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE40[] = {
#include "textures/segment2/segment2_cn.1CE40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE50[] = {
#include "textures/segment2/segment2_cn.1CE50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE60[] = {
#include "textures/segment2/segment2_cn.1CE60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE70[] = {
#include "textures/segment2/segment2_cn.1CE70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE80[] = {
#include "textures/segment2/segment2_cn.1CE80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CE90[] = {
#include "textures/segment2/segment2_cn.1CE90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CEA0[] = {
#include "textures/segment2/segment2_cn.1CEA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CEB0[] = {
#include "textures/segment2/segment2_cn.1CEB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CEC0[] = {
#include "textures/segment2/segment2_cn.1CEC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CED0[] = {
#include "textures/segment2/segment2_cn.1CED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CEE0[] = {
#include "textures/segment2/segment2_cn.1CEE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CEF0[] = {
#include "textures/segment2/segment2_cn.1CEF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF00[] = {
#include "textures/segment2/segment2_cn.1CF00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF10[] = {
#include "textures/segment2/segment2_cn.1CF10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF20[] = {
#include "textures/segment2/segment2_cn.1CF20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF30[] = {
#include "textures/segment2/segment2_cn.1CF30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF40[] = {
#include "textures/segment2/segment2_cn.1CF40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF50[] = {
#include "textures/segment2/segment2_cn.1CF50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF60[] = {
#include "textures/segment2/segment2_cn.1CF60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF70[] = {
#include "textures/segment2/segment2_cn.1CF70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF80[] = {
#include "textures/segment2/segment2_cn.1CF80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CF90[] = {
#include "textures/segment2/segment2_cn.1CF90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CFA0[] = {
#include "textures/segment2/segment2_cn.1CFA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CFB0[] = {
#include "textures/segment2/segment2_cn.1CFB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CFC0[] = {
#include "textures/segment2/segment2_cn.1CFC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CFD0[] = {
#include "textures/segment2/segment2_cn.1CFD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CFE0[] = {
#include "textures/segment2/segment2_cn.1CFE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1CFF0[] = {
#include "textures/segment2/segment2_cn.1CFF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D000[] = {
#include "textures/segment2/segment2_cn.1D000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D010[] = {
#include "textures/segment2/segment2_cn.1D010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D020[] = {
#include "textures/segment2/segment2_cn.1D020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D030[] = {
#include "textures/segment2/segment2_cn.1D030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D040[] = {
#include "textures/segment2/segment2_cn.1D040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D050[] = {
#include "textures/segment2/segment2_cn.1D050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D060[] = {
#include "textures/segment2/segment2_cn.1D060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D070[] = {
#include "textures/segment2/segment2_cn.1D070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D080[] = {
#include "textures/segment2/segment2_cn.1D080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D090[] = {
#include "textures/segment2/segment2_cn.1D090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D0A0[] = {
#include "textures/segment2/segment2_cn.1D0A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D0B0[] = {
#include "textures/segment2/segment2_cn.1D0B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D0C0[] = {
#include "textures/segment2/segment2_cn.1D0C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D0D0[] = {
#include "textures/segment2/segment2_cn.1D0D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D0E0[] = {
#include "textures/segment2/segment2_cn.1D0E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D0F0[] = {
#include "textures/segment2/segment2_cn.1D0F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D100[] = {
#include "textures/segment2/segment2_cn.1D100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D110[] = {
#include "textures/segment2/segment2_cn.1D110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D120[] = {
#include "textures/segment2/segment2_cn.1D120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D130[] = {
#include "textures/segment2/segment2_cn.1D130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D140[] = {
#include "textures/segment2/segment2_cn.1D140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D150[] = {
#include "textures/segment2/segment2_cn.1D150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D160[] = {
#include "textures/segment2/segment2_cn.1D160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D170[] = {
#include "textures/segment2/segment2_cn.1D170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D180[] = {
#include "textures/segment2/segment2_cn.1D180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D190[] = {
#include "textures/segment2/segment2_cn.1D190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D1A0[] = {
#include "textures/segment2/segment2_cn.1D1A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D1B0[] = {
#include "textures/segment2/segment2_cn.1D1B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D1C0[] = {
#include "textures/segment2/segment2_cn.1D1C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D1D0[] = {
#include "textures/segment2/segment2_cn.1D1D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D1E0[] = {
#include "textures/segment2/segment2_cn.1D1E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D1F0[] = {
#include "textures/segment2/segment2_cn.1D1F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D200[] = {
#include "textures/segment2/segment2_cn.1D200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D210[] = {
#include "textures/segment2/segment2_cn.1D210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D220[] = {
#include "textures/segment2/segment2_cn.1D220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D230[] = {
#include "textures/segment2/segment2_cn.1D230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D240[] = {
#include "textures/segment2/segment2_cn.1D240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D250[] = {
#include "textures/segment2/segment2_cn.1D250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D260[] = {
#include "textures/segment2/segment2_cn.1D260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D270[] = {
#include "textures/segment2/segment2_cn.1D270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D280[] = {
#include "textures/segment2/segment2_cn.1D280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D290[] = {
#include "textures/segment2/segment2_cn.1D290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D2A0[] = {
#include "textures/segment2/segment2_cn.1D2A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D2B0[] = {
#include "textures/segment2/segment2_cn.1D2B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D2C0[] = {
#include "textures/segment2/segment2_cn.1D2C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D2D0[] = {
#include "textures/segment2/segment2_cn.1D2D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D2E0[] = {
#include "textures/segment2/segment2_cn.1D2E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D2F0[] = {
#include "textures/segment2/segment2_cn.1D2F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D300[] = {
#include "textures/segment2/segment2_cn.1D300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D310[] = {
#include "textures/segment2/segment2_cn.1D310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D320[] = {
#include "textures/segment2/segment2_cn.1D320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D330[] = {
#include "textures/segment2/segment2_cn.1D330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D340[] = {
#include "textures/segment2/segment2_cn.1D340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D350[] = {
#include "textures/segment2/segment2_cn.1D350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D360[] = {
#include "textures/segment2/segment2_cn.1D360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D370[] = {
#include "textures/segment2/segment2_cn.1D370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D380[] = {
#include "textures/segment2/segment2_cn.1D380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D390[] = {
#include "textures/segment2/segment2_cn.1D390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D3A0[] = {
#include "textures/segment2/segment2_cn.1D3A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D3B0[] = {
#include "textures/segment2/segment2_cn.1D3B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D3C0[] = {
#include "textures/segment2/segment2_cn.1D3C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D3D0[] = {
#include "textures/segment2/segment2_cn.1D3D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D3E0[] = {
#include "textures/segment2/segment2_cn.1D3E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D3F0[] = {
#include "textures/segment2/segment2_cn.1D3F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D400[] = {
#include "textures/segment2/segment2_cn.1D400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D410[] = {
#include "textures/segment2/segment2_cn.1D410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D420[] = {
#include "textures/segment2/segment2_cn.1D420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D430[] = {
#include "textures/segment2/segment2_cn.1D430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D440[] = {
#include "textures/segment2/segment2_cn.1D440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D450[] = {
#include "textures/segment2/segment2_cn.1D450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D460[] = {
#include "textures/segment2/segment2_cn.1D460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D470[] = {
#include "textures/segment2/segment2_cn.1D470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D480[] = {
#include "textures/segment2/segment2_cn.1D480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D490[] = {
#include "textures/segment2/segment2_cn.1D490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D4A0[] = {
#include "textures/segment2/segment2_cn.1D4A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D4B0[] = {
#include "textures/segment2/segment2_cn.1D4B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D4C0[] = {
#include "textures/segment2/segment2_cn.1D4C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D4D0[] = {
#include "textures/segment2/segment2_cn.1D4D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D4E0[] = {
#include "textures/segment2/segment2_cn.1D4E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D4F0[] = {
#include "textures/segment2/segment2_cn.1D4F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D500[] = {
#include "textures/segment2/segment2_cn.1D500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D510[] = {
#include "textures/segment2/segment2_cn.1D510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D520[] = {
#include "textures/segment2/segment2_cn.1D520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D530[] = {
#include "textures/segment2/segment2_cn.1D530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D540[] = {
#include "textures/segment2/segment2_cn.1D540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D550[] = {
#include "textures/segment2/segment2_cn.1D550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D560[] = {
#include "textures/segment2/segment2_cn.1D560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D570[] = {
#include "textures/segment2/segment2_cn.1D570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D580[] = {
#include "textures/segment2/segment2_cn.1D580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D590[] = {
#include "textures/segment2/segment2_cn.1D590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D5A0[] = {
#include "textures/segment2/segment2_cn.1D5A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D5B0[] = {
#include "textures/segment2/segment2_cn.1D5B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D5C0[] = {
#include "textures/segment2/segment2_cn.1D5C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D5D0[] = {
#include "textures/segment2/segment2_cn.1D5D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D5E0[] = {
#include "textures/segment2/segment2_cn.1D5E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D5F0[] = {
#include "textures/segment2/segment2_cn.1D5F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D600[] = {
#include "textures/segment2/segment2_cn.1D600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D610[] = {
#include "textures/segment2/segment2_cn.1D610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D620[] = {
#include "textures/segment2/segment2_cn.1D620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D630[] = {
#include "textures/segment2/segment2_cn.1D630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D640[] = {
#include "textures/segment2/segment2_cn.1D640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D650[] = {
#include "textures/segment2/segment2_cn.1D650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D660[] = {
#include "textures/segment2/segment2_cn.1D660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D670[] = {
#include "textures/segment2/segment2_cn.1D670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D680[] = {
#include "textures/segment2/segment2_cn.1D680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D690[] = {
#include "textures/segment2/segment2_cn.1D690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D6A0[] = {
#include "textures/segment2/segment2_cn.1D6A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D6B0[] = {
#include "textures/segment2/segment2_cn.1D6B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D6C0[] = {
#include "textures/segment2/segment2_cn.1D6C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D6D0[] = {
#include "textures/segment2/segment2_cn.1D6D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D6E0[] = {
#include "textures/segment2/segment2_cn.1D6E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D6F0[] = {
#include "textures/segment2/segment2_cn.1D6F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D700[] = {
#include "textures/segment2/segment2_cn.1D700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D710[] = {
#include "textures/segment2/segment2_cn.1D710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D720[] = {
#include "textures/segment2/segment2_cn.1D720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D730[] = {
#include "textures/segment2/segment2_cn.1D730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D740[] = {
#include "textures/segment2/segment2_cn.1D740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D750[] = {
#include "textures/segment2/segment2_cn.1D750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D760[] = {
#include "textures/segment2/segment2_cn.1D760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D770[] = {
#include "textures/segment2/segment2_cn.1D770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D780[] = {
#include "textures/segment2/segment2_cn.1D780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D790[] = {
#include "textures/segment2/segment2_cn.1D790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D7A0[] = {
#include "textures/segment2/segment2_cn.1D7A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D7B0[] = {
#include "textures/segment2/segment2_cn.1D7B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D7C0[] = {
#include "textures/segment2/segment2_cn.1D7C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D7D0[] = {
#include "textures/segment2/segment2_cn.1D7D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D7E0[] = {
#include "textures/segment2/segment2_cn.1D7E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D7F0[] = {
#include "textures/segment2/segment2_cn.1D7F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D800[] = {
#include "textures/segment2/segment2_cn.1D800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D810[] = {
#include "textures/segment2/segment2_cn.1D810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D820[] = {
#include "textures/segment2/segment2_cn.1D820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D830[] = {
#include "textures/segment2/segment2_cn.1D830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D840[] = {
#include "textures/segment2/segment2_cn.1D840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D850[] = {
#include "textures/segment2/segment2_cn.1D850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D860[] = {
#include "textures/segment2/segment2_cn.1D860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D870[] = {
#include "textures/segment2/segment2_cn.1D870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D880[] = {
#include "textures/segment2/segment2_cn.1D880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D890[] = {
#include "textures/segment2/segment2_cn.1D890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D8A0[] = {
#include "textures/segment2/segment2_cn.1D8A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D8B0[] = {
#include "textures/segment2/segment2_cn.1D8B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D8C0[] = {
#include "textures/segment2/segment2_cn.1D8C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D8D0[] = {
#include "textures/segment2/segment2_cn.1D8D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D8E0[] = {
#include "textures/segment2/segment2_cn.1D8E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D8F0[] = {
#include "textures/segment2/segment2_cn.1D8F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D900[] = {
#include "textures/segment2/segment2_cn.1D900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D910[] = {
#include "textures/segment2/segment2_cn.1D910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D920[] = {
#include "textures/segment2/segment2_cn.1D920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D930[] = {
#include "textures/segment2/segment2_cn.1D930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D940[] = {
#include "textures/segment2/segment2_cn.1D940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D950[] = {
#include "textures/segment2/segment2_cn.1D950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D960[] = {
#include "textures/segment2/segment2_cn.1D960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D970[] = {
#include "textures/segment2/segment2_cn.1D970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D980[] = {
#include "textures/segment2/segment2_cn.1D980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D990[] = {
#include "textures/segment2/segment2_cn.1D990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D9A0[] = {
#include "textures/segment2/segment2_cn.1D9A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D9B0[] = {
#include "textures/segment2/segment2_cn.1D9B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D9C0[] = {
#include "textures/segment2/segment2_cn.1D9C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D9D0[] = {
#include "textures/segment2/segment2_cn.1D9D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D9E0[] = {
#include "textures/segment2/segment2_cn.1D9E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1D9F0[] = {
#include "textures/segment2/segment2_cn.1D9F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA00[] = {
#include "textures/segment2/segment2_cn.1DA00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA10[] = {
#include "textures/segment2/segment2_cn.1DA10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA20[] = {
#include "textures/segment2/segment2_cn.1DA20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA30[] = {
#include "textures/segment2/segment2_cn.1DA30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA40[] = {
#include "textures/segment2/segment2_cn.1DA40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA50[] = {
#include "textures/segment2/segment2_cn.1DA50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA60[] = {
#include "textures/segment2/segment2_cn.1DA60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA70[] = {
#include "textures/segment2/segment2_cn.1DA70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA80[] = {
#include "textures/segment2/segment2_cn.1DA80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DA90[] = {
#include "textures/segment2/segment2_cn.1DA90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DAA0[] = {
#include "textures/segment2/segment2_cn.1DAA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DAB0[] = {
#include "textures/segment2/segment2_cn.1DAB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DAC0[] = {
#include "textures/segment2/segment2_cn.1DAC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DAD0[] = {
#include "textures/segment2/segment2_cn.1DAD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DAE0[] = {
#include "textures/segment2/segment2_cn.1DAE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DAF0[] = {
#include "textures/segment2/segment2_cn.1DAF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB00[] = {
#include "textures/segment2/segment2_cn.1DB00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB10[] = {
#include "textures/segment2/segment2_cn.1DB10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB20[] = {
#include "textures/segment2/segment2_cn.1DB20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB30[] = {
#include "textures/segment2/segment2_cn.1DB30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB40[] = {
#include "textures/segment2/segment2_cn.1DB40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB50[] = {
#include "textures/segment2/segment2_cn.1DB50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB60[] = {
#include "textures/segment2/segment2_cn.1DB60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB70[] = {
#include "textures/segment2/segment2_cn.1DB70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB80[] = {
#include "textures/segment2/segment2_cn.1DB80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DB90[] = {
#include "textures/segment2/segment2_cn.1DB90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DBA0[] = {
#include "textures/segment2/segment2_cn.1DBA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DBB0[] = {
#include "textures/segment2/segment2_cn.1DBB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DBC0[] = {
#include "textures/segment2/segment2_cn.1DBC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DBD0[] = {
#include "textures/segment2/segment2_cn.1DBD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DBE0[] = {
#include "textures/segment2/segment2_cn.1DBE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DBF0[] = {
#include "textures/segment2/segment2_cn.1DBF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC00[] = {
#include "textures/segment2/segment2_cn.1DC00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC10[] = {
#include "textures/segment2/segment2_cn.1DC10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC20[] = {
#include "textures/segment2/segment2_cn.1DC20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC30[] = {
#include "textures/segment2/segment2_cn.1DC30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC40[] = {
#include "textures/segment2/segment2_cn.1DC40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC50[] = {
#include "textures/segment2/segment2_cn.1DC50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC60[] = {
#include "textures/segment2/segment2_cn.1DC60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC70[] = {
#include "textures/segment2/segment2_cn.1DC70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC80[] = {
#include "textures/segment2/segment2_cn.1DC80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DC90[] = {
#include "textures/segment2/segment2_cn.1DC90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DCA0[] = {
#include "textures/segment2/segment2_cn.1DCA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DCB0[] = {
#include "textures/segment2/segment2_cn.1DCB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DCC0[] = {
#include "textures/segment2/segment2_cn.1DCC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DCD0[] = {
#include "textures/segment2/segment2_cn.1DCD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DCE0[] = {
#include "textures/segment2/segment2_cn.1DCE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DCF0[] = {
#include "textures/segment2/segment2_cn.1DCF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD00[] = {
#include "textures/segment2/segment2_cn.1DD00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD10[] = {
#include "textures/segment2/segment2_cn.1DD10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD20[] = {
#include "textures/segment2/segment2_cn.1DD20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD30[] = {
#include "textures/segment2/segment2_cn.1DD30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD40[] = {
#include "textures/segment2/segment2_cn.1DD40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD50[] = {
#include "textures/segment2/segment2_cn.1DD50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD60[] = {
#include "textures/segment2/segment2_cn.1DD60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD70[] = {
#include "textures/segment2/segment2_cn.1DD70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD80[] = {
#include "textures/segment2/segment2_cn.1DD80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DD90[] = {
#include "textures/segment2/segment2_cn.1DD90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DDA0[] = {
#include "textures/segment2/segment2_cn.1DDA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DDB0[] = {
#include "textures/segment2/segment2_cn.1DDB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DDC0[] = {
#include "textures/segment2/segment2_cn.1DDC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DDD0[] = {
#include "textures/segment2/segment2_cn.1DDD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DDE0[] = {
#include "textures/segment2/segment2_cn.1DDE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DDF0[] = {
#include "textures/segment2/segment2_cn.1DDF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE00[] = {
#include "textures/segment2/segment2_cn.1DE00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE10[] = {
#include "textures/segment2/segment2_cn.1DE10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE20[] = {
#include "textures/segment2/segment2_cn.1DE20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE30[] = {
#include "textures/segment2/segment2_cn.1DE30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE40[] = {
#include "textures/segment2/segment2_cn.1DE40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE50[] = {
#include "textures/segment2/segment2_cn.1DE50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE60[] = {
#include "textures/segment2/segment2_cn.1DE60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE70[] = {
#include "textures/segment2/segment2_cn.1DE70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE80[] = {
#include "textures/segment2/segment2_cn.1DE80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DE90[] = {
#include "textures/segment2/segment2_cn.1DE90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DEA0[] = {
#include "textures/segment2/segment2_cn.1DEA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DEB0[] = {
#include "textures/segment2/segment2_cn.1DEB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DEC0[] = {
#include "textures/segment2/segment2_cn.1DEC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DED0[] = {
#include "textures/segment2/segment2_cn.1DED0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DEE0[] = {
#include "textures/segment2/segment2_cn.1DEE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DEF0[] = {
#include "textures/segment2/segment2_cn.1DEF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF00[] = {
#include "textures/segment2/segment2_cn.1DF00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF10[] = {
#include "textures/segment2/segment2_cn.1DF10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF20[] = {
#include "textures/segment2/segment2_cn.1DF20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF30[] = {
#include "textures/segment2/segment2_cn.1DF30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF40[] = {
#include "textures/segment2/segment2_cn.1DF40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF50[] = {
#include "textures/segment2/segment2_cn.1DF50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF60[] = {
#include "textures/segment2/segment2_cn.1DF60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF70[] = {
#include "textures/segment2/segment2_cn.1DF70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF80[] = {
#include "textures/segment2/segment2_cn.1DF80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DF90[] = {
#include "textures/segment2/segment2_cn.1DF90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DFA0[] = {
#include "textures/segment2/segment2_cn.1DFA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DFB0[] = {
#include "textures/segment2/segment2_cn.1DFB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DFC0[] = {
#include "textures/segment2/segment2_cn.1DFC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DFD0[] = {
#include "textures/segment2/segment2_cn.1DFD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DFE0[] = {
#include "textures/segment2/segment2_cn.1DFE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1DFF0[] = {
#include "textures/segment2/segment2_cn.1DFF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E000[] = {
#include "textures/segment2/segment2_cn.1E000.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E010[] = {
#include "textures/segment2/segment2_cn.1E010.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E020[] = {
#include "textures/segment2/segment2_cn.1E020.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E030[] = {
#include "textures/segment2/segment2_cn.1E030.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E040[] = {
#include "textures/segment2/segment2_cn.1E040.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E050[] = {
#include "textures/segment2/segment2_cn.1E050.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E060[] = {
#include "textures/segment2/segment2_cn.1E060.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E070[] = {
#include "textures/segment2/segment2_cn.1E070.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E080[] = {
#include "textures/segment2/segment2_cn.1E080.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E090[] = {
#include "textures/segment2/segment2_cn.1E090.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E0A0[] = {
#include "textures/segment2/segment2_cn.1E0A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E0B0[] = {
#include "textures/segment2/segment2_cn.1E0B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E0C0[] = {
#include "textures/segment2/segment2_cn.1E0C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E0D0[] = {
#include "textures/segment2/segment2_cn.1E0D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E0E0[] = {
#include "textures/segment2/segment2_cn.1E0E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E0F0[] = {
#include "textures/segment2/segment2_cn.1E0F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E100[] = {
#include "textures/segment2/segment2_cn.1E100.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E110[] = {
#include "textures/segment2/segment2_cn.1E110.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E120[] = {
#include "textures/segment2/segment2_cn.1E120.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E130[] = {
#include "textures/segment2/segment2_cn.1E130.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E140[] = {
#include "textures/segment2/segment2_cn.1E140.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E150[] = {
#include "textures/segment2/segment2_cn.1E150.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E160[] = {
#include "textures/segment2/segment2_cn.1E160.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E170[] = {
#include "textures/segment2/segment2_cn.1E170.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E180[] = {
#include "textures/segment2/segment2_cn.1E180.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E190[] = {
#include "textures/segment2/segment2_cn.1E190.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E1A0[] = {
#include "textures/segment2/segment2_cn.1E1A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E1B0[] = {
#include "textures/segment2/segment2_cn.1E1B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E1C0[] = {
#include "textures/segment2/segment2_cn.1E1C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E1D0[] = {
#include "textures/segment2/segment2_cn.1E1D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E1E0[] = {
#include "textures/segment2/segment2_cn.1E1E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E1F0[] = {
#include "textures/segment2/segment2_cn.1E1F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E200[] = {
#include "textures/segment2/segment2_cn.1E200.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E210[] = {
#include "textures/segment2/segment2_cn.1E210.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E220[] = {
#include "textures/segment2/segment2_cn.1E220.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E230[] = {
#include "textures/segment2/segment2_cn.1E230.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E240[] = {
#include "textures/segment2/segment2_cn.1E240.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E250[] = {
#include "textures/segment2/segment2_cn.1E250.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E260[] = {
#include "textures/segment2/segment2_cn.1E260.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E270[] = {
#include "textures/segment2/segment2_cn.1E270.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E280[] = {
#include "textures/segment2/segment2_cn.1E280.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E290[] = {
#include "textures/segment2/segment2_cn.1E290.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E2A0[] = {
#include "textures/segment2/segment2_cn.1E2A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E2B0[] = {
#include "textures/segment2/segment2_cn.1E2B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E2C0[] = {
#include "textures/segment2/segment2_cn.1E2C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E2D0[] = {
#include "textures/segment2/segment2_cn.1E2D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E2E0[] = {
#include "textures/segment2/segment2_cn.1E2E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E2F0[] = {
#include "textures/segment2/segment2_cn.1E2F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E300[] = {
#include "textures/segment2/segment2_cn.1E300.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E310[] = {
#include "textures/segment2/segment2_cn.1E310.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E320[] = {
#include "textures/segment2/segment2_cn.1E320.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E330[] = {
#include "textures/segment2/segment2_cn.1E330.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E340[] = {
#include "textures/segment2/segment2_cn.1E340.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E350[] = {
#include "textures/segment2/segment2_cn.1E350.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E360[] = {
#include "textures/segment2/segment2_cn.1E360.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E370[] = {
#include "textures/segment2/segment2_cn.1E370.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E380[] = {
#include "textures/segment2/segment2_cn.1E380.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E390[] = {
#include "textures/segment2/segment2_cn.1E390.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E3A0[] = {
#include "textures/segment2/segment2_cn.1E3A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E3B0[] = {
#include "textures/segment2/segment2_cn.1E3B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E3C0[] = {
#include "textures/segment2/segment2_cn.1E3C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E3D0[] = {
#include "textures/segment2/segment2_cn.1E3D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E3E0[] = {
#include "textures/segment2/segment2_cn.1E3E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E3F0[] = {
#include "textures/segment2/segment2_cn.1E3F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E400[] = {
#include "textures/segment2/segment2_cn.1E400.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E410[] = {
#include "textures/segment2/segment2_cn.1E410.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E420[] = {
#include "textures/segment2/segment2_cn.1E420.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E430[] = {
#include "textures/segment2/segment2_cn.1E430.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E440[] = {
#include "textures/segment2/segment2_cn.1E440.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E450[] = {
#include "textures/segment2/segment2_cn.1E450.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E460[] = {
#include "textures/segment2/segment2_cn.1E460.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E470[] = {
#include "textures/segment2/segment2_cn.1E470.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E480[] = {
#include "textures/segment2/segment2_cn.1E480.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E490[] = {
#include "textures/segment2/segment2_cn.1E490.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E4A0[] = {
#include "textures/segment2/segment2_cn.1E4A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E4B0[] = {
#include "textures/segment2/segment2_cn.1E4B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E4C0[] = {
#include "textures/segment2/segment2_cn.1E4C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E4D0[] = {
#include "textures/segment2/segment2_cn.1E4D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E4E0[] = {
#include "textures/segment2/segment2_cn.1E4E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E4F0[] = {
#include "textures/segment2/segment2_cn.1E4F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E500[] = {
#include "textures/segment2/segment2_cn.1E500.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E510[] = {
#include "textures/segment2/segment2_cn.1E510.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E520[] = {
#include "textures/segment2/segment2_cn.1E520.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E530[] = {
#include "textures/segment2/segment2_cn.1E530.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E540[] = {
#include "textures/segment2/segment2_cn.1E540.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E550[] = {
#include "textures/segment2/segment2_cn.1E550.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E560[] = {
#include "textures/segment2/segment2_cn.1E560.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E570[] = {
#include "textures/segment2/segment2_cn.1E570.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E580[] = {
#include "textures/segment2/segment2_cn.1E580.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E590[] = {
#include "textures/segment2/segment2_cn.1E590.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E5A0[] = {
#include "textures/segment2/segment2_cn.1E5A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E5B0[] = {
#include "textures/segment2/segment2_cn.1E5B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E5C0[] = {
#include "textures/segment2/segment2_cn.1E5C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E5D0[] = {
#include "textures/segment2/segment2_cn.1E5D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E5E0[] = {
#include "textures/segment2/segment2_cn.1E5E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E5F0[] = {
#include "textures/segment2/segment2_cn.1E5F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E600[] = {
#include "textures/segment2/segment2_cn.1E600.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E610[] = {
#include "textures/segment2/segment2_cn.1E610.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E620[] = {
#include "textures/segment2/segment2_cn.1E620.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E630[] = {
#include "textures/segment2/segment2_cn.1E630.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E640[] = {
#include "textures/segment2/segment2_cn.1E640.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E650[] = {
#include "textures/segment2/segment2_cn.1E650.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E660[] = {
#include "textures/segment2/segment2_cn.1E660.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E670[] = {
#include "textures/segment2/segment2_cn.1E670.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E680[] = {
#include "textures/segment2/segment2_cn.1E680.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E690[] = {
#include "textures/segment2/segment2_cn.1E690.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E6A0[] = {
#include "textures/segment2/segment2_cn.1E6A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E6B0[] = {
#include "textures/segment2/segment2_cn.1E6B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E6C0[] = {
#include "textures/segment2/segment2_cn.1E6C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E6D0[] = {
#include "textures/segment2/segment2_cn.1E6D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E6E0[] = {
#include "textures/segment2/segment2_cn.1E6E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E6F0[] = {
#include "textures/segment2/segment2_cn.1E6F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E700[] = {
#include "textures/segment2/segment2_cn.1E700.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E710[] = {
#include "textures/segment2/segment2_cn.1E710.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E720[] = {
#include "textures/segment2/segment2_cn.1E720.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E730[] = {
#include "textures/segment2/segment2_cn.1E730.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E740[] = {
#include "textures/segment2/segment2_cn.1E740.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E750[] = {
#include "textures/segment2/segment2_cn.1E750.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E760[] = {
#include "textures/segment2/segment2_cn.1E760.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E770[] = {
#include "textures/segment2/segment2_cn.1E770.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E780[] = {
#include "textures/segment2/segment2_cn.1E780.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E790[] = {
#include "textures/segment2/segment2_cn.1E790.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E7A0[] = {
#include "textures/segment2/segment2_cn.1E7A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E7B0[] = {
#include "textures/segment2/segment2_cn.1E7B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E7C0[] = {
#include "textures/segment2/segment2_cn.1E7C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E7D0[] = {
#include "textures/segment2/segment2_cn.1E7D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E7E0[] = {
#include "textures/segment2/segment2_cn.1E7E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E7F0[] = {
#include "textures/segment2/segment2_cn.1E7F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E800[] = {
#include "textures/segment2/segment2_cn.1E800.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E810[] = {
#include "textures/segment2/segment2_cn.1E810.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E820[] = {
#include "textures/segment2/segment2_cn.1E820.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E830[] = {
#include "textures/segment2/segment2_cn.1E830.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E840[] = {
#include "textures/segment2/segment2_cn.1E840.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E850[] = {
#include "textures/segment2/segment2_cn.1E850.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E860[] = {
#include "textures/segment2/segment2_cn.1E860.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E870[] = {
#include "textures/segment2/segment2_cn.1E870.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E880[] = {
#include "textures/segment2/segment2_cn.1E880.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E890[] = {
#include "textures/segment2/segment2_cn.1E890.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E8A0[] = {
#include "textures/segment2/segment2_cn.1E8A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E8B0[] = {
#include "textures/segment2/segment2_cn.1E8B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E8C0[] = {
#include "textures/segment2/segment2_cn.1E8C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E8D0[] = {
#include "textures/segment2/segment2_cn.1E8D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E8E0[] = {
#include "textures/segment2/segment2_cn.1E8E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E8F0[] = {
#include "textures/segment2/segment2_cn.1E8F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E900[] = {
#include "textures/segment2/segment2_cn.1E900.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E910[] = {
#include "textures/segment2/segment2_cn.1E910.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E920[] = {
#include "textures/segment2/segment2_cn.1E920.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E930[] = {
#include "textures/segment2/segment2_cn.1E930.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E940[] = {
#include "textures/segment2/segment2_cn.1E940.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E950[] = {
#include "textures/segment2/segment2_cn.1E950.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E960[] = {
#include "textures/segment2/segment2_cn.1E960.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E970[] = {
#include "textures/segment2/segment2_cn.1E970.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E980[] = {
#include "textures/segment2/segment2_cn.1E980.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E990[] = {
#include "textures/segment2/segment2_cn.1E990.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E9A0[] = {
#include "textures/segment2/segment2_cn.1E9A0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E9B0[] = {
#include "textures/segment2/segment2_cn.1E9B0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E9C0[] = {
#include "textures/segment2/segment2_cn.1E9C0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E9D0[] = {
#include "textures/segment2/segment2_cn.1E9D0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E9E0[] = {
#include "textures/segment2/segment2_cn.1E9E0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1E9F0[] = {
#include "textures/segment2/segment2_cn.1E9F0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA00[] = {
#include "textures/segment2/segment2_cn.1EA00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA10[] = {
#include "textures/segment2/segment2_cn.1EA10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA20[] = {
#include "textures/segment2/segment2_cn.1EA20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA30[] = {
#include "textures/segment2/segment2_cn.1EA30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA40[] = {
#include "textures/segment2/segment2_cn.1EA40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA50[] = {
#include "textures/segment2/segment2_cn.1EA50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA60[] = {
#include "textures/segment2/segment2_cn.1EA60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA70[] = {
#include "textures/segment2/segment2_cn.1EA70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA80[] = {
#include "textures/segment2/segment2_cn.1EA80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EA90[] = {
#include "textures/segment2/segment2_cn.1EA90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EAA0[] = {
#include "textures/segment2/segment2_cn.1EAA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EAB0[] = {
#include "textures/segment2/segment2_cn.1EAB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EAC0[] = {
#include "textures/segment2/segment2_cn.1EAC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EAD0[] = {
#include "textures/segment2/segment2_cn.1EAD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EAE0[] = {
#include "textures/segment2/segment2_cn.1EAE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EAF0[] = {
#include "textures/segment2/segment2_cn.1EAF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB00[] = {
#include "textures/segment2/segment2_cn.1EB00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB10[] = {
#include "textures/segment2/segment2_cn.1EB10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB20[] = {
#include "textures/segment2/segment2_cn.1EB20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB30[] = {
#include "textures/segment2/segment2_cn.1EB30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB40[] = {
#include "textures/segment2/segment2_cn.1EB40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB50[] = {
#include "textures/segment2/segment2_cn.1EB50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB60[] = {
#include "textures/segment2/segment2_cn.1EB60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB70[] = {
#include "textures/segment2/segment2_cn.1EB70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB80[] = {
#include "textures/segment2/segment2_cn.1EB80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EB90[] = {
#include "textures/segment2/segment2_cn.1EB90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EBA0[] = {
#include "textures/segment2/segment2_cn.1EBA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EBB0[] = {
#include "textures/segment2/segment2_cn.1EBB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EBC0[] = {
#include "textures/segment2/segment2_cn.1EBC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EBD0[] = {
#include "textures/segment2/segment2_cn.1EBD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EBE0[] = {
#include "textures/segment2/segment2_cn.1EBE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EBF0[] = {
#include "textures/segment2/segment2_cn.1EBF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC00[] = {
#include "textures/segment2/segment2_cn.1EC00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC10[] = {
#include "textures/segment2/segment2_cn.1EC10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC20[] = {
#include "textures/segment2/segment2_cn.1EC20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC30[] = {
#include "textures/segment2/segment2_cn.1EC30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC40[] = {
#include "textures/segment2/segment2_cn.1EC40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC50[] = {
#include "textures/segment2/segment2_cn.1EC50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC60[] = {
#include "textures/segment2/segment2_cn.1EC60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC70[] = {
#include "textures/segment2/segment2_cn.1EC70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC80[] = {
#include "textures/segment2/segment2_cn.1EC80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EC90[] = {
#include "textures/segment2/segment2_cn.1EC90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ECA0[] = {
#include "textures/segment2/segment2_cn.1ECA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ECB0[] = {
#include "textures/segment2/segment2_cn.1ECB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ECC0[] = {
#include "textures/segment2/segment2_cn.1ECC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ECD0[] = {
#include "textures/segment2/segment2_cn.1ECD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ECE0[] = {
#include "textures/segment2/segment2_cn.1ECE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ECF0[] = {
#include "textures/segment2/segment2_cn.1ECF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED00[] = {
#include "textures/segment2/segment2_cn.1ED00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED10[] = {
#include "textures/segment2/segment2_cn.1ED10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED20[] = {
#include "textures/segment2/segment2_cn.1ED20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED30[] = {
#include "textures/segment2/segment2_cn.1ED30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED40[] = {
#include "textures/segment2/segment2_cn.1ED40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED50[] = {
#include "textures/segment2/segment2_cn.1ED50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED60[] = {
#include "textures/segment2/segment2_cn.1ED60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED70[] = {
#include "textures/segment2/segment2_cn.1ED70.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED80[] = {
#include "textures/segment2/segment2_cn.1ED80.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1ED90[] = {
#include "textures/segment2/segment2_cn.1ED90.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EDA0[] = {
#include "textures/segment2/segment2_cn.1EDA0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EDB0[] = {
#include "textures/segment2/segment2_cn.1EDB0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EDC0[] = {
#include "textures/segment2/segment2_cn.1EDC0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EDD0[] = {
#include "textures/segment2/segment2_cn.1EDD0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EDE0[] = {
#include "textures/segment2/segment2_cn.1EDE0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EDF0[] = {
#include "textures/segment2/segment2_cn.1EDF0.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE00[] = {
#include "textures/segment2/segment2_cn.1EE00.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE10[] = {
#include "textures/segment2/segment2_cn.1EE10.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE20[] = {
#include "textures/segment2/segment2_cn.1EE20.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE30[] = {
#include "textures/segment2/segment2_cn.1EE30.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE40[] = {
#include "textures/segment2/segment2_cn.1EE40.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE50[] = {
#include "textures/segment2/segment2_cn.1EE50.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE60[] = {
#include "textures/segment2/segment2_cn.1EE60.ia1.inc.c"
};

ALIGNED8 static const Texture texture_font_char_cn_1EE70[] = {
#include "textures/segment2/segment2_cn.1EE70.ia1.inc.c"
};
#endif // VERSION_CN

ALIGNED8 static const Texture texture_hud_char_camera[] = {
#include "textures/segment2/segment2.07B50.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_lakitu[] = {
#include "textures/segment2/segment2.07D50.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_no_camera[] = {
#include "textures/segment2/segment2.07F50.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_arrow_up[] = {
#include "textures/segment2/segment2.08150.rgba16.inc.c"
};

ALIGNED8 static const Texture texture_hud_char_arrow_down[] = {
#include "textures/segment2/segment2.081D0.rgba16.inc.c"
};

// Main HUD print table 0x02008250-0x02008337
const Texture *const main_hud_lut[] = {
    texture_hud_char_0, texture_hud_char_1, texture_hud_char_2, texture_hud_char_3,
    texture_hud_char_4, texture_hud_char_5, texture_hud_char_6, texture_hud_char_7,
    texture_hud_char_8, texture_hud_char_9, texture_hud_char_A, texture_hud_char_B,
    texture_hud_char_C, texture_hud_char_D, texture_hud_char_E, texture_hud_char_F,
#if defined(VERSION_EU)
    texture_hud_char_G, texture_hud_char_H, texture_hud_char_I,                0x0,
    texture_hud_char_K, texture_hud_char_L, texture_hud_char_M, texture_hud_char_N,
    texture_hud_char_O, texture_hud_char_P,                0x0, texture_hud_char_R,
    texture_hud_char_S, texture_hud_char_T, texture_hud_char_U, texture_hud_char_V,
    texture_hud_char_W,                0x0, texture_hud_char_Y, texture_hud_char_Z,
                   0x0,                0x0,                0x0,                0x0,
                   0x0,                0x0,                0x0,                0x0,
                   0x0,                0x0,                0x0,                0x0,
                   0x0,                0x0, texture_hud_char_multiply, texture_hud_char_coin,
    texture_hud_char_mario_head, texture_hud_char_star,    0x0,                0x0,
    texture_hud_char_apostrophe, texture_hud_char_double_quote, texture_hud_char_umlaut,
#elif defined(VERSION_CN) || defined(VERSION_US)
    texture_hud_char_G, texture_hud_char_H, texture_hud_char_I,                0x0,
    texture_hud_char_K, texture_hud_char_L, texture_hud_char_M, texture_hud_char_N,
    texture_hud_char_O, texture_hud_char_P,                0x0, texture_hud_char_R,
    texture_hud_char_S, texture_hud_char_T, texture_hud_char_U,                0x0,
    texture_hud_char_W,                0x0, texture_hud_char_Y,                0x0,
                  0x0,                 0x0,                0x0,                0x0,
                  0x0,                 0x0,                0x0,                0x0,
                  0x0,                 0x0,                0x0,                0x0,
                  0x0,                 0x0, texture_hud_char_multiply, texture_hud_char_coin,
    texture_hud_char_mario_head, texture_hud_char_star,               0x0,               0x0,
    texture_hud_char_apostrophe, texture_hud_char_double_quote,
#if defined(VERSION_CN)
    texture_hud_char_cn_04A00, texture_hud_char_cn_04C00, texture_hud_char_cn_04E00, texture_hud_char_cn_05000,
    texture_hud_char_cn_05200, texture_hud_char_cn_05400, texture_hud_char_cn_05600, texture_hud_char_cn_05800,
    texture_hud_char_cn_05A00, texture_hud_char_cn_05C00, texture_hud_char_cn_05E00, texture_hud_char_cn_06000,
    texture_hud_char_cn_06200, texture_hud_char_cn_06400, texture_hud_char_cn_06600, texture_hud_char_cn_06800,
    texture_hud_char_cn_06A00, texture_hud_char_cn_06C00, texture_hud_char_cn_06E00, texture_hud_char_cn_07000,
    texture_hud_char_cn_07200, texture_hud_char_cn_07400, texture_hud_char_cn_07600, texture_hud_char_cn_07800,
    texture_hud_char_cn_07A00, texture_hud_char_cn_07C00, texture_hud_char_cn_07E00, texture_hud_char_cn_08000,
    texture_hud_char_cn_08200, texture_hud_char_cn_08400, texture_hud_char_cn_08600, texture_hud_char_cn_08800,
    texture_hud_char_cn_08A00, texture_hud_char_cn_08C00, texture_hud_char_cn_08E00, texture_hud_char_cn_09000,
    texture_hud_char_cn_09200, texture_hud_char_cn_09400, texture_hud_char_cn_09600, texture_hud_char_cn_09800,
    texture_hud_char_cn_09A00, texture_hud_char_cn_09C00, texture_hud_char_cn_09E00, texture_hud_char_cn_0A000,
    texture_hud_char_cn_0A200, texture_hud_char_cn_0A400, texture_hud_char_cn_0A600, texture_hud_char_cn_0A800,
    texture_hud_char_cn_0AA00, texture_hud_char_cn_0AC00, texture_hud_char_cn_0AE00, texture_hud_char_cn_0B000,
    texture_hud_char_cn_0B200, texture_hud_char_cn_0B400, texture_hud_char_cn_0B600, texture_hud_char_cn_0B800,
    texture_hud_char_cn_0BA00, texture_hud_char_cn_0BC00, texture_hud_char_cn_0BE00, texture_hud_char_cn_0C000,
    texture_hud_char_cn_0C200, texture_hud_char_cn_0C400, texture_hud_char_cn_0C600, texture_hud_char_cn_0C800,
    texture_hud_char_cn_0CA00, texture_hud_char_cn_0CC00, texture_hud_char_cn_0CE00, texture_hud_char_cn_0D000,
    texture_hud_char_cn_0D200, texture_hud_char_cn_0D400, texture_hud_char_cn_0D600, texture_hud_char_cn_0D800,
    texture_hud_char_cn_0DA00, texture_hud_char_cn_0DC00, texture_hud_char_cn_0DE00, texture_hud_char_cn_0E000,
    texture_hud_char_cn_0E200, texture_hud_char_cn_0E400, texture_hud_char_cn_0E600, texture_hud_char_cn_0E800,
    texture_hud_char_cn_0EA00, texture_hud_char_cn_0EC00, texture_hud_char_cn_0EE00, texture_hud_char_cn_0F000,
    texture_hud_char_cn_0F200, texture_hud_char_cn_0F400, texture_hud_char_cn_0F600, texture_hud_char_cn_0F800,
    texture_hud_char_cn_0FA00, texture_hud_char_cn_0FC00, texture_hud_char_cn_0FE00, texture_hud_char_cn_10000,
    texture_hud_char_cn_10200, texture_hud_char_cn_10400, texture_hud_char_cn_10600, texture_hud_char_cn_10800,
    texture_hud_char_cn_10A00, texture_hud_char_cn_10C00, texture_hud_char_cn_10E00, texture_hud_char_cn_11000,
    texture_hud_char_cn_11200, texture_hud_char_cn_11400, texture_hud_char_cn_11600, texture_hud_char_cn_11800,
    texture_hud_char_cn_11A00, texture_hud_char_cn_11C00, texture_hud_char_cn_11E00, texture_hud_char_cn_12000,
    texture_hud_char_cn_12200, texture_hud_char_cn_12400, texture_hud_char_cn_12600, texture_hud_char_cn_12800,
    texture_hud_char_cn_12A00, texture_hud_char_cn_12C00, texture_hud_char_cn_12E00, texture_hud_char_cn_13000,
    texture_hud_char_cn_13200, texture_hud_char_cn_13400, texture_hud_char_cn_13600, texture_hud_char_cn_13800,
    texture_hud_char_cn_13A00, texture_hud_char_cn_13C00, texture_hud_char_cn_13E00, texture_hud_char_cn_14000,
#endif // VERSION_CN
#else
    texture_hud_char_G, texture_hud_char_H, texture_hud_char_I, texture_hud_char_J,
    texture_hud_char_K, texture_hud_char_L, texture_hud_char_M, texture_hud_char_N,
    texture_hud_char_O, texture_hud_char_P, texture_hud_char_Q, texture_hud_char_R,
    texture_hud_char_S, texture_hud_char_T, texture_hud_char_U, texture_hud_char_V,
    texture_hud_char_W, texture_hud_char_X, texture_hud_char_Y, texture_hud_char_Z,
    texture_hud_char_exclamation, texture_hud_char_double_exclamation, texture_hud_char_question, texture_hud_char_ampersand,
    texture_hud_char_percent,                 0x0,                      0x0,                  0x0,
                      0x0,                   0x0,                      0x0,                  0x0,
                      0x0,                   0x0, texture_hud_char_multiply, texture_hud_char_coin,
    texture_hud_char_mario_head, texture_hud_char_star, texture_hud_char_decimal_point, texture_hud_char_beta_key,
    texture_hud_char_apostrophe, texture_hud_char_double_quote,
#endif
};

// Main small font print table 0x02008338-0x02008737
const Texture *const main_font_lut[] = {
#ifdef VERSION_EU // EU Font Table
    texture_font_char_eu_0, texture_font_char_eu_1, texture_font_char_eu_2, texture_font_char_eu_3,
    texture_font_char_eu_4, texture_font_char_eu_5, texture_font_char_eu_6, texture_font_char_eu_7,
    texture_font_char_eu_8, texture_font_char_eu_9, texture_font_char_eu_A, texture_font_char_eu_B,
    texture_font_char_eu_C, texture_font_char_eu_D, texture_font_char_eu_E, texture_font_char_eu_F,
    texture_font_char_eu_G, texture_font_char_eu_H, texture_font_char_eu_I, texture_font_char_eu_J,
    texture_font_char_eu_K, texture_font_char_eu_L, texture_font_char_eu_M, texture_font_char_eu_N,
    texture_font_char_eu_O, texture_font_char_eu_P, texture_font_char_eu_Q, texture_font_char_eu_R,
    texture_font_char_eu_S, texture_font_char_eu_T, texture_font_char_eu_U, texture_font_char_eu_V,
    texture_font_char_eu_W, texture_font_char_eu_X, texture_font_char_eu_Y, texture_font_char_eu_Z,
    texture_font_char_eu_a, texture_font_char_eu_b, texture_font_char_eu_c, texture_font_char_eu_d,
    texture_font_char_eu_e, texture_font_char_eu_f, texture_font_char_eu_g, texture_font_char_eu_h,
    texture_font_char_eu_i, texture_font_char_eu_j, texture_font_char_eu_k, texture_font_char_eu_l,
    texture_font_char_eu_m, texture_font_char_eu_n, texture_font_char_eu_o, texture_font_char_eu_p,
    texture_font_char_eu_q, texture_font_char_eu_r, texture_font_char_eu_s, texture_font_char_eu_t,
    texture_font_char_eu_u, texture_font_char_eu_v, texture_font_char_eu_w, texture_font_char_eu_x,
    texture_font_char_eu_y, texture_font_char_eu_z, texture_font_char_eu_apostrophe, texture_font_char_eu_period,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    texture_font_char_eu_button_C_up,
    texture_font_char_eu_button_C_down,
    texture_font_char_eu_button_C_left,
    texture_font_char_eu_button_C_right,
    texture_font_char_eu_button_A,
    texture_font_char_eu_button_B,
    texture_font_char_eu_button_C,
    texture_font_char_eu_button_Z,
    texture_font_char_eu_button_R,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    texture_font_char_eu_comma,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    texture_font_char_EU_slash,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0,
    texture_font_char_eu_open_parentheses,
    texture_font_char_eu_close_open_parentheses,
    texture_font_char_eu_close_parentheses,
    texture_font_char_eu_left_right_arrow,
    texture_font_char_eu_ampersand,
    texture_font_char_eu_colon,
    texture_font_char_eu_acute,
    texture_font_char_eu_circumflex,
    texture_font_char_eu_umlaut,
    texture_font_char_eu_grave,
    texture_font_char_eu_unknown,
    texture_font_char_eu_eszeet,
    texture_font_char_eu_Cedilla,
    texture_font_char_eu_cedilla,
    0x0, 0x0, 0x0,
    texture_font_char_eu_exclamation,
    texture_font_char_eu_percent,
    texture_font_char_eu_question,
    texture_font_char_eu_double_quote_open,
    texture_font_char_eu_double_quote_close,
    texture_font_char_eu_tilde,
    0x0,
    texture_font_char_eu_coin,
    texture_font_char_eu_star_filled,
    texture_font_char_eu_multiply,
    texture_font_char_eu_interpunct,
    texture_font_char_eu_star_hollow,
    0x0, 0x0,
#elif defined(VERSION_US) || defined(VERSION_CN) // US Font Table
    texture_font_char_us_0, texture_font_char_us_1, texture_font_char_us_2, texture_font_char_us_3,
    texture_font_char_us_4, texture_font_char_us_5, texture_font_char_us_6, texture_font_char_us_7,
    texture_font_char_us_8, texture_font_char_us_9, texture_font_char_us_A, texture_font_char_us_B,
    texture_font_char_us_C, texture_font_char_us_D, texture_font_char_us_E, texture_font_char_us_F,
    texture_font_char_us_G, texture_font_char_us_H, texture_font_char_us_I, texture_font_char_us_J,
    texture_font_char_us_K, texture_font_char_us_L, texture_font_char_us_M, texture_font_char_us_N,
    texture_font_char_us_O, texture_font_char_us_P, texture_font_char_us_Q, texture_font_char_us_R,
    texture_font_char_us_S, texture_font_char_us_T, texture_font_char_us_U, texture_font_char_us_V,
    texture_font_char_us_W, texture_font_char_us_X, texture_font_char_us_Y, texture_font_char_us_Z,
    texture_font_char_us_a, texture_font_char_us_b, texture_font_char_us_c, texture_font_char_us_d,
    texture_font_char_us_e, texture_font_char_us_f, texture_font_char_us_g, texture_font_char_us_h,
    texture_font_char_us_i, texture_font_char_us_j, texture_font_char_us_k, texture_font_char_us_l,
    texture_font_char_us_m, texture_font_char_us_n, texture_font_char_us_o, texture_font_char_us_p,
    texture_font_char_us_q, texture_font_char_us_r, texture_font_char_us_s, texture_font_char_us_t,
    texture_font_char_us_u, texture_font_char_us_v, texture_font_char_us_w, texture_font_char_us_x,
    texture_font_char_us_y, texture_font_char_us_z, texture_font_char_us_apostrophe, texture_font_char_us_period,
#if defined(VERSION_CN)
    texture_font_char_cn_16800, texture_font_char_cn_16840, 0x0,           0x0,
#else
                  0x0,               0x0,               0x0,               0x0,
#endif
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
    texture_font_char_us_button_C_up, texture_font_char_us_button_C_down, texture_font_char_us_button_C_left, texture_font_char_us_button_C_right,
    texture_font_char_us_button_A, texture_font_char_us_button_B, texture_font_char_us_button_C, texture_font_char_us_button_Z,
    texture_font_char_us_button_R,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0, texture_font_char_us_comma,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0, texture_font_char_us_slash,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0, texture_font_char_us_open_parentheses, texture_font_char_us_close_open_parentheses, texture_font_char_us_close_parentheses,
    texture_font_char_us_left_right_arrow, texture_font_char_us_ampersand, texture_font_char_us_ellipsis,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0,               0x0,               0x0,
                  0x0,               0x0, texture_font_char_us_exclamation, texture_font_char_us_percent,
    texture_font_char_us_question, texture_font_char_us_double_quote_open, texture_font_char_us_double_quote_close, texture_font_char_us_tilde,
                  0x0, texture_font_char_us_coin, texture_font_char_us_star_filled, texture_font_char_us_multiply,
    texture_font_char_us_interpunct, texture_font_char_us_star_hollow,               0x0,               0x0,
#if defined(VERSION_CN)
    texture_font_char_cn_16880, texture_font_char_cn_16890, texture_font_char_cn_168A0, texture_font_char_cn_168B0,
    texture_font_char_cn_168C0, texture_font_char_cn_168D0, texture_font_char_cn_168E0, texture_font_char_cn_168F0,
    texture_font_char_cn_16900, texture_font_char_cn_16910, texture_font_char_cn_16920, texture_font_char_cn_16930,
    texture_font_char_cn_16940, texture_font_char_cn_16950, texture_font_char_cn_16960, texture_font_char_cn_16970,
    texture_font_char_cn_16980, texture_font_char_cn_16990, texture_font_char_cn_169A0, texture_font_char_cn_169B0,
    texture_font_char_cn_169C0, texture_font_char_cn_169D0, texture_font_char_cn_169E0, texture_font_char_cn_169F0,
    texture_font_char_cn_16A00, texture_font_char_cn_16A10, texture_font_char_cn_16A20, texture_font_char_cn_16A30,
    texture_font_char_cn_16A40, texture_font_char_cn_16A50, texture_font_char_cn_16A60, texture_font_char_cn_16A70,
    texture_font_char_cn_16A80, texture_font_char_cn_16A90, texture_font_char_cn_16AA0, texture_font_char_cn_16AB0,
    texture_font_char_cn_16AC0, texture_font_char_cn_16AD0, texture_font_char_cn_16AE0, texture_font_char_cn_16AF0,
    texture_font_char_cn_16B00, texture_font_char_cn_16B10, texture_font_char_cn_16B20, texture_font_char_cn_16B30,
    texture_font_char_cn_16B40, texture_font_char_cn_16B50, texture_font_char_cn_16B60, texture_font_char_cn_16B70,
    texture_font_char_cn_16B80, texture_font_char_cn_16B90, texture_font_char_cn_16BA0, texture_font_char_cn_16BB0,
    texture_font_char_cn_16BC0, texture_font_char_cn_16BD0, texture_font_char_cn_16BE0, texture_font_char_cn_16BF0,
    texture_font_char_cn_16C00, texture_font_char_cn_16C10, texture_font_char_cn_16C20, texture_font_char_cn_16C30,
    texture_font_char_cn_16C40, texture_font_char_cn_16C50, texture_font_char_cn_16C60, texture_font_char_cn_16C70,
    texture_font_char_cn_16C80, texture_font_char_cn_16C90, texture_font_char_cn_16CA0, texture_font_char_cn_16CB0,
    texture_font_char_cn_16CC0, texture_font_char_cn_16CD0, texture_font_char_cn_16CE0, texture_font_char_cn_16CF0,
    texture_font_char_cn_16D00, texture_font_char_cn_16D10, texture_font_char_cn_16D20, texture_font_char_cn_16D30,
    texture_font_char_cn_16D40, texture_font_char_cn_16D50, texture_font_char_cn_16D60, texture_font_char_cn_16D70,
    texture_font_char_cn_16D80, texture_font_char_cn_16D90, texture_font_char_cn_16DA0, texture_font_char_cn_16DB0,
    texture_font_char_cn_16DC0, texture_font_char_cn_16DD0, texture_font_char_cn_16DE0, texture_font_char_cn_16DF0,
    texture_font_char_cn_16E00, texture_font_char_cn_16E10, texture_font_char_cn_16E20, texture_font_char_cn_16E30,
    texture_font_char_cn_16E40, texture_font_char_cn_16E50, texture_font_char_cn_16E60, texture_font_char_cn_16E70,
    texture_font_char_cn_16E80, texture_font_char_cn_16E90, texture_font_char_cn_16EA0, texture_font_char_cn_16EB0,
    texture_font_char_cn_16EC0, texture_font_char_cn_16ED0, texture_font_char_cn_16EE0, texture_font_char_cn_16EF0,
    texture_font_char_cn_16F00, texture_font_char_cn_16F10, texture_font_char_cn_16F20, texture_font_char_cn_16F30,
    texture_font_char_cn_16F40, texture_font_char_cn_16F50, texture_font_char_cn_16F60, texture_font_char_cn_16F70,
    texture_font_char_cn_16F80, texture_font_char_cn_16F90, texture_font_char_cn_16FA0, texture_font_char_cn_16FB0,
    texture_font_char_cn_16FC0, texture_font_char_cn_16FD0, texture_font_char_cn_16FE0, texture_font_char_cn_16FF0,
    texture_font_char_cn_17000, texture_font_char_cn_17010, texture_font_char_cn_17020, texture_font_char_cn_17030,
    texture_font_char_cn_17040, texture_font_char_cn_17050, texture_font_char_cn_17060, texture_font_char_cn_17070,
    texture_font_char_cn_17080, texture_font_char_cn_17090, texture_font_char_cn_170A0, texture_font_char_cn_170B0,
    texture_font_char_cn_170C0, texture_font_char_cn_170D0, texture_font_char_cn_170E0, texture_font_char_cn_170F0,
    texture_font_char_cn_17100, texture_font_char_cn_17110, texture_font_char_cn_17120, texture_font_char_cn_17130,
    texture_font_char_cn_17140, texture_font_char_cn_17150, texture_font_char_cn_17160, texture_font_char_cn_17170,
    texture_font_char_cn_17180, texture_font_char_cn_17190, texture_font_char_cn_171A0, texture_font_char_cn_171B0,
    texture_font_char_cn_171C0, texture_font_char_cn_171D0, texture_font_char_cn_171E0, texture_font_char_cn_171F0,
    texture_font_char_cn_17200, texture_font_char_cn_17210, texture_font_char_cn_17220, texture_font_char_cn_17230,
    texture_font_char_cn_17240, texture_font_char_cn_17250, texture_font_char_cn_17260, texture_font_char_cn_17270,
    texture_font_char_cn_17280, texture_font_char_cn_17290, texture_font_char_cn_172A0, texture_font_char_cn_172B0,
    texture_font_char_cn_172C0, texture_font_char_cn_172D0, texture_font_char_cn_172E0, texture_font_char_cn_172F0,
    texture_font_char_cn_17300, texture_font_char_cn_17310, texture_font_char_cn_17320, texture_font_char_cn_17330,
    texture_font_char_cn_17340, texture_font_char_cn_17350, texture_font_char_cn_17360, texture_font_char_cn_17370,
    texture_font_char_cn_17380, texture_font_char_cn_17390, texture_font_char_cn_173A0, texture_font_char_cn_173B0,
    texture_font_char_cn_173C0, texture_font_char_cn_173D0, texture_font_char_cn_173E0, texture_font_char_cn_173F0,
    texture_font_char_cn_17400, texture_font_char_cn_17410, texture_font_char_cn_17420, texture_font_char_cn_17430,
    texture_font_char_cn_17440, texture_font_char_cn_17450, texture_font_char_cn_17460, texture_font_char_cn_17470,
    texture_font_char_cn_17480, texture_font_char_cn_17490, texture_font_char_cn_174A0, texture_font_char_cn_174B0,
    texture_font_char_cn_174C0, texture_font_char_cn_174D0, texture_font_char_cn_174E0, texture_font_char_cn_174F0,
    texture_font_char_cn_17500, texture_font_char_cn_17510, texture_font_char_cn_17520, texture_font_char_cn_17530,
    texture_font_char_cn_17540, texture_font_char_cn_17550, texture_font_char_cn_17560, texture_font_char_cn_17570,
    texture_font_char_cn_17580, texture_font_char_cn_17590, texture_font_char_cn_175A0, texture_font_char_cn_175B0,
    texture_font_char_cn_175C0, texture_font_char_cn_175D0, texture_font_char_cn_175E0, texture_font_char_cn_175F0,
    texture_font_char_cn_17600, texture_font_char_cn_17610, texture_font_char_cn_17620, texture_font_char_cn_17630,
    texture_font_char_cn_17640, texture_font_char_cn_17650, texture_font_char_cn_17660, texture_font_char_cn_17670,
    texture_font_char_cn_17680, texture_font_char_cn_17690, texture_font_char_cn_176A0, texture_font_char_cn_176B0,
    texture_font_char_cn_176C0, texture_font_char_cn_176D0, texture_font_char_cn_176E0, texture_font_char_cn_176F0,
    texture_font_char_cn_17700, texture_font_char_cn_17710, texture_font_char_cn_17720, texture_font_char_cn_17730,
    texture_font_char_cn_17740, texture_font_char_cn_17750, texture_font_char_cn_17760, texture_font_char_cn_17770,
    texture_font_char_cn_17780, texture_font_char_cn_17790, texture_font_char_cn_177A0, texture_font_char_cn_177B0,
    texture_font_char_cn_177C0, texture_font_char_cn_177D0, texture_font_char_cn_177E0, texture_font_char_cn_177F0,
    texture_font_char_cn_17800, texture_font_char_cn_17810, texture_font_char_cn_17820, texture_font_char_cn_17830,
    texture_font_char_cn_17840, texture_font_char_cn_17850, texture_font_char_cn_17860, texture_font_char_cn_17870,
    texture_font_char_cn_17880, texture_font_char_cn_17890, texture_font_char_cn_178A0, texture_font_char_cn_178B0,
    texture_font_char_cn_178C0, texture_font_char_cn_178D0, texture_font_char_cn_178E0, texture_font_char_cn_178F0,
    texture_font_char_cn_17900, texture_font_char_cn_17910, texture_font_char_cn_17920, texture_font_char_cn_17930,
    texture_font_char_cn_17940, texture_font_char_cn_17950, texture_font_char_cn_17960, texture_font_char_cn_17970,
    texture_font_char_cn_17980, texture_font_char_cn_17990, texture_font_char_cn_179A0, texture_font_char_cn_179B0,
    texture_font_char_cn_179C0, texture_font_char_cn_179D0, texture_font_char_cn_179E0, texture_font_char_cn_179F0,
    texture_font_char_cn_17A00, texture_font_char_cn_17A10, texture_font_char_cn_17A20, texture_font_char_cn_17A30,
    texture_font_char_cn_17A40, texture_font_char_cn_17A50, texture_font_char_cn_17A60, texture_font_char_cn_17A70,
    texture_font_char_cn_17A80, texture_font_char_cn_17A90, texture_font_char_cn_17AA0, texture_font_char_cn_17AB0,
    texture_font_char_cn_17AC0, texture_font_char_cn_17AD0, texture_font_char_cn_17AE0, texture_font_char_cn_17AF0,
    texture_font_char_cn_17B00, texture_font_char_cn_17B10, texture_font_char_cn_17B20, texture_font_char_cn_17B30,
    texture_font_char_cn_17B40, texture_font_char_cn_17B50, texture_font_char_cn_17B60, texture_font_char_cn_17B70,
    texture_font_char_cn_17B80, texture_font_char_cn_17B90, texture_font_char_cn_17BA0, texture_font_char_cn_17BB0,
    texture_font_char_cn_17BC0, texture_font_char_cn_17BD0, texture_font_char_cn_17BE0, texture_font_char_cn_17BF0,
    texture_font_char_cn_17C00, texture_font_char_cn_17C10, texture_font_char_cn_17C20, texture_font_char_cn_17C30,
    texture_font_char_cn_17C40, texture_font_char_cn_17C50, texture_font_char_cn_17C60, texture_font_char_cn_17C70,
    texture_font_char_cn_17C80, texture_font_char_cn_17C90, texture_font_char_cn_17CA0, texture_font_char_cn_17CB0,
    texture_font_char_cn_17CC0, texture_font_char_cn_17CD0, texture_font_char_cn_17CE0, texture_font_char_cn_17CF0,
    texture_font_char_cn_17D00, texture_font_char_cn_17D10, texture_font_char_cn_17D20, texture_font_char_cn_17D30,
    texture_font_char_cn_17D40, texture_font_char_cn_17D50, texture_font_char_cn_17D60, texture_font_char_cn_17D70,
    texture_font_char_cn_17D80, texture_font_char_cn_17D90, texture_font_char_cn_17DA0, texture_font_char_cn_17DB0,
    texture_font_char_cn_17DC0, texture_font_char_cn_17DD0, texture_font_char_cn_17DE0, texture_font_char_cn_17DF0,
    texture_font_char_cn_17E00, texture_font_char_cn_17E10, texture_font_char_cn_17E20, texture_font_char_cn_17E30,
    texture_font_char_cn_17E40, texture_font_char_cn_17E50, texture_font_char_cn_17E60, texture_font_char_cn_17E70,
    texture_font_char_cn_17E80, texture_font_char_cn_17E90, texture_font_char_cn_17EA0, texture_font_char_cn_17EB0,
    texture_font_char_cn_17EC0, texture_font_char_cn_17ED0, texture_font_char_cn_17EE0, texture_font_char_cn_17EF0,
    texture_font_char_cn_17F00, texture_font_char_cn_17F10, texture_font_char_cn_17F20, texture_font_char_cn_17F30,
    texture_font_char_cn_17F40, texture_font_char_cn_17F50, texture_font_char_cn_17F60, texture_font_char_cn_17F70,
    texture_font_char_cn_17F80, texture_font_char_cn_17F90, texture_font_char_cn_17FA0, texture_font_char_cn_17FB0,
    texture_font_char_cn_17FC0, texture_font_char_cn_17FD0, texture_font_char_cn_17FE0, texture_font_char_cn_17FF0,
    texture_font_char_cn_18000, texture_font_char_cn_18010, texture_font_char_cn_18020, texture_font_char_cn_18030,
    texture_font_char_cn_18040, texture_font_char_cn_18050, texture_font_char_cn_18060, texture_font_char_cn_18070,
    texture_font_char_cn_18080, texture_font_char_cn_18090, texture_font_char_cn_180A0, texture_font_char_cn_180B0,
    texture_font_char_cn_180C0, texture_font_char_cn_180D0, texture_font_char_cn_180E0, texture_font_char_cn_180F0,
    texture_font_char_cn_18100, texture_font_char_cn_18110, texture_font_char_cn_18120, texture_font_char_cn_18130,
    texture_font_char_cn_18140, texture_font_char_cn_18150, texture_font_char_cn_18160, texture_font_char_cn_18170,
    texture_font_char_cn_18180, texture_font_char_cn_18190, texture_font_char_cn_181A0, texture_font_char_cn_181B0,
    texture_font_char_cn_181C0, texture_font_char_cn_181D0, texture_font_char_cn_181E0, texture_font_char_cn_181F0,
    texture_font_char_cn_18200, texture_font_char_cn_18210, texture_font_char_cn_18220, texture_font_char_cn_18230,
    texture_font_char_cn_18240, texture_font_char_cn_18250, texture_font_char_cn_18260, texture_font_char_cn_18270,
    texture_font_char_cn_18280, texture_font_char_cn_18290, texture_font_char_cn_182A0, texture_font_char_cn_182B0,
    texture_font_char_cn_182C0, texture_font_char_cn_182D0, texture_font_char_cn_182E0, texture_font_char_cn_182F0,
    texture_font_char_cn_18300, texture_font_char_cn_18310, texture_font_char_cn_18320, texture_font_char_cn_18330,
    texture_font_char_cn_18340, texture_font_char_cn_18350, texture_font_char_cn_18360, texture_font_char_cn_18370,
    texture_font_char_cn_18380, texture_font_char_cn_18390, texture_font_char_cn_183A0, texture_font_char_cn_183B0,
    texture_font_char_cn_183C0, texture_font_char_cn_183D0, texture_font_char_cn_183E0, texture_font_char_cn_183F0,
    texture_font_char_cn_18400, texture_font_char_cn_18410, texture_font_char_cn_18420, texture_font_char_cn_18430,
    texture_font_char_cn_18440, texture_font_char_cn_18450, texture_font_char_cn_18460, texture_font_char_cn_18470,
    texture_font_char_cn_18480, texture_font_char_cn_18490, texture_font_char_cn_184A0, texture_font_char_cn_184B0,
    texture_font_char_cn_184C0, texture_font_char_cn_184D0, texture_font_char_cn_184E0, texture_font_char_cn_184F0,
    texture_font_char_cn_18500, texture_font_char_cn_18510, texture_font_char_cn_18520, texture_font_char_cn_18530,
    texture_font_char_cn_18540, texture_font_char_cn_18550, texture_font_char_cn_18560, texture_font_char_cn_18570,
    texture_font_char_cn_18580, texture_font_char_cn_18590, texture_font_char_cn_185A0, texture_font_char_cn_185B0,
    texture_font_char_cn_185C0, texture_font_char_cn_185D0, texture_font_char_cn_185E0, texture_font_char_cn_185F0,
    texture_font_char_cn_18600, texture_font_char_cn_18610, texture_font_char_cn_18620, texture_font_char_cn_18630,
    texture_font_char_cn_18640, texture_font_char_cn_18650, texture_font_char_cn_18660, texture_font_char_cn_18670,
    texture_font_char_cn_18680, texture_font_char_cn_18690, texture_font_char_cn_186A0, texture_font_char_cn_186B0,
    texture_font_char_cn_186C0, texture_font_char_cn_186D0, texture_font_char_cn_186E0, texture_font_char_cn_186F0,
    texture_font_char_cn_18700, texture_font_char_cn_18710, texture_font_char_cn_18720, texture_font_char_cn_18730,
    texture_font_char_cn_18740, texture_font_char_cn_18750, texture_font_char_cn_18760, texture_font_char_cn_18770,
    texture_font_char_cn_18780, texture_font_char_cn_18790, texture_font_char_cn_187A0, texture_font_char_cn_187B0,
    texture_font_char_cn_187C0, texture_font_char_cn_187D0, texture_font_char_cn_187E0, texture_font_char_cn_187F0,
    texture_font_char_cn_18800, texture_font_char_cn_18810, texture_font_char_cn_18820, texture_font_char_cn_18830,
    texture_font_char_cn_18840, texture_font_char_cn_18850, texture_font_char_cn_18860, texture_font_char_cn_18870,
    texture_font_char_cn_18880, texture_font_char_cn_18890, texture_font_char_cn_188A0, texture_font_char_cn_188B0,
    texture_font_char_cn_188C0, texture_font_char_cn_188D0, texture_font_char_cn_188E0, texture_font_char_cn_188F0,
    texture_font_char_cn_18900, texture_font_char_cn_18910, texture_font_char_cn_18920, texture_font_char_cn_18930,
    texture_font_char_cn_18940, texture_font_char_cn_18950, texture_font_char_cn_18960, texture_font_char_cn_18970,
    texture_font_char_cn_18980, texture_font_char_cn_18990, texture_font_char_cn_189A0, texture_font_char_cn_189B0,
    texture_font_char_cn_189C0, texture_font_char_cn_189D0, texture_font_char_cn_189E0, texture_font_char_cn_189F0,
    texture_font_char_cn_18A00, texture_font_char_cn_18A10, texture_font_char_cn_18A20, texture_font_char_cn_18A30,
    texture_font_char_cn_18A40, texture_font_char_cn_18A50, texture_font_char_cn_18A60, texture_font_char_cn_18A70,
    texture_font_char_cn_18A80, texture_font_char_cn_18A90, texture_font_char_cn_18AA0, texture_font_char_cn_18AB0,
    texture_font_char_cn_18AC0, texture_font_char_cn_18AD0, texture_font_char_cn_18AE0, texture_font_char_cn_18AF0,
    texture_font_char_cn_18B00, texture_font_char_cn_18B10, texture_font_char_cn_18B20, texture_font_char_cn_18B30,
    texture_font_char_cn_18B40, texture_font_char_cn_18B50, texture_font_char_cn_18B60, texture_font_char_cn_18B70,
    texture_font_char_cn_18B80, texture_font_char_cn_18B90, texture_font_char_cn_18BA0, texture_font_char_cn_18BB0,
    texture_font_char_cn_18BC0, texture_font_char_cn_18BD0, texture_font_char_cn_18BE0, texture_font_char_cn_18BF0,
    texture_font_char_cn_18C00, texture_font_char_cn_18C10, texture_font_char_cn_18C20, texture_font_char_cn_18C30,
    texture_font_char_cn_18C40, texture_font_char_cn_18C50, texture_font_char_cn_18C60, texture_font_char_cn_18C70,
    texture_font_char_cn_18C80, texture_font_char_cn_18C90, texture_font_char_cn_18CA0, texture_font_char_cn_18CB0,
    texture_font_char_cn_18CC0, texture_font_char_cn_18CD0, texture_font_char_cn_18CE0, texture_font_char_cn_18CF0,
    texture_font_char_cn_18D00, texture_font_char_cn_18D10, texture_font_char_cn_18D20, texture_font_char_cn_18D30,
    texture_font_char_cn_18D40, texture_font_char_cn_18D50, texture_font_char_cn_18D60, texture_font_char_cn_18D70,
    texture_font_char_cn_18D80, texture_font_char_cn_18D90, texture_font_char_cn_18DA0, texture_font_char_cn_18DB0,
    texture_font_char_cn_18DC0, texture_font_char_cn_18DD0, texture_font_char_cn_18DE0, texture_font_char_cn_18DF0,
    texture_font_char_cn_18E00, texture_font_char_cn_18E10, texture_font_char_cn_18E20, texture_font_char_cn_18E30,
    texture_font_char_cn_18E40, texture_font_char_cn_18E50, texture_font_char_cn_18E60, texture_font_char_cn_18E70,
    texture_font_char_cn_18E80, texture_font_char_cn_18E90, texture_font_char_cn_18EA0, texture_font_char_cn_18EB0,
    texture_font_char_cn_18EC0, texture_font_char_cn_18ED0, texture_font_char_cn_18EE0, texture_font_char_cn_18EF0,
    texture_font_char_cn_18F00, texture_font_char_cn_18F10, texture_font_char_cn_18F20, texture_font_char_cn_18F30,
    texture_font_char_cn_18F40, texture_font_char_cn_18F50, texture_font_char_cn_18F60, texture_font_char_cn_18F70,
    texture_font_char_cn_18F80, texture_font_char_cn_18F90, texture_font_char_cn_18FA0, texture_font_char_cn_18FB0,
    texture_font_char_cn_18FC0, texture_font_char_cn_18FD0, texture_font_char_cn_18FE0, texture_font_char_cn_18FF0,
    texture_font_char_cn_19000, texture_font_char_cn_19010, texture_font_char_cn_19020, texture_font_char_cn_19030,
    texture_font_char_cn_19040, texture_font_char_cn_19050, texture_font_char_cn_19060, texture_font_char_cn_19070,
    texture_font_char_cn_19080, texture_font_char_cn_19090, texture_font_char_cn_190A0, texture_font_char_cn_190B0,
    texture_font_char_cn_190C0, texture_font_char_cn_190D0, texture_font_char_cn_190E0, texture_font_char_cn_190F0,
    texture_font_char_cn_19100, texture_font_char_cn_19110, texture_font_char_cn_19120, texture_font_char_cn_19130,
    texture_font_char_cn_19140, texture_font_char_cn_19150, texture_font_char_cn_19160, texture_font_char_cn_19170,
    texture_font_char_cn_19180, texture_font_char_cn_19190, texture_font_char_cn_191A0, texture_font_char_cn_191B0,
    texture_font_char_cn_191C0, texture_font_char_cn_191D0, texture_font_char_cn_191E0, texture_font_char_cn_191F0,
    texture_font_char_cn_19200, texture_font_char_cn_19210, texture_font_char_cn_19220, texture_font_char_cn_19230,
    texture_font_char_cn_19240, texture_font_char_cn_19250, texture_font_char_cn_19260, texture_font_char_cn_19270,
    texture_font_char_cn_19280, texture_font_char_cn_19290, texture_font_char_cn_192A0, texture_font_char_cn_192B0,
    texture_font_char_cn_192C0, texture_font_char_cn_192D0, texture_font_char_cn_192E0, texture_font_char_cn_192F0,
    texture_font_char_cn_19300, texture_font_char_cn_19310, texture_font_char_cn_19320, texture_font_char_cn_19330,
    texture_font_char_cn_19340, texture_font_char_cn_19350, texture_font_char_cn_19360, texture_font_char_cn_19370,
    texture_font_char_cn_19380, texture_font_char_cn_19390, texture_font_char_cn_193A0, texture_font_char_cn_193B0,
    texture_font_char_cn_193C0, texture_font_char_cn_193D0, texture_font_char_cn_193E0, texture_font_char_cn_193F0,
    texture_font_char_cn_19400, texture_font_char_cn_19410, texture_font_char_cn_19420, texture_font_char_cn_19430,
    texture_font_char_cn_19440, texture_font_char_cn_19450, texture_font_char_cn_19460, texture_font_char_cn_19470,
    texture_font_char_cn_19480, texture_font_char_cn_19490, texture_font_char_cn_194A0, texture_font_char_cn_194B0,
    texture_font_char_cn_194C0, texture_font_char_cn_194D0, texture_font_char_cn_194E0, texture_font_char_cn_194F0,
    texture_font_char_cn_19500, texture_font_char_cn_19510, texture_font_char_cn_19520, texture_font_char_cn_19530,
    texture_font_char_cn_19540, texture_font_char_cn_19550, texture_font_char_cn_19560, texture_font_char_cn_19570,
    texture_font_char_cn_19580, texture_font_char_cn_19590, texture_font_char_cn_195A0, texture_font_char_cn_195B0,
    texture_font_char_cn_195C0, texture_font_char_cn_195D0, texture_font_char_cn_195E0, texture_font_char_cn_195F0,
    texture_font_char_cn_19600, texture_font_char_cn_19610, texture_font_char_cn_19620, texture_font_char_cn_19630,
    texture_font_char_cn_19640, texture_font_char_cn_19650, texture_font_char_cn_19660, texture_font_char_cn_19670,
    texture_font_char_cn_19680, texture_font_char_cn_19690, texture_font_char_cn_196A0, texture_font_char_cn_196B0,
    texture_font_char_cn_196C0, texture_font_char_cn_196D0, texture_font_char_cn_196E0, texture_font_char_cn_196F0,
    texture_font_char_cn_19700, texture_font_char_cn_19710, texture_font_char_cn_19720, texture_font_char_cn_19730,
    texture_font_char_cn_19740, texture_font_char_cn_19750, texture_font_char_cn_19760, texture_font_char_cn_19770,
    texture_font_char_cn_19780, texture_font_char_cn_19790, texture_font_char_cn_197A0, texture_font_char_cn_197B0,
    texture_font_char_cn_197C0, texture_font_char_cn_197D0, texture_font_char_cn_197E0, texture_font_char_cn_197F0,
    texture_font_char_cn_19800, texture_font_char_cn_19810, texture_font_char_cn_19820, texture_font_char_cn_19830,
    texture_font_char_cn_19840, texture_font_char_cn_19850, texture_font_char_cn_19860, texture_font_char_cn_19870,
    texture_font_char_cn_19880, texture_font_char_cn_19890, texture_font_char_cn_198A0, texture_font_char_cn_198B0,
    texture_font_char_cn_198C0, texture_font_char_cn_198D0, texture_font_char_cn_198E0, texture_font_char_cn_198F0,
    texture_font_char_cn_19900, texture_font_char_cn_19910, texture_font_char_cn_19920, texture_font_char_cn_19930,
    texture_font_char_cn_19940, texture_font_char_cn_19950, texture_font_char_cn_19960, texture_font_char_cn_19970,
    texture_font_char_cn_19980, texture_font_char_cn_19990, texture_font_char_cn_199A0, texture_font_char_cn_199B0,
    texture_font_char_cn_199C0, texture_font_char_cn_199D0, texture_font_char_cn_199E0, texture_font_char_cn_199F0,
    texture_font_char_cn_19A00, texture_font_char_cn_19A10, texture_font_char_cn_19A20, texture_font_char_cn_19A30,
    texture_font_char_cn_19A40, texture_font_char_cn_19A50, texture_font_char_cn_19A60, texture_font_char_cn_19A70,
    texture_font_char_cn_19A80, texture_font_char_cn_19A90, texture_font_char_cn_19AA0, texture_font_char_cn_19AB0,
    texture_font_char_cn_19AC0, texture_font_char_cn_19AD0, texture_font_char_cn_19AE0, texture_font_char_cn_19AF0,
    texture_font_char_cn_19B00, texture_font_char_cn_19B10, texture_font_char_cn_19B20, texture_font_char_cn_19B30,
    texture_font_char_cn_19B40, texture_font_char_cn_19B50, texture_font_char_cn_19B60, texture_font_char_cn_19B70,
    texture_font_char_cn_19B80, texture_font_char_cn_19B90, texture_font_char_cn_19BA0, texture_font_char_cn_19BB0,
    texture_font_char_cn_19BC0, texture_font_char_cn_19BD0, texture_font_char_cn_19BE0, texture_font_char_cn_19BF0,
    texture_font_char_cn_19C00, texture_font_char_cn_19C10, texture_font_char_cn_19C20, texture_font_char_cn_19C30,
    texture_font_char_cn_19C40, texture_font_char_cn_19C50, texture_font_char_cn_19C60, texture_font_char_cn_19C70,
    texture_font_char_cn_19C80, texture_font_char_cn_19C90, texture_font_char_cn_19CA0, texture_font_char_cn_19CB0,
    texture_font_char_cn_19CC0, texture_font_char_cn_19CD0, texture_font_char_cn_19CE0, texture_font_char_cn_19CF0,
    texture_font_char_cn_19D00, texture_font_char_cn_19D10, texture_font_char_cn_19D20, texture_font_char_cn_19D30,
    texture_font_char_cn_19D40, texture_font_char_cn_19D50, texture_font_char_cn_19D60, texture_font_char_cn_19D70,
    texture_font_char_cn_19D80, texture_font_char_cn_19D90, texture_font_char_cn_19DA0, texture_font_char_cn_19DB0,
    texture_font_char_cn_19DC0, texture_font_char_cn_19DD0, texture_font_char_cn_19DE0, texture_font_char_cn_19DF0,
    texture_font_char_cn_19E00, texture_font_char_cn_19E10, texture_font_char_cn_19E20, texture_font_char_cn_19E30,
    texture_font_char_cn_19E40, texture_font_char_cn_19E50, texture_font_char_cn_19E60, texture_font_char_cn_19E70,
    texture_font_char_cn_19E80, texture_font_char_cn_19E90, texture_font_char_cn_19EA0, texture_font_char_cn_19EB0,
    texture_font_char_cn_19EC0, texture_font_char_cn_19ED0, texture_font_char_cn_19EE0, texture_font_char_cn_19EF0,
    texture_font_char_cn_19F00, texture_font_char_cn_19F10, texture_font_char_cn_19F20, texture_font_char_cn_19F30,
    texture_font_char_cn_19F40, texture_font_char_cn_19F50, texture_font_char_cn_19F60, texture_font_char_cn_19F70,
    texture_font_char_cn_19F80, texture_font_char_cn_19F90, texture_font_char_cn_19FA0, texture_font_char_cn_19FB0,
    texture_font_char_cn_19FC0, texture_font_char_cn_19FD0, texture_font_char_cn_19FE0, texture_font_char_cn_19FF0,
    texture_font_char_cn_1A000, texture_font_char_cn_1A010, texture_font_char_cn_1A020, texture_font_char_cn_1A030,
    texture_font_char_cn_1A040, texture_font_char_cn_1A050, texture_font_char_cn_1A060, texture_font_char_cn_1A070,
    texture_font_char_cn_1A080, texture_font_char_cn_1A090, texture_font_char_cn_1A0A0, texture_font_char_cn_1A0B0,
    texture_font_char_cn_1A0C0, texture_font_char_cn_1A0D0, texture_font_char_cn_1A0E0, texture_font_char_cn_1A0F0,
    texture_font_char_cn_1A100, texture_font_char_cn_1A110, texture_font_char_cn_1A120, texture_font_char_cn_1A130,
    texture_font_char_cn_1A140, texture_font_char_cn_1A150, texture_font_char_cn_1A160, texture_font_char_cn_1A170,
    texture_font_char_cn_1A180, texture_font_char_cn_1A190, texture_font_char_cn_1A1A0, texture_font_char_cn_1A1B0,
    texture_font_char_cn_1A1C0, texture_font_char_cn_1A1D0, texture_font_char_cn_1A1E0, texture_font_char_cn_1A1F0,
    texture_font_char_cn_1A200, texture_font_char_cn_1A210, texture_font_char_cn_1A220, texture_font_char_cn_1A230,
    texture_font_char_cn_1A240, texture_font_char_cn_1A250, texture_font_char_cn_1A260, texture_font_char_cn_1A270,
    texture_font_char_cn_1A280, texture_font_char_cn_1A290, texture_font_char_cn_1A2A0, texture_font_char_cn_1A2B0,
    texture_font_char_cn_1A2C0, texture_font_char_cn_1A2D0, texture_font_char_cn_1A2E0, texture_font_char_cn_1A2F0,
    texture_font_char_cn_1A300, texture_font_char_cn_1A310, texture_font_char_cn_1A320, texture_font_char_cn_1A330,
    texture_font_char_cn_1A340, texture_font_char_cn_1A350, texture_font_char_cn_1A360, texture_font_char_cn_1A370,
    texture_font_char_cn_1A380, texture_font_char_cn_1A390, texture_font_char_cn_1A3A0, texture_font_char_cn_1A3B0,
    texture_font_char_cn_1A3C0, texture_font_char_cn_1A3D0, texture_font_char_cn_1A3E0, texture_font_char_cn_1A3F0,
    texture_font_char_cn_1A400, texture_font_char_cn_1A410, texture_font_char_cn_1A420, texture_font_char_cn_1A430,
    texture_font_char_cn_1A440, texture_font_char_cn_1A450, texture_font_char_cn_1A460, texture_font_char_cn_1A470,
    texture_font_char_cn_1A480, texture_font_char_cn_1A490, texture_font_char_cn_1A4A0, texture_font_char_cn_1A4B0,
    texture_font_char_cn_1A4C0, texture_font_char_cn_1A4D0, texture_font_char_cn_1A4E0, texture_font_char_cn_1A4F0,
    texture_font_char_cn_1A500, texture_font_char_cn_1A510, texture_font_char_cn_1A520, texture_font_char_cn_1A530,
    texture_font_char_cn_1A540, texture_font_char_cn_1A550, texture_font_char_cn_1A560, texture_font_char_cn_1A570,
    texture_font_char_cn_1A580, texture_font_char_cn_1A590, texture_font_char_cn_1A5A0, texture_font_char_cn_1A5B0,
    texture_font_char_cn_1A5C0, texture_font_char_cn_1A5D0, texture_font_char_cn_1A5E0, texture_font_char_cn_1A5F0,
    texture_font_char_cn_1A600, texture_font_char_cn_1A610, texture_font_char_cn_1A620, texture_font_char_cn_1A630,
    texture_font_char_cn_1A640, texture_font_char_cn_1A650, texture_font_char_cn_1A660, texture_font_char_cn_1A670,
    texture_font_char_cn_1A680, texture_font_char_cn_1A690, texture_font_char_cn_1A6A0, texture_font_char_cn_1A6B0,
    texture_font_char_cn_1A6C0, texture_font_char_cn_1A6D0, texture_font_char_cn_1A6E0, texture_font_char_cn_1A6F0,
    texture_font_char_cn_1A700, texture_font_char_cn_1A710, texture_font_char_cn_1A720, texture_font_char_cn_1A730,
    texture_font_char_cn_1A740, texture_font_char_cn_1A750, texture_font_char_cn_1A760, texture_font_char_cn_1A770,
    texture_font_char_cn_1A780, texture_font_char_cn_1A790, texture_font_char_cn_1A7A0, texture_font_char_cn_1A7B0,
    texture_font_char_cn_1A7C0, texture_font_char_cn_1A7D0, texture_font_char_cn_1A7E0, texture_font_char_cn_1A7F0,
    texture_font_char_cn_1A800, texture_font_char_cn_1A810, texture_font_char_cn_1A820, texture_font_char_cn_1A830,
    texture_font_char_cn_1A840, texture_font_char_cn_1A850, texture_font_char_cn_1A860, texture_font_char_cn_1A870,
    texture_font_char_cn_1A880, texture_font_char_cn_1A890, texture_font_char_cn_1A8A0, texture_font_char_cn_1A8B0,
    texture_font_char_cn_1A8C0, texture_font_char_cn_1A8D0, texture_font_char_cn_1A8E0, texture_font_char_cn_1A8F0,
    texture_font_char_cn_1A900, texture_font_char_cn_1A910, texture_font_char_cn_1A920, texture_font_char_cn_1A930,
    texture_font_char_cn_1A940, texture_font_char_cn_1A950, texture_font_char_cn_1A960, texture_font_char_cn_1A970,
    texture_font_char_cn_1A980, texture_font_char_cn_1A990, texture_font_char_cn_1A9A0, texture_font_char_cn_1A9B0,
    texture_font_char_cn_1A9C0, texture_font_char_cn_1A9D0, texture_font_char_cn_1A9E0, texture_font_char_cn_1A9F0,
    texture_font_char_cn_1AA00, texture_font_char_cn_1AA10, texture_font_char_cn_1AA20, texture_font_char_cn_1AA30,
    texture_font_char_cn_1AA40, texture_font_char_cn_1AA50, texture_font_char_cn_1AA60, texture_font_char_cn_1AA70,
    texture_font_char_cn_1AA80, texture_font_char_cn_1AA90, texture_font_char_cn_1AAA0, texture_font_char_cn_1AAB0,
    texture_font_char_cn_1AAC0, texture_font_char_cn_1AAD0, texture_font_char_cn_1AAE0, texture_font_char_cn_1AAF0,
    texture_font_char_cn_1AB00, texture_font_char_cn_1AB10, texture_font_char_cn_1AB20, texture_font_char_cn_1AB30,
    texture_font_char_cn_1AB40, texture_font_char_cn_1AB50, texture_font_char_cn_1AB60, texture_font_char_cn_1AB70,
    texture_font_char_cn_1AB80, texture_font_char_cn_1AB90, texture_font_char_cn_1ABA0, texture_font_char_cn_1ABB0,
    texture_font_char_cn_1ABC0, texture_font_char_cn_1ABD0, texture_font_char_cn_1ABE0, texture_font_char_cn_1ABF0,
    texture_font_char_cn_1AC00, texture_font_char_cn_1AC10, texture_font_char_cn_1AC20, texture_font_char_cn_1AC30,
    texture_font_char_cn_1AC40, texture_font_char_cn_1AC50, texture_font_char_cn_1AC60, texture_font_char_cn_1AC70,
    texture_font_char_cn_1AC80, texture_font_char_cn_1AC90, texture_font_char_cn_1ACA0, texture_font_char_cn_1ACB0,
    texture_font_char_cn_1ACC0, texture_font_char_cn_1ACD0, texture_font_char_cn_1ACE0, texture_font_char_cn_1ACF0,
    texture_font_char_cn_1AD00, texture_font_char_cn_1AD10, texture_font_char_cn_1AD20, texture_font_char_cn_1AD30,
    texture_font_char_cn_1AD40, texture_font_char_cn_1AD50, texture_font_char_cn_1AD60, texture_font_char_cn_1AD70,
    texture_font_char_cn_1AD80, texture_font_char_cn_1AD90, texture_font_char_cn_1ADA0, texture_font_char_cn_1ADB0,
    texture_font_char_cn_1ADC0, texture_font_char_cn_1ADD0, texture_font_char_cn_1ADE0, texture_font_char_cn_1ADF0,
    texture_font_char_cn_1AE00, texture_font_char_cn_1AE10, texture_font_char_cn_1AE20, texture_font_char_cn_1AE30,
    texture_font_char_cn_1AE40, texture_font_char_cn_1AE50, texture_font_char_cn_1AE60, texture_font_char_cn_1AE70,
    texture_font_char_cn_1AE80, texture_font_char_cn_1AE90, texture_font_char_cn_1AEA0, texture_font_char_cn_1AEB0,
    texture_font_char_cn_1AEC0, texture_font_char_cn_1AED0, texture_font_char_cn_1AEE0, texture_font_char_cn_1AEF0,
    texture_font_char_cn_1AF00, texture_font_char_cn_1AF10, texture_font_char_cn_1AF20, texture_font_char_cn_1AF30,
    texture_font_char_cn_1AF40, texture_font_char_cn_1AF50, texture_font_char_cn_1AF60, texture_font_char_cn_1AF70,
    texture_font_char_cn_1AF80, texture_font_char_cn_1AF90, texture_font_char_cn_1AFA0, texture_font_char_cn_1AFB0,
    texture_font_char_cn_1AFC0, texture_font_char_cn_1AFD0, texture_font_char_cn_1AFE0, texture_font_char_cn_1AFF0,
    texture_font_char_cn_1B000, texture_font_char_cn_1B010, texture_font_char_cn_1B020, texture_font_char_cn_1B030,
    texture_font_char_cn_1B040, texture_font_char_cn_1B050, texture_font_char_cn_1B060, texture_font_char_cn_1B070,
    texture_font_char_cn_1B080, texture_font_char_cn_1B090, texture_font_char_cn_1B0A0, texture_font_char_cn_1B0B0,
    texture_font_char_cn_1B0C0, texture_font_char_cn_1B0D0, texture_font_char_cn_1B0E0, texture_font_char_cn_1B0F0,
    texture_font_char_cn_1B100, texture_font_char_cn_1B110, texture_font_char_cn_1B120, texture_font_char_cn_1B130,
    texture_font_char_cn_1B140, texture_font_char_cn_1B150, texture_font_char_cn_1B160, texture_font_char_cn_1B170,
    texture_font_char_cn_1B180, texture_font_char_cn_1B190, texture_font_char_cn_1B1A0, texture_font_char_cn_1B1B0,
    texture_font_char_cn_1B1C0, texture_font_char_cn_1B1D0, texture_font_char_cn_1B1E0, texture_font_char_cn_1B1F0,
    texture_font_char_cn_1B200, texture_font_char_cn_1B210, texture_font_char_cn_1B220, texture_font_char_cn_1B230,
    texture_font_char_cn_1B240, texture_font_char_cn_1B250, texture_font_char_cn_1B260, texture_font_char_cn_1B270,
    texture_font_char_cn_1B280, texture_font_char_cn_1B290, texture_font_char_cn_1B2A0, texture_font_char_cn_1B2B0,
    texture_font_char_cn_1B2C0, texture_font_char_cn_1B2D0, texture_font_char_cn_1B2E0, texture_font_char_cn_1B2F0,
    texture_font_char_cn_1B300, texture_font_char_cn_1B310, texture_font_char_cn_1B320, texture_font_char_cn_1B330,
    texture_font_char_cn_1B340, texture_font_char_cn_1B350, texture_font_char_cn_1B360, texture_font_char_cn_1B370,
    texture_font_char_cn_1B380, texture_font_char_cn_1B390, texture_font_char_cn_1B3A0, texture_font_char_cn_1B3B0,
    texture_font_char_cn_1B3C0, texture_font_char_cn_1B3D0, texture_font_char_cn_1B3E0, texture_font_char_cn_1B3F0,
    texture_font_char_cn_1B400, texture_font_char_cn_1B410, texture_font_char_cn_1B420, texture_font_char_cn_1B430,
    texture_font_char_cn_1B440, texture_font_char_cn_1B450, texture_font_char_cn_1B460, texture_font_char_cn_1B470,
    texture_font_char_cn_1B480, texture_font_char_cn_1B490, texture_font_char_cn_1B4A0, texture_font_char_cn_1B4B0,
    texture_font_char_cn_1B4C0, texture_font_char_cn_1B4D0, texture_font_char_cn_1B4E0, texture_font_char_cn_1B4F0,
    texture_font_char_cn_1B500, texture_font_char_cn_1B510, texture_font_char_cn_1B520, texture_font_char_cn_1B530,
    texture_font_char_cn_1B540, texture_font_char_cn_1B550, texture_font_char_cn_1B560, texture_font_char_cn_1B570,
    texture_font_char_cn_1B580, texture_font_char_cn_1B590, texture_font_char_cn_1B5A0, texture_font_char_cn_1B5B0,
    texture_font_char_cn_1B5C0, texture_font_char_cn_1B5D0, texture_font_char_cn_1B5E0, texture_font_char_cn_1B5F0,
    texture_font_char_cn_1B600, texture_font_char_cn_1B610, texture_font_char_cn_1B620, texture_font_char_cn_1B630,
    texture_font_char_cn_1B640, texture_font_char_cn_1B650, texture_font_char_cn_1B660, texture_font_char_cn_1B670,
    texture_font_char_cn_1B680, texture_font_char_cn_1B690, texture_font_char_cn_1B6A0, texture_font_char_cn_1B6B0,
    texture_font_char_cn_1B6C0, texture_font_char_cn_1B6D0, texture_font_char_cn_1B6E0, texture_font_char_cn_1B6F0,
    texture_font_char_cn_1B700, texture_font_char_cn_1B710, texture_font_char_cn_1B720, texture_font_char_cn_1B730,
    texture_font_char_cn_1B740, texture_font_char_cn_1B750, texture_font_char_cn_1B760, texture_font_char_cn_1B770,
    texture_font_char_cn_1B780, texture_font_char_cn_1B790, texture_font_char_cn_1B7A0, texture_font_char_cn_1B7B0,
    texture_font_char_cn_1B7C0, texture_font_char_cn_1B7D0, texture_font_char_cn_1B7E0, texture_font_char_cn_1B7F0,
    texture_font_char_cn_1B800, texture_font_char_cn_1B810, texture_font_char_cn_1B820, texture_font_char_cn_1B830,
    texture_font_char_cn_1B840, texture_font_char_cn_1B850, texture_font_char_cn_1B860, texture_font_char_cn_1B870,
    texture_font_char_cn_1B880, texture_font_char_cn_1B890, texture_font_char_cn_1B8A0, texture_font_char_cn_1B8B0,
    texture_font_char_cn_1B8C0, texture_font_char_cn_1B8D0, texture_font_char_cn_1B8E0, texture_font_char_cn_1B8F0,
    texture_font_char_cn_1B900, texture_font_char_cn_1B910, texture_font_char_cn_1B920, texture_font_char_cn_1B930,
    texture_font_char_cn_1B940, texture_font_char_cn_1B950, texture_font_char_cn_1B960, texture_font_char_cn_1B970,
    texture_font_char_cn_1B980, texture_font_char_cn_1B990, texture_font_char_cn_1B9A0, texture_font_char_cn_1B9B0,
    texture_font_char_cn_1B9C0, texture_font_char_cn_1B9D0, texture_font_char_cn_1B9E0, texture_font_char_cn_1B9F0,
    texture_font_char_cn_1BA00, texture_font_char_cn_1BA10, texture_font_char_cn_1BA20, texture_font_char_cn_1BA30,
    texture_font_char_cn_1BA40, texture_font_char_cn_1BA50, texture_font_char_cn_1BA60, texture_font_char_cn_1BA70,
    texture_font_char_cn_1BA80, texture_font_char_cn_1BA90, texture_font_char_cn_1BAA0, texture_font_char_cn_1BAB0,
    texture_font_char_cn_1BAC0, texture_font_char_cn_1BAD0, texture_font_char_cn_1BAE0, texture_font_char_cn_1BAF0,
    texture_font_char_cn_1BB00, texture_font_char_cn_1BB10, texture_font_char_cn_1BB20, texture_font_char_cn_1BB30,
    texture_font_char_cn_1BB40, texture_font_char_cn_1BB50, texture_font_char_cn_1BB60, texture_font_char_cn_1BB70,
    texture_font_char_cn_1BB80, texture_font_char_cn_1BB90, texture_font_char_cn_1BBA0, texture_font_char_cn_1BBB0,
    texture_font_char_cn_1BBC0, texture_font_char_cn_1BBD0, texture_font_char_cn_1BBE0, texture_font_char_cn_1BBF0,
    texture_font_char_cn_1BC00, texture_font_char_cn_1BC10, texture_font_char_cn_1BC20, texture_font_char_cn_1BC30,
    texture_font_char_cn_1BC40, texture_font_char_cn_1BC50, texture_font_char_cn_1BC60, texture_font_char_cn_1BC70,
    texture_font_char_cn_1BC80, texture_font_char_cn_1BC90, texture_font_char_cn_1BCA0, texture_font_char_cn_1BCB0,
    texture_font_char_cn_1BCC0, texture_font_char_cn_1BCD0, texture_font_char_cn_1BCE0, texture_font_char_cn_1BCF0,
    texture_font_char_cn_1BD00, texture_font_char_cn_1BD10, texture_font_char_cn_1BD20, texture_font_char_cn_1BD30,
    texture_font_char_cn_1BD40, texture_font_char_cn_1BD50, texture_font_char_cn_1BD60, texture_font_char_cn_1BD70,
    texture_font_char_cn_1BD80, texture_font_char_cn_1BD90, texture_font_char_cn_1BDA0, texture_font_char_cn_1BDB0,
    texture_font_char_cn_1BDC0, texture_font_char_cn_1BDD0, texture_font_char_cn_1BDE0, texture_font_char_cn_1BDF0,
    texture_font_char_cn_1BE00, texture_font_char_cn_1BE10, texture_font_char_cn_1BE20, texture_font_char_cn_1BE30,
    texture_font_char_cn_1BE40, texture_font_char_cn_1BE50, texture_font_char_cn_1BE60, texture_font_char_cn_1BE70,
    texture_font_char_cn_1BE80, texture_font_char_cn_1BE90, texture_font_char_cn_1BEA0, texture_font_char_cn_1BEB0,
    texture_font_char_cn_1BEC0, texture_font_char_cn_1BED0, texture_font_char_cn_1BEE0, texture_font_char_cn_1BEF0,
    texture_font_char_cn_1BF00, texture_font_char_cn_1BF10, texture_font_char_cn_1BF20, texture_font_char_cn_1BF30,
    texture_font_char_cn_1BF40, texture_font_char_cn_1BF50, texture_font_char_cn_1BF60, texture_font_char_cn_1BF70,
    texture_font_char_cn_1BF80, texture_font_char_cn_1BF90, texture_font_char_cn_1BFA0, texture_font_char_cn_1BFB0,
    texture_font_char_cn_1BFC0, texture_font_char_cn_1BFD0, texture_font_char_cn_1BFE0, texture_font_char_cn_1BFF0,
    texture_font_char_cn_1C000, texture_font_char_cn_1C010, texture_font_char_cn_1C020, texture_font_char_cn_1C030,
    texture_font_char_cn_1C040, texture_font_char_cn_1C050, texture_font_char_cn_1C060, texture_font_char_cn_1C070,
    texture_font_char_cn_1C080, texture_font_char_cn_1C090, texture_font_char_cn_1C0A0, texture_font_char_cn_1C0B0,
    texture_font_char_cn_1C0C0, texture_font_char_cn_1C0D0, texture_font_char_cn_1C0E0, texture_font_char_cn_1C0F0,
    texture_font_char_cn_1C100, texture_font_char_cn_1C110, texture_font_char_cn_1C120, texture_font_char_cn_1C130,
    texture_font_char_cn_1C140, texture_font_char_cn_1C150, texture_font_char_cn_1C160, texture_font_char_cn_1C170,
    texture_font_char_cn_1C180, texture_font_char_cn_1C190, texture_font_char_cn_1C1A0, texture_font_char_cn_1C1B0,
    texture_font_char_cn_1C1C0, texture_font_char_cn_1C1D0, texture_font_char_cn_1C1E0, texture_font_char_cn_1C1F0,
    texture_font_char_cn_1C200, texture_font_char_cn_1C210, texture_font_char_cn_1C220, texture_font_char_cn_1C230,
    texture_font_char_cn_1C240, texture_font_char_cn_1C250, texture_font_char_cn_1C260, texture_font_char_cn_1C270,
    texture_font_char_cn_1C280, texture_font_char_cn_1C290, texture_font_char_cn_1C2A0, texture_font_char_cn_1C2B0,
    texture_font_char_cn_1C2C0, texture_font_char_cn_1C2D0, texture_font_char_cn_1C2E0, texture_font_char_cn_1C2F0,
    texture_font_char_cn_1C300, texture_font_char_cn_1C310, texture_font_char_cn_1C320, texture_font_char_cn_1C330,
    texture_font_char_cn_1C340, texture_font_char_cn_1C350, texture_font_char_cn_1C360, texture_font_char_cn_1C370,
    texture_font_char_cn_1C380, texture_font_char_cn_1C390, texture_font_char_cn_1C3A0, texture_font_char_cn_1C3B0,
    texture_font_char_cn_1C3C0, texture_font_char_cn_1C3D0, texture_font_char_cn_1C3E0, texture_font_char_cn_1C3F0,
    texture_font_char_cn_1C400, texture_font_char_cn_1C410, texture_font_char_cn_1C420, texture_font_char_cn_1C430,
    texture_font_char_cn_1C440, texture_font_char_cn_1C450, texture_font_char_cn_1C460, texture_font_char_cn_1C470,
    texture_font_char_cn_1C480, texture_font_char_cn_1C490, texture_font_char_cn_1C4A0, texture_font_char_cn_1C4B0,
    texture_font_char_cn_1C4C0, texture_font_char_cn_1C4D0, texture_font_char_cn_1C4E0, texture_font_char_cn_1C4F0,
    texture_font_char_cn_1C500, texture_font_char_cn_1C510, texture_font_char_cn_1C520, texture_font_char_cn_1C530,
    texture_font_char_cn_1C540, texture_font_char_cn_1C550, texture_font_char_cn_1C560, texture_font_char_cn_1C570,
    texture_font_char_cn_1C580, texture_font_char_cn_1C590, texture_font_char_cn_1C5A0, texture_font_char_cn_1C5B0,
    texture_font_char_cn_1C5C0, texture_font_char_cn_1C5D0, texture_font_char_cn_1C5E0, texture_font_char_cn_1C5F0,
    texture_font_char_cn_1C600, texture_font_char_cn_1C610, texture_font_char_cn_1C620, texture_font_char_cn_1C630,
    texture_font_char_cn_1C640, texture_font_char_cn_1C650, texture_font_char_cn_1C660, texture_font_char_cn_1C670,
    texture_font_char_cn_1C680, texture_font_char_cn_1C690, texture_font_char_cn_1C6A0, texture_font_char_cn_1C6B0,
    texture_font_char_cn_1C6C0, texture_font_char_cn_1C6D0, texture_font_char_cn_1C6E0, texture_font_char_cn_1C6F0,
    texture_font_char_cn_1C700, texture_font_char_cn_1C710, texture_font_char_cn_1C720, texture_font_char_cn_1C730,
    texture_font_char_cn_1C740, texture_font_char_cn_1C750, texture_font_char_cn_1C760, texture_font_char_cn_1C770,
    texture_font_char_cn_1C780, texture_font_char_cn_1C790, texture_font_char_cn_1C7A0, texture_font_char_cn_1C7B0,
    texture_font_char_cn_1C7C0, texture_font_char_cn_1C7D0, texture_font_char_cn_1C7E0, texture_font_char_cn_1C7F0,
    texture_font_char_cn_1C800, texture_font_char_cn_1C810, texture_font_char_cn_1C820, texture_font_char_cn_1C830,
    texture_font_char_cn_1C840, texture_font_char_cn_1C850, texture_font_char_cn_1C860, texture_font_char_cn_1C870,
    texture_font_char_cn_1C880, texture_font_char_cn_1C890, texture_font_char_cn_1C8A0, texture_font_char_cn_1C8B0,
    texture_font_char_cn_1C8C0, texture_font_char_cn_1C8D0, texture_font_char_cn_1C8E0, texture_font_char_cn_1C8F0,
    texture_font_char_cn_1C900, texture_font_char_cn_1C910, texture_font_char_cn_1C920, texture_font_char_cn_1C930,
    texture_font_char_cn_1C940, texture_font_char_cn_1C950, texture_font_char_cn_1C960, texture_font_char_cn_1C970,
    texture_font_char_cn_1C980, texture_font_char_cn_1C990, texture_font_char_cn_1C9A0, texture_font_char_cn_1C9B0,
    texture_font_char_cn_1C9C0, texture_font_char_cn_1C9D0, texture_font_char_cn_1C9E0, texture_font_char_cn_1C9F0,
    texture_font_char_cn_1CA00, texture_font_char_cn_1CA10, texture_font_char_cn_1CA20, texture_font_char_cn_1CA30,
    texture_font_char_cn_1CA40, texture_font_char_cn_1CA50, texture_font_char_cn_1CA60, texture_font_char_cn_1CA70,
    texture_font_char_cn_1CA80, texture_font_char_cn_1CA90, texture_font_char_cn_1CAA0, texture_font_char_cn_1CAB0,
    texture_font_char_cn_1CAC0, texture_font_char_cn_1CAD0, texture_font_char_cn_1CAE0, texture_font_char_cn_1CAF0,
    texture_font_char_cn_1CB00, texture_font_char_cn_1CB10, texture_font_char_cn_1CB20, texture_font_char_cn_1CB30,
    texture_font_char_cn_1CB40, texture_font_char_cn_1CB50, texture_font_char_cn_1CB60, texture_font_char_cn_1CB70,
    texture_font_char_cn_1CB80, texture_font_char_cn_1CB90, texture_font_char_cn_1CBA0, texture_font_char_cn_1CBB0,
    texture_font_char_cn_1CBC0, texture_font_char_cn_1CBD0, texture_font_char_cn_1CBE0, texture_font_char_cn_1CBF0,
    texture_font_char_cn_1CC00, texture_font_char_cn_1CC10, texture_font_char_cn_1CC20, texture_font_char_cn_1CC30,
    texture_font_char_cn_1CC40, texture_font_char_cn_1CC50, texture_font_char_cn_1CC60, texture_font_char_cn_1CC70,
    texture_font_char_cn_1CC80, texture_font_char_cn_1CC90, texture_font_char_cn_1CCA0, texture_font_char_cn_1CCB0,
    texture_font_char_cn_1CCC0, texture_font_char_cn_1CCD0, texture_font_char_cn_1CCE0, texture_font_char_cn_1CCF0,
    texture_font_char_cn_1CD00, texture_font_char_cn_1CD10, texture_font_char_cn_1CD20, texture_font_char_cn_1CD30,
    texture_font_char_cn_1CD40, texture_font_char_cn_1CD50, texture_font_char_cn_1CD60, texture_font_char_cn_1CD70,
    texture_font_char_cn_1CD80, texture_font_char_cn_1CD90, texture_font_char_cn_1CDA0, texture_font_char_cn_1CDB0,
    texture_font_char_cn_1CDC0, texture_font_char_cn_1CDD0, texture_font_char_cn_1CDE0, texture_font_char_cn_1CDF0,
    texture_font_char_cn_1CE00, texture_font_char_cn_1CE10, texture_font_char_cn_1CE20, texture_font_char_cn_1CE30,
    texture_font_char_cn_1CE40, texture_font_char_cn_1CE50, texture_font_char_cn_1CE60, texture_font_char_cn_1CE70,
    texture_font_char_cn_1CE80, texture_font_char_cn_1CE90, texture_font_char_cn_1CEA0, texture_font_char_cn_1CEB0,
    texture_font_char_cn_1CEC0, texture_font_char_cn_1CED0, texture_font_char_cn_1CEE0, texture_font_char_cn_1CEF0,
    texture_font_char_cn_1CF00, texture_font_char_cn_1CF10, texture_font_char_cn_1CF20, texture_font_char_cn_1CF30,
    texture_font_char_cn_1CF40, texture_font_char_cn_1CF50, texture_font_char_cn_1CF60, texture_font_char_cn_1CF70,
    texture_font_char_cn_1CF80, texture_font_char_cn_1CF90, texture_font_char_cn_1CFA0, texture_font_char_cn_1CFB0,
    texture_font_char_cn_1CFC0, texture_font_char_cn_1CFD0, texture_font_char_cn_1CFE0, texture_font_char_cn_1CFF0,
    texture_font_char_cn_1D000, texture_font_char_cn_1D010, texture_font_char_cn_1D020, texture_font_char_cn_1D030,
    texture_font_char_cn_1D040, texture_font_char_cn_1D050, texture_font_char_cn_1D060, texture_font_char_cn_1D070,
    texture_font_char_cn_1D080, texture_font_char_cn_1D090, texture_font_char_cn_1D0A0, texture_font_char_cn_1D0B0,
    texture_font_char_cn_1D0C0, texture_font_char_cn_1D0D0, texture_font_char_cn_1D0E0, texture_font_char_cn_1D0F0,
    texture_font_char_cn_1D100, texture_font_char_cn_1D110, texture_font_char_cn_1D120, texture_font_char_cn_1D130,
    texture_font_char_cn_1D140, texture_font_char_cn_1D150, texture_font_char_cn_1D160, texture_font_char_cn_1D170,
    texture_font_char_cn_1D180, texture_font_char_cn_1D190, texture_font_char_cn_1D1A0, texture_font_char_cn_1D1B0,
    texture_font_char_cn_1D1C0, texture_font_char_cn_1D1D0, texture_font_char_cn_1D1E0, texture_font_char_cn_1D1F0,
    texture_font_char_cn_1D200, texture_font_char_cn_1D210, texture_font_char_cn_1D220, texture_font_char_cn_1D230,
    texture_font_char_cn_1D240, texture_font_char_cn_1D250, texture_font_char_cn_1D260, texture_font_char_cn_1D270,
    texture_font_char_cn_1D280, texture_font_char_cn_1D290, texture_font_char_cn_1D2A0, texture_font_char_cn_1D2B0,
    texture_font_char_cn_1D2C0, texture_font_char_cn_1D2D0, texture_font_char_cn_1D2E0, texture_font_char_cn_1D2F0,
    texture_font_char_cn_1D300, texture_font_char_cn_1D310, texture_font_char_cn_1D320, texture_font_char_cn_1D330,
    texture_font_char_cn_1D340, texture_font_char_cn_1D350, texture_font_char_cn_1D360, texture_font_char_cn_1D370,
    texture_font_char_cn_1D380, texture_font_char_cn_1D390, texture_font_char_cn_1D3A0, texture_font_char_cn_1D3B0,
    texture_font_char_cn_1D3C0, texture_font_char_cn_1D3D0, texture_font_char_cn_1D3E0, texture_font_char_cn_1D3F0,
    texture_font_char_cn_1D400, texture_font_char_cn_1D410, texture_font_char_cn_1D420, texture_font_char_cn_1D430,
    texture_font_char_cn_1D440, texture_font_char_cn_1D450, texture_font_char_cn_1D460, texture_font_char_cn_1D470,
    texture_font_char_cn_1D480, texture_font_char_cn_1D490, texture_font_char_cn_1D4A0, texture_font_char_cn_1D4B0,
    texture_font_char_cn_1D4C0, texture_font_char_cn_1D4D0, texture_font_char_cn_1D4E0, texture_font_char_cn_1D4F0,
    texture_font_char_cn_1D500, texture_font_char_cn_1D510, texture_font_char_cn_1D520, texture_font_char_cn_1D530,
    texture_font_char_cn_1D540, texture_font_char_cn_1D550, texture_font_char_cn_1D560, texture_font_char_cn_1D570,
    texture_font_char_cn_1D580, texture_font_char_cn_1D590, texture_font_char_cn_1D5A0, texture_font_char_cn_1D5B0,
    texture_font_char_cn_1D5C0, texture_font_char_cn_1D5D0, texture_font_char_cn_1D5E0, texture_font_char_cn_1D5F0,
    texture_font_char_cn_1D600, texture_font_char_cn_1D610, texture_font_char_cn_1D620, texture_font_char_cn_1D630,
    texture_font_char_cn_1D640, texture_font_char_cn_1D650, texture_font_char_cn_1D660, texture_font_char_cn_1D670,
    texture_font_char_cn_1D680, texture_font_char_cn_1D690, texture_font_char_cn_1D6A0, texture_font_char_cn_1D6B0,
    texture_font_char_cn_1D6C0, texture_font_char_cn_1D6D0, texture_font_char_cn_1D6E0, texture_font_char_cn_1D6F0,
    texture_font_char_cn_1D700, texture_font_char_cn_1D710, texture_font_char_cn_1D720, texture_font_char_cn_1D730,
    texture_font_char_cn_1D740, texture_font_char_cn_1D750, texture_font_char_cn_1D760, texture_font_char_cn_1D770,
    texture_font_char_cn_1D780, texture_font_char_cn_1D790, texture_font_char_cn_1D7A0, texture_font_char_cn_1D7B0,
    texture_font_char_cn_1D7C0, texture_font_char_cn_1D7D0, texture_font_char_cn_1D7E0, texture_font_char_cn_1D7F0,
    texture_font_char_cn_1D800, texture_font_char_cn_1D810, texture_font_char_cn_1D820, texture_font_char_cn_1D830,
    texture_font_char_cn_1D840, texture_font_char_cn_1D850, texture_font_char_cn_1D860, texture_font_char_cn_1D870,
    texture_font_char_cn_1D880, texture_font_char_cn_1D890, texture_font_char_cn_1D8A0, texture_font_char_cn_1D8B0,
    texture_font_char_cn_1D8C0, texture_font_char_cn_1D8D0, texture_font_char_cn_1D8E0, texture_font_char_cn_1D8F0,
    texture_font_char_cn_1D900, texture_font_char_cn_1D910, texture_font_char_cn_1D920, texture_font_char_cn_1D930,
    texture_font_char_cn_1D940, texture_font_char_cn_1D950, texture_font_char_cn_1D960, texture_font_char_cn_1D970,
    texture_font_char_cn_1D980, texture_font_char_cn_1D990, texture_font_char_cn_1D9A0, texture_font_char_cn_1D9B0,
    texture_font_char_cn_1D9C0, texture_font_char_cn_1D9D0, texture_font_char_cn_1D9E0, texture_font_char_cn_1D9F0,
    texture_font_char_cn_1DA00, texture_font_char_cn_1DA10, texture_font_char_cn_1DA20, texture_font_char_cn_1DA30,
    texture_font_char_cn_1DA40, texture_font_char_cn_1DA50, texture_font_char_cn_1DA60, texture_font_char_cn_1DA70,
    texture_font_char_cn_1DA80, texture_font_char_cn_1DA90, texture_font_char_cn_1DAA0, texture_font_char_cn_1DAB0,
    texture_font_char_cn_1DAC0, texture_font_char_cn_1DAD0, texture_font_char_cn_1DAE0, texture_font_char_cn_1DAF0,
    texture_font_char_cn_1DB00, texture_font_char_cn_1DB10, texture_font_char_cn_1DB20, texture_font_char_cn_1DB30,
    texture_font_char_cn_1DB40, texture_font_char_cn_1DB50, texture_font_char_cn_1DB60, texture_font_char_cn_1DB70,
    texture_font_char_cn_1DB80, texture_font_char_cn_1DB90, texture_font_char_cn_1DBA0, texture_font_char_cn_1DBB0,
    texture_font_char_cn_1DBC0, texture_font_char_cn_1DBD0, texture_font_char_cn_1DBE0, texture_font_char_cn_1DBF0,
    texture_font_char_cn_1DC00, texture_font_char_cn_1DC10, texture_font_char_cn_1DC20, texture_font_char_cn_1DC30,
    texture_font_char_cn_1DC40, texture_font_char_cn_1DC50, texture_font_char_cn_1DC60, texture_font_char_cn_1DC70,
    texture_font_char_cn_1DC80, texture_font_char_cn_1DC90, texture_font_char_cn_1DCA0, texture_font_char_cn_1DCB0,
    texture_font_char_cn_1DCC0, texture_font_char_cn_1DCD0, texture_font_char_cn_1DCE0, texture_font_char_cn_1DCF0,
    texture_font_char_cn_1DD00, texture_font_char_cn_1DD10, texture_font_char_cn_1DD20, texture_font_char_cn_1DD30,
    texture_font_char_cn_1DD40, texture_font_char_cn_1DD50, texture_font_char_cn_1DD60, texture_font_char_cn_1DD70,
    texture_font_char_cn_1DD80, texture_font_char_cn_1DD90, texture_font_char_cn_1DDA0, texture_font_char_cn_1DDB0,
    texture_font_char_cn_1DDC0, texture_font_char_cn_1DDD0, texture_font_char_cn_1DDE0, texture_font_char_cn_1DDF0,
    texture_font_char_cn_1DE00, texture_font_char_cn_1DE10, texture_font_char_cn_1DE20, texture_font_char_cn_1DE30,
    texture_font_char_cn_1DE40, texture_font_char_cn_1DE50, texture_font_char_cn_1DE60, texture_font_char_cn_1DE70,
    texture_font_char_cn_1DE80, texture_font_char_cn_1DE90, texture_font_char_cn_1DEA0, texture_font_char_cn_1DEB0,
    texture_font_char_cn_1DEC0, texture_font_char_cn_1DED0, texture_font_char_cn_1DEE0, texture_font_char_cn_1DEF0,
    texture_font_char_cn_1DF00, texture_font_char_cn_1DF10, texture_font_char_cn_1DF20, texture_font_char_cn_1DF30,
    texture_font_char_cn_1DF40, texture_font_char_cn_1DF50, texture_font_char_cn_1DF60, texture_font_char_cn_1DF70,
    texture_font_char_cn_1DF80, texture_font_char_cn_1DF90, texture_font_char_cn_1DFA0, texture_font_char_cn_1DFB0,
    texture_font_char_cn_1DFC0, texture_font_char_cn_1DFD0, texture_font_char_cn_1DFE0, texture_font_char_cn_1DFF0,
    texture_font_char_cn_1E000, texture_font_char_cn_1E010, texture_font_char_cn_1E020, texture_font_char_cn_1E030,
    texture_font_char_cn_1E040, texture_font_char_cn_1E050, texture_font_char_cn_1E060, texture_font_char_cn_1E070,
    texture_font_char_cn_1E080, texture_font_char_cn_1E090, texture_font_char_cn_1E0A0, texture_font_char_cn_1E0B0,
    texture_font_char_cn_1E0C0, texture_font_char_cn_1E0D0, texture_font_char_cn_1E0E0, texture_font_char_cn_1E0F0,
    texture_font_char_cn_1E100, texture_font_char_cn_1E110, texture_font_char_cn_1E120, texture_font_char_cn_1E130,
    texture_font_char_cn_1E140, texture_font_char_cn_1E150, texture_font_char_cn_1E160, texture_font_char_cn_1E170,
    texture_font_char_cn_1E180, texture_font_char_cn_1E190, texture_font_char_cn_1E1A0, texture_font_char_cn_1E1B0,
    texture_font_char_cn_1E1C0, texture_font_char_cn_1E1D0, texture_font_char_cn_1E1E0, texture_font_char_cn_1E1F0,
    texture_font_char_cn_1E200, texture_font_char_cn_1E210, texture_font_char_cn_1E220, texture_font_char_cn_1E230,
    texture_font_char_cn_1E240, texture_font_char_cn_1E250, texture_font_char_cn_1E260, texture_font_char_cn_1E270,
    texture_font_char_cn_1E280, texture_font_char_cn_1E290, texture_font_char_cn_1E2A0, texture_font_char_cn_1E2B0,
    texture_font_char_cn_1E2C0, texture_font_char_cn_1E2D0, texture_font_char_cn_1E2E0, texture_font_char_cn_1E2F0,
    texture_font_char_cn_1E300, texture_font_char_cn_1E310, texture_font_char_cn_1E320, texture_font_char_cn_1E330,
    texture_font_char_cn_1E340, texture_font_char_cn_1E350, texture_font_char_cn_1E360, texture_font_char_cn_1E370,
    texture_font_char_cn_1E380, texture_font_char_cn_1E390, texture_font_char_cn_1E3A0, texture_font_char_cn_1E3B0,
    texture_font_char_cn_1E3C0, texture_font_char_cn_1E3D0, texture_font_char_cn_1E3E0, texture_font_char_cn_1E3F0,
    texture_font_char_cn_1E400, texture_font_char_cn_1E410, texture_font_char_cn_1E420, texture_font_char_cn_1E430,
    texture_font_char_cn_1E440, texture_font_char_cn_1E450, texture_font_char_cn_1E460, texture_font_char_cn_1E470,
    texture_font_char_cn_1E480, texture_font_char_cn_1E490, texture_font_char_cn_1E4A0, texture_font_char_cn_1E4B0,
    texture_font_char_cn_1E4C0, texture_font_char_cn_1E4D0, texture_font_char_cn_1E4E0, texture_font_char_cn_1E4F0,
    texture_font_char_cn_1E500, texture_font_char_cn_1E510, texture_font_char_cn_1E520, texture_font_char_cn_1E530,
    texture_font_char_cn_1E540, texture_font_char_cn_1E550, texture_font_char_cn_1E560, texture_font_char_cn_1E570,
    texture_font_char_cn_1E580, texture_font_char_cn_1E590, texture_font_char_cn_1E5A0, texture_font_char_cn_1E5B0,
    texture_font_char_cn_1E5C0, texture_font_char_cn_1E5D0, texture_font_char_cn_1E5E0, texture_font_char_cn_1E5F0,
    texture_font_char_cn_1E600, texture_font_char_cn_1E610, texture_font_char_cn_1E620, texture_font_char_cn_1E630,
    texture_font_char_cn_1E640, texture_font_char_cn_1E650, texture_font_char_cn_1E660, texture_font_char_cn_1E670,
    texture_font_char_cn_1E680, texture_font_char_cn_1E690, texture_font_char_cn_1E6A0, texture_font_char_cn_1E6B0,
    texture_font_char_cn_1E6C0, texture_font_char_cn_1E6D0, texture_font_char_cn_1E6E0, texture_font_char_cn_1E6F0,
    texture_font_char_cn_1E700, texture_font_char_cn_1E710, texture_font_char_cn_1E720, texture_font_char_cn_1E730,
    texture_font_char_cn_1E740, texture_font_char_cn_1E750, texture_font_char_cn_1E760, texture_font_char_cn_1E770,
    texture_font_char_cn_1E780, texture_font_char_cn_1E790, texture_font_char_cn_1E7A0, texture_font_char_cn_1E7B0,
    texture_font_char_cn_1E7C0, texture_font_char_cn_1E7D0, texture_font_char_cn_1E7E0, texture_font_char_cn_1E7F0,
    texture_font_char_cn_1E800, texture_font_char_cn_1E810, texture_font_char_cn_1E820, texture_font_char_cn_1E830,
    texture_font_char_cn_1E840, texture_font_char_cn_1E850, texture_font_char_cn_1E860, texture_font_char_cn_1E870,
    texture_font_char_cn_1E880, texture_font_char_cn_1E890, texture_font_char_cn_1E8A0, texture_font_char_cn_1E8B0,
    texture_font_char_cn_1E8C0, texture_font_char_cn_1E8D0, texture_font_char_cn_1E8E0, texture_font_char_cn_1E8F0,
    texture_font_char_cn_1E900, texture_font_char_cn_1E910, texture_font_char_cn_1E920, texture_font_char_cn_1E930,
    texture_font_char_cn_1E940, texture_font_char_cn_1E950, texture_font_char_cn_1E960, texture_font_char_cn_1E970,
    texture_font_char_cn_1E980, texture_font_char_cn_1E990, texture_font_char_cn_1E9A0, texture_font_char_cn_1E9B0,
    texture_font_char_cn_1E9C0, texture_font_char_cn_1E9D0, texture_font_char_cn_1E9E0, texture_font_char_cn_1E9F0,
    texture_font_char_cn_1EA00, texture_font_char_cn_1EA10, texture_font_char_cn_1EA20, texture_font_char_cn_1EA30,
    texture_font_char_cn_1EA40, texture_font_char_cn_1EA50, texture_font_char_cn_1EA60, texture_font_char_cn_1EA70,
    texture_font_char_cn_1EA80, texture_font_char_cn_1EA90, texture_font_char_cn_1EAA0, texture_font_char_cn_1EAB0,
    texture_font_char_cn_1EAC0, texture_font_char_cn_1EAD0, texture_font_char_cn_1EAE0, texture_font_char_cn_1EAF0,
    texture_font_char_cn_1EB00, texture_font_char_cn_1EB10, texture_font_char_cn_1EB20, texture_font_char_cn_1EB30,
    texture_font_char_cn_1EB40, texture_font_char_cn_1EB50, texture_font_char_cn_1EB60, texture_font_char_cn_1EB70,
    texture_font_char_cn_1EB80, texture_font_char_cn_1EB90, texture_font_char_cn_1EBA0, texture_font_char_cn_1EBB0,
    texture_font_char_cn_1EBC0, texture_font_char_cn_1EBD0, texture_font_char_cn_1EBE0, texture_font_char_cn_1EBF0,
    texture_font_char_cn_1EC00, texture_font_char_cn_1EC10, texture_font_char_cn_1EC20, texture_font_char_cn_1EC30,
    texture_font_char_cn_1EC40, texture_font_char_cn_1EC50, texture_font_char_cn_1EC60, texture_font_char_cn_1EC70,
    texture_font_char_cn_1EC80, texture_font_char_cn_1EC90, texture_font_char_cn_1ECA0, texture_font_char_cn_1ECB0,
    texture_font_char_cn_1ECC0, texture_font_char_cn_1ECD0, texture_font_char_cn_1ECE0, texture_font_char_cn_1ECF0,
    texture_font_char_cn_1ED00, texture_font_char_cn_1ED10, texture_font_char_cn_1ED20, texture_font_char_cn_1ED30,
    texture_font_char_cn_1ED40, texture_font_char_cn_1ED50, texture_font_char_cn_1ED60, texture_font_char_cn_1ED70,
    texture_font_char_cn_1ED80, texture_font_char_cn_1ED90, texture_font_char_cn_1EDA0, texture_font_char_cn_1EDB0,
    texture_font_char_cn_1EDC0, texture_font_char_cn_1EDD0, texture_font_char_cn_1EDE0, texture_font_char_cn_1EDF0,
    texture_font_char_cn_1EE00, texture_font_char_cn_1EE10, texture_font_char_cn_1EE20, texture_font_char_cn_1EE30,
    texture_font_char_cn_1EE40, texture_font_char_cn_1EE50, texture_font_char_cn_1EE60, texture_font_char_cn_1EE70,
#endif // VERSION_CN
#elif defined(VERSION_JP) || defined(VERSION_SH)
    texture_font_char_jp_0, texture_font_char_jp_1, texture_font_char_jp_2, texture_font_char_jp_3,
    texture_font_char_jp_4, texture_font_char_jp_5, texture_font_char_jp_6, texture_font_char_jp_7,
    texture_font_char_jp_8, texture_font_char_jp_9, texture_font_char_jp_A, texture_font_char_jp_B,
    texture_font_char_jp_C, texture_font_char_jp_D, texture_font_char_jp_E, texture_font_char_jp_F,
    texture_font_char_jp_G, texture_font_char_jp_H, texture_font_char_jp_I, texture_font_char_jp_J,
    texture_font_char_jp_K, texture_font_char_jp_L, texture_font_char_jp_M, texture_font_char_jp_N,
    texture_font_char_jp_O, texture_font_char_jp_P, texture_font_char_jp_Q, texture_font_char_jp_R,
    texture_font_char_jp_S, texture_font_char_jp_T, texture_font_char_jp_U, texture_font_char_jp_V,
    texture_font_char_jp_W, texture_font_char_jp_X, texture_font_char_jp_Y, texture_font_char_jp_Z,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
    texture_font_char_jp_hiragana_a, texture_font_char_jp_hiragana_i, texture_font_char_jp_hiragana_u, texture_font_char_jp_hiragana_c,
    texture_font_char_jp_hiragana_o, texture_font_char_jp_hiragana_ka, texture_font_char_jp_hiragana_ki, texture_font_char_jp_hiragana_ku,
    texture_font_char_jp_hiragana_ke, texture_font_char_jp_hiragana_ko, texture_font_char_jp_hiragana_sa, texture_font_char_jp_hiragana_shi,
    texture_font_char_jp_hiragana_su, texture_font_char_jp_hiragana_se, texture_font_char_jp_hiragana_so, texture_font_char_jp_hiragana_ta,
    texture_font_char_jp_hiragana_chi, texture_font_char_jp_hiragana_tsu, texture_font_char_jp_hiragana_te, texture_font_char_jp_hiragana_to,
    texture_font_char_jp_hiragana_na, texture_font_char_jp_hiragana_ni, texture_font_char_jp_hiragana_nu, texture_font_char_jp_hiragana_ne,
    texture_font_char_jp_hiragana_no, texture_font_char_jp_hiragana_ha, texture_font_char_jp_hiragana_hi, texture_font_char_jp_hiragana_hu,
    texture_font_char_jp_hiragana_he, texture_font_char_jp_hiragana_ho, texture_font_char_jp_hiragana_ma, texture_font_char_jp_hiragana_mi,
    texture_font_char_jp_hiragana_mu, texture_font_char_jp_hiragana_me, texture_font_char_jp_hiragana_mo, texture_font_char_jp_hiragana_ya,
    texture_font_char_jp_hiragana_yu, texture_font_char_jp_hiragana_yo, texture_font_char_jp_hiragana_ra, texture_font_char_jp_hiragana_ri,
    texture_font_char_jp_hiragana_ru, texture_font_char_jp_hiragana_re, texture_font_char_jp_hiragana_ro, texture_font_char_jp_hiragana_wa,
    texture_font_char_jp_hiragana_wo, texture_font_char_jp_hiragana_n,                   0x0, texture_font_char_jp_comma,
    texture_font_char_jp_katakana_a, texture_font_char_jp_katakana_i, texture_font_char_jp_katakana_u, texture_font_char_jp_katakana_e,
    texture_font_char_jp_katakana_o, texture_font_char_jp_katakana_ka, texture_font_char_jp_katakana_ki, texture_font_char_jp_katakana_ku,
    texture_font_char_jp_katakana_ke, texture_font_char_jp_katakana_ko, texture_font_char_jp_katakana_sa, texture_font_char_jp_katakana_shi,
    texture_font_char_jp_katakana_su, texture_font_char_jp_katakana_se, texture_font_char_jp_katakana_so, texture_font_char_jp_katakana_ta,
    texture_font_char_jp_katakana_chi, texture_font_char_jp_katakana_tsu, texture_font_char_jp_katakana_te, texture_font_char_jp_katakana_to,
    texture_font_char_jp_katakana_na, texture_font_char_jp_katakana_ni, texture_font_char_jp_katakana_nu, texture_font_char_jp_katakana_ne,
    texture_font_char_jp_katakana_no, texture_font_char_jp_katakana_ha, texture_font_char_jp_katakana_hi, texture_font_char_jp_katakana_hu,
    texture_font_char_jp_katakana_he, texture_font_char_jp_katakana_ho, texture_font_char_jp_katakana_ma, texture_font_char_jp_katakana_mi,
    texture_font_char_jp_katakana_mu, texture_font_char_jp_katakana_me, texture_font_char_jp_katakana_mo, texture_font_char_jp_katakana_ya,
    texture_font_char_jp_katakana_yu, texture_font_char_jp_katakana_yo, texture_font_char_jp_katakana_ra, texture_font_char_jp_katakana_ri,
    texture_font_char_jp_katakana_ru, texture_font_char_jp_katakana_re, texture_font_char_jp_katakana_ro, texture_font_char_jp_katakana_wa,
                      0x0, texture_font_char_jp_katakana_n,                   0x0, texture_font_char_jp_long_vowel,
    texture_font_char_jp_hiragana_small_e, texture_font_char_jp_hiragana_small_tsu, texture_font_char_jp_hiragana_small_ya, texture_font_char_jp_hiragana_small_yu,
    texture_font_char_jp_hiragana_small_yo, texture_font_char_jp_hiragana_small_a, texture_font_char_jp_hiragana_small_i, texture_font_char_jp_hiragana_small_u,
    texture_font_char_jp_hiragana_small_o,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
    texture_font_char_jp_katakana_small_e, texture_font_char_jp_katakana_small_tsu, texture_font_char_jp_katakana_small_ya, texture_font_char_jp_katakana_small_yu,
    texture_font_char_jp_katakana_small_yo, texture_font_char_jp_katakana_small_a, texture_font_char_jp_katakana_small_i, texture_font_char_jp_katakana_small_u,
    texture_font_char_jp_katakana_small_o,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0, texture_font_char_jp_open_parentheses, texture_font_char_jp_close_open_parentheses, texture_font_char_jp_close_parentheses,
    texture_font_char_jp_left_right_arrow,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
                      0x0,                   0x0,                   0x0,                   0x0,
    texture_font_char_jp_dakuten, texture_font_char_jp_handakuten, texture_font_char_jp_exclamation, texture_font_char_jp_percent,
    texture_font_char_jp_question, texture_font_char_jp_double_quotation_open, texture_font_char_jp_double_quotation_close, texture_font_char_jp_wave_dash,
    texture_font_char_jp_ellipsis, texture_font_char_jp_coin, texture_font_char_jp_star_filled, texture_font_char_jp_multiply,
    texture_font_char_jp_interpunct, texture_font_char_jp_star_hollow,                   0x0,                   0x0,
#endif
};

// credits font LUT 0x02008738-0x020087CB
const Texture *const main_credits_font_lut[] = {
                       0x0,                    0x0,                    0x0, texture_credits_char_3,
    texture_credits_char_4,                    0x0, texture_credits_char_6,                    0x0,
                       0x0,                    0x0, texture_credits_char_A, texture_credits_char_B,
    texture_credits_char_C, texture_credits_char_D, texture_credits_char_E, texture_credits_char_F,
    texture_credits_char_G, texture_credits_char_H, texture_credits_char_I, texture_credits_char_J,
    texture_credits_char_K, texture_credits_char_L, texture_credits_char_M, texture_credits_char_N,
    texture_credits_char_O, texture_credits_char_P, texture_credits_char_Q, texture_credits_char_R,
    texture_credits_char_S, texture_credits_char_T, texture_credits_char_U, texture_credits_char_V,
    texture_credits_char_W, texture_credits_char_X, texture_credits_char_Y, texture_credits_char_Z,
    texture_credits_char_period,
};

// HUD camera table 0x020087CC-0x020087E3
const Texture *const main_hud_camera_lut[] = {
    texture_hud_char_camera, texture_hud_char_mario_head, texture_hud_char_lakitu, texture_hud_char_no_camera,
    texture_hud_char_arrow_up, texture_hud_char_arrow_down,
};

#include "text/debug_text.raw.inc.c"

// If you change the language here, the following Makefile rule also needs to
// change, to generate the right version of define_text.inc.c:
// $(BUILD_DIR)/bin/segment2.o: $(BUILD_DIR)/text/$(VERSION)/define_text.inc.c
#if defined(VERSION_JP) || defined(VERSION_SH)
#include "text/jp/define_text.inc.c"
#elif defined(VERSION_US)
#include "text/us/define_text.inc.c"
#elif defined(VERSION_CN)
#include "text/cn/define_text.inc.c"
#endif

UNUSED static const u64 segment2_unused_0 = 0;

// 0x0200EC60 - 0x0200EC98
const Gfx dl_hud_img_begin[] = {
    gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_COPY),
    gsDPSetTexturePersp(G_TP_NONE),
    gsDPSetAlphaCompare(G_AC_THRESHOLD),
    gsDPSetBlendColor(255, 255, 255, 255),
#if defined(VERSION_JP) || defined(VERSION_US)
    gsDPSetRenderMode(G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2),
#else
    gsDPSetRenderMode(G_RM_NOOP, G_RM_NOOP2),
#endif
#ifdef VERSION_EU
    gsDPSetTextureFilter(G_TF_POINT),
#endif
    gsSPEndDisplayList(),
};

// 0x0200EC98 - 0x0200ECC8
const Gfx dl_hud_img_load_tex_block[] = {
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (16 - 1) << G_TEXTURE_IMAGE_FRAC, (16 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x0200ECC8 - 0x0200ED00
const Gfx dl_hud_img_end[] = {
    gsDPPipeSync(),
    gsDPSetTexturePersp(G_TP_PERSP),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetAlphaCompare(G_AC_NONE),
#ifdef VERSION_EU
    gsDPSetTextureFilter(G_TF_BILERP),
#endif
    gsDPSetCycleType(G_CYC_1CYCLE),
#if defined(VERSION_JP) || defined(VERSION_US)
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
#endif
    gsSPEndDisplayList(),
};

// 0x0200ED00 - 0x0200ED38
const Gfx dl_rgba16_text_begin[] = {
    gsDPPipeSync(),
    gsDPSetTexturePersp(G_TP_NONE),
    gsDPSetCombineMode(G_CC_FADEA, G_CC_FADEA),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsDPSetRenderMode(G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2),
    gsDPSetTextureFilter(G_TF_POINT),
    gsSPEndDisplayList(),
};

// 0x0200ED38 - 0x0200ED68
const Gfx dl_rgba16_load_tex_block[] = {
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (16 - 1) << G_TEXTURE_IMAGE_FRAC, (16 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x0200ED68 - 0x0200EDA8
const Gfx dl_rgba16_text_end[] = {
    gsDPPipeSync(),
    gsDPSetTexturePersp(G_TP_PERSP),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsSPEndDisplayList(),
};

// 0x0200EDA8 - 0x0200EDE8
static const Vtx vertex_text_bg_box[] = {
    {{{     0,    -80,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   130,    -80,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   130,      0,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x0200EDE8 - 0x0200EE28
const Gfx dl_draw_text_bg_box[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_FADE, G_CC_FADE),
    gsDPSetRenderMode(G_RM_XLU_SURF, G_RM_XLU_SURF2),
    gsSPVertex(vertex_text_bg_box, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
};

#ifndef VERSION_EU
// 0x0200EE28 - 0x0200EE68
static const Vtx vertex_ia8_char[] = {
#if defined(VERSION_JP) || defined(VERSION_SH)
    {{{     0,      0,      0}, 0, {     0,   1024}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,      0,      0}, 0, {   512,   1024}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,     16,      0}, 0, {   512,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,     16,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
#elif defined(VERSION_CN)
    {{{     0,      0,      0}, 0, {     0,    256}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,      0,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,     16,      0}, 0, {   512,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,     16,      0}, 0, {   512,    256}, {0xff, 0xff, 0xff, 0xff}}},
#else
    {{{     0,      0,      0}, 0, {     0,    256}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,      0,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,     16,      0}, 0, {   480,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,     16,      0}, 0, {   480,    256}, {0xff, 0xff, 0xff, 0xff}}},
#endif
};
// !EU
#endif

#ifdef VERSION_EU
// 0x020073B0
const Gfx dl_ia_text_begin[] = {
    gsDPPipeSync(),
    gsDPSetTexturePersp(G_TP_NONE),
    gsDPSetCombineMode(G_CC_FADEA, G_CC_FADEA),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsDPSetRenderMode(G_RM_XLU_SURF, G_RM_XLU_SURF2),
    gsDPSetTextureFilter(G_TF_POINT),
    gsSPEndDisplayList(),
};

// 0x020073E8 - 0x02007418
const Gfx dl_ia_text_tex_settings[] = {
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_MIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_MIRROR, 4, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, ((16 * 8 + G_IM_SIZ_4b_INCR) >> G_IM_SIZ_4b_SHIFT) - 1, CALC_DXT(16, G_IM_SIZ_4b_BYTES)),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_4b, 1, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_MIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_MIRROR, 4, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (16 - 1) << G_TEXTURE_IMAGE_FRAC, (8 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x02007418 - 0x02007450
const Gfx dl_ia_text_end[] = {
    gsDPPipeSync(),
    gsDPSetTexturePersp(G_TP_PERSP),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsSPEndDisplayList(),
};

#elif defined(VERSION_US) || defined(VERSION_CN)
const Gfx dl_ia_text_begin[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_FADEA, G_CC_FADEA),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsDPSetRenderMode(G_RM_XLU_SURF, G_RM_XLU_SURF2),
    gsDPSetTextureFilter(G_TF_POINT),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPEndDisplayList(),
};

const Gfx dl_ia_text_tex_settings[] = {
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, ((16 * 8 + G_IM_SIZ_4b_INCR) >> G_IM_SIZ_4b_SHIFT) - 1, CALC_DXT(16, G_IM_SIZ_4b_BYTES)),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_4b, 1, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (16 - 1) << G_TEXTURE_IMAGE_FRAC, (8 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPVertex(vertex_ia8_char, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0, 0,  2,  3, 0x0),
    gsSPEndDisplayList(),
};

#else
// 0x0200EE68 - 0x0200EEA8
const Gfx dl_ia_text_begin[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_FADEA, G_CC_FADEA),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsDPSetRenderMode(G_RM_XLU_SURF, G_RM_XLU_SURF2),
    gsDPSetTextureFilter(G_TF_POINT),
    gsSPTexture(0x8000, 0x8000, 0, G_TX_RENDERTILE, G_ON),
    gsSPEndDisplayList(),
};

// 0x0200EEA8 - 0x0200EEF0
const Gfx dl_ia_text_tex_settings[] = {
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP, 4, G_TX_NOLOD, G_TX_CLAMP, 3, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 8 * 16 - 1, CALC_DXT(8, G_IM_SIZ_8b_BYTES)),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 1, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 4, G_TX_NOLOD, G_TX_CLAMP, 3, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (8 - 1) << G_TEXTURE_IMAGE_FRAC, (16 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPVertex(vertex_ia8_char, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0, 0,  2,  3, 0x0),
    gsSPEndDisplayList(),
};
#endif

#ifndef VERSION_EU
// 0x0200EEF0 - 0x0200EF30
const Gfx dl_ia_text_end[] = {
    gsDPPipeSync(),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPSetGeometryMode(G_LIGHTING | G_SHADING_SMOOTH),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsSPEndDisplayList(),
};
#endif

// 0x0200EF30 - 0x0200EF60
static const Vtx vertex_triangle[] = {
    {{{     0,      0,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     8,      8,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,     16,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x0200EF60 - 0x0200EFB0
const Gfx dl_draw_triangle[] = {
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_FADE, G_CC_FADE),
    gsDPSetRenderMode(G_RM_XLU_SURF, G_RM_XLU_SURF2),
    gsDPSetTextureFilter(G_TF_POINT),
    gsSPVertex(vertex_triangle, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPSetGeometryMode(G_LIGHTING),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x0200EFB0 - 0x0200EFF0
static const Vtx vertex_billboard_num[] = {
    {{{   -32,    -32,      0}, 0, {     0,   1024}, {0xff, 0xff, 0xff, 0xff}}},
    {{{    32,    -32,      0}, 0, {  1024,   1024}, {0xff, 0xff, 0xff, 0xff}}},
    {{{    32,     32,      0}, 0, {  1024,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{   -32,     32,      0}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x0200EFF0 - 0x0200F038
const Gfx dl_billboard_num_begin[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0x8000, 0x8000, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 4, G_TX_NOLOD, G_TX_CLAMP, 4, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (16 - 1) << G_TEXTURE_IMAGE_FRAC, (16 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x0200F038 - 0x0200F078
const Gfx dl_billboard_num_end[] = {
    gsSPVertex(vertex_billboard_num, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0x8000, 0x8000, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
};

// 0x0200F078 - 0x0200F0A8
const Gfx dl_billboard_num_0[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_0),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F0A8 - 0x0200F0D8
const Gfx dl_billboard_num_1[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_1),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F0D8 - 0x0200F108
const Gfx dl_billboard_num_2[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_2),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F108 - 0x0200F138
const Gfx dl_billboard_num_3[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_3),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F138 - 0x0200F168
const Gfx dl_billboard_num_4[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_4),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F168 - 0x0200F198
const Gfx dl_billboard_num_5[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_5),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F198 - 0x0200F1C8
const Gfx dl_billboard_num_6[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_6),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F1C8 - 0x0200F1F8
const Gfx dl_billboard_num_7[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_7),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F1F8 - 0x0200F228
const Gfx dl_billboard_num_8[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_8),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

// 0x0200F228 - 0x0200F258
const Gfx dl_billboard_num_9[] = {
    gsSPDisplayList(dl_billboard_num_begin),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_hud_char_9),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 16 - 1, CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(dl_billboard_num_end),
    gsSPEndDisplayList(),
};

ALIGNED8 static const Texture texture_shadow_quarter_circle[] = {
#include "textures/segment2/shadow_quarter_circle.ia8.inc.c"
};

ALIGNED8 static const Texture texture_shadow_quarter_square[] = {
#include "textures/segment2/shadow_quarter_square.ia8.inc.c"
};

const Texture texture_transition_star_half[] = {
#include "textures/segment2/segment2.0F458.ia8.inc.c"
};

const Texture texture_transition_circle_half[] = {
#include "textures/segment2/segment2.0FC58.ia8.inc.c"
};

const Texture texture_transition_mario[] = {
#include "textures/segment2/segment2.10458.ia8.inc.c"
};

const Texture texture_transition_bowser_half[] = {
#include "textures/segment2/segment2.11458.ia8.inc.c"
};

const Texture texture_waterbox_water[] = {
#include "textures/segment2/segment2.11C58.rgba16.inc.c"
};

const Texture texture_waterbox_jrb_water[] = {
#include "textures/segment2/segment2.12458.rgba16.inc.c"
};

const Texture texture_waterbox_unknown_water[] = {
#include "textures/segment2/segment2.12C58.rgba16.inc.c"
};

const Texture texture_waterbox_mist[] = {
#include "textures/segment2/segment2.13458.ia16.inc.c"
};

const Texture texture_waterbox_lava[] = {
#include "textures/segment2/segment2.13C58.rgba16.inc.c"
};

// Unreferenced light group
UNUSED static const Lights1 segment2_lights_unused = gdSPDefLights1(
    0x40, 0x40, 0x40,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x02014470 - 0x020144B0
static const Mtx matrix_identity = {
#ifndef GBI_FLOATS
    {{0x00010000, 0x00000000,
      0x00000001, 0x00000000},
     {0x00000000, 0x00010000,
      0x00000000, 0x00000001},
     {0x00000000, 0x00000000,
      0x00000000, 0x00000000},
     {0x00000000, 0x00000000,
      0x00000000, 0x00000000}}
#else
    {{1.0f, 0.0f, 0.0f, 0.0f},
    {0.0f, 1.0f, 0.0f, 0.0f},
    {0.0f, 0.0f, 1.0f, 0.0f},
    {0.0f, 0.0f, 0.0f, 1.0f}}
#endif
};


// 0x020144B0 - 0x020144F0
static const Mtx matrix_fullscreen = {
#ifndef GBI_FLOATS
    {{0x00000000, 0x00000000,
      0x00000000, 0x00000000},
     {0x00000000, 0xffff0000,
      0xffffffff, 0xffff0001},
     {((65536 * 2 / SCREEN_WIDTH) << 16) | 0, 0x00000000,
      (0 << 16) | (65536 * 2 / SCREEN_HEIGHT), 0x00000000},
     {0x00000000, 0x00000000,
      0x00000000, 0x00000000}}
#else
    {{2.0f / SCREEN_WIDTH, 0.0f, 0.0f, 0.0f},
    {0.0f, 2.0f / SCREEN_HEIGHT, 0.0f, 0.0f},
    {0.0f, 0.0f, -1.0f, 0.0f},
    {-1.0f, -1.0f, -1.0f, 1.0f}}
#endif
};


// 0x020144F0 - 0x02014508
const Gfx dl_draw_quad_verts_0123[] = {
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
};

// 0x02014508 - 0x02014520
const Gfx dl_draw_quad_verts_4567[] = {
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
};

const Gfx dl_shadow_begin[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPEndDisplayList(),
};

const Gfx dl_shadow_circle[] = {
    gsSPDisplayList(dl_shadow_begin),
    gsDPLoadTextureBlock(texture_shadow_quarter_circle, G_IM_FMT_IA, G_IM_SIZ_8b, 16, 16, 0, G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 4, 4, G_TX_NOLOD, G_TX_NOLOD),
    gsSPEndDisplayList(),
};

const Gfx dl_shadow_square[] = {
    gsSPDisplayList(dl_shadow_begin),
    gsDPLoadTextureBlock(texture_shadow_quarter_square, G_IM_FMT_IA, G_IM_SIZ_8b, 16, 16, 0, G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 4, 4, G_TX_NOLOD, G_TX_NOLOD),
    gsSPEndDisplayList(),
};

// 0x020145D8 - 0x02014620
const Gfx dl_shadow_9_verts[] = {
    gsSP2Triangles( 0,  3,  4, 0x0,  0,  4,  1, 0x0),
    gsSP2Triangles( 1,  4,  2, 0x0,  2,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 4,  7,  8, 0x0,  4,  8,  5, 0x0),
    gsSPEndDisplayList(),
};

// 0x02014620 - 0x02014638
const Gfx dl_shadow_4_verts[] = {
    gsSP2Triangles( 0,  2,  1, 0x0,  1,  2,  3, 0x0),
    gsSPEndDisplayList(),
};

// 0x02014638 - 0x02014660
const Gfx dl_shadow_end[] = {
    gsDPPipeSync(),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x02014660 - 0x02014698
const Gfx dl_proj_mtx_fullscreen[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsSPMatrix(&matrix_identity, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH),
    gsSPMatrix(&matrix_fullscreen, G_MTX_PROJECTION | G_MTX_MUL | G_MTX_NOPUSH),
    gsSPMatrix(&matrix_identity, G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH),
    gsSPPerspNormalize(0xFFFF),
    gsSPEndDisplayList(),
};

// 0x02014698 - 0x020146C0
const Gfx dl_screen_transition_end[] = {
    gsDPPipeSync(),
    gsSPSetGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetRenderMode(G_RM_OPA_SURF, G_RM_OPA_SURF2),
    gsSPEndDisplayList(),
};

// 0x020146C0 - 0x02014708
const Gfx dl_transition_draw_filled_region[] = {
    gsSP2Triangles( 0,  4,  1, 0x0,  1,  4,  5, 0x0),
    gsSP2Triangles( 1,  5,  2, 0x0,  2,  5,  6, 0x0),
    gsSP2Triangles( 2,  6,  7, 0x0,  2,  7,  3, 0x0),
    gsSP2Triangles( 3,  4,  0, 0x0,  3,  7,  4, 0x0),
    gsSPEndDisplayList(),
};

// 0x02014708 - 0x02014738
const Gfx dl_skybox_begin[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPPerspNormalize(0xFFFF),
    gsSPMatrix(&matrix_identity, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH),
    gsSPEndDisplayList(),
};

// 0x02014738 - 0x02014768
const Gfx dl_skybox_tile_tex_settings[] = {
    gsSPMatrix(&matrix_identity, G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x02014768 - 0x02014790
const Gfx dl_skybox_end[] = {
    gsDPPipeSync(),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsSPSetGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x02014790 - 0x020147D0
const Gfx dl_waterbox_rgba16_begin[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x020147D0 - 0x02014810
const Gfx dl_waterbox_ia16_begin[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
};

// 0x02014810 - 0x02014838
const Gfx dl_waterbox_end[] = {
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x02014838 - 0x02014878
ALIGNED8 static const Texture texture_ia8_up_arrow[] = {
#include "textures/segment2/segment2.14838.ia8.inc.c"
};

// 0x02014878 - 0x020148B0
const Gfx dl_ia8_up_arrow_begin[] = {
    gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsDPSetRenderMode(G_RM_XLU_SURF, G_RM_NOOP2),
    gsSPPerspNormalize(0xFFFF),
    gsSPMatrix(&matrix_identity, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH),
    gsSPEndDisplayList(),
};

// 0x020148B0 - 0x020148E0
// Unused, seems to be an early DL for the power meter, seeing that is loading a 64x32 texture
const Gfx dl_rgba16_unused[] = {
    gsSPMatrix(&matrix_identity, G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPEndDisplayList(),
};

// 0x020148E0 - 0x02014938
const Gfx dl_ia8_up_arrow_load_texture_block[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 1, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 3, G_TX_NOLOD, G_TX_CLAMP, 3, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (8 - 1) << G_TEXTURE_IMAGE_FRAC, (8 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_8b, 1, texture_ia8_up_arrow),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 8 * 8 - 1, CALC_DXT(8, G_IM_SIZ_8b_BYTES)),
    gsSPEndDisplayList(),
};

// 0x02014938 - 0x02014958
const Gfx dl_ia8_up_arrow_end[] = {
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x02014958 - 0x02014960
static const Lights1 seg2_lights_02014958 = gdSPDefLights1(
    0x50, 0x50, 0x50,
    0xff, 0xff, 0xff, 0x32, 0x32, 0x32
);

// 0x02014970 - 0x020149A8
const Gfx dl_paintings_rippling_begin[] = {
    gsDPPipeSync(),
    gsSPSetGeometryMode(G_LIGHTING | G_SHADING_SMOOTH),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPLight(&seg2_lights_02014958.l, 1),
    gsSPLight(&seg2_lights_02014958.a, 2),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPEndDisplayList(),
};

// 0x020149A8 - 0x020149C8
const Gfx dl_paintings_rippling_end[] = {
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x020149C8 - 0x02014A00
const Gfx dl_paintings_env_mapped_begin[] = {
    gsDPPipeSync(),
    gsSPSetGeometryMode(G_LIGHTING | G_TEXTURE_GEN),
    gsDPSetCombineMode(G_CC_DECALRGB, G_CC_DECALRGB),
    gsSPLight(&seg2_lights_02014958.l, 1),
    gsSPLight(&seg2_lights_02014958.a, 2),
    gsSPTexture(0x4000, 0x4000, 0, G_TX_RENDERTILE, G_ON),
    gsSPEndDisplayList(),
};

// 0x02014A00 - 0x02014A30
const Gfx dl_paintings_env_mapped_end[] = {
    gsSPTexture(0x4000, 0x4000, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsSPGeometryModeSetFirst(G_TEXTURE_GEN, G_LIGHTING),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
};

// 0x02014A30 - 0x02014A60
const Gfx dl_paintings_draw_ripples[] = {
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPEndDisplayList(),
};

// 14A60: triangle mesh
// 0x02014A60
const s16 seg2_painting_triangle_mesh[] = {
    157, // numVtx
    // format:
    // 2D point (x, y), ripple (0 or 1)
    614, 583,   0, // 0
    614, 614,   0, // 1
    562, 614,   0, // 2
    562, 553,   1, // 3
    614, 522,   0, // 4
    511, 583,   1, // 5
    511, 614,   0, // 6
    307, 614,   0, // 7
    307, 583,   1, // 8
    358, 614,   0, // 9
    256, 614,   0, // 10
    256, 553,   1, // 11
    307, 522,   1, // 12
    358, 553,   1, // 13
    409, 583,   1, // 14
    460, 614,   0, // 15
    511, 522,   1, // 16
    460, 553,   1, // 17
    409, 522,   1, // 18
    562, 307,   1, // 19
    614, 338,   0, // 20
    562, 430,   1, // 21
    614, 399,   0, // 22
    562, 368,   1, // 23
    511, 338,   1, // 24
    460, 307,   1, // 25
    460, 430,   1, // 26
    511, 399,   1, // 27
    511, 460,   1, // 28
    409, 338,   1, // 29
    460, 368,   1, // 30
    358, 307,   1, // 31
    409, 460,   1, // 32
    358, 430,   1, // 33
    409, 399,   1, // 34
    358, 368,   1, // 35
    307, 338,   1, // 36
    256, 307,   1, // 37
    307, 399,   1, // 38
    256, 430,   1, // 39
    307, 460,   1, // 40
    614, 460,   0, // 41
    562, 491,   1, // 42
    460, 491,   1, // 43
    358, 491,   1, // 44
    256, 491,   1, // 45
    409, 276,   1, // 46
    511, 276,   1, // 47
    307, 276,   1, // 48
    614,  31,   0, // 49
    614,   0,   0, // 50
    562,   0,   0, // 51
    562, 123,   1, // 52
    614,  92,   0, // 53
    511,  31,   1, // 54
    562,  61,   1, // 55
    460,   0,   0, // 56
    511,   0,   0, // 57
    460, 123,   1, // 58
    511,  92,   1, // 59
    511, 153,   1, // 60
    409,  31,   1, // 61
    460,  61,   1, // 62
    358,   0,   0, // 63
    409,   0,   0, // 64
    409,  92,   1, // 65
    358, 123,   1, // 66
    409, 153,   1, // 67
    307,  31,   1, // 68
    358,  61,   1, // 69
    256,   0,   0, // 70
    307,   0,   0, // 71
    256, 123,   1, // 72
    307,  92,   1, // 73
    307, 153,   1, // 74
    614, 153,   0, // 75
    562, 246,   1, // 76
    614, 215,   0, // 77
    562, 184,   1, // 78
    460, 246,   1, // 79
    511, 215,   1, // 80
    460, 184,   1, // 81
    358, 246,   1, // 82
    409, 215,   1, // 83
    358, 184,   1, // 84
    256, 246,   1, // 85
    307, 215,   1, // 86
    205, 583,   1, // 87
      0, 614,   0, // 88
      0, 583,   0, // 89
     51, 614,   0, // 90
     51, 553,   1, // 91
    102, 583,   1, // 92
    205, 522,   1, // 93
    153, 553,   1, // 94
    153, 614,   0, // 95
    102, 522,   1, // 96
    256, 368,   1, // 97
    205, 338,   1, // 98
    153, 307,   1, // 99
    153, 430,   1, // 100
    205, 399,   1, // 101
    205, 460,   1, // 102
    153, 368,   1, // 103
    102, 338,   1, // 104
     51, 307,   1, // 105
     51, 430,   1, // 106
    102, 399,   1, // 107
    102, 460,   1, // 108
     51, 368,   1, // 109
      0, 338,   0, // 110
      0, 460,   0, // 111
    153, 491,   1, // 112
     51, 491,   1, // 113
    153, 246,   1, // 114
    102, 276,   1, // 115
    205, 276,   1, // 116
      0, 276,   0, // 117
     51, 246,   1, // 118
    205,  31,   1, // 119
    256,  61,   1, // 120
    205,   0,   0, // 121
    153,   0,   0, // 122
    205, 153,   1, // 123
    205,  92,   1, // 124
    153, 123,   1, // 125
    102,  31,   1, // 126
    153,  61,   1, // 127
    102,   0,   0, // 128
     51,   0,   0, // 129
     51, 123,   1, // 130
    102,  92,   1, // 131
    102, 153,   1, // 132
      0,  31,   0, // 133
     51,  61,   1, // 134
      0, 153,   0, // 135
    256, 184,   1, // 136
    205, 215,   1, // 137
    153, 184,   1, // 138
    102, 215,   1, // 139
     51, 184,   1, // 140
    409, 614,   0, // 141
    614, 307,   0, // 142
    614, 276,   0, // 143
    511, 307,   1, // 144
    409, 307,   1, // 145
    307, 307,   1, // 146
    205, 614,   0, // 147
      0, 522,   0, // 148
    102, 614,   0, // 149
    205, 307,   1, // 150
    102, 307,   1, // 151
      0, 399,   0, // 152
      0, 307,   0, // 153
      0, 215,   0, // 154
      0,  92,   0, // 155
      0,   0,   0, // 156
    // triangles
    264,
      8,  12,  13, // 0
      0,   1,   2, // 1
      3,   0,   2, // 2
      4,   0,   3, // 3
      5,   2,   6, // 4
      2,   5,   3, // 5
      7,   8,   9, // 6
      8,   7,  10, // 7
     11,   8,  10, // 8
     12,   8,  11, // 9
      9,   8,  13, // 10
     13,  14,   9, // 11
     14, 141,   9, // 12
      5,   6,  15, // 13
      5,  16,   3, // 14
     16,   5,  17, // 15
     17,   5,  15, // 16
     14,  15, 141, // 17
     15,  14,  17, // 18
     18,  14,  13, // 19
     14,  18,  17, // 20
     19, 142,  20, // 21
     19,  20,  23, // 22
     28,  27,  21, // 23
     21,  23,  22, // 24
     22,  41,  21, // 25
     20,  22,  23, // 26
     23,  24,  19, // 27
     21,  27,  23, // 28
     24,  23,  27, // 29
     25, 144,  24, // 30
     19,  24, 144, // 31
     24,  27,  30, // 32
     25,  24,  30, // 33
     26,  30,  27, // 34
     27,  28,  26, // 35
     36,  38,  97, // 36
     26,  34,  30, // 37
     29,  30,  34, // 38
     30,  29,  25, // 39
     25,  29, 145, // 40
     31, 145,  29, // 41
     31,  29,  35, // 42
     29,  34,  35, // 43
     32,  34,  26, // 44
     33,  35,  34, // 45
     34,  32,  33, // 46
     33,  38,  35, // 47
     35,  36,  31, // 48
     36,  35,  38, // 49
     37,  36,  97, // 50
     37, 146,  36, // 51
     31,  36, 146, // 52
     28,  16,  43, // 53
     38,  40,  39, // 54
     39,  97,  38, // 55
     40,  38,  33, // 56
     21,  41,  42, // 57
     41,   4,  42, // 58
      3,  42,   4, // 59
     42,  28,  21, // 60
     28,  42,  16, // 61
      3,  16,  42, // 62
     26,  28,  43, // 63
     17,  43,  16, // 64
     43,  32,  26, // 65
     32,  43,  18, // 66
     17,  18,  43, // 67
     33,  32,  44, // 68
     32,  18,  44, // 69
     13,  44,  18, // 70
     44,  40,  33, // 71
     13,  12,  44, // 72
     40,  44,  12, // 73
     39,  40,  45, // 74
     40,  12,  45, // 75
     48,  31, 146, // 76
     11,  45,  12, // 77
     25,  47, 144, // 78
     46,  25, 145, // 79
     47,  19, 144, // 80
     19, 143, 142, // 81
     31,  46, 145, // 82
     60,  59,  52, // 83
     49,  53,  55, // 84
     50,  49,  51, // 85
     51,  49,  55, // 86
     52,  55,  53, // 87
     53,  75,  52, // 88
     54,  55,  59, // 89
     52,  59,  55, // 90
     55,  54,  51, // 91
     54,  59,  62, // 92
     56,  54,  62, // 93
     57,  54,  56, // 94
     54,  57,  51, // 95
     58,  62,  59, // 96
     59,  60,  58, // 97
     68,  71,  63, // 98
     61,  62,  65, // 99
     58,  65,  62, // 100
     62,  61,  56, // 101
     61,  65,  69, // 102
     63,  61,  69, // 103
     64,  61,  63, // 104
     61,  64,  56, // 105
     65,  67,  66, // 106
     66,  69,  65, // 107
     67,  65,  58, // 108
     68,  69,  73, // 109
     69,  68,  63, // 110
     66,  73,  69, // 111
     68,  73, 120, // 112
     70,  68, 120, // 113
     71,  68,  70, // 114
     72, 120,  73, // 115
     73,  74,  72, // 116
     74,  73,  66, // 117
     75,  77,  78, // 118
     52,  75,  78, // 119
     76,  78,  77, // 120
     77, 143,  76, // 121
     76,  80,  78, // 122
     60,  78,  80, // 123
     78,  60,  52, // 124
     46,  83,  79, // 125
     58,  60,  81, // 126
     60,  80,  81, // 127
     79,  81,  80, // 128
     80,  47,  79, // 129
     47,  80,  76, // 130
     81,  67,  58, // 131
     67,  81,  83, // 132
     79,  83,  81, // 133
     66,  67,  84, // 134
     67,  83,  84, // 135
     82,  84,  83, // 136
     83,  46,  82, // 137
     84,  74,  66, // 138
     82,  86,  84, // 139
     74,  84,  86, // 140
     74,  86, 136, // 141
     72,  74, 136, // 142
     85, 136,  86, // 143
     86,  48,  85, // 144
     48,  86,  82, // 145
     25,  46,  79, // 146
     79,  47,  25, // 147
     82,  46,  31, // 148
     19,  47,  76, // 149
     76, 143,  19, // 150
     31,  48,  82, // 151
     37,  48, 146, // 152
     85,  48,  37, // 153
     10,  87,  11, // 154
     87,  10, 147, // 155
     92,  95, 149, // 156
     88,  89,  90, // 157
     89, 148,  91, // 158
     90,  89,  91, // 159
     91,  92,  90, // 160
     92, 149,  90, // 161
     93,  87,  94, // 162
     87,  93,  11, // 163
     94,  87,  95, // 164
     87, 147,  95, // 165
     95,  92,  94, // 166
     96,  92,  91, // 167
     92,  96,  94, // 168
     39, 101,  97, // 169
     97,  98,  37, // 170
     98,  97, 101, // 171
     99,  98, 103, // 172
     99, 150,  98, // 173
     37,  98, 150, // 174
     98, 101, 103, // 175
    100, 103, 101, // 176
    101, 102, 100, // 177
    102, 101,  39, // 178
    100, 107, 103, // 179
    103, 104,  99, // 180
    104, 103, 107, // 181
    105, 104, 109, // 182
    105, 151, 104, // 183
     99, 104, 151, // 184
    104, 107, 109, // 185
    106, 109, 107, // 186
    107, 108, 106, // 187
    108, 107, 100, // 188
    109, 110, 105, // 189
    106, 152, 109, // 190
    110, 109, 152, // 191
    105, 110, 153, // 192
    111, 152, 106, // 193
     11,  93,  45, // 194
    102,  45,  93, // 195
     45, 102,  39, // 196
    102,  93, 112, // 197
    100, 102, 112, // 198
     94, 112,  93, // 199
    112, 108, 100, // 200
    108, 112,  96, // 201
     94,  96, 112, // 202
    106, 108, 113, // 203
    108,  96, 113, // 204
     91, 113,  96, // 205
     91, 148, 113, // 206
    113, 111, 106, // 207
    111, 113, 148, // 208
    114, 116,  99, // 209
     99, 115, 114, // 210
    115,  99, 151, // 211
     99, 116, 150, // 212
     72, 124, 120, // 213
    116,  37, 150, // 214
     37, 116,  85, // 215
    117, 105, 153, // 216
    105, 115, 151, // 217
    105, 117, 118, // 218
    118, 115, 105, // 219
    119, 120, 124, // 220
    120, 119,  70, // 221
    119, 124, 127, // 222
    119, 121,  70, // 223
    121, 119, 122, // 224
    122, 119, 127, // 225
    123, 124,  72, // 226
    124, 123, 125, // 227
    125, 127, 124, // 228
    126, 127, 131, // 229
    127, 126, 122, // 230
    125, 131, 127, // 231
    126, 131, 134, // 232
    128, 126, 129, // 233
    129, 126, 134, // 234
    126, 128, 122, // 235
    136, 123,  72, // 236
    130, 134, 131, // 237
    131, 132, 130, // 238
    132, 131, 125, // 239
    133, 134, 155, // 240
    134, 133, 129, // 241
    130, 155, 134, // 242
    133, 156, 129, // 243
    135, 155, 130, // 244
    123, 136, 137, // 245
     85, 137, 136, // 246
    139, 115, 118, // 247
    123, 137, 138, // 248
    125, 123, 138, // 249
    114, 138, 137, // 250
    137, 116, 114, // 251
    116, 137,  85, // 252
    114, 139, 138, // 253
    132, 138, 139, // 254
    138, 132, 125, // 255
    132, 139, 140, // 256
    130, 132, 140, // 257
    115, 139, 114, // 258
    118, 140, 139, // 259
    135, 140, 154, // 260
    118, 154, 140, // 261
    140, 135, 130, // 262
    117, 154, 118, // 263
};

/* 0x02015444: seg2_painting_mesh_neighbor_tris
 * Lists the neighboring triangles for each vertex in the mesh.
 * Used when applying gouraud shading to the generated ripple mesh
 *
 * Format:
 *      num neighbors, neighbor0, neighbor1, ...
 * The nth entry corresponds to the nth vertex in seg2_painting_triangle_mesh
 */
const s16 seg2_painting_mesh_neighbor_tris[] = {
      3,   1,   2,   3,
      1,   1,
      4,   1,   2,   4,   5,
      6,   2,   3,   5,  14,  59,  62,
      3,   3,  58,  59,
      6,   4,   5,  13,  14,  15,  16,
      2,   4,  13,
      2,   6,   7,
      6,   0,   6,   7,   8,   9,  10,
      4,   6,  10,  11,  12,
      4,   7,   8, 154, 155,
      6,   8,   9,  77, 154, 163, 194,
      6,   0,   9,  72,  73,  75,  77,
      6,   0,  10,  11,  19,  70,  72,
      6,  11,  12,  17,  18,  19,  20,
      4,  13,  16,  17,  18,
      6,  14,  15,  53,  61,  62,  64,
      6,  15,  16,  18,  20,  64,  67,
      6,  19,  20,  66,  67,  69,  70,
      8,  21,  22,  27,  31,  80,  81, 149, 150,
      3,  21,  22,  26,
      6,  23,  24,  25,  28,  57,  60,
      3,  24,  25,  26,
      6,  22,  24,  26,  27,  28,  29,
      6,  27,  29,  30,  31,  32,  33,
      8,  30,  33,  39,  40,  78,  79, 146, 147,
      6,  34,  35,  37,  44,  63,  65,
      6,  23,  28,  29,  32,  34,  35,
      6,  23,  35,  53,  60,  61,  63,
      6,  38,  39,  40,  41,  42,  43,
      6,  32,  33,  34,  37,  38,  39,
      8,  41,  42,  48,  52,  76,  82, 148, 151,
      6,  44,  46,  65,  66,  68,  69,
      6,  45,  46,  47,  56,  68,  71,
      6,  37,  38,  43,  44,  45,  46,
      6,  42,  43,  45,  47,  48,  49,
      6,  36,  48,  49,  50,  51,  52,
      8,  50,  51, 152, 153, 170, 174, 214, 215,
      6,  36,  47,  49,  54,  55,  56,
      6,  54,  55,  74, 169, 178, 196,
      6,  54,  56,  71,  73,  74,  75,
      3,  25,  57,  58,
      6,  57,  58,  59,  60,  61,  62,
      6,  53,  63,  64,  65,  66,  67,
      6,  68,  69,  70,  71,  72,  73,
      6,  74,  75,  77, 194, 195, 196,
      6,  79,  82, 125, 137, 146, 148,
      6,  78,  80, 129, 130, 147, 149,
      6,  76, 144, 145, 151, 152, 153,
      3,  84,  85,  86,
      1,  85,
      4,  85,  86,  91,  95,
      6,  83,  87,  88,  90, 119, 124,
      3,  84,  87,  88,
      6,  89,  91,  92,  93,  94,  95,
      6,  84,  86,  87,  89,  90,  91,
      4,  93,  94, 101, 105,
      2,  94,  95,
      6,  96,  97, 100, 108, 126, 131,
      6,  83,  89,  90,  92,  96,  97,
      6,  83,  97, 123, 124, 126, 127,
      6,  99, 101, 102, 103, 104, 105,
      6,  92,  93,  96,  99, 100, 101,
      4,  98, 103, 104, 110,
      2, 104, 105,
      6,  99, 100, 102, 106, 107, 108,
      6, 106, 107, 111, 117, 134, 138,
      6, 106, 108, 131, 132, 134, 135,
      6,  98, 109, 110, 112, 113, 114,
      6, 102, 103, 107, 109, 110, 111,
      4, 113, 114, 221, 223,
      2,  98, 114,
      6, 115, 116, 142, 213, 226, 236,
      6, 109, 111, 112, 115, 116, 117,
      6, 116, 117, 138, 140, 141, 142,
      3,  88, 118, 119,
      6, 120, 121, 122, 130, 149, 150,
      3, 118, 120, 121,
      6, 118, 119, 120, 122, 123, 124,
      6, 125, 128, 129, 133, 146, 147,
      6, 122, 123, 127, 128, 129, 130,
      6, 126, 127, 128, 131, 132, 133,
      6, 136, 137, 139, 145, 148, 151,
      6, 125, 132, 133, 135, 136, 137,
      6, 134, 135, 136, 138, 139, 140,
      6, 143, 144, 153, 215, 246, 252,
      6, 139, 140, 141, 143, 144, 145,
      6, 154, 155, 162, 163, 164, 165,
      1, 157,
      3, 157, 158, 159,
      4, 157, 159, 160, 161,
      6, 158, 159, 160, 167, 205, 206,
      6, 156, 160, 161, 166, 167, 168,
      6, 162, 163, 194, 195, 197, 199,
      6, 162, 164, 166, 168, 199, 202,
      4, 156, 164, 165, 166,
      6, 167, 168, 201, 202, 204, 205,
      6,  36,  50,  55, 169, 170, 171,
      6, 170, 171, 172, 173, 174, 175,
      8, 172, 173, 180, 184, 209, 210, 211, 212,
      6, 176, 177, 179, 188, 198, 200,
      6, 169, 171, 175, 176, 177, 178,
      6, 177, 178, 195, 196, 197, 198,
      6, 172, 175, 176, 179, 180, 181,
      6, 180, 181, 182, 183, 184, 185,
      8, 182, 183, 189, 192, 216, 217, 218, 219,
      6, 186, 187, 190, 193, 203, 207,
      6, 179, 181, 185, 186, 187, 188,
      6, 187, 188, 200, 201, 203, 204,
      6, 182, 185, 186, 189, 190, 191,
      3, 189, 191, 192,
      3, 193, 207, 208,
      6, 197, 198, 199, 200, 201, 202,
      6, 203, 204, 205, 206, 207, 208,
      6, 209, 210, 250, 251, 253, 258,
      6, 210, 211, 217, 219, 247, 258,
      6, 209, 212, 214, 215, 251, 252,
      3, 216, 218, 263,
      6, 218, 219, 247, 259, 261, 263,
      6, 220, 221, 222, 223, 224, 225,
      6, 112, 113, 115, 213, 220, 221,
      2, 223, 224,
      4, 224, 225, 230, 235,
      6, 226, 227, 236, 245, 248, 249,
      6, 213, 220, 222, 226, 227, 228,
      6, 227, 228, 231, 239, 249, 255,
      6, 229, 230, 232, 233, 234, 235,
      6, 222, 225, 228, 229, 230, 231,
      2, 233, 235,
      4, 233, 234, 241, 243,
      6, 237, 238, 242, 244, 257, 262,
      6, 229, 231, 232, 237, 238, 239,
      6, 238, 239, 254, 255, 256, 257,
      3, 240, 241, 243,
      6, 232, 234, 237, 240, 241, 242,
      3, 244, 260, 262,
      6, 141, 142, 143, 236, 245, 246,
      6, 245, 246, 248, 250, 251, 252,
      6, 248, 249, 250, 253, 254, 255,
      6, 247, 253, 254, 256, 258, 259,
      6, 256, 257, 259, 260, 261, 262,
      2,  12,  17,
      2,  21,  81,
      3,  81, 121, 150,
      4,  30,  31,  78,  80,
      4,  40,  41,  79,  82,
      4,  51,  52,  76, 152,
      2, 155, 165,
      3, 158, 206, 208,
      2, 156, 161,
      4, 173, 174, 212, 214,
      4, 183, 184, 211, 217,
      3, 190, 191, 193,
      2, 192, 216,
      3, 260, 261, 263,
      3, 240, 242, 244,
      1, 243,
};
