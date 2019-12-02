#ifndef _INTRO_GEO_H
#define _INTRO_GEO_H

#include "engine/graph_node.h"

Gfx *geo18_title_screen(u32 a0, struct GraphNode *a1, UNUSED void *context);
Gfx *geo18_fade_transition(u32 a0, struct GraphNode *a1, UNUSED void *context);
Gfx *intro_backdrop_one_image(u32 index, s8 *backdrop_table);
Gfx *geo18_intro_backdrop(u32 a0, struct GraphNode *a1, UNUSED void *context);
Gfx *geo18_game_over_tile(u32 a0, struct GraphNode *a1, UNUSED void *context);

#endif /* _INTRO_GEO_H */
