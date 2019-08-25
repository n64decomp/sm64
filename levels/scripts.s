.include "macros.inc"
.include "level_commands.inc"
.include "geo_commands.inc"

.section .level, "a"

glabel level_main_scripts_entry
    load_mio0 /*seg*/ 0x04, /*romStart*/ _group0_mio0SegmentRomStart, /*romEnd*/ _group0_mio0SegmentRomEnd
    load_mio0 /*seg*/ 0x03, /*romStart*/ _common1_mio0SegmentRomStart, /*romEnd*/ _common1_mio0SegmentRomEnd
    load_raw  /*seg*/ 0x17, /*romStart*/ _group0_geoSegmentRomStart, /*romEnd*/ _group0_geoSegmentRomEnd
    load_raw  /*seg*/ 0x16, /*romStart*/ _common1_geoSegmentRomStart, /*romEnd*/ _common1_geoSegmentRomEnd
    load_raw  /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    alloc_level_pool
    load_model_from_geo /*model*/ MODEL_MARIO,                   /*geo*/ mario_geo
    load_model_from_geo /*model*/ MODEL_SMOKE,                   /*geo*/ smoke_geo
    load_model_from_geo /*model*/ MODEL_SPARKLES,                /*geo*/ sparkles_geo
    load_model_from_geo /*model*/ MODEL_BUBBLE,                  /*geo*/ bubble_geo
    load_model_from_geo /*model*/ MODEL_SPOT_ON_GROUND,          /*geo*/ spot_on_ground_geo
    load_model_from_geo /*model*/ MODEL_WATER_WAVES_SURF,        /*geo*/ water_waves_surface_geo
    load_model_from_geo /*model*/ MODEL_WATER_SPLASH,            /*geo*/ water_splash_geo
    load_model_from_geo /*model*/ MODEL_WATER_WAVES,             /*geo*/ water_waves_geo
    load_model_from_geo /*model*/ MODEL_YELLOW_COIN,             /*geo*/ yellow_coin_geo
    load_model_from_geo /*model*/ MODEL_STAR,                    /*geo*/ star_geo
    load_model_from_geo /*model*/ MODEL_TRANSPARENT_STAR,        /*geo*/ transparent_star_geo
    load_model_from_geo /*model*/ MODEL_WOODEN_SIGNPOST,         /*geo*/ wooden_signpost_geo
    load_model_from_dl  /*model*/ MODEL_WHITE_PARTICLE_SMALL,    /*dl*/  white_particle_small_dl,     /*layer*/ LAYER_ALPHA
    load_model_from_geo /*model*/ MODEL_RED_FLAME,               /*geo*/ red_flame_geo
    load_model_from_geo /*model*/ MODEL_BLUE_FLAME,              /*geo*/ blue_flame_geo
    load_model_from_geo /*model*/ MODEL_BURN_SMOKE,              /*geo*/ burn_smoke_geo
    load_model_from_geo /*model*/ MODEL_LEAVES,                  /*geo*/ leaves_geo
    load_model_from_geo /*model*/ MODEL_PURPLE_MARBLE,           /*geo*/ purple_marble_geo
    load_model_from_geo /*model*/ MODEL_FISH,                    /*geo*/ fish_geo
    load_model_from_geo /*model*/ MODEL_FISH_SHADOW,             /*geo*/ fish_shadow_geo
    load_model_from_geo /*model*/ MODEL_SPARKLES_ANIMATION,      /*geo*/ sparkles_animation_geo
    load_model_from_dl  /*model*/ MODEL_SAND_DUST,               /*dl*/  sand_seg3_dl_0302BCD0,       /*layer*/ LAYER_ALPHA
    load_model_from_geo /*model*/ MODEL_BUTTERFLY,               /*geo*/ butterfly_geo
    load_model_from_geo /*model*/ MODEL_BURN_SMOKE_UNUSED,       /*geo*/ burn_smoke_geo
    load_model_from_dl  /*model*/ MODEL_PEBBLE,                  /*dl*/  pebble_seg3_dl_0301CB00,     /*layer*/ LAYER_ALPHA
    load_model_from_geo /*model*/ MODEL_MIST,                    /*geo*/ mist_geo
    load_model_from_geo /*model*/ MODEL_WHITE_PUFF,              /*geo*/ white_puff_geo
    load_model_from_dl  /*model*/ MODEL_WHITE_PARTICLE_DL,       /*dl*/  white_particle_dl,           /*layer*/ LAYER_ALPHA
    load_model_from_geo /*model*/ MODEL_WHITE_PARTICLE,          /*geo*/ white_particle_geo
    load_model_from_geo /*model*/ MODEL_YELLOW_COIN_NO_SHADOW,   /*geo*/ yellow_coin_no_shadow_geo
    load_model_from_geo /*model*/ MODEL_BLUE_COIN,               /*geo*/ blue_coin_geo
    load_model_from_geo /*model*/ MODEL_BLUE_COIN_NO_SHADOW,     /*geo*/ blue_coin_no_shadow_geo
    load_model_from_geo /*model*/ MODEL_MARIOS_WINGED_METAL_CAP, /*geo*/ marios_winged_metal_cap_geo
    load_model_from_geo /*model*/ MODEL_MARIOS_METAL_CAP,        /*geo*/ marios_metal_cap_geo
    load_model_from_geo /*model*/ MODEL_MARIOS_WING_CAP,         /*geo*/ marios_wing_cap_geo
    load_model_from_geo /*model*/ MODEL_MARIOS_CAP,              /*geo*/ marios_cap_geo
    load_model_from_geo /*model*/ MODEL_MARIOS_CAP,              /*geo*/ marios_cap_geo # repeated
    load_model_from_geo /*model*/ MODEL_BOWSER_KEY_CUTSCENE,     /*geo*/ bowser_key_cutscene_geo
    load_model_from_geo /*model*/ MODEL_BOWSER_KEY,              /*geo*/ bowser_key_geo
    load_model_from_geo /*model*/ MODEL_RED_FLAME_SHADOW,        /*geo*/ red_flame_shadow_geo
    load_model_from_geo /*model*/ MODEL_1UP,                     /*geo*/ mushroom_1up_geo
    load_model_from_geo /*model*/ MODEL_RED_COIN,                /*geo*/ red_coin_geo
    load_model_from_geo /*model*/ MODEL_RED_COIN_NO_SHADOW,      /*geo*/ red_coin_no_shadow_geo
    load_model_from_geo /*model*/ MODEL_NUMBER,                  /*geo*/ number_geo
    load_model_from_geo /*model*/ MODEL_EXPLOSION,               /*geo*/ explosion_geo
    load_model_from_geo /*model*/ MODEL_DIRT_ANIMATION,          /*geo*/ dirt_animation_geo
    load_model_from_geo /*model*/ MODEL_CARTOON_STAR,            /*geo*/ cartoon_star_geo
    free_level_pool
    call /*arg*/ 0, /*func*/ lvl_init_from_save_file
    loop_begin
        execute /*seg*/ 0x14, /*script*/ _menuSegmentRomStart, /*scriptEnd*/ _menuSegmentRomEnd, /*entry*/ level_main_menu_entry_2
        jump_link /*target*/ script_func_local_1
        sleep /*frames*/ 1
    loop_until /*op*/ OP_LT, /*arg*/ 0
    jump_if /*op*/ OP_EQ, /*arg*/ -1, /*target*/ L2
    jump_if /*op*/ OP_EQ, /*arg*/ -2, /*target*/ L3
    jump_if /*op*/ OP_EQ, /*arg*/ -3, /*target*/ L4
    jump_if /*op*/ OP_EQ, /*arg*/ -8, /*target*/ L1
    jump_if /*op*/ OP_EQ, /*arg*/ -9, /*target*/ L5
