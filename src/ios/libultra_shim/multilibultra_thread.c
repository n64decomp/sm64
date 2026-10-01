/*
 * src/ios/libultra_shim/multilibultra_thread.c
 *
 * Replaces lib/src/osCreateThread.c / osStartThread.c / osStopThread.c /
 * osDestroyThread.c / osSetThreadPri.c / osGetThreadPri.c / osYieldThread.c
 * for the iOS target. The real decomp versions of those files are a
 * from-scratch libultra reimplementation, but they are MIPS-hardware
 * specific (a real interrupt/exception-driven preemptive scheduler using
 * COP0 registers) and cannot run on ARM/iOS.
 *
 * This file keeps the exact same public API (see include/PR/os_thread.h,
 * unchanged) so none of src/game, src/audio, src/engine, src/goddard need
 * any modification: they still just call osCreateThread/osStartThread/etc.
 *
 * Threads are backed by real pthreads. The device is single-core
 * (confirmed: iPad1,1), so this is cooperative in practice; pthreads are
 * used anyway for simplicity and because the game's own thread/message
 * queue logic already assumes preemptive scheduling semantics.
 *
 * We stash a boxed pthread handle inside the OSThread struct's otherwise
 * MIPS-register-context-only `context` field (__OSThreadContext), which is
 * never read or written by portable game code -- only by the (now unused)
 * MIPS context-switch implementation this file replaces.
 */
#include <pthread.h>
#include <sched.h>
#include <stdlib.h>
#include <string.h>

#include <ultra64.h>

typedef struct IosThreadHandle {
    pthread_t pthread;
    void (*entry)(void *);
    void *arg;
    pthread_mutex_t start_mutex;
    pthread_cond_t start_cond;
    int should_start;
    int started;
} IosThreadHandle;

/* Compile-time check: __OSThreadContext must be large enough to hold a
 * pointer to our boxed handle. It is (it holds ~0x140 bytes of MIPS
 * register state on real hardware). */
typedef char sm64ios_thread_ctx_size_check[
    (sizeof(((OSThread *) 0)->context) >= sizeof(void *)) ? 1 : -1];

static IosThreadHandle *ios_thread_handle(OSThread *thread) {
    IosThreadHandle *handle;
    memcpy(&handle, &thread->context, sizeof(handle));
    return handle;
}

static void ios_thread_set_handle(OSThread *thread, IosThreadHandle *handle) {
    memcpy(&thread->context, &handle, sizeof(handle));
}

static void *ios_thread_trampoline(void *arg) {
    IosThreadHandle *handle = (IosThreadHandle *) arg;

    pthread_mutex_lock(&handle->start_mutex);
    while (!handle->should_start) {
        pthread_cond_wait(&handle->start_cond, &handle->start_mutex);
    }
    pthread_mutex_unlock(&handle->start_mutex);

    handle->entry(handle->arg);
    return NULL;
}

void osCreateThread(OSThread *thread, OSId id, void (*entry)(void *),
                     void *arg, void *sp, OSPri pri) {
    IosThreadHandle *handle = (IosThreadHandle *) calloc(1, sizeof(IosThreadHandle));
    (void) sp; /* native pthread stacks are used instead of the provided N64 stack buffer */

    handle->entry = entry;
    handle->arg = arg;
    handle->should_start = 0;
    handle->started = 0;
    pthread_mutex_init(&handle->start_mutex, NULL);
    pthread_cond_init(&handle->start_cond, NULL);

    memset(thread, 0, sizeof(*thread));
    thread->id = id;
    thread->priority = pri;
    thread->state = OS_STATE_STOPPED;
    ios_thread_set_handle(thread, handle);

    pthread_create(&handle->pthread, NULL, ios_thread_trampoline, handle);
}

void osStartThread(OSThread *thread) {
    IosThreadHandle *handle = ios_thread_handle(thread);
    thread->state = OS_STATE_RUNNABLE;

    pthread_mutex_lock(&handle->start_mutex);
    handle->should_start = 1;
    handle->started = 1;
    pthread_cond_signal(&handle->start_cond);
    pthread_mutex_unlock(&handle->start_mutex);
}

void osStopThread(OSThread *thread) {
    /* Not used by game code in practice (threads run for the process
     * lifetime); provided for API completeness. */
    (void) thread;
}

void osDestroyThread(OSThread *thread) {
    IosThreadHandle *handle = ios_thread_handle(thread);
    if (handle == NULL) {
        return;
    }
    pthread_cancel(handle->pthread);
    pthread_mutex_destroy(&handle->start_mutex);
    pthread_cond_destroy(&handle->start_cond);
    free(handle);
    ios_thread_set_handle(thread, NULL);
}

OSId osGetThreadId(OSThread *thread) {
    return thread->id;
}

OSPri osGetThreadPri(OSThread *thread) {
    return thread->priority;
}

void osSetThreadPri(OSThread *thread, OSPri pri) {
    /* thread == NULL means "the calling thread" on real hardware; the game
     * only ever does this once in thread1_idle to deprioritize itself
     * after startup, which has no meaningful effect under pthreads. */
    if (thread != NULL) {
        thread->priority = pri;
    }
}

void osYieldThread(void) {
    sched_yield();
}
