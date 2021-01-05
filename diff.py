#!/usr/bin/env python3
import sys
import re
import os
import ast
import argparse
import subprocess
import collections
import difflib
import string
import itertools
import threading
import queue
import time


def fail(msg):
    print(msg, file=sys.stderr)
    sys.exit(1)


MISSING_PREREQUISITES = (
    "Missing prerequisite python module {}. "
    "Run `python3 -m pip install --user colorama ansiwrap attrs watchdog python-Levenshtein cxxfilt` to install prerequisites (cxxfilt only needed with --source)."
)

try:
    import attr
    from colorama import Fore, Style, Back
    import ansiwrap
    import watchdog
except ModuleNotFoundError as e:
    fail(MISSING_PREREQUISITES.format(e.name))

# Prefer to use diff_settings.py from the current working directory
sys.path.insert(0, ".")
try:
    import diff_settings
except ModuleNotFoundError:
    fail("Unable to find diff_settings.py in the same directory.")

# ==== CONFIG ====

parser = argparse.ArgumentParser(description="Diff MIPS assembly.")
parser.add_argument("start", help="Function name or address to start diffing from.")
parser.add_argument("end", nargs="?", help="Address to end diff at.")
parser.add_argument(
    "-o",
    dest="diff_obj",
    action="store_true",
    help="Diff .o files rather than a whole binary. This makes it possible to see symbol names. (Recommended)",
)
parser.add_argument(
    "--elf",
    dest="diff_elf_symbol",
    help="Diff a given function in two ELFs, one being stripped and the other one non-stripped. Requires objdump from binutils 2.33+.",
)
parser.add_argument(
    "--source",
    action="store_true",
    help="Show source code (if possible). Only works with -o and -e.",
)
parser.add_argument(
    "--inlines",
    action="store_true",
    help="Show inline function calls (if possible). Only works with -o and -e.",
)
parser.add_argument(
    "--base-asm",
    dest="base_asm",
    metavar="FILE",
    help="Read assembly from given file instead of configured base img.",
)
parser.add_argument(
    "--write-asm",
    dest="write_asm",
    metavar="FILE",
    help="Write the current assembly output to file, e.g. for use with --base-asm.",
)
parser.add_argument(
    "-m",
    "--make",
    dest="make",
    action="store_true",
    help="Automatically run 'make' on the .o file or binary before diffing.",
)
parser.add_argument(
    "-l",
    "--skip-lines",
    dest="skip_lines",
    type=int,
    default=0,
    help="Skip the first N lines of output.",
)
parser.add_argument(
    "-f",
    "--stop-jr-ra",
    dest="stop_jrra",
    action="store_true",
    help="Stop disassembling at the first 'jr ra'. Some functions have multiple return points, so use with care!",
)
parser.add_argument(
    "-i",
    "--ignore-large-imms",
    dest="ignore_large_imms",
    action="store_true",
    help="Pretend all large enough immediates are the same.",
)
parser.add_argument(
    "-B",
    "--no-show-branches",
    dest="show_branches",
    action="store_false",
    help="Don't visualize branches/branch targets.",
)
parser.add_argument(
    "-S",
    "--base-shift",
    dest="base_shift",
    type=str,
    default="0",
    help="Diff position X in our img against position X + shift in the base img. "
    'Arithmetic is allowed, so e.g. |-S "0x1234 - 0x4321"| is a reasonable '
    "flag to pass if it is known that position 0x1234 in the base img syncs "
    "up with position 0x4321 in our img. Not supported together with -o.",
)
parser.add_argument(
    "-w",
    "--watch",
    dest="watch",
    action="store_true",
    help="Automatically update when source/object files change. "
    "Recommended in combination with -m.",
)
parser.add_argument(
    "--width",
    dest="column_width",
    type=int,
    default=50,
    help="Sets the width of the left and right view column.",
)
parser.add_argument(
    "--algorithm",
    dest="algorithm",
    default="levenshtein",
    choices=["levenshtein", "difflib"],
    help="Diff algorithm to use.",
)

parser.add_argument(
    "--max-size",
    "--max-lines",
    dest="max_lines",
    type=int,
    default=1024,
    help="The maximum length of the diff, in lines.",
)

# Project-specific flags, e.g. different versions/make arguments.
if hasattr(diff_settings, "add_custom_arguments"):
    diff_settings.add_custom_arguments(parser)

args = parser.parse_args()

