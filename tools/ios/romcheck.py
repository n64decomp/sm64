#!/usr/bin/env python3
"""Validate (and if necessary byte-swap) a Super Mario 64 ROM dump.

- Accepts .z64 (big-endian), .v64 (byteswapped) and .n64 (little-endian) dumps.
- Writes a native big-endian .z64 copy to baserom.us.z64 (unless the input
  already has that name).
- Prints the SHA-1 and whether the dump is a known, unmodified SM64 version.

Usage:
    python tools/ios/romcheck.py "Super Mario 64 (USA).n64"
"""
import array
import hashlib
import sys

HASHES = {
    "9bef1128717f958171a4afac3ed78ee2bb4e86ce": "US (NTSC-U) - supported by the iOS build",
    "8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51": "JP (NTSC-J) - recognized, not buildable yet",
    "4ac5721683d0e0b6bbb561b58a71740845dceea9": "EU (PAL) - recognized, not buildable yet",
    "3f319ae697533a255a1003d09202379d78d5a2e0": "Shindou - recognized, not buildable yet",
}


def to_z64(data):
    """Normalize a ROM dump to big-endian (.z64) byte order."""
    magic = data[:4]
    if magic == bytes.fromhex("80371240"):  # .z64, already big-endian
        return data, "z64"
    if magic == bytes.fromhex("37804012"):  # .v64, 16-bit byteswapped
        a = array.array("H", data)
        a.byteswap()
        return a.tobytes(), "v64"
    if magic == bytes.fromhex("40123780"):  # .n64, little-endian (32-bit swap)
        a = array.array("I", data)
        a.byteswap()
        return a.tobytes(), "n64"
    return None, "unknown"


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(2)
    src = sys.argv[1]
    data = open(src, "rb").read()
    z, kind = to_z64(data)
    if z is None:
        print("Not a Super Mario 64 ROM (unrecognized byte-order magic).")
        sys.exit(1)
    out = "baserom.us.z64"
    if src != out:
        open(out, "wb").write(z)
        print("Converted %s (%s) -> %s" % (src, kind, out))
    h = hashlib.sha1(z).hexdigest()
    print("sha1  %s" % h)
    name = HASHES.get(h)
    if name:
        print("OK    %s" % name)
    else:
        print("MISMATCH - not a known unmodified Super Mario 64 dump.")
        sys.exit(1)


if __name__ == "__main__":
    main()
