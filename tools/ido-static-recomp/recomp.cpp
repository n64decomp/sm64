#include <cassert>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <cinttypes>
#include <unistd.h>

#include <map>
#include <set>
#include <vector>
#include <string>
#include <string_view>

#include "rabbitizer.hpp"
#include "rabbitizer.h"

#include "elf.h"

#if defined(_WIN32) && !defined(__CYGWIN__)
#include <windows.h>
#endif /* _WIN32 && !__CYGWIN__ */

#if !defined(_MSC_VER) && !defined(__CYGWIN__) && !defined(_WIN32)
#define UNIX_PLATFORM
#endif

#ifdef UNIX_PLATFORM
// TODO: determine if any of those headers are not required
#include <csignal>
#include <ctime>
#include <cxxabi.h> // for __cxa_demangle
#include <dlfcn.h>  // for dladdr
#include <execinfo.h>
#include <unistd.h>
#endif

#ifndef FULL_TRACEBACK
// Change to non-zero to have full traceback, including names not exported
#define FULL_TRACEBACK 0
#endif

// set this to 1 when testing a new program, to verify that no false function pointers are found
#define INSPECT_FUNCTION_POINTERS 0

#ifndef TRACE
#define TRACE 0
#endif

#define LABELS_64_BIT 1

#ifndef DUMP_INSTRUCTIONS
// Set to non-zero to dump actual disassembly when dumping C code
#define DUMP_INSTRUCTIONS 0
#endif

#define u32be(x) (uint32_t)(((x & 0xff) << 24) + ((x & 0xff00) << 8) + ((x & 0xff0000) >> 8) + ((uint32_t)(x) >> 24))
#define u16be(x) (uint16_t)(((x & 0xff) << 8) + ((x & 0xff00) >> 8))
#define read_u32_be(buf) (uint32_t)(((buf)[0] << 24) + ((buf)[1] << 16) + ((buf)[2] << 8) + ((buf)[3]))

#define UniqueId_cpu_li rabbitizer::InstrId::UniqueId::cpu_USERDEF_00
#define UniqueId_cpu_la rabbitizer::InstrId::UniqueId::cpu_USERDEF_01

using namespace std;

struct Edge {
    uint32_t i;
    uint8_t function_entry : 1;
    uint8_t function_exit : 1;
    uint8_t extern_function : 1;
    uint8_t function_pointer : 1;
};

struct Insn {
    // base instruction
    rabbitizer::InstructionCpu instruction;

    //
    bool is_global_got_memop;
    bool no_following_successor;

    // patching instructions
    bool patched;
    // lui pairs
    uint32_t patched_addr;
    // immediates are 16 bits wide, but they can be either signed or unsigned
    // a 32 bits signed member can hold all those possible values
    int32_t patched_imms;
    rabbitizer::Registers::Cpu::GprO32 lila_dst_reg;
    int linked_insn;
    union {
        uint32_t linked_value;
        float linked_float;
    };

    // jumptable instructions
    uint32_t jtbl_addr;
    uint32_t num_cases;
    rabbitizer::Registers::Cpu::GprO32 index_reg;

    // graph
    vector<Edge> successors;
    vector<Edge> predecessors;
    uint64_t b_liveout;
    uint64_t b_livein;
    uint64_t f_livein;
    uint64_t f_liveout;

    Insn(uint32_t word, uint32_t vram) : instruction(word, vram) {
        this->is_global_got_memop = false;
        this->no_following_successor = false;

        this->patched = false;
        this->patched_addr = 0;
        this->patched_imms = 0;
        this->lila_dst_reg = rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero;
        this->linked_insn = -1;
        this->linked_value = 0;

        this->jtbl_addr = 0;
        this->num_cases = 0;
        this->index_reg = rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero;

        this->b_liveout = 0;
        this->b_livein = 0;
        this->f_livein = 0;
        this->f_liveout = 0;
    }

    void patchInstruction(rabbitizer::InstrId::UniqueId instructionId) {
        this->patched = true;
        RabbitizerInstruction* innerInstr = this->instruction.getCPtr();
        innerInstr->uniqueId = (RabbitizerInstrId)(instructionId);
        innerInstr->descriptor = &RabbitizerInstrDescriptor_Descriptors[innerInstr->uniqueId];
    }

    void patchAddress(rabbitizer::InstrId::UniqueId instructionId, uint32_t newAddress) {
        this->patchInstruction(instructionId);
        this->patched_addr = newAddress;
    }

    uint32_t getAddress() const {
        if (this->patched && this->patched_addr != 0) {
            return this->patched_addr;
        }

        if (this->instruction.hasOperandAlias(rabbitizer::OperandType::cpu_label)) {
            return this->instruction.getInstrIndexAsVram();
        }

        if (this->instruction.isBranch()) {
            return this->instruction.getVram() + this->instruction.getBranchOffset();
        }

        assert(!"unreachable code");
    }

    void patchImmediate(int32_t newImmediate) {
        this->patched = true;
        this->patched_imms = newImmediate;
    }

    int32_t getImmediate() const {
        if (this->patched) {
            return this->patched_imms;
        }

        return this->instruction.getProcessedImmediate();
    }

    std::string disassemble() const {
        char buffer[0x1000];
        int32_t imm;

        switch (this->instruction.getUniqueId()) {
            case UniqueId_cpu_li:
                imm = this->getImmediate();
                if (imm >= 0) {
                    sprintf(buffer, "li          %s, 0x%X", RabbitizerRegister_getNameGpr((int)this->lila_dst_reg),
                            imm);
                } else {
                    sprintf(buffer, "li          %s, %i", RabbitizerRegister_getNameGpr((int)this->lila_dst_reg), imm);
                }
                return buffer;

            case UniqueId_cpu_la:
                sprintf(buffer, "la          %s, 0x%X", RabbitizerRegister_getNameGpr((int)this->lila_dst_reg),
                        this->getAddress());
                return buffer;

            default:
                return this->instruction.disassembleInstruction(0);
        }
    }
};

struct Function {
    vector<uint32_t> returns; // points to delay slots
    uint32_t end_addr;        // address after end
    uint32_t nargs;
    uint32_t nret;
    bool v0_in;
    bool referenced_by_function_pointer;
};

bool conservative;

const uint8_t* text_section;
uint32_t text_section_len;
uint32_t text_vaddr;

const uint8_t* rodata_section;
uint32_t rodata_section_len;
uint32_t rodata_vaddr;

const uint8_t* data_section;
uint32_t data_section_len;
uint32_t data_vaddr;

uint32_t bss_section_len;
uint32_t bss_vaddr;

vector<Insn> insns;
set<uint32_t> label_addresses;
vector<uint32_t> got_globals;
vector<uint32_t> got_locals;
uint32_t gp_value;
uint32_t gp_value_adj;

map<uint32_t, string> symbol_names;

vector<pair<uint32_t, uint32_t>> data_function_pointers;
set<uint32_t> la_function_pointers;
map<uint32_t, Function> functions;
uint32_t main_addr;
uint32_t mcount_addr;
uint32_t procedure_table_start;
uint32_t procedure_table_len;

#define FLAG_NO_MEM 1
#define FLAG_VARARG 2

/**
 * Struct containing information on external functions that are called using the wrappers in `libc_impl.c`.
 *
 * name:    function name
 * params:  first char is return type, subsequent chars are argument types. Key to chars used:
 *          - 'v' void
 *          - 'i' signed int (int32_t)
 *          - 'u' unsigned int (uint32_t)
 *          - 'p' pointer (uintptr_t)
 *          - 'f' float
 *          - 'd' double
 *          - 'l' signed long long (int64_t)
 *          - 'j' unsigned long long (uint64_t)
 *          - 't' trampoline
 *
 * flags:   use defines above
 */
const struct ExternFunction {
    const char* name;
    const char* params;
    int flags;
} extern_functions[] = {
    { "exit", "vi", 0 }, // override exit from application
    { "abort", "v", 0 },
    { "sbrk", "pi", 0 },
    { "malloc", "pu", 0 },
    { "calloc", "puu", 0 },
    { "realloc", "ppu", 0 },
    { "free", "vp", 0 },
    { "fscanf", "ipp", FLAG_VARARG },
    { "printf", "ip", FLAG_VARARG },
    { "sprintf", "ipp", FLAG_VARARG },
    { "fprintf", "ipp", FLAG_VARARG },
    { "_doprnt", "ippp", 0 },
    { "strlen", "up", 0 },
    { "open", "ipii", 0 },
    { "creat", "ipi", 0 },
    { "access", "ipi", 0 },
    { "rename", "ipp", 0 },
    { "utime", "ipp", 0 },
    { "flock", "iii", 0 },
    { "chmod", "ipu", 0 },
    { "umask", "ii", FLAG_NO_MEM },
    { "ecvt", "pdipp", 0 },
    { "fcvt", "pdipp", 0 },
    { "sqrt", "dd", FLAG_NO_MEM },
    { "sqrtf", "ff", FLAG_NO_MEM },
    { "atoi", "ip", 0 },
    { "atol", "ip", 0 },
    { "atof", "dp", 0 },
    { "strtol", "ippi", 0 },
    { "strtoul", "uppi", 0 },
    { "strtoll", "lppi", 0 },
    { "strtoull", "jppi", 0 },
    { "strtod", "dpp", 0 },
    { "strchr", "ppi", 0 },
    { "strrchr", "ppi", 0 },
    { "strcspn", "upp", 0 },
    { "strpbrk", "ppp", 0 },
    { "fstat", "iip", 0 },
    { "stat", "ipp", 0 },
    { "ftruncate", "iii", 0 },
    { "truncate", "ipi", 0},
    { "bcopy", "vppu", 0 },
    { "memcpy", "pppu", 0 },
    { "memccpy", "pppiu", 0 },
    { "read", "iipu", 0 },
    { "write", "iipu", 0 },
    { "fopen", "ppp", 0 },
    { "freopen", "pppp", 0 },
    { "fclose", "ip", 0 },
    { "ftell", "ip", 0 },
    { "rewind", "vp", 0 },
    { "fseek", "ipii", 0 },
    { "lseek", "iiii", 0 },
    { "fflush", "ip", 0 },
    { "fchown", "iiii", 0 },
    { "dup", "ii", 0 },
    { "dup2", "iii", 0 },
    { "pipe", "ip", 0 },
    { "perror", "vp", 0 },
    { "fdopen", "iip", 0 },
    { "memset", "ppiu", 0 },
    { "bcmp", "ippu", 0 },
    { "memcmp", "ippu", 0 },
    { "getpid", "i", FLAG_NO_MEM },
    { "getpgrp", "i", 0 },
    { "remove", "ip", 0 },
    { "unlink", "ip", 0 },
    { "close", "ii", 0 },
    { "strcmp", "ipp", 0 },
    { "strncmp", "ippu", 0 },
    { "strcpy", "ppp", 0 },
    { "strncpy", "pppu", 0 },
    { "strcat", "ppp", 0 },
    { "strncat", "pppu", 0 },
    { "strtok", "ppp", 0 },
    { "strstr", "ppp", 0 },
    { "strdup", "pp", 0 },
    { "toupper", "ii", FLAG_NO_MEM },
    { "tolower", "ii", FLAG_NO_MEM },
    { "gethostname", "ipu", 0 },
    { "isatty", "ii", 0 },
    { "strftime", "upupp", 0 },
    { "times", "ip", 0 },
    { "clock", "i", FLAG_NO_MEM },
    { "ctime", "pp", 0 },
    { "localtime", "pp", 0 },
    { "setvbuf", "ippiu", 0 },
    { "__semgetc", "ip", 0 },
    { "__semputc", "iip", 0 },
    { "fgetc", "ip", 0 },
    { "fgets", "ipip", 0 },
    { "__filbuf", "ip", 0 },
    { "__flsbuf", "iip", 0 },
    { "ungetc", "iip", 0 },
    { "gets", "pp", 0 },
    { "fread", "upuup", 0 },
    { "fwrite", "upuup", 0 },
    { "fputs", "ipp", 0 },
    { "puts", "ip", 0 },
    { "getcwd", "ppu", 0 },
    { "time", "ip", 0 },
    { "bzero", "vpu", 0 },
    { "fp_class_d", "id", FLAG_NO_MEM },
    { "ldexp", "ddi", FLAG_NO_MEM },
    { "__ll_mul", "lll", FLAG_NO_MEM },
    { "__ll_div", "lll", FLAG_NO_MEM },
    { "__ll_rem", "ljl", FLAG_NO_MEM },
    { "__ll_lshift", "llj", FLAG_NO_MEM },
    { "__ll_rshift", "llj", FLAG_NO_MEM },
    { "__ull_div", "jjj", FLAG_NO_MEM },
    { "__ull_rem", "jjj", FLAG_NO_MEM },
    { "__ull_rshift", "jjj", FLAG_NO_MEM },
    { "__d_to_ull", "jd", FLAG_NO_MEM },
    { "__d_to_ll", "ld", FLAG_NO_MEM },
    { "__f_to_ull", "jf", FLAG_NO_MEM },
    { "__f_to_ll", "lf", FLAG_NO_MEM },
    { "__ull_to_f", "fj", FLAG_NO_MEM },
    { "__ll_to_f", "fl", FLAG_NO_MEM },
    { "__ull_to_d", "dj", FLAG_NO_MEM },
    { "__ll_to_d", "dl", FLAG_NO_MEM },
    { "_exit", "vi", 0 },
    { "_cleanup", "v", 0 },
    { "_rld_new_interface", "pu", FLAG_VARARG },
    { "_exithandle", "v", 0 },
    { "_prctl", "ii", FLAG_VARARG },
    { "_atod", "dpii", 0 },
    { "pathconf", "ipi", 0 },
    { "getenv", "pp", 0 },
    { "gettxt", "ppp", 0 },
    { "setlocale", "pip", 0 },
    { "mmap", "ppuiiii", 0 },
    { "munmap", "ipu", 0 },
    { "mprotect", "ipui", 0 },
    { "sysconf", "ii", 0 },
    { "getpagesize", "i", 0 },
    { "strerror", "pi", 0 },
    { "ioctl", "iiu", FLAG_VARARG },
    { "fcntl", "iii", FLAG_VARARG },
    { "signal", "pit", 0 },
    { "sigset", "pit", 0 },
    { "get_fpc_csr", "i", 0 },
    { "set_fpc_csr", "ii", 0 },
    { "setjmp", "ip", 0 },
    { "longjmp", "vpi", 0 },
    { "tempnam", "ppp", 0 },
    { "tmpnam", "pp", 0 },
    { "mktemp", "pp", 0 },
    { "mkstemp", "ip", 0 },
    { "tmpfile", "p", 0 },
    { "wait", "ip", 0 },
    { "kill", "iii", 0 },
    { "execlp", "ip", FLAG_VARARG },
    { "execv", "ipp", 0 },
    { "execvp", "ipp", 0 },
    { "fork", "i", 0 },
    { "system", "ip", 0 },
    { "tsearch", "pppp", 0 },
    { "tfind", "pppp", 0 },
    { "qsort", "vpuut", 0 },
    { "regcmp", "pp", FLAG_VARARG },
    { "regex", "ppp", FLAG_VARARG },
    { "__assert", "vppi", 0 },
};

void disassemble(void) {
    uint32_t i;

    RabbitizerConfig_Cfg.misc.omit0XOnSmallImm = true;
    RabbitizerConfig_Cfg.misc.opcodeLJust -= 8;
    RabbitizerConfig_Cfg.misc.upperCaseImm = false;
    insns.reserve(1 + text_section_len / sizeof(uint32_t)); // +1 for dummy instruction

    for (i = 0; i < text_section_len; i += sizeof(uint32_t)) {
        uint32_t word = read_u32_be(&text_section[i]);
        Insn insn(word, text_vaddr + i);
        insns.push_back(insn);
    }

    {
        // Add dummy NOP instruction to avoid out of bounds
        Insn insn(0x00000000, text_vaddr + i);
        insn.no_following_successor = true;
        insns.push_back(insn);
    }
}

