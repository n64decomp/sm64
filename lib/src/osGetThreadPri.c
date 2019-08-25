#include "libultra_internal.h"

extern OSThread *D_803348A0;

OSPri osGetThreadPri(OSThread *thread) {
    if (thread == NULL) {
        thread = D_803348A0;
    }
    return thread->priority;
}
