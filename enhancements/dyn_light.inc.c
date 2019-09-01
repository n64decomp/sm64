/*
 * This file demonstrates how to manipulate display list data from C. *
 * To use it, #include "../../enhancements/dyn_light.inc.c" and hook it on to a function that is called
 * once per frame.
 */

#ifndef _DYNLIGHTS_H
#define _DYNLIGHTS_H

#include "../src/game/area.h"         /* Get level info */
#include "../src/game/level_update.h" /* gMarioState */
#include "../src/game/memory.h"
#include "../src/game/print.h"

/*
 * Common values for shading, which are manipulated with the SHADE_* defines
 * in combination with the set_mario_shade_light function.
 */

/* Shading levels for Mario */

#define SHADE_100 1
#define SHADE_75 0.75
#define SHADE_50 0.50
#define SHADE_25 0.25

/* Mario light values */

#define VAL1 0x7F
#define VAL2 0x39
#define VAL3 0X0E
#define VAL4 0x07
#define VAL5 0x3C
#define VAL6 0x60
#define VAL7 0x03

/* Custom structs used for setting light values. */

typedef struct /* Normal shade lights */
{
    unsigned char byte[7];
} Light2;

typedef struct /* Ambient lights */
{
    unsigned char byte[15];
} Light3;

/* ! GLABEL THESE: actors/mario/model.s ! */

extern Light2 *mario_amb_light_group1;
extern Light2 *mario_amb_light_group2;
extern Light2 *mario_amb_light_group3;
extern Light2 *mario_amb_light_group4;
extern Light2 *mario_amb_light_group6;

/* OPTIONAL: Add level lights here--just like Mario they have to be glabel'd. */

/* Used to set mario's shading to one of the four predetermined modes. */

void set_mario_shade_light(f32 mode) {
    Light2 *ptr;
    ptr = segmented_to_virtual(&mario_amb_light_group1);
    ptr->byte[2] = VAL1 * mode;
    ptr->byte[6] = VAL1 * mode;
    ptr = segmented_to_virtual(&mario_amb_light_group2);
    ptr->byte[0] = VAL1 * mode;
    ptr->byte[4] = VAL1 * mode;
    ptr = segmented_to_virtual(&mario_amb_light_group3);
    ptr->byte[0] = VAL1 * mode;
    ptr->byte[1] = VAL1 * mode;
    ptr->byte[2] = VAL1 * mode;
    ptr->byte[4] = VAL1 * mode;
    ptr->byte[5] = VAL1 * mode;
    ptr->byte[6] = VAL1 * mode;
    ptr = segmented_to_virtual(&mario_amb_light_group4);
    ptr->byte[0] = VAL2 * mode;
    ptr->byte[1] = VAL3 * mode;
    ptr->byte[2] = VAL4 * mode;
    ptr->byte[4] = VAL2 * mode;
    ptr->byte[5] = VAL3 * mode;
    ptr->byte[6] = VAL4 * mode;
    ptr = segmented_to_virtual(&mario_amb_light_group6);
    ptr->byte[0] = VAL2 * mode;
    ptr->byte[1] = VAL7 * mode;
    ptr->byte[4] = VAL2 * mode;
    ptr->byte[5] = VAL7 * mode;
}

/* Creates a point light with its origin at x, y, and z. */

void point_light(s16 x, s16 y, s16 z, s16 size, f32 shade, s16 size1, f32 shade1) {
    /* Outer region */

    if (gMarioState->pos[0] >= (x - size1) && gMarioState->pos[0] <= x + size1
        && gMarioState->pos[1] >= (y - size1) && gMarioState->pos[1] <= y + size1
        && gMarioState->pos[2] >= (z - size1) && gMarioState->pos[2] <= z + size1) {
        set_mario_shade_light(shade1);
    }

    /* Inner region */

    if (gMarioState->pos[0] >= (x - size) && gMarioState->pos[0] <= x + size
        && gMarioState->pos[1] >= (y - size) && gMarioState->pos[1] <= y + size
        && gMarioState->pos[2] >= (z - size) && gMarioState->pos[2] <= z + size) {
        set_mario_shade_light(shade);
    }
}

/*
 * Sets up the automatic shading for levels and sets up point lights.
 * BBH is already done for you.
 */

void set_level_shading(void) {
#ifdef DEBUG
    print_text_fmt_int(40, 80, "AREA: %d", gCurrAreaIndex);
    print_text_fmt_int(40, 60, "X: %d", gMarioState->pos[0]);
    print_text_fmt_int(40, 40, "Y: %d", gMarioState->pos[1]);
    print_text_fmt_int(40, 20, "Z: %d", gMarioState->pos[2]);
#endif
    switch (gCurrLevelNum) {
        case LEVEL_BBH:
            set_mario_shade_light(SHADE_25);

            point_light(200, 0, 2300, 200, SHADE_100, 400, SHADE_50);
            point_light(1000, 0, 2300, 200, SHADE_100, 400, SHADE_50);

            point_light(200, 0, 1500, 150, SHADE_75, 200, SHADE_50);
            point_light(200, 0, 700, 150, SHADE_75, 200, SHADE_50);

            point_light(450, 0, 300, 150, SHADE_75, 200, SHADE_50);
            point_light(1550, 0, 300, 150, SHADE_75, 200, SHADE_50);
            point_light(1800, 0, 1500, 150, SHADE_75, 200, SHADE_50);

            point_light(1500, 0, 1750, 100, SHADE_50, 150, SHADE_25); /* Window moonlight */
            break;
        case LEVEL_HMC:
            set_mario_shade_light(SHADE_25);
            break;
        case LEVEL_CASTLE:
            set_mario_shade_light(SHADE_75);
            if (gCurrAreaIndex == 3) {
                set_mario_shade_light(SHADE_50);
            }
            break;
        case LEVEL_SSL:
            set_mario_shade_light(SHADE_100);
            if (gCurrAreaIndex == 2 || gCurrAreaIndex == 3) { /* Both pyramid areas */
                set_mario_shade_light(SHADE_25);
            }
            break;
        case LEVEL_JRB:
        case LEVEL_DDD:
        case LEVEL_SA:
            set_mario_shade_light(SHADE_50);
            break;
        case LEVEL_CCM:
        case LEVEL_SL:
        case LEVEL_PSS:
            set_mario_shade_light(SHADE_75);
            if (gCurrAreaIndex == 2) {
                set_mario_shade_light(SHADE_50);
            }
            break;
        default:
            set_mario_shade_light(SHADE_100);
            break;
    }
}

#endif