void add_function(uint32_t addr) {
    if (addr >= text_vaddr && addr < text_vaddr + text_section_len) {
        functions[addr];
    }
}

map<uint32_t, Function>::iterator find_function(uint32_t addr) {
    if (functions.size() == 0) {
        return functions.end();
    }

    auto it = functions.upper_bound(addr);

    if (it == functions.begin()) {
        return functions.end();
    }

    --it;
    return it;
}

rabbitizer::Registers::Cpu::GprO32 get_dest_reg(const Insn& insn) {
    switch (insn.instruction.getUniqueId()) {
        case rabbitizer::InstrId::UniqueId::cpu_jalr:
            // jalr technically modifies rd, so an empty case is here to avoid crashing
            break;

        case UniqueId_cpu_li:
        case UniqueId_cpu_la:
            return insn.lila_dst_reg;

        default:
            if (insn.instruction.modifiesRt()) {
                return insn.instruction.GetO32_rt();
            } else if (insn.instruction.modifiesRd()) {
                return insn.instruction.GetO32_rd();
            }
            break;
    }

    return rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero;
}

// try to find a matching LUI for a given register
void link_with_lui(int offset, rabbitizer::Registers::Cpu::GprO32 reg, int mem_imm) {
#define MAX_LOOKBACK 128
    // don't attempt to compute addresses for zero offset
    // end search after some sane max number of instructions
    int end_search = std::max(0, offset - MAX_LOOKBACK);

    for (int search = offset - 1; search >= end_search; search--) {
        switch (insns[search].instruction.getUniqueId()) {
            case rabbitizer::InstrId::UniqueId::cpu_lui:
                if (reg == insns[search].instruction.GetO32_rt()) {
                    goto loop_end;
                }
                continue;

            case rabbitizer::InstrId::UniqueId::cpu_lw:
            case rabbitizer::InstrId::UniqueId::cpu_ld:
            case rabbitizer::InstrId::UniqueId::cpu_addiu:
            case rabbitizer::InstrId::UniqueId::cpu_add:
            case rabbitizer::InstrId::UniqueId::cpu_sub:
            case rabbitizer::InstrId::UniqueId::cpu_subu:
                if (reg == get_dest_reg(insns[search])) {
                    if ((insns[search].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_lw) &&
                        insns[search].instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_gp) {
                        int mem_imm0 = insns[search].instruction.getProcessedImmediate();
                        uint32_t got_entry = (mem_imm0 + gp_value_adj) / sizeof(uint32_t);

                        if (got_entry < got_locals.size()) {
                            // used for static functions
                            uint32_t addr = got_locals[got_entry] + mem_imm;
                            insns[search].linked_insn = offset;
                            insns[search].linked_value = addr;
                            insns[offset].linked_insn = search;
                            insns[offset].linked_value = addr;

                            // Patch instruction to contain full address
                            insns[search].lila_dst_reg = get_dest_reg(insns[search]);
                            insns[search].patchAddress(UniqueId_cpu_la, addr);

                            // Patch instruction to have offset 0
                            switch (insns[offset].instruction.getUniqueId()) {
                                case rabbitizer::InstrId::UniqueId::cpu_addiu: {
                                    rabbitizer::Registers::Cpu::GprO32 dst_reg = insns[offset].instruction.GetO32_rt();
                                    insns[offset].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_move);
                                    // Patch the destination register too
                                    insns[offset].instruction.Set_rd(dst_reg);
                                }

                                    if (addr >= text_vaddr && addr < text_vaddr + text_section_len) {
                                        add_function(addr);
                                    }
                                    goto loop_end;

                                case rabbitizer::InstrId::UniqueId::cpu_lb:
                                case rabbitizer::InstrId::UniqueId::cpu_lbu:
                                case rabbitizer::InstrId::UniqueId::cpu_sb:
                                case rabbitizer::InstrId::UniqueId::cpu_lh:
                                case rabbitizer::InstrId::UniqueId::cpu_lhu:
                                case rabbitizer::InstrId::UniqueId::cpu_sh:
                                case rabbitizer::InstrId::UniqueId::cpu_lw:
                                case rabbitizer::InstrId::UniqueId::cpu_sw:
                                case rabbitizer::InstrId::UniqueId::cpu_ldc1:
                                case rabbitizer::InstrId::UniqueId::cpu_lwc1:
                                case rabbitizer::InstrId::UniqueId::cpu_swc1:
                                    insns[offset].patchImmediate(0);
                                    goto loop_end;

                                default:
                                    assert(0 && "Unsupported instruction type");
                            }
                        }
                        goto loop_end;
                    } else {
                        // ignore: reg is pointer, offset is probably struct data member
                        goto loop_end;
                    }
                }

                continue;

            case rabbitizer::InstrId::UniqueId::cpu_jr:
                if ((insns[search].instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra) &&
                    (offset - search >= 2)) {
                    // stop looking when previous `jr ra` is hit,
                    // but ignore if `offset` is branch delay slot for this `jr ra`
                    goto loop_end;
                }
                continue;

            default:
                continue;
        }
    }
loop_end:;
}

// for a given `jalr t9`, find the matching t9 load
void link_with_jalr(int offset) {
    // end search after some sane max number of instructions
    int end_search = std::max(0, offset - MAX_LOOKBACK);

    for (int search = offset - 1; search >= end_search; search--) {
        if (get_dest_reg(insns[search]) == rabbitizer::Registers::Cpu::GprO32::GPR_O32_t9) {
            // should be a switch with returns
            switch (insns[search].instruction.getUniqueId()) {
                case rabbitizer::InstrId::UniqueId::cpu_lw:
                case UniqueId_cpu_la:
                    if (insns[search].is_global_got_memop ||
                        (insns[search].instruction.getUniqueId() == UniqueId_cpu_la)) {
                        insns[search].linked_insn = offset;
                        insns[offset].linked_insn = search;
                        insns[offset].linked_value = insns[search].linked_value;

                        insns[offset].patchAddress(rabbitizer::InstrId::UniqueId::cpu_jal, insns[search].linked_value);

                        insns[search].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);
                        insns[search].is_global_got_memop = false;

                        add_function(insns[search].linked_value);
                    }
                    return;

                case rabbitizer::InstrId::UniqueId::cpu_addiu:
                    if (insns[search].linked_insn != -1) {
                        uint32_t first = insns[search].linked_insn;

                        // not describing as patched since instruction not edited
                        insns[search].linked_insn = offset;
                        insns[offset].linked_insn = first;
                        insns[offset].linked_value = insns[search].linked_value;
                    }
                    return;

                case rabbitizer::InstrId::UniqueId::cpu_ld:
                case rabbitizer::InstrId::UniqueId::cpu_addu:
                case rabbitizer::InstrId::UniqueId::cpu_add:
                case rabbitizer::InstrId::UniqueId::cpu_sub:
                case rabbitizer::InstrId::UniqueId::cpu_subu:
                    return;

                default:
                    break;
            }
        } else if ((insns[search].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_jr) &&
                   (insns[search].instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra)) {
            // stop looking when previous `jr ra` is hit
            return;
        }
    }
}

// TODO: uniformise use of insn vs insns[i]
void pass1(void) {
    for (size_t i = 0; i < insns.size(); i++) {
        Insn& insn = insns[i];

        // TODO: replace with BAL. Or just fix properly
        if (insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_bal) {
            insn.patchAddress(rabbitizer::InstrId::UniqueId::cpu_jal,
                              insn.instruction.getVram() + insn.instruction.getBranchOffset());
        }

        if (insn.instruction.isJump()) {
            if (insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_jal ||
                insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_j) {
                uint32_t target = insn.getAddress();

                label_addresses.insert(target);
                add_function(target);
            } else if (insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_jr) {
                // sltiu $at, $ty, z
                // sw    $reg, offset($sp)   (very seldom, one or more, usually in func entry)
                // lw    $gp, offset($sp)    (if PIC, and very seldom)
                // beqz  $at, .L
                // some other instruction    (not always)
                // lui   $at, %hi(jtbl)
                // sll   $tx, $ty, 2
                // addu  $at, $at, $tx
                // lw    $tx, %lo(jtbl)($at)
                // nop                       (code compiled with 5.3)
                // addu  $tx, $tx, $gp       (if PIC)
                // jr    $tx

                // IDO 7.1:
                // lw      at,offset(gp)
                // andi    t9,t8,0x3f
                // sll     t9,t9,0x2
                // addu    at,at,t9
                // lw      t9,offset(at)
                // addu    t9,t9,gp
                // jr      t9

                // IDO 5.3:
                // lw      at,offset(gp)
                // andi    t3,t2,0x3f
                // sll     t3,t3,0x2
                // addu    at,at,t3
                // something
                // lw      t3,offset(at)
                // something
                // addu    t3,t3,gp
                // jr      t3
                if (i >= 7 && rodata_section != NULL) {
                    bool is_pic =
                        (insns[i - 1].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_addu) &&
                        (insns[i - 1].instruction.GetO32_rt() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_gp);
                    bool has_nop =
                        insns[i - is_pic - 1].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_nop;
                    bool has_extra = insns[i - is_pic - has_nop - 5].instruction.getUniqueId() !=
                                     rabbitizer::InstrId::UniqueId::cpu_beqz;
                    int lw = i - (int)is_pic - (int)has_nop - 1;

                    if (insns[lw].instruction.getUniqueId() != rabbitizer::InstrId::UniqueId::cpu_lw) {
                        --lw;
                    }

                    if ((insns[lw].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_lw) &&
                        (insns[lw].linked_insn != -1)) {
                        int sltiu_index = -1;
                        int andi_index = -1;
                        uint32_t addu_index = lw - 1;
                        uint32_t num_cases;
                        bool found = false;
                        bool and_variant = false;
                        int end = 14;

                        if (insns[addu_index].instruction.getUniqueId() != rabbitizer::InstrId::UniqueId::cpu_addu) {
                            --addu_index;
                        }

                        if (insns[addu_index].instruction.getUniqueId() != rabbitizer::InstrId::UniqueId::cpu_addu) {
                            goto skip;
                        }

                        if (insns[addu_index - 1].instruction.getUniqueId() != rabbitizer::InstrId::UniqueId::cpu_sll) {
                            goto skip;
                        }

                        if (get_dest_reg(insns[addu_index - 1]) != insn.instruction.GetO32_rs()) {
                            goto skip;
                        }

                        for (int j = 3; j <= 4; j++) {
                            if (insns[lw - j].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_andi) {
                                andi_index = lw - j;
                                break;
                            }
                        }

                        if (i == 368393) {
                            // In copt
                            end = 18;
                        }

                        for (int j = 5; j <= end; j++) {
                            if ((insns[lw - has_extra - j].instruction.getUniqueId() ==
                                 rabbitizer::InstrId::UniqueId::cpu_sltiu) &&
                                (insns[lw - has_extra - j].instruction.GetO32_rt() ==
                                 rabbitizer::Registers::Cpu::GprO32::GPR_O32_at)) {
                                sltiu_index = j;
                                break;
                            }

                            if (insns[lw - has_extra - j].instruction.getUniqueId() ==
                                rabbitizer::InstrId::UniqueId::cpu_jr) {
                                // Prevent going into a previous switch
                                break;
                            }
                        }

                        if (sltiu_index != -1) {
                            andi_index = -1;
                        }

                        if (sltiu_index != -1 && insns[lw - has_extra - sltiu_index].instruction.getUniqueId() ==
                                                     rabbitizer::InstrId::UniqueId::cpu_sltiu) {
                            num_cases = insns[lw - has_extra - sltiu_index].instruction.getProcessedImmediate();
                            found = true;
                        } else if (andi_index != -1) {
                            num_cases = insns[andi_index].instruction.getProcessedImmediate() + 1;
                            found = true;
                            and_variant = true;
                        } else if (i == 219382) {
                            // Special hard case in copt where the initial sltiu is in another basic block
                            found = true;
                            num_cases = 13;
                        } else if (i == 370995) {
                            // Special hard case in copt where the initial sltiu is in another basic block
                            found = true;
                            num_cases = 12;
                        }

                        if (found) {
                            uint32_t jtbl_addr = insns[lw].linked_value;

                            if (is_pic) {
                                insns[i - 1].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);
                            }

                            insn.jtbl_addr = jtbl_addr;
                            insn.num_cases = num_cases;
                            insn.index_reg = insns[addu_index - 1].instruction.GetO32_rt();
                            insns[lw].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);

                            insns[addu_index].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);

                            insns[addu_index - 1].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);

                            if (!and_variant) {
                                insns[addu_index - 2].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);
                            }

                            if (jtbl_addr < rodata_vaddr ||
                                jtbl_addr + num_cases * sizeof(uint32_t) > rodata_vaddr + rodata_section_len) {
                                fprintf(stderr, "jump table outside rodata\n");
                                exit(EXIT_FAILURE);
                            }

                            for (uint32_t i = 0; i < num_cases; i++) {
                                uint32_t target_addr =
                                    read_u32_be(rodata_section + (jtbl_addr - rodata_vaddr) + i * sizeof(uint32_t));

                                target_addr += gp_value;
                                // printf("%08X\n", target_addr);
                                label_addresses.insert(target_addr);
                            }
                        }
                    skip:;
                    }
                }
            } else if (insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_jalr) {
                // empty
            } else {
                assert(!"Unreachable code");
            }
        } else if (insn.instruction.isBranch()) {
            uint32_t target = insn.getAddress();

            label_addresses.insert(target);
        }

        switch (insns[i].instruction.getUniqueId()) {
            // find floating point LI
            case rabbitizer::InstrId::UniqueId::cpu_mtc1: {
                rabbitizer::Registers::Cpu::GprO32 rt = insns[i].instruction.GetO32_rt();

                for (int s = i - 1; s >= 0; s--) {
                    switch (insns[s].instruction.getUniqueId()) {
                        case rabbitizer::InstrId::UniqueId::cpu_lui:
                            if (insns[s].instruction.GetO32_rt() == rt) {
                                float f;
                                uint32_t lui_imm = insns[s].instruction.getProcessedImmediate() << 16;

                                memcpy(&f, &lui_imm, sizeof(f));
                                // link up the LUI with this instruction and the float
                                insns[s].linked_insn = i;
                                insns[s].linked_float = f;
                                // rewrite LUI instruction to be LI
                                insns[s].lila_dst_reg = get_dest_reg(insns[s]);
                                insns[s].patchInstruction(UniqueId_cpu_li);
                                insns[s].patchImmediate(lui_imm);
                            }
                            goto loop_end;

                        case rabbitizer::InstrId::UniqueId::cpu_lw:
                        case rabbitizer::InstrId::UniqueId::cpu_ld:
                        case rabbitizer::InstrId::UniqueId::cpu_lh:
                        case rabbitizer::InstrId::UniqueId::cpu_lhu:
                        case rabbitizer::InstrId::UniqueId::cpu_lb:
                        case rabbitizer::InstrId::UniqueId::cpu_lbu:
                        case rabbitizer::InstrId::UniqueId::cpu_addiu:
                            if (rt == insns[s].instruction.GetO32_rt()) {
                                goto loop_end;
                            }
                            continue;

                        case rabbitizer::InstrId::UniqueId::cpu_add:
                        case rabbitizer::InstrId::UniqueId::cpu_sub:
                        case rabbitizer::InstrId::UniqueId::cpu_subu:
                            if (rt == insns[s].instruction.GetO32_rd()) {
                                goto loop_end;
                            }
                            continue;

                        case rabbitizer::InstrId::UniqueId::cpu_jr:
                            if (insns[s].instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra) {
                                goto loop_end;
                            }
                            continue;

                        default:
                            continue;
                    }
                }
            loop_end:;
            } break;

            case rabbitizer::InstrId::UniqueId::cpu_sd:
            case rabbitizer::InstrId::UniqueId::cpu_sw:
            case rabbitizer::InstrId::UniqueId::cpu_sh:
            case rabbitizer::InstrId::UniqueId::cpu_sb:
            case rabbitizer::InstrId::UniqueId::cpu_lb:
            case rabbitizer::InstrId::UniqueId::cpu_lbu:
            case rabbitizer::InstrId::UniqueId::cpu_ld:
            case rabbitizer::InstrId::UniqueId::cpu_ldl:
            case rabbitizer::InstrId::UniqueId::cpu_ldr:
            case rabbitizer::InstrId::UniqueId::cpu_lh:
            case rabbitizer::InstrId::UniqueId::cpu_lhu:
            case rabbitizer::InstrId::UniqueId::cpu_lw:
            case rabbitizer::InstrId::UniqueId::cpu_lwu:
            case rabbitizer::InstrId::UniqueId::cpu_ldc1:
            case rabbitizer::InstrId::UniqueId::cpu_lwc1:
            case rabbitizer::InstrId::UniqueId::cpu_lwc2:
            case rabbitizer::InstrId::UniqueId::cpu_swc1:
            case rabbitizer::InstrId::UniqueId::cpu_swc2: {
                rabbitizer::Registers::Cpu::GprO32 mem_rs = insns[i].instruction.GetO32_rs();
                int32_t mem_imm = insns[i].instruction.getProcessedImmediate();

                if (mem_rs == rabbitizer::Registers::Cpu::GprO32::GPR_O32_gp) {
                    unsigned int got_entry = (mem_imm + gp_value_adj) / sizeof(unsigned int);

                    if (got_entry >= got_locals.size()) {
                        got_entry -= got_locals.size();
                        if (got_entry < got_globals.size()) {
                            assert(insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_lw);
                            unsigned int dest_vaddr = got_globals[got_entry];

                            insns[i].is_global_got_memop = true;
                            insns[i].linked_value = dest_vaddr;

                            // patch to LA
                            insns[i].lila_dst_reg = get_dest_reg(insns[i]);
                            insns[i].patchAddress(UniqueId_cpu_la, dest_vaddr);
                        }
                    }
                } else {
                    link_with_lui(i, mem_rs, mem_imm);
                }
            } break;

            case rabbitizer::InstrId::UniqueId::cpu_addiu:
            case rabbitizer::InstrId::UniqueId::cpu_ori: {
                // could be insn?
                rabbitizer::Registers::Cpu::GprO32 rt = insns[i].instruction.GetO32_rt();
                rabbitizer::Registers::Cpu::GprO32 rs = insns[i].instruction.GetO32_rs();
                int32_t imm = insns[i].instruction.getProcessedImmediate();

                if (rs == rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero) { // becomes LI
                    insns[i].lila_dst_reg = get_dest_reg(insns[i]);
                    insns[i].patchInstruction(UniqueId_cpu_li);
                    insns[i].patchImmediate(imm);
                } else if (rt != rabbitizer::Registers::Cpu::GprO32::GPR_O32_gp) { // only look for LUI if rt and rs are
                                                                                   // the same
                    link_with_lui(i, rs, imm);
                }
            } break;

            case rabbitizer::InstrId::UniqueId::cpu_jalr: {
                rabbitizer::Registers::Cpu::GprO32 rs = insn.instruction.GetO32_rs();

                if (rs == rabbitizer::Registers::Cpu::GprO32::GPR_O32_t9) {
                    link_with_jalr(i);
                    if (insn.linked_insn != -1) {
                        insn.patchAddress(rabbitizer::InstrId::UniqueId::cpu_jal, insn.linked_value);

                        label_addresses.insert(insn.linked_value);
                        add_function(insn.linked_value);
                    }
                }
            } break;

            default:
                break;
        }

        if ((insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_addu) &&
            (insn.instruction.GetO32_rd() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_gp) &&
            (insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_gp) &&
            (insn.instruction.GetO32_rt() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_t9) && i >= 2) {
            for (size_t j = i - 2; j <= i; j++) {
                insns[j].patchInstruction(rabbitizer::InstrId::UniqueId::cpu_nop);
            }
        }
    }
}

