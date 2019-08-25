# Normal Mario Geo

glabel mario_geo_face_and_wings # 0x170002E0
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_front
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_half_closed
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_closed
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_right # unused
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_left # unused
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_up # unused
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_down # unused
            geo_display_list LAYER_OPAQUE, mario_cap_on_eyes_dead
         geo_close_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_front
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_half_closed
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_closed
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_right # unused
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_left # unused
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_up # unused
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_down # unused
            geo_display_list LAYER_OPAQUE, mario_cap_off_eyes_dead
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_cap_wings # left
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_cap_wings # right
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_geo_left_hand # 0x1700041C
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_left_hand_closed
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_open
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed
   geo_close_node
   geo_return

glabel mario_geo_right_hand # 0x17000494
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_peace # here we go hand
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_cap
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_cap
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_right_hand_cap_wings
      geo_close_node
   geo_close_node
   geo_return

# The body loads all the parts with some shared dls to apply the solid color of the dl that has it, the same rule applies to the medium and low poly geos

glabel mario_geo_body # 0x1700053C
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_butt # starts sharing solid color with mario_torso (blue)
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 68, 0, 0, mario_torso
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_geo_face_and_wings # stops sharing because faces has its own dl
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_left_arm # starts sharing solid color with mario_left_forearm (red)
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_geo_left_hand # stops sharing because hand has its solid color (white)
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_right_arm # starts sharing solid color of his dl with mario_right_forearm (red)
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_geo_right_hand # stops sharing because hand has its solid color (white)
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_left_thigh # starts sharing solid color of his dl with mario_left_leg (blue)
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0, mario_left_foot # stops sharing because foot has its solid color (brown)
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_right_thigh # starts sharing solid color of his dl with mario_left_leg (blue)
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_OPAQUE, mario_right_foot # stops sharing because foot has its solid color (brown)
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_geo_medium_poly_left_hand # 0x170006F8
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_medium_poly_left_hand_closed
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_open
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed
   geo_close_node
   geo_return

glabel mario_geo_medium_poly_right_hand # 0x17000770
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_medium_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_peace # here we go hand
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_cap
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_cap
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_right_hand_cap_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_geo_medium_poly_body # 0x17000818
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_butt # starts sharing solid color with mario_torso (blue)
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 68, 0, 0, mario_medium_poly_torso
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_geo_face_and_wings # stops sharing because faces has its own dl - medium poly mario uses high poly face
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_left_arm # starts sharing solid color with mario_left_forearm (red)
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_medium_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_geo_medium_poly_left_hand # stops sharing because hand has its solid color (white)
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_right_arm # starts sharing solid color of his dl with mario_right_forearm (red)
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_medium_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_geo_medium_poly_right_hand # stops sharing because hand has its solid color (white)
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_left_thigh # starts sharing solid color of his dl with mario_left_leg (blue)
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_medium_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0, mario_medium_poly_left_foot  # stops sharing because foot has its solid color (brown)
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_right_thigh # starts sharing solid color of his dl with mario_left_leg (blue)
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_medium_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_OPAQUE, mario_medium_poly_right_foot # stops sharing because foot has its solid color (brown)
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_geo_low_poly_face_and_wings # 0x170009D4
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_front
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_half_closed
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_closed
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_right # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_left # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_up # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_down # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_on_eyes_dead
         geo_close_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_front
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_half_closed
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_closed
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_right # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_left # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_up # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_down # unused
            geo_display_list LAYER_OPAQUE, mario_low_poly_cap_off_eyes_dead
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_cap_wings # left
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_cap_wings # right
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_geo_low_poly_left_hand # 0x17000B10
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_low_poly_left_hand_closed
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_open
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_low_poly_left_hand_closed
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_low_poly_left_hand_closed
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_low_poly_left_hand_closed
   geo_close_node
   geo_return