L1:
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_1

L2:
    exit_and_execute /*seg*/ 0x0E, /*script*/ _endingSegmentRomStart, /*scriptEnd*/ _endingSegmentRomEnd, /*entry*/ level_ending_entry

L3:
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_2

L4:
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_3

L5:
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_4

script_func_local_1:
    get_or_set /*op*/ OP_GET, /*var*/ VAR_CURR_LEVEL_NUM
    jump_if /*op*/ OP_EQ, /*arg*/ 4, /*target*/ L6
    jump_if /*op*/ OP_EQ, /*arg*/ 5, /*target*/ L7
    jump_if /*op*/ OP_EQ, /*arg*/ 6, /*target*/ L8
    jump_if /*op*/ OP_EQ, /*arg*/ 7, /*target*/ L9
    jump_if /*op*/ OP_EQ, /*arg*/ 8, /*target*/ L10
    jump_if /*op*/ OP_EQ, /*arg*/ 9, /*target*/ L11
    jump_if /*op*/ OP_EQ, /*arg*/ 10, /*target*/ L12
    jump_if /*op*/ OP_EQ, /*arg*/ 11, /*target*/ L13
    jump_if /*op*/ OP_EQ, /*arg*/ 12, /*target*/ L14
    jump_if /*op*/ OP_EQ, /*arg*/ 13, /*target*/ L15
    jump_if /*op*/ OP_EQ, /*arg*/ 14, /*target*/ L16
    jump_if /*op*/ OP_EQ, /*arg*/ 15, /*target*/ L17
    jump_if /*op*/ OP_EQ, /*arg*/ 16, /*target*/ L18
    jump_if /*op*/ OP_EQ, /*arg*/ 17, /*target*/ L19
    jump_if /*op*/ OP_EQ, /*arg*/ 18, /*target*/ L20
    jump_if /*op*/ OP_EQ, /*arg*/ 19, /*target*/ L21
    jump_if /*op*/ OP_EQ, /*arg*/ 20, /*target*/ L22
    jump_if /*op*/ OP_EQ, /*arg*/ 21, /*target*/ L23
    jump_if /*op*/ OP_EQ, /*arg*/ 22, /*target*/ L24
    jump_if /*op*/ OP_EQ, /*arg*/ 23, /*target*/ L25
    jump_if /*op*/ OP_EQ, /*arg*/ 24, /*target*/ L26
    jump_if /*op*/ OP_EQ, /*arg*/ 25, /*target*/ L27
    jump_if /*op*/ OP_EQ, /*arg*/ 26, /*target*/ L28
    jump_if /*op*/ OP_EQ, /*arg*/ 27, /*target*/ L29
    jump_if /*op*/ OP_EQ, /*arg*/ 28, /*target*/ L30
    jump_if /*op*/ OP_EQ, /*arg*/ 29, /*target*/ L31
    jump_if /*op*/ OP_EQ, /*arg*/ 30, /*target*/ L32
    jump_if /*op*/ OP_EQ, /*arg*/ 31, /*target*/ L33
    jump_if /*op*/ OP_EQ, /*arg*/ 33, /*target*/ L34
    jump_if /*op*/ OP_EQ, /*arg*/ 34, /*target*/ L35
    jump_if /*op*/ OP_EQ, /*arg*/ 36, /*target*/ L36
    exit