uint32_t addr_to_i(uint32_t addr) {
    return (addr - text_vaddr) / 4;
}

void pass2(void) {
    // Find returns in each function
    for (size_t i = 0; i < insns.size(); i++) {
        uint32_t addr = text_vaddr + i * 4;
        Insn& insn = insns[i];

        if ((insn.instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_jr) &&
            (insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra)) {
            auto it = find_function(addr);
            assert(it != functions.end());

            it->second.returns.push_back(addr + 4);
        }

        if (insn.instruction.getUniqueId() == UniqueId_cpu_la) {
            uint32_t faddr = insn.getAddress();

            if ((text_vaddr <= faddr) && (faddr < text_vaddr + text_section_len)) {
                la_function_pointers.insert(faddr);
                functions[faddr].referenced_by_function_pointer = true;
#if INSPECT_FUNCTION_POINTERS
                fprintf(stderr, "la function pointer: 0x%x at 0x%x\n", faddr, addr);
#endif
            }
        }
    }

    for (auto it = functions.begin(); it != functions.end(); ++it) {
        if (it->second.returns.size() == 0) {
            uint32_t i = addr_to_i(it->first);
            auto str_it = symbol_names.find(it->first);

            if (str_it != symbol_names.end() && str_it->second == "__start") {

            } else if (str_it != symbol_names.end() && str_it->second == "xmalloc") {
                // orig 5.3:
                /*
                496bf4:       3c1c0fb9        lui     gp,0xfb9
                496bf8:       279c366c        addiu   gp,gp,13932
                496bfc:       0399e021        addu    gp,gp,t9
                496c00:       27bdffd8        addiu   sp,sp,-40
                496c04:       8f858de8        lw      a1,-29208(gp)
                496c08:       10000006        b       496c24 <alloc_new+0x14>
                496c0c:       afbf0020        sw      ra,32(sp)
                */

                // jal   alloc_new
                //  lui  $a1, malloc_scb
                // jr    $ra
                //  nop
                uint32_t alloc_new_addr = text_vaddr + (i + 7) * 4;

                insns[i].patchAddress(rabbitizer::InstrId::UniqueId::cpu_jal, alloc_new_addr);

                assert(symbol_names.count(alloc_new_addr) && symbol_names[alloc_new_addr] == "alloc_new");
                i++;

                // LA
                if (insns[i + 5].instruction.getUniqueId() == UniqueId_cpu_la) {
                    // 7.1
                    insns[i] = insns[i + 5];
                } else {
                    // 5.3
                    insns[i] = insns[i + 3];
                }
                i++;

                // JR $RA
                insns[i].patched = true;
                insns[i].instruction = rabbitizer::InstructionCpu(0x03E00008, insns[i].instruction.getVram());
                it->second.returns.push_back(text_vaddr + i * 4 + 4);
                i++;

                for (uint32_t j = 0; j < 4; j++) {
                    // NOP
                    insns[i].patched = true;
                    insns[i].instruction = rabbitizer::InstructionCpu(0, insns[i].instruction.getVram());
                    i++;
                }
            } else if (str_it != symbol_names.end() && str_it->second == "xfree") {
                // jal   alloc_dispose
                //  lui  $a1, malloc_scb
                // jr    $ra
                //  nop
                uint32_t alloc_dispose_addr = text_vaddr + (i + 4) * 4;

                if (symbol_names.count(alloc_dispose_addr + 4) &&
                    symbol_names[alloc_dispose_addr + 4] == "alloc_dispose") {
                    alloc_dispose_addr += 4;
                }

                insns[i].patchAddress(rabbitizer::InstrId::UniqueId::cpu_jal, alloc_dispose_addr);
                assert(symbol_names.count(alloc_dispose_addr) && symbol_names[alloc_dispose_addr] == "alloc_dispose");
                i++;

                insns[i] = insns[i + 2];
                i++;

                // JR $RA
                insns[i].patched = true;
                insns[i].instruction = rabbitizer::InstructionCpu(0x03E00008, insns[i].instruction.getVram());
                it->second.returns.push_back(text_vaddr + i * 4 + 4);
                i++;

                // NOP
                insns[i].patched = true;
                insns[i].instruction = rabbitizer::InstructionCpu(0, insns[i].instruction.getVram());
            } else if ((insns[i].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_lw) &&
                       (insns[i + 1].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_move) &&
                       (insns[i + 2].instruction.getUniqueId() == rabbitizer::InstrId::UniqueId::cpu_jalr)) {
                /*
                408f50:       8f998010        lw      t9,-32752(gp)
                408f54:       03e07821        move    t7,ra
                408f58:       0320f809        jalr    t9
                */
            } else if (it->first > mcount_addr) {
                fprintf(stderr, "no ret: 0x%x\n", it->first);
                abort();
            }
        }

        auto next = it;

        ++next;
        if (next == functions.end()) {
            it->second.end_addr = text_vaddr + text_section_len;
        } else {
            it->second.end_addr = next->first;
        }
    }
}

void add_edge(uint32_t from, uint32_t to, bool function_entry = false, bool function_exit = false,
              bool extern_function = false, bool function_pointer = false) {
    Edge fe = Edge(), be = Edge();

    fe.i = to;
    be.i = from;
    fe.function_entry = function_entry;
    be.function_entry = function_entry;
    fe.function_exit = function_exit;
    be.function_exit = function_exit;
    fe.extern_function = extern_function;
    be.extern_function = extern_function;
    fe.function_pointer = function_pointer;
    be.function_pointer = function_pointer;
    insns[from].successors.push_back(fe);
    insns[to].predecessors.push_back(be);
}

void pass3(void) {
    // Build graph
    for (size_t i = 0; i < insns.size(); i++) {
        uint32_t addr = text_vaddr + i * 4;
        Insn& insn = insns[i];

        if (insn.no_following_successor) {
            continue;
        }

        switch (insn.instruction.getUniqueId()) {
            case rabbitizer::InstrId::UniqueId::cpu_beq:
            case rabbitizer::InstrId::UniqueId::cpu_bgez:
            case rabbitizer::InstrId::UniqueId::cpu_bgtz:
            case rabbitizer::InstrId::UniqueId::cpu_blez:
            case rabbitizer::InstrId::UniqueId::cpu_bltz:
            case rabbitizer::InstrId::UniqueId::cpu_bne:
            case rabbitizer::InstrId::UniqueId::cpu_beqz:
            case rabbitizer::InstrId::UniqueId::cpu_bnez:
            case rabbitizer::InstrId::UniqueId::cpu_bc1f:
            case rabbitizer::InstrId::UniqueId::cpu_bc1t:
                add_edge(i, i + 1);
                add_edge(i + 1, addr_to_i(insn.getAddress()));
                break;

            case rabbitizer::InstrId::UniqueId::cpu_beql:
            case rabbitizer::InstrId::UniqueId::cpu_bgezl:
            case rabbitizer::InstrId::UniqueId::cpu_bgtzl:
            case rabbitizer::InstrId::UniqueId::cpu_blezl:
            case rabbitizer::InstrId::UniqueId::cpu_bltzl:
            case rabbitizer::InstrId::UniqueId::cpu_bnel:
            case rabbitizer::InstrId::UniqueId::cpu_bc1fl:
            case rabbitizer::InstrId::UniqueId::cpu_bc1tl:
                add_edge(i, i + 1);
                add_edge(i, i + 2);
                add_edge(i + 1, addr_to_i(insn.getAddress()));
                insns[i + 1].no_following_successor = true; // don't inspect delay slot
                break;

            case rabbitizer::InstrId::UniqueId::cpu_b:
            case rabbitizer::InstrId::UniqueId::cpu_j:
                add_edge(i, i + 1);
                add_edge(i + 1, addr_to_i(insn.getAddress()));
                insns[i + 1].no_following_successor = true; // don't inspect delay slot
                break;

            case rabbitizer::InstrId::UniqueId::cpu_jr: {
                add_edge(i, i + 1);

                if (insn.jtbl_addr != 0) {
                    uint32_t jtbl_pos = insn.jtbl_addr - rodata_vaddr;

                    assert(jtbl_pos < rodata_section_len &&
                           jtbl_pos + insn.num_cases * sizeof(uint32_t) <= rodata_section_len);

                    for (uint32_t j = 0; j < insn.num_cases; j++) {
                        uint32_t dest_addr = read_u32_be(rodata_section + jtbl_pos + j * sizeof(uint32_t)) + gp_value;

                        add_edge(i + 1, addr_to_i(dest_addr));
                    }
                } else {
                    assert(insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra &&
                           "jump to address in register not supported");
                }

                insns[i + 1].no_following_successor = true; // don't inspect delay slot
                break;
            }

            case rabbitizer::InstrId::UniqueId::cpu_jal: {
                add_edge(i, i + 1);

                uint32_t dest = insn.getAddress();

                if (dest > mcount_addr && dest >= text_vaddr && dest < text_vaddr + text_section_len) {
                    add_edge(i + 1, addr_to_i(dest), true);

                    auto it = functions.find(dest);
                    assert(it != functions.end());

                    for (uint32_t ret_instr : it->second.returns) {
                        add_edge(addr_to_i(ret_instr), i + 2, false, true);
                    }
                } else {
                    add_edge(i + 1, i + 2, false, false, true);
                }

                insns[i + 1].no_following_successor = true; // don't inspect delay slot
                break;
            }

            case rabbitizer::InstrId::UniqueId::cpu_jalr:
                // function pointer
                add_edge(i, i + 1);
                add_edge(i + 1, i + 2, false, false, false, true);
                insns[i + 1].no_following_successor = true; // don't inspect delay slot
                break;

            default:
                add_edge(i, i + 1);
                break;
        }
    }
}

#define GPR_O32_hi (rabbitizer::Registers::Cpu::GprO32)((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra + 1)
#define GPR_O32_lo (rabbitizer::Registers::Cpu::GprO32)((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra + 2)

uint64_t map_reg(rabbitizer::Registers::Cpu::GprO32 reg) {
    return (uint64_t)1 << ((int)reg - (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero + 1);
}

uint64_t temporary_regs(void) {
    // clang-format off
    return
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t0) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t1) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t2) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t3) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t4) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t5) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t6) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t7) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t8) |
        map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_t9);
    // clang-format on
}

typedef enum {
    /* 0 */ TYPE_NOP, // No arguments
    /* 1 */ TYPE_S,   // in
    /* 2 */ TYPE_D,   // 1 out
    /* 3 */ TYPE_D_S, // out, in
} TYPE;