glabel mario_geo_low_poly_right_hand # 0x17000B88
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_low_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_peace # here we go hand
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_cap
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_cap
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_right_hand_cap_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_geo_low_poly_body # 0x17000C30
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_butt # starts sharing solid color with mario_torso (blue)
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 68, 0, 0, mario_low_poly_torso
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_geo_low_poly_face_and_wings # stops sharing because faces has its own dl
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_left_arm  # starts sharing solid color with mario_left_forearm (red)
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_low_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_geo_low_poly_left_hand # stops sharing because hand has its solid color (white)
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_right_arm # starts sharing solid color of his dl with mario_right_forearm (red)
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_low_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_geo_low_poly_right_hand # stops sharing because hand has its solid color (white)
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_left_thigh # starts sharing solid color of his dl with mario_left_leg (blue)
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_low_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0, mario_low_poly_left_foot # stops sharing because foot has its solid color (brown)
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_right_thigh # starts sharing solid color of his dl with mario_left_leg (blue)
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_low_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_OPAQUE, mario_low_poly_right_foot # stops sharing because foot has its solid color (brown)
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

# Vanish Mario Geo

glabel mario_vanish_geo_face_and_wings # 0x17000DEC
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_front
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_half_closed
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_closed
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_right # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_left # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_up # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_down # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_on_eyes_dead
         geo_close_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_front
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_half_closed
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_closed
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_right # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_left # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_up # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_down # unused
            geo_display_list LAYER_TRANSPARENT, mario_cap_off_eyes_dead
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_cap_wings_transparent
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_cap_wings_transparent
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_vanish_geo_left_hand # 0x17000F28
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_left_hand_closed
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_open
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_closed
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_closed
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_closed
   geo_close_node
   geo_return

glabel mario_vanish_geo_right_hand # 0x17000FA0
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_peace # here we go hand
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_cap
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_cap
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_right_hand_cap_wings
      geo_close_node
   geo_close_node
   geo_return

# Same rule body as Normal Mario

glabel mario_vanish_geo_body # 0x17001048
   geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 68, 0, 0, mario_torso
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_vanish_geo_face_and_wings
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_left_arm
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_vanish_geo_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_right_arm
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_vanish_geo_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_left_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0, mario_left_foot
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_right_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_TRANSPARENT, mario_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_vanish_geo_medium_poly_left_hand # 0x17001204
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_medium_poly_left_hand_closed
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_open
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_medium_poly_left_hand_closed
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_medium_poly_left_hand_closed
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_medium_poly_left_hand_closed
   geo_close_node
   geo_return

glabel mario_vanish_geo_medium_poly_right_hand # 0x1700127C
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_medium_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_peace # here we go hand
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_cap
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_cap
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_right_hand_cap_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_vanish_geo_medium_poly_body # 0x17001324
   geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 68, 0, 0, mario_medium_poly_torso
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_vanish_geo_face_and_wings
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_left_arm
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_medium_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_vanish_geo_medium_poly_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_right_arm
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_medium_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_vanish_geo_medium_poly_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_left_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_medium_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0, mario_medium_poly_left_foot
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_right_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_medium_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_TRANSPARENT, mario_medium_poly_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_vanish_geo_low_poly_face_and_wings # 0x170014E0
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_front
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_half_closed
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_closed
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_right
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_left
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_up
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_down
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_on_eyes_dead
         geo_close_node
         geo_switch_case 0, geo_switch_mario_eyes
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_front
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_half_closed
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_closed
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_right
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_left
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_up
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_down
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_cap_off_eyes_dead
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_cap_wings_transparent
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_cap_wings_transparent
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_vanish_geo_low_poly_left_hand # 0x1700161C
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_left_hand_closed
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_open
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_low_poly_left_hand_closed
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_low_poly_left_hand_closed
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_low_poly_left_hand_closed
   geo_close_node
   geo_return

