const char before[] = "^";
GLOBAL_ASM(
.rdata
.asciz "aaaa /* bbbb */ # cccc", /**//**//**//**/ /*/ "xxxx" /*/ /* dddd " eeee */ "# ffff" # gggg "hhhh" /* iiii */
)
const char after[] = "$";
