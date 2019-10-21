#!/usr/bin/env bash

LANG=us

POSITIONAL=()
while [[ $# -gt 0 ]]; do
case "$1" in
    -j)
        LANG=jp
        shift
        ;;
    -u)
        LANG=us
        shift
        ;;
    -e)
        LANG=eu
        shift
        ;;
    *)
        POSITIONAL+=("$1")
        shift
        ;;
esac
done
set -- "${POSITIONAL[@]}"

BASEROM=baserom.$LANG
MAPFILE="build/$LANG/sm64.$LANG.map"
MYDUMP=sm64.$LANG.dump
MYIMG=build/$LANG/sm64.$LANG.z64
BASEDUMP=$BASEROM.dump
BASEIMG=$BASEROM.z64
MAKEFLAGS="-j VERSION=$LANG"
