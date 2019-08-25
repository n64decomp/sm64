.include "macros.inc"
.include "level_commands.inc"

.section .level, "a"

.align 4
glabel level_script_entry
    init_level
    sleep /*frames*/ 2
    blackout /*active*/ FALSE
    set_reg /*value*/ 0
    execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_1
    jump /*target*/ level_script_entry

.align 4
