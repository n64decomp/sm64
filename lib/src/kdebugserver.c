#include "libultra_internal.h"
#include "PR/rdb.h"

#ifndef VERSION_CN
static s32 debugState = 0;
static s32 numChars = 0;
static s32 numCharsToReceive = 0;
#endif

extern u8 debugBuffer[0x100];

OSThread __osThreadSave;

#ifndef VERSION_CN
void u32_to_string(u32 i, u8 *str) {
    str[0] = (i >> 0x18) & 0xff;
    str[1] = (i >> 0x10) & 0xff;
    str[2] = (i >> 0x8) & 0xff;
    str[3] = i & 0xff;
}

u32 string_to_u32(u8 *str) {
    u32 i;
    i = (str[0] & 0xff) << 0x18;
    i |= (str[1] & 0xff) << 0x10;
    i |= (str[2] & 0xff) << 0x8;
    i |= (str[3] & 0xff);
    return i;
}

void send_packet(u8 *a0, s32 a1) {
    rdbPacket pkt;
    s32 i;
    pkt.type = 2;
    for (pkt.length = a1, i = 0; i < a1; i++) {
        pkt.buf[i] = a0[i];
    }
    *(volatile u32 *) RDB_BASE_REG = *(u32 *) &pkt;
    while (!(__osGetCause() & 0x2000)) {
        ;
    }
    *(volatile u32 *) RDB_READ_INTR_REG = 0;
}

void send(u8 *buff, s32 len) {
    s32 i;
    s32 end;
    s32 rem;
    if (!__osRdbWriteOK) {
        while (!(__osGetCause() & 0x2000)) {
            ;
        }
        *(volatile u32 *) RDB_READ_INTR_REG = 0;
        __osRdbWriteOK = 1;
    }
    i = 0;
    rem = len % 3;
    end = len - rem;
    for (; i < end; i += 3) {
        send_packet(&buff[i], 3);
    }
    if (rem > 0) {
        send_packet(&buff[end], rem);
    }
}

void process_command_memory(void) {
    u32 sp1c;
    u32 sp18;
    sp1c = string_to_u32(&debugBuffer[1]);
    sp18 = string_to_u32(&debugBuffer[5]);
    send((u8 *) (uintptr_t) sp1c, sp18);
}

void process_command_register(void) {
    send((u8 *) &__osThreadSave.context, sizeof(__OSThreadContext));
}

void kdebugserver(u32 a0) {
    u32 sp2c;
    rdbPacket pkt;
    *(u32 *) &pkt = a0;
    for (sp2c = 0; sp2c < pkt.length; sp2c++) {
        debugBuffer[numChars] = pkt.buf[sp2c];
        numChars++;
    }
    numCharsToReceive -= pkt.length;
    switch (debugState) {
        case 0:
            switch (pkt.buf[0]) {
                case 1:
                    debugState = 1;
                    numCharsToReceive = 9 - pkt.length;
                    break;
                case 2:
                    process_command_register();
                    debugState = 0;
                    numChars = 0;
                    numCharsToReceive = 0;
                    break;
                default:
                    debugState = 0;
                    numChars = 0;
                    numCharsToReceive = 0;
                    break;
            }
            break;
        case 1:
            if (numCharsToReceive <= 0) {
                if (debugBuffer[0] == 1) {
                    process_command_memory();
                    debugState = 0;
                    numChars = 0;
                    numCharsToReceive = 0;
                } else {
                    debugState = 0;
                    numChars = 0;
                    numCharsToReceive = 0;
                }
            }
            break;
        default:
            debugState = 0;
            numChars = 0;
            numCharsToReceive = 0;
            break;
    }
}
#endif
