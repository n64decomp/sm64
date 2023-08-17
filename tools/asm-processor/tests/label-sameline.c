GLOBAL_ASM(
.rdata
.word 0x12345678
glabel blah
.word blah2
 /*a*/ blah2: /*b*/ .word blah /*c*/
)
