#!/usr/bin/env python3
"""One-shot crash symbolizer: maps sm64ios crash-log offsets to symbols.

Uses the on-device nm/dyldinfo to resolve the frame offsets from the
latest sm64ios crash plist (EXC_BAD_ACCESS).

Usage: python tools/ios/symbolize.py
"""
import re
import sys

import paramiko

HOST = "192.168.229.192"
USER = "root"
KEY = r"C:\Users\MW\.ssh\sm64ios_ed25519"
BIN = "/Applications/SM64.app/sm64ios"

# (name, offset_from_image_base) as reported in the crash log text
FRAMES = [
    (0, 891322), (1, 891766), (2, 893278), (3, 893804), (4, 893588),
    (5, 873052), (6, 873282), (7, 371396), (8, 1101422),
    (9, 31588), (10, 31190), (11, 30896), (16, 32864),
]


def read_text_vmaddr(sftp_client):
    with sftp_client.open(BIN, "rb") as f:
        hdr = f.read(4096)
    magic = hdr[:4]
    if magic not in (b"\xce\xfa\xed\xfe", b"\xcf\xfa\xed\xfe"):
        raise RuntimeError("not a little-endian Mach-O: %s" % magic.hex())
    import struct
    ncmds = struct.unpack_from("<I", hdr, 16)[0]
    off = 28
    for _ in range(ncmds):
        cmd, cmdsize = struct.unpack_from("<II", hdr, off)
        if cmd == 1:  # LC_SEGMENT
            segname = hdr[off + 8:off + 24].rstrip(b"\x00").decode()
            vmaddr = struct.unpack_from("<I", hdr, off + 24)[0]
            if segname == "__TEXT":
                return vmaddr
        if cmdsize < 8:
            break
        off += cmdsize
    raise RuntimeError("no __TEXT segment found")


def main():
    c = paramiko.SSHClient()
    c.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    c.connect(HOST, username=USER,
              pkey=paramiko.Ed25519Key.from_private_key_file(KEY),
              timeout=15, allow_agent=False, look_for_keys=False)

    def run(cmd):
        _in, out, err = c.exec_command(cmd, timeout=120)
        return out.read().decode(errors="replace"), err.read().decode(errors="replace"), out.channel.recv_exit_status()

    sftp = c.open_sftp()
    text_vmaddr = read_text_vmaddr(sftp)
    sftp.close()
    print("__TEXT vmaddr = 0x%x" % text_vmaddr)

    nm_out, nm_err, rc = run("nm -n %s" % BIN)
    if rc != 0 or not nm_out.strip():
        print(nm_out)
        print(nm_err, file=sys.stderr)
        sys.exit(1)

    syms = []
    for line in nm_out.splitlines():
        parts = line.split()
        if len(parts) >= 3 and re.fullmatch(r"[0-9a-fA-F]+", parts[0]):
            syms.append((int(parts[0], 16), parts[1], parts[2]))
    syms.sort()
    print("nm symbols: %d" % len(syms))

    def lookup(addr):
        lo, hi = 0, len(syms) - 1
        best = None
        while lo <= hi:
            mid = (lo + hi) // 2
            if syms[mid][0] <= addr:
                best = syms[mid]
                lo = mid + 1
            else:
                hi = mid - 1
        return best

    # crash log image base (absolute runtime address of __TEXT)
    IMAGE_BASE = 0xDA000
    slide = IMAGE_BASE - text_vmaddr
    print("slide = 0x%x" % slide)
    print()
    for idx, off in FRAMES:
        static_addr = text_vmaddr + off
        sym = lookup(static_addr)
        delta = static_addr - sym[0] if sym else 0
        if sym:
            print("frame %2d  off=0x%06x  static=0x%07x  %s +0x%x (%s)"
                  % (idx, off, static_addr, sym[2], delta, sym[1]))
        else:
            print("frame %2d  off=0x%06x  static=0x%07x  <no symbol>" % (idx, off, static_addr))

    c.close()


if __name__ == "__main__":
    main()
