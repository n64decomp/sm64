#!/usr/bin/env python3
import sys
from pathlib import Path
import shlex
import subprocess
import tempfile
import uuid
import asm_processor

# Boolean for debugging purposes
# Preprocessed files are temporary, set to True to keep a copy
keep_preprocessed_files = False

dir_path = Path(__file__).resolve().parent
asm_prelude_path = dir_path / "prelude.inc"

all_args = sys.argv[1:]
sep0 = next(index for index, arg in enumerate(all_args) if not arg.startswith("-"))
sep1 = all_args.index("--")
sep2 = all_args.index("--", sep1 + 1)

asmproc_flags = all_args[:sep0]
compiler = all_args[sep0:sep1]

assembler_args = all_args[sep1 + 1 : sep2]
assembler_sh = " ".join(shlex.quote(x) for x in assembler_args)


compile_args = all_args[sep2 + 1 :]

in_file = Path(compile_args[-1])
del compile_args[-1]

out_ind = compile_args.index("-o")
out_file = Path(compile_args[out_ind + 1])
del compile_args[out_ind + 1]
del compile_args[out_ind]


in_dir = in_file.resolve().parent
opt_flags = [
    x for x in compile_args if x in {"-g3", "-g", "-O0", "-O1", "-O2", "-framepointer", "-KPIC"}
]
if "-mips2" not in compile_args:
    opt_flags.append("-mips1")

asmproc_flags += opt_flags + [str(in_file)]

# Drop .mdebug and .gptab sections from resulting binaries. This makes
# resulting .o files much smaller and speeds up builds, but loses line
# number debug data.
# asmproc_flags += ["--drop-mdebug-gptab"]

# Convert encoding before compiling.
# asmproc_flags += ["--input-enc", "utf-8", "--output-enc", "euc-jp"]

with tempfile.TemporaryDirectory(prefix="asm_processor") as tmpdirname:
    tmpdir_path = Path(tmpdirname)
    preprocessed_filename = "preprocessed_" + uuid.uuid4().hex + in_file.suffix
    preprocessed_path = tmpdir_path / preprocessed_filename

    with preprocessed_path.open("wb") as f:
        functions, deps = asm_processor.run(asmproc_flags, outfile=f)

    if keep_preprocessed_files:
        import shutil

        keep_output_dir = Path("./asm_processor_preprocessed")
        keep_output_dir.mkdir(parents=True, exist_ok=True)

        shutil.copy(
            preprocessed_path,
            keep_output_dir / (in_file.stem + "_" + preprocessed_filename),
        )

    compile_cmdline = (
        compiler
        + compile_args
        + ["-I", str(in_dir), "-o", str(out_file), str(preprocessed_path)]
    )

    try:
        subprocess.check_call(compile_cmdline)
    except subprocess.CalledProcessError as e:
        print("Failed to compile file " + str(in_file) + ". Command line:")
        print()
        print(" ".join(shlex.quote(x) for x in compile_cmdline))
        print()
        sys.exit(55)

    asm_processor.run(
        asmproc_flags
        + [
            "--post-process",
            str(out_file),
            "--assembler",
            assembler_sh,
            "--asm-prelude",
            str(asm_prelude_path),
        ],
        functions=functions,
    )

    deps_file = out_file.with_suffix(".asmproc.d")
    if deps:
        with deps_file.open("w") as f:
            f.write(str(out_file) + ": " + " \\\n    ".join(deps) + "\n")
            for dep in deps:
                f.write("\n" + dep + ":\n")
    else:
        try:
            deps_file.unlink()
        except OSError:
            pass
