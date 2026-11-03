/*
 * ios_platform.h — tiny platform layer for the iOS 6 port.
 * Replaces sm64ex's src/pc/platform.h (sys_fatal) which our sm64-port
 * base does not have. Pure C, no SDK dependency.
 */
#ifndef IOS_PLATFORM_H
#define IOS_PLATFORM_H

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

static inline void sys_fatal(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    fputc('\n', stderr);
    exit(1);
}

#endif
