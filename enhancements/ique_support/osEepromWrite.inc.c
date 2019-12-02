u8 *__osBbEepromAddress = * (u8**) 0x8000035C;
s32 i;

for (i = 0; i < 8; i++) {
    __osBbEepromAddress[(address << 3) + i] = buffer[i];
}

sp34 = 0;
