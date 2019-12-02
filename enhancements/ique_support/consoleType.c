#include "libultra_internal.h"

enum ConsoleType gConsoleType;

void skGetId(u32 *out);

enum ConsoleType get_console_type(void) {
    u32 id = 0;
    skGetId(&id);
    return (id == 0) ? CONSOLE_N64 : CONSOLE_IQUE;
}
