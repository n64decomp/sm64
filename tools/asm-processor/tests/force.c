// COMPILE-FLAGS: -O2
// ASMP-FLAGS: --convert-statics=global-with-filename --force
static int xtext(int a, int b, int c);
const int rodata1[] = {1};
static const int rodata2[] = {2};
int data1[] = {3};
static int data2[] = {4};
int bss1;
static int bss2;

static int xtext(int a, int b, int c) {
    return 1;
}

void baz(void) {
    xtext(bss2, rodata2[0], data2[0]);
}
