#include "src/game/envfx_snow.h"

const GeoLayout warp_pipe_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_CULLING_RADIUS(350),
		GEO_OPEN_NODE(),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, warp_pipe_000_displaylist_mesh),
		GEO_CLOSE_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, warp_pipe_material_revert_render_settings),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
