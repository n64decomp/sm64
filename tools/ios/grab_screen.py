#!/usr/bin/env python3
"""grab_screen.py — fetch a screenshot from the iPad without touching it.

The app (EAGLView.m) dumps the raw framebuffer to Documents/framedump.raw when
Documents/ios_framedump.flag exists. This script drops the flag, waits for the
next dump (signalled via sm64ios-heartbeat.log), pulls the raw image over
SFTP, converts it to PNG and removes the flag again.

Usage:
    python tools/ios/grab_screen.py [output.png]

Dependencies: paramiko (same as deploy.py). PNG conversion uses only stdlib.
"""
import argparse
import re
import struct
import sys
import time
import zlib

import paramiko

HOST = "192.168.229.192"
USER = "root"
KEY = r"C:\Users\MW\.ssh\sm64ios_ed25519"
DOCS = "/var/mobile/Documents"
FLAG = DOCS + "/ios_framedump.flag"
RAW = DOCS + "/framedump.raw"
HEARTBEAT = DOCS + "/sm64ios-heartbeat.log"


def write_png(path, w, h, rgba):
    def chunk(typ, data):
        return (struct.pack(">I", len(data)) + typ + data +
                struct.pack(">I", zlib.crc32(typ + data) & 0xffffffff))
    rows = bytearray()
    stride = w * 4
    for y in range(h):
        rows.append(0)  # filter type None
        rows += rgba[y * stride:(y + 1) * stride]
    png = b"\x89PNG\r\n\x1a\n"
    png += chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
    png += chunk(b"IDAT", zlib.compress(bytes(rows), 6))
    png += chunk(b"IEND", b"")
    with open(path, "wb") as f:
        f.write(png)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("output", nargs="?", default="framedump.png")
    ap.add_argument("--timeout", type=float, default=90.0,
                    help="seconds to wait for a fresh dump (default 90)")
    args = ap.parse_args()

    c = paramiko.SSHClient()
    c.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    c.connect(HOST, username=USER,
              pkey=paramiko.Ed25519Key.from_private_key_file(KEY),
              timeout=15, allow_agent=False, look_for_keys=False)

    def run(cmd):
        _in, out, _err = c.exec_command(cmd, timeout=120)
        return out.read().decode(errors="replace")

    def heartbeat():
        return run("cat %s 2>/dev/null" % HEARTBEAT)

    before = heartbeat()
    m = re.findall(r"framedump (\d+)x(\d+) frame=(\d+)", before)
    last_frame = int(m[-1][2]) if m else -1
    print("app is at game frame %d" % last_frame if last_frame >= 0
          else "app has not dumped a frame yet")

    run("touch %s" % FLAG)
    print("flag dropped, waiting for a fresh frame dump ...")

    dims = None
    deadline = time.time() + args.timeout
    while time.time() < deadline:
        time.sleep(2)
        hb = heartbeat()
        for w, h, fr in re.findall(r"framedump (\d+)x(\d+) frame=(\d+)", hb):
            if int(fr) > last_frame:
                dims = (int(w), int(h))
                print("fresh dump: %dx%d at frame %s" % (int(w), int(h), fr))
                break
        if dims:
            break
    if not dims:
        print("timed out waiting for a new dump", file=sys.stderr)
        run("rm -f %s" % FLAG)
        return 1

    sftp = c.open_sftp()
    sftp.get(RAW, args.output + ".raw")
    sftp.close()
    run("rm -f %s" % FLAG)

    data = open(args.output + ".raw", "rb").read()
    w, h = dims
    if len(data) != w * h * 4:
        print("unexpected raw size: %d bytes (want %d)" % (len(data), w * h * 4),
              file=sys.stderr)
        return 1
    write_png(args.output, w, h, data)
    print("wrote %s (%dx%d)" % (args.output, w, h))
    c.close()
    return 0


if __name__ == "__main__":
    sys.exit(main())
