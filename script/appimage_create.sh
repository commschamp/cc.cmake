#!/bin/bash

INSTALL_DIR="$1"
APPDIR_DIR="$2"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )
APPIMAGE_DIR="${ROOT_DIR}/appimage"

if [ -z "${LINUXDEPLOY}" ]; then
    LINUXDEPLOY="$(realpath ~/bin/linuxdeploy-$(uname -m).AppImage)"
fi

function usage {
    echo "Usage: ${0} <install_dir> [<AppDir>]"
}

if [ -z "${INSTALL_DIR}" ]; then
    echo "ERROR: The binaries install directory is not provided"
    echo
    usage
    exit 1
fi

if [ ! -x "${LINUXDEPLOY}" ]; then
    echo "ERROR: Failed to find \"linuxdeploy\" utility (${LINUXDEPLOY}), use \"LINUXDEPLOY\" environment variable to override default path"
    exit 2
fi

if [ -z "${APPDIR_DIR}" ]; then
    APPDIR_DIR="$(dirname $(realpath ${INSTALL_DIR}))/AppDir"
fi

set -e
CC_DIR="${APPDIR_DIR}/cc"
rm -rf ${APPDIR_DIR}
mkdir -p ${APPDIR_DIR}/usr/lib
rm -rf ${CC_DIR}
cp -r ${INSTALL_DIR} ${CC_DIR}
cp -r ${APPIMAGE_DIR}/AppRun ${APPDIR_DIR}/
cp -r ${APPIMAGE_DIR}/app_icon.png ${APPDIR_DIR}/app_icon.png.png
rm -rf ${CC_DIR}/include ${CC_DIR}/bin/*.sh ${CC_DIR}/share/doc ${CC_DIR}/lib/*.a ${CC_DIR}/lib/*/cmake

PARAMS=""

for b in ${CC_DIR}/bin/*; do
    if [ ! -e ${b} ]; then break; fi
    PARAMS="${PARAMS} -e ${CC_DIR}/bin/$(basename $b)"
done

# Add qt plugin of Qt based apps are present
if [ -e ${CC_DIR}/bin/cc_view ]; then
    PARAMS="${PARAMS} --plugin qt"
fi

set -x
export LD_LIBRARY_PATH=${CC_DIR}/lib:${LD_LIBRARY_PATH}
${LINUXDEPLOY} --appdir ${APPDIR_DIR} ${PARAMS} -d ${APPIMAGE_DIR}/cc.desktop -i ${APPIMAGE_DIR}/app_icon.png --output appimage