L6:
    execute /*seg*/ 0x0E, /*script*/ _bbhSegmentRomStart, /*scriptEnd*/ _bbhSegmentRomEnd, /*entry*/ level_bbh_entry
    return

L7:
    execute /*seg*/ 0x0E, /*script*/ _ccmSegmentRomStart, /*scriptEnd*/ _ccmSegmentRomEnd, /*entry*/ level_ccm_entry
    return

L8:
    execute /*seg*/ 0x0E, /*script*/ _castle_insideSegmentRomStart, /*scriptEnd*/ _castle_insideSegmentRomEnd, /*entry*/ level_castle_entry
    return

L9:
    execute /*seg*/ 0x0E, /*script*/ _hmcSegmentRomStart, /*scriptEnd*/ _hmcSegmentRomEnd, /*entry*/ level_hmc_entry
    return

L10:
    execute /*seg*/ 0x0E, /*script*/ _sslSegmentRomStart, /*scriptEnd*/ _sslSegmentRomEnd, /*entry*/ level_ssl_entry
    return

L11:
    execute /*seg*/ 0x0E, /*script*/ _bobSegmentRomStart, /*scriptEnd*/ _bobSegmentRomEnd, /*entry*/ level_bob_entry
    return

L12:
    execute /*seg*/ 0x0E, /*script*/ _slSegmentRomStart, /*scriptEnd*/ _slSegmentRomEnd, /*entry*/ level_sl_entry
    return

