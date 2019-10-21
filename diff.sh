#!/usr/bin/env bash

set -e

# ==== CONFIG ====

DIFF_OBJ=0
MAKE=0
BASE_SHIFT=0
DIFF_ARGS="-l"

POSITIONAL=()
while [[ $# -gt 0 ]]; do
case "$1" in
    -o)
        # Diff .o files rather than a whole binary. This makes it possible to
        # see relocations, which is helpful for navigating in the diff.
        DIFF_OBJ=1
        shift
        ;;
    -m)
        # Run "make" on the .o file or binary before diffing.
        MAKE=1
        shift
        ;;
    -s)
        # Stop disassembling at the first "jr ra".
        DIFF_ARGS+=" --stop-jr-ra"
        shift
        ;;
    -i)
        # Treat all large immediates the same for diffing purposes.
        DIFF_ARGS+=" --ignore-large-imms"
        shift
        ;;
    -S)
        # Diff position X in our ROM against position X + shift in the base ROM.
        # Arithmetic is allowed, so e.g. |-S "0x1234 - 0x4321"| is a reasonable
        # flag to pass if it is known that position 0x1234 in the base ROM syncs
        # up with position 0x4321 in our.
        # Not supported together with -o.
        shift
        BASE_SHIFT="$1"
        shift
        ;;
    *)
        POSITIONAL+=("$1")
        shift
        ;;
esac
done
set -- "${POSITIONAL[@]}"

# Set $BASEIMG, $BASEDUMP, $MYIMG, $MYDUMP, $MAPFILE, $MAKEFLAGS in a project-specific manner.
. diff-settings.sh

# ==== LOGIC ====

