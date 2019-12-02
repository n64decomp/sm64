u8 *__osBbEepromAddress = * (u8**) 0x8000035C;
s32 i;

for (i = 0; i < 8; i++) {
    buffer[i] = __osBbEepromAddress[(address << 3) + i];
}

sp34 = 0;