L13:
    execute /*seg*/ 0x0E, /*script*/ _wdwSegmentRomStart, /*scriptEnd*/ _wdwSegmentRomEnd, /*entry*/ level_wdw_entry
    return

L14:
    execute /*seg*/ 0x0E, /*script*/ _jrbSegmentRomStart, /*scriptEnd*/ _jrbSegmentRomEnd, /*entry*/ level_jrb_entry
    return

L15:
    execute /*seg*/ 0x0E, /*script*/ _thiSegmentRomStart, /*scriptEnd*/ _thiSegmentRomEnd, /*entry*/ level_thi_entry
    return

L16:
    execute /*seg*/ 0x0E, /*script*/ _ttcSegmentRomStart, /*scriptEnd*/ _ttcSegmentRomEnd, /*entry*/ level_ttc_entry
    return

L17:
    execute /*seg*/ 0x0E, /*script*/ _rrSegmentRomStart, /*scriptEnd*/ _rrSegmentRomEnd, /*entry*/ level_rr_entry
    return

L18:
    execute /*seg*/ 0x0E, /*script*/ _castle_groundsSegmentRomStart, /*scriptEnd*/ _castle_groundsSegmentRomEnd, /*entry*/ level_castle_grounds_entry
    return

L19:
    execute /*seg*/ 0x0E, /*script*/ _bitdwSegmentRomStart, /*scriptEnd*/ _bitdwSegmentRomEnd, /*entry*/ level_bitdw_entry
    return

L20:
    execute /*seg*/ 0x0E, /*script*/ _vcutmSegmentRomStart, /*scriptEnd*/ _vcutmSegmentRomEnd, /*entry*/ level_vcutm_entry
    return

L21:
    execute /*seg*/ 0x0E, /*script*/ _bitfsSegmentRomStart, /*scriptEnd*/ _bitfsSegmentRomEnd, /*entry*/ level_bitfs_entry
    return

L22:
    execute /*seg*/ 0x0E, /*script*/ _saSegmentRomStart, /*scriptEnd*/ _saSegmentRomEnd, /*entry*/ level_sa_entry
    return

L23:
    execute /*seg*/ 0x0E, /*script*/ _bitsSegmentRomStart, /*scriptEnd*/ _bitsSegmentRomEnd, /*entry*/ level_bits_entry
    return

L24:
    execute /*seg*/ 0x0E, /*script*/ _lllSegmentRomStart, /*scriptEnd*/ _lllSegmentRomEnd, /*entry*/ level_lll_entry
    return

L25:
    execute /*seg*/ 0x0E, /*script*/ _dddSegmentRomStart, /*scriptEnd*/ _dddSegmentRomEnd, /*entry*/ level_ddd_entry
    return

L26:
    execute /*seg*/ 0x0E, /*script*/ _wfSegmentRomStart, /*scriptEnd*/ _wfSegmentRomEnd, /*entry*/ level_wf_entry
    return

L27:
    execute /*seg*/ 0x0E, /*script*/ _endingSegmentRomStart, /*scriptEnd*/ _endingSegmentRomEnd, /*entry*/ level_ending_entry
    return

L28:
    execute /*seg*/ 0x0E, /*script*/ _castle_courtyardSegmentRomStart, /*scriptEnd*/ _castle_courtyardSegmentRomEnd, /*entry*/ level_castle_courtyard_entry
    return

