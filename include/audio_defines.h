#ifndef _AUDIODEFINES_H
#define _AUDIODEFINES_H

// Sound Magic Definition:
// First Byte (Upper Nibble): Sound Bank (not the same as audio bank!)
// First Byte (Lower Nibble): Bitflags for audio playback?
// Second Byte: Sound ID
// Third Byte: Priority
// Fourth Byte (Upper Nibble): More bitflags
// Fourth Byte (Lower Nibble): Sound Status (this is set to SOUND_STATUS_PLAYING when passed to the audio driver.)
#define SOUND_ARG_LOAD(bank, playFlags, soundID, priority, flags2) (((u32) (bank) << 28)       | \
                 ((u32) (playFlags) << 24) | ((u32) (soundID) << 16) | ((u32) (priority) << 8) | \
                 ((u32) (flags2)  << 4)  |  SOUND_STATUS_STARTING)

#define SOUNDARGS_MASK_BANK         0xF0000000
#define SOUNDARGS_MASK_SOUNDID      0x00FF0000
#define SOUNDARGS_MASK_PRIORITY     0x0000FF00
#define SOUNDARGS_MASK_STATUS       0x0000000F

#define SOUNDARGS_SHIFT_BANK        28
#define SOUNDARGS_SHIFT_SOUNDID     16
#define SOUNDARGS_SHIFT_PRIORITY    8

/* Audio Status */
#define SOUND_STATUS_STOPPED        0
#define SOUND_STATUS_STARTING       1
#define SOUND_STATUS_PLAYING        2

/* Audio lower bitflags. TODO: Figure out what these mean and use them below. */
#define SOUND_LO_BITFLAG_UNK1       0x10 // fade in?
#define SOUND_NO_ECHO               0x20 // not in JP
#define SOUND_LO_BITFLAG_UNK8       0x80 // restart playing on each play_sound call?

/* Audio playback bitflags. TODO: Figure out what these mean and use them below. */
#define SOUND_PL_BITFLAG_UNK1       0x1000000
#define SOUND_PL_BITFLAG_UNK2       0x2000000
#define SOUND_PL_BITFLAG_UNK4       0x4000000
#define SOUND_PL_BITFLAG_UNK8       0x8000000

// silence
#define NO_SOUND                    0

/**
 * The table below defines all sounds that exist in the game, and which flags
 * they are used with. If a sound is used with multiple sets of flags (e.g.
 * different priorities), they are gives distinguishing suffixes.
 * Some sounds are given as 2-byte values rather than SOUND_ARG_LOAD calls.
 * These sounds are not directly referenced by the game; either they are
 * unused, or they are computed rather than referred to literally, or they
 * are loaded from another bank somehow (e.g. bank 9 and 5 use the same
 * sounds, as do 8 and 3).
 */

/* Terrain sounds */

/**
 * Terrain-dependent sounds. mario_get_step_noise computes a sound terrain type
 * between 0 and 7, depending on the terrain type of the level and the
 * floor type that Mario is standing on. That value is then added to the
 * sound ID for the six SOUND_TERRAIN_* sounds.
 *
 * The sound terrain types represent the following:
 * 0: default, uses terrain value from level script cmd31
 * 1: grass
 * 2: water
 * 3: stone
 * 4: squeaky floor
 * 5: squeaky floor again?, slides
 * 6: snow
 * 7: sand
 *
 * TODO: figure out what these sounds are.
 */
/* not verified */ #define SOUND_TERRAIN_1              SOUND_ARG_LOAD(0, 4, 0x00, 0x80, 8)
/* not verified */ #define SOUND_TERRAIN_2              SOUND_ARG_LOAD(0, 4, 0x08, 0x80, 8)
/* not verified */ #define SOUND_TERRAIN_3              SOUND_ARG_LOAD(0, 6, 0x10, 0x80, 8)
/* not verified */ #define SOUND_TERRAIN_4              SOUND_ARG_LOAD(0, 4, 0x18, 0x80, 8)
/* not verified */ #define SOUND_TERRAIN_5              SOUND_ARG_LOAD(0, 6, 0x20, 0x80, 8)

/* not verified */ #define SOUND_ACTION_UNKNOWN428      SOUND_ARG_LOAD(0, 4, 0x28, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN429      SOUND_ARG_LOAD(0, 4, 0x29, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN42A      SOUND_ARG_LOAD(0, 4, 0x2A, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN42B      SOUND_ARG_LOAD(0, 4, 0x2B, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN62C      SOUND_ARG_LOAD(0, 6, 0x2C, 0x00, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN42D      SOUND_ARG_LOAD(0, 4, 0x2D, 0xA0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN42E      SOUND_ARG_LOAD(0, 4, 0x2E, 0x00, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN42F      SOUND_ARG_LOAD(0, 4, 0x2F, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN430      SOUND_ARG_LOAD(0, 4, 0x30, 0xC0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN431      SOUND_ARG_LOAD(0, 4, 0x31, 0x60, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN432      SOUND_ARG_LOAD(0, 4, 0x32, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN433      SOUND_ARG_LOAD(0, 4, 0x33, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN434      SOUND_ARG_LOAD(0, 4, 0x34, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN435      SOUND_ARG_LOAD(0, 4, 0x35, 0x80, 8)
/* not verified */ #define SOUND_ACTION_SWISH1          SOUND_ARG_LOAD(0, 4, 0x36, 0x80, 8)
/* not verified */ #define SOUND_ACTION_SWISH2          SOUND_ARG_LOAD(0, 4, 0x37, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN438      SOUND_ARG_LOAD(0, 4, 0x38, 0x80, 8)
// 0x39?
/* not verified */ #define SOUND_ACTION_CLIMBUPTREE     SOUND_ARG_LOAD(0, 4, 0x3A, 0x80, 8)
/* not verified */ #define SOUND_ACTION_CLIMBDOWNTREE   0x043B
/* not verified */ #define SOUND_ACTION_UNKNOWN43C      0x043C
/* not verified */ #define SOUND_ACTION_UNKNOWN43D      SOUND_ARG_LOAD(0, 4, 0x3D, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN43E      SOUND_ARG_LOAD(0, 4, 0x3E, 0x80, 8)
/* not verified */ #define SOUND_ACTION_PATBACK         SOUND_ARG_LOAD(0, 4, 0x3F, 0x80, 8)
/* not verified */ #define SOUND_ACTION_BRUSHHAIR       SOUND_ARG_LOAD(0, 4, 0x40, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN441      SOUND_ARG_LOAD(0, 4, 0x41, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN442      SOUND_ARG_LOAD(0, 4, 0x42, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN443      SOUND_ARG_LOAD(0, 4, 0x43, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN444      SOUND_ARG_LOAD(0, 4, 0x44, 0xC0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN444_2    SOUND_ARG_LOAD(0, 4, 0x44, 0xB0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN444_3    SOUND_ARG_LOAD(0, 4, 0x44, 0xA0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN445      SOUND_ARG_LOAD(0, 4, 0x45, 0xA0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN446      SOUND_ARG_LOAD(0, 4, 0x46, 0xA0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN447      SOUND_ARG_LOAD(0, 4, 0x47, 0xA0, 8)
/* not verified */ #define SOUND_TERRAIN_6              SOUND_ARG_LOAD(0, 4, 0x48, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN450      SOUND_ARG_LOAD(0, 4, 0x50, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN451      SOUND_ARG_LOAD(0, 4, 0x51, 0x90, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN452      SOUND_ARG_LOAD(0, 4, 0x52, 0x90, 8)
// 0x53, 0x54, 0x55?
/* not verified */ #define SOUND_ACTION_UNKNOWN456      SOUND_ARG_LOAD(0, 4, 0x56, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN457      SOUND_ARG_LOAD(0, 4, 0x57, 0xC0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN458      SOUND_ARG_LOAD(0, 4, 0x58, 0xA0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN459      SOUND_ARG_LOAD(0, 4, 0x59, 0xB0, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN45A      SOUND_ARG_LOAD(0, 4, 0x5A, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN45B      SOUND_ARG_LOAD(0, 4, 0x5B, 0xFF, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN45C      SOUND_ARG_LOAD(0, 4, 0x5C, 0x80, 8)
// 0x5D?
/* not verified */ #define SOUND_ACTION_UNKNOWN45E      SOUND_ARG_LOAD(0, 4, 0x5E, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN45F      SOUND_ARG_LOAD(0, 4, 0x5F, 0x80, 8)
/* not verified */ #define SOUND_ACTION_UNKNOWN460      SOUND_ARG_LOAD(0, 4, 0x60, 0x80, 8)


