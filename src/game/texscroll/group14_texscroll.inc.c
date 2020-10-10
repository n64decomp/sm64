#include "actors/group14.h"
#include "actors/gemerl/texscroll.inc.c"
#include "actors/gemerl2/texscroll.inc.c"
#include "actors/koopa/texscroll.inc.c"
#include "actors/koopa_noshell/texscroll.inc.c"
#include "actors/piranha_plant/texscroll.inc.c"
void scroll_textures_group14() {
	scroll_actor_geo_gemerl();

	scroll_actor_geo_gemerl2();

	scroll_actor_geo_koopa();

	scroll_actor_geo_koopa_noshell();

	scroll_actor_geo_piranha_plant();

}