L29:
    execute /*seg*/ 0x0E, /*script*/ _pssSegmentRomStart, /*scriptEnd*/ _pssSegmentRomEnd, /*entry*/ level_pss_entry
    return

L30:
    execute /*seg*/ 0x0E, /*script*/ _cotmcSegmentRomStart, /*scriptEnd*/ _cotmcSegmentRomEnd, /*entry*/ level_cotmc_entry
    return

L31:
    execute /*seg*/ 0x0E, /*script*/ _totwcSegmentRomStart, /*scriptEnd*/ _totwcSegmentRomEnd, /*entry*/ level_totwc_entry
    return

L32:
    execute /*seg*/ 0x0E, /*script*/ _bowser_1SegmentRomStart, /*scriptEnd*/ _bowser_1SegmentRomEnd, /*entry*/ level_bowser_1_entry
    return

L33:
    execute /*seg*/ 0x0E, /*script*/ _wmotrSegmentRomStart, /*scriptEnd*/ _wmotrSegmentRomEnd, /*entry*/ level_wmotr_entry
    return

L34:
    execute /*seg*/ 0x0E, /*script*/ _bowser_2SegmentRomStart, /*scriptEnd*/ _bowser_2SegmentRomEnd, /*entry*/ level_bowser_2_entry
    return

L35:
    execute /*seg*/ 0x0E, /*script*/ _bowser_3SegmentRomStart, /*scriptEnd*/ _bowser_3SegmentRomEnd, /*entry*/ level_bowser_3_entry
    return

L36:
    execute /*seg*/ 0x0E, /*script*/ _ttmSegmentRomStart, /*scriptEnd*/ _ttmSegmentRomEnd, /*entry*/ level_ttm_entry
    return

glabel script_func_global_1
    load_model_from_geo /*model*/ MODEL_BLUE_COIN_SWITCH,        /*geo*/ blue_coin_switch_geo
    load_model_from_geo /*model*/ MODEL_AMP,                     /*geo*/ amp_geo
    load_model_from_geo /*model*/ MODEL_PURPLE_SWITCH,           /*geo*/ purple_switch_geo
    load_model_from_geo /*model*/ MODEL_CHECKERBOARD_PLATFORM,   /*geo*/ checkerboard_platform_geo
    load_model_from_geo /*model*/ MODEL_BREAKABLE_BOX,           /*geo*/ breakable_box_geo
    load_model_from_geo /*model*/ MODEL_BREAKABLE_BOX_SMALL,     /*geo*/ breakable_box_small_geo
    load_model_from_geo /*model*/ MODEL_EXCLAMATION_BOX_OUTLINE, /*geo*/ exclamation_box_outline_geo
    load_model_from_geo /*model*/ MODEL_EXCLAMATION_BOX,         /*geo*/ exclamation_box_geo
    load_model_from_geo /*model*/ MODEL_GOOMBA,                  /*geo*/ goomba_geo
    load_model_from_dl  /*model*/ MODEL_EXCLAMATION_POINT,       /*dl*/  exclamation_box_outline_seg8_dl_08025F08, /*layer*/ LAYER_ALPHA
    load_model_from_geo /*model*/ MODEL_KOOPA_SHELL,             /*geo*/ koopa_shell_geo
    load_model_from_geo /*model*/ MODEL_METAL_BOX,               /*geo*/ metal_box_geo
    load_model_from_dl  /*model*/ MODEL_METAL_BOX_DL,            /*dl*/  metal_box_dl,                             /*layer*/ LAYER_OPAQUE
    load_model_from_geo /*model*/ MODEL_BLACK_BOBOMB,            /*geo*/ black_bobomb_geo
    load_model_from_geo /*model*/ MODEL_BOBOMB_BUDDY,            /*geo*/ bobomb_buddy_geo
    load_model_from_dl  /*model*/ MODEL_DL_CANNON_LID,           /*dl*/  cannon_lid_seg8_dl_080048E0,              /*layer*/ LAYER_OPAQUE
    load_model_from_geo /*model*/ MODEL_BOWLING_BALL,            /*geo*/ bowling_ball_geo
    load_model_from_geo /*model*/ MODEL_CANNON_BARREL,           /*geo*/ cannon_barrel_geo
    load_model_from_geo /*model*/ MODEL_CANNON_BASE,             /*geo*/ cannon_base_geo
    load_model_from_geo /*model*/ MODEL_HEART,                   /*geo*/ heart_geo
    load_model_from_geo /*model*/ MODEL_FLYGUY,                  /*geo*/ flyguy_geo
    load_model_from_geo /*model*/ MODEL_CHUCKYA,                 /*geo*/ chuckya_geo
    load_model_from_geo /*model*/ MODEL_TRAJECTORY_MARKER_BALL,      /*geo*/ bowling_ball_track_geo
    return