/* Moving Sound Effects */
// might be a bad name, consider something else.
/* not verified */ #define SOUND_MOVING_SLIDING1        0x1000
/* not verified */ #define SOUND_UNKNOWN_UNK1400        SOUND_ARG_LOAD(1, 4, 0x00, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDING2        0x1001
/* not verified */ #define SOUND_UNKNOWN_UNK1401        SOUND_ARG_LOAD(1, 4, 0x01, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDINGWATER1   0x1002
/* not verified */ #define SOUND_UNKNOWN_UNK1402        SOUND_ARG_LOAD(1, 4, 0x02, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDING3        0x1003
/* not verified */ #define SOUND_UNKNOWN_UNK1403        SOUND_ARG_LOAD(1, 4, 0x03, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDINGGHOST    0x1004
/* not verified */ #define SOUND_UNKNOWN_UNK1404        SOUND_ARG_LOAD(1, 4, 0x04, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDINGGRASS    0x1005
/* not verified */ #define SOUND_UNKNOWN_UNK1405        SOUND_ARG_LOAD(1, 4, 0x05, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDINGSNOW     0x1006
/* not verified */ #define SOUND_UNKNOWN_UNK1406        SOUND_ARG_LOAD(1, 4, 0x06, 0x00, 0)
/* not verified */ #define SOUND_MOVING_SLIDINGSAND     0x1007
/* not verified */ #define SOUND_MOVING_SLIDING4        0x1008
/* not verified */ #define SOUND_MOVING_SLIDING5        0x1009
/* not verified */ #define SOUND_MOVING_SLIDINGWATER2   0x100A
/* not verified */ #define SOUND_MOVING_SLIDING6        0x100B
/* not verified */ #define SOUND_UNKNOWN_UNK1410        SOUND_ARG_LOAD(1, 4, 0x10, 0x00, 0)
/* not verified */ #define SOUND_UNKNOWN_UNK1411        SOUND_ARG_LOAD(1, 4, 0x11, 0x00, 0)
/* not verified */ #define SOUND_UNKNOWN_UNK1412        SOUND_ARG_LOAD(1, 4, 0x12, 0x80, 0)
/* not verified */ #define SOUND_UNKNOWN_UNK1414        SOUND_ARG_LOAD(1, 4, 0x14, 0x00, 0)
/* not verified */ #define SOUND_UNKNOWN_UNK1416        SOUND_ARG_LOAD(1, 4, 0x16, 0x00, 0)
/* not verified */ #define SOUND_UNKNOWN_UNK1417        SOUND_ARG_LOAD(1, 4, 0x17, 0x00, 0)
/* not verified */ #define SOUND_UNKNOWN_UNK1C18        SOUND_ARG_LOAD(1, 0xC, 0x18, 0x00, 0)
/* not verified */ #define SOUND_MOVING_UNKNOWN19       SOUND_ARG_LOAD(1, 0xD, 0x19, 0x20, 0)
/* not verified */ #define SOUND_MOVING_ONFIRE          0x1020
/* not verified */ #define SOUND_UNKNOWN_UNK1420        SOUND_ARG_LOAD(1, 4, 0x20, 0x00, 0)
/* not verified */ #define SOUND_MOVING_UNKNOWN         0x1021
/* not verified */ #define SOUND_UNKNOWN_UNK1428        SOUND_ARG_LOAD(1, 4, 0x28, 0x00, 0)

/* Mario Sound Effects */
/* not verified */ #define SOUND_MARIO_YAH              SOUND_ARG_LOAD(2, 4, 0x00, 0x80, 8)
/* not verified */ #define SOUND_MARIO_WAH1             0x2401
/* not verified */ #define SOUND_MARIO_WOOH             0x2402
/* not verified */ #define SOUND_MARIO_HOOHOO           SOUND_ARG_LOAD(2, 4, 0x03, 0x80, 8)
/* not verified */ #define SOUND_MARIO_YAHOO            SOUND_ARG_LOAD(2, 4, 0x04, 0x80, 8)
/* not verified */ #define SOUND_MARIO_UH               SOUND_ARG_LOAD(2, 4, 0x05, 0x80, 8)
/* not verified */ #define SOUND_MARIO_HRMM             SOUND_ARG_LOAD(2, 4, 0x06, 0x80, 8)
/* not verified */ #define SOUND_MARIO_WAH2             SOUND_ARG_LOAD(2, 4, 0x07, 0x80, 8)
/* not verified */ #define SOUND_MARIO_WHOA             SOUND_ARG_LOAD(2, 4, 0x08, 0xC0, 8)
/* not verified */ #define SOUND_MARIO_EEUH             SOUND_ARG_LOAD(2, 4, 0x09, 0x80, 8)
/* not verified */ #define SOUND_MARIO_ATTACKED         SOUND_ARG_LOAD(2, 4, 0x0A, 0xFF, 8)
/* not verified */ #define SOUND_MARIO_OOOF             SOUND_ARG_LOAD(2, 4, 0x0B, 0x80, 8)
/* not verified */ #define SOUND_MARIO_OOOF2            SOUND_ARG_LOAD(2, 4, 0x0B, 0xD0, 8)
/* not verified */ #define SOUND_MARIO_HEREWEGO         SOUND_ARG_LOAD(2, 4, 0x0C, 0x80, 8)
/* not verified */ #define SOUND_MARIO_YAWNING          SOUND_ARG_LOAD(2, 4, 0x0D, 0x80, 8)
/* not verified */ #define SOUND_MARIO_SNORING1         SOUND_ARG_LOAD(2, 4, 0x0E, 0x80, 8)
/* not verified */ #define SOUND_MARIO_SNORING2         SOUND_ARG_LOAD(2, 4, 0x0F, 0x80, 8)
/* not verified */ #define SOUND_MARIO_WAAAOOOW         SOUND_ARG_LOAD(2, 4, 0x10, 0xC0, 8)
/* not verified */ #define SOUND_MARIO_HAHA             SOUND_ARG_LOAD(2, 4, 0x11, 0x80, 8)
/* not verified */ #define SOUND_MARIO_HAHA_2           SOUND_ARG_LOAD(2, 4, 0x11, 0xF0, 8)
/* not verified */ #define SOUND_MARIO_HOO              0x2412
/* not verified */ #define SOUND_MARIO_UH2              SOUND_ARG_LOAD(2, 4, 0x13, 0xD0, 8)
/* not verified */ #define SOUND_MARIO_UH2_2            SOUND_ARG_LOAD(2, 4, 0x13, 0x80, 8)
/* not verified */ #define SOUND_MARIO_ONFIRE           SOUND_ARG_LOAD(2, 4, 0x14, 0xA0, 8)
/* not verified */ #define SOUND_MARIO_DYING            SOUND_ARG_LOAD(2, 4, 0x15, 0xFF, 8)
/* not verified */ #define SOUND_MARIO_HOO2             SOUND_ARG_LOAD(2, 4, 0x16, 0x80, 8)
/* not verified */ #define SOUND_MARIO_COUGHING         0x2417
/* not verified */ #define SOUND_MARIO_HOO3             SOUND_ARG_LOAD(2, 4, 0x18, 0x80, 8)
/* not verified */ #define SOUND_MARIO_HOO4             0x2419
/* not verified */ #define SOUND_MARIO_HOO5             0x241A
/* not verified */ #define SOUND_MARIO_COUGHING2        SOUND_ARG_LOAD(2, 4, 0x1B, 0x80, 8)
/* not verified */ #define SOUND_MARIO_COUGHING3        SOUND_ARG_LOAD(2, 4, 0x1C, 0x80, 8)
/* not verified */ #define SOUND_MARIO_COUGHING4        SOUND_ARG_LOAD(2, 4, 0x1D, 0x80, 8)
/* not verified */ #define SOUND_MARIO_YAH2             SOUND_ARG_LOAD(2, 4, 0x1E, 0x80, 8)
/* not verified */ #define SOUND_MARIO_HOO6             SOUND_ARG_LOAD(2, 4, 0x1F, 0x80, 8)
/* not verified */ #define SOUND_MARIO_MAMAMIA          SOUND_ARG_LOAD(2, 4, 0x20, 0x80, 8)
/* not verified */ #define SOUND_MARIO_OKEYDOKEY        0x2421
/* not verified */ #define SOUND_MARIO_WAH3             SOUND_ARG_LOAD(2, 4, 0x22, 0x80, 8)
/* not verified */ #define SOUND_MARIO_DROWNING         SOUND_ARG_LOAD(2, 4, 0x23, 0xF0, 8)
/* not verified */ #define SOUND_MARIO_WAH4             SOUND_ARG_LOAD(2, 4, 0x24, 0x80, 8)
/* not verified */ #define SOUND_MARIO_UH3              0x2425
/* not verified */ #define SOUND_MARIO_HEAVYLIFT        0x2426
/* not verified */ #define SOUND_MARIO_WAH5             0x2427

