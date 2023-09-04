void foo(void) { "abcdef"; }

GLOBAL_ASM(
.rdata
    .ascii "AB"
    .ascii "CD", "EF"
    .ascii "GH\n\n\n\0\11\222\3333\44444\x1234567\n\nIJK"
)

void bar(void) { "hello"; }

GLOBAL_ASM(
.rdata
    .asciiz "12"
    .asciiz "34", "56"
    .asciiz "78\n\n\n\0\11\222\3333\44444\x1234567\n\n9A"
)

void baz(void) { "ghijkl"; }
