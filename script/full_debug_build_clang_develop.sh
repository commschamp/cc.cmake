#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PROJ_INCLUDE="config/AllDevelop.cmake"
exec ${SCRIPT_DIR}/full_debug_build_clang.sh "$@"

