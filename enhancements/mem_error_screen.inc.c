/* clang-format off */
/*
 * mem_error_screen.inc.c
 *
 * This enhancement should be used for ROM hacks that require the expansion pak.
 *
 * ----- Setup -----
 *
 * Make sure that USE_EXT_RAM is defined in include/segments.h
    #define USE_EXT_RAM
 *
 * There are 7 files you will need to edit:
 * src/game/main.c
 * src/engine/level_script.h
 * include/text_strings.h.in
 * levels/entry.c
 * levels/intro/script.c
 * levels/intro/geo.c
 * levels/intro/header.h
 *
 * First, in main.c, you will need to add this line below the includes:
   #include "../enhancements/mem_error_screen.inc.c"
 *
 * In the function AllocPool(), add these lines above main_pool_init():
    // Detect memory size
    if(does_pool_end_lie_out_of_bounds(end))
    {
        end = (void *)SEG_POOL_END_4MB;
    }
 *
 * Then in thread3_main(), replace the create_thread for thread 5 with this if/else statement:
    if(!gNotEnoughMemory)
    {
        create_thread(&gGameLoopThread, 5, thread5_game_loop, NULL, gThread5Stack + 0x2000, 10);
    }
    else
    {
        create_thread(&gGameLoopThread, 5, thread5_mem_error_message_loop, NULL, gThread5Stack + 0x2000, 10);
    }
 *
 * In src/engine/level_script.h, add this line below 'extern u8 level_script_entry[];'
    extern u8 level_script_entry_error_screen[];
 *
 * In include/text_strings.h.in, add these 3 lines at the top. You can also add more strings if you want.
    #define TEXT_CONSOLE_8MB _("If you're using an N64 console, then you will need to buy an\nExpansion Pak to play this ROM hack.")
    #define TEXT_PJ64 _("If you are using PJ64 1.6, go to:\nOptions > Settings > Rom Settings Tab > Memory Size\nthen select 8 MB from the drop-down box.")
    #define TEXT_PJ64_2 _("If you are using PJ64 2.X, go to:\nOptions > Settings > Config: > Memory Size, select 8 MB")
 *
 * In levels/entry.c, simply append the following to the file:
    const LevelScript level_script_entry_error_screen[] {
        INIT_LEVEL(),
        SLEEP(2),
        BLACKOUT(FALSE),
        SET_REG(0),
        EXECUTE(0x14, _introSegmentRomStart, _introSegmentRomEnd, level_intro_entry_error_screen),
        JUMP(level_script_entry_error_screen),
    };
 *
 * In levels/intro/script.c, add the following to the top of the file:
    const LevelScript level_intro_entry_error_screen[] {
        INIT_LEVEL(),
        FIXED_LOAD(_goddardSegmentStart, _goddardSegmentRomStart, _goddardSegmentRomEnd),
        LOAD_MIO0(0x07, _intro_segment_7SegmentRomStart, _intro_segment_7SegmentRomEnd),
        ALLOC_LEVEL_POOL(),

        AREA(1, intro_geo_error_screen),
		END_AREA(),

        FREE_LEVEL_POOL(),
        LOAD_AREA(1),
        SLEEP(32767),
        EXIT_AND_EXECUTE(0x14, _introSegmentRomStart, _introSegmentRomEnd, level_intro_entry_error_screen),
	};
 *
 * Add the following to the top of levels/intro/geo.c:
    const GeoLayout intro_geo_error_screen[] {
        GEO_NODE_SCREEN_AREA(0, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2),
        GEO_OPEN_NODE(),
            GEO_ZBUFFER(0),
            GEO_OPEN_NODE(),
                GEO_NODE_ORTHO(100),
                GEO_OPEN_NODE(),
                    GEO_BACKGROUND_COLOR(0x0001),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
            GEO_ZBUFFER(0),
            GEO_OPEN_NODE(),
                GEO_ASM(0, geo18_display_error_message),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
        GEO_END(),
	};
	
 * Finally, add the following to the bottom of levels/intro/header.h:
    extern const GeoLayout intro_geo_error_screen[];
    extern const LevelScript level_intro_entry_error_screen[];
    extern Gfx *geo18_display_error_message(u32 run, UNUSED struct GraphNode *sp44, UNUSED u32 sp48);
 */
/* clang-format on */

// Ensure that USE_EXT_RAM is defined.
#ifndef USE_EXT_RAM
#error You have to define USE_EXT_RAM in 'include/segments.h'
#endif

#include <types.h>
#include <text_strings.h>
#include "../src/game/display.h"
#include "../src/game/print.h"
#include "../src/game/ingame_menu.h"
#include "../src/game/segment2.h"
#include "../src/engine/level_script.h"

// Require 8 MB of RAM, even if the pool doesn't go into extended memory.
// Change the '8' to whatever MB limit you want.
// Note: only special emulators allow for RAM sizes above 8 MB.
#define REQUIRED_MIN_MEM_SIZE 1048576 * 8

u8 gNotEnoughMemory = FALSE;
u8 gDelayForErrorMessage = 0;

u8 does_pool_end_lie_out_of_bounds(void *end) {
    u32 endPhy = ((u32) end) & 0x1FFFFFFF;
    u32 memSize = *((u32 *) 0x80000318);

    if (endPhy > memSize) {
        gNotEnoughMemory = TRUE;
        return TRUE;
    } else {
        if (memSize < REQUIRED_MIN_MEM_SIZE) {
            gNotEnoughMemory = TRUE;
        }
        return FALSE;
    }
}

// If you're using an N64 console, then you will need to buy an\nexpansion pak to play this ROM hack.
u8 text_console_8mb[] = { TEXT_CONSOLE_8MB };

// If you are using PJ64 1.6, go to: Options ► Settings ► Rom Settings Tab ► Memory Size then select 8
// MB from the drop-down box.
u8 text_pj64[] = { TEXT_PJ64 };

// If you are using PJ64 2.X, go to: Options ► Settings ► Config: ► Memory Size, select 8 MB
u8 text_pj64_2[] = { TEXT_PJ64_2 };

Gfx *geo18_display_error_message(u32 run, UNUSED struct GraphNode *sp44, UNUSED u32 sp48) {
    if (run) {
        if (gDelayForErrorMessage > 0) {
            // Draw color text title.
            print_text(10, 210, "ERROR    Need more memory");

            // Init generic text rendering
            create_dl_ortho_matrix();
            gSPDisplayList(gDisplayListHead++,
                           dl_ia_text_begin); // Init rendering stuff for generic text

            // Set text color to white
            gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);

            print_generic_string(8, 170, text_console_8mb);
            print_generic_string(8, 120, text_pj64);
            print_generic_string(8, 54, text_pj64_2);

            // Cleanup
            gSPDisplayList(gDisplayListHead++,
                           dl_ia_text_end); // Reset back to default render settings.
            gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
        } else {
            gDelayForErrorMessage += 1;
        }
    }

    return 0;
}

// Basic main loop for the error screen. Note that controllers are not enabled here.
void thread5_mem_error_message_loop(UNUSED void *arg) {
    struct LevelCommand *addr;

    setup_game_memory();
    set_vblank_handler(2, &gGameVblankHandler, &gGameVblankQueue, (OSMesg) 1);

    addr = segmented_to_virtual(level_script_entry_error_screen);

    func_80247ED8();

    while (1) {
        func_80247FAC();
        addr = level_script_execute(addr);
        display_and_vsync();
    }
}
