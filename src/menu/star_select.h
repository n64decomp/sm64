#ifndef STAR_SELECT_H
#define STAR_SELECT_H

enum StarSelectorTypes
{
    STAR_SELECTOR_NOT_SELECTED,
    STAR_SELECTOR_SELECTED,
    STAR_SELECTOR_100_COINS
};

extern Gfx *geo_act_selector_strings(s16 callContext, struct GraphNode *node);
extern void lvl_init_act_selector_values_and_stars(s32 arg, s32 unused);
extern int lvl_update_obj_and_load_act_button_actions(s32 arg, s32 unused);

#endif /* STAR_SELECT_H */
