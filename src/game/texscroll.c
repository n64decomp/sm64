#include "types.h"
#include "include/segment_symbols.h"
#include "memory.h"
#include "engine/math_util.h"
#include "src/engine/behavior_script.h"
#include "texscroll.h"

#ifdef TARGET_N64
#define SCROLL_CONDITION(condition) condition
#else
#define SCROLL_CONDITION(condition) 1
#endif


#include "src/game/texscroll/group10_texscroll.inc.c"
#include "src/game/texscroll/group0_texscroll.inc.c"
#include "src/game/texscroll/group15_texscroll.inc.c"
#include "src/game/texscroll/group14_texscroll.inc.c"
#include "src/game/texscroll/group11_texscroll.inc.c"
#include "src/game/texscroll/common0_texscroll.inc.c"
#include "src/game/texscroll/group9_texscroll.inc.c"
#include "src/game/texscroll/group6_texscroll.inc.c"
#include "src/game/texscroll/group1_texscroll.inc.c"
#include "src/game/texscroll/group2_texscroll.inc.c"
#include "src/game/texscroll/group17_texscroll.inc.c"
#include "src/game/texscroll/group13_texscroll.inc.c"
#include "src/game/texscroll/group7_texscroll.inc.c"
void scroll_textures() {
	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group10_mio0SegmentRomStart)) {
		scroll_textures_group10();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x4] == (uintptr_t)_group0_mio0SegmentRomStart)) {
		scroll_textures_group0();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x6] == (uintptr_t)_group15_mio0SegmentRomStart)) {
		scroll_textures_group15();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x6] == (uintptr_t)_group14_mio0SegmentRomStart)) {
		scroll_textures_group14();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group11_mio0SegmentRomStart)) {
		scroll_textures_group11();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x8] == (uintptr_t)_common0_mio0SegmentRomStart)) {
		scroll_textures_common0();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group9_mio0SegmentRomStart)) {
		scroll_textures_group9();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group6_mio0SegmentRomStart)) {
		scroll_textures_group6();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group1_mio0SegmentRomStart)) {
		scroll_textures_group1();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group2_mio0SegmentRomStart)) {
		scroll_textures_group2();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x6] == (uintptr_t)_group17_mio0SegmentRomStart)) {
		scroll_textures_group17();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x6] == (uintptr_t)_group13_mio0SegmentRomStart)) {
		scroll_textures_group13();
	}

	if(SCROLL_CONDITION(sSegmentROMTable[0x5] == (uintptr_t)_group7_mio0SegmentRomStart)) {
		scroll_textures_group7();
	}

}
