#ifndef _DEBUG_DRAW_CUBE_H
#define _DEBUG_DRAW_CUBE_H

/**
 * @file debug_box.h
 * Draws debug boxes, see debug_box.inc.c for details
 */

#include "types.h"

/**
 * The max amount of debug boxes before debug_box() just returns.
 * You can set this to something higher like 1000, but things like text will stop rendering.
 */
#define MAX_DEBUG_BOXES 100

void debug_box(Vec3f center, Vec3f bounds);
void debug_box_rot(Vec3f center, Vec3f bounds, s16 yaw);

void debug_box_pos(Vec3f pMin, Vec3f pMax);
void debug_box_pos_rot(Vec3f pMin, Vec3f pMax, s16 yaw);

#endif /* _DEBUG_DRAW_CUBE_H */
