#include "src/game/envfx_snow.h"

const GeoLayout chocola_ed_001_switch_opt1[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_NODE_START(),
		GEO_OPEN_NODE(),
			GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
			GEO_OPEN_NODE(),
				GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
				GEO_OPEN_NODE(),
					GEO_ANIMATED_PART(LAYER_OPAQUE, 83, 0, 0, NULL),
					GEO_OPEN_NODE(),
						GEO_ANIMATED_PART(LAYER_TRANSPARENT, 126, -37, 0, chocola_ed_000_offset_003_mesh),
					GEO_CLOSE_NODE(),
					GEO_ANIMATED_PART(LAYER_TRANSPARENT, 25, 8, 0, chocola_ed_002_offset_mesh),
					GEO_ANIMATED_PART(LAYER_TRANSPARENT, 34, 8, 0, chocola_ed_003_offset_mesh),
					GEO_ANIMATED_PART(LAYER_OPAQUE, 4, 7, 38, NULL),
					GEO_OPEN_NODE(),
						GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
						GEO_OPEN_NODE(),
							GEO_ANIMATED_PART(LAYER_OPAQUE, 37, 0, 0, NULL),
							GEO_OPEN_NODE(),
								GEO_ANIMATED_PART(LAYER_TRANSPARENT, 9, -25, 3, chocola_ed_000_offset_006_mesh),
							GEO_CLOSE_NODE(),
						GEO_CLOSE_NODE(),
					GEO_CLOSE_NODE(),
					GEO_ANIMATED_PART(LAYER_OPAQUE, 4, 7, -38, NULL),
					GEO_OPEN_NODE(),
						GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
						GEO_OPEN_NODE(),
							GEO_ANIMATED_PART(LAYER_OPAQUE, 37, 0, 0, NULL),
							GEO_OPEN_NODE(),
								GEO_ANIMATED_PART(LAYER_TRANSPARENT, 9, -25, -3, chocola_ed_000_offset_009_mesh),
							GEO_CLOSE_NODE(),
						GEO_CLOSE_NODE(),
					GEO_CLOSE_NODE(),
					GEO_ANIMATED_PART(LAYER_OPAQUE, 61, -3, 52, NULL),
					GEO_OPEN_NODE(),
						GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
						GEO_OPEN_NODE(),
							GEO_ANIMATED_PART(LAYER_TRANSPARENT, 17, 0, 4, chocola_ed_000_offset_011_mesh),
						GEO_CLOSE_NODE(),
					GEO_CLOSE_NODE(),
					GEO_ANIMATED_PART(LAYER_OPAQUE, 61, -3, -52, NULL),
					GEO_OPEN_NODE(),
						GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
						GEO_OPEN_NODE(),
							GEO_ANIMATED_PART(LAYER_TRANSPARENT, 17, 0, -4, chocola_ed_000_offset_013_mesh),
						GEO_CLOSE_NODE(),
					GEO_CLOSE_NODE(),
				GEO_CLOSE_NODE(),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout chocola_ed_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_CULLING_RADIUS(1000),
		GEO_OPEN_NODE(),
			GEO_SHADOW(0, 150, 100),
			GEO_OPEN_NODE(),
				GEO_SCALE(LAYER_FORCE, 16384),
				GEO_OPEN_NODE(),
					GEO_ASM(10, geo_update_layer_transparency),
					GEO_SWITCH_CASE(2, geo_switch_anim_state),
					GEO_OPEN_NODE(),
						GEO_NODE_START(),
						GEO_OPEN_NODE(),
							GEO_NODE_START(),
							GEO_OPEN_NODE(),
								GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
								GEO_OPEN_NODE(),
									GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
									GEO_OPEN_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 83, 0, 0, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 126, -37, 0, chocola_ed_000_offset_003_mesh),
										GEO_CLOSE_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 25, 8, 0, chocola_ed_002_offset_mesh),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 34, 8, 0, chocola_ed_003_offset_mesh),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 4, 7, 38, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 37, 0, 0, NULL),
												GEO_OPEN_NODE(),
													GEO_ANIMATED_PART(LAYER_OPAQUE, 9, -25, 3, chocola_ed_000_offset_006_mesh),
												GEO_CLOSE_NODE(),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 4, 7, -38, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 37, 0, 0, NULL),
												GEO_OPEN_NODE(),
													GEO_ANIMATED_PART(LAYER_OPAQUE, 9, -25, -3, chocola_ed_000_offset_009_mesh),
												GEO_CLOSE_NODE(),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 61, -3, 52, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 17, 0, 4, chocola_ed_000_offset_011_mesh),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
										GEO_ANIMATED_PART(LAYER_OPAQUE, 61, -3, -52, NULL),
										GEO_OPEN_NODE(),
											GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
											GEO_OPEN_NODE(),
												GEO_ANIMATED_PART(LAYER_OPAQUE, 17, 0, -4, chocola_ed_000_offset_013_mesh),
											GEO_CLOSE_NODE(),
										GEO_CLOSE_NODE(),
									GEO_CLOSE_NODE(),
								GEO_CLOSE_NODE(),
							GEO_CLOSE_NODE(),
						GEO_CLOSE_NODE(),
						GEO_BRANCH(1, chocola_ed_001_switch_opt1),
					GEO_CLOSE_NODE(),
				GEO_CLOSE_NODE(),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, chocola_ed_material_revert_render_settings),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT, chocola_ed_material_revert_render_settings),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
