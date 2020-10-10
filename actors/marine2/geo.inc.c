#include "src/game/envfx_snow.h"

const GeoLayout marine2_ArmatureObj_half[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_000_switch_001_000_displaylist_mesh),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout marine2_ArmatureObj_closed[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_000_switch_002_000_displaylist_mesh),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout marine2_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SHADOW(0, 180, 100),
		GEO_OPEN_NODE(),
			GEO_SCALE(LAYER_FORCE, 16384),
			GEO_OPEN_NODE(),
				GEO_SWITCH_CASE(0, geo_switch_mario_stand_run),
				GEO_OPEN_NODE(),
					GEO_NODE_START(),
					GEO_OPEN_NODE(),
						GEO_SWITCH_CASE(0, geo_switch_mario_cap_effect),
						GEO_OPEN_NODE(),
							GEO_NODE_START(),
							GEO_OPEN_NODE(),
								GEO_ANIMATED_PART(LAYER_OPAQUE, 38, 0, 0, NULL),
								GEO_OPEN_NODE(),
									GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, marine2_000_offset_mesh),
									GEO_OPEN_NODE(),
										GEO_ROTATION_NODE(LAYER_FORCE, 0, 0, 0),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 48, 0, 0, marine2_000_offset_001_mesh),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 59, 0, 0, NULL),
												GEO_OPEN_NODE(),
													GEO_ROTATION_NODE(LAYER_FORCE, 0, 0, 0),
													GEO_OPEN_NODE(),
														GEO_SWITCH_CASE(0, geo_switch_mario_cap_on_off),
														GEO_OPEN_NODE(),
															GEO_NODE_START(),
															GEO_OPEN_NODE(),
																GEO_SWITCH_CASE(0, geo_switch_mario_eyes),
																GEO_OPEN_NODE(),
																	GEO_NODE_START(),
																	GEO_OPEN_NODE(),
																		GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_000_displaylist_mesh),
																	GEO_CLOSE_NODE(),
																	GEO_BRANCH(1, marine2_ArmatureObj_half),
																	GEO_BRANCH(1, marine2_ArmatureObj_closed),
																GEO_CLOSE_NODE(),
															GEO_CLOSE_NODE(),
														GEO_CLOSE_NODE(),
														GEO_TRANSLATE_ROTATE(LAYER_FORCE, 133, -48, -118, 15, -33, -133),
														GEO_OPEN_NODE(),
															GEO_ROTATION_NODE(LAYER_FORCE, 0, 0, 0),
															GEO_OPEN_NODE(),
															GEO_CLOSE_NODE(),
														GEO_CLOSE_NODE(),
														GEO_TRANSLATE_ROTATE(LAYER_FORCE, 133, -48, 118, -15, 33, -133),
														GEO_OPEN_NODE(),
															GEO_ROTATION_NODE(LAYER_FORCE, 0, 0, 0),
															GEO_OPEN_NODE(),
															GEO_CLOSE_NODE(),
														GEO_CLOSE_NODE(),
													GEO_CLOSE_NODE(),
												GEO_CLOSE_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 45, -9, 35, NULL),
												GEO_OPEN_NODE(),
													GEO_ANIMATED_PART(LAYER_OPAQUE, 1, 0, 0, marine2_000_offset_003_mesh),
													GEO_OPEN_NODE(),
														GEO_ANIMATED_PART(LAYER_OPAQUE, 71, 0, 0, marine2_000_offset_004_mesh),
														GEO_OPEN_NODE(),
															GEO_SWITCH_CASE(1, geo_switch_mario_hand),
															GEO_OPEN_NODE(),
																GEO_NODE_START(),
																GEO_OPEN_NODE(),
																	GEO_ANIMATED_PART(LAYER_OPAQUE, 82, 0, 0, NULL),
																	GEO_OPEN_NODE(),
																		GEO_SCALE(LAYER_FORCE, 65536),
																		GEO_OPEN_NODE(),
																			GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_000_displaylist_003_mesh),
																		GEO_CLOSE_NODE(),
																	GEO_CLOSE_NODE(),
																GEO_CLOSE_NODE(),
															GEO_CLOSE_NODE(),
														GEO_CLOSE_NODE(),
													GEO_CLOSE_NODE(),
												GEO_CLOSE_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 46, -9, -33, NULL),
												GEO_OPEN_NODE(),
													GEO_ANIMATED_PART(LAYER_OPAQUE, -1, 0, 0, marine2_000_offset_006_mesh),
													GEO_OPEN_NODE(),
														GEO_ANIMATED_PART(LAYER_OPAQUE, 67, 0, 0, marine2_000_offset_007_mesh),
														GEO_OPEN_NODE(),
															GEO_SWITCH_CASE(0, geo_switch_mario_hand),
															GEO_OPEN_NODE(),
																GEO_NODE_START(),
																GEO_OPEN_NODE(),
																	GEO_ANIMATED_PART(LAYER_OPAQUE, 82, 0, 0, NULL),
																	GEO_OPEN_NODE(),
																		GEO_SCALE(LAYER_FORCE, 65536),
																		GEO_OPEN_NODE(),
																			GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_000_displaylist_004_mesh),
																		GEO_CLOSE_NODE(),
																		GEO_HELD_OBJECT(0, 0, 0, 0, geo_switch_mario_hand_grab_pos),
																	GEO_CLOSE_NODE(),
																GEO_CLOSE_NODE(),
															GEO_CLOSE_NODE(),
														GEO_CLOSE_NODE(),
													GEO_CLOSE_NODE(),
												GEO_CLOSE_NODE(),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, -19, -8, 28, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, marine2_000_offset_009_mesh),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 62, 0, 0, marine2_000_offset_010_mesh),
												GEO_OPEN_NODE(),
													GEO_ANIMATED_PART(LAYER_OPAQUE, 86, 0, 0, marine2_000_offset_011_mesh),
												GEO_CLOSE_NODE(),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, -19, -8, -27, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, marine2_000_offset_012_mesh),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 62, 0, 0, marine2_000_offset_013_mesh),
												GEO_OPEN_NODE(),
													GEO_ANIMATED_PART(LAYER_OPAQUE, 86, 0, 0, NULL),
													GEO_OPEN_NODE(),
														GEO_SCALE(LAYER_FORCE, 65536),
														GEO_OPEN_NODE(),
															GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_000_displaylist_005_mesh),
														GEO_CLOSE_NODE(),
													GEO_CLOSE_NODE(),
												GEO_CLOSE_NODE(),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
									GEO_CLOSE_NODE(),
								GEO_CLOSE_NODE(),
							GEO_CLOSE_NODE(),
						GEO_CLOSE_NODE(),
					GEO_CLOSE_NODE(),
				GEO_CLOSE_NODE(),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, marine2_material_revert_render_settings),
	GEO_CLOSE_NODE(),
	GEO_END(),
};