/* Mario Sound Effects (Added in US) */
/* not verified */ #define SOUND_PEACH_DEARMARIO        SOUND_ARG_LOAD(2, 4, 0x28, 0xFF, 8)
/* not verified */ #define SOUND_MARIO_WOOH2            0x2429
/* not verified */ #define SOUND_MARIO_WOOH3            0x242A
/* not verified */ // the next 5 sounds are in a group of 5 for which the sound is determined by the play_sound call used.
/* not verified */ #define SOUND_MARIO_YAHOO2           SOUND_ARG_LOAD(2, 4, 0x2B, 0x80, 8)
/* not verified */ #define SOUND_MARIO_YAHOO3           SOUND_ARG_LOAD(2, 4, 0x2C, 0x80, 8)
/* not verified */ #define SOUND_MARIO_YAHOO4           SOUND_ARG_LOAD(2, 4, 0x2D, 0x80, 8)
/* not verified */ #define SOUND_MARIO_WAHA             SOUND_ARG_LOAD(2, 4, 0x2E, 0x80, 8)
/* not verified */ #define SOUND_MARIO_YIPEE            SOUND_ARG_LOAD(2, 4, 0x2F, 0x80, 8)
/* not verified */ #define SOUND_MARIO_DOH              SOUND_ARG_LOAD(2, 4, 0x30, 0x80, 8)
/* not verified */ #define SOUND_MARIO_GAMEOVER         SOUND_ARG_LOAD(2, 4, 0x31, 0xFF, 8)
/* not verified */ #define SOUND_MARIO_HELLO            SOUND_ARG_LOAD(2, 4, 0x32, 0xFF, 8)
/* not verified */ #define SOUND_MARIO_PRESSSTARTTOPLAY SOUND_ARG_LOAD(2, 4, 0x33, 0xFF, 0xA)
/* not verified */ #define SOUND_MARIO_BOING            SOUND_ARG_LOAD(2, 4, 0x34, 0x80, 8)
/* not verified */ #define SOUND_MARIO_SNORING3         SOUND_ARG_LOAD(2, 4, 0x35, 0xFF, 8)
/* not verified */ #define SOUND_MARIO_SOLONGABOWSER    SOUND_ARG_LOAD(2, 4, 0x36, 0x80, 8)
/* not verified */ #define SOUND_MARIO_IMATIRED         SOUND_ARG_LOAD(2, 4, 0x37, 0x80, 8)

/* Princess Peach Sound Effects (US Only) */
/* not verified */ #define SOUND_PEACH_MARIO            SOUND_ARG_LOAD(2, 4, 0x38, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_POWEROFTHESTARS  SOUND_ARG_LOAD(2, 4, 0x39, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_THANKSTOYOU      SOUND_ARG_LOAD(2, 4, 0x3A, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_THANKYOUMARIO    SOUND_ARG_LOAD(2, 4, 0x3B, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_SOMETHINGSPECIAL SOUND_ARG_LOAD(2, 4, 0x3C, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_BAKEACAKE        SOUND_ARG_LOAD(2, 4, 0x3D, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_FORMARIO         SOUND_ARG_LOAD(2, 4, 0x3E, 0xFF, 8)
/* not verified */ #define SOUND_PEACH_MARIO2           SOUND_ARG_LOAD(2, 4, 0x3F, 0xFF, 8)

