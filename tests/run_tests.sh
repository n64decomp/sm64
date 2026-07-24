#!/bin/bash
set -e
gcc -Wall -Wextra -O2 -Iinclude -Isrc -Isrc/engine -D_LANGUAGE_C -DNON_MATCHING=1 -DAVOID_UB=1 tests/test_math_util.c -o tests/test_math_util -lm
./tests/test_math_util
