.set noat
.set noreorder // don't insert nops after branches

#include "macros.inc"

.macro def label, num
    glabel \label
        li    $v0, \num
        lui   $t0, (0xA4300014 >> 16)
        ori   $t0, (0xA4300014 & 0xFFFF)
        lw    $t1, ($t0) // traps the iQue OS and performs the function
        nop
        jr $ra
         nop
.endm


.section .text, "ax"

def skGetId, 0x0
def skLaunchSetup, 0x1
def skLaunch, 0x2
def skRecryptListValid, 0x3
def skRecryptBegin, 0x4
def skRecryptData, 0x5
def skRecryptComputeState, 0x6
def skRecryptEnd, 0x7
def skSignHash, 0x8
def skVerifyHash, 0x9
def skGetConsumption, 0xa
def skAdvanceTicketWindow, 0xb
def skSetLimit, 0xc
def skExit, 0xd
def skKeepAlive, 0xe

// developer calls
def sk0f, 0x0f
def sk10, 0x10
def sk11, 0x11
def sk12, 0x12
def sk13, 0x13
def sk14, 0x14
