#include "actors/group0.h"
#include "actors/mario/texscroll.inc.c"
#include "actors/cheese_follow/texscroll.inc.c"
#include "actors/mariofly/texscroll.inc.c"
void scroll_textures_group0() {
	scroll_actor_geo_mario();

	scroll_actor_geo_cheese_follow();

	scroll_actor_geo_mariofly();

}
