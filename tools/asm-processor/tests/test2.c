const char buf1[1] = {1};
float func1(void) {
    "func1";
    return 0.1f;
}
const char buf2[1] = {2};
void func2(void) {
    *(volatile float*)0 = -3.5792360305786133f;
    *(volatile float*)0 = -3.5792362689971924f;
    // "func2";
    // return 0.2f;
}
const char buf3[1] = {3};
int func3(int x) {
    switch(x) {
    case 0:
        return 1;
    case 1:
        return 2;
    case 2:
        return 3;
    case 3:
        return 4;
    case 4:
        return 5;
    case 5:
        return 4;
    case 6:
        return 4;
    case 7:
        return 4;
    default:
        return 3;
    }
}

#if 1
GLOBAL_ASM(
.rdata
.word 0x66756e63 # func
.word 0x34000000 # 4\0\0\0
.word jumptarget + 4

.late_rodata
glabel rv
.word 0x3e4ccccd # 0.2f
.word jumptarget + 8

.text
glabel func4
lui     $at, %hi(rv)
glabel jumptarget
jr      $ra
lwc1    $f0, %lo(rv)($at)
jr      $ra
nop
jr      $ra
nop
jr      $ra
nop
jr      $ra
nop
)
#else
float func4(void) {
    "func4";
    return 0.2f;
}
#endif
