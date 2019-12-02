# iQue Player Support Enhancement

This enhancement allows the same ROM to work on both the N64 and the iQue Player.                                

## Instructions

### Fix video corruption

In `lib/src/__osViSwapContext.c`, change the line
```c
HW_REG(VI_CONTROL_REG, u32) = s1->features;
```
to
```c
HW_REG(VI_CONTROL_REG, u32) = s1->features & ~(1 << 13);
```
This has no effect on the N64, but prevents video corruption on iQue. Games will be unplayable on iQue unless you do this modification.

### Add console detection

Copy `enhancements/ique_support/skGetId.s` into `lib/asm/`.  
Copy `enhancements/ique_support/consoleType.c` into `lib/src/`.  
Copy `enhancements/ique_support/console_type.h` into `include/PR/`.  

Add the line `#include <PR/console_type.h>` to the bottom of the block of `#include`s in `include/ultra64.h`.  
Add the line `gConsoleType = get_console_type();` as the first line of code in `osInitialize()` in `lib/src/osInitialize.c` (i.e. right before the line `D_80365CD0 = TRUE;`)

### Patch libultra EEPROM functions

Console detection needs to be added for this modification.

In `lib/src/osEepromRead.c`, `lib/src/osEepromWrite.c`, and `lib/src/osEepromProbe.c`:

Add
```c
if (gConsoleType == CONSOLE_N64) {
```
directly after the `__osSiGetAccess` call.

Add
```c
} else if (gConsoleType == CONSOLE_IQUE) {
#include "../../enhancements/ique_support/FILENAME.inc.c"
}
```
directly before the `__osSiRelAccess` call; replace `FILENAME` with the filename, i.e. if `lib/src/osEepromRead.c` put `#include "../../enhancements/ique_support/osEepromRead.inc.c"`.
