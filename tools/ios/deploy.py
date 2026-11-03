#!/usr/bin/env python3
"""
Dev-machine helper to sync this repo's src/ios tree (and Makefile.ios) to the
jailbroken iOS device over SFTP, then drive the on-device build via SSH.

Usage (from repo root, on the Windows dev machine):
    python tools/ios/deploy.py sync          # push changed files only
    python tools/ios/deploy.py build         # sync + make app
    python tools/ios/deploy.py install       # sync + make install
    python tools/ios/deploy.py run <cmd...>  # run an arbitrary remote command
    python tools/ios/deploy.py shell "cmd"   # run one remote shell command

Auth: uses the dedicated key at ~/.ssh/sm64ios_ed25519 (installed to the
device's /var/root/.ssh/authorized_keys during initial device setup).
Device sshd only speaks legacy ssh-rsa/ssh-dss host keys and old KEX/ciphers
(iOS 6 era), which is why this uses paramiko directly instead of the system
OpenSSH client.
"""
import argparse
import os
import posixpath
import sys
import warnings

import paramiko

warnings.filterwarnings("ignore", category=UserWarning)

HOST = os.environ.get("SM64IOS_HOST", "192.168.229.192")
USER = os.environ.get("SM64IOS_USER", "root")
KEY_PATH = os.environ.get(
    "SM64IOS_KEY", os.path.expanduser("~/.ssh/sm64ios_ed25519")
)
REMOTE_DIR = os.environ.get("SM64IOS_REMOTE_DIR", "/var/root/sm64ios_build")

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
# Full game sync: game sources + headers + actor/level data sources +
# generated data (build/us_pc, dev-machine side). Compiled objects, raw
# assets (png/aiff, already converted to .inc.c/.aifc on the dev machine)
# and assembler inputs are skipped.
SYNC_DIRS = ["src", "include", "actors", "levels", "bin", "data", "sound",
             "lib", "build/us_pc"]
SKIP_EXT = {".o", ".d", ".exe", ".map", ".bin", ".aifc", ".table", ".m64",
            ".png", ".aiff", ".s"}
SKIP_DIRS = {"sound/samples", "sound/sequences"}
# .png is skipped as generated game art, except under these trees, where it is
# checked-in app content (the bundle icon set in src/ios/app/icons).
KEEP_EXT_DIRS = ("src/ios",)


def connect():
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    key = paramiko.Ed25519Key.from_private_key_file(KEY_PATH)
    client.connect(HOST, username=USER, pkey=key, timeout=15,
                    allow_agent=False, look_for_keys=False)
    return client


def remote_mkdirs(sftp, remote_path):
    parts = remote_path.split("/")
    cur = ""
    for p in parts:
        if not p:
            continue
        cur += "/" + p
        try:
            sftp.stat(cur)
        except IOError:
            sftp.mkdir(cur)


def sync(client):
    sftp = client.open_sftp()
    synced = 0
    skipped = 0
    for sync_dir in SYNC_DIRS:
        for local_root, _dirs, files in os.walk(os.path.join(REPO_ROOT, sync_dir)):
            rel = os.path.relpath(local_root, REPO_ROOT).replace("\\", "/")
            if rel in SKIP_DIRS or rel.startswith(tuple(d + "/" for d in SKIP_DIRS)):
                continue
            remote_root = posixpath.join(REMOTE_DIR, rel)
            remote_mkdirs(sftp, remote_root)
            for fname in files:
                if (os.path.splitext(fname)[1].lower() in SKIP_EXT
                        and not rel.startswith(KEEP_EXT_DIRS)):
                    skipped += 1
                    continue
                local_file = os.path.join(local_root, fname)
                remote_file = posixpath.join(remote_root, fname)
                st = os.stat(local_file)
                try:
                    rst = sftp.stat(remote_file)
                    if int(rst.st_size) == st.st_size and abs(int(rst.st_mtime) - int(st.st_mtime)) <= 2:
                        skipped += 1
                        continue
                except IOError:
                    pass
                sftp.put(local_file, remote_file)
                try:
                    sftp.utime(remote_file, (st.st_atime, st.st_mtime))
                except IOError:
                    pass
                synced += 1
    sftp.close()
    print("Synced %d files (%d up to date) to %s:%s" % (synced, skipped, HOST, REMOTE_DIR))


def run_remote(client, cmd, timeout=1500):
    full_cmd = "cd %s/src/ios && %s" % (REMOTE_DIR, cmd)
    stdin, stdout, stderr = client.exec_command(full_cmd, timeout=timeout)
    out = stdout.read().decode(errors="replace")
    err = stderr.read().decode(errors="replace")
    code = stdout.channel.recv_exit_status()
    if out:
        print(out)
    if err:
        print(err, file=sys.stderr)
    return code