TYPE insn_to_type(Insn& insn) {
    switch (insn.instruction.getUniqueId()) {
        case rabbitizer::InstrId::UniqueId::cpu_add_s:
        case rabbitizer::InstrId::UniqueId::cpu_add_d:
            return TYPE_NOP;

        case rabbitizer::InstrId::UniqueId::cpu_add:
        case rabbitizer::InstrId::UniqueId::cpu_addu:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_addi:
        case rabbitizer::InstrId::UniqueId::cpu_addiu:
        case rabbitizer::InstrId::UniqueId::cpu_andi:
        case rabbitizer::InstrId::UniqueId::cpu_ori:
        case rabbitizer::InstrId::UniqueId::cpu_lb:
        case rabbitizer::InstrId::UniqueId::cpu_lbu:
        case rabbitizer::InstrId::UniqueId::cpu_lh:
        case rabbitizer::InstrId::UniqueId::cpu_lhu:
        case rabbitizer::InstrId::UniqueId::cpu_lw:
        case rabbitizer::InstrId::UniqueId::cpu_lwl:
        // case rabbitizer::InstrId::UniqueId::cpu_lwr:
        case rabbitizer::InstrId::UniqueId::cpu_move:
        case rabbitizer::InstrId::UniqueId::cpu_negu:
        case rabbitizer::InstrId::UniqueId::cpu_not:
        case rabbitizer::InstrId::UniqueId::cpu_sll:
        case rabbitizer::InstrId::UniqueId::cpu_slti:
        case rabbitizer::InstrId::UniqueId::cpu_sltiu:
        case rabbitizer::InstrId::UniqueId::cpu_sra:
        case rabbitizer::InstrId::UniqueId::cpu_srl:
        case rabbitizer::InstrId::UniqueId::cpu_xori:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_mfhi:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_mflo:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_and:
        case rabbitizer::InstrId::UniqueId::cpu_or:
        case rabbitizer::InstrId::UniqueId::cpu_nor:
        case rabbitizer::InstrId::UniqueId::cpu_sllv:
        case rabbitizer::InstrId::UniqueId::cpu_slt:
        case rabbitizer::InstrId::UniqueId::cpu_sltu:
        case rabbitizer::InstrId::UniqueId::cpu_srav:
        case rabbitizer::InstrId::UniqueId::cpu_srlv:
        case rabbitizer::InstrId::UniqueId::cpu_subu:
        case rabbitizer::InstrId::UniqueId::cpu_xor:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_cfc1:
        case rabbitizer::InstrId::UniqueId::cpu_mfc1:
        case UniqueId_cpu_li:
        case UniqueId_cpu_la:
        case rabbitizer::InstrId::UniqueId::cpu_lui:
            return TYPE_D;

        case rabbitizer::InstrId::UniqueId::cpu_ctc1:
        case rabbitizer::InstrId::UniqueId::cpu_bgez:
        case rabbitizer::InstrId::UniqueId::cpu_bgezl:
        case rabbitizer::InstrId::UniqueId::cpu_bgtz:
        case rabbitizer::InstrId::UniqueId::cpu_bgtzl:
        case rabbitizer::InstrId::UniqueId::cpu_blez:
        case rabbitizer::InstrId::UniqueId::cpu_blezl:
        case rabbitizer::InstrId::UniqueId::cpu_bltz:
        case rabbitizer::InstrId::UniqueId::cpu_bltzl:
        case rabbitizer::InstrId::UniqueId::cpu_beqz:
        case rabbitizer::InstrId::UniqueId::cpu_bnez:
        case rabbitizer::InstrId::UniqueId::cpu_mtc1:
            return TYPE_S;

        case rabbitizer::InstrId::UniqueId::cpu_beq:
        case rabbitizer::InstrId::UniqueId::cpu_beql:
        case rabbitizer::InstrId::UniqueId::cpu_bne:
        case rabbitizer::InstrId::UniqueId::cpu_bnel:
        case rabbitizer::InstrId::UniqueId::cpu_sb:
        case rabbitizer::InstrId::UniqueId::cpu_sh:
        case rabbitizer::InstrId::UniqueId::cpu_sw:
        case rabbitizer::InstrId::UniqueId::cpu_swl:
        // case rabbitizer::InstrId::UniqueId::cpu_swr:
        case rabbitizer::InstrId::UniqueId::cpu_tne:
        case rabbitizer::InstrId::UniqueId::cpu_teq:
        case rabbitizer::InstrId::UniqueId::cpu_tge:
        case rabbitizer::InstrId::UniqueId::cpu_tgeu:
        case rabbitizer::InstrId::UniqueId::cpu_tlt:
            return TYPE_S;

        case rabbitizer::InstrId::UniqueId::cpu_div:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_div_s:
        case rabbitizer::InstrId::UniqueId::cpu_div_d:
            return TYPE_NOP;

        case rabbitizer::InstrId::UniqueId::cpu_divu:
        case rabbitizer::InstrId::UniqueId::cpu_mult:
        case rabbitizer::InstrId::UniqueId::cpu_multu:
            return TYPE_D_S;

        case rabbitizer::InstrId::UniqueId::cpu_neg_s:
        case rabbitizer::InstrId::UniqueId::cpu_neg_d:
            return TYPE_NOP;

        case rabbitizer::InstrId::UniqueId::cpu_jalr:
            return TYPE_S;

        case rabbitizer::InstrId::UniqueId::cpu_jr:
            if (insn.jtbl_addr != 0) {
                insn.instruction.Set_rs(insn.index_reg);
            }
            if (insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra) {
                return TYPE_NOP;
            }
            return TYPE_S;

        case rabbitizer::InstrId::UniqueId::cpu_lwc1:
        case rabbitizer::InstrId::UniqueId::cpu_ldc1:
        case rabbitizer::InstrId::UniqueId::cpu_swc1:
        case rabbitizer::InstrId::UniqueId::cpu_sdc1:
            return TYPE_S;

        default:
            return TYPE_NOP;
    }
}

uint64_t get_dest_reg_mask(const Insn& insn) {
    switch (insn.instruction.getUniqueId()) {
        case rabbitizer::InstrId::UniqueId::cpu_div:
        case rabbitizer::InstrId::UniqueId::cpu_divu:
        case rabbitizer::InstrId::UniqueId::cpu_mult:
        case rabbitizer::InstrId::UniqueId::cpu_multu:
            return map_reg(GPR_O32_lo) | map_reg(GPR_O32_hi);

        default:
            return map_reg(get_dest_reg(insn));
    }
}

uint64_t get_single_source_reg_mask(const rabbitizer::InstructionCpu& instr) {
    switch (instr.getUniqueId()) {
        case rabbitizer::InstrId::UniqueId::cpu_mflo:
            return map_reg(GPR_O32_lo);
        case rabbitizer::InstrId::UniqueId::cpu_mfhi:
            return map_reg(GPR_O32_hi);

        default:
            break;
    }
    if (instr.hasOperandAlias(rabbitizer::OperandType::cpu_rs)) {
        return map_reg(instr.GetO32_rs());
    } else if (instr.hasOperandAlias(rabbitizer::OperandType::cpu_rt)) {
        return map_reg(instr.GetO32_rt());
    } else {
        return 0;
    }
}

uint64_t get_all_source_reg_mask(const rabbitizer::InstructionCpu& instr) {
    uint64_t ret = 0;

    switch (instr.getUniqueId()) {
        case rabbitizer::InstrId::UniqueId::cpu_mflo:
            ret |= map_reg(GPR_O32_lo);
        case rabbitizer::InstrId::UniqueId::cpu_mfhi:
            ret |= map_reg(GPR_O32_hi);

        default:
            break;
    }

    if (instr.hasOperandAlias(rabbitizer::OperandType::cpu_rs)) {
        ret |= map_reg(instr.GetO32_rs());
    }
    if (instr.hasOperandAlias(rabbitizer::OperandType::cpu_rt) && !instr.modifiesRt()) {
        ret |= map_reg(instr.GetO32_rt());
    }
    return ret;
}

void pass4(void) {
    vector<uint32_t> q; // TODO: Why is this called q?
    uint64_t livein_func_start = 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                                 map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                                 map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_sp) |
                                 map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero);

    q.push_back(main_addr);
    insns[addr_to_i(main_addr)].f_livein = livein_func_start;

    for (auto& it : data_function_pointers) {
        q.push_back(it.second);
        insns[addr_to_i(it.second)].f_livein = livein_func_start |
                                               map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                                               map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3);
    }

    for (auto& addr : la_function_pointers) {
        q.push_back(addr);
        insns[addr_to_i(addr)].f_livein = livein_func_start | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                                          map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3);
    }

    while (!q.empty()) {
        uint32_t addr = q.back();
        q.pop_back();
        uint32_t i = addr_to_i(addr);
        Insn& insn = insns[i];
        uint64_t live = insn.f_livein | 1U;
        uint64_t src_regs_map;

        switch (insn_to_type(insn)) {
            case TYPE_D:
                live |= get_dest_reg_mask(insn);
                break;

            case TYPE_D_S:
                src_regs_map = get_all_source_reg_mask(insn.instruction);
                if ((live & src_regs_map) == src_regs_map) {
                    live |= get_dest_reg_mask(insn);
                }
                break;

            case TYPE_S:
            case TYPE_NOP:
                break;
        }

        if ((insn.f_liveout | live) == insn.f_liveout) {
            // No new bits
            continue;
        }

        live |= insn.f_liveout;
        insn.f_liveout = live;

        bool function_entry = false;

        for (Edge& e : insn.successors) {
            uint64_t new_live = live;

            if (e.function_exit) {
                new_live &= 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero);
            } else if (e.function_entry) {
                new_live &= 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_sp) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero);
                function_entry = true;
            } else if (e.extern_function) {
                string_view name;
                size_t extern_function_id;
                uint32_t address = insns[i - 1].getAddress();

                // TODO: Can this only ever be a J-type instruction?
                auto it = symbol_names.find(address);
                const ExternFunction* found_fn = nullptr;

                if (it != symbol_names.end()) {
                    name = it->second;

                    for (auto& fn : extern_functions) {
                        if (name == fn.name) {
                            found_fn = &fn;
                            break;
                        }
                    }

                    if (found_fn == nullptr) {
                        fprintf(stderr, "missing extern function: %s\n", string(name).c_str());
                    }
                }

                assert(found_fn);

                char ret_type = found_fn->params[0];

                new_live &= ~(map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) | temporary_regs());

                switch (ret_type) {
                    case 'i':
                    case 'u':
                    case 'p':
                        new_live |= map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0);
                        break;

                    case 'f':
                        break;

                    case 'd':
                        break;

                    case 'v':
                        break;

                    case 'l':
                    case 'j':
                        new_live |= map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                                    map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1);
                        break;
                }
            } else if (e.function_pointer) {
                new_live &= ~(map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) | temporary_regs());
                new_live |= map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1);
            }

            if ((insns[e.i].f_livein | new_live) != insns[e.i].f_livein) {
                insns[e.i].f_livein |= new_live;
                q.push_back(text_vaddr + e.i * sizeof(uint32_t));
            }
        }

        if (function_entry) {
            // add one edge that skips the function call, for callee-saved register liveness propagation
            live &= ~(map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) | temporary_regs());

            if ((insns[i + 1].f_livein | live) != insns[i + 1].f_livein) {
                insns[i + 1].f_livein |= live;
                q.push_back(text_vaddr + (i + 1) * sizeof(uint32_t));
            }
        }
    }
}

void pass5(void) {
    vector<uint32_t> q;

    assert(functions.count(main_addr));

    q = functions[main_addr].returns;
    for (auto addr : q) {
        insns[addr_to_i(addr)].b_liveout = 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0);
    }

    for (auto& it : data_function_pointers) {
        for (auto addr : functions[it.second].returns) {
            q.push_back(addr);
            insns[addr_to_i(addr)].b_liveout = 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                                               map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1);
        }
    }

    for (auto& func_addr : la_function_pointers) {
        for (auto addr : functions[func_addr].returns) {
            q.push_back(addr);
            insns[addr_to_i(addr)].b_liveout = 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                                               map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1);
        }
    }

    for (auto& insn : insns) {
        if (insn.f_livein != 0) {
            q.push_back(insn.instruction.getVram());
        }
    }

    while (!q.empty()) {
        uint32_t addr = q.back();

        q.pop_back();

        uint32_t i = addr_to_i(addr);
        Insn& insn = insns[i];
        uint64_t live = insn.b_liveout | 1;

        switch (insn_to_type(insn)) {
            case TYPE_S:
                live |= get_all_source_reg_mask(insn.instruction);
                break;

            case TYPE_D:
                live &= ~get_dest_reg_mask(insn);
                break;

            case TYPE_D_S:
                if (live & get_dest_reg_mask(insn)) {
                    live &= ~get_dest_reg_mask(insn);
                    live |= get_all_source_reg_mask(insn.instruction);
                }
                break;

            case TYPE_NOP:
                break;
        }

        if ((insn.b_livein | live) == insn.b_livein) {
            // No new bits
            continue;
        }

        live |= insn.b_livein;
        insn.b_livein = live;

        bool function_exit = false;

        for (Edge& e : insn.predecessors) {
            uint64_t new_live = live;

            if (e.function_exit) {
                new_live &= 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1);
                function_exit = true;
            } else if (e.function_entry) {
                new_live &= 1U | map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_sp);
            } else if (e.extern_function) {
                string_view name;
                size_t extern_function_id;
                const ExternFunction* found_fn = nullptr;
                uint32_t address = insns[i - 2].getAddress();
                // TODO: Can this only ever be a J-type instruction?
                auto it = symbol_names.find(address);

                if (it != symbol_names.end()) {
                    name = it->second;
                    for (auto& fn : extern_functions) {
                        if (name == fn.name) {
                            found_fn = &fn;
                            break;
                        }
                    }
                }

                assert(found_fn);

                uint64_t args = 1U;

                if (found_fn->flags & FLAG_VARARG) {
                    // Assume the worst, that all four registers are used
                    for (int j = 0; j < 4; j++) {
                        args |= map_reg((rabbitizer::Registers::Cpu::GprO32)(
                            (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + j));
                    }
                }

                int pos = 0;
                int pos_float = 0;
                bool only_floats_so_far = true;

                for (const char* p = found_fn->params + 1; *p != '\0'; ++p) {
                    switch (*p) {
                        case 'i':
                        case 'u':
                        case 'p':
                        case 't':
                            only_floats_so_far = false;
                            if (pos < 4) {
                                args |= map_reg((rabbitizer::Registers::Cpu::GprO32)(
                                    (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos));
                            }
                            ++pos;
                            break;

                        case 'f':
                            if (only_floats_so_far && pos_float < 4) {
                                pos_float += 2;
                            } else if (pos < 4) {
                                args |= map_reg((rabbitizer::Registers::Cpu::GprO32)(
                                    (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos));
                            }
                            ++pos;
                            break;

                        case 'd':
                            // !!!
                            if (pos % 1 != 0) {
                                ++pos;
                            }
                            if (only_floats_so_far && pos_float < 4) {
                                pos_float += 2;
                            } else if (pos < 4) {
                                args |= map_reg((rabbitizer::Registers::Cpu::GprO32)(
                                            (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos)) |
                                        map_reg((rabbitizer::Registers::Cpu::GprO32)(
                                            (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos + 1));
                            }
                            pos += 2;
                            break;

                        case 'l':
                        case 'j':
                            if (pos % 1 != 0) {
                                ++pos;
                            }
                            only_floats_so_far = false;
                            if (pos < 4) {
                                args |= map_reg((rabbitizer::Registers::Cpu::GprO32)(
                                            (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos)) |
                                        map_reg((rabbitizer::Registers::Cpu::GprO32)(
                                            (int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos + 1));
                            }
                            pos += 2;
                            break;
                    }
                }
                args |= map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_sp);
                new_live &= ~(map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) | temporary_regs());
                new_live |= args;
            } else if (e.function_pointer) {
                new_live &= ~(map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                              map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) | temporary_regs());
                new_live |= map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                            map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3);
            }

            if ((insns[e.i].b_liveout | new_live) != insns[e.i].b_liveout) {
                insns[e.i].b_liveout |= new_live;
                q.push_back(text_vaddr + e.i * sizeof(uint32_t));
            }
        }

        if (function_exit) {
            // add one edge that skips the function call, for callee-saved register liveness propagation
            live &= ~(map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3) |
                      map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1) | temporary_regs());

            if ((insns[i - 1].b_liveout | live) != insns[i - 1].b_liveout) {
                insns[i - 1].b_liveout |= live;
                q.push_back(text_vaddr + (i - 1) * sizeof(uint32_t));
            }
        }
    }
}

void pass6(void) {
    for (auto& it : functions) {
        uint32_t addr = it.first;
        Function& f = it.second;

        for (uint32_t ret : f.returns) {
            Insn& i = insns[addr_to_i(ret)];

            if (i.f_liveout & i.b_liveout & map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1)) {
                f.nret = 2;
            } else if ((i.f_liveout & i.b_liveout & map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0)) &&
                       f.nret == 0) {
                f.nret = 1;
            }
        }

        Insn& insn = insns.at(addr_to_i(addr));

        for (int i = 0; i < 4; i++) {
            if (insn.f_livein & insn.b_livein &
                map_reg(
                    (rabbitizer::Registers::Cpu::GprO32)((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + i))) {
                f.nargs = 1 + i;
            }
        }
        f.v0_in = (insn.f_livein & insn.b_livein & map_reg(rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0)) != 0 &&
                  !f.referenced_by_function_pointer;
    }
}

