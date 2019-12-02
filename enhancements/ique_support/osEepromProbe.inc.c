s32 __osBbEepromSize = * (s32*) 0x80000360;

if (__osBbEepromSize == 0x200) {
    status = 1;
}

if (__osBbEepromSize == 0x800) {
    status = 2;
}
