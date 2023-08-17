// COMPILE-FLAGS: -O1 -KPIC
GLOBAL_ASM(
glabel foo
addiu $a0, $a0, 1
addiu $a0, $a0, 2
addiu $a0, $a0, 3
addiu $a0, $a0, 4
addiu $a0, $a0, 5
addiu $a0, $a0, 6
addiu $a0, $a0, 7
addiu $a0, $a0, 8
addiu $a0, $a0, 9
addiu $a0, $a0, 10
addiu $a0, $a0, 11
addiu $a0, $a0, 12
)
GLOBAL_ASM(
.late_rodata
.float 1
.text
glabel float_fn
addiu $a0, $a0, 13
addiu $a0, $a0, 14
addiu $a0, $a0, 15
addiu $a0, $a0, 16
addiu $a0, $a0, 17
addiu $a0, $a0, 18
addiu $a0, $a0, 19
addiu $a0, $a0, 20
addiu $a0, $a0, 21
addiu $a0, $a0, 22
addiu $a0, $a0, 23
addiu $a0, $a0, 24
addiu $a0, $a0, 25
addiu $a0, $a0, 26
addiu $a0, $a0, 27
addiu $a0, $a0, 28
addiu $a0, $a0, 29
addiu $a0, $a0, 30
)
GLOBAL_ASM(
.late_rodata
.late_rodata_alignment 4
.float 2
.double 1
.double 2
.double 3
.double 4
.double 5
.double 6
.double 7
.double 8
.text
glabel doubles
addiu $a0, $a0, 31
addiu $a0, $a0, 32
addiu $a0, $a0, 33
addiu $a0, $a0, 34
addiu $a0, $a0, 35
addiu $a0, $a0, 36
addiu $a0, $a0, 37
addiu $a0, $a0, 38
addiu $a0, $a0, 39
addiu $a0, $a0, 40
addiu $a0, $a0, 41
addiu $a0, $a0, 42
addiu $a0, $a0, 43
addiu $a0, $a0, 44
addiu $a0, $a0, 45
addiu $a0, $a0, 46
addiu $a0, $a0, 47
addiu $a0, $a0, 48
addiu $a0, $a0, 49
addiu $a0, $a0, 50
addiu $a0, $a0, 51
addiu $a0, $a0, 52
addiu $a0, $a0, 53
addiu $a0, $a0, 54
addiu $a0, $a0, 55
addiu $a0, $a0, 56
addiu $a0, $a0, 57
addiu $a0, $a0, 58
addiu $a0, $a0, 59
addiu $a0, $a0, 60
addiu $a0, $a0, 61
addiu $a0, $a0, 62
addiu $a0, $a0, 63
addiu $a0, $a0, 64
addiu $a0, $a0, 65
addiu $a0, $a0, 66
addiu $a0, $a0, 67
addiu $a0, $a0, 68
)
