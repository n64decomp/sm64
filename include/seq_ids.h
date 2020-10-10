#ifndef SEQ_IDS_H
#define SEQ_IDS_H

#define SEQ_VARIATION 0x80

enum SeqId {
    SEQ_SOUND_PLAYER,                 // 0x00
    SEQ_EVENT_CUTSCENE_COLLECT_STAR,  // 0x01 NEWTTC
    SEQ_MENU_TITLE_SCREEN,            // 0x02 NEWTITLE/PSS (midi)
    SEQ_LEVEL_GRASS,                  // 0x03 NEWDDD
    SEQ_LEVEL_INSIDE_CASTLE,          // 0x04 EGGMANSTAGE2
    SEQ_LEVEL_WATER,                  // 0x05 EGGMAN2
    SEQ_LEVEL_HOT,                    // 0x06 NEWWDW
    SEQ_LEVEL_BOSS_KOOPA,             // 0x07 NEWSM
    SEQ_LEVEL_SNOW,                   // 0x08 NEWSM2
    SEQ_LEVEL_SLIDE,                  // 0x09 NEWTTM
    SEQ_LEVEL_SPOOKY,                 // 0x0A NEWTTM2
    SEQ_EVENT_PIRANHA_PLANT,          // 0x0B
    SEQ_LEVEL_UNDERGROUND,            // 0x0C NEWTHI
    SEQ_MENU_STAR_SELECT,             // 0x0D º
    SEQ_EVENT_POWERUP,                // 0x0E [ALREADY CHANGED] (midi)
    SEQ_EVENT_METAL_CAP,              // 0x0F [CHANGED]
    SEQ_EVENT_KOOPA_MESSAGE,          // 0x10
    SEQ_LEVEL_KOOPA_ROAD,             // 0x11 NEWTHI2
    SEQ_EVENT_HIGH_SCORE,             // 0x12
    SEQ_EVENT_MERRY_GO_ROUND,         // 0x13 NEWRR
    SEQ_EVENT_RACE,                   // 0x14
    SEQ_EVENT_CUTSCENE_STAR_SPAWN,    // 0x15
    SEQ_EVENT_BOSS,                   // 0x16 NEWBOSS
    SEQ_EVENT_CUTSCENE_COLLECT_KEY,   // 0x17
    SEQ_EVENT_ENDLESS_STAIRS,         // 0x18 
    SEQ_LEVEL_BOSS_KOOPA_FINAL,       // 0x19 EGGMANSTAGE3
    SEQ_EVENT_CUTSCENE_CREDITS,       // 0x1A EGGMAN3
    SEQ_EVENT_SOLVE_PUZZLE,           // 0x1B
    SEQ_EVENT_TOAD_MESSAGE,           // 0x1C
    SEQ_EVENT_PEACH_MESSAGE,          // 0x1D
    SEQ_EVENT_CUTSCENE_INTRO,         // 0x1E
    SEQ_EVENT_CUTSCENE_VICTORY,       // 0x1F
    SEQ_EVENT_CUTSCENE_ENDING,        // 0x20
    SEQ_MENU_FILE_SELECT,             // 0x21 NEWFILE (midi)
    SEQ_EVENT_CUTSCENE_LAKITU,        // 0x22 (not in JP)
    SEQ_STREAMED_HEROGARDEN,
    SEQ_STREAMED_EGGMANSTAGE1,
    SEQ_STREAMED_EGGMAN1,
    SEQ_STREAMED_NEWSTARGET,
    SEQ_STREAMED_NEWCREDITS,
    SEQ_STREAMED_NEWBOB,
    SEQ_STREAMED_NEWWF,
    SEQ_STREAMED_NEWJRB,
    SEQ_STREAMED_NEWCCM,
    SEQ_STREAMED_NEWBBH,
    SEQ_STREAMED_NEWBBH2,
    SEQ_STREAMED_NEWHMC,
    SEQ_STREAMED_NEWLLL,
    SEQ_STREAMED_NEWLLL2,
    SEQ_STREAMED_NEWSSL,
    SEQ_STREAMED_NEWSSL2,
    SEQ_COUNT
};

#endif
