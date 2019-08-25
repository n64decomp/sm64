.include "macros.inc"
.include "geo_commands.inc"

.section .geo, "a"

actorgeo mist
actorgeo explosion
actorgeo butterfly
actorgeo coin
actorgeo warp_pipe
actorgeo door
actorgeo bowser_key
actorgeo flame
actorgeo blue_fish
actorgeo leaves
actorgeo mario_cap

# Hmm. this geo is where power_meter normally is. Perhaps the
# power meter used to be a number very early in development, like
# a placeholder?
glabel number_geo # 0x16000E14
   geo_node_start
   geo_open_node
      geo_switch_case 10, geo_switch_anim_state
      geo_open_node
         geo_display_list LAYER_ALPHA, dl_billboard_num_0
         geo_display_list LAYER_ALPHA, dl_billboard_num_1
         geo_display_list LAYER_ALPHA, dl_billboard_num_2
         geo_display_list LAYER_ALPHA, dl_billboard_num_3
         geo_display_list LAYER_ALPHA, dl_billboard_num_4
         geo_display_list LAYER_ALPHA, dl_billboard_num_5
         geo_display_list LAYER_ALPHA, dl_billboard_num_6
         geo_display_list LAYER_ALPHA, dl_billboard_num_7
         geo_display_list LAYER_ALPHA, dl_billboard_num_8
         geo_display_list LAYER_ALPHA, dl_billboard_num_9
      geo_close_node
   geo_close_node
   geo_end

actorgeo mushroom_1up
actorgeo star
actorgeo dirt
actorgeo transparent_star
actorgeo white_particle
actorgeo wooden_signpost
actorgeo tree