glabel mario_vanish_geo_low_poly_right_hand # 0x17001694
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_peace # here we go hand
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_cap
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_cap
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_right_hand_cap_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_vanish_geo_low_poly_body # 0x1700173C
   geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 68, 0, 0, mario_low_poly_torso
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_vanish_geo_low_poly_face_and_wings
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_left_arm
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_low_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_vanish_geo_low_poly_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_right_arm
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_low_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_vanish_geo_low_poly_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_left_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_low_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0, mario_low_poly_left_foot
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_right_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_low_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_TRANSPARENT, mario_low_poly_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

# Metal Mario Geo

glabel mario_metal_geo_face_and_wings # 0x170018F8
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_display_list LAYER_OPAQUE, mario_metal_cap_on_shared_dl
         geo_display_list LAYER_OPAQUE, mario_metal_cap_off_shared_dl
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_metal_cap_wings # left
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_metal_cap_wings # right
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_geo_left_hand # 0x170019A4
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_left_hand_closed_shared_dl
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_open_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed_shared_dl
   geo_close_node
   geo_return

glabel mario_metal_geo_right_hand # 0x17001A1C
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_metal_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_peace_shared_dl # here we go hand
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_metal_right_hand_cap_shared_dl_wings
      geo_close_node
   geo_close_node
   geo_return

# A difference from Normal Mario is that the dls after the butt and left thigh shares the metal texture of it, same rule applies to the medium and low poly geos

glabel mario_metal_geo_body # 0x17001AC4
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_metal_butt # starts sharing metal texture with the dls below
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 68, 0, 0, mario_metal_torso_shared_dl
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_metal_geo_face_and_wings # unlike normal mario geo, these dls still share the metal texture
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_left_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_geo_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_right_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_geo_right_hand # stop sharing because the wing metal cap of it
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_metal_left_thigh # starts sharing metal texture with the dls below
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0, mario_left_foot_shared_dl
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_right_thigh_shared_dl
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_OPAQUE, mario_metal_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_geo_medium_poly_left_hand # 0x17001C80
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_medium_poly_left_hand_closed_shared_dl
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_open_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed_shared_dl
   geo_close_node
   geo_return

glabel mario_metal_geo_medium_poly_right_hand # 0x17001CF8
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_metal_medium_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_peace_shared_dl # here we go hand
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_metal_right_hand_cap_shared_dl_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_geo_medium_poly_body # 0x17001DA0
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_metal_medium_poly_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 68, 0, 0, mario_metal_medium_poly_torso
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_metal_geo_face_and_wings
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_left_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_medium_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_geo_medium_poly_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_right_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_medium_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_geo_medium_poly_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_metal_medium_poly_left_thigh
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_medium_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0, mario_medium_poly_left_foot_shared_dl
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_right_thigh_shared_dl
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_medium_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_OPAQUE, mario_metal_medium_poly_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_geo_low_poly_face_and_wings # 0x17001F5C
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_display_list LAYER_OPAQUE, mario_metal_low_poly_cap_on
         geo_display_list LAYER_OPAQUE, mario_metal_low_poly_cap_off
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_metal_cap_wings
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_ALPHA, mario_metal_cap_wings
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_geo_low_poly_left_hand # 0x17002008
   geo_switch_case 1, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_low_poly_left_hand_closed_shared_dl
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_left_hand_open_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_low_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_low_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_low_poly_left_hand_closed_shared_dl
   geo_close_node
   geo_return

glabel mario_metal_geo_low_poly_right_hand # 0x17002080
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_metal_low_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_right_hand_peace_shared_dl # here we go hand
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_animated_part LAYER_OPAQUE, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_metal_right_hand_cap_shared_dl_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_geo_low_poly_body # 0x17002128
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_metal_low_poly_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 68, 0, 0, mario_metal_low_poly_torso
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_metal_geo_low_poly_face_and_wings
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_left_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_low_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_geo_low_poly_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_right_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 65, 0, 0, mario_low_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_geo_low_poly_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_metal_low_poly_left_thigh
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_low_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0, mario_low_poly_left_foot_shared_dl
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mario_low_poly_right_thigh_shared_dl
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 89, 0, 0, mario_low_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_OPAQUE, mario_metal_low_poly_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

