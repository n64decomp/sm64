#ifndef IOS_GAME_H
#define IOS_GAME_H
// Entry points implemented by src/pc/pc_main.c under IOS_BUILD.
// ios_game_init runs pools/config/gfx/audio/thread setup and returns;
// the display-link pump then calls produce_one_frame once per tick.
void ios_game_init(void);
void produce_one_frame(void);
#endif
