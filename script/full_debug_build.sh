#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BUILD_TYPE=Debug
exec ${SCRIPT_DIR}/full_build.sh "$@"
 
