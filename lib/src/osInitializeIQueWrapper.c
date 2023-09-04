#include "ultra64.h"
#include "PR/os.h"

#ifdef VERSION_CN
s32 osMotorStart(OSPfs *pfs) {
    return __osMotorAccess(pfs, MOTOR_START);
}

s32 osMotorStop(OSPfs *pfs) {
    return __osMotorAccess(pfs, MOTOR_STOP);
}

static void osInitializeWrapper(void) {
    __osInitialize_common();
    __osInitialize_autodetect();
}

void osInitialize(void) {
    osInitializeWrapper();
}
#endif