void dump(void) {
    for (size_t i = 0; i < insns.size(); i++) {
        Insn& insn = insns[i];
        uint32_t vaddr = text_vaddr + i * sizeof(uint32_t);
        if (label_addresses.count(vaddr)) {
            if (symbol_names.count(vaddr)) {
                printf("L%08x: //%s\n", vaddr, symbol_names[vaddr].c_str());
            } else {
                printf("L%08x:\n", vaddr);
            }
        }

        // TODO: construct an immediate override for the instructions
        printf("\t%s", insn.disassemble().c_str());
        if (insn.patched) {
            printf("\t[patched, immediate now 0x%X]", insn.patched_addr);
        }
        printf("\n");
    }
}

const char* r(uint32_t reg) {
    static const char* regs[] = {
        /*  */ "zero", "at", "v0", "v1",
        /*  */ "a0",   "a1", "a2", "a3",
        /*  */ "t0",   "t1", "t2", "t3", "t4", "t5", "t6", "t7",
        /*  */ "s0",   "s1", "s2", "s3", "s4", "s5", "s6", "s7",
        /*  */ "t8",   "t9", "k0", "k1", "gp", "sp", "fp", "ra",
    };

    assert(reg < std::size(regs));
    return regs[reg];
}

const char* wr(uint32_t reg) {
    // clang-format off
    static const char *regs[] = {
        "f0.w[0]", "f0.w[1]",
        "f2.w[0]", "f2.w[1]",
        "f4.w[0]", "f4.w[1]",
        "f6.w[0]", "f6.w[1]",
        "f8.w[0]", "f8.w[1]",
        "f10.w[0]", "f10.w[1]",
        "f12.w[0]", "f12.w[1]",
        "f14.w[0]", "f14.w[1]",
        "f16.w[0]", "f16.w[1]",
        "f18.w[0]", "f18.w[1]",
        "f20.w[0]", "f20.w[1]",
        "f22.w[0]", "f22.w[1]",
        "f24.w[0]", "f24.w[1]",
        "f26.w[0]", "f26.w[1]",
        "f28.w[0]", "f28.w[1]",
        "f30.w[0]", "f30.w[1]"
    };
    // clang-format on

    size_t index = reg - (int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0;

    assert(index < std::size(regs));
    return regs[index];
}

const char* fr(uint32_t reg) {
    // clang-format off
    static const char *regs[] = {
        "f0.f[0]", "f0.f[1]",
        "f2.f[0]", "f2.f[1]",
        "f4.f[0]", "f4.f[1]",
        "f6.f[0]", "f6.f[1]",
        "f8.f[0]", "f8.f[1]",
        "f10.f[0]", "f10.f[1]",
        "f12.f[0]", "f12.f[1]",
        "f14.f[0]", "f14.f[1]",
        "f16.f[0]", "f16.f[1]",
        "f18.f[0]", "f18.f[1]",
        "f20.f[0]", "f20.f[1]",
        "f22.f[0]", "f22.f[1]",
        "f24.f[0]", "f24.f[1]",
        "f26.f[0]", "f26.f[1]",
        "f28.f[0]", "f28.f[1]",
        "f30.f[0]", "f30.f[1]",
    };
    // clang-format on

    size_t index = reg - (int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0;

    assert(index < std::size(regs));
    return regs[index];
}

const char* dr(uint32_t reg) {
    // clang-format off
    static const char *regs[] = {
        "f0",
        "f2",
        "f4",
        "f6",
        "f8",
        "f10",
        "f12",
        "f14",
        "f16",
        "f18",
        "f20",
        "f22",
        "f24",
        "f26",
        "f28",
        "f30"
    };
    // clang-format on

    size_t index = reg - (int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0;

    assert(index % 2 == 0);
    index /= 2;
    assert(index < std::size(regs));
    return regs[index];
}

void dump_instr(int i);

void dump_cond_branch(int i, const char* lhs, const char* op, const char* rhs) {
    Insn& insn = insns[i];
    const char* cast1 = "";
    const char* cast2 = "";

    if (strcmp(op, "==") && strcmp(op, "!=")) {
        cast1 = "(int)";
        if (strcmp(rhs, "0")) {
            cast2 = "(int)";
        }
    }
    printf("if (%s%s %s %s%s) {\n", cast1, lhs, op, cast2, rhs);
    dump_instr(i + 1);

    uint32_t addr = insn.getAddress();

    printf("goto L%x;}\n", addr);
}

void dump_cond_branch_likely(int i, const char* lhs, const char* op, const char* rhs) {
    uint32_t target = text_vaddr + (i + 2) * sizeof(uint32_t);

    dump_cond_branch(i, lhs, op, rhs);
    if (!TRACE) {
        printf("else goto L%x;\n", target);
    } else {
        printf("else {printf(\"pc=0x%08x (ignored)\\n\"); goto L%x;}\n", text_vaddr + (i + 1) * 4, target);
    }
    label_addresses.insert(target);
}

void dump_jal(int i, uint32_t imm) {
    string_view name;
    auto it = symbol_names.find(imm);
    const ExternFunction* found_fn = nullptr;

    // Check for an external function at the address in the immediate. If it does not exist, function is internal
    if (it != symbol_names.end()) {
        name = it->second;
        for (auto& fn : extern_functions) {
            if (name == fn.name) {
                found_fn = &fn;
                break;
            }
        }
    }

    dump_instr(i + 1);

    if (found_fn != nullptr) {
        if (found_fn->flags & FLAG_VARARG) {
            for (int j = 0; j < 4; j++) {
                printf("MEM_U32(sp + %d) = %s;\n", j * 4, r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + j));
            }
        }

        const char ret_type = found_fn->params[0];

        switch (ret_type) {
            case 'v':
                break;

            case 'i':
            case 'u':
            case 'p':
                printf("%s = ", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0));
                break;

            case 'f':
                printf("%s = ", fr((int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0));
                break;

            case 'd':
                printf("tempf64 = ");
                break;

            case 'l':
            case 'j':
                printf("temp64 = ");
                break;
        }

        printf("wrapper_%s(", string(name).c_str());

        bool first = true;

        if (!(found_fn->flags & FLAG_NO_MEM)) {
            printf("mem");
            first = false;
        }

        int pos = 0;
        int pos_float = 0;
        bool only_floats_so_far = true;
        bool needs_sp = false;

        for (const char* p = &found_fn->params[1]; *p != '\0'; ++p) {
            if (!first) {
                printf(", ");
            }

            first = false;

            switch (*p) {
                case 't':
                    printf("trampoline, ");
                    needs_sp = true;
                    // fallthrough
                case 'i':
                case 'u':
                case 'p':
                    only_floats_so_far = false;
                    if (pos < 4) {
                        printf("%s", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos));
                    } else {
                        printf("MEM_%c32(sp + %d)", *p == 'i' ? 'S' : 'U', pos * 4);
                    }
                    ++pos;
                    break;

                case 'f':
                    if (only_floats_so_far && pos_float < 4) {
                        printf("%s", fr((int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fa0 + pos_float));
                        pos_float += 2;
                    } else if (pos < 4) {
                        printf("BITCAST_U32_TO_F32(%s)", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos));
                    } else {
                        printf("BITCAST_U32_TO_F32(MEM_U32(sp + %d))", pos * 4);
                    }
                    ++pos;
                    break;

                case 'd':
                    if (pos % 1 != 0) {
                        ++pos;
                    }
                    if (only_floats_so_far && pos_float < 4) {
                        printf("double_from_FloatReg(%s)",
                               dr((int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fa0 + pos_float));
                        pos_float += 2;
                    } else if (pos < 4) {
                        printf("BITCAST_U64_TO_F64(((uint64_t)%s << 32) | (uint64_t)%s)",
                               r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos),
                               r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos + 1));
                    } else {
                        printf("BITCAST_U64_TO_F64(((uint64_t)MEM_U32(sp + %d) << 32) | "
                               "(uint64_t)MEM_U32(sp + "
                               "%d))",
                               pos * 4, (pos + 1) * 4);
                    }
                    pos += 2;
                    break;

                case 'l':
                case 'j':
                    if (pos % 1 != 0) {
                        ++pos;
                    }
                    only_floats_so_far = false;
                    if (*p == 'l') {
                        printf("(int64_t)");
                    }
                    if (pos < 4) {
                        printf("(((uint64_t)%s << 32) | (uint64_t)%s)",
                               r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos),
                               r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + pos + 1));
                    } else {
                        printf("(((uint64_t)MEM_U32(sp + %d) << 32) | (uint64_t)MEM_U32(sp + %d))", pos * 4,
                               (pos + 1) * 4);
                    }
                    pos += 2;
                    break;
            }
        }

        if ((found_fn->flags & FLAG_VARARG) || needs_sp) {
            printf("%s%s", first ? "" : ", ", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_sp));
        }

        printf(");\n");

        if (ret_type == 'l' || ret_type == 'j') {
            printf("%s = (uint32_t)(temp64 >> 32);\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0));
            printf("%s = (uint32_t)temp64;\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1));
        } else if (ret_type == 'd') {
            printf("%s = FloatReg_from_double(tempf64);\n", dr((int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0));
        }
    } else {
        Function& f = functions.find(imm)->second;

        if (f.nret == 1) {
            printf("v0 = ");
        } else if (f.nret == 2) {
            printf("temp64 = ");
        }

        if (!name.empty()) {
            printf("f_%s", string(name).c_str());
        } else {
            printf("func_%x", imm);
        }

        printf("(mem, sp");

        if (f.v0_in) {
            printf(", %s", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0));
        }

        for (uint32_t i = 0; i < f.nargs; i++) {
            printf(", %s", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + i));
        }

        printf(");\n");

        if (f.nret == 2) {
            printf("%s = (uint32_t)(temp64 >> 32);\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0));
            printf("%s = (uint32_t)temp64;\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1));
        }
    }

    printf("goto L%x;\n", text_vaddr + (i + 2) * 4);
    label_addresses.insert(text_vaddr + (i + 2) * 4);
}

void dump_instr(int i) {
    Insn& insn = insns[i];

    const char* symbol_name = NULL;
    if (symbol_names.count(text_vaddr + i * sizeof(uint32_t)) != 0) {
        symbol_name = symbol_names[text_vaddr + i * sizeof(uint32_t)].c_str();
        printf("//%s:\n", symbol_name);
    }

    if (TRACE) {
        printf("++cnt; printf(\"pc=0x%08x%s%s\\n\"); ", text_vaddr + i * 4, symbol_name ? " " : "",
               symbol_name ? symbol_name : "");
    }

    uint64_t src_regs_map;
    if (!insn.instruction.isJump() && !insn.instruction.isBranch() && !conservative) {
        switch (insn_to_type(insn)) {
            case TYPE_S:
                src_regs_map = get_all_source_reg_mask(insn.instruction);
                if (!((insn.f_livein & src_regs_map) == src_regs_map)) {
                    printf("// fdead %llx ", (unsigned long long)insn.f_livein);
                }
                break;

            case TYPE_D_S: {
                uint64_t reg_mask = get_all_source_reg_mask(insn.instruction);

                if ((insn.f_livein & reg_mask) != reg_mask) {
                    printf("// fdead %llx ", (unsigned long long)insn.f_livein);
                    break;
                }
            }
                // fallthrough
            case TYPE_D:
                if (!(insn.b_liveout & get_dest_reg_mask(insn))) {
#if 0
                    printf("// %i bdead %llx %llx ", i, (unsigned long long)insn.b_liveout,
                           (unsigned long long)get_dest_reg_mask(insn));
#else
                    printf("// bdead %llx ", (unsigned long long)insn.b_liveout);
#endif
                }
                break;

            case TYPE_NOP:
                break;
        }
    }

    int32_t imm;
    char buf[0x100];
    switch (insn.instruction.getUniqueId()) {
        case rabbitizer::InstrId::UniqueId::cpu_add:
        case rabbitizer::InstrId::UniqueId::cpu_addu:
            if (insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero) {
                printf("%s = %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rt()));
            } else if (insn.instruction.GetO32_rt() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero) {
                printf("%s = %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()));
            } else {
                printf("%s = %s + %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                       r((int)insn.instruction.GetO32_rt()));
            }
            break;

        case rabbitizer::InstrId::UniqueId::cpu_add_s:
            printf("%s = %s + %s;\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()),
                   fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_add_d:
            printf("%s = FloatReg_from_double(double_from_FloatReg(%s) + double_from_FloatReg(%s));\n",
                   dr((int)insn.instruction.GetO32_fd()), dr((int)insn.instruction.GetO32_fs()),
                   dr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_addi:
        case rabbitizer::InstrId::UniqueId::cpu_addiu:
            imm = insn.getImmediate();
            if (insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero) {
                printf("%s = 0x%x;\n", r((int)insn.instruction.GetO32_rt()), imm);
            } else {
                printf("%s = %s + 0x%x;\n", r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()),
                       imm);
            }
            break;

        case rabbitizer::InstrId::UniqueId::cpu_and:
            printf("%s = %s & %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_andi:
            imm = insn.getImmediate();
            printf("%s = %s & 0x%x;\n", r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()),
                   imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_beq:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), "==", r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_beql:
            dump_cond_branch_likely(i, r((int)insn.instruction.GetO32_rs()),
                                    "==", r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bgez:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), ">=", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bgezl:
            dump_cond_branch_likely(i, r((int)insn.instruction.GetO32_rs()), ">=", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bgtz:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), ">", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bgtzl:
            dump_cond_branch_likely(i, r((int)insn.instruction.GetO32_rs()), ">", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_blez:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), "<=", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_blezl:
            dump_cond_branch_likely(i, r((int)insn.instruction.GetO32_rs()), "<=", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bltz:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), "<", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bltzl:
            dump_cond_branch_likely(i, r((int)insn.instruction.GetO32_rs()), "<", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bne:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), "!=", r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bnel:
            dump_cond_branch_likely(i, r((int)insn.instruction.GetO32_rs()),
                                    "!=", r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_break:
            printf("abort();\n");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_beqz:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), "==", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_b:
            dump_instr(i + 1);
            imm = insn.getAddress();
            printf("goto L%x;\n", imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bc1f:
            printf("if (!cf) {\n");
            dump_instr(i + 1);
            imm = insn.getAddress();
            printf("goto L%x;}\n", imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bc1t:
            printf("if (cf) {\n");
            dump_instr(i + 1);
            imm = insn.getAddress();
            printf("goto L%x;}\n", imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_bc1fl: {
            uint32_t target = text_vaddr + (i + 2) * sizeof(uint32_t);
            printf("if (!cf) {\n");
            dump_instr(i + 1);
            imm = insn.getAddress();
            printf("goto L%x;}\n", imm);
            if (!TRACE) {
                printf("else goto L%x;\n", target);
            } else {
                printf("else {printf(\"pc=0x%08x (ignored)\\n\"); goto L%x;}\n", text_vaddr + (i + 1) * 4, target);
            }
            label_addresses.insert(target);
        } break;

        case rabbitizer::InstrId::UniqueId::cpu_bc1tl: {
            uint32_t target = text_vaddr + (i + 2) * sizeof(uint32_t);
            printf("if (cf) {\n");
            dump_instr(i + 1);
            imm = insn.getAddress();
            printf("goto L%x;}\n", imm);
            if (!TRACE) {
                printf("else goto L%x;\n", target);
            } else {
                printf("else {printf(\"pc=0x%08x (ignored)\\n\"); goto L%x;}\n", text_vaddr + (i + 1) * 4, target);
            }
            label_addresses.insert(target);
        } break;

        case rabbitizer::InstrId::UniqueId::cpu_bnez:
            dump_cond_branch(i, r((int)insn.instruction.GetO32_rs()), "!=", "0");
            break;

        case rabbitizer::InstrId::UniqueId::cpu_c_lt_s:
            printf("cf = %s < %s;\n", fr((int)insn.instruction.GetO32_fs()), fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_c_le_s:
            printf("cf = %s <= %s;\n", fr((int)insn.instruction.GetO32_fs()), fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_c_eq_s:
            printf("cf = %s == %s;\n", fr((int)insn.instruction.GetO32_fs()), fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_c_lt_d:
            printf("cf = double_from_FloatReg(%s) < double_from_FloatReg(%s);\n", dr((int)insn.instruction.GetO32_fs()),
                   dr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_c_le_d:
            printf("cf = double_from_FloatReg(%s) <= double_from_FloatReg(%s);\n",
                   dr((int)insn.instruction.GetO32_fs()), dr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_c_eq_d:
            printf("cf = double_from_FloatReg(%s) == double_from_FloatReg(%s);\n",
                   dr((int)insn.instruction.GetO32_fs()), dr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_s_w:
            printf("%s = (int)%s;\n", fr((int)insn.instruction.GetO32_fd()), wr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_d_w:
            printf("%s = FloatReg_from_double((int)%s);\n", dr((int)insn.instruction.GetO32_fd()),
                   wr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_d_s:
            printf("%s = FloatReg_from_double(%s);\n", dr((int)insn.instruction.GetO32_fd()),
                   fr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_s_d:
            printf("%s = double_from_FloatReg(%s);\n", fr((int)insn.instruction.GetO32_fd()),
                   dr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_w_d:
            printf("%s = cvt_w_d(double_from_FloatReg(%s));\n", wr((int)insn.instruction.GetO32_fd()),
                   dr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_w_s:
            printf("%s = cvt_w_s(%s);\n", wr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_cvt_l_d:
        case rabbitizer::InstrId::UniqueId::cpu_cvt_l_s:
        case rabbitizer::InstrId::UniqueId::cpu_cvt_s_l:
        case rabbitizer::InstrId::UniqueId::cpu_cvt_d_l:
            goto unimplemented;

        case rabbitizer::InstrId::UniqueId::cpu_cfc1:
            assert(insn.instruction.Get_cop1cs() == rabbitizer::Registers::Cpu::Cop1Control::COP1_CONTROL_FpcCsr);
            printf("%s = fcsr;\n", r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_ctc1:
            assert(insn.instruction.Get_cop1cs() == rabbitizer::Registers::Cpu::Cop1Control::COP1_CONTROL_FpcCsr);
            printf("fcsr = %s;\n", r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_div:
            printf("lo = (int)%s / (int)%s; ", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            printf("hi = (int)%s %% (int)%s;\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_divu:
            printf("lo = %s / %s; ", r((int)insn.instruction.GetO32_rs()), r((int)insn.instruction.GetO32_rt()));
            printf("hi = %s %% %s;\n", r((int)insn.instruction.GetO32_rs()), r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_div_s:
            printf("%s = %s / %s;\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()),
                   fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_div_d:
            printf("%s = FloatReg_from_double(double_from_FloatReg(%s) / double_from_FloatReg(%s));\n",
                   dr((int)insn.instruction.GetO32_fd()), dr((int)insn.instruction.GetO32_fs()),
                   dr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mov_s:
            printf("%s = %s;\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mov_d:
            printf("%s = %s;\n", dr((int)insn.instruction.GetO32_fd()), dr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mul_s:
            printf("%s = %s * %s;\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()),
                   fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mul_d:
            printf("%s = FloatReg_from_double(double_from_FloatReg(%s) * double_from_FloatReg(%s));\n",
                   dr((int)insn.instruction.GetO32_fd()), dr((int)insn.instruction.GetO32_fs()),
                   dr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_negu:
            printf("%s = -%s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_neg_s:
            printf("%s = -%s;\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_neg_d:
            printf("%s = FloatReg_from_double(-double_from_FloatReg(%s));\n", dr((int)insn.instruction.GetO32_fd()),
                   dr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sub:
            if (insn.instruction.GetO32_rs() == rabbitizer::Registers::Cpu::GprO32::GPR_O32_zero) {
                printf("%s = -%s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rt()));
                break;
            } else {
                goto unimplemented;
            }

        case rabbitizer::InstrId::UniqueId::cpu_sub_s:
            printf("%s = %s - %s;\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()),
                   fr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sub_d:
            printf("%s = FloatReg_from_double(double_from_FloatReg(%s) - double_from_FloatReg(%s));\n",
                   dr((int)insn.instruction.GetO32_fd()), dr((int)insn.instruction.GetO32_fs()),
                   dr((int)insn.instruction.GetO32_ft()));
            break;

            // Jumps

        case rabbitizer::InstrId::UniqueId::cpu_j:
            dump_instr(i + 1);
            imm = insn.getAddress();
            printf("goto L%x;\n", imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_jal:
            imm = insn.getAddress();
            dump_jal(i, imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_jalr:
            printf("fp_dest = %s;\n", r((int)insn.instruction.GetO32_rs()));
            dump_instr(i + 1);
            printf("temp64 = trampoline(mem, sp, %s, %s, %s, %s, fp_dest);\n",
                   r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0),
                   r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a1),
                   r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a2),
                   r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a3));
            printf("%s = (uint32_t)(temp64 >> 32);\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0));
            printf("%s = (uint32_t)temp64;\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v1));
            printf("goto L%x;\n", text_vaddr + (i + 2) * 4);
            label_addresses.insert(text_vaddr + (i + 2) * 4);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_jr:
            // TODO: understand why the switch version fails, and why only it needs the nop
            if (insn.jtbl_addr != 0) {
                uint32_t jtbl_pos = insn.jtbl_addr - rodata_vaddr;

                assert(jtbl_pos < rodata_section_len &&
                       jtbl_pos + insn.num_cases * sizeof(uint32_t) <= rodata_section_len);
#if 1
                printf(";static void *const Lswitch%x[] = {\n", insn.jtbl_addr);

                for (uint32_t i = 0; i < insn.num_cases; i++) {
                    uint32_t dest_addr = read_u32_be(rodata_section + jtbl_pos + i * sizeof(uint32_t)) + gp_value;
                    printf("&&L%x,\n", dest_addr);
                    label_addresses.insert(dest_addr);
                }

                printf("};\n");
                printf("dest = Lswitch%x[%s];\n", insn.jtbl_addr, r((int)insn.index_reg));
                dump_instr(i + 1);
                printf("goto *dest;\n");
#else
                // This block produces a switch instead of an array of labels.
                // It is not being used because currently it is a bit bugged.
                // It has been keep as a reference and with the main intention to fix it

                assert(insns[i + 1].id == MIPS_INS_NOP);
                printf("switch (%s) {\n", r(insn.index_reg));

                for (uint32_t i = 0; i < insn.num_cases; i++) {
                    uint32_t dest_addr = read_u32_be(rodata_section + jtbl_pos + i * sizeof(uint32_t)) + gp_value;
                    printf("case %u: goto L%x;\n", i, dest_addr);
                    label_addresses.insert(dest_addr);
                }

                printf("}\n");
#endif
            } else {
                if (insn.instruction.GetO32_rs() != rabbitizer::Registers::Cpu::GprO32::GPR_O32_ra) {
                    printf("UNSUPPORTED JR %s    (no jumptable available)\n", r((int)insn.instruction.GetO32_rs()));
                } else {
                    dump_instr(i + 1);
                    switch (find_function(text_vaddr + i * sizeof(uint32_t))->second.nret) {
                        case 0:
                            printf("return;\n");
                            break;

                        case 1:
                            printf("return v0;\n");
                            break;

                        case 2:
                            printf("return ((uint64_t)v0 << 32) | v1;\n");
                            break;
                    }
                }
            }
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lb:
            imm = insn.getImmediate();
            printf("%s = MEM_S8(%s + %d);\n", r((int)insn.instruction.GetO32_rt()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lbu:
            imm = insn.getImmediate();
            printf("%s = MEM_U8(%s + %d);\n", r((int)insn.instruction.GetO32_rt()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lh:
            imm = insn.getImmediate();
            printf("%s = MEM_S16(%s + %d);\n", r((int)insn.instruction.GetO32_rt()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lhu:
            imm = insn.getImmediate();
            printf("%s = MEM_U16(%s + %d);\n", r((int)insn.instruction.GetO32_rt()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lui:
            imm = insn.getImmediate();
            printf("%s = 0x%x;\n", r((int)insn.instruction.GetO32_rt()), imm << 16);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lw:
            imm = insn.getImmediate();
            printf("%s = MEM_U32(%s + %d);\n", r((int)insn.instruction.GetO32_rt()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lwc1:
            imm = insn.getImmediate();
            printf("%s = MEM_U32(%s + %d);\n", wr((int)insn.instruction.GetO32_ft()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_ldc1:
            imm = insn.getImmediate();
            assert(((int)insn.instruction.GetO32_ft() - (int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0) % 2 ==
                   0);
            printf("%s = MEM_U32(%s + %d);\n", wr((int)insn.instruction.GetO32_ft() + 1),
                   r((int)insn.instruction.GetO32_rs()), imm);
            printf("%s = MEM_U32(%s + %d + 4);\n", wr((int)insn.instruction.GetO32_ft()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_lwl: {
            const char* reg = r((int)insn.instruction.GetO32_rt());

            imm = insn.getImmediate();

            printf("%s = %s + %d; ", reg, r((int)insn.instruction.GetO32_rs()), imm);
            printf("%s = ((uint32_t)MEM_U8(%s) << 24) | (MEM_U8(%s + 1) << 16) | (MEM_U8(%s + 2) << 8) | MEM_U8(%s + 3);\n", reg,
                   reg, reg, reg, reg);
        } break;

        case rabbitizer::InstrId::UniqueId::cpu_lwr:
            printf("//%s\n", insn.disassemble().c_str());
            break;

        case UniqueId_cpu_la: {
            uint32_t addr = insn.getAddress();

            printf("%s = 0x%x;", r((int)insn.lila_dst_reg), addr);
            if ((text_vaddr <= addr) && (addr < text_vaddr + text_section_len)) {
                printf(" // function pointer");
                label_addresses.insert(addr);
            }
            printf("\n");
        } break;

        case UniqueId_cpu_li:
            imm = insn.getImmediate();

            printf("%s = 0x%x;\n", r((int)insn.lila_dst_reg), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mfc1:
            printf("%s = %s;\n", r((int)insn.instruction.GetO32_rt()), wr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mfhi:
            printf("%s = hi;\n", r((int)insn.instruction.GetO32_rd()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mflo:
            printf("%s = lo;\n", r((int)insn.instruction.GetO32_rd()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_move:
            printf("%s = %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mtc1:
            printf("%s = %s;\n", wr((int)insn.instruction.GetO32_fs()), r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_mult:
            printf("lo = %s * %s;\n", r((int)insn.instruction.GetO32_rs()), r((int)insn.instruction.GetO32_rt()));
            printf("hi = (uint32_t)((int64_t)(int)%s * (int64_t)(int)%s >> 32);\n",
                   r((int)insn.instruction.GetO32_rs()), r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_multu:
            printf("lo = %s * %s;\n", r((int)insn.instruction.GetO32_rs()), r((int)insn.instruction.GetO32_rt()));
            printf("hi = (uint32_t)((uint64_t)%s * (uint64_t)%s >> 32);\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sqrt_s:
            printf("%s = sqrtf(%s);\n", fr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_nor:
            printf("%s = ~(%s | %s);\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_not:
            printf("%s = ~%s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_or:
            printf("%s = %s | %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_ori:
            imm = insn.getImmediate();
            printf("%s = %s | 0x%x;\n", r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()),
                   imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sb:
            imm = insn.getImmediate();
            printf("MEM_U8(%s + %d) = (uint8_t)%s;\n", r((int)insn.instruction.GetO32_rs()), imm,
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sh:
            imm = insn.getImmediate();
            printf("MEM_U16(%s + %d) = (uint16_t)%s;\n", r((int)insn.instruction.GetO32_rs()), imm,
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sll:
            printf("%s = %s << %d;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rt()),
                   insn.instruction.Get_sa());
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sllv:
            printf("%s = %s << (%s & 0x1f);\n", r((int)insn.instruction.GetO32_rd()),
                   r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_slt:
            printf("%s = (int)%s < (int)%s;\n", r((int)insn.instruction.GetO32_rd()),
                   r((int)insn.instruction.GetO32_rs()), r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_slti:
            imm = insn.getImmediate();
            printf("%s = (int)%s < (int)0x%x;\n", r((int)insn.instruction.GetO32_rt()),
                   r((int)insn.instruction.GetO32_rs()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sltiu:
            imm = insn.getImmediate();
            printf("%s = %s < 0x%x;\n", r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()),
                   imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sltu:
            printf("%s = %s < %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sra:
            printf("%s = (int)%s >> %d;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rt()),
                   insn.instruction.Get_sa());
            break;

        case rabbitizer::InstrId::UniqueId::cpu_srav:
            printf("%s = (int)%s >> (%s & 0x1f);\n", r((int)insn.instruction.GetO32_rd()),
                   r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_srl:
            printf("%s = %s >> %d;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rt()),
                   insn.instruction.Get_sa());
            break;

        case rabbitizer::InstrId::UniqueId::cpu_srlv:
            printf("%s = %s >> (%s & 0x1f);\n", r((int)insn.instruction.GetO32_rd()),
                   r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_subu:
            printf("%s = %s - %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sw:
            imm = insn.getImmediate();
            printf("MEM_U32(%s + %d) = %s;\n", r((int)insn.instruction.GetO32_rs()), imm,
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_swc1:
            imm = insn.getImmediate();
            printf("MEM_U32(%s + %d) = %s;\n", r((int)insn.instruction.GetO32_rs()), imm,
                   wr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_sdc1:
            assert(((int)insn.instruction.GetO32_ft() - (int)rabbitizer::Registers::Cpu::Cop1O32::COP1_O32_fv0) % 2 ==
                   0);
            imm = insn.getImmediate();
            printf("MEM_U32(%s + %d) = %s;\n", r((int)insn.instruction.GetO32_rs()), imm,
                   wr((int)insn.instruction.GetO32_ft() + 1));
            printf("MEM_U32(%s + %d + 4) = %s;\n", r((int)insn.instruction.GetO32_rs()), imm,
                   wr((int)insn.instruction.GetO32_ft()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_swl:
            imm = insn.getImmediate();
            for (int i = 0; i < 4; i++) {
                printf("MEM_U8(%s + %d + %d) = (uint8_t)(%s >> %d);\n", r((int)insn.instruction.GetO32_rs()), imm, i,
                       r((int)insn.instruction.GetO32_rt()), (3 - i) * 8);
            }
            break;

        case rabbitizer::InstrId::UniqueId::cpu_swr:
            printf("//%s\n", insn.disassemble().c_str());
            break;

        case rabbitizer::InstrId::UniqueId::cpu_trunc_w_s:
            printf("%s = (int)%s;\n", wr((int)insn.instruction.GetO32_fd()), fr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_trunc_w_d:
            printf("%s = (int)double_from_FloatReg(%s);\n", wr((int)insn.instruction.GetO32_fd()),
                   dr((int)insn.instruction.GetO32_fs()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_trunc_l_d:
        case rabbitizer::InstrId::UniqueId::cpu_trunc_l_s:
            goto unimplemented;

        case rabbitizer::InstrId::UniqueId::cpu_xor:
            printf("%s = %s ^ %s;\n", r((int)insn.instruction.GetO32_rd()), r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()));
            break;

        case rabbitizer::InstrId::UniqueId::cpu_xori:
            imm = insn.getImmediate();
            printf("%s = %s ^ 0x%x;\n", r((int)insn.instruction.GetO32_rt()), r((int)insn.instruction.GetO32_rs()),
                   imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_tne:
            imm = insn.instruction.Get_code_lower();
            printf("assert(%s == %s && \"tne %d\");\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_teq:
            imm = insn.instruction.Get_code_lower();
            printf("assert(%s != %s && \"teq %d\");\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_tge:
            imm = insn.instruction.Get_code_lower();
            printf("assert((int)%s < (int)%s && \"tge %d\");\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_tgeu:
            imm = insn.instruction.Get_code_lower();
            printf("assert(%s < %s && \"tgeu %d\");\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_tlt:
            imm = insn.instruction.Get_code_lower();
            printf("assert((int)%s >= (int)%s && \"tlt %d\");\n", r((int)insn.instruction.GetO32_rs()),
                   r((int)insn.instruction.GetO32_rt()), imm);
            break;

        case rabbitizer::InstrId::UniqueId::cpu_nop:
            printf("//nop;\n");
            break;

        default:
        unimplemented:
            printf("UNIMPLEMENTED 0x%X : %s\n", insn.instruction.getRaw(), insn.disassemble().c_str());
            break;
    }
}

void inspect_data_function_pointers(vector<pair<uint32_t, uint32_t>>& ret, const uint8_t* section,
                                    uint32_t section_vaddr, uint32_t len) {
    for (uint32_t i = 0; i < len; i += 4) {
        uint32_t addr = read_u32_be(section + i);

        if (addr == 0x430b00 || addr == 0x433b00) {
            // in as1, not function pointers (normal integers)
            continue;
        }

        if (addr == 0x4a0000) {
            // in copt
            continue;
        }

        if (section_vaddr + i >= procedure_table_start &&
            section_vaddr + i < procedure_table_start + procedure_table_len) {
            // some linking table with a "all" functions, in as1 5.3
            continue;
        }

        if ((addr >= text_vaddr) && (addr < text_vaddr + text_section_len) && ((addr % 4) == 0)) {
#if INSPECT_FUNCTION_POINTERS
            fprintf(stderr, "assuming function pointer 0x%x at 0x%x\n", addr, section_vaddr + i);
#endif
            ret.push_back(make_pair(section_vaddr + i, addr));
            label_addresses.insert(addr);
            functions[addr].referenced_by_function_pointer = true;
        }
    }
}

void dump_function_signature(Function& f, uint32_t vaddr) {
    printf("static ");
    switch (f.nret) {
        case 0:
            printf("void ");
            break;

        case 1:
            printf("uint32_t ");
            break;

        case 2:
            printf("uint64_t ");
            break;
    }

    auto name_it = symbol_names.find(vaddr);

    if (name_it != symbol_names.end()) {
        printf("f_%s", name_it->second.c_str());
    } else {
        printf("func_%x", vaddr);
    }

    printf("(uint8_t *mem, uint32_t sp");

    if (f.v0_in) {
        printf(", uint32_t %s", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_v0));
    }

    for (uint32_t i = 0; i < f.nargs; i++) {
        printf(", uint32_t %s", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + i));
    }

    printf(")");
}

void dump_c(void) {
    map<string, uint32_t> symbol_names_inv;

    for (auto& it : symbol_names) {
        symbol_names_inv[it.second] = it.first;
    }

    uint32_t min_addr = UINT32_MAX;
    uint32_t max_addr = 0;

    if (data_section_len > 0) {
        min_addr = std::min(min_addr, data_vaddr);
        max_addr = std::max(max_addr, data_vaddr + data_section_len);
    }
    if (rodata_section_len > 0) {
        min_addr = std::min(min_addr, rodata_vaddr);
        max_addr = std::max(max_addr, rodata_vaddr + rodata_section_len);
    }
    if (bss_section_len) {
        min_addr = std::min(min_addr, bss_vaddr);
        max_addr = std::max(max_addr, bss_vaddr + bss_section_len);
    }

    // 64 kB. Supposedly the worst-case smallest permitted page size, increase if necessary.
    // Ensures the hardcoded min_addr and max_addr are sufficiently aligned for the machine running the
    // recompiled binaries (and not just the one doing the original recomp build).
    uint32_t page_size = 0x10000;

    min_addr = min_addr & ~(page_size - 1);
    max_addr = (max_addr + (page_size - 1)) & ~(page_size - 1);

    uint32_t stack_bottom = min_addr;
    min_addr -= 0x100000; // 1 MB stack
    stack_bottom -= 0x10; // for main's stack frame

    printf("#include \"header.h\"\n");

    if (conservative) {
        printf("static uint32_t s0, s1, s2, s3, s4, s5, s6, s7, fp;\n");
    }

    printf("static const uint32_t rodata[] = {\n");

    for (size_t i = 0; i < rodata_section_len; i += 4) {
        printf("0x%x,%s", read_u32_be(rodata_section + i), i % 32 == 28 ? "\n" : "");
    }

    printf("};\n");
    printf("static const uint32_t data[] = {\n");

    for (size_t i = 0; i < data_section_len; i += 4) {
        printf("0x%x,%s", read_u32_be(data_section + i), i % 32 == 28 ? "\n" : "");
    }

    printf("};\n");

    /* if (!data_function_pointers.empty()) {
        printf("static const struct { uint32_t orig_addr; void *recompiled_addr; } data_function_pointers[] = {\n");
        for (auto item : data_function_pointers) {
            printf("{0x%x, &&L%x},\n", item.first, item.second);
        }
        printf("};\n");
    } */

    if (TRACE) {
        printf("static unsigned long long int cnt = 0;\n");
    }

    for (auto& f_it : functions) {
        uint32_t addr = f_it.first;
        auto& ins = insns.at(addr_to_i(addr));

        if (ins.f_livein != 0) {
            // Function is used
            dump_function_signature(f_it.second, addr);
            printf(";\n");
        }
    }

    if (!data_function_pointers.empty() || !la_function_pointers.empty()) {
        printf("uint64_t trampoline(uint8_t *mem, uint32_t sp, uint32_t a0, uint32_t a1, uint32_t a2, uint32_t a3, "
               "uint32_t fp_dest) {\n");
        printf("switch (fp_dest) {\n");

        for (auto& it : functions) {
            Function& f = it.second;

            if (f.referenced_by_function_pointer) {
                printf("case 0x%x: ", it.first);

                if (f.nret == 1) {
                    printf("return (uint64_t)");
                } else if (f.nret == 2) {
                    printf("return ");
                }

                auto name_it = symbol_names.find(it.first);

                if (name_it != symbol_names.end()) {
                    printf("f_%s", name_it->second.c_str());
                } else {
                    printf("func_%x", it.first);
                }

                printf("(mem, sp");

                for (unsigned int i = 0; i < f.nargs; i++) {
                    printf(", a%d", i);
                }

                printf(")");

                if (f.nret == 1) {
                    printf(" << 32");
                }

                printf(";");

                if (f.nret == 0) {
                    printf(" return 0;");
                }

                printf("\n");
            }
        }

        printf("default: abort();");
        printf("}\n");
        printf("}\n");
    }

    printf("int run(uint8_t *mem, int argc, char *argv[]) {\n");
    printf("mmap_initial_data_range(mem, 0x%x, 0x%x);\n", min_addr, max_addr);

    printf("memcpy(mem + 0x%x, rodata, 0x%x);\n", rodata_vaddr, rodata_section_len);
    printf("memcpy(mem + 0x%x, data, 0x%x);\n", data_vaddr, data_section_len);

    /* if (!data_function_pointers.empty()) {
        if (!LABELS_64_BIT) {
            printf("for (int i = 0; i < %d; i++) MEM_U32(data_function_pointers[i].orig_addr) =
    (uint32_t)(uintptr_t)data_function_pointers[i].recompiled_addr;\n", (int)data_function_pointers.size()); } else {
            printf("for (int i = 0; i < %d; i++) MEM_U32(data_function_pointers[i].orig_addr) =
    (uint32_t)((uintptr_t)data_function_pointers[i].recompiled_addr - (uintptr_t)&&Loffset);\n",
    (int)data_function_pointers.size());
        }
    } */

    printf("MEM_S32(0x%x) = argc;\n", symbol_names_inv.at("__Argc"));
    printf("MEM_S32(0x%x) = argc;\n", stack_bottom);
    printf("uint32_t al = argc * 4; for (int i = 0; i < argc; i++) al += strlen(argv[i]) + 1;\n");
    printf("uint32_t arg_addr = wrapper_malloc(mem, al);\n");
    printf("MEM_U32(0x%x) = arg_addr;\n", symbol_names_inv.at("__Argv"));
    printf("MEM_U32(0x%x) = arg_addr;\n", stack_bottom + 4);
    printf("uint32_t arg_strpos = arg_addr + argc * 4;\n");
    printf("for (int i = 0; i < argc; i++) {MEM_U32(arg_addr + i * 4) = arg_strpos; uint32_t p = 0; do { "
           "MEM_S8(arg_strpos) = argv[i][p]; ++arg_strpos; } while (argv[i][p++] != '\\0');}\n");

    printf("setup_libc_data(mem);\n");

    // printf("gp = 0x%x;\n", gp_value); // only to recreate the outcome when ugen reads uninitialized stack memory

    printf("int ret = f_main(mem, 0x%x", stack_bottom);

    Function& main_func = functions[main_addr];

    if (main_func.nargs >= 1) {
        printf(", argc");
    }

    if (main_func.nargs >= 2) {
        printf(", arg_addr");
    }

    printf(");\n");

    if (TRACE) {
        printf("end: fprintf(stderr, \"cnt: %%llu\\n\", cnt);\n");
    }

    printf("return ret;\n");
    printf("}\n");

    for (auto& f_it : functions) {
        Function& f = f_it.second;
        uint32_t start_addr = f_it.first;
        uint32_t end_addr = f.end_addr;

        if (insns[addr_to_i(start_addr)].f_livein == 0) {
            // Non-used function, skip
            continue;
        }

        printf("\n");
        dump_function_signature(f, start_addr);
        printf(" {\n");
        printf("const uint32_t zero = 0;\n");

        if (!conservative) {
            printf("uint32_t at = 0, v1 = 0, t0 = 0, t1 = 0, t2 = 0,\n");
            printf("t3 = 0, t4 = 0, t5 = 0, t6 = 0, t7 = 0, s0 = 0, s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 0,\n");
            printf("s6 = 0, s7 = 0, t8 = 0, t9 = 0, gp = 0, fp = 0, s8 = 0, ra = 0;\n");
        } else {
            printf("uint32_t at = 0, v1 = 0, t0 = 0, t1 = 0, t2 = 0,\n");
            printf("t3 = 0, t4 = 0, t5 = 0, t6 = 0, t7 = 0, t8 = 0, t9 = 0, gp = 0x10000, ra = 0x10000;\n");
        }

        printf("uint32_t lo = 0, hi = 0;\n");
        printf("int cf = 0;\n");
        printf("uint64_t temp64;\n");
        printf("double tempf64;\n");
        printf("uint32_t fp_dest;\n");
        printf("void *dest;\n");

        if (!f.v0_in) {
            printf("uint32_t v0 = 0;\n");
        }

        for (uint32_t j = f.nargs; j < 4; j++) {
            printf("uint32_t %s = 0;\n", r((int)rabbitizer::Registers::Cpu::GprO32::GPR_O32_a0 + j));
        }

        for (size_t i = addr_to_i(start_addr), end_i = addr_to_i(end_addr); i < end_i; i++) {
            Insn& insn = insns[i];
            uint32_t vaddr = text_vaddr + i * 4;
            if (label_addresses.count(vaddr)) {
                printf("L%x:\n", vaddr);
            }
#if DUMP_INSTRUCTIONS
            printf("// %s:\n", insn.disassemble().c_str());
#endif
            dump_instr(i);
        }

        printf("}\n");
    }
    /* for (size_t i = 0; i < insns.size(); i++) {
        Insn& insn = insns[i];
        uint32_t vaddr = text_vaddr + i * 4;
        auto fn_it = functions.find(vaddr);

        if (fn_it != functions.end()) {
            Function& f = fn_it->second;

            printf("}\n\n");

            switch (f.nret) {
                case 0:
                    printf("void ");
                    break;

                case 1:
                    printf("uint32_t ");
                    break;

                case 2:
                    printf("uint64_t ");
                    break;
            }

            auto name_it = symbol_names.find(vaddr);

            if (name_it != symbol_names.end()) {
                printf("%s", name_it->second.c_str());
            } else {
                printf("func_%x", vaddr);
            }

            printf("(uint8_t *mem, uint32_t sp");

            if (f.v0_in) {
                printf(", uint32_t %s", r(MIPS_REG_V0));
            }

            for (uint32_t i = 0; i < f.nargs; i++) {
                printf(", uint32_t %s", r(MIPS_REG_A0 + i));
            }

            printf(") {\n");
            printf("const uint32_t zero = 0;\n");
            printf("uint32_t at = 0, v1 = 0, t0 = 0, t1 = 0, t2 = 0,\n");
            printf("t3 = 0, t4 = 0, t5 = 0, t6 = 0, t7 = 0, s0 = 0, s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 0,\n");
            printf("s6 = 0, s7 = 0, t8 = 0, t9 = 0, gp = 0, fp = 0, s8 = 0, ra = 0;\n");
            printf("uint32_t lo = 0, hi = 0;\n");
            printf("int cf = 0;\n");

            if (!f.v0_in) {
                printf("uint32_t v0 = 0;\n");
            }

            for (uint32_t j = f.nargs; j < 4; j++) {
                printf("uint32_t %s = 0;\n", r(MIPS_REG_A0 + j));
            }
        }

        if (label_addresses.count(vaddr)) {
            printf("L%x:\n", vaddr);
        }

        dump_instr(i);
    } */
}

void parse_elf(const uint8_t* data, size_t file_len) {
    Elf32_Ehdr* ehdr;
    Elf32_Shdr *shdr, *str_shdr, *sym_shdr = NULL, *dynsym_shdr, *dynamic_shdr, *reginfo_shdr, *got_shdr,
                                 *sym_strtab = NULL, *sym_dynstr;
    int text_section_index = -1;
    int symtab_section_index = -1;
    int dynsym_section_index = -1;
    int reginfo_section_index = -1;
    int dynamic_section_index = -1;
    int got_section_index = -1;
    int rodata_section_index = -1;
    int data_section_index = -1;
    int bss_section_index = -1;
    uint32_t text_offset = 0;
    uint32_t vaddr_adj = 0;

    if (file_len < 4 || data[0] != 0x7f || data[1] != 'E' || data[2] != 'L' || data[3] != 'F') {
        fprintf(stderr, "Not an ELF file.\n");
        exit(EXIT_FAILURE);
    }

    ehdr = (Elf32_Ehdr*)data;
    if (ehdr->e_ident[EI_DATA] != 2 || u16be(ehdr->e_machine) != 8) {
        fprintf(stderr, "Not big-endian MIPS.\n");
        exit(EXIT_FAILURE);
    }

    if (u16be(ehdr->e_shstrndx) == 0) {
        // (We could look at program headers instead in this case.)
        fprintf(stderr, "Missing section headers; stripped binaries are not yet supported.\n");
        exit(EXIT_FAILURE);
    }

#define SECTION(index) (Elf32_Shdr*)(data + u32be(ehdr->e_shoff) + (index)*u16be(ehdr->e_shentsize))
#define STR(strtab, offset) (const char*)(data + u32be(strtab->sh_offset) + offset)

    str_shdr = SECTION(u16be(ehdr->e_shstrndx));
    for (int i = 0; i < u16be(ehdr->e_shnum); i++) {
        shdr = SECTION(i);

        const char* name = STR(str_shdr, u32be(shdr->sh_name));

        if (strcmp(name, ".text") == 0) {
            text_offset = u32be(shdr->sh_offset);
            text_vaddr = u32be(shdr->sh_addr);
            vaddr_adj = text_vaddr - u32be(shdr->sh_addr);
            text_section_len = u32be(shdr->sh_size);
            text_section = data + text_offset;
            text_section_index = i;
        }

        if (u32be(shdr->sh_type) == SHT_SYMTAB) {
            symtab_section_index = i;
        }

        if (u32be(shdr->sh_type) == SHT_DYNSYM) {
            dynsym_section_index = i;
        }

        if (u32be(shdr->sh_type) == SHT_MIPS_REGINFO) {
            reginfo_section_index = i;
        }

        if (u32be(shdr->sh_type) == SHT_DYNAMIC) {
            dynamic_section_index = i;
        }

        if (strcmp(name, ".got") == 0) {
            got_section_index = i;
        }

        if (strcmp(name, ".rodata") == 0) {
            rodata_section_index = i;
        }

        if (strcmp(name, ".data") == 0) {
            data_section_index = i;
        }

        if (strcmp(name, ".bss") == 0) {
            bss_section_index = i;
        }
    }

    if (text_section_index == -1) {
        fprintf(stderr, "Missing .text section.\n");
        exit(EXIT_FAILURE);
    }

    if (symtab_section_index == -1 && dynsym_section_index == -1) {
        fprintf(stderr, "Missing .symtab or .dynsym section.\n");
        exit(EXIT_FAILURE);
    }

    if (dynsym_section_index != -1) {
        if (reginfo_section_index == -1) {
            fprintf(stderr, "Missing .reginfo section.\n");
            exit(EXIT_FAILURE);
        }

        if (dynamic_section_index == -1) {
            fprintf(stderr, "Missing .dynamic section.\n");
            exit(EXIT_FAILURE);
        }

        if (got_section_index == -1) {
            fprintf(stderr, "Missing .got section.\n");
            exit(EXIT_FAILURE);
        }
    }

    if (rodata_section_index != -1) {
        shdr = SECTION(rodata_section_index);
        uint32_t size = u32be(shdr->sh_size);
        rodata_section = data + u32be(shdr->sh_offset);
        rodata_section_len = size;
        rodata_vaddr = u32be(shdr->sh_addr);
    }

    if (data_section_index != -1) {
        shdr = SECTION(data_section_index);
        uint32_t size = u32be(shdr->sh_size);
        data_section = data + u32be(shdr->sh_offset);
        data_section_len = size;
        data_vaddr = u32be(shdr->sh_addr);
    }

    if (bss_section_index != -1) {
        shdr = SECTION(bss_section_index);
        uint32_t size = u32be(shdr->sh_size);
        bss_section_len = size;
        bss_vaddr = u32be(shdr->sh_addr);
    }

    // add symbols
    if (symtab_section_index != -1) {
        sym_shdr = SECTION(symtab_section_index);
        sym_strtab = SECTION(u32be(sym_shdr->sh_link));
        assert(0 && ".symtab not supported - use a program with .dynsym instead");

        assert(u32be(sym_shdr->sh_entsize) == sizeof(Elf32_Sym));
        for (uint32_t i = 0; i < u32be(sym_shdr->sh_size); i += sizeof(Elf32_Sym)) {
            Elf32_Sym* sym = (Elf32_Sym*)(data + u32be(sym_shdr->sh_offset) + i);
            const char* name = STR(sym_strtab, u32be(sym->st_name));
            uint32_t addr = u32be(sym->st_value);

            if (u16be(sym->st_shndx) != text_section_index || name[0] == '.') {
                continue;
            }

            addr += vaddr_adj;
            // disasm_label_add(state, name, addr, u32be(sym->st_size), true);
        }
    }

    if (dynsym_section_index != -1) {
        dynsym_shdr = SECTION(dynsym_section_index);
        sym_dynstr = SECTION(u32be(dynsym_shdr->sh_link));
        reginfo_shdr = SECTION(reginfo_section_index);
        dynamic_shdr = SECTION(dynamic_section_index);
        got_shdr = SECTION(got_section_index);

        Elf32_RegInfo* reg_info = (Elf32_RegInfo*)(data + u32be(reginfo_shdr->sh_offset));
        uint32_t gp_base = u32be(reg_info->ri_gp_value); // gp should have this value through the program run
        uint32_t got_start = 0;
        uint32_t local_got_no = 0;
        uint32_t first_got_sym = 0;
        uint32_t dynsym_no = 0; // section size can't be used due to alignment 16 padding

        assert(u32be(dynamic_shdr->sh_entsize) == sizeof(Elf32_Dyn));
        for (uint32_t i = 0; i < u32be(dynamic_shdr->sh_size); i += sizeof(Elf32_Dyn)) {
            Elf32_Dyn* dyn = (Elf32_Dyn*)(data + u32be(dynamic_shdr->sh_offset) + i);

            if (u32be(dyn->d_tag) == DT_PLTGOT) {
                got_start = u32be(dyn->d_un.d_ptr);
            }

            if (u32be(dyn->d_tag) == DT_MIPS_LOCAL_GOTNO) {
                local_got_no = u32be(dyn->d_un.d_val);
            }

            if (u32be(dyn->d_tag) == DT_MIPS_GOTSYM) {
                first_got_sym = u32be(dyn->d_un.d_val);
            }

            if (u32be(dyn->d_tag) == DT_MIPS_SYMTABNO) {
                dynsym_no = u32be(dyn->d_un.d_val);
            }
        }

        assert(got_start != 0);

        // value to add to asm gp offset, for example 32752, if -32752(gp) refers to the first entry in got.
        uint32_t gp_adj = gp_base - got_start;

        assert(gp_adj < 0x10000);

        assert(u32be(dynsym_shdr->sh_entsize) == sizeof(Elf32_Sym));

        uint32_t global_got_no = dynsym_no - first_got_sym;
        // global_got_entry *global_entries = (global_got_entry *)calloc(global_got_no, sizeof(global_got_entry));

        got_globals.resize(global_got_no);

        uint32_t common_start = ~0U;
        vector<string> common_order;

        for (uint32_t i = 0; i < dynsym_no; i++) {
            Elf32_Sym* sym = (Elf32_Sym*)(data + u32be(dynsym_shdr->sh_offset) + i * sizeof(Elf32_Sym));
            const char* name = STR(sym_dynstr, u32be(sym->st_name));
            uint32_t addr = u32be(sym->st_value);

            addr += vaddr_adj;

            uint8_t type = ELF32_ST_TYPE(sym->st_info);

            if (!strcmp(name, "_procedure_table")) {
                procedure_table_start = addr;
            } else if (!strcmp(name, "_procedure_table_size")) {
                procedure_table_len = 40 * u32be(sym->st_value);
            }

            if ((u16be(sym->st_shndx) == SHN_MIPS_TEXT && type == STT_FUNC) ||
                (type == STT_OBJECT &&
                 (u16be(sym->st_shndx) == SHN_MIPS_ACOMMON || u16be(sym->st_shndx) == SHN_MIPS_DATA))) {
                // disasm_label_add(state, name, addr, u32be(sym->st_size), true);
                if (type == STT_OBJECT) {}

                if (u16be(sym->st_shndx) == SHN_MIPS_ACOMMON) {
                    if (addr < common_start) {
                        common_start = addr;
                    }

                    common_order.push_back(name);
                }

                if (type == STT_FUNC) {
                    add_function(addr);

                    if (strcmp(name, "main") == 0) {
                        main_addr = addr;
                    }

                    if (strcmp(name, "_mcount") == 0) {
                        mcount_addr = addr;
                    }

                    symbol_names[addr] = name;
                }
            }

            if (i >= first_got_sym) {
                uint32_t got_value = u32be(*(uint32_t*)(data + u32be(got_shdr->sh_offset) +
                                                        (local_got_no + (i - first_got_sym)) * sizeof(uint32_t)));

                if (u16be(sym->st_shndx) == SHN_MIPS_TEXT && type == STT_FUNC) {
                    // got_globals[i - first_got_sym] = got_value;
                    // label_addresses.insert(got_value);
                    got_globals[i - first_got_sym] = addr; // to include the 3 instr gp header thing
                    label_addresses.insert(addr);
                } else if (type == STT_OBJECT &&
                           (u16be(sym->st_shndx) == SHN_UNDEF || u16be(sym->st_shndx) == SHN_COMMON)) {
                    // symbol defined externally (for example in libc)
                    got_globals[i - first_got_sym] = got_value;
                } else {
                    got_globals[i - first_got_sym] = addr;
                }

                symbol_names[got_globals[i - first_got_sym]] = name;
            }
        }

        uint32_t* local_entries = (uint32_t*)calloc(local_got_no, sizeof(uint32_t));
        got_locals.resize(local_got_no);
        for (uint32_t i = 0; i < local_got_no; i++) {
            uint32_t* entry = (uint32_t*)(data + u32be(got_shdr->sh_offset) + i * sizeof(uint32_t));
            got_locals[i] = u32be(*entry);
        }

        gp_value = gp_base;
        gp_value_adj = gp_adj;

        free(local_entries);
    }

    // add relocations
    for (int i = 0; i < u16be(ehdr->e_shnum); i++) {
        Elf32_Rel* prevHi = NULL;

        shdr = SECTION(i);
        if (u32be(shdr->sh_type) != SHT_REL || u32be(shdr->sh_info) != (uint32_t)text_section_index)
            continue;

        if (sym_shdr == NULL) {
            fprintf(stderr, "Relocations without .symtab section\n");
            exit(EXIT_FAILURE);
        }

        assert(u32be(shdr->sh_link) == (uint32_t)symtab_section_index);
        assert(u32be(shdr->sh_entsize) == sizeof(Elf32_Rel));

        for (uint32_t i = 0; i < u32be(shdr->sh_size); i += sizeof(Elf32_Rel)) {
            Elf32_Rel* rel = (Elf32_Rel*)(data + u32be(shdr->sh_offset) + i);
            uint32_t offset = text_offset + u32be(rel->r_offset);
            uint32_t symIndex = ELF32_R_SYM(u32be(rel->r_info));
            uint32_t rtype = ELF32_R_TYPE(u32be(rel->r_info));
            const char* symName = "0";

            if (symIndex != STN_UNDEF) {
                Elf32_Sym* sym = (Elf32_Sym*)(data + u32be(sym_shdr->sh_offset) + symIndex * sizeof(Elf32_Sym));

                symName = STR(sym_strtab, u32be(sym->st_name));
            }

            if (rtype == R_MIPS_HI16) {
                if (prevHi != NULL) {
                    fprintf(stderr, "Consecutive R_MIPS_HI16.\n");
                    exit(EXIT_FAILURE);
                }

                prevHi = rel;
                continue;
            }

            if (rtype == R_MIPS_LO16) {
                int32_t addend = (int16_t)((data[offset + 2] << 8) + data[offset + 3]);

                if (prevHi != NULL) {
                    uint32_t offset2 = text_offset + u32be(prevHi->r_offset);

                    addend += (uint32_t)((data[offset2 + 2] << 8) + data[offset2 + 3]) << 16;
                    // add_reloc(state, offset2, symName, addend, out_range.vaddr);
                }
                prevHi = NULL;
                // add_reloc(state, offset, symName, addend, out_range.vaddr);
            } else if (rtype == R_MIPS_26) {
                int32_t addend = (u32be(*(uint32_t*)(data + offset)) & ((1 << 26) - 1)) << 2;

                if (addend >= (1 << 27)) {
                    addend -= 1 << 28;
                }
                // add_reloc(state, offset, symName, addend, out_range.vaddr);
            }

            else {
                fprintf(stderr, "Bad relocation type %d.\n", rtype);
                exit(EXIT_FAILURE);
            }
        }

        if (prevHi != NULL) {
            fprintf(stderr, "R_MIPS_HI16 without matching R_MIPS_LO16.\n");
            exit(EXIT_FAILURE);
        }
    }
}
#undef SECTION
#undef STR

size_t read_file(const char* file_name, uint8_t** data) {
    FILE* in;
    uint8_t* in_buf = NULL;
    long file_size;
    long bytes_read;

    in = fopen(file_name, "rb");
    assert(in != nullptr);

    // allocate buffer to read from offset to end of file
    fseek(in, 0, SEEK_END);
    file_size = ftell(in);
    assert(file_size != -1L);

    in_buf = (uint8_t*)malloc(file_size);
    fseek(in, 0, SEEK_SET);

    // read bytes
    bytes_read = fread(in_buf, 1, file_size, in);
    assert(bytes_read == file_size);

    fclose(in);
    *data = in_buf;
    return bytes_read;
}

#ifdef UNIX_PLATFORM
void crashHandler(int sig) {
    void* array[4096];
    const size_t nMaxFrames = std::size(array);
    size_t size = backtrace(array, nMaxFrames);
    char** symbols = backtrace_symbols(array, nMaxFrames);

    fprintf(stderr, "\n recomp crashed. (Signal: %i)\n", sig);

    // Feel free to add more crash messages.
    const char* crashEasterEgg[] = {
        "\tIT'S A SECRET TO EVERYBODY. \n\tBut it shouldn't be, you'd better ask about it!",
        "\tI AM ERROR.",
        "\tGRUMBLE,GRUMBLE...",
        "\tDODONGO DISLIKES SMOKE \n\tAnd recomp dislikes whatever you fed it.",
        "\tMay the way of the Hero lead \n\tto the debugger.",
        "\tTHE WIND FISH SLUMBERS LONG... \n\tTHE HERO'S LIFE GONE... ",
        "\tSEA BEARS FOAM, SLEEP BEARS DREAMS. \n\tBOTH END IN THE SAME WAY CRASSSH!",
        "\tYou've met with a terrible fate, haven't you?",
        "\tMaster, I calculate a 100% probability that recomp has crashed. \n\tAdditionally, the "
        "batteries in your Wii Remote are nearly depleted.",
        "\t    CONGRATURATIONS!    \n"
        "\tAll Pages are displayed.\n"
        "\t       THANK YOU!       \n"
        "\t You are great debugger!",
        "\tRCP is HUNG UP!!\n"
        "\tOh! MY GOD!!",
    };

    srand(time(nullptr));
    auto easterIndex = rand() % std::size(crashEasterEgg);

    fprintf(stderr, "\n%s\n\n", crashEasterEgg[easterIndex]);

    fprintf(stderr, "Traceback:\n");
    for (size_t i = 1; i < size; i++) {
        Dl_info info;
        uint32_t gotAddress = dladdr(array[i], &info);
        std::string functionName(symbols[i]);

        if (gotAddress != 0 && info.dli_sname != nullptr) {
            int32_t status;
            char* demangled = abi::__cxa_demangle(info.dli_sname, nullptr, nullptr, &status);
            const char* nameFound = info.dli_sname;

            if (status == 0) {
                nameFound = demangled;
            }

            {
                char auxBuffer[0x8000];

                snprintf(auxBuffer, std::size(auxBuffer), "%s (+0x%lX)", nameFound,
                         (char*)array[i] - (char*)info.dli_saddr);
                functionName = auxBuffer;
            }
            free(demangled);

#if FULL_TRACEBACK == 0
            fprintf(stderr, "%-3zd %s\n", i, functionName.c_str());
#endif
        }

#if FULL_TRACEBACK != 0
        fprintf(stderr, "%-3zd %s\n", i, functionName.c_str());
#endif
    }

    fprintf(stderr, "\n");

    free(symbols);
    exit(1);
}
#endif

int main(int argc, char* argv[]) {
    const char* filename = argv[1];

    if (strcmp(filename, "--conservative") == 0) {
        conservative = true;
        filename = argv[2];
    }

#ifdef UNIX_PLATFORM
    signal(SIGSEGV, crashHandler);
    signal(SIGABRT, crashHandler);
#endif

    uint8_t* data;
    size_t len = read_file(filename, &data);

    parse_elf(data, len);
    disassemble();
    inspect_data_function_pointers(data_function_pointers, rodata_section, rodata_vaddr, rodata_section_len);
    inspect_data_function_pointers(data_function_pointers, data_section, data_vaddr, data_section_len);
    pass1();
    pass2();
    pass3();
    pass4();
    pass5();
    pass6();
    // dump();
    dump_c();
    free(data);

    return 0;
}
