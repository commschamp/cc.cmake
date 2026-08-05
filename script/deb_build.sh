#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )

# Configuration variables
PROJ_INCLUDE_NAME=${PROJ_INCLUDE_NAME:-config/UbuntuPpa.cmake}
# DISTROS - Use colon separation, such as `export DISTROS="noble:resolute`

set -e

BUILD_DIR=${ROOT_DIR}/build.deb
SRC_DIR=${BUILD_DIR}/src
BUILD_DATE=$(date -R)

pushd ${ROOT_DIR}
VERSION=$(git describe --tags --abbrev=0)
popd

rm -rf ${BUILD_DIR}
mkdir -p ${SRC_DIR}
cp -r ${ROOT_DIR}/config ${SRC_DIR}/
cp -r ${ROOT_DIR}/*.txt ${ROOT_DIR}/*.cmake LICENSE ${SRC_DIR}/

cp -r ${ROOT_DIR}/ppa/debian ${SRC_DIR}
sed -i "s|^CONFIG_FILE :=.*|CONFIG_FILE := ${PROJ_INCLUDE_NAME}|" ${SRC_DIR}/debian/rules
sed -i "s|@VERSION@|${VERSION}|" ${SRC_DIR}/debian/changelog
sed -i "s|@DATE@|${BUILD_DATE}|" ${SRC_DIR}/debian/changelog

CHANGElOG_FILE=${SRC_DIR}/debian/changelog
FULL_VERSION=$(dpkg-parsechangelog -l ${CHANGElOG_FILE} -S Version)
SRC_VERSION=$(echo -n ${FULL_VERSION} | sed -E 's/-[0-9]+(~.*)?$//')
SRC_NAME=$(dpkg-parsechangelog -l ${CHANGElOG_FILE} -S Source)
UPSTREAM_ARCHIVE_NAME=${SRC_NAME}_${SRC_VERSION}.orig.tar.gz

pushd ${SRC_DIR}
tar -cvzf ${BUILD_DIR}/${UPSTREAM_ARCHIVE_NAME} ./*
popd

if [ -z "${DISTROS:-}" ]; then
    DISTROS=("noble" "resolute")
else
    IFS=: read -ra DISTROS <<< "${DISTROS}"
fi

for d in ${DISTROS[@]}; do
    echo "INFO: Building debs for $d"
    mkdir -p ${BUILD_DIR}/${d}
    ln -s ${BUILD_DIR}/${UPSTREAM_ARCHIVE_NAME} ${BUILD_DIR}/${d}/${UPSTREAM_ARCHIVE_NAME}
    cp -r ${SRC_DIR} ${BUILD_DIR}/${d}/
    local_src_dir=${BUILD_DIR}/${d}/$(basename ${SRC_DIR})
    pushd ${local_src_dir}
    sed -i "1s/UNRELEASED/${d}/" debian/changelog
    sed -i "1s/\(~ppa[0-9]*\)/\1~${d}/" debian/changelog
    dpkg-buildpackage -S -sa -us -uc
    sbuild -c ${d}-amd64-sbuild -d ${d} ../${SRC_NAME}_${FULL_VERSION}~${d}.dsc
    popd
done