/* General Sound Effects */
/* not verified */ #define SOUND_GENERAL_EXPLOSION      SOUND_ARG_LOAD(3, 0, 0x00, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_MARIOHOLE1     0x3001
/* not verified */ #define SOUND_GENERAL_MARIOHOLE2     0x3002
/* not verified */ #define SOUND_GENERAL_FLAMEOUT       SOUND_ARG_LOAD(3, 0, 0x03, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_OPENWOODDOOR   SOUND_ARG_LOAD(3, 0, 0x04, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_CLOSEWOODDOOR  SOUND_ARG_LOAD(3, 0, 0x05, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_OPENIRONDOOR   SOUND_ARG_LOAD(3, 0, 0x06, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_CLOSEIRONDOOR  SOUND_ARG_LOAD(3, 0, 0x07, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_BUBBLES1       0x3008
/* not verified */ #define SOUND_GENERAL_MOVINGWATER    SOUND_ARG_LOAD(3, 0, 0x09, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_SWISHWATER     SOUND_ARG_LOAD(3, 0, 0x0A, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_QUIETBUBBLE    SOUND_ARG_LOAD(3, 0, 0x0B, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_EXPLOSION2     SOUND_ARG_LOAD(3, 0, 0x0C, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_QUIETBUBBLE2   SOUND_ARG_LOAD(3, 0, 0x0D, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNUSED         SOUND_ARG_LOAD(3, 0, 0x0E, 0x80, 8) // not actually unused?
/* not verified */ #define SOUND_GENERAL_EXPLOSION3     SOUND_ARG_LOAD(3, 0, 0x0F, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_COIN1          0x3010
/* not verified */ #define SOUND_GENERAL_COIN2          SOUND_ARG_LOAD(3, 8, 0x11, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_COINWATER1     SOUND_ARG_LOAD(3, 8, 0x12, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_COINWATER2     0x3013
/* not verified */ #define SOUND_GENERAL_COINWATER3     0x3014
/* not verified */ #define SOUND_GENERAL_COINWATER4     0x3015
/* not verified */ #define SOUND_GENERAL_SHORTSTAR      SOUND_ARG_LOAD(3, 0, 0x16, 0x00, 9)
/* not verified */ #define SOUND_GENERAL_BIGCLOCK       SOUND_ARG_LOAD(3, 0, 0x17, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_LOUDPOUND      0x3018
/* not verified */ #define SOUND_GENERAL_SHORTPOUND1    0x3019
/* not verified */ #define SOUND_GENERAL_SHORTPOUND2    0x301A
/* not verified */ #define SOUND_GENERAL_SHORTPOUND3    0x301B
/* not verified */ #define SOUND_GENERAL_SHORTPOUND4    0x301C
/* not verified */ #define SOUND_GENERAL_SHORTPOUND5    0x301D
/* not verified */ #define SOUND_GENERAL_SHORTPOUND6    0x301E
/* not verified */ #define SOUND_GENERAL_SHORTPOUND7    0x301F
/* not verified */ #define SOUND_GENERAL_OPENCHEST1     SOUND_ARG_LOAD(3, 1, 0x20, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_OPENCHEST2     0x3021
/* not verified */ #define SOUND_GENERAL_CLAMSHELL1     SOUND_ARG_LOAD(3, 1, 0x22, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_CLAMSHELL2     0x3023
/* not verified */ #define SOUND_GENERAL_BOXLANDING     SOUND_ARG_LOAD(3, 0, 0x24, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_BOXLANDING_2   SOUND_ARG_LOAD(3, 2, 0x24, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN1       SOUND_ARG_LOAD(3, 0, 0x25, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN1_2     SOUND_ARG_LOAD(3, 2, 0x25, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_CLAMSHELL3     SOUND_ARG_LOAD(3, 0, 0x26, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_CLAMSHELL4     SOUND_ARG_LOAD(3, 0, 0x27, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_EXITPAINTING1  0x3028
#ifdef VERSION_JP
/* not verified */ #define SOUND_GENERAL_PAINTING_EJECT SOUND_ARG_LOAD(3, 8, 0x28, 0x00, 8)
#else
/* not verified */ #define SOUND_GENERAL_PAINTING_EJECT SOUND_ARG_LOAD(3, 9, 0x28, 0x00, 8)
#endif
/* not verified */ #define SOUND_GENERAL_EXITPAINTING2  0x3029
/* not verified */ #define SOUND_GENERAL_EXITPAINTING3  0x302A
/* not verified */ #define SOUND_GENERAL_EXITPAINTING4  SOUND_ARG_LOAD(3, 0, 0x2B, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_GETSTAR        0x302C
/* not verified */ #define SOUND_GENERAL_PLATFORM       SOUND_ARG_LOAD(3, 0, 0x2D, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_EXPLOSION4     SOUND_ARG_LOAD(3, 0, 0x2E, 0x20, 8)
/* not verified */ #define SOUND_GENERAL_EXPLOSION5     SOUND_ARG_LOAD(3, 1, 0x2F, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_COINSPURT      SOUND_ARG_LOAD(3, 0, 0x30, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_COINSPURT_2    SOUND_ARG_LOAD(3, 8, 0x30, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_EXPLOSION6     0x3031
/* not verified */ #define SOUND_GENERAL_UNKNOWN2       0x3032
/* not verified */ #define SOUND_GENERAL_GETCOIN        0x3033
/* not verified */ #define SOUND_GENERAL_BOATTILT1      SOUND_ARG_LOAD(3, 0, 0x34, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_BOATTILT2      SOUND_ARG_LOAD(3, 0, 0x35, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_COINDROP       SOUND_ARG_LOAD(3, 0, 0x36, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN3_LOWPRIO   SOUND_ARG_LOAD(3, 0, 0x37, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN3       SOUND_ARG_LOAD(3, 0, 0x37, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN3_2     SOUND_ARG_LOAD(3, 8, 0x37, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_SWITCH1        SOUND_ARG_LOAD(3, 0, 0x38, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_CHAINCHOMP1    SOUND_ARG_LOAD(3, 0, 0x39, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_CHAINCHOMP2    SOUND_ARG_LOAD(3, 0, 0x3A, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_SWITCH2        SOUND_ARG_LOAD(3, 0, 0x3B, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_MOVINGINSAND   SOUND_ARG_LOAD(3, 0, 0x3C, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN4_LOWPRIO SOUND_ARG_LOAD(3, 0, 0x3D, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNKNOWN4       SOUND_ARG_LOAD(3, 0, 0x3D, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_SWITCH3        SOUND_ARG_LOAD(3, 0, 0x3E, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_CAGEOPEN       SOUND_ARG_LOAD(3, 0, 0x3F, 0xA0, 8)
/* not verified */ #define SOUND_GENERAL_QUIETPOUND1_LOWPRIO SOUND_ARG_LOAD(3, 0, 0x40, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_QUIETPOUND1    SOUND_ARG_LOAD(3, 0, 0x40, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_BREAKBOX       SOUND_ARG_LOAD(3, 0, 0x41, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_SWITCH4        SOUND_ARG_LOAD(3, 0, 0x42, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_QUIETPOUND2    SOUND_ARG_LOAD(3, 0, 0x43, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_BIGPOUND       SOUND_ARG_LOAD(3, 0, 0x44, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNK45          SOUND_ARG_LOAD(3, 0, 0x45, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNK46_LOWPRIO  SOUND_ARG_LOAD(3, 0, 0x46, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_UNK46          SOUND_ARG_LOAD(3, 0, 0x46, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_CANNONUP       SOUND_ARG_LOAD(3, 0, 0x47, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_GRINDELROLL    SOUND_ARG_LOAD(3, 0, 0x48, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_EXPLOSION7     0x3049
/* not verified */ #define SOUND_GENERAL_SHAKECOFFIN    0x304A
/* not verified */ #define SOUND_GENERAL_PYRAMIDTOP     0x304B
/* not verified */ #define SOUND_GENERAL_EXPLOSION8     0x304C
/* not verified */ #define SOUND_GENERAL_RACEGUNSHOT    SOUND_ARG_LOAD(3, 1, 0x4D, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_STARDOOROPEN   SOUND_ARG_LOAD(3, 0, 0x4E, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_STARDOORCLOSE  SOUND_ARG_LOAD(3, 0, 0x4F, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_BIRDCHIRP1     0x3050
/* not verified */ #define SOUND_GENERAL_BIRDCHIRP2     0x3051
/* not verified */ #define SOUND_GENERAL_BIRDCHIRP3     0x3052
/* not verified */ #define SOUND_GENERAL_BIRDCHIRP4     0x3053
/* not verified */ #define SOUND_GENERAL_SWITCH5        0x3054
/* not verified */ #define SOUND_GENERAL_SWITCH6        0x3055
/* not verified */ #define SOUND_GENERAL_POUNDROCK      SOUND_ARG_LOAD(3, 0, 0x56, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_STARAPPEARS    SOUND_ARG_LOAD(3, 0, 0x57, 0xFF, 9)
/* not verified */ #define SOUND_GENERAL_1UP            SOUND_ARG_LOAD(3, 0, 0x58, 0xFF, 8)
/* not verified */ #define SOUND_GENERAL_ELEVATORHMC    0x3059
/* not verified */ #define SOUND_GENERAL_BUTTONPRESS_LOWPRIO    SOUND_ARG_LOAD(3, 0, 0x5A, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_BUTTONPRESS    SOUND_ARG_LOAD(3, 0, 0x5A, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_BUTTONPRESS_2_LOWPRIO  SOUND_ARG_LOAD(3, 1, 0x5A, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_BUTTONPRESS_2  SOUND_ARG_LOAD(3, 1, 0x5A, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_ELEVATORMOVE   SOUND_ARG_LOAD(3, 0, 0x5B, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_ELEVATORMOVE_2 SOUND_ARG_LOAD(3, 1, 0x5B, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_SWISHAIR       SOUND_ARG_LOAD(3, 0, 0x5C, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_SWISHAIR_2     SOUND_ARG_LOAD(3, 1, 0x5C, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_HAUNTEDCHAIR   SOUND_ARG_LOAD(3, 0, 0x5D, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_SOFTLANDING    SOUND_ARG_LOAD(3, 0, 0x5E, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_MOVINGBOOMAYBE SOUND_ARG_LOAD(3, 0, 0x5F, 0x00, 8) // not certain
/* not verified */ #define SOUND_GENERAL_BOWSEREXPLODE  0x3060
/* not verified */ #define SOUND_GENERAL_BOWSERKEY      0x3061
/* not verified */ #define SOUND_GENERAL_BOWSERPLATFORM SOUND_ARG_LOAD(3, 0, 0x62, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_BOWSERPLATFORM_2   SOUND_ARG_LOAD(3, 1, 0x62, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_1UP2           0x3063
/* not verified */ #define SOUND_GENERAL_HEARTSPIN      SOUND_ARG_LOAD(3, 0, 0x64, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_POUNDWOODPOST  SOUND_ARG_LOAD(3, 0, 0x65, 0xC0, 8)
/* not verified */ #define SOUND_GENERAL_WATERLEVELTRIG SOUND_ARG_LOAD(3, 0, 0x66, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_SWITCHDOOROPEN SOUND_ARG_LOAD(3, 0, 0x67, 0xA0, 8)
/* not verified */ #define SOUND_GENERAL_REDCOIN        SOUND_ARG_LOAD(3, 0, 0x68, 0x90, 8)
/* not verified */ #define SOUND_GENERAL_BIRDSFLYAWAY   SOUND_ARG_LOAD(3, 0, 0x69, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_RIGHTANSWER    0x306A
/* not verified */ #define SOUND_GENERAL_METALPOUND     SOUND_ARG_LOAD(3, 0, 0x6B, 0x80, 8)
/* not verified */ #define SOUND_GENERAL_BOING1         SOUND_ARG_LOAD(3, 0, 0x6C, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_BOING2_LOWPRIO SOUND_ARG_LOAD(3, 0, 0x6D, 0x20, 8)
/* not verified */ #define SOUND_GENERAL_BOING2         SOUND_ARG_LOAD(3, 0, 0x6D, 0x40, 8)
/* not verified */ #define SOUND_GENERAL_YOSHIWALK      SOUND_ARG_LOAD(3, 0, 0x6E, 0x20, 8)
/* not verified */ #define SOUND_GENERAL_ENEMYALERT1    SOUND_ARG_LOAD(3, 0, 0x6F, 0x30, 8)
/* not verified */ #define SOUND_GENERAL_YOSHI          SOUND_ARG_LOAD(3, 0, 0x70, 0x30, 8)
/* not verified */ #define SOUND_GENERAL_SPLATTERING    SOUND_ARG_LOAD(3, 0, 0x71, 0x30, 8)
/* not verified */ #define SOUND_GENERAL_BOING3         0x3072
/* not verified */ #define SOUND_GENERAL_GRANDSTAR      SOUND_ARG_LOAD(3, 0, 0x73, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_GRANDSTARJUMP  SOUND_ARG_LOAD(3, 0, 0x74, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_BOATROCK       SOUND_ARG_LOAD(3, 0, 0x75, 0x00, 8)
/* not verified */ #define SOUND_GENERAL_VANISHSFX      SOUND_ARG_LOAD(3, 0, 0x76, 0x20, 8)
/* not verified */ #define SOUND_GENERAL_MARIOHOLE3     0x3077
/* not verified */ #define SOUND_GENERAL_REDCOIN2       0x3078
/* not verified */ #define SOUND_GENERAL_BIRDSFLYAWAY2  0x3079
/* not verified */ #define SOUND_GENERAL_RIGHTANSWER2   0x307A
/* not verified */ #define SOUND_GENERAL_METALPOUND2    0x307B
/* not verified */ #define SOUND_GENERAL_BOING4         0x307C
/* not verified */ #define SOUND_GENERAL_BOING5         0x307D
/* not verified */ #define SOUND_GENERAL_UNKNOWN5       0x307E // Unused, sounds identical to YOSHIWALK
/* not verified */ #define SOUND_GENERAL_ENEMYALERT2    0x307F