glabel script_func_global_2
    load_model_from_geo /*model*/ MODEL_BULLET_BILL,             /*geo*/ bullet_bill_geo
    load_model_from_geo /*model*/ MODEL_YELLOW_SPHERE,           /*geo*/ yellow_sphere_geo
    load_model_from_geo /*model*/ MODEL_HOOT,                    /*geo*/ hoot_geo
    load_model_from_geo /*model*/ MODEL_YOSHI_EGG,               /*geo*/ yoshi_egg_geo
    load_model_from_geo /*model*/ MODEL_THWOMP,                  /*geo*/ thwomp_geo
    load_model_from_geo /*model*/ MODEL_HEAVE_HO,                /*geo*/ heave_ho_geo
    return

glabel script_func_global_3
    load_model_from_geo /*model*/ MODEL_BLARGG,                  /*geo*/ blargg_geo
    load_model_from_geo /*model*/ MODEL_BULLY,                   /*geo*/ bully_geo
    load_model_from_geo /*model*/ MODEL_BULLY_BOSS,              /*geo*/ bully_boss_geo
    return

glabel script_func_global_4
    load_model_from_geo /*model*/ MODEL_WATER_BOMB,              /*geo*/ water_bomb_geo
    load_model_from_geo /*model*/ MODEL_WATER_BOMB_SHADOW,       /*geo*/ water_bomb_shadow_geo
    load_model_from_geo /*model*/ MODEL_KING_BOBOMB,             /*geo*/ king_bobomb_geo
    return

glabel script_func_global_5
    load_model_from_geo /*model*/ MODEL_MANTA_RAY,               /*geo*/ manta_seg5_geo_05008D14
    load_model_from_geo /*model*/ MODEL_UNAGI,                   /*geo*/ unagi_geo
    load_model_from_geo /*model*/ MODEL_SUSHI,                   /*geo*/ sushi_geo
    load_model_from_dl  /*model*/ MODEL_DL_WHIRLPOOL,            /*dl*/  whirlpool_seg5_dl_05013CB8, /*layer*/ LAYER_TRANSPARENT
    load_model_from_geo /*model*/ MODEL_CLAM_SHELL,              /*geo*/ clam_shell_geo
    return

glabel script_func_global_6
    load_model_from_geo /*model*/ MODEL_POKEY_HEAD,              /*geo*/ pokey_head_geo
    load_model_from_geo /*model*/ MODEL_POKEY_BODY_PART,         /*geo*/ pokey_body_part_geo
    load_model_from_geo /*model*/ MODEL_TORNADO,                 /*geo*/ tornado_seg5_geo_05014630
    load_model_from_geo /*model*/ MODEL_KLEPTO,                  /*geo*/ klepto_geo
    load_model_from_geo /*model*/ MODEL_EYEROK_LEFT_HAND,        /*geo*/ eyerok_left_hand_geo
    load_model_from_geo /*model*/ MODEL_EYEROK_RIGHT_HAND,       /*geo*/ eyerok_right_hand_geo
    return