# Metal Vanish Mario Geo

glabel mario_metal_vanish_geo_face_and_wings # 0x170022E4
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_display_list LAYER_TRANSPARENT, mario_metal_cap_on_shared_dl
         geo_display_list LAYER_TRANSPARENT, mario_metal_cap_off_shared_dl
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_cap_wings_transparent
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_cap_wings_transparent
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_left_hand # 0x17002390
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_left_hand_closed_shared_dl
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_open_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_closed_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_closed_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_closed_shared_dl
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_right_hand # 0x17002408
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_peace_shared_dl # here we go hand
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_metal_right_hand_cap_shared_dl_wings
      geo_close_node
   geo_close_node
   geo_return

# Same rules as Metal Mario

glabel mario_metal_vanish_geo_body # 0x170024B0
   geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_metal_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 68, 0, 0, mario_metal_torso_shared_dl
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_metal_vanish_geo_face_and_wings
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_left_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_vanish_geo_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_right_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_vanish_geo_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_metal_left_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0, mario_left_foot_shared_dl
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_right_thigh_shared_dl
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_TRANSPARENT, mario_metal_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_medium_poly_left_hand # 0x1700266C
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_medium_poly_left_hand_closed_shared_dl
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_open_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_medium_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_medium_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_medium_poly_left_hand_closed_shared_dl
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_medium_poly_right_hand # 0x170026E4
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_medium_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_peace_shared_dl # here we go hand
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_metal_right_hand_cap_shared_dl_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_medium_poly_body # 0x1700278C
   geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_metal_medium_poly_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 68, 0, 0, mario_metal_medium_poly_torso
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_metal_vanish_geo_face_and_wings
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_left_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_medium_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_vanish_geo_medium_poly_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_right_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_medium_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_switch_case 0, geo_switch_mario_hand
                        geo_open_node
                           geo_branch 1, mario_metal_vanish_geo_medium_poly_right_hand
                        geo_close_node
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_metal_medium_poly_left_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_medium_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0, mario_medium_poly_left_foot_shared_dl
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_medium_poly_right_thigh_shared_dl
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_medium_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_TRANSPARENT, mario_metal_medium_poly_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_low_poly_face_and_wings # 0x17002958
   geo_asm 0, Geo18_802773A4
   geo_rotation_node 0x00, 0, 0, 0
   geo_open_node
      geo_switch_case 0, geo_switch_mario_cap_on_off
      geo_open_node
         geo_display_list LAYER_TRANSPARENT, mario_metal_low_poly_cap_on
         geo_display_list LAYER_TRANSPARENT, mario_metal_low_poly_cap_off
      geo_close_node
      geo_translate_rotate 0, 142, -51, -126, 22, -40, -135
      geo_open_node
         geo_asm 0, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_cap_wings_transparent
         geo_close_node
      geo_close_node
      geo_translate_rotate 0, 142, -51, 126, -22, 40, -135
      geo_open_node
         geo_asm 1, Geo18_80277824
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_cap_wings_transparent
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_low_poly_left_hand # 0x17002A04
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 1, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_low_poly_left_hand_closed_shared_dl
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_left_hand_open_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_low_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_low_poly_left_hand_closed_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_low_poly_left_hand_closed_shared_dl
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_low_poly_right_hand # 0x17002A7C
   geo_switch_case 0, geo_switch_mario_hand
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0
      geo_open_node
         geo_asm 0, Geo18_802775CC
         geo_scale 0x00, 65536
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, mario_metal_low_poly_right_hand_closed
         geo_close_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_open
      geo_open_node
         geo_held_object 0x00, 0, 0, 0, geo_switch_mario_hand_grab_pos
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_right_hand_peace_shared_dl # here we go hand
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_animated_part LAYER_TRANSPARENT, 60, 0, 0, mario_metal_right_hand_cap_shared_dl
      geo_open_node
         geo_display_list LAYER_ALPHA, mario_metal_right_hand_cap_shared_dl_wings
      geo_close_node
   geo_close_node
   geo_return

