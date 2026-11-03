#!/usr/bin/env python3
"""Write a binary file as the body of a C array: a comma-separated list of hex
byte values.

This is what the build used to do with
    hexdump -v -e '1/1 "0x%X,"' <input> > <output>
but hexdump is not available on every dev machine (notably Git Bash on
Windows), while Python is already required for the asset pipeline.

Usage: bin2c.py <input> <output>
"""
import sys


def main():
    if len(sys.argv) != 3:
        print("Usage: " + sys.argv[0] + " <input> <output>")
        sys.exit(1)

    with open(sys.argv[1], "rb") as f:
        data = f.read()

    with open(sys.argv[2], "w") as f:
        f.write("".join("0x%X," % byte for byte in data))
        f.write("\n")


main()
