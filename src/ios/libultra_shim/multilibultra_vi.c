/*
 * src/ios/libultra_shim/multilibultra_vi.c
 *
 * Replaces lib/src/osViSetEvent.c / osViSetMode.c / osViBlack.c /
 * osViSetSpecialFeatures.c / osViSwapBuffer.c / osCreateViManager.c /
 * osViModeTable.c for the iOS target.
 *
 * Real N64 hardware has a VI (Video Interface) chip that fires a
 * hardware interrupt once per scanout retrace; osCreateViManager starts a
 * dedicated thread that fields that interrupt and, per osViSetEvent's
 * registration, posts a message every `retraceCount` retraces (the game
 * always registers with retraceCount==1 -- see
 * src/game/main.c:setup_mesg_queues -- so effectively once per displayed
 * frame).
 *
 * We have no VI hardware. Instead, the gfx backend (src/ios/gfx, not yet
 * implemented) owns a CADisplayLink synced to the device's real screen
 * refresh and calls ios_libultra_vi_tick() from that callback once per
 * tick -- that single call is this file's only "hardware interrupt"
 * input, and from it we reproduce the exact message-posting behavior
 * src/game/main.c already expects via osSetEventMesg(OS_EVENT_VI, ...)
 * (wired automatically, since osViSetEvent's mq/msg feed straight into
 * the same event-posting path as SP/DP in multilibultra_mesg.c).
 *
 * osViSetMode/osViBlack/osViSetSpecialFeatures configure real VI
 * registers (resolution, blanking, gamma/dither/divot filtering) that
 * don't exist here; the launcher's resolution/aspect-ratio settings and
 * the gfx backend's own GLES2 pipeline take over that role instead, so
 * these are no-ops that just record the most recently requested mode
 * for diagnostic/future use. osViSwapBuffer -- the actual "present this
 * frame" call -- is forwarded to a hook the gfx backend registers.
 */
#include <string.h>

#include <ultra64.h>

extern s32 ios_libultra_post_event(OSEvent event);

/* Dummy VI mode table: real values are N64 VI hardware register presets
 * (timing/resolution config) that we never program real hardware with.
 * Sized to cover every OS_VI_* index macro in os_vi.h (0..27). */
OSViMode osViModeTable[28];

static OSMesgQueue *sViQueue = NULL;
static OSMesg sViMsg = NULL;
static u32 sViRetraceCount = 1;
static u32 sViTickCounter = 0;
static const OSViMode *sCurrentMode = NULL;
static u8 sViBlackActive = 0;
static u32 sViFeatures = 0;

/* Hook the gfx backend (src/ios/gfx) registers to actually present a
 * rendered frame (e.g. call -[EAGLContext presentRenderbuffer:]). */
void (*ios_vi_present_hook)(void *vaddr) = NULL;

void osCreateViManager(OSPri pri) {
    /* No dedicated VI interrupt thread needed: frame pacing is driven by
     * the gfx backend's CADisplayLink calling ios_libultra_vi_tick()
     * directly, which already runs on its own thread/runloop. */
    (void) pri;
}

void osViSetMode(OSViMode *mode) {
    sCurrentMode = mode;
}

void osViSetEvent(OSMesgQueue *mq, OSMesg msg, u32 retraceCount) {
    sViQueue = mq;
    sViMsg = msg;
    sViRetraceCount = (retraceCount == 0) ? 1 : retraceCount;
    sViTickCounter = 0;
}

void osViBlack(u8 active) {
    sViBlackActive = active;
}

void osViSetSpecialFeatures(u32 func) {
    sViFeatures |= func;
}

void osViSwapBuffer(void *vaddr) {
    if (ios_vi_present_hook != NULL) {
        ios_vi_present_hook(vaddr);
    }
}

/*
 * Called once per real display refresh tick by the gfx backend's
 * CADisplayLink callback. Reproduces exactly what the real VI interrupt
 * handler does: post the registered vblank message to the registered
 * queue once every osViSetEvent-configured retraceCount ticks.
 */
void ios_libultra_vi_tick(void) {
    if (sViQueue == NULL || sViBlackActive) {
        return;
    }

    sViTickCounter++;
    if (sViTickCounter >= sViRetraceCount) {
        sViTickCounter = 0;
        osSendMesg(sViQueue, sViMsg, OS_MESG_NOBLOCK);
    }
}