glabel mario_metal_vanish_geo_low_poly_body # 0x17002B24
   geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_metal_low_poly_butt
      geo_open_node
         geo_asm 0, Geo18_802B1BB0
         geo_asm 0, Geo18_80277294
         geo_rotation_node 0x00, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 68, 0, 0, mario_metal_low_poly_torso
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 87, 0, 0
               geo_open_node
                  geo_branch 1, mario_metal_vanish_geo_low_poly_face_and_wings
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 67, -10, 79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_left_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_low_poly_left_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_vanish_geo_low_poly_left_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 68, -10, -79
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_right_arm_shared_dl
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 65, 0, 0, mario_low_poly_right_forearm_shared_dl
                     geo_open_node
                        geo_branch 1, mario_metal_vanish_geo_low_poly_right_hand
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, 42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_metal_low_poly_left_thigh
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_low_poly_left_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0, mario_low_poly_left_foot_shared_dl
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 13, -8, -42
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, mario_low_poly_right_thigh_shared_dl
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 89, 0, 0, mario_low_poly_right_leg_shared_dl
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 67, 0, 0
                  geo_open_node
                     geo_asm 2, Geo18_802775CC
                     geo_scale 0x00, 65536
                     geo_open_node
                        geo_display_list LAYER_TRANSPARENT, mario_metal_low_poly_right_foot
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

# High Poly

glabel mario_geo_load_body # 0x17002CE0
   geo_switch_case 0, geo_switch_mario_cap_effect
   geo_open_node
      geo_branch 1, mario_geo_body
      geo_branch 1, mario_vanish_geo_body
      geo_branch 1, mario_metal_geo_body
      geo_branch 1, mario_metal_vanish_geo_body
   geo_close_node
   geo_return

# Medium Poly

glabel mario_geo_load_medium_poly_body # 0x17002D14
   geo_switch_case 0, geo_switch_mario_cap_effect
   geo_open_node
      geo_branch 1, mario_geo_medium_poly_body
      geo_branch 1, mario_vanish_geo_medium_poly_body
      geo_branch 1, mario_metal_geo_medium_poly_body
      geo_branch 1, mario_metal_vanish_geo_medium_poly_body
   geo_close_node
   geo_return

# Low Poly

glabel mario_geo_load_low_poly_body # 0x17002D48
   geo_switch_case 0, geo_switch_mario_cap_effect
   geo_open_node
      geo_branch 1, mario_geo_low_poly_body
      geo_branch 1, mario_vanish_geo_low_poly_body
      geo_branch 1, mario_metal_geo_low_poly_body
      geo_branch 1, mario_metal_vanish_geo_low_poly_body
   geo_close_node
   geo_return

glabel mario_geo_render_body # 0x17002D7C
   geo_node_start
   geo_open_node
      geo_render_range -2048, 600
      geo_open_node
         geo_branch 1, mario_geo_load_body
      geo_close_node
      geo_render_range 600, 1600
      geo_open_node
         geo_branch 1, mario_geo_load_medium_poly_body
      geo_close_node
      geo_render_range 1600, 32767
      geo_open_node
         geo_branch 1, mario_geo_load_low_poly_body
      geo_close_node
   geo_close_node
   geo_return

# This last geo is used to load all of Mario Geo in the Level Scripts

glabel mario_geo # 0x17002DD4
   geo_shadow SHADOW_CIRCLE_PLAYER, 0xB4, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 0, geo_mirror_mario_backface_culling
         geo_asm 0, Geo18_802770A4
         geo_switch_case 0, geo_switch_mario_stand_run
         geo_open_node
            geo_branch 1, mario_geo_load_body
            geo_branch 1, mario_geo_render_body
         geo_close_node
         geo_asm 1, geo_mirror_mario_backface_culling
      geo_close_node
   geo_close_node
   geo_end