glabel script_func_global_7
    load_model_from_dl  /*model*/ MODEL_DL_MONTY_MOLE_HOLE,      /*dl*/  monty_mole_hole_seg5_dl_05000840, /*layer*/ LAYER_TRANSPARENT_DECAL
    load_model_from_geo /*model*/ MODEL_MONTY_MOLE,              /*geo*/ monty_mole_geo
    load_model_from_geo /*model*/ MODEL_UKIKI,                   /*geo*/ ukiki_geo
    load_model_from_geo /*model*/ MODEL_FWOOSH,                  /*geo*/ fwoosh_geo
    return

glabel script_func_global_8
    load_model_from_geo /*model*/ MODEL_SPINDRIFT,               /*geo*/ spindrift_geo
    load_model_from_geo /*model*/ MODEL_MR_BLIZZARD_HIDDEN,      /*geo*/ mr_blizzard_hidden_geo
    load_model_from_geo /*model*/ MODEL_MR_BLIZZARD,             /*geo*/ mr_blizzard_geo
    load_model_from_geo /*model*/ MODEL_PENGUIN,                 /*geo*/ penguin_geo
    return

glabel script_func_global_9
    load_model_from_dl  /*model*/ MODEL_CAP_SWITCH_EXCLAMATION,  /*dl*/  cap_switch_exclamation_seg5_dl_05002E00, /*layer*/ LAYER_ALPHA
    load_model_from_geo /*model*/ MODEL_CAP_SWITCH,              /*geo*/ cap_switch_geo
    load_model_from_dl  /*model*/ MODEL_CAP_SWITCH_BASE,         /*dl*/  cap_switch_base_seg5_dl_05003120,        /*layer*/ LAYER_OPAQUE
    return

glabel script_func_global_10
    load_model_from_geo /*model*/ MODEL_BOO,                     /*geo*/ boo_geo
    load_model_from_geo /*model*/ MODEL_BETA_BOO_KEY,               /*geo*/ small_key_geo
    load_model_from_geo /*model*/ MODEL_HAUNTED_CHAIR,           /*geo*/ haunted_chair_geo
    load_model_from_geo /*model*/ MODEL_MAD_PIANO,               /*geo*/ mad_piano_geo
    load_model_from_geo /*model*/ MODEL_BOOKEND_PART,            /*geo*/ bookend_part_geo
    load_model_from_geo /*model*/ MODEL_BOOKEND,                 /*geo*/ bookend_geo
    load_model_from_geo /*model*/ MODEL_HAUNTED_CAGE,            /*geo*/ haunted_cage_geo
    return

glabel script_func_global_11
    load_model_from_geo /*model*/ MODEL_BIRDS,                   /*geo*/ birds_geo
    load_model_from_geo /*model*/ MODEL_PEACH,                   /*geo*/ peach_geo
    load_model_from_geo /*model*/ MODEL_YOSHI,                   /*geo*/ yoshi_geo
    return

glabel script_func_global_12
    load_model_from_geo /*model*/ MODEL_ENEMY_LAKITU,            /*geo*/ enemy_lakitu_geo
    load_model_from_geo /*model*/ MODEL_SPINY_BALL,              /*geo*/ spiny_ball_geo
    load_model_from_geo /*model*/ MODEL_SPINY,                   /*geo*/ spiny_geo
    load_model_from_geo /*model*/ MODEL_WIGGLER,                 /*geo*/ wiggler_geo
    load_model_from_geo /*model*/ MODEL_WIGGLER_BODY_PART,       /*geo*/ wiggler_body_part_geo
    load_model_from_geo /*model*/ MODEL_BUBBA,                   /*geo*/ bubba_geo
    return

glabel script_func_global_13
    load_model_from_geo /*model*/ MODEL_BOWSER,                  /*geo*/ bowser_geo
    load_model_from_geo /*model*/ MODEL_BOWSER_BOMB_CHILD_OBJ,   /*geo*/ bowser_bomb_geo
    load_model_from_geo /*model*/ MODEL_BOWSER_BOMB,             /*geo*/ bowser_bomb_geo
    load_model_from_geo /*model*/ MODEL_BOWSER_SMOKE,            /*geo*/ bowser_impact_smoke_geo
    load_model_from_geo /*model*/ MODEL_BOWSER_FLAMES,           /*geo*/ bowser_flames_geo
    load_model_from_geo /*model*/ MODEL_BOWSER_WAVE,             /*geo*/ invisible_bowser_accessory_geo
    load_model_from_geo /*model*/ MODEL_BOWSER2,                 /*geo*/ bowser2_geo
    return

