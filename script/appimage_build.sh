#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )

if [ -z "${PROJ_INCLUDE}" ]; then
    export PROJ_INCLUDE="config/AllDocker.cmake"
fi

if [ -z "${CC}" ]; then
    export CC=gcc
fi

if [ -z "${CXX}" ]; then
    export CXX=g++
fi

if [ -z "${BUILD_TYPE}" ]; then
    export BUILD_TYPE="Release"    
fi

if [ -z "${BUILD_DIR}" ]; then
    export BUILD_DIR="${ROOT_DIR}/build.appimage.${CC}.${BUILD_TYPE}"    
fi

export DEFAULT_SANITIZERS=OFF

set -e
${SCRIPT_DIR}/full_build.sh "$@"

pushd ${BUILD_DIR}
${SCRIPT_DIR}/appimage_create.sh ./install
popd