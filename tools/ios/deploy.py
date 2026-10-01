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

HOST = os.environ.get("SM64IOS_HOST", "192.168.2.213")
USER = os.environ.get("SM64IOS_USER", "root")
KEY_PATH = os.environ.get(
    "SM64IOS_KEY", os.path.expanduser("~/.ssh/sm64ios_ed25519")
)
REMOTE_DIR = os.environ.get("SM64IOS_REMOTE_DIR", "/var/root/sm64ios_build")

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SYNC_PATHS = ["src/ios", "src/ios/Makefile.ios"]


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
    file_count = 0
    for local_root, _dirs, files in os.walk(os.path.join(REPO_ROOT, "src", "ios")):
        rel = os.path.relpath(local_root, REPO_ROOT).replace("\\", "/")
        remote_root = posixpath.join(REMOTE_DIR, rel)
        remote_mkdirs(sftp, remote_root)
        for fname in files:
            local_file = os.path.join(local_root, fname)
            remote_file = posixpath.join(remote_root, fname)
            sftp.put(local_file, remote_file)
            file_count += 1
    sftp.close()
    print("Synced %d files to %s:%s" % (file_count, HOST, REMOTE_DIR))


def run_remote(client, cmd):
    full_cmd = "cd %s/src/ios && %s" % (REMOTE_DIR, cmd)
    stdin, stdout, stderr = client.exec_command(full_cmd, timeout=120)
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
    return run_remote(client, 'su mobile -c "uiopen %s"' % bundle_id)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("action", choices=["sync", "build", "install", "launch", "shell"])
    parser.add_argument("rest", nargs=argparse.REMAINDER)
    args = parser.parse_args()

    client = connect()
    try:
        if args.action == "sync":
            sync(client)
        elif args.action == "build":
            sync(client)
            code = run_remote(client, "make -f Makefile.ios app")
            sys.exit(code)
        elif args.action == "install":
            sync(client)
            code = run_remote(client, "make -f Makefile.ios app")
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
    finally:
        client.close()


if __name__ == "__main__":
    main()