glabel script_func_global_14
    load_model_from_geo /*model*/ MODEL_BUB,                     /*geo*/ bub_geo
    load_model_from_geo /*model*/ MODEL_TREASURE_CHEST_BASE,     /*geo*/ treasure_chest_base_geo
    load_model_from_geo /*model*/ MODEL_TREASURE_CHEST_LID,      /*geo*/ treasure_chest_lid_geo
    load_model_from_geo /*model*/ MODEL_CYAN_FISH,               /*geo*/ cyan_fish_geo
    load_model_from_geo /*model*/ MODEL_WATER_RING,              /*geo*/ water_ring_geo
    load_model_from_geo /*model*/ MODEL_WATER_MINE,              /*geo*/ water_mine_geo
    load_model_from_geo /*model*/ MODEL_SEAWEED,                 /*geo*/ seaweed_geo
    load_model_from_geo /*model*/ MODEL_SKEETER,                 /*geo*/ skeeter_geo
    return

glabel script_func_global_15
    load_model_from_geo /*model*/ MODEL_PIRANHA_PLANT,           /*geo*/ piranha_plant_geo
    load_model_from_geo /*model*/ MODEL_WHOMP,                   /*geo*/ whomp_geo
    load_model_from_geo /*model*/ MODEL_KOOPA_WITH_SHELL,        /*geo*/ koopa_with_shell_geo
    load_model_from_geo /*model*/ MODEL_KOOPA_WITHOUT_SHELL,     /*geo*/ koopa_without_shell_geo
    load_model_from_geo /*model*/ MODEL_METALLIC_BALL,           /*geo*/ metallic_ball_geo
    load_model_from_geo /*model*/ MODEL_CHAIN_CHOMP,             /*geo*/ chain_chomp
    load_model_from_geo /*model*/ MODEL_KOOPA_FLAG,              /*geo*/ koopa_flag_geo
    load_model_from_geo /*model*/ MODEL_WOODEN_POST,             /*geo*/ wooden_post_geo
    return

glabel script_func_global_16
    load_model_from_geo /*model*/ MODEL_MIPS,                    /*geo*/ mips_geo
    load_model_from_geo /*model*/ MODEL_BOO_CASTLE,              /*geo*/ boo_castle_geo
    load_model_from_geo /*model*/ MODEL_LAKITU,                  /*geo*/ lakitu_geo
    load_model_from_geo /*model*/ MODEL_TOAD,                    /*geo*/ toad_geo
    return

glabel script_func_global_17
    load_model_from_geo /*model*/ MODEL_CHILL_BULLY,             /*geo*/ chilly_chief_geo
    load_model_from_geo /*model*/ MODEL_BIG_CHILL_BULLY,         /*geo*/ chilly_chief_big_geo
    load_model_from_geo /*model*/ MODEL_MONEYBAG,                /*geo*/ moneybag_geo
    return

glabel script_func_global_18
    load_model_from_geo /*model*/ MODEL_SWOOP,                   /*geo*/ swoop_geo
    load_model_from_geo /*model*/ MODEL_SCUTTLEBUG,              /*geo*/ scuttlebug_geo
    load_model_from_geo /*model*/ MODEL_MR_I_IRIS,               /*geo*/ mr_i_iris_geo
    load_model_from_geo /*model*/ MODEL_MR_I,                    /*geo*/ mr_i_geo
    load_model_from_geo /*model*/ MODEL_DORRIE,                  /*geo*/ dorrie_geo
    load_model_from_geo /*model*/ MODEL_SNUFIT,                  /*geo*/ snufit_geo
    return

.align 4