/* Environment Sound Effects */
/* not verified */ #define SOUND_ENVIRONMENT_WATERFALL1             SOUND_ARG_LOAD(4, 0, 0x00, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_WATERFALL2             SOUND_ARG_LOAD(4, 0, 0x01, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_ELEVATOR1              SOUND_ARG_LOAD(4, 0, 0x02, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_DRONING1               SOUND_ARG_LOAD(4, 1, 0x03, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_DRONING2               SOUND_ARG_LOAD(4, 0, 0x04, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_WIND1                  SOUND_ARG_LOAD(4, 0, 0x05, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_MOVINGSANDSNOW         0x4006
/* not verified */ #define SOUND_ENVIRONMENT_UNKNOWN1               0x4007
/* not verified */ #define SOUND_ENVIRONMENT_ELEVATOR2              SOUND_ARG_LOAD(4, 0, 0x08, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_WATER                  SOUND_ARG_LOAD(4, 0, 0x09, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_UNKNOWN2               SOUND_ARG_LOAD(4, 0, 0x0A, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_BOATROCKING1           SOUND_ARG_LOAD(4, 0, 0x0B, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_ELEVATOR3              SOUND_ARG_LOAD(4, 0, 0x0C, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_ELEVATOR4              SOUND_ARG_LOAD(4, 0, 0x0D, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_ELEVATOR4_2            SOUND_ARG_LOAD(4, 1, 0x0D, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_MOVINGSAND             SOUND_ARG_LOAD(4, 0, 0x0E, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_MERRYGOROUNDCREAKING   SOUND_ARG_LOAD(4, 0, 0x0F, 0x40, 0)
/* not verified */ #define SOUND_ENVIRONMENT_WIND2                  SOUND_ARG_LOAD(4, 0, 0x10, 0x80, 0)
/* not verified */ #define SOUND_ENVIRONMENT_MOVINGSANDSNOW2        0x4011
/* not verified */ #define SOUND_ENVIRONMENT_UNKNOWN3               0x4012
/* not verified */ #define SOUND_ENVIRONMENT_SLIDING                SOUND_ARG_LOAD(4, 0, 0x13, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_STAR                   SOUND_ARG_LOAD(4, 0, 0x14, 0x00, 1)
/* not verified */ #define SOUND_ENVIRONMENT_UNKNOWN4               SOUND_ARG_LOAD(4, 1, 0x15, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_WATERDRAIN             SOUND_ARG_LOAD(4, 1, 0x16, 0x00, 0)
/* not verified */ #define SOUND_ENVIRONMENT_METALBOXPUSH           SOUND_ARG_LOAD(4, 0, 0x17, 0x80, 0)
/* not verified */ #define SOUND_ENVIRONMENT_SINKQUICKSAND          SOUND_ARG_LOAD(4, 0, 0x18, 0x80, 0)
/* not verified */ #define SOUND_ENVIRONMENT_PEACHSPARKLE           0x4019
/* not verified */ #define SOUND_ENVIRONMENT_ELEVATOR5              0x401A
/* not verified */ #define SOUND_ENVIRONMENT_FIRE                   0x401B

