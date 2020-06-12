#include <PR/ultratypes.h>

#include "sfx.h"

static u32 sSfxToPlay;
static u32 sLastPlayedSfx;

void gd_reset_sfx(void) {
    sLastPlayedSfx = GD_SFX_NONE;
    sSfxToPlay = GD_SFX_NONE;
}

u32 gd_new_sfx_to_play(void) {
    return ~sLastPlayedSfx & sSfxToPlay;
}

void gd_sfx_played(void) {
    sLastPlayedSfx = sSfxToPlay;
    sSfxToPlay = GD_SFX_NONE;
}

/* Add GdSfx to queue to be played. Note that only the SFX
 * with the lowest value from the enum is played on a given frame **/
void gd_play_sfx(enum GdSfx sfx) {
    sSfxToPlay |= sfx;
}