if [[ $# -lt 1 ]]; then
    echo "Usage: ./diff.sh [flags] (function|rom addr) [end rom addr]" >&2
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d'.' -f2)
if [[ $PYTHON_VERSION -lt 6 ]]; then
    echo "$0 requires at least Python 3.6" >&2
    exit 1
fi

START="$1"
BASE=0

if [ $DIFF_OBJ != 1 ] && [ $MAKE = 1 ]; then
    make $MAKEFLAGS "$MYIMG"
fi

set +e

if [ -n "$MAPFILE" ] && [ "${START:0:2}" != "0x" ]; then
    LINE=$(grep "$1$" $MAPFILE)
    if [ -n "$LINE" ]; then
        START=$(echo $LINE | cut -d' ' -f1)
        if [[ $DIFF_OBJ = 1 ]]; then
            LINE2=$(grep "$1$\|^ .text" $MAPFILE | grep "$1$" -B1 | head -n1)
            OBJFILE=$(echo $LINE2 | cut -d' ' -f4)
        else
            LINE2=$(grep "$1$\|load address" $MAPFILE | grep "$1$" -B1 | head -n1)
            RAM=$(echo $LINE2 | cut -d' ' -f2)
            ROM=$(echo $LINE2 | cut -d' ' -f6)
            BASE="$RAM - $ROM"
        fi
    fi
fi

if ! [[ "$START" =~ ^[0-9] ]]; then
    echo "Function $1 not found in map file." >&2
    exit 1
fi

set -e

if [[ $DIFF_OBJ = 1 ]]; then
    if [[ $MAKE = 1 ]]; then
        make $MAKEFLAGS "$OBJFILE"
    fi
    if [[ ! -f "$OBJFILE" ]]; then
        echo Not able to find .o file for function.
        exit 1
    fi
    REFOBJFILE="expected/$OBJFILE"
    if [[ ! -f "$REFOBJFILE" ]]; then
        echo Please ensure an OK .o file exists at "$REFOBJFILE".
        exit 1
    fi

    OBJDUMP="mips-linux-gnu-objdump -drz"
    $OBJDUMP $REFOBJFILE | grep "<$1>:" -A1000 > $BASEDUMP
    $OBJDUMP $OBJFILE | grep "<$1>:" -A1000 > $MYDUMP
    DIFF_ARGS+=" -o"
else
    END="$START + 0x1000"
    if [[ $# -ge 2 ]]; then
        END="$2"
    fi

    OBJDUMP="mips-linux-gnu-objdump -D -z -bbinary -mmips -EB"
    OPTIONS1="--start-address=$(($START - ($BASE) + ($BASE_SHIFT))) --stop-address=$(($END - ($BASE) + ($BASE_SHIFT)))"
    OPTIONS2="--start-address=$(($START - ($BASE))) --stop-address=$(($END - ($BASE)))"
    $OBJDUMP $OPTIONS1 $BASEIMG > $BASEDUMP
    $OBJDUMP $OPTIONS2 $MYIMG > $MYDUMP
fi

set +e

# sed -i "1s;^;$(sha1sum $MYDUMP)\n;" $MYDUMP

read -r -d '' DIFF_SCRIPT << EOM
try:
    import argparse
    import attr
    from difflib import SequenceMatcher
    from pathlib import Path
    import itertools
    from colorama import Fore, Style, Back
    import ansiwrap
    import re
    import string
    from signal import signal, SIGPIPE, SIG_DFL
except ModuleNotFoundError as e:
    # Exit nicely and print to stdout, because less will be sad otherwise.
    print("Missing prerequisite python module " + e.name +
        ". Run \`python3 -m pip install --user colorama ansiwrap attrs\` to install prerequisites.")
    exit(0)

# Fixes pipe error
signal(SIGPIPE,SIG_DFL)

# Alignment with ANSI colors is just broken, let's fix it.
def ansi_ljust(s, width):
    needed = width - ansiwrap.ansilen(s)
    if needed > 0:
        return s + ' ' * needed
    else:
        return s

@attr.s
class Options:
    file1: str = attr.ib()
    file2: str = attr.ib()
    diff_obj: bool = attr.ib()
    line_nums: bool = attr.ib()
    reg_diff: bool = attr.ib()
    column_width: int = attr.ib()
    stop_jrra: bool = attr.ib()
    ignore_large_imms: bool = attr.ib()
    skip_bl_delay: bool = attr.ib()

r = re.compile(r'[0-9]+')
comments = re.compile(r'<.*?>')
regs = re.compile(r'\b(a[0-3]|t[0-9]|s[0-7]|at|v[01]|f[12]?[0-9]|f3[01]|fp)\b')
sprel = re.compile(r',([1-9][0-9]*|0x[1-9a-f][0-9a-f]*)\(sp\)')
large_imm = re.compile(r'-?[1-9][0-9]{2,}|-?0x[0-9a-f]{3,}')
forbidden = set(string.ascii_letters + '_')
branch_likely_instructions = [
    'beql', 'bnel', 'beqzl', 'bnezl', 'bgezl', 'bgtzl', 'blezl', 'bltzl',
    'bc1tl', 'bc1fl'
]
branch_instructions = [
    'b', 'beq', 'bne', 'beqz', 'bnez', 'bgez', 'bgtz', 'blez', 'bltz',
    'bc1t', 'bc1f'
] + branch_likely_instructions

def fn(row, pat):
    full = pat.group(0)
    if len(full) <= 1:
        return full
    start, end = pat.span()
    if start and row[start - 1] in forbidden:
        return full
    if end < len(row) and row[end] in forbidden:
        return full
    return hex(int(full))

def parse_relocated_line(line):
    try:
        ind2 = line.rindex(',')
    except ValueError:
        ind2 = line.rindex('\t')
    before = line[:ind2+1]
    after = line[ind2+1:]
    ind2 = after.find('(')
    if ind2 == -1:
        imm, after = after, ''
    else:
        imm, after = after[:ind2], after[ind2:]
    if imm == '0x0':
        imm = '0'
    return before, imm, after

def process_reloc(row, prev):
    before, imm, after = parse_relocated_line(prev)
    repl = row.split()[-1]
    if imm != '0':
        if before.strip() == 'jal' and not imm.startswith('0x'):
            imm = '0x' + imm
        repl += '+' + imm if int(imm,0) > 0 else imm
    if 'R_MIPS_LO16' in row:
        repl = f'%lo({repl})'
    elif 'R_MIPS_HI16' in row:
        # Ideally we'd pair up R_MIPS_LO16 and R_MIPS_HI16 to generate a
        # correct addend for each, but objdump doesn't give us the order of
        # the relocations, so we can't find the right LO16. :(
        repl = f'%hi({repl})'
    else:
        assert 'R_MIPS_26' in row, f"unknown relocation type '{row}'"
    return before + repl + after

def process(lines, options):
    diff_rows = []
    skip_next = False
    originals = []
    line_nums = []
    skip_lines = 1 if options.diff_obj else 7

    for index, row in enumerate(lines):
        if index < skip_lines:
            continue

        if options.diff_obj and ('>:' in row or not row):
            continue

        if 'R_MIPS_' in row:
            if diff_rows[-1] == '<skipped>':
                continue

            diff_rows[-1] = process_reloc(row, diff_rows[-1])
            originals[-1] = process_reloc(row, originals[-1])
            continue

        row = re.sub(comments, '', row)
        row = row.rstrip()
        tabs = row.split('\t')
        row = '\t'.join(tabs[2:]) # [20:]
        line_num = tabs[0].strip()
        original = row
        mnemonic = row.split('\t')[0].strip()
        if mnemonic not in branch_instructions:
            row = re.sub(r, lambda s: fn(row, s), row)
        if skip_next:
            skip_next = False
            row = '<skipped>'
        if mnemonic in branch_likely_instructions and options.skip_bl_delay:
            skip_next = True
        if options.reg_diff:
            row = re.sub(regs, '<reg>', row)
            row = re.sub(sprel, ',addr(sp)', row)
        if options.ignore_large_imms:
            row = re.sub(large_imm, '<imm>', row)

        # Replace tabs with spaces
        diff_rows.append(row)
        originals.append(original)
        line_nums.append(line_num)
        if options.stop_jrra and mnemonic == 'jr' and row.split('\t')[1].strip() == 'ra':
            break

    # Cleanup whitespace
    originals = [original.strip() for original in originals]
    originals = [''.join(f'{o:<8s}' for o in original.split('\t')) for original in originals]
    # return diff_rows, diff_rows, line_nums
    return diff_rows, originals, line_nums

regs_after = re.compile(r'<reg>')
def print_single_line_diff(line1, line2, column_width):
    print(f"{ansi_ljust(line1,column_width)}{ansi_ljust(line2,column_width)}")

color_rotation = [
    Fore.MAGENTA,
    Fore.CYAN,
    Fore.GREEN,
    Fore.RED,
    Fore.LIGHTYELLOW_EX,
    Fore.LIGHTMAGENTA_EX,
    Fore.LIGHTCYAN_EX,
    Fore.LIGHTGREEN_EX,
    #Fore.LIGHTRED_EX, (This is hard to distinguish (I'm not even colorblind))
    Fore.LIGHTBLACK_EX,
]
color_index = [0, 0]
symbol_colors = [{}, {}]

def color_symbol(s, i):
    global color_rotation
    global color_index
    global symbol_colors
    s = s.group()
    try:
        color = symbol_colors[i][s]
    except:
        color = color_rotation[color_index[i]]
        color_index[i] = (color_index[i] + 1) % len(color_rotation)
        symbol_colors[i][s] = color

    return f'{color}{s}{Fore.RESET}'

def norm(row):
    if options.ignore_large_imms:
        row = re.sub(large_imm, '<imm>', row)
    return row

def main(options):
    asm1: str = Path(options.file1).read_text()
    asm2: str = Path(options.file2).read_text()
    asm1_lines = asm1.split('\n')
    asm2_lines = asm2.split('\n')

    asm1_lines, originals1, line_nums1 = process(asm1_lines, options)
    asm2_lines, originals2, line_nums2 = process(asm2_lines, options)

    differ: SequenceMatcher = SequenceMatcher(a=asm1_lines, b=asm2_lines, autojunk=True)
    for (tag, i1, i2, j1, j2) in differ.get_opcodes():
        lines1 = asm1_lines[i1:i2]
        lines2 = asm2_lines[j1:j2]

        for k, (line1, line2) in enumerate(itertools.zip_longest(lines1, lines2)):
            if tag == 'replace':
                if line1 == None:
                    tag = 'insert'
                elif line2 == None:
                    tag = 'delete'

            try:
                original1 = originals1[i1+k]
                line_num1 = line_nums1[i1+k]
            except:
                original1 = ''
                line_num1 = ''
            try:
                original2 = originals2[j1+k]
                line_num2 = line_nums2[j1+k]
            except:
                original2 = ''
                line_num2 = ''

            line_color = Fore.RESET
            line_prefix = ' '
            if tag == 'equal' or line1 == line2:
                if (line1 == '<skipped>'):
                    pass
                elif norm(original1) != norm(original2) and options.reg_diff:
                    line_color = Fore.YELLOW
                    line_prefix = 'r'
                    line1 = f'{Fore.YELLOW}{original1}{Style.RESET_ALL}'
                    line2 = f'{Fore.YELLOW}{original2}{Style.RESET_ALL}'
                    line1 = re.sub(regs, lambda s: color_symbol(s, 0), line1)
                    line2 = re.sub(regs, lambda s: color_symbol(s, 1), line2)
                    line1 = re.sub(sprel, lambda s: color_symbol(s, 0), line1)
                    line2 = re.sub(sprel, lambda s: color_symbol(s, 1), line2)
                else:
                    line1 = f'{original1}'
                    line2 = f'{original2}'
            elif tag == 'replace':
                line_prefix = '|'
                line_color = Fore.BLUE
                line1 = f"{Fore.BLUE}{original1}{Style.RESET_ALL}"
                line2 = f"{Fore.BLUE}{original2}{Style.RESET_ALL}"
            elif tag == 'delete':
                line_prefix = '<'
                line_color = Fore.RED
                line1 = f"{Fore.RED}{original1}{Style.RESET_ALL}"
            elif tag == 'insert':
                line_prefix = '>'
                line_color = Fore.GREEN
                line2 = f"{Fore.GREEN}{original2}{Style.RESET_ALL}"

            line1 = line1 or ''
            line2 = line2 or ''

            line_num1 = line_num1 if line1 else ''
            line_num2 = line_num2 if line2 else ''

            if not options.line_nums:
                line_num1 = ''
                line_num2 = ''

            line1 =               f"{line_color}{line_num1}    {line1}{Style.RESET_ALL}"
            line2 = f"{line_color}{line_prefix} {line_num2}    {line2}{Style.RESET_ALL}"
            print_single_line_diff(line1, line2, options.column_width)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
            description="Diff mips data")
    parser.add_argument('file1',
            help="The base file to compare")
    parser.add_argument('file2',
            help="The modified version to compare to")
    parser.add_argument('-o', dest='diff_obj', action='store_true',
            help="Perform an object file diff")
    parser.add_argument('-l', dest='line_nums', action='store_true',
            help="Show line numbers")
    parser.add_argument('--stop-jr-ra', dest='stop_jrra', action='store_true',
            help="Stop at the first 'jr ra'")
    parser.add_argument('--ignore-large-imms', dest='ignore_large_imms', action='store_true',
            help="Pretend all 'large' immediates are the same")
    parser.add_argument('--column', dest='column_width', type=int, default=50,
            help="Sets the width of the left and right view column")
    args = parser.parse_args()

    options = Options(
        file1 = args.file1,
        file2 = args.file2,
        reg_diff = True,
        line_nums = args.line_nums,
        diff_obj = args.diff_obj,
        column_width = args.column_width,
        stop_jrra = args.stop_jrra,
        ignore_large_imms = args.ignore_large_imms,
        skip_bl_delay = True
    )
    main(options)
EOM

set -e

python3 -c "$DIFF_SCRIPT" "$BASEDUMP" "$MYDUMP" $DIFF_ARGS | less -Ric
