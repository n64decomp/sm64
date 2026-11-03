#ifndef COMPAT_H
#define COMPAT_H value

#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
#define __BSD__
#endif

#endif