# Set imgs, map file and make flags in a project-specific manner.
config = {}
diff_settings.apply(config, args)

arch = config.get("arch", "mips")
baseimg = config.get("baseimg", None)
myimg = config.get("myimg", None)
mapfile = config.get("mapfile", None)
makeflags = config.get("makeflags", [])
source_directories = config.get("source_directories", None)
objdump_executable = config.get("objdump_executable", None)

MAX_FUNCTION_SIZE_LINES = args.max_lines
MAX_FUNCTION_SIZE_BYTES = MAX_FUNCTION_SIZE_LINES * 4

COLOR_ROTATION = [
    Fore.MAGENTA,
    Fore.CYAN,
    Fore.GREEN,
    Fore.RED,
    Fore.LIGHTYELLOW_EX,
    Fore.LIGHTMAGENTA_EX,
    Fore.LIGHTCYAN_EX,
    Fore.LIGHTGREEN_EX,
    Fore.LIGHTBLACK_EX,
]

BUFFER_CMD = ["tail", "-c", str(10 ** 9)]
LESS_CMD = ["less", "-SRic", "-#6"]

DEBOUNCE_DELAY = 0.1
FS_WATCH_EXTENSIONS = [".c", ".h"]

# ==== LOGIC ====

if args.algorithm == "levenshtein":
    try:
        import Levenshtein
    except ModuleNotFoundError as e:
        fail(MISSING_PREREQUISITES.format(e.name))

if args.source:
    try:
        import cxxfilt
    except ModuleNotFoundError as e:
        fail(MISSING_PREREQUISITES.format(e.name))