def install(client):
    cmd = (
        "rm -rf /Applications/%s.app && "
        "cp -R build/%s.app /Applications/%s.app && "
        "su mobile -c uicache"
    ) % ("SM64", "SM64", "SM64")
    return run_remote(client, cmd)


def launch(client, bundle_id):
    # iOS 6 uiopen opens URLs, not bundle IDs: launch via our URL scheme.
    # Custom scheme per bundle id: com.sm64decomp.ios -> sm64ios://launch
    # NOTE: single quotes for su -c; double quotes get eaten by the SSH layers.
    scheme = bundle_id.split(".")[-1] if "." in bundle_id else bundle_id
    return run_remote(client, "su mobile -c 'uiopen %s://launch'" % scheme)


def pushrom(client, local_rom):
    # Push a validated ROM to the shared Documents folder (same place
    # iTunes File Sharing drops files), so the on-device ROMValidator
    # finds it. Test-only path until File Sharing is used for real.
    import hashlib
    data = open(local_rom, "rb").read()
    print("local sha1: %s (%d bytes)" % (hashlib.sha1(data).hexdigest(), len(data)))
    sftp = client.open_sftp()
    remote = "/var/mobile/Documents/" + local_rom.replace("\\", "/").split("/")[-1]
    sftp.put(local_rom, remote)
    sftp.close()
    print("pushed to %s:%s" % (HOST, remote))
    return run_remote(client, "ls -la /var/mobile/Documents/")


def synctimes(client):
    # One-time repair: set remote mtimes to local mtimes (same-size files)
    # so incremental sync + make stop seeing every source as changed.
    sftp = client.open_sftp()
    fixed = 0
    for sync_dir in SYNC_DIRS:
        for local_root, _dirs, files in os.walk(os.path.join(REPO_ROOT, sync_dir)):
            rel = os.path.relpath(local_root, REPO_ROOT).replace("\\", "/")
            if rel in SKIP_DIRS or rel.startswith(tuple(d + "/" for d in SKIP_DIRS)):
                continue
            remote_root = posixpath.join(REMOTE_DIR, rel)
            for fname in files:
                if (os.path.splitext(fname)[1].lower() in SKIP_EXT
                        and not rel.startswith(KEEP_EXT_DIRS)):
                    continue
                local_file = os.path.join(local_root, fname)
                remote_file = posixpath.join(remote_root, fname)
                try:
                    st = os.stat(local_file)
                    rst = sftp.stat(remote_file)
                    if int(rst.st_size) == st.st_size and int(rst.st_mtime) != int(st.st_mtime):
                        sftp.utime(remote_file, (st.st_atime, st.st_mtime))
                        fixed += 1
                except IOError:
                    pass
    sftp.close()
    print("Fixed mtimes on %d files" % fixed)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("action", choices=["sync", "build", "install", "launch", "shell", "test", "pushrom", "synctimes"])
    parser.add_argument("rest", nargs=argparse.REMAINDER)
    args = parser.parse_args()

    client = connect()
    try:
        if args.action == "sync":
            sync(client)
        elif args.action == "build":
            sync(client)
            code = run_remote(client, "make -f Makefile.ios game GAME_OPT=-O0")
            sys.exit(code)
        elif args.action == "install":
            sync(client)
            code = run_remote(client, "make -f Makefile.ios game GAME_OPT=-O0")
            if code != 0:
                sys.exit(code)
            code = install(client)
            sys.exit(code)
        elif args.action == "launch":
            bundle_id = args.rest[0] if args.rest else "com.sm64decomp.ios"
            code = launch(client, bundle_id)
            sys.exit(code)
        elif args.action == "shell":
            cmd = " ".join(args.rest)
            code = run_remote(client, cmd)
            sys.exit(code)
        elif args.action == "test":
            # Compile check: sync + build all game objects (default:
            # game_objs). Usage: deploy.py test [make-target]
            target = args.rest[0] if args.rest else "game_objs"
            sync(client)
            code = run_remote(client, "make -f Makefile.ios %s" % target)
            sys.exit(code)
        elif args.action == "pushrom":
            # Usage: deploy.py pushrom <local-rom-path>
            if not args.rest:
                print("usage: deploy.py pushrom <local-rom-path>", file=sys.stderr)
                sys.exit(2)
            code = pushrom(client, args.rest[0])
            sys.exit(code)
        elif args.action == "synctimes":
            synctimes(client)
    finally:
        client.close()


if __name__ == "__main__":
    main()
