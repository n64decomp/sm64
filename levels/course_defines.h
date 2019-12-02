// Define lists for list of course for macros. Each of the following fields are described:
// Argument 1: Course macro for define.
// Argument 2, 3, 4, 5: Each hex digit is an index into D_8032E8A4 which is for a table of cutscene dance indexes. Defined by course index so we must define these.
DEFINE_COURSE(COURSE_BOB, 0x00, 0x20, 0x22, 0x04)            // (1)  Bob Omb Battlefield
DEFINE_COURSE(COURSE_WF,  0x00, 0x00, 0x02, 0x04)            // (2)  Whomp's Fortress
DEFINE_COURSE(COURSE_JRB, 0x22, 0x22, 0x22, 0x04)            // (3)  Jolly Rodger's Bay
DEFINE_COURSE(COURSE_CCM, 0x00, 0x22, 0x00, 0x04)            // (4)  Cool Cool Mountain
DEFINE_COURSE(COURSE_BBH, 0x22, 0x22, 0x22, 0x04)            // (5)  Big Boo's Haunt
DEFINE_COURSE(COURSE_HMC, 0x22, 0x22, 0x22, 0x04)            // (6)  Hazy Maze Cave
DEFINE_COURSE(COURSE_LLL, 0x12, 0x12, 0x12, 0x04)            // (7)  Lethal Lava Land
DEFINE_COURSE(COURSE_SSL, 0x02, 0x22, 0x22, 0x04)            // (8)  Shifting Sand Land
DEFINE_COURSE(COURSE_DDD, 0x22, 0x22, 0x22, 0x04)            // (9)  Dire Dire Docks
DEFINE_COURSE(COURSE_SL,  0x20, 0x20, 0x20, 0x04)            // (10) Snowman's Land
DEFINE_COURSE(COURSE_WDW, 0x22, 0x01, 0x22, 0x04)            // (11) Wet Dry World
DEFINE_COURSE(COURSE_TTM, 0x00, 0x00, 0x00, 0x04)            // (12) Tall Tall Mountain
DEFINE_COURSE(COURSE_THI, 0x11, 0x11, 0x12, 0x04)            // (13) Tiny Huge Island
DEFINE_COURSE(COURSE_TTC, 0x22, 0x22, 0x22, 0x04)            // (14) Tick Tock Clock
DEFINE_COURSE(COURSE_RR,  0x00, 0x00, 0x00, 0x04)            // (15) Rainbow Ride
DEFINE_COURSES_END()
DEFINE_BONUS_COURSE(COURSE_BITDW,    0x43, 0x44, 0x44, 0x04) // (16) Bowser in the Dark World
DEFINE_BONUS_COURSE(COURSE_BITFS,    0x43, 0x44, 0x44, 0x04) // (17) Bowser in the Fire Sea
DEFINE_BONUS_COURSE(COURSE_BITS,     0x43, 0x44, 0x44, 0x04) // (18) Bowser in the Sky
DEFINE_BONUS_COURSE(COURSE_PSS,      0x42, 0x44, 0x44, 0x04) // (19) Princess's Secret Slide
DEFINE_BONUS_COURSE(COURSE_COTMC,    0x44, 0x44, 0x44, 0x04) // (20) Cavern of the Metal Cap
DEFINE_BONUS_COURSE(COURSE_TOTWC,    0x40, 0x44, 0x44, 0x04) // (21) Tower of the Wing Cap
DEFINE_BONUS_COURSE(COURSE_VCUTM,    0x42, 0x44, 0x44, 0x04) // (22) Vanish Cap Under the Moat
DEFINE_BONUS_COURSE(COURSE_WMOTR,    0x40, 0x44, 0x44, 0x04) // (23) Winged Mario over the Rainbow
DEFINE_BONUS_COURSE(COURSE_SA,       0x42, 0x44, 0x44, 0x04) // (24) Secret Aquarium
DEFINE_BONUS_COURSE(COURSE_CAKE_END, 0x44, 0x44, 0x44, 0x04) // (25) The End (Cake Scene)