if objdump_executable is None:
    for objdump_cand in ["mips-linux-gnu-objdump", "mips64-elf-objdump"]:
        try:
            subprocess.check_call(
                [objdump_cand, "--version"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
            objdump_executable = objdump_cand
            break
        except subprocess.CalledProcessError:
            pass
        except FileNotFoundError:
            pass

if not objdump_executable:
    fail(
        "Missing binutils; please ensure mips-linux-gnu-objdump or mips64-elf-objdump exist, or configure objdump_executable."
    )


def eval_int(expr, emsg=None):
    try:
        ret = ast.literal_eval(expr)
        if not isinstance(ret, int):
            raise Exception("not an integer")
        return ret
    except Exception:
        if emsg is not None:
            fail(emsg)
        return None


def eval_line_num(expr):
    return int(expr.strip().replace(":", ""), 16)


def run_make(target, capture_output=False):
    if capture_output:
        return subprocess.run(
            ["make"] + makeflags + [target],
            stderr=subprocess.PIPE,
            stdout=subprocess.PIPE,
        )
    else:
        subprocess.check_call(["make"] + makeflags + [target])


def restrict_to_function(dump, fn_name):
    out = []
    search = f"<{fn_name}>:"
    found = False
    for line in dump.split("\n"):
        if found:
            if len(out) >= MAX_FUNCTION_SIZE_LINES:
                break
            out.append(line)
        elif search in line:
            found = True
    return "\n".join(out)


def maybe_get_objdump_source_flags():
    if not args.source:
        return []

    flags = [
        "--source",
        "--source-comment=| ",
        "-l",
    ]

    if args.inlines:
        flags.append("--inlines")

    return flags


def run_objdump(cmd):
    flags, target, restrict = cmd
    out = subprocess.check_output(
        [objdump_executable] + flags + [target], universal_newlines=True
    )
    if restrict is not None:
        return restrict_to_function(out, restrict)
    return out


base_shift = eval_int(
    args.base_shift, "Failed to parse --base-shift (-S) argument as an integer."
)


def search_map_file(fn_name):
    if not mapfile:
        fail(f"No map file configured; cannot find function {fn_name}.")

    try:
        with open(mapfile) as f:
            lines = f.read().split("\n")
    except Exception:
        fail(f"Failed to open map file {mapfile} for reading.")

    try:
        cur_objfile = None
        ram_to_rom = None
        cands = []
        last_line = ""
        for line in lines:
            if line.startswith(" .text"):
                cur_objfile = line.split()[3]
            if "load address" in line:
                tokens = last_line.split() + line.split()
                ram = int(tokens[1], 0)
                rom = int(tokens[5], 0)
                ram_to_rom = rom - ram
            if line.endswith(" " + fn_name):
                ram = int(line.split()[0], 0)
                if cur_objfile is not None and ram_to_rom is not None:
                    cands.append((cur_objfile, ram + ram_to_rom))
            last_line = line
    except Exception as e:
        import traceback

        traceback.print_exc()
        fail(f"Internal error while parsing map file")

    if len(cands) > 1:
        fail(f"Found multiple occurrences of function {fn_name} in map file.")
    if len(cands) == 1:
        return cands[0]
    return None, None


def dump_elf():
    if not baseimg or not myimg:
        fail("Missing myimg/baseimg in config.")
    if base_shift:
        fail("--base-shift not compatible with -e")

    start_addr = eval_int(args.start, "Start address must be an integer expression.")

    if args.end is not None:
        end_addr = eval_int(args.end, "End address must be an integer expression.")
    else:
        end_addr = start_addr + MAX_FUNCTION_SIZE_BYTES

    flags1 = [
        f"--start-address={start_addr}",
        f"--stop-address={end_addr}",
    ]

    flags2 = [
        f"--disassemble={args.diff_elf_symbol}",
    ]

    objdump_flags = ["-drz", "-j", ".text"]
    return (
        myimg,
        (objdump_flags + flags1, baseimg, None),
        (objdump_flags + flags2 + maybe_get_objdump_source_flags(), myimg, None),
    )


def dump_objfile():
    if base_shift:
        fail("--base-shift not compatible with -o")
    if args.end is not None:
        fail("end address not supported together with -o")
    if args.start.startswith("0"):
        fail("numerical start address not supported with -o; pass a function name")

    objfile, _ = search_map_file(args.start)
    if not objfile:
        fail("Not able to find .o file for function.")

    if args.make:
        run_make(objfile)

    if not os.path.isfile(objfile):
        fail(f"Not able to find .o file for function: {objfile} is not a file.")

    refobjfile = "expected/" + objfile
    if not os.path.isfile(refobjfile):
        fail(f'Please ensure an OK .o file exists at "{refobjfile}".')

    objdump_flags = ["-drz"]
    return (
        objfile,
        (objdump_flags, refobjfile, args.start),
        (objdump_flags + maybe_get_objdump_source_flags(), objfile, args.start),
    )


def dump_binary():
    if not baseimg or not myimg:
        fail("Missing myimg/baseimg in config.")
    if args.make:
        run_make(myimg)
    start_addr = eval_int(args.start)
    if start_addr is None:
        _, start_addr = search_map_file(args.start)
        if start_addr is None:
            fail("Not able to find function in map file.")
    if args.end is not None:
        end_addr = eval_int(args.end, "End address must be an integer expression.")
    else:
        end_addr = start_addr + MAX_FUNCTION_SIZE_BYTES
    objdump_flags = ["-Dz", "-bbinary", "-mmips", "-EB"]
    flags1 = [
        f"--start-address={start_addr + base_shift}",
        f"--stop-address={end_addr + base_shift}",
    ]
    flags2 = [f"--start-address={start_addr}", f"--stop-address={end_addr}"]
    return (
        myimg,
        (objdump_flags + flags1, baseimg, None),
        (objdump_flags + flags2, myimg, None),
    )


# Alignment with ANSI colors is broken, let's fix it.
def ansi_ljust(s, width):
    needed = width - ansiwrap.ansilen(s)
    if needed > 0:
        return s + " " * needed
    else:
        return s


if arch == "mips":
    re_int = re.compile(r"[0-9]+")
    re_comment = re.compile(r"<.*?>")
    re_reg = re.compile(r"\$?\b(a[0-3]|t[0-9]|s[0-8]|at|v[01]|f[12]?[0-9]|f3[01]|k[01]|fp|ra)\b")
    re_sprel = re.compile(r"(?<=,)([0-9]+|0x[0-9a-f]+)\(sp\)")
    re_large_imm = re.compile(r"-?[1-9][0-9]{2,}|-?0x[0-9a-f]{3,}")
    re_imm = re.compile(r"(\b|-)([0-9]+|0x[0-9a-fA-F]+)\b(?!\(sp)|%(lo|hi)\([^)]*\)")
    forbidden = set(string.ascii_letters + "_")
    branch_likely_instructions = {
        "beql",
        "bnel",
        "beqzl",
        "bnezl",
        "bgezl",
        "bgtzl",
        "blezl",
        "bltzl",
        "bc1tl",
        "bc1fl",
    }
    branch_instructions = branch_likely_instructions.union(
        {"b", "beq", "bne", "beqz", "bnez", "bgez", "bgtz", "blez", "bltz", "bc1t", "bc1f"}
    )
    instructions_with_address_immediates = branch_instructions.union({"jal", "j"})
elif arch == "aarch64":
    re_int = re.compile(r"[0-9]+")
    re_comment = re.compile(r"(<.*?>|//.*$)")
    # GPRs and FP registers: X0-X30, W0-W30, [DSHQ]0..31
    # The zero registers and SP should not be in this list.
    re_reg = re.compile(r"\$?\b([dshq][12]?[0-9]|[dshq]3[01]|[xw][12]?[0-9]|[xw]30)\b")
    re_sprel = re.compile(r"sp, #-?(0x[0-9a-fA-F]+|[0-9]+)\b")
    re_large_imm = re.compile(r"-?[1-9][0-9]{2,}|-?0x[0-9a-f]{3,}")
    re_imm = re.compile(r"(?<!sp, )#-?(0x[0-9a-fA-F]+|[0-9]+)\b")
    forbidden = set(string.ascii_letters + "_")
    branch_likely_instructions = set()
    branch_instructions = {"bl", "b", "b.eq", "b.ne", "b.cs", "b.hs", "b.cc", "b.lo", "b.mi", "b.pl", "b.vs", "b.vc", "b.hi", "b.ls", "b.ge", "b.lt", "b.gt", "b.le", "cbz", "cbnz", "tbz", "tbnz"}
    instructions_with_address_immediates = branch_instructions.union({"adrp"})
else:
    fail("Unknown architecture.")


def hexify_int(row, pat):
    full = pat.group(0)
    if len(full) <= 1:
        # leave one-digit ints alone
        return full
    start, end = pat.span()
    if start and row[start - 1] in forbidden:
        return full
    if end < len(row) and row[end] in forbidden:
        return full
    return hex(int(full))


def parse_relocated_line(line):
    try:
        ind2 = line.rindex(",")
    except ValueError:
        ind2 = line.rindex("\t")
    before = line[: ind2 + 1]
    after = line[ind2 + 1 :]
    ind2 = after.find("(")
    if ind2 == -1:
        imm, after = after, ""
    else:
        imm, after = after[:ind2], after[ind2:]
    if imm == "0x0":
        imm = "0"
    return before, imm, after


def process_reloc(row, prev):
    before, imm, after = parse_relocated_line(prev)
    repl = row.split()[-1]
    if imm != "0":
        if before.strip() == "jal" and not imm.startswith("0x"):
            imm = "0x" + imm
        repl += "+" + imm if int(imm, 0) > 0 else imm
    if "R_MIPS_LO16" in row:
        repl = f"%lo({repl})"
    elif "R_MIPS_HI16" in row:
        # Ideally we'd pair up R_MIPS_LO16 and R_MIPS_HI16 to generate a
        # correct addend for each, but objdump doesn't give us the order of
        # the relocations, so we can't find the right LO16. :(
        repl = f"%hi({repl})"
    else:
        assert "R_MIPS_26" in row, f"unknown relocation type '{row}'"
    return before + repl + after


def cleanup_whitespace(line):
    return "".join(f"{o:<8s}" for o in line.strip().split("\t"))


Line = collections.namedtuple(
    "Line",
    [
        "mnemonic",
        "diff_row",
        "original",
        "line_num",
        "branch_target",
        "source_lines",
        "comment",
    ],
)


def process(lines):
    skip_next = False
    source_lines = []
    if not args.diff_obj:
        lines = lines[7:]
        if lines and not lines[-1]:
            lines.pop()

    output = []
    for row in lines:
        if args.diff_obj and (">:" in row or not row):
            continue

        if args.source and (row and row[0] != " "):
            source_lines.append(row)
            continue

        if "R_AARCH64_" in row:
            # TODO: handle relocation
            continue

        if "R_MIPS_" in row:
            # N.B. Don't transform the diff rows, they already ignore immediates
            # if output[-1].diff_row != "<delay-slot>":
            # output[-1] = output[-1].replace(diff_row=process_reloc(row, output[-1].row_with_imm))
            new_original = process_reloc(row, output[-1].original)
            output[-1] = output[-1]._replace(original=new_original)
            continue

        m_comment = re.search(re_comment, row)
        comment = m_comment[0] if m_comment else None
        row = re.sub(re_comment, "", row)
        row = row.rstrip()
        tabs = row.split("\t")
        row = "\t".join(tabs[2:])
        line_num = tabs[0].strip()
        row_parts = row.split("\t", 1)
        mnemonic = row_parts[0].strip()
        if mnemonic not in instructions_with_address_immediates:
            row = re.sub(re_int, lambda s: hexify_int(row, s), row)
        original = row
        if skip_next:
            skip_next = False
            row = "<delay-slot>"
            mnemonic = "<delay-slot>"
        if mnemonic in branch_likely_instructions:
            skip_next = True
        row = re.sub(re_reg, "<reg>", row)
        row = re.sub(re_sprel, "addr(sp)", row)
        row_with_imm = row
        if mnemonic in instructions_with_address_immediates:
            row = row.strip()
            row, _ = split_off_branch(row)
            row += "<imm>"
        else:
            row = normalize_imms(row)

        branch_target = None
        if mnemonic in branch_instructions:
            target = row_parts[1].strip().split(",")[-1]
            if mnemonic in branch_likely_instructions:
                target = hex(int(target, 16) - 4)[2:]
            branch_target = target.strip()

        output.append(
            Line(
                mnemonic=mnemonic,
                diff_row=row,
                original=original,
                line_num=line_num,
                branch_target=branch_target,
                source_lines=source_lines,
                comment=comment,
            )
        )
        source_lines = []

        if args.stop_jrra and mnemonic == "jr" and row_parts[1].strip() == "ra":
            break

    # Cleanup whitespace, after relocation fixups have happened
    output = [
        line._replace(original=cleanup_whitespace(line.original)) for line in output
    ]

    return output


def format_single_line_diff(line1, line2, column_width):
    return f"{ansi_ljust(line1,column_width)}{ansi_ljust(line2,column_width)}"


class SymbolColorer:
    def __init__(self, base_index):
        self.color_index = base_index
        self.symbol_colors = {}

    def color_symbol(self, s, t=None):
        try:
            color = self.symbol_colors[s]
        except:
            color = COLOR_ROTATION[self.color_index % len(COLOR_ROTATION)]
            self.color_index += 1
            self.symbol_colors[s] = color
        t = t or s
        return f"{color}{t}{Fore.RESET}"


def maybe_normalize_large_imms(row):
    if args.ignore_large_imms:
        row = re.sub(re_large_imm, "<imm>", row)
    return row


def normalize_imms(row):
    return re.sub(re_imm, "<imm>", row)


def normalize_stack(row):
    return re.sub(re_sprel, "addr(sp)", row)


def split_off_branch(line):
    parts = line.split(",")
    if len(parts) < 2:
        parts = line.split(None, 1)
    off = len(line) - len(parts[-1])
    return line[:off], line[off:]


def color_imms(out1, out2):
    g1 = []
    g2 = []
    re.sub(re_imm, lambda s: g1.append(s.group()), out1)
    re.sub(re_imm, lambda s: g2.append(s.group()), out2)
    if len(g1) == len(g2):
        diffs = [x != y for (x, y) in zip(g1, g2)]
        it = iter(diffs)

        def maybe_color(s):
            return f"{Fore.LIGHTBLUE_EX}{s}{Style.RESET_ALL}" if next(it) else s

        out1 = re.sub(re_imm, lambda s: maybe_color(s.group()), out1)
        it = iter(diffs)
        out2 = re.sub(re_imm, lambda s: maybe_color(s.group()), out2)
    return out1, out2


def color_branch_imms(br1, br2):
    if br1 != br2:
        br1 = f"{Fore.LIGHTBLUE_EX}{br1}{Style.RESET_ALL}"
        br2 = f"{Fore.LIGHTBLUE_EX}{br2}{Style.RESET_ALL}"
    return br1, br2


def diff_sequences_difflib(seq1, seq2):
    differ = difflib.SequenceMatcher(a=seq1, b=seq2, autojunk=False)
    return differ.get_opcodes()


def diff_sequences(seq1, seq2):
    if (
        args.algorithm != "levenshtein"
        or len(seq1) * len(seq2) > 4 * 10 ** 8
        or len(seq1) + len(seq2) >= 0x110000
    ):
        return diff_sequences_difflib(seq1, seq2)

    # The Levenshtein library assumes that we compare strings, not lists. Convert.
    # (Per the check above we know we have fewer than 0x110000 unique elements, so chr() works.)
    remapping = {}

    def remap(seq):
        seq = seq[:]
        for i in range(len(seq)):
            val = remapping.get(seq[i])
            if val is None:
                val = chr(len(remapping))
                remapping[seq[i]] = val
            seq[i] = val
        return "".join(seq)

    seq1 = remap(seq1)
    seq2 = remap(seq2)
    return Levenshtein.opcodes(seq1, seq2)


def do_diff(basedump, mydump):
    output = []

    # TODO: status line?
    # output.append(sha1sum(mydump))

    lines1 = process(basedump.split("\n"))
    lines2 = process(mydump.split("\n"))

    sc1 = SymbolColorer(0)
    sc2 = SymbolColorer(0)
    sc3 = SymbolColorer(4)
    sc4 = SymbolColorer(4)
    sc5 = SymbolColorer(0)
    sc6 = SymbolColorer(0)
    bts1 = set()
    bts2 = set()

    if args.show_branches:
        for (lines, btset, sc) in [
            (lines1, bts1, sc5),
            (lines2, bts2, sc6),
        ]:
            for line in lines:
                bt = line.branch_target
                if bt is not None:
                    btset.add(bt + ":")
                    sc.color_symbol(bt + ":")

    for (tag, i1, i2, j1, j2) in diff_sequences(
        [line.mnemonic for line in lines1], [line.mnemonic for line in lines2]
    ):
        for line1, line2 in itertools.zip_longest(lines1[i1:i2], lines2[j1:j2]):
            if tag == "replace":
                if line1 is None:
                    tag = "insert"
                elif line2 is None:
                    tag = "delete"
            elif tag == "insert":
                assert line1 is None
            elif tag == "delete":
                assert line2 is None

            line_color1 = line_color2 = sym_color = Fore.RESET
            line_prefix = " "
            if line1 and line2 and line1.diff_row == line2.diff_row:
                if maybe_normalize_large_imms(
                    line1.original
                ) == maybe_normalize_large_imms(line2.original):
                    out1 = line1.original
                    out2 = line2.original
                elif line1.diff_row == "<delay-slot>":
                    out1 = f"{Style.BRIGHT}{Fore.LIGHTBLACK_EX}{line1.original}"
                    out2 = f"{Style.BRIGHT}{Fore.LIGHTBLACK_EX}{line2.original}"
                else:
                    mnemonic = line1.original.split()[0]
                    out1, out2 = line1.original, line2.original
                    branch1 = branch2 = ""
                    if mnemonic in instructions_with_address_immediates:
                        out1, branch1 = split_off_branch(line1.original)
                        out2, branch2 = split_off_branch(line2.original)
                    branchless1 = out1
                    branchless2 = out2
                    out1, out2 = color_imms(out1, out2)

                    same_relative_target = False
                    if line1.branch_target is not None and line2.branch_target is not None:
                        relative_target1 = eval_line_num(line1.branch_target) - eval_line_num(line1.line_num)
                        relative_target2 = eval_line_num(line2.branch_target) - eval_line_num(line2.line_num)
                        same_relative_target = relative_target1 == relative_target2

                    if not same_relative_target:
                        branch1, branch2 = color_branch_imms(branch1, branch2)

                    out1 += branch1
                    out2 += branch2
                    if normalize_imms(branchless1) == normalize_imms(branchless2):
                        if not same_relative_target:
                            # only imms differences
                            sym_color = Fore.LIGHTBLUE_EX
                            line_prefix = "i"
                    else:
                        out1 = re.sub(
                            re_sprel, lambda s: sc3.color_symbol(s.group()), out1,
                        )
                        out2 = re.sub(
                            re_sprel, lambda s: sc4.color_symbol(s.group()), out2,
                        )
                        if normalize_stack(branchless1) == normalize_stack(branchless2):
                            # only stack differences (luckily stack and imm
                            # differences can't be combined in MIPS, so we
                            # don't have to think about that case)
                            sym_color = Fore.YELLOW
                            line_prefix = "s"
                        else:
                            # regs differences and maybe imms as well
                            out1 = re.sub(
                                re_reg, lambda s: sc1.color_symbol(s.group()), out1
                            )
                            out2 = re.sub(
                                re_reg, lambda s: sc2.color_symbol(s.group()), out2
                            )
                            line_color1 = line_color2 = sym_color = Fore.YELLOW
                            line_prefix = "r"
            elif line1 and line2:
                line_prefix = "|"
                line_color1 = Fore.LIGHTBLUE_EX
                line_color2 = Fore.LIGHTBLUE_EX
                sym_color = Fore.LIGHTBLUE_EX
                out1 = line1.original
                out2 = line2.original
            elif line1:
                line_prefix = "<"
                line_color1 = line_color2 = sym_color = Fore.RED
                out1 = line1.original
                out2 = ""
            elif line2:
                line_prefix = ">"
                line_color1 = line_color2 = sym_color = Fore.GREEN
                out1 = ""
                out2 = line2.original

            in_arrow1 = "  "
            in_arrow2 = "  "
            out_arrow1 = ""
            out_arrow2 = ""

            if args.show_branches and line1:
                if line1.line_num in bts1:
                    in_arrow1 = sc5.color_symbol(line1.line_num, "~>") + line_color1
                if line1.branch_target is not None:
                    out_arrow1 = " " + sc5.color_symbol(line1.branch_target + ":", "~>")
            if args.show_branches and line2:
                if line2.line_num in bts2:
                    in_arrow2 = sc6.color_symbol(line2.line_num, "~>") + line_color2
                if line2.branch_target is not None:
                    out_arrow2 = " " + sc6.color_symbol(line2.branch_target + ":", "~>")

            if args.source and line2 and line2.comment:
                out2 += f" {line2.comment}"

            line_num1 = line1.line_num if line1 else ""
            line_num2 = line2.line_num if line2 else ""

            out1 = f"{line_color1}{line_num1} {in_arrow1} {out1}{Style.RESET_ALL}{out_arrow1}"
            out2 = f"{line_color2}{line_num2} {in_arrow2} {out2}{Style.RESET_ALL}{out_arrow2}"
            mid = f"{sym_color}{line_prefix} "

            if line2:
                for source_line in line2.source_lines:
                    color = Style.DIM
                    # File names and function names
                    if source_line and source_line[0] != "|":
                        color += Style.BRIGHT
                        # Function names
                        if source_line.endswith("():"):
                            # Underline. Colorama does not provide this feature, unfortunately.
                            color += "\u001b[4m"
                            try:
                                source_line = cxxfilt.demangle(
                                    source_line[:-3], external_only=False
                                )
                            except:
                                pass
                    output.append(
                        format_single_line_diff(
                            "",
                            f"  {color}{source_line}{Style.RESET_ALL}",
                            args.column_width,
                        )
                    )

            output.append(format_single_line_diff(out1, mid + out2, args.column_width))

    return output[args.skip_lines :]


def debounced_fs_watch(targets, outq, debounce_delay):
    import watchdog.events
    import watchdog.observers

    class WatchEventHandler(watchdog.events.FileSystemEventHandler):
        def __init__(self, queue, file_targets):
            self.queue = queue
            self.file_targets = file_targets

        def on_modified(self, ev):
            if isinstance(ev, watchdog.events.FileModifiedEvent):
                self.changed(ev.src_path)

        def on_moved(self, ev):
            if isinstance(ev, watchdog.events.FileMovedEvent):
                self.changed(ev.dest_path)

        def should_notify(self, path):
            for target in self.file_targets:
                if path == target:
                    return True
            if args.make and any(
                path.endswith(suffix) for suffix in FS_WATCH_EXTENSIONS
            ):
                return True
            return False

        def changed(self, path):
            if self.should_notify(path):
                self.queue.put(time.time())

    def debounce_thread():
        listenq = queue.Queue()
        file_targets = []
        event_handler = WatchEventHandler(listenq, file_targets)
        observer = watchdog.observers.Observer()
        observed = set()
        for target in targets:
            if os.path.isdir(target):
                observer.schedule(event_handler, target, recursive=True)
            else:
                file_targets.append(target)
                target = os.path.dirname(target) or "."
                if target not in observed:
                    observed.add(target)
                    observer.schedule(event_handler, target)
        observer.start()
        while True:
            t = listenq.get()
            more = True
            while more:
                delay = t + debounce_delay - time.time()
                if delay > 0:
                    time.sleep(delay)
                # consume entire queue
                more = False
                try:
                    while True:
                        t = listenq.get(block=False)
                        more = True
                except queue.Empty:
                    pass
            outq.put(t)

    th = threading.Thread(target=debounce_thread, daemon=True)
    th.start()


class Display:
    def __init__(self, basedump, mydump):
        self.basedump = basedump
        self.mydump = mydump
        self.emsg = None

    def run_less(self):
        if self.emsg is not None:
            output = self.emsg
        else:
            output = "\n".join(do_diff(self.basedump, self.mydump))

        # Pipe the output through 'tail' and only then to less, to ensure the
        # write call doesn't block. ('tail' has to buffer all its input before
        # it starts writing.) This also means we don't have to deal with pipe
        # closure errors.
        buffer_proc = subprocess.Popen(
            BUFFER_CMD, stdin=subprocess.PIPE, stdout=subprocess.PIPE
        )
        less_proc = subprocess.Popen(LESS_CMD, stdin=buffer_proc.stdout)
        buffer_proc.stdin.write(output.encode())
        buffer_proc.stdin.close()
        buffer_proc.stdout.close()
        return (buffer_proc, less_proc)

    def run_sync(self):
        proca, procb = self.run_less()
        procb.wait()
        proca.wait()

    def run_async(self, watch_queue):
        self.watch_queue = watch_queue
        self.ready_queue = queue.Queue()
        self.pending_update = None
        dthread = threading.Thread(target=self.display_thread)
        dthread.start()
        self.ready_queue.get()

    def display_thread(self):
        proca, procb = self.run_less()
        self.less_proc = procb
        self.ready_queue.put(0)
        while True:
            ret = procb.wait()
            proca.wait()
            self.less_proc = None
            if ret != 0:
                # fix the terminal
                os.system("tput reset")
            if ret != 0 and self.pending_update is not None:
                # killed by program with the intent to refresh
                msg, error = self.pending_update
                self.pending_update = None
                if not error:
                    self.mydump = msg
                    self.emsg = None
                else:
                    self.emsg = msg
                proca, procb = self.run_less()
                self.less_proc = procb
                self.ready_queue.put(0)
            else:
                # terminated by user, or killed
                self.watch_queue.put(None)
                self.ready_queue.put(0)
                break

    def progress(self, msg):
        # Write message to top-left corner
        sys.stdout.write("\x1b7\x1b[1;1f{}\x1b8".format(msg + " "))
        sys.stdout.flush()

    def update(self, text, error):
        if not error and not self.emsg and text == self.mydump:
            self.progress("Unchanged. ")
            return
        self.pending_update = (text, error)
        if not self.less_proc:
            return
        self.less_proc.kill()
        self.ready_queue.get()

    def terminate(self):
        if not self.less_proc:
            return
        self.less_proc.kill()
        self.ready_queue.get()


def main():
    if args.diff_elf_symbol:
        make_target, basecmd, mycmd = dump_elf()
    elif args.diff_obj:
        make_target, basecmd, mycmd = dump_objfile()
    else:
        make_target, basecmd, mycmd = dump_binary()

    if args.write_asm is not None:
        mydump = run_objdump(mycmd)
        with open(args.write_asm, "w") as f:
            f.write(mydump)
        print(f"Wrote assembly to {args.write_asm}.")
        sys.exit(0)

    if args.base_asm is not None:
        with open(args.base_asm) as f:
            basedump = f.read()
    else:
        basedump = run_objdump(basecmd)

    mydump = run_objdump(mycmd)

    display = Display(basedump, mydump)

    if not args.watch:
        display.run_sync()
    else:
        if not args.make:
            yn = input(
                "Warning: watch-mode (-w) enabled without auto-make (-m). You will have to run make manually. Ok? (Y/n) "
            )
            if yn.lower() == "n":
                return
        if args.make:
            watch_sources = None
            if hasattr(diff_settings, "watch_sources_for_target"):
                watch_sources = diff_settings.watch_sources_for_target(make_target)
            watch_sources = watch_sources or source_directories
            if not watch_sources:
                fail("Missing source_directories config, don't know what to watch.")
        else:
            watch_sources = [make_target]
        q = queue.Queue()
        debounced_fs_watch(watch_sources, q, DEBOUNCE_DELAY)
        display.run_async(q)
        last_build = 0
        try:
            while True:
                t = q.get()
                if t is None:
                    break
                if t < last_build:
                    continue
                last_build = time.time()
                if args.make:
                    display.progress("Building...")
                    ret = run_make(make_target, capture_output=True)
                    if ret.returncode != 0:
                        display.update(
                            ret.stderr.decode("utf-8-sig", "replace")
                            or ret.stdout.decode("utf-8-sig", "replace"),
                            error=True,
                        )
                        continue
                mydump = run_objdump(mycmd)
                display.update(mydump, error=False)
        except KeyboardInterrupt:
            display.terminate()


main()