/* Object Sound Effects */
/* not verified */ #define SOUND_OBJECT_WATERSOUND           SOUND_ARG_LOAD(5, 0, 0x00, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_MRISHOOT             SOUND_ARG_LOAD(5, 0, 0x01, 0x00, 8)
#define SOUND_BABY_PENGUIN_WALK      SOUND_ARG_LOAD(5, 0, 0x02, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERWALK           SOUND_ARG_LOAD(5, 0, 0x03, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERROAR           0x5004
/* not verified */ #define SOUND_OBJECT_BOWSERTAILPICKUP     SOUND_ARG_LOAD(5, 0, 0x05, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERDEFEATED       SOUND_ARG_LOAD(5, 0, 0x06, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERSPINNING       SOUND_ARG_LOAD(5, 0, 0x07, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERINHALING       SOUND_ARG_LOAD(5, 0, 0x08, 0x00, 8)
#define SOUND_BIG_PENGUIN_WALK      SOUND_ARG_LOAD(5, 0, 0x09, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_BOOBOUNCETOP             SOUND_ARG_LOAD(5, 0, 0x0A, 0x00, 8)
#define SOUND_BOO_LAUGH_SHORT            SOUND_ARG_LOAD(5, 0, 0x0B, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_THWOMP               SOUND_ARG_LOAD(5, 0, 0x0C, 0xA0, 8)
/* not verified */ #define SOUND_OBJECT_CANNON1              SOUND_ARG_LOAD(5, 0, 0x0D, 0xF0, 8)
/* not verified */ #define SOUND_OBJECT_CANNON2              SOUND_ARG_LOAD(5, 0, 0x0E, 0xF0, 8)
/* not verified */ #define SOUND_OBJECT_CANNON3              SOUND_ARG_LOAD(5, 0, 0x0F, 0xF0, 8)
#define SOUND_CH5_PIRANHA_PLANT_BITE    0x5010
#define SOUND_CH5_PIRANHA_PLANT_DYING    0x5011
/* not verified */ #define SOUND_OBJECT_JUMPWALKWATER        0x5012
/* not verified */ #define SOUND_OBJECT_UNKNOWN2             SOUND_ARG_LOAD(5, 0, 0x13, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_MRIDEATH             SOUND_ARG_LOAD(5, 0, 0x14, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_POUNDING1            SOUND_ARG_LOAD(5, 0, 0x15, 0x50, 8)
/* not verified */ #define SOUND_OBJECT_POUNDING1_HIGHPRIO   SOUND_ARG_LOAD(5, 0, 0x15, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_BULLYTHWOMP_LOWPRIO  SOUND_ARG_LOAD(5, 0, 0x16, 0x60, 8)
/* not verified */ #define SOUND_OBJECT_BULLYTHWOMP          SOUND_ARG_LOAD(5, 0, 0x16, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_BULLYMETAL           SOUND_ARG_LOAD(5, 0, 0x17, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_BULLYEXPLODE         SOUND_ARG_LOAD(5, 0, 0x18, 0xA0, 8)
/* not verified */ #define SOUND_OBJECT_BULLYEXPLODE_2       SOUND_ARG_LOAD(5, 1, 0x18, 0xA0, 8)
#define SOUND_CH5_BOWSER_PUZZLE_PIECE_MOVE         0x5019
/* not verified */ #define SOUND_OBJECT_POUNDINGCANNON       SOUND_ARG_LOAD(5, 0, 0x1A, 0x50, 8)
/* not verified */ #define SOUND_OBJECT_BULLYWALK            SOUND_ARG_LOAD(5, 0, 0x1B, 0x30, 8)
/* not verified */ #define SOUND_OBJECT_BULLYATTACKED        0x501C
/* not verified */ #define SOUND_OBJECT_UNKNOWN3             SOUND_ARG_LOAD(5, 0, 0x1D, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_UNKNOWN4             SOUND_ARG_LOAD(5, 0, 0x1E, 0xA0, 8)
#define SOUND_BABY_PENGUIN_DIVE     SOUND_ARG_LOAD(5, 0, 0x1F, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_GOOMBAWALK           SOUND_ARG_LOAD(5, 0, 0x20, 0x00, 8)
#define SOUND_UKIKI_CHATTER_LONG              SOUND_ARG_LOAD(5, 0, 0x21, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_MONTYMOLEATTACK      SOUND_ARG_LOAD(5, 0, 0x22, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_EVILLAKITUTHROW      SOUND_ARG_LOAD(5, 0, 0x22, 0x20, 8)
/* not verified */ #define SOUND_OBJECT_UNKNOWN5             0x5023
/* not verified */ #define SOUND_OBJECT_DYINGENEMY1          SOUND_ARG_LOAD(5, 0, 0x24, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_CANNON4              SOUND_ARG_LOAD(5, 0, 0x25, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_DYINGENEMY2          0x5026
/* not verified */ #define SOUND_OBJECT_BOBOMBWALK           SOUND_ARG_LOAD(5, 0, 0x27, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_SOMETHINGLANDING     SOUND_ARG_LOAD(5, 0, 0x28, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_DIVINGINWATER        SOUND_ARG_LOAD(5, 0, 0x29, 0xA0, 8)
/* not verified */ #define SOUND_OBJECT_SNOWSAND1            SOUND_ARG_LOAD(5, 0, 0x2A, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_SNOWSAND2            SOUND_ARG_LOAD(5, 0, 0x2B, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_FLAMEVANISHING       0x502C
/* not verified */ #define SOUND_OBJECT_DEFAULTDEATH         SOUND_ARG_LOAD(5, 0, 0x2C, 0x80, 8)
#define SOUND_BIG_PENGUIN_YELL           SOUND_ARG_LOAD(5, 0, 0x2D, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_WATERBOMBBOUNCING    SOUND_ARG_LOAD(5, 0, 0x2E, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_GOOMBAALERT          SOUND_ARG_LOAD(5, 0, 0x2F, 0x00, 8)
#define SOUND_WIGGLER_JUMP         SOUND_ARG_LOAD(5, 0, 0x2F, 0x60, 8)
/* not verified */ #define SOUND_OBJECT_STOMPED              SOUND_ARG_LOAD(5, 0, 0x30, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_UNKNOWN6             SOUND_ARG_LOAD(5, 0, 0x31, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_DIVINGINTOWATER      SOUND_ARG_LOAD(5, 0, 0x32, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_PIRANHAPLANTSHRINK   SOUND_ARG_LOAD(5, 0, 0x33, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_YOSHIWALK            0x5034
/* not verified */ #define SOUND_OBJECT_UNK50342081          SOUND_ARG_LOAD(5, 0, 0x34, 0x20, 8)
/* not verified */ #define SOUND_OBJECT_UNKNOWNWALKING       0x5035
/* not verified */ #define SOUND_OBJECT_UNK50350081          SOUND_ARG_LOAD(5, 0, 0x35, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BULLYWALKING         SOUND_ARG_LOAD(5, 0, 0x36, 0x60, 8)
/* not verified */ #define SOUND_OBJECT_DORRIE               SOUND_ARG_LOAD(5, 0, 0x37, 0x60, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERLAUGH          SOUND_ARG_LOAD(5, 0, 0x38, 0x80, 8)
#define SOUND_UKIKI_CHATTER_SHORT              SOUND_ARG_LOAD(5, 0, 0x39, 0x00, 8)
#define SOUND_UKIKI_CHATTER_IDLE              SOUND_ARG_LOAD(5, 0, 0x3A, 0x00, 8)
#define SOUND_UKIKI_STEP_DEFAULT             SOUND_ARG_LOAD(5, 0, 0x3B, 0x00, 8)
#define SOUND_UKIKI_STEP_LEAVES             SOUND_ARG_LOAD(5, 0, 0x3C, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_KOOPA                SOUND_ARG_LOAD(5, 0, 0x3D, 0xA0, 8)
/* not verified */ #define SOUND_OBJECT_KOOPADAMAGE          SOUND_ARG_LOAD(5, 0, 0x3E, 0xA0, 8)
/* not verified */ #define SOUND_OBJECT_KLEPTO1              SOUND_ARG_LOAD(5, 0, 0x3F, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_KLEPTO2              SOUND_ARG_LOAD(5, 0, 0x40, 0x60, 8)
/* not verified */ #define SOUND_OBJECT_KINGBOBOMB           SOUND_ARG_LOAD(5, 0, 0x41, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_KINGBOBOMBDAMAGE     0x5042
/* not verified */ #define SOUND_OBJECT_SCUTTLEBUGWALK       0x5043
/* not verified */ #define SOUND_OBJECT_SCUTTLEBUGALERT      0x5044
#define SOUND_CH5_BABY_PENGUIN_YELL         0x5045
/* not verified */ #define SOUND_OBJECT_KINGBOBOMBJUMP       SOUND_ARG_LOAD(5, 0, 0x46, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_KINGWHOMPDEATH       SOUND_ARG_LOAD(5, 1, 0x47, 0xC0, 8)
#define SOUND_BOO_LAUGH_LONG            SOUND_ARG_LOAD(5, 0, 0x48, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BAT                  0x5049
/* not verified */ #define SOUND_OBJECT_EEL                  SOUND_ARG_LOAD(5, 0, 0x4A, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_EEL_2                SOUND_ARG_LOAD(5, 2, 0x4A, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BRIDGEEXPLODE        SOUND_ARG_LOAD(5, 2, 0x4B, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_ENEMYALERT           SOUND_ARG_LOAD(5, 0, 0x4C, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_SNUFITSHOOT          SOUND_ARG_LOAD(5, 0, 0x4D, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_SKEETERWALK          SOUND_ARG_LOAD(5, 0, 0x4E, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_WALKINGWATER         SOUND_ARG_LOAD(5, 0, 0x4F, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_BIRDS1               0x5050
/* not verified */ #define SOUND_OBJECT_BIRDS2               SOUND_ARG_LOAD(5, 0, 0x51, 0x40, 0)
/* not verified */ #define SOUND_OBJECT_BIRDS3               0x5052
/* not verified */ #define SOUND_OBJECT_BIRDS4               0x5053
/* not verified */ #define SOUND_OBJECT_PIRANHAPLANTAPPEAR   SOUND_ARG_LOAD(5, 0, 0x54, 0x20, 8)
/* not verified */ #define SOUND_OBJECT_FLAMEBLOWN           SOUND_ARG_LOAD(5, 0, 0x55, 0x80, 8)
/* not verified */ #define SOUND_OBJECT_MADPIANOCHOMPING     SOUND_ARG_LOAD(5, 2, 0x56, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_BULLYOTHERENEMY      0x5057
/* not verified */ #define SOUND_OBJECT_BOBOMBBUDDY          SOUND_ARG_LOAD(5, 0, 0x58, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_SPINYUNK59           SOUND_ARG_LOAD(5, 0, 0x59, 0x10, 8)
/* not verified */ #define SOUND_OBJECT_THWOMPSOUNDSHORT     0x505A
/* not verified */ #define SOUND_OBJECT_THWOMPSOUNDLONG      0x505B
#define SOUND_WIGGLER_HIGH_PITCH              SOUND_ARG_LOAD(5, 0, 0x5C, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_HEAVEHOTOSSED        SOUND_ARG_LOAD(5, 0, 0x5D, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_WIGGLERDEATH         0x505E
/* not verified */ #define SOUND_OBJECT_BOWSERINTROLAUGH     SOUND_ARG_LOAD(5, 0, 0x5F, 0x80, 9)
/* not verified */ #define SOUND_OBJECT_ENEMYDEATHHIGH       SOUND_ARG_LOAD(5, 0, 0x60, 0xB0, 8)
/* not verified */ #define SOUND_OBJECT_ENEMYDEATHLOW        SOUND_ARG_LOAD(5, 0, 0x61, 0xB0, 8)
/* not verified */ #define SOUND_OBJECT_BATDEATH             SOUND_ARG_LOAD(5, 0, 0x62, 0xB0, 8)
/* not verified */ #define SOUND_OBJECT_KOOPADEATH           SOUND_ARG_LOAD(5, 0, 0x63, 0xB0, 8)
/* not verified */ #define SOUND_OBJECT_FLYGUYDEATH          SOUND_ARG_LOAD(5, 0, 0x63, 0xB0, 8)
/* not verified */ #define SOUND_OBJECT_POKEYDEATH           SOUND_ARG_LOAD(5, 0, 0x63, 0xC0, 8)
/* not verified */ #define SOUND_OBJECT_WATERBOMBBOUNCING2   SOUND_ARG_LOAD(5, 0, 0x64, 0xC0, 8)
/* not verified */ #define SOUND_OBJECT_EXPLODE              SOUND_ARG_LOAD(5, 0, 0x65, 0xD0, 8)
/* not verified */ #define SOUND_OBJECT_TELEPORT             0x5066
/* not verified */ #define SOUND_OBJECT_UNKNOWN9             0x5067
/* not verified */ #define SOUND_OBJECT_POUNDINGLOUD         SOUND_ARG_LOAD(5, 0, 0x68, 0x40, 8)
#define SOUND_CH5_BOSS_DIALOG_GRUNT       0x5069
/* not verified */ #define SOUND_OBJECT_MIPSRABBIT           SOUND_ARG_LOAD(5, 0, 0x6A, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_MRISPINNING          0x506B
/* not verified */ #define SOUND_OBJECT_MIPSRABBITWATER      SOUND_ARG_LOAD(5, 0, 0x6C, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_EYEROKEXPLODE        SOUND_ARG_LOAD(5, 0, 0x6D, 0x00, 8)
/* not verified */ #define SOUND_OBJECT_CHUCKYADEATH         SOUND_ARG_LOAD(5, 1, 0x6E, 0x00, 8)
#define SOUND_WIGGLER_DIALOG          SOUND_ARG_LOAD(5, 0, 0x6F, 0x00, 8)
#define SOUND_WIGGLER_ATTACKED        SOUND_ARG_LOAD(5, 0, 0x70, 0x60, 8)
#define SOUND_WIGGLER_LOW_PITCH       SOUND_ARG_LOAD(5, 0, 0x71, 0x20, 8)
/* not verified */ #define SOUND_OBJECT_SNUFITDEATH          SOUND_ARG_LOAD(5, 0, 0x72, 0xC0, 8)
/* not verified */ #define SOUND_OBJECT_CHOMPINGSOUND        SOUND_ARG_LOAD(5, 0, 0x73, 0x40, 8)
#define SOUND_EMEMY_DEFEAT_SHRINK    SOUND_ARG_LOAD(5, 0, 0x74, 0x40, 8)
/* not verified */ #define SOUND_OBJECT_BOWSERTAILPICKUP2    0x5075
/* not verified */ #define SOUND_OBJECT_BOWSERDEFEATED2      0x5076
/* not verified */ #define SOUND_OBJECT_BOWSERSWINGTAIL      0x5077
/* not verified */ #define SOUND_OBJECT_KLEPTO3              0x5078
/* not verified */ #define SOUND_OBJECT_KINGBOBOMB2          0x5079
/* not verified */ #define SOUND_OBJECT_PENGUINWALKING3      0x507A
/* not verified */ #define SOUND_OBJECT_POUNDING2            0x507B
/* not verified */ #define SOUND_OBJECT_BOWSERROAR2          0x507C
/* not verified */ #define SOUND_OBJECT_BOWSERTAILPICKUP3    0x507D
/* not verified */ #define SOUND_OBJECT_BOWSERDEFEATED3      0x507E
/* not verified */ #define SOUND_OBJECT_BOWSERSWINGTAIL2     0x507F

