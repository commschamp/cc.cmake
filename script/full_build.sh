#!/bin/bash

if [ -z "${CC}" -o -z "${CXX}" ]; then
    echo "ERROR: Compilers are not provided"
    exit 1
fi

if [ -z "${BUILD_TYPE}" ]; then
    echo "ERROR: Build type not provided"
    exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )

if [ -z "${BUILD_DIR}" ]; then
    export BUILD_DIR="${ROOT_DIR}/build.full.${CC}.${BUILD_TYPE}"
fi

if [ -z "${INSTALL_DIR}" ]; then
    export INSTALL_DIR=${BUILD_DIR}/install
fi

if [ -z "${USE_CCACHE}" ]; then
    export USE_CCACHE=ON
fi

if [ -z "${DEFAULT_SANITIZERS}" ]; then
    export DEFAULT_SANITIZERS=ON
fi

if [ -z "${QT_VER}" ]; then
    export QT_VER=5
fi

if [ -z "${PROJ_INCLUDE}" ]; then
    export PROJ_INCLUDE="config/All.cmake"
fi

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}
cmake .. \
    -DCMAKE_PROJECT_INCLUDE=${PROJ_INCLUDE} \
    -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DOPT_USE_CCACHE=${USE_CCACHE} \
    -DOPT_WITH_DEFAULT_SANITIZERS=${DEFAULT_SANITIZERS} -DOPT_QT_MAJOR_VERSION=${QT_VER} "$@"

procs=$(nproc)
if [ -n "${procs}" ]; then
    procs_param="--parallel ${procs}"
fi

cmake --build ${BUILD_DIR} --config ${BUILD_TYPE} ${procs_param}
