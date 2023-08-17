// == debug table ==

#ifndef VERSION_EU

// (this wasn't translated for US, and was removed in EU)

static const u8 Debug0[] = {
    _("ＳＴＡＧＥ　ＳＥＬＥＣＴ\n"
      "　つづける？\n"
      "　１　マウンテン\n"
      "　２　ファイアーバブル\n"
      "　３　スノースライダー\n"
      "　４　ウォーターランド\n"
      "　　　クッパ１ごう\n"
      "　もどる")
};

static const u8 Debug1[] = {
    _("ＰＡＵＳＥ　　　　\n"
      "　つづける？\n"
      "　やめる　？")
};

static const struct DialogEntry debug_text_entry_0 = {
    1, 8, 30, 200, Debug0
};

static const struct DialogEntry debug_text_entry_1 = {
    1, 3, 100, 150, Debug1
};

const struct DialogEntry *const seg2_debug_text_table[] = {
    &debug_text_entry_0, &debug_text_entry_1, NULL,
};

#endif