// Channel 6 sound effects are not yet explored.
/* not verified */ #define SOUND_CH6_BOWSERSPITFIRE          SOUND_ARG_LOAD(6, 0, 0x00, 0x00, 0)
/* not verified */ #define SOUND_CH6_LAKITUFLY               SOUND_ARG_LOAD(6, 0, 0x02, 0x80, 0)
/* not verified */ #define SOUND_CH6_LAKITUFLY_HIGHPRIO      SOUND_ARG_LOAD(6, 0, 0x02, 0xFF, 0)
/* not verified */ #define SOUND_CH6_AMPBUZZ                 SOUND_ARG_LOAD(6, 0, 0x03, 0x40, 0)
/* not verified */ #define SOUND_CH6_BLOWWINDORFIRE          SOUND_ARG_LOAD(6, 0, 0x04, 0x80, 0)
/* not verified */ #define SOUND_CH6_BLOWWINDORFIRE_LOWPRIO  SOUND_ARG_LOAD(6, 0, 0x04, 0x40, 0)
/* not verified */ #define SOUND_CH6_ROUGHSLIDE              SOUND_ARG_LOAD(6, 0, 0x05, 0x00, 0)
/* not verified */ #define SOUND_CH6_HEAVEHOMOVE             SOUND_ARG_LOAD(6, 0, 0x06, 0x40, 0)
/* not verified */ #define SOUND_CH6_BOBOMBLITFUSE           SOUND_ARG_LOAD(6, 0, 0x08, 0x60, 0)
/* not verified */ #define SOUND_CH6_HOWLINGWIND             SOUND_ARG_LOAD(6, 0, 0x09, 0x80, 0)
/* not verified */ #define SOUND_CH6_CHUCKYAMOVE             SOUND_ARG_LOAD(6, 0, 0x0A, 0x40, 0)
/* not verified */ #define SOUND_CH6_PEACHTWINKLE            SOUND_ARG_LOAD(6, 0, 0x0B, 0x40, 0)
/* not verified */ #define SOUND_CH6_CASTLEOUTDOORSAMBIENT   SOUND_ARG_LOAD(6, 0, 0x10, 0x40, 0)

/* Menu Sound Effects */
/* not verified */ #define SOUND_MENU_CHANGESELECT           SOUND_ARG_LOAD(7, 0, 0x00, 0xF8, 8)
/* not verified */ #define SOUND_MENU_REVERSEPAUSE           0x7001
/* not verified */ #define SOUND_MENU_PAUSE1                 SOUND_ARG_LOAD(7, 0, 0x02, 0xF0, 8)
/* not verified */ #define SOUND_MENU_PAUSE1_HIGHPRIO        SOUND_ARG_LOAD(7, 0, 0x02, 0xFF, 8)
/* not verified */ #define SOUND_MENU_PAUSE2                 SOUND_ARG_LOAD(7, 0, 0x03, 0xFF, 8)
/* not verified */ #define SOUND_MENU_MESSAGEAPPEAR          SOUND_ARG_LOAD(7, 0, 0x04, 0x00, 8)
/* not verified */ #define SOUND_MENU_MESSAGEDISAPPEAR       SOUND_ARG_LOAD(7, 0, 0x05, 0x00, 8)
/* not verified */ #define SOUND_MENU_CAMERAZOOMIN           SOUND_ARG_LOAD(7, 0, 0x06, 0x00, 8)
/* not verified */ #define SOUND_MENU_CAMERAZOOMOUT          SOUND_ARG_LOAD(7, 0, 0x07, 0x00, 8)
/* not verified */ #define SOUND_MENU_PINCHMARIOFACE         SOUND_ARG_LOAD(7, 0, 0x08, 0x00, 8)
/* not verified */ #define SOUND_MENU_LETGOMARIOFACE         SOUND_ARG_LOAD(7, 0, 0x09, 0x00, 8)
/* not verified */ #define SOUND_MENU_HANDAPPEAR             SOUND_ARG_LOAD(7, 0, 0x0A, 0x00, 8)
/* not verified */ #define SOUND_MENU_HANDDISAPPEAR          SOUND_ARG_LOAD(7, 0, 0x0B, 0x00, 8)
/* not verified */ #define SOUND_MENU_UNKNOWN1               SOUND_ARG_LOAD(7, 0, 0x0C, 0x00, 8)
/* not verified */ #define SOUND_MENU_POWERMETER             SOUND_ARG_LOAD(7, 0, 0x0D, 0x00, 8)
/* not verified */ #define SOUND_MENU_CAMERABUZZ             SOUND_ARG_LOAD(7, 0, 0x0E, 0x00, 8)
/* not verified */ #define SOUND_MENU_CAMERATURN             SOUND_ARG_LOAD(7, 0, 0x0F, 0x00, 8)
/* not verified */ #define SOUND_MENU_UNKNOWN2               0x7010
/* not verified */ #define SOUND_MENU_CLICKFILESELECT        SOUND_ARG_LOAD(7, 0, 0x11, 0x00, 8)
/* not verified */ #define SOUND_MENU_READSIGN               0x7012
/* not verified */ #define SOUND_MENU_MESSAGENEXTPAGE        SOUND_ARG_LOAD(7, 0, 0x13, 0x00, 8)
/* not verified */ #define SOUND_MENU_COINITSAMEMARIO        SOUND_ARG_LOAD(7, 0, 0x14, 0x00, 8)
/* not verified */ #define SOUND_MENU_YOSHIGAINLIVES         SOUND_ARG_LOAD(7, 0, 0x15, 0x00, 8)
/* not verified */ #define SOUND_MENU_ENTERPIPE              SOUND_ARG_LOAD(7, 0, 0x16, 0xA0, 8)
/* not verified */ #define SOUND_MENU_EXITPIPE               SOUND_ARG_LOAD(7, 0, 0x17, 0xA0, 8)
/* not verified */ #define SOUND_MENU_BOWSERLAUGH            SOUND_ARG_LOAD(7, 0, 0x18, 0x80, 8)
/* not verified */ #define SOUND_MENU_MARIOHOLE              SOUND_ARG_LOAD(7, 1, 0x19, 0x80, 8)
/* not verified */ #define SOUND_MENU_CLICKCHANGEVIEW        SOUND_ARG_LOAD(7, 0, 0x1A, 0x80, 8)
/* not verified */ #define SOUND_MENU_CAMERAUNUSED1          0x701B
/* not verified */ #define SOUND_MENU_CAMERAUNUSED2          0x701C
/* not verified */ #define SOUND_MENU_MARIOCASTLEWARP        SOUND_ARG_LOAD(7, 0, 0x1D, 0xB0, 8)
/* not verified */ #define SOUND_MENU_STARSOUND              SOUND_ARG_LOAD(7, 0, 0x1E, 0xFF, 8)
/* not verified */ #define SOUND_MENU_THANKYOUPLAYINGMYGAME  SOUND_ARG_LOAD(7, 0, 0x1F, 0xFF, 8)
/* not verified */ #define SOUND_MENU_READASIGN              0x7020
/* not verified */ #define SOUND_MENU_EXITASIGN              0x7021
/* not verified */ #define SOUND_MENU_MARIOCASTLEWARP2       SOUND_ARG_LOAD(7, 0, 0x22, 0x20, 8)
/* not verified */ #define SOUND_MENU_STARSOUNDOKEYDOKEY     SOUND_ARG_LOAD(7, 0, 0x23, 0xFF, 8)
/* not verified */ #define SOUND_MENU_STARSOUNDLETSAGO       SOUND_ARG_LOAD(7, 0, 0x24, 0xFF, 8)

