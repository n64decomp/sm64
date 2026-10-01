/*
 * src/ios/libultra_shim/multilibultra_sptask.c
 *
 * Replaces lib/src/osSpTaskLoad.c / osSpTaskStartGo.c / osSpTaskYield.c /
 * osSpTaskYielded.c for the iOS target.
 *
 * On real N64 hardware these functions hand a task (include/PR/sptask.h's
 * OSTask) to the RSP coprocessor, which executes microcode
 * (ucode/ucode_boot) against data_ptr/data_size and reports completion via
 * the SP interrupt (and, for display tasks, the RDP separately reports via
 * the DP interrupt once rasterization finishes). We don't have an RSP, so
 * instead of loading ucode we dispatch directly on task->t.data_ptr /
 * data_size -- which, for M_GFXTASK, is exactly the game's raw F3D/RDP
 * command-list words (`&gGfxPool->buffer`, see src/game/game_init.c), and
 * for M_AUDTASK is exactly the raw audio ABI command buffer
 * (`gAudioCmdBuffers[index]`, see src/audio/external.c) -- to a portable-C
 * interpreter, then post the SP/DP completion events through whatever
 * queue game code bound via osSetEventMesg(OS_EVENT_SP/DP, ...), using
 * ios_libultra_post_event() from multilibultra_mesg.c. This requires zero
 * changes to src/game/main.c's existing handle_sp_complete/
 * handle_dp_complete logic, which already expects this exact async
 * completion shape.
 *
 * The real interpreters (F3D/RDP display-list -> GLES2, and audio ABI ->
 * PCM) are separate subsystems (src/ios/gfx, src/ios/audio) and are
 * plugged in here via weak hook function pointers so this file -- and its
 * standalone on-device test -- can be built and validated before those
 * much larger subsystems exist.
 *
 * A single dedicated pthread plays the role of the RSP: real N64 hardware
 * has exactly one RSP, so tasks are inherently serialized exactly like
 * this (one task "running" at a time, tracked by gActiveSPTask in
 * src/game/main.c).
 */
#include <pthread.h>
#include <stdlib.h>
#include <string.h>

#include <ultra64.h>

extern s32 ios_libultra_post_event(OSEvent event);

/* Hooks for the real gfx/audio ABI interpreters (src/ios/gfx,
 * src/ios/audio). NULL means "treat the task as an instant no-op",
 * which is enough to validate this file's message-passing plumbing
 * without those subsystems existing yet. */
void (*ios_gfx_interpret_dl)(const void *dl, u32 size) = NULL;
void (*ios_audio_interpret_abi)(const void *abi, u32 size) = NULL;

typedef struct IosSpWorker {
    pthread_t pthread;
    pthread_mutex_t mutex;
    pthread_cond_t cond;
    OSTask *pending_task;  /* NULL when idle */
    volatile int yield_requested;
    volatile int running_task_is_gfx;
    int shutdown;
} IosSpWorker;

static IosSpWorker sWorker;
static pthread_once_t sWorkerInitOnce = PTHREAD_ONCE_INIT;

static void *sp_worker_main(void *arg) {
    IosSpWorker *w = (IosSpWorker *) arg;

    for (;;) {
        OSTask *task;

        pthread_mutex_lock(&w->mutex);
        while (w->pending_task == NULL && !w->shutdown) {
            pthread_cond_wait(&w->cond, &w->mutex);
        }
        if (w->shutdown) {
            pthread_mutex_unlock(&w->mutex);
            return NULL;
        }
        task = w->pending_task;
        w->running_task_is_gfx = (task->t.type == M_GFXTASK);
        w->yield_requested = 0;
        pthread_mutex_unlock(&w->mutex);

        if (task->t.type == M_AUDTASK) {
            if (ios_audio_interpret_abi != NULL) {
                ios_audio_interpret_abi(task->t.data_ptr, task->t.data_size);
            }
            ios_libultra_post_event(OS_EVENT_SP);
        } else {
            /* M_GFXTASK: the F3D "RSP half" (display-list walk / vertex
             * transform / command translation) completes first and is
             * reported via SP_COMPLETE; the RDP "rasterization half"
             * completes afterwards and is reported separately via
             * DP_COMPLETE, exactly like real hardware and exactly what
             * src/game/main.c's handle_sp_complete/handle_dp_complete
             * already expect. */
            if (ios_gfx_interpret_dl != NULL) {
                ios_gfx_interpret_dl(task->t.data_ptr, task->t.data_size);
            }
            ios_libultra_post_event(OS_EVENT_SP);
            ios_libultra_post_event(OS_EVENT_DP);
        }

        pthread_mutex_lock(&w->mutex);
        w->pending_task = NULL;
        pthread_mutex_unlock(&w->mutex);
    }
}

static void sp_worker_init(void) {
    pthread_mutex_init(&sWorker.mutex, NULL);
    pthread_cond_init(&sWorker.cond, NULL);
    sWorker.pending_task = NULL;
    sWorker.yield_requested = 0;
    sWorker.running_task_is_gfx = 0;
    sWorker.shutdown = 0;
    pthread_create(&sWorker.pthread, NULL, sp_worker_main, &sWorker);
}

void osSpTaskLoad(OSTask *task) {
    /* Real hardware DMAs ucode/ucode_data into IMEM/DMEM here. We have no
     * RSP memory to load into -- osSpTaskStartGo reads task->t.data_ptr
     * directly -- so there is nothing to do but keep the API shape
     * game code expects to call. */
    (void) task;
}

void osSpTaskStartGo(OSTask *task) {
    pthread_once(&sWorkerInitOnce, sp_worker_init);

    pthread_mutex_lock(&sWorker.mutex);
    sWorker.pending_task = task;
    pthread_cond_signal(&sWorker.cond);
    pthread_mutex_unlock(&sWorker.mutex);
}

void osSpTaskYield(void) {
    pthread_once(&sWorkerInitOnce, sp_worker_init);
    /* Real hardware asynchronously asks the RSP to checkpoint and halt;
     * our interpreters run fast and to completion rather than
     * incrementally, so by the time osSpTaskYielded is checked the task
     * has normally already finished (which handle_sp_complete in
     * src/game/main.c explicitly handles as a valid outcome: "The gfx
     * task completed before we had time to interrupt it."). We still
     * flip the flag in case a future, slower interpreter needs to poll
     * it to checkpoint early. */
    pthread_mutex_lock(&sWorker.mutex);
    sWorker.yield_requested = 1;
    pthread_mutex_unlock(&sWorker.mutex);
}

OSYieldResult osSpTaskYielded(OSTask *task) {
    int stillPending;
    (void) task;

    pthread_mutex_lock(&sWorker.mutex);
    stillPending = (sWorker.pending_task != NULL);
    pthread_mutex_unlock(&sWorker.mutex);

    /* Non-zero means "yes, it actually yielded (didn't finish)"; 0 means
     * "it finished before yield could take effect" -- see the
     * osSpTaskYielded(...) == 0 branch in handle_sp_complete. */
    return stillPending ? 1 : 0;
}