/* US only; an index between 0-7 or 0-4 is added to the sound ID before playing */
/* not verified */ #define SOUND_MENU_COLLECTREDCOIN         SOUND_ARG_LOAD(7, 8, 0x28, 0x90, 8)
/* not verified */ #define SOUND_MENU_COLLECTSECRET          SOUND_ARG_LOAD(7, 0, 0x30, 0x20, 8)

/* Channel 8 Sound Effects */
// Channel 3 loads sounds from the same place as channel 8, so these are all carried over.
// Sounds from the same channel cannot play at the same time, so channel 3 and 5 sounds are also
// loaded into channels 8 and 9 so that they can play over other channel 3/5 sounds.
/* not verified */ #define SOUND_CH8_UNK2E      SOUND_ARG_LOAD(8, 0, 0x2E, 0x20, 8)
/* not verified */ #define SOUND_CH8_UNK3E      SOUND_ARG_LOAD(8, 0, 0x3E, 0xC0, 8)
/* not verified */ #define SOUND_CH8_UNK40      SOUND_ARG_LOAD(8, 0, 0x40, 0x00, 8)
/* not verified */ #define SOUND_CH8_UNK48      SOUND_ARG_LOAD(8, 0, 0x48, 0x20, 8)
/* not verified */ #define SOUND_CH8_UNK4B      SOUND_ARG_LOAD(8, 1, 0x4B, 0xE0, 8)
/* not verified */ #define SOUND_CH8_UNK4C      SOUND_ARG_LOAD(8, 1, 0x4C, 0xF0, 8)
/* not verified */ #define SOUND_CH8_UNK50      SOUND_ARG_LOAD(8, 0, 0x50, 0x40, 0)
/* not verified */ #define SOUND_CH8_SWITCH5      SOUND_ARG_LOAD(8, 0, 0x54, 0xF0, 1)
/* not verified */ #define SOUND_CH8_SWITCH6      SOUND_ARG_LOAD(8, 0, 0x55, 0xF0, 1)
/* not verified */ #define SOUND_CH8_UNK57      SOUND_ARG_LOAD(8, 0, 0x57, 0xFF, 9)
/* not verified */ #define SOUND_CH8_UNK59      SOUND_ARG_LOAD(8, 0, 0x59, 0x00, 8)
/* not verified */ #define SOUND_CH8_UNK60      SOUND_ARG_LOAD(8, 0, 0x60, 0x00, 8)
/* not verified */ #define SOUND_CH8_UNK61      SOUND_ARG_LOAD(8, 0, 0x61, 0x00, 8)
/* not verified */ #define SOUND_CH8_UNK63      SOUND_ARG_LOAD(8, 0, 0x63, 0xD0, 8)
/* not verified */ #define SOUND_CH8_RIGHTANSWER      SOUND_ARG_LOAD(8, 0, 0x6A, 0xA0, 8)

/* Channel 9 Sound Effects */
// Channel 9 loads sounds from the same place as channel 5. See the channel 8 comment for why this was done.
/* not verified */ #define SOUND_CH9_UNK04      SOUND_ARG_LOAD(9, 0, 0x04, 0x00, 8)
#define SOUND_PIRANHA_PLANT_BITE      SOUND_ARG_LOAD(9, 0, 0x10, 0x50, 8)
#define SOUND_PIRANHA_PLANT_DYING      SOUND_ARG_LOAD(9, 0, 0x11, 0x60, 8)
#define SOUND_BOWSER_PUZZLE_PIECE_MOVE          SOUND_ARG_LOAD(9, 0, 0x19, 0x20, 8)
/* not verified */ #define SOUND_CH9_UNK1C      SOUND_ARG_LOAD(9, 0, 0x1C, 0x00, 8)
/* not verified */ #define SOUND_CH9_UNK42      SOUND_ARG_LOAD(9, 1, 0x42, 0x40, 8)
/* not verified */ #define SOUND_CH9_UNK43      SOUND_ARG_LOAD(9, 0, 0x43, 0x40, 8)
/* not verified */ #define SOUND_CH9_UNK44      SOUND_ARG_LOAD(9, 0, 0x44, 0x40, 8)
#define SOUND_BABY_PENGUIN_YELL      SOUND_ARG_LOAD(9, 0, 0x45, 0x00, 8)
/* not verified */ #define SOUND_CH9_UNK49      SOUND_ARG_LOAD(9, 0, 0x49, 0x00, 8)
/* not verified */ #define SOUND_CH9_UNK52      SOUND_ARG_LOAD(9, 0, 0x52, 0x40, 0)
/* not verified */ #define SOUND_CH9_UNK57      SOUND_ARG_LOAD(9, 0, 0x57, 0x00, 8)
/* not verified */ #define SOUND_CH9_UNK5A_LOWPRIO   SOUND_ARG_LOAD(9, 3, 0x5A, 0x00, 8)
/* not verified */ #define SOUND_CH9_UNK5A      SOUND_ARG_LOAD(9, 3, 0x5A, 0xC0, 8)
/* not verified */ #define SOUND_CH9_UNK5B      SOUND_ARG_LOAD(9, 2, 0x5B, 0x00, 8)
/* not verified */ #define SOUND_CH9_UNK66      SOUND_ARG_LOAD(9, 0, 0x66, 0x80, 8)
/* not verified */ #define SOUND_CH9_UNK67      SOUND_ARG_LOAD(9, 0, 0x67, 0x80, 8)
#define SOUND_BOSS_DIALOG_GRUNT      SOUND_ARG_LOAD(9, 0, 0x69, 0x40, 8)
/* not verified */ #define SOUND_CH9_UNK6B      SOUND_ARG_LOAD(9, 0, 0x6B, 0x00, 8)


#endif /* _AUDIODEFINES_